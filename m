Return-Path: <linux-arm-msm+bounces-90678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGeuGCJ/eGmcqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E5916D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B416300B9E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87693321DE;
	Tue, 27 Jan 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPtxkhHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkeYW2AU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7BE334695
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504520; cv=none; b=EQ8nA9jIxEY/Bl65H+u/TK09KoZjXeZ2VjBCMyYyFYvY0OsuVfnQtmXPPH9H18/b/adEKvkYeOCVRZJK0kGwzp2LWo/llX6gBirrg3DVF+kg/QXeSms9BzFS/hG5w7A48ubGSxcW+rgGQPbb5QiupVpc1qEVZybFr36auQwdTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504520; c=relaxed/simple;
	bh=0JQW3j0mOyDRk3Vp76qCRCemPu2yt2U3mO9vcjizvS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+wxjLQRIP5bEGqB12bxJZ3z0i0gqXfiTrnlw3NO6FVTT/pOX0qCXI3OBN2RzAMqnGuvGAOv/hjN8EO24YBEOLqEK8qaZMihhuQyMYh6xQe3xvrEY1BrvTKBGVEweXTImxtAqUSKLVJy7bJyn/CHFkxg1C2qsw1y5by6Iypv7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPtxkhHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkeYW2AU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7RuKm112562
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2/TjeU1c93O
	iGdQMnTfgmwqg5rVtkI37cvskFWSKidk=; b=UPtxkhHxiehBrzucBtTm4vkvd3F
	c6cp3GB2UY66KYuKsXr+SZSJWIzsvNezDlptIKU56mNvmCiAzVOS/a+K9mdOw6Ju
	eLpqkU5N2TzUQjt7PB4qfCXvlMtb+A8md4Fs+Kaak7dXz6DPPTznN1rhx3cbmvgf
	awL9ZpT2UqW1lNEjLwcAz9uRZoYAMF4Mh675iAi/ofT9Ji9eeH5BOLRWDeJ3lu2P
	5o76d+w3AF9xtklzZscKMGRF1m+WBTYP7gXbbw/wB0ji0beDDA5VbdgzczPUE5Qr
	zT1wiRF9iaA1hNutmRUPZscvaTHp0hJB72pSY+rAc7s1TXBdcHStfggwsCA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0c5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-822426d21a8so954688b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504518; x=1770109318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/TjeU1c93OiGdQMnTfgmwqg5rVtkI37cvskFWSKidk=;
        b=NkeYW2AUiCbOhihokjSrBjiqrW7U99hGjSHw/3pEonJdW5P5n1wZFHPZcWtfJu+FAK
         WEjmOoI9Fzana9HfAP4wMCoF4rOJ8ELhKjATHDI75vBLCHohVY90efTzP/g9igykC2b9
         vDNg0titIU6C5+bpKv1v7TBTkkQ73xhvQ1Mka5H1Co1Qye+6XeOeQ+tGlpRRwDcF9/uj
         Hft6UJvr6JyHAURnzvhQzP3lj+21Usc+mBY0xwJHZO3CVFzN2JqDY8A/49zx9M9JTvlz
         AL9Nh3MEUYZ7hnzhxk9iVD4q6Z7g22z0Otr+ilL6u7vyY5xFtxadmF0uYl/v8zWJjUZ5
         LLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504518; x=1770109318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/TjeU1c93OiGdQMnTfgmwqg5rVtkI37cvskFWSKidk=;
        b=p+pSfew+KLYL9o0OMzPhKq7x+GtN8QLNXvN6vHsQEsTWd3U7erfi6fDTdPnIaxlBun
         HRGtTKOup9eQLYfvSoAQaTBJwS154r3WLTe+pVH5ITHoHCZo83efEnF10ePz3smdVmeR
         K0i4ZnZGi36t9M5SHCnBMNEGGT7zAmvMhNoYZf6z94Itkpi2wnbkZj4w2r2IMUX4/89t
         7FiNkIivkD8x+qRKT972Qw1YTTrW4KrWCOo5XxtAgNvLl3r7UEXyfgrnz1VbtlJshE4o
         MAjQ4xCbXKVnTv5AiFtr7JxICRjXxlsqzxvU8iA05scp1btCl6R1KXqi1hhtANO6Yc0p
         9gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5NopkDvyRrRMz+hFj7Fqnl1iM8ju+QCjymKISgIaLGnt6mFx7vsXq2lmAzjy8lic+pLhsVl/zjDNYe7rA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ppdm3S6NxROeSSnY5KY1LGN5wspKYthKbkuFgP87Wy1a2spf
	XguT0aAGaJpX7t2owrwVLLh5JOfIPpyfgyf+Qj8LZqQf2O0BSG1nAOZliOzcbKW5tmhwYP2vyKs
	VXag59pdrch1NrnXiiK0hfoqwJdsWRBb08xCmYc6efnyV+MzbXj8ZHhmfe6pclnNeU2+x
