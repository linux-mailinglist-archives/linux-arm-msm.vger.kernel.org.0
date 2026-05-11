Return-Path: <linux-arm-msm+bounces-107014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FctC7pXAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:27:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE49516E03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA8223032865
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC7E383321;
	Mon, 11 May 2026 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC/G7Pte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSepMl3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A738330F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538273; cv=none; b=VT7zM3ZU3B5bv1sN2O6tgSGcLpeoOI71gtkGyjeo07jotoik1sdItHT32aiLO18DR4ufNT2zUvn6YLZpQUAj8QhC4fh3bNbHHxPaMjRYlEonNfMKWadkhCU+a8lX6eSuvyXiCI2h/Giz5LMpUi8FLk7JUR36S0Q1UzJsX2evKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538273; c=relaxed/simple;
	bh=iDb2uz96prvOPreAW7V7qXKBMuEzgLkBJlRJSuUvUNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv07sr0Mn5d3V3bufI31jYqJ52ndA29WJ5dZT2RLY7qY4TCrAk8dq4P3K0Src/1ZJsv2OD3wev4pj5xDyxL8KRdmsvYsNfqDMLxVrXKsR8u36TRoxgsK8iX70ENns4bswwDQ1OCcmVKOWhsLGuUtdPV4unf+w9nmJATkHlX+QRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC/G7Pte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSepMl3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6eIU3444396
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=; b=ZC/G7PteSvshWYCT
	9Gwui2laiuBm9kj/hxGxf0eIf9fBSDWUxRdNVW8o8iQdm2xptrgwbqmGyjFXV7sz
	2rAKbMI0yuhUcuWWjdHZkj1aCEC+MbP2wg0vBU//sD2XLss0pUYatEvYE6ThAHvb
	oo7R6TLFSPicTu2u4au4A/M+YAfdx6ahgcWIGZJufATwrp1LRJgsnk1YyBfVUR1T
	mw1EYv5f7wsHQVIAFww+tFdPDfkg27E6Zx1og0xYCBQ23ajaHWtVDUDK4vwxQTuC
	UhkJTt1KVYtIyi8fwV1+sUkgj9jXCVd/zqbXQzzWbx5gpyigYPwrAjnVlEBlHSEp
	xCKxsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0gfdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f85179263so5227203b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538271; x=1779143071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=JSepMl3mKDW1UMR9dQZqluMpkFTYOPyVBt5SAvagSsGe2zxCGVKJnrOi6Gxfi065Fy
         J8WWDEip+ZeWomb1HM3xZX4QXr1x9g3gGLqvlVPWqgqpB96lDo+S/i6NN8DLFWD1zpGl
         DenP3eH7v8r3+U2RBdlNwttsj9J2FvXzRipBYVFiT6s6h2iRn/ca3p9OfqaxCiBnd01e
         yNlj7KOdK9jStwMxSLdbA6kVa4UFjG0Ag8GIxCR84mS1B4dfzgJZ7FqUocbAjEJC9z9N
         oTY5ktTUsvWSjKq7qE41weNeeD9cn5SaB8KUl/3tuQcLm9b/7cErYtnmkchINDmI9ihn
         9wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538271; x=1779143071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=C55gcCYmn7lnuSTPtHp7EIUngdU5geuVz3PrqXLBI2TpKHEeW/8GZ6cyDuJiEV47cs
         /8xK79FJFGJfbG11MgqMfq4PYLjCiAO3awPcLEkSBafO+VkZyaixG884y1Gz7bHP1sQt
         DAbjWSPALVBUPuu0xSnFK/gi1/Qi0wuRFpH0OIYWrJ7HxWBzgiw8kBmjJAnTWl62oyk6
         0deJG1b4ff5oxLntuj4fS8c5giEnpuGShlT7wrpFTLY34cmrXnHEQWhJEMFIpAZEXpgi
         BSuadMmseuWvFmEAwo8sfBA/bkbCQY7hpc4YZjf8poPGxhF2tz7WEftkhpxkSdD4/sab
         h+8g==
