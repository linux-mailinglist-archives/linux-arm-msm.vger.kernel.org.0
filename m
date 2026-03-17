Return-Path: <linux-arm-msm+bounces-98088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFSzHgYFuWmEnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:38:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD82A4EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1071301BA6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A569391E6C;
	Tue, 17 Mar 2026 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4ECUPcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnkMkGRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D83921CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733083; cv=none; b=PL7duzptm0+nHKPfhf9blN5O73Mh6HaemOECwQ0xnn7lniIywtPTbz5M8AWSz1B68e0CgKlhRx/gFih3VgnBt8EY75D5PXmjvDGXV74FYKqIHWR5ftpwJvpS82x6dMtAkwlSgr7hkkJiJwKkbezbpQIut062QYvcs5UHAuvGsSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733083; c=relaxed/simple;
	bh=ZJiKB5y14XoyWqqwdBWvjOVt+oDqMJNE33M5IUHiV1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnX5KJb2IoAkx8H0XTy1X70t9QlkV3yn91r7Ri+PGh8RksVD7xeND/uq0jMhMZjt1vehr3fgdu2pymG+yIg35rauY3ixpWUOidaQJZ/1+nOeenElPYUtICCiG6+kxiK8jxf9+vAfuGxzVvDbAD70HNH6EqKoOdCb71DJGItKU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4ECUPcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnkMkGRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H6ubPf2375010
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uy7Og7nMxysODOOTUi28l7/aEGA0n4QL4PbWsLPD1yg=; b=X4ECUPcgjTbDIVky
	KestdKAUAXWlNV33kYnIG4n3PL9lVQk4DOoGKJ191pEcet321lRqO3HddLvTNFzC
	0yFDcz5sskZhWkwVD3+HpOPdilbhORxxv3+aXhKeJCkvjJpS6t1xj5BPgw0Vo0RD
	WGXRRY4HoLL6It0R81f6XfW3GFzH2ZENLD32VdX9grh6zMjWS0QJBY/ug16S7Sic
	Z0Z+X0qFQQG50iQW8Y3ttZ16Q09ZhVRipgDB6fRu9jIUCE0SIw+zP7uOgDl4cx7E
	iwnECHuFUf55Fo01MM8d1VO9cjVhFvrkZeMTnwvItrxQuD2ankbynGut55cn+KtE
	otXKWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby356s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:38:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso1651039a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773733080; x=1774337880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uy7Og7nMxysODOOTUi28l7/aEGA0n4QL4PbWsLPD1yg=;
        b=ZnkMkGRWgcOzARbQglATHU5oWFNCAvcQQlWd/4GTwBYccoJ36P4YVs3/fWA7QRzNwV
         ZWRnpbN8dR7t800Hkskvsd9yBWm8yaxji3lLh+W9NwuRWl81rMAAzoYSdE7Q7FRjfha/
         KzvUBWZurw3JwSUG7ZyVt5/Z24ArhEd9sCiAgeAcUKV2qRLXVY+rqMD+0G6X9gFu5Puj
         acptIGZrvwTNElTJng0AldNxnk9hFwAuwj6cLeujBUVE8/nr5K1d9YeE6zv+O0O1bTNC
         jnc4Qq9tvbvtnrRHxxA9O/QoaZlOox0TGmB8+kdC8wVgOqmhxlg6vVpiZVzKyKZnkDHH
         dWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733080; x=1774337880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uy7Og7nMxysODOOTUi28l7/aEGA0n4QL4PbWsLPD1yg=;
        b=PWBezw/BsvimXLZWcksfRKNHAXzCcMcjSVwVqh7FSIDQd3K/AzUP3WTEEWWuAKRY2C
         9jOgRgucvOSbQ1YOBSRaTs+yr88AgNexLSzyI8aph+QkeVOoFbV1SA8SJOkYdmuIguyj
         0iR+BjnQsUW9fupzvZBWONxJrtsU3rkUNX3Zk66xDqBXaLzdGT1aDRdRKDSPBxzuM35X
         y1Xv7YfbQ6U5s0Mp+N7yomyGeqH1z+jyuOgdVnAhS2p+E9hTbXFIa8PepAiliBafEVF0
         cahYh6PymTGneyRNiVeritAU8zq9JPRTHX+MC5xxFZ8PC7zudhgPwxLZ4tO7aoe5BAXm
         6bCg==
X-Gm-Message-State: AOJu0YwTPu3KmzMFkc+m9BY2/x18V9FA8XWpC9/NMjOkqFFobtvPyn2z
	XWIkYvCaWlD3NUWQlmyzHnTEsUgHKT0KrGFUajQGSUx4LX+OCnXu9rXvEw4cZiklAZ/fRTrIxWY
	PZiCmf/HdQ86ev8FFiRQ6RUDHOoVDM9aPIttjHKRnHzTfZQbZ0/FQ5gmjFy/b8tjtxnvMtczEhs
	Nc
