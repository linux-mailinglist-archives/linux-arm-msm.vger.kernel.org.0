Return-Path: <linux-arm-msm+bounces-117513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBvEOq3rTWp9AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:18:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D83722224
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:18:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ldXcBAFc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OgUR90Bu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117513-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117513-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED1AB3034ED7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD33C3781;
	Wed,  8 Jul 2026 06:17:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26E3C342B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491460; cv=none; b=Rlvqz9Cu6mIk6+neqA2lCeYD2jpxmrlsoGC1UiKOfZhCQkIi81EtpsbOLvnyooZrTLicR+ec77j2IAXPvrtaqmXq+Z5AfxPc7F3ReCFV+s1SftSuW7/bP6iGqGvNlTPBSku5qvJEaGCRB6FIrGv1c0Z5MemQtLe2Sh4A1//rnMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491460; c=relaxed/simple;
	bh=kjUp38+rZsebDdPzQoG333l/YriQXg1AGNOnuiL62m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jrt9OK+6q57w3Uv6YbVJ/jNi8WbBBz+lgeSI/ISY7DtfyLzopFl5FhulQXtbe6pl3to2FbAD395fIXnNXc7iLfRQs+0CxF5LYPV83DgFCtuyp4giWwLDcMKWediXUVjrzVDcu2aELydhKYRZt5p0JoPIvT9CG2DqoMFkJrit9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldXcBAFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgUR90Bu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842niP1668617
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InvKQYryfFOrhTSliTwFdO7Bo44w0fLxACXlIQp7TTk=; b=ldXcBAFc1oy7BVaQ
	geQkDdR5GzBJVn3t0Nk41ejVG1bHWSqhuqrAGTkDgHs1qPjRfKyXXqh2qrRVIwvC
	gkQeZs6QFhP9zw/5o2IVLebqtuDF15A+l2zKygmvx0tsWa5czjc9UslGuQKNbkTF
	8meMx8TZekhY8yk0CzZQEF0Fm1Ohh0ixQ0Zwi91UmJSfc89o8Xtup8c9GFENSZNB
	xncFEJVU47zPSpNdvrpVhBwWl9Y2QnSyaWC+6y3lB+VtItvIL+1arBj1bhZIwK7L
	n1igPF5MlyfXkWHS/C1HOK2aCSYnTnfdywIDg729yhmT8HrttxB4HHnBWLRwkN48
	dXvajQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tyry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:17:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso563388a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491457; x=1784096257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InvKQYryfFOrhTSliTwFdO7Bo44w0fLxACXlIQp7TTk=;
        b=OgUR90BuP/t9MltAnt2PQYUg3Cuas4TBmSyTh+X7Wzuv8hyk4X/ezDhN9UB77h77bh
         wiKDtq5U2iTzgPSisW7GC8Mo4DjYP9m+sWVbpXgFJVRUSz7BJFdn585ZssliPu7zovSK
         jpthgJn29lFkQfI/Sp8K176QV9o3QiwQlUcG9xA88+Azt9Q1mWwxPCh8oeNDSoMSDQBZ
         mYiDis5sGEplsxDCdy2JvUq8K3Lhlfkr0aaZ5bVLMoSoAiM6kTxg41Mmfs5d/OqQwQv7
         QXU8QPvSxqAPZwl+yyKdp3EO6vn1TiWOQ6VMsWgA0WtPwPtWpn1vheiSlwnCH1ZYhT8+
         gGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491457; x=1784096257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InvKQYryfFOrhTSliTwFdO7Bo44w0fLxACXlIQp7TTk=;
        b=r0w3pGGhr+vH4JPel0fBDNUJVfZD4mILywdacci6FMsFR1iyxX6QvX3ONtPUjbGxFa
         9yhK0IdQxI//fFGSnD+d3J2icUQcVUbzbuW2Hj3ZqoBLB+lvt93xQSC8/godXl9Zhi32
         UbhLWmDMUzPDCjMTUPSmI874BO45pmc97OU0sx1kJS/PgLa9LLfC/vpb2UruQlBMZY93
         zKM6V8ZyjpvhLMbkvGLU3XszXPI0+OafaZZ06Q4JIvQAWPleTPpM+8PhY4K9xUjUaNOQ
         zBzzcOUIJwVlJGfoBUF1hRqp0m9hCmIH5jg5hZlCcmDBeilXh6lFU4HgzLukFgA6xvbw
         UxLw==
X-Gm-Message-State: AOJu0YyGZQCMJBquJCKgDAL83MXlT9U3h4gpsMaSuoN28NPluwoOVdis
	vhxCz/w99M9lFeuCw18uPWwTjXqJD2x/jYnpkeUmg4zI6GN3XkRFItAKM5o3UEvmYp6l/TaTC+F
	Q6RDoR567GKAAPzE8VmmnwHLRNcp1v4ScVTLrhectsW9AJ6agy0H2B3JUtKJraUCrE7b8
