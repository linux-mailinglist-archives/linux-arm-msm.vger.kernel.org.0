Return-Path: <linux-arm-msm+bounces-86667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51548CDEEAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B441300A30D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746CF2DF6E3;
	Fri, 26 Dec 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8pc3kO8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dozs5uHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E7B263C8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773862; cv=none; b=UmbJQtzQZ6rzqD7vjQqBRC93ZMyk8mm0yZIQng4wE3d6vq0aAVaKNJEhu7wL7zC9AHVIRyzmzLhh9M6K0wAelznA/tXyUblJV+w7SUtdBNnWNUJmeBhNS92zQW8I1G0qEMPfgfsNbKCriNYzN/j7Y26z1rWN3gz6CvYm6YVNW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773862; c=relaxed/simple;
	bh=dGw+HtkOmWI3uqUr6wrLYXX0D+45vSQclGhCuqKUsic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWiy7PnCxrKaT4KaBD+nWYPYPAonEnVuUB2h7BIKNVlVU3vqAxNlBdgq1bTIyLG6IZnrzTK9gEYXkjn0N6BPjqvKhi1jX5gUVMwhd70gBgrLM7Sfva66LbxirGgpRCZSBYWmd7FWbbAGj7qV4bqmyfl+kyxSu7ZGtZYflo3ez1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8pc3kO8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dozs5uHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQGHg0n1099948
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=; b=D8pc3kO8GCjjvm8/
	Qfq9GTjdv2cFMFM98PAyKmDBNqElyY3uyRSyWFdy6T3X2nIwgRvPJVYlglFFkis+
	Der36k3jGegfD8cJ7OgI5J+j+DhCmoSYGK2V/oEGXTEN2nBuxV13xr/pRY2CerWv
	vosC+Vlrr4rYq6LLayf4LJJiZvqQbG45X0l6wb8S57ie8j06JC4iGuIfhseplquj
	AT4qJUK9qzAqLODlIqDvJOvXyA+4/vtUG5H0p7rzFQSSdtyQKlqHgZC7Tqm7cWEH
	AC+sfsrJSzqIxTb8lfnxxnEy66m6X1+OniKWoTNhg1MUo4g33pZAcEadPtFKWL+o
	FdBzzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8vaabqd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so16970477a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773858; x=1767378658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
        b=Dozs5uHTzib12Gpv37M0iIgez+yxzVsPnQldEo2T81KHzrJb/EWzpRW2EiAM+ouD7r
         iU6eWEqZMDnyOYefSwmbyaGi3rdiVd0D4UboyaoJNeqgY4icuRmuhNogT+buZompgPSJ
         bFvlamxnRO935BAWB8S2uiTG17HEpHabXBfRFQwLYQEdEyIe/QCqFVuRY0aMmJk5XR1k
         k0kEWIYQ/aWUxCwCxFbhzy7CcASXRTjLGxDyz+N9Xck9/NFxVL4nHLwnsGxNZEbk1bEc
         78WcgBcBkIFTiNsgNN/k2A5BMvpDyfSLGBOjPbuVj+bJgZz+i3C5tK8N98iCkw87ce/h
         YHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773858; x=1767378658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
        b=GYKvObCL2ocLbGfTsFa+xjkngYQ6t8sREIm7HHV92Es3/q3ELU1VKScxV+WwOXBYwP
         38kE040sbqFWglgzt9Sa1BzmSAmPl+4ZMdxbebVJHcgD4RMiL1e/hqvTkAy4RjRBHcm9
         hbZzbyij1MUM971dG78/72xQ88kFnOvVa0Fin0Aud1O49zQZt5rku1eguSfoRi1Czijh
         dQ7RkuMPGLs1xKr3T9qTqPhhe6waBi4rSA+rpkHbLM42q7FEoOmr+x2d6X6Pw34EQeQT
         TXu5Hl+gKgjDbxKjX9RtCHXIyKcaFBU8gsPmAfv8H8XBTpthwuMJ0YscJ0NBKX3+5LBm
         gdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUy6US+htT91FK8rfhwf0gkAMLOAXnt6z+Hg92GTJXjrYOZF99FshSOaXTZPSG1nRovWH06dzvYFTMzE/HP@vger.kernel.org