X-Gm-Gg: ATEYQzxQ2awAfS7HdxIMgTRYV8PppPRLta/PpaGifpyEkjwUiLGTzKB7g6hhRThM9DR
	jR8KwM8VM+EQoyWV1jDhY3Q8i9RdzP+xjAVjN7jRk4gFIK639k2ixiHNjhVjG+67NT7G6qh93cC
	HU7qeqQLhRvS9kZq1ubAG/gTf0sw7mVs4McGw8HQ4pCwC+BBY/A23SnWSTYvNeA/vpGbU/fom2O
	wKmQLh4OuCsvz3Z92QhQIbFlbk+hW637mQVlKCjqUDPpPJIM24COBNFuyY/71jRjZr62gN+6YZ+
	plpu99I0oJdYM9aYu9pKrBSJNqo2bfsq3QMhz/dfS4hmpjxxSi3FGvXBFH1lScAA82iP7KsmjA4
	foD6QoWu3/3P8uxQEHPOJxa9H7S495ZzO28ehQsZox/CT2zzxE8sJ++voJw==
X-Received: by 2002:a17:90b:288f:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35a21f67c46mr14547978a91.13.1773733080141;
        Tue, 17 Mar 2026 00:38:00 -0700 (PDT)
X-Received: by 2002:a17:90b:288f:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35a21f67c46mr14547957a91.13.1773733079651;
        Tue, 17 Mar 2026 00:37:59 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bfdbsm1954913a91.3.2026.03.17.00.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:37:59 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:07:08 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
 for PCIe1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-industrial-mezzanine-pcie-v5-2-1358978517fe@oss.qualcomm.com>
References: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
In-Reply-To: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773733066; l=4319;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=ZJiKB5y14XoyWqqwdBWvjOVt+oDqMJNE33M5IUHiV1I=;
 b=pBnuqR1Bhwh0lp2UegQQheeCr6khItVr2qFmgnNbPoh4Knb56RJK5ZKFq3awazKJpDI+D2voI
 QMwPpWXmwE2BAhZTkfwmKZBRU9xtzhQsejbcCgfv4KwyutJFr6C7Wjm
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: WU_rqUk_SgI4lNgqP6ZdOgG2QZw5kH3V
X-Proofpoint-ORIG-GUID: WU_rqUk_SgI4lNgqP6ZdOgG2QZw5kH3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2NSBTYWx0ZWRfX4m+fOy0KdGmA
 uKViLMyqtFld8sZP464cNt3toDaKWM4KE1hNGLkUNccfdHhF1m5g1i24YlC/J/I4HDhwNoovU8d
 8L9ooQlhUA8Mmaa8EenXrYCiTVCw+JP25x/Z9swa2y0KsYpa5inJXum7o7SzixFNX63w1nYrHMO
 o7D9oQfdegq7FGelFkz0X5N0oju6qqVv0e2BVu/fIfP4AaXU0pGO/QhOfFh6DWgpOlcZpitoaSW
 NKLtJO5S1Oj/X0RNS3/fjp+0h7U/BrR8Mm2CrEirJNrVTRI8/XIgvWVgDcLhFsfx+uEl74mtVCi
 Z9I6u53cZXPAUAu2wmtoqslMnYHz3zlOeonC4wzXdC3BcodoytDLwQkMTA5npnb2YdKro/VqiIp
 ye8q/e1xkLb3+BPq76v6/Hii7Gheev+UX9Mi5AmJbQmkbRwhaTLwe8w0jEi88TI0UndChAF8IiH
 e7VZ973aZx3nDOsAJ8A==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b904d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bvgCVipTNhjOeuzF1ioA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98088-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79BD82A4EF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
in cascade to the first TC9563 switch via the former's downstream port.

Two embedded Ethernet devices are present on one of the downstream
ports of this second switch as well. All the ports present in the
node represent the downstream ports and embedded endpoints.

The second TC9563 is powered up via the same LDO regulators as the first
one, and these can be controlled via two GPIOs, which are already present
as fixed regulators. This TC9563 can also be configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 102 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index ad2795668ec8..83908db335af 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -150,6 +150,100 @@ pci@0,1 {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
+		    <0x100 &apps_smmu 0x1c81 0x1>,
+		    <0x208 &apps_smmu 0x1c84 0x1>,
+		    <0x210 &apps_smmu 0x1c85 0x1>,
+		    <0x218 &apps_smmu 0x1c86 0x1>,
+		    <0x300 &apps_smmu 0x1c87 0x1>,
+		    <0x408 &apps_smmu 0x1c90 0x1>,
+		    <0x410 &apps_smmu 0x1c91 0x1>,
+		    <0x418 &apps_smmu 0x1c92 0x1>,
+		    <0x500 &apps_smmu 0x1c93 0x1>,
+		    <0x600 &apps_smmu 0x1c94 0x1>,
+		    <0x700 &apps_smmu 0x1c95 0x1>,
+		    <0x701 &apps_smmu 0x1c96 0x1>,
+		    <0x800 &apps_smmu 0x1c97 0x1>,
+		    <0x900 &apps_smmu 0x1c98 0x1>,
+		    <0x901 &apps_smmu 0x1c99 0x1>;
+};
+
+&pcie1_switch0_dsp1 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c1 0x77>;
+
+		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&pcie1_tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x40800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x41000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x41800 0x0 0x0 0x0 0x0>;
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
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
@@ -181,6 +275,14 @@ pcie0_wake_n: pcie0-wake-n-state {
 		bias-pull-up;
 	};
 
+	pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
+		pins = "gpio124";
+		function = "gpio";
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
 };
 
 &wifi {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..cd54525e45e0 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -852,7 +852,7 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
-		pcie@1,0 {
+		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;

-- 
2.25.1


