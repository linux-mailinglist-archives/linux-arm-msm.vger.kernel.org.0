Return-Path: <linux-arm-msm+bounces-80674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E5C3D6C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6EC34E9753
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ED42F83B8;
	Thu,  6 Nov 2025 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5xvYBJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cr+oZA2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8567B3009EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462270; cv=none; b=cZLmyZKzX4Xl3FXj46N+FC5TPgJkgyD9UrIQDHrBYKJr05gBbBFllcA7ORMz7nf/3C4uoy/3zUTzFINar4o7BaxNoH+uOaGlayyjmic4E9m+R6I5gMHn9/z1eTxPY0ghQtfBbTVl60hpm3dvSClJZf+wVJjgznyLpLbKjCePvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462270; c=relaxed/simple;
	bh=/rEpZW/nyrJvs973apvHUv+6QXlttiM+mWTNP1i5vK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOt1xApJcTvseiXFLBd732Hd/8bbzSelrUglkSaQOFi7tfZFqsiK/LUnEGl2c1arkq199+Wexh4HBILlq02ma286mQyK5T0m0z1gLB0vSpL/+EJEGT7WSHoa6dzRTpjmVEWp3ki0A6d2eKe0L/uZplRRIR9kpT8imbzB48Bsuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5xvYBJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr+oZA2f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HUSSG642833
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 20:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=; b=A5xvYBJWCbow+CpC
	jzLRB/rLr3dmskeydY4gCfFWVkQo9mis7dUvKnt87XPjyb8Hg2ItLB/B/VwGp36V
	jPcpD4WwxstzgFBIkimLC/UKbNeEUU2Ii2LFYd4t0Qjm9UDRTUvTCjPPmxlymVwm
	Mjp75dKdHjCW3VYNiQnFGwEwgPCa/Mhs6fGnLM3+MmXM295LfccqdrBXMUbInvRd
	gUgz/64Nen7UzJ2Z8fwxGfoJbco2c2DA9Vpeoay6N3p7NfFZbiiSB6Ehz5uz1ZTL
	oA1QIwNyned7xvne+UjIfzkdBNpchtcEhX1WcSwfi49M7SGoaegAp5RvAUFuRNao
	MawqbA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a904v0jft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:51:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso139339a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762462267; x=1763067067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
        b=Cr+oZA2ffkaxdTzv1udIcpA2zuCs0xLw1mlw+vW/nF/nKFKZVWxt9NMW6wggQcZRRq
         vUJae/CW8jYJdCr4SAmTFjqibdv1K0Q7I+1iQ1OLLng//DlMMbQoHKSsw/Sfv/uqjgWt
         pEg5FiSDJBEfVuNWzEQxS1MqzvBsZcx/q0h0xDv7xzhI2Cf1/kbaA/YSQmA9GmAyYJOr
         DQ2yfj5gACDbswyHw9MwQ+2XXF+WwiQElKg3LV+G5W8Vo0tTYb2sMr2a22pbif4MEaEN
         BWetNjV2ysTAsU0alffaeTpU8SsD5BgdMiN02Pb2sisdnBgNXDq1bMGN90F3OVArrIhR
         Z9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462267; x=1763067067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
        b=P6XoHP3MpnR3laSabeQQPMaZfp40h0HjWhszj7yMx5Nwdx+S/nyVCaH43TbdWiUXnQ
         WmF3GO9dUpGaNwOCi9+MjjCK7AyFazKqtCJJ7V+9lmvBAPDtwz/UaM2llDuSJRQs59Fd
         dhx18WhaojhIMp48ncdm/c+yhYNcE1tYW72Jz8U8GM295HAQeI7Fr0BJtJvpGwdjhS0z
         tCRE6DIhBmI9Pkq8XsTA5yx1x0ub8m9vEnVmbMD2U/+NXoMAmZQEPrIbNim3TiUOauGC
         EtT2AAbxBjXFFUumASrO7aMtG50j5/tVvDLhY8U1GnCgHTbXAQbEg3SrYvKYsKEI+dFI
         XhUw==