X-Gm-Gg: AfdE7ck+TCcG4hArtne43HHhHysDAwORLf1aocko1tlB6RVZmfUemYTDhTRkt4ZXt69
	46RBgHfbUFLiwulq5Mscty1WrN59kIjtfb9K1oqI2hKPepNh6Tw9Xh4dJJU1Ql+Hd4OqYPiDcB+
	tqPp38UNhlwLUoP+fVhJs/9YccABCSCXrdFfhXyzgrIUfvBOlbxa4sw/fDBAHlxnQHVcmxMdSyA
	rDhYHymvh/qKu2Qn1ctvleEeZYhsHcNNGBR9P4qx91r1IgP2Ar4cFjM8GYdYi0LoL6MPXRSN4S8
	ninEb8qzStjTi4x/CEbW5y5p9qnrHj0OCI39V5808s67HmMqDT4VtlDan9NyHq3C3uWaVgQvE/L
	3ddq7jp2VoVNA2H2FHT316ZBh0khcgCvyu/LxbVBLeHXSHQ==
X-Received: by 2002:a05:6a21:a49:b0:3c0:b3f7:e5eb with SMTP id adf61e73a8af0-3c0bce18b33mr1228421637.9.1783491457265;
        Tue, 07 Jul 2026 23:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:a49:b0:3c0:b3f7:e5eb with SMTP id adf61e73a8af0-3c0bce18b33mr1228375637.9.1783491456796;
        Tue, 07 Jul 2026 23:17:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm17028221eec.7.2026.07.07.23.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:17:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:47:17 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-eliza_evk-v2-2-c599246ceba1@oss.qualcomm.com>
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
In-Reply-To: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783491443; l=4100;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kjUp38+rZsebDdPzQoG333l/YriQXg1AGNOnuiL62m0=;
 b=G61ADCIY1Ze5+lv7CZtLAmL/rg7NSYIdGZe0glTwXeTJ3e1hJuMMhAtvqTpf1CVKN0Eo1m6OV
 ehcDpjAkQ/4DMDFp8tUeYKQWQLvlYdg6gZ+9qkcyv/n9QcDtEUPI085
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZIHvXXr7yOmuaA_XIArhtcuC9d_8m3WJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfXyKM8eOBAcjxZ
 DsOgnQppH1Zfzzi7TeokYvJuXPzDTsNo9TKdoUGzMI0VLGI+0GsCPB/3ohBD2UVCZjTy7/3+LIM
 XBSRK37FLKTg/p3e1XKp0Visv0pbx+M=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4deb82 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ZIHvXXr7yOmuaA_XIArhtcuC9d_8m3WJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX5KGrtckisBFs
 HZrdAoQIO/SFFDh+TDWzb3PLPY465VMboB0XY+C4HK7AKy9/J/WRx++vmEEkwv6riumBdvAEYUo
 rI1pa0v7gEtvbjurDvUZpeoSKq/Bz0Wx9YUbregYrhmP0SrptnZD1ueAfUabJsdLM0wToCpNM2D
 iHa4Wa2ie/Rbue7j8gLGzeCqXS1twDAsOy+n3h4kMmoloqcz+CdgqPt2DNhLyXWCC4PiiR6oB8z
 wkNtMNyaf8SnR9ARGE57rYYtitcEVf9NsnsttN/Pchnf/qrzT4QlV3OTW8ry113Dkm1vZ3V5v3O
 wxttuAihB5kNhD4VuADH8AxXODtG067+dChAjreviZIpKyPqpmRpgI5ac3T4F4SQrmjisZzPLJO
 3OHG1zPwh0W+zZKlOEZ30f8oh3rzoCgxx8tH4OFS1g80q5co+qTe49b12S4uzcjM0aJ97wvEbQr
 TpkAzlt/OA9QSVVPlHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117513-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5D83722224

The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
PCIe switch. Enable PCIe1 and its QMP PHY nodes.

TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

Override the base iommu-map with the expanded set covering all the
switch's downstream ports (0x1400-0x1408 SID range).

The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
from the PCIe controller.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 112 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6d76715ccffb..e099b7c8c371 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_pcie_m_3p3: regulator-3p3 {
 		compatible = "regulator-fixed";
 
@@ -99,6 +119,98 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
+		    <0x100 &apps_smmu 0x1401 0x1>,
+		    <0x208 &apps_smmu 0x1402 0x1>,
+		    <0x210 &apps_smmu 0x1403 0x1>,
+		    <0x218 &apps_smmu 0x1404 0x1>,
+		    <0x300 &apps_smmu 0x1405 0x1>,
+		    <0x400 &apps_smmu 0x1406 0x1>,
+		    <0x500 &apps_smmu 0x1407 0x1>,
+		    <0x501 &apps_smmu 0x1408 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie1port0 {
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c4 0x77>;
+
+		resx-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &uart13 {
 	compatible = "qcom,geni-debug-uart";
 
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index cce65e18f979..363cabc5f55c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2102,6 +2102,7 @@ opp-16000000-3 {
 
 			};
 			pcie1port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