X-Forwarded-Encrypted: i=1; AFNElJ90mnu40MwIWOUTVFC6eerTfNUebVu6Ur48Vz1mIEsmMJDZogF4ZQx7OOwlk/rty9zV/Q6FYOlx3BW1c9H7@vger.kernel.org
X-Gm-Message-State: AOJu0YytKhnP1sjd6xYoXzWoPb96x1MDTdZrGHufpbfrG0c2kvYoPGgY
	vjPiVzghVGNDoyvo5pR1cgAjQtbfRpT+DefOua+ttpkxrGXleLK531gMu1Jrs/90SDVcvCd5qwl
	OC6VZoV+jxpHtwgKA5ZayHKCQMzUt4RuwbHUQ1j817lJXjvfXvselExu43jUVaRFkNeWx
X-Gm-Gg: Acq92OFl7PuYVuuZJM8/qbTNh44xHtCljhW1LOfhhBlG3Zb3S4RXQ8b+I1YO2vUmbTM
	K/3ntRq3eqK88Y4kLBh8pbm7RWHK4UTbCWjoXej5/Wj9ZaC7iwg0v7rvrm/8IvQoTZHzPED0lb0
	/f0q2VX08P81invKAbLdfE5hOrokKo2Q2upsSbYvVZE7b1hV9XZjFyQpHj3JHMCpvbZ5gk8B4Tv
	WQR1lIqunVdE8FVFjxyyFy9ymoffXI2rwGtziH8cGjdElbYe4wbx30Wrcx6UAx+ij+k4eUQ6NUU
	LEYcw3sW7cILLz4GtIYAnTCU2VCiHDT99F/ouMQtTN1YAMd1enuI0TWZkMLL02OZPSOUkjqd1+f
	FA9hX2H3HKsGxIjT4VLMP4KD1XtVhG933wrcDA3/NW8O11w==
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337146b3a.18.1778538270731;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337094b3a.18.1778538270230;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:21 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=783;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iDb2uz96prvOPreAW7V7qXKBMuEzgLkBJlRJSuUvUNE=;
 b=4L1Wf2OEP3HGXs8rkRNKP6ek9eUFrozE8QJtVasyeMz6R2v98M71tEUIV3XtOxqXKwovkzpPV
 E/IxoUX+YlzD2Rsmsy46DBTmOK2mKwzeMLD8gf2BtnmIQ/LQd2gkE6P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a02571f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: SrWAC_CZNI5UKrBG78P2j46Ko6C_NRX6
X-Proofpoint-ORIG-GUID: SrWAC_CZNI5UKrBG78P2j46Ko6C_NRX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX9dtYkm/PfdTG
 e9KmUJ0AGUJE3bWuUr2VT86mKYGvW+Pq4jTMlbAFVp3p/Nw3vw9/M3W29zf0Mwyw+z8sZiSa7GR
 H8Eh7xRHcpQZOaF5GKyU3dM/+FLFt7JeDiejjkmg4mCNOJCx3zaMEYE6+nM6pHAjNumRox93OWm
 0YjkKcTcplsgPmGAcRLxKl3cZOkLzoAPIO5yMpA1JYnnCDFAkccI7elcxrG7JljPd93qrSi2pU/
 MBjP0lXn0YDxAJdW46XCOHeNPbehgAODFmBpiGi1Xk0wrC+R/nYW4bnjzZhqd6H9t57ZxsPQTKY
 eFWLcsqQVsGkk0sr9kJ0eNNB+1agrosqWi/NuxOFQTawEcxFGkacXAVIWBuMLBwM/Sw8PPwpmq5
 gaBc0xs7lq/rDiuQfNYQfN5UjPi1ciw5XLCCw4hI8EXqsCZHnEPk6jBEHubUVl/rG8cHCD3QuL8
 az9ydeWqTATKuhNy3BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-Rspamd-Queue-Id: BDE49516E03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107014-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.51.0