X-Forwarded-Encrypted: i=1; AJvYcCVjydHB+fdiN4NjNqpNrk2mYQwzYL1GjG1vVMj1CedHk9JiKeiGm6VZwWlqryC57+4OOOtZkb4Qx4CsI2Mf@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgZXqbBtNVCUHbdhFOX+rfaQiztC9U7JXCKc039ObDOSil8PV
	RID3YphvJsjAHgmq1F0jIfjRRCzknJ9wgjT4Ee9eA7NPP/PIEy7x5Bwt5m0x160+cRf6GXdp2I0
	J8Hlfu07ot8QwZyyBNHDjDyzgd3dIEQBQEq1djqfb88/oA2TKUlUsW88yw8QgqH5EfYub
X-Gm-Gg: ASbGncuLWGsfeSFtKiZ29nI0iKx8Ip922ZW8Kdc6g43xcXEPHr977pLfLa79XcPsoCA
	kyTnuGcZoQg5mYycxBJRg9anB+VqWXDpjEoWIa+OJ7TolApgC7Trvtkq4/1Y+bSJwxtqtwdxJ+1
	Dk347w5cOIyeH1oieJoBWAT1KwGoEV/eo3FSOxZTkDpG5cof69xQaVDqMJOO1Ms20bSuYhj12kI
	aba/TNzn/ZpTmePwj+BQEU8GHQhWOnrf6Muj308LTquD+g8xfS4A0Q7wqZmtrDelzXK2uPtWm4l
	R7xR2DbbkPdYWTQu1kjs/ZSOPMkB9CjSqkuS7zIyWhiP50oaTUTklnyIfMW7mB7AspzE4pi+w7E
	IZRUiitKXUhmszzhmoXw7Srs=
X-Received: by 2002:a17:903:1a2e:b0:295:810d:df46 with SMTP id d9443c01a7336-297c038986fmr11173215ad.3.1762462267081;
        Thu, 06 Nov 2025 12:51:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUnykgTd4vSRne8AYjvHJFdmuR43flNPlXDxQA7vKQ4GlH5pGw+W4vj6jT3OxMKHe3MdZiZA==
X-Received: by 2002:a17:903:1a2e:b0:295:810d:df46 with SMTP id d9443c01a7336-297c038986fmr11172885ad.3.1762462266561;
        Thu, 06 Nov 2025 12:51:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:51:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:11 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-6-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=818;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0zTCxAvZRtlsdP6kfDAlHz0/SPT4i0igeosXxhSpIs=;
 b=PHjlK5g55w0Vljmvd6L93DbkLlZ0jrruKXyjXDXNiFm9PcnV56qBp1QBFr2VB4n2Yv9U/GRVH
 CW7BSn4O84rCWgrOzB+qMcRbsbXntYcRqK6aEbUq/bRxSPUfdidq1vZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RMK+3oi+ c=1 sm=1 tr=0 ts=690d0a3b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TAtRSvG8QZMjDdbLDbU0dFQsDpvuo0SC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfXw/KHvqkVWJwe
 ciR59iAJ0rKoqkNoaQ8X5vC6LfbJhdb/JkJKP6dHkGWkCHX/z60LXrGiL8x3yTKCGdOrxWz0O6J
 PxLG469SQDEKUmyKNHLVjhMOC6Izhj/ofgN1ZW/CJL7ba3yhiyiqQ/hX/WRtbc00tUAPmy4RGqJ
 CCtI9GDxnkDv/OirZ0SCp0SuxtxtbiBf9ayK9KhQUvH90BlCfihChlDAbz6KJysTF8TAMr5U+dt
 VxZg3uo7dPUjlpgVEcO4CxWbcqDxnxbwCVaxFE24UGmiiYPZ2qpwziWOdvfKdG+PvWbn/Sngz+w
 DnEL5daub9UL38vb2/OurySRshx9HzKACvAW2PoyTINv3CT0SkAmHc5bI31w37kN3FtNY0fKUhj
 iZwYJcSr/logjU8mvHMSDYmhud8egw==
X-Proofpoint-GUID: TAtRSvG8QZMjDdbLDbU0dFQsDpvuo0SC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..33e33aa54691 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