X-Gm-Gg: AZuq6aKs4M81/Y5xt0j1GoPpdnyK2yLKjONi2kvVqPeK3P/DNJZmAAZHWOThTBZvGJb
	JTiPpovBnquKmzdysFBFxpiH+uhZmpZZYicXKyLFkdmY6qVPLiY+h1GREYpynREa6dnOaTm6uo8
	Z/r5nplhnyWWgWKgk72ivXHngAHuUkNoBO/VE/hyIyIflo644l1Sk3UhSDFQ09sjAEt8cWf6JzO
	irTF6KhpvzhXN8WAUZ7pZjtt2rjpklxrmhauIh2cnv2o8vLw6mH7/YGuF2y9H9RXL7QJ4X0lhZW
	3hJOl1UitJltiKINe01elOykkKh4UAXFUvulH/BYFpZS+N5p6pgQcZrX+hvz3wGGEcLzqdFOGKA
	AX33Aszybc6hpkwf8XzvhvG3q7rSjSbzbiBMTZIRW08o=
X-Received: by 2002:a05:6a00:22d2:b0:81f:3eda:9d65 with SMTP id d2e1a72fcca58-823691995d3mr1255644b3a.18.1769504518250;
        Tue, 27 Jan 2026 01:01:58 -0800 (PST)
X-Received: by 2002:a05:6a00:22d2:b0:81f:3eda:9d65 with SMTP id d2e1a72fcca58-823691995d3mr1255615b3a.18.1769504517710;
        Tue, 27 Jan 2026 01:01:57 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm11579228b3a.45.2026.01.27.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:01:57 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs8300: Add clocks for QoS configuration
Date: Tue, 27 Jan 2026 14:31:16 +0530
Message-ID: <20260127090116.1438780-4-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
References: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MyBTYWx0ZWRfXz16bvJjRgTiH
 PSJ3ii7KKihK9cQj9H9wGgYPae0aIuIi2NbN9A6NXYantHXw3Fapi4h7qYRlXmSSNIZOf6HOuC+
 E7ZCfFRtRrSSaawXbFGeBEASoaF6NEYMsQmi+acAcdUP9UYJA4lwuqB85SESlPxNFOgD6aXb4Dx
 oy3B16iVI3SEyx7uSftSYYTiQx4CPzpht3c4ovvFaquR2zVflTJhe7vQRYKaRvFkHjFlzrXM2bf
 nfEtIFHLE35jBPtJFKsvFB+3IzX8u/qH4eEKaTQlRGoI5du9LHYkDt1hgNzlzSZymw5EA+vkACd
 JVjVSqVV4zeuHdFUhhwpfV+Xg3tsJr5N5BJjBwWLVHz4G3pwKwmRYrRyzTajr+Mi+8DhXbJp79Z
 BxBy0a/Xe3Nrxyt3Y1OhNhOEBoSr4h7fbtxJzaFn2UnvH+8d3SILZt/eX4s9oay1iJGnc8NqUCO
 Cxk/3MBoZm2KIsDgkXw==
X-Proofpoint-ORIG-GUID: hyT6I4moFyKCWyqz2ha4tTglwXz2LujE
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=69787f07 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-zSA_OpRfadHS7D8NhgA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hyT6I4moFyKCWyqz2ha4tTglwXz2LujE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.26.219.0:email,0.25.240.160:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.140.97.128:email,0.138.218.224:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 019E5916D4
X-Rspamd-Action: no action

Add clocks which need to be enabled for configuring QoS on
qcs8300 SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..867df0f20e8c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2234,6 +2234,10 @@ aggre1_noc: interconnect@16c0000 {
 			reg = <0x0 0x016c0000 0x0 0x17080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -2241,6 +2245,7 @@ aggre2_noc: interconnect@1700000 {
 			reg = <0x0 0x01700000 0x0 0x1a080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
 		pcie_anoc: interconnect@1760000 {
@@ -5103,6 +5108,7 @@ gem_noc: interconnect@9100000 {
 			reg = <0x0 0x9100000 0x0 0xf7080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_DDRSS_GPU_AXI_CLK>;
 		};
 
 		llcc: system-cache-controller@9200000 {
-- 
2.43.0