X-Gm-Message-State: AOJu0YyKu71rH99CI2TAvRewR3CManz3NY/KNa+sq2/tR1ZtpBta6+Di
	iAeuNQzQV1h55Ofdss3QErVopvSjePJbCucCHe8kZgl14LqSpAgAauWufxh7tV+jxGAEPTYMWZa
	plXyxXSQRLvt/TH43y7K3D2W2BKIoehGpNhF7owhnbldxUySiip4L/uXIke6KIRGrxqcx
X-Gm-Gg: AY/fxX77S6IkfAmC3bqPwtAqpkM3iIUhe5cbXqxXdRxFmBN2vhhZWjIO3FpAc6D8pqP
	a70WzHJHu/K3mhtBNh+cljDuDaU6d+AT+thljaYVdUw0jYbFHSALy34rcDQYas1FR+Bs8zcgpmY
	aHWFx6yTmku6SUzvlGz1iyPU+JM0LarP10f4XsTMTKEVvG/ZG6En2XwGyER5ocuEpfKkzPrHEMs
	tvTe11ul/k1ML70we26iIhRxHMWMJsr/wj+D+c1KmT0QaEvX/ipxcWrviEadJFcEXPgH9KQv03l
	fFjNiCAYU/gTddVO8i4u3jr60fHnn2dQQ4JcnC2B+4T0odwjOGr45uv5+6LFt+veiRHc27BCNqL
	wHKnAbB3d5no9S2Gt1OvCWH6GMcgxK9kF4w==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id 98e67ed59e1d1-34e921b9fb1mr19395502a91.25.1766773857550;
        Fri, 26 Dec 2025 10:30:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3cB0r3VF84oECQbOBHaUHDcFCfAqqe4vcXRfkQ8idCGmHLWTD3venrh6qLQpSG+LSK5JShQ==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id 98e67ed59e1d1-34e921b9fb1mr19395472a91.25.1766773856989;
        Fri, 26 Dec 2025 10:30:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:41 +0530
Subject: [PATCH v5 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1566;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0wHTfSWxkpfoiE0HDndY5tE5UXZgiygEg/pFzVW0/Yo=;
 b=7NYLN0NLICnqtnhMSXKEIZo1luiDJXgB6Id6mOqyxkwcLkGqEmCDvSzZ09RxWzPo91OdrMaLl
 eRg+kWNr+1CBK2CNmzfooccSkUtX3Uu6cA8v8tXeGTHNNi7yTPbMm8w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Q5k_QNvANx0efU97tFJTlCPepf51bsh1
X-Proofpoint-ORIG-GUID: Q5k_QNvANx0efU97tFJTlCPepf51bsh1
X-Authority-Analysis: v=2.4 cv=WMByn3sR c=1 sm=1 tr=0 ts=694ed462 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zVnKP5-pAmSyy1jt-DsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX0uf0DqlOdcX/
 bB2c8NwmEmeoiCoyT40Ofvi42gNa9bzDHkp8lFK9nZLqWtUBBxNsadUd+pkQAwBLLUPOXyJHQhn
 d4j7zoBV8HBZJrTNiho9SXpj0SwGNNiLv5MX7TxeYF5dF73EvwZ7jHccVUyiWXGNVpw0v2uO7L2
 eZozgM8O/ogRjZxVUcAYCr6JZ2+L+R8BXAaVLCo1Ygas6rMtenx2quhXB7flWlpxwI5a8uzfDO6
 2La9hMHnXZaCiLba+CUXoZLinzr2PIK5q2v89LKm/hD8zDQBBjSaTt8IDJM7bFI4trnxDBcWVKG
 8kM9LXRz2f7cG5t/fzCCIN8+oDC24lfSku75bxfwfIRI25StbjTc4+UHBj3T36IFGcDSwZbjnVF
 YMyxsWeWL3O55FWKqmBgP9bXlBUixyWQNd70OSGSkufiiyqF4dR1ep7FALyzosVF6E+0UjBFGe7
 ybt2WBAq79E9ZZ4Fpug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046f9e4ac58157f282c3af41e53d374..33e33aa54691d38f96e5c76596719691e2596eb5 100644
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
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 7c2866122f9a13b8572fd9e6fa9d336176765000..606f5e234e4a02caaa03f1084336e137768dba1f 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1902,7 +1902,7 @@ opp-435000000 {
 
 		gmu: gmu@506a000 {
 			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
-			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
 
 			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
 				 <&gpucc GPU_CC_CXO_CLK>,

-- 
2.51.0


