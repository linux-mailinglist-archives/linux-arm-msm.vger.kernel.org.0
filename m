Return-Path: <linux-arm-msm+bounces-88405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628ED0FAF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 20:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EACF30039C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10F6352C3F;
	Sun, 11 Jan 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX4iv/ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OC2hyAAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CD338F5E
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768160827; cv=none; b=Fg+WJaEu3wqowqNHqDWIIBwsxmNPkxicKnJJ9CVVx4X0bdpaLN35iyBqDj9Xv70kfhwfMhdUCKUAwm/dlC/N5YEhvubCPc8XDOz8KDSUCNBA4CkwjZMit0QtxvEAV+F8R8KfPdqzjdmKnHR143h48XQUJe9WyTrDCAAuTNOmFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768160827; c=relaxed/simple;
	bh=LgiUmXYeM3SN3SzJ9b8ot7rT1uGH9BtlRADOOPheWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuGsYMWSCtHpnRtLLRT7gGG2jHAjYtPFEh+e4OnNKuc/4a2M6p9uaSvHs0uOkMtwYuFnbbS+F/p8LxwuDnsCWKZeLFUJIXbjHnmKdRmFWiqsJNtMjuDXFQoDGAiNdAHoN6em877dGTC3mUFoJpCz8FISeFHQcj5qlEQXehLvMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX4iv/ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OC2hyAAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BD06jH1974535
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VWoq+K0orW96DlxbTKO5f8O+
	BBk8ncmN5cuLKOlxAh0=; b=fX4iv/ah2irCuA1GzS5zNSReTHyBAFXNNBJ1E2aM
	foqHoFgkim4tpHKuBSIIC3xRHqaQx+ZRJATO4Pslxg2WdgLtNh5Gm7wd3MJ0+dIQ
	uaBk0RYQzrEXylL1hFdzs7VYjNVW1WFfE6suCqHatdiMU3dxV3Pm5JdGA0/N6ubM
	WOphCjQzfEnbB0QP/g859YO6UPm1O1ehk6j1N45KLJu1v78PyHi4wOIwJQDdQ2wk
	2WAkStk8NZVeQyz2K3DMkJDfeIecrKHNLjJ+MSVxBcDDrOGNhBzzokXSY8XX7to4
	Tu9omNL4eTyeRX+GLDFN9G3MABOUSf4bkL5UgjOvucMM1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57anv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:47:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so1946658285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768160824; x=1768765624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWoq+K0orW96DlxbTKO5f8O+BBk8ncmN5cuLKOlxAh0=;
        b=OC2hyAAg2+SE3CFPJehRCE0CkEi11LC22f2ulymz85WFfOHfw1VVjboSKeAcNEpCKP
         I0d9hwWik+zfOxaLb2t9wdR0HCwrc8FtmzJxCw2rwE+zYUpdjC0zErHUADmtj0OoFDNM
         I4gm44UC3s81Wz7FAl1q1Bx1Srhy7fLNKdOKKj6GZ6ahLoe4S2jMqSUNvkEwQJVfq7Oh
         abqwUPkm023sGG9GzRVvr2zcl4cBSSIlsByBpWSfslFvj1tQ8+QtLae4h2EdcJYOgceW
         OhF6HKKt4gzYkWloLSJeInyqDuEaobuCBxP2MfmSCtmsAruaa7H8JpMLTwYq3bQ+bQa8
         c52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768160824; x=1768765624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWoq+K0orW96DlxbTKO5f8O+BBk8ncmN5cuLKOlxAh0=;
        b=fpaiYshCqHKMdKBEyxZ9lANNB/hocBjLmXNDu7VoSWhDEoaX3j+XwDgf/AUDbbc5YB
         sfUoZB4gBR0EghStOeSuOOMhW/MlSHiZP0fLGRx55QNNRi4boDbmNBNFiZgtlxGITVKU
         oXZMVl4suCjYyi5tzzNOmS7/qZOU/z2iOA/QRf/JUwRbgOazabrXmnuIwW2D7prMFtOG
         8HpGmgEnIi4eK6WX5TDTxG5pmsF1GFHUoJVMn8Dfoe6XAULjsnqB9uN5GpIYWjAHrTAZ
         7kJxApkHXQ/NH4WoElghXw6Fp4kMAxac8+/+iNx34ZXczXzcbSVr281V+o8xQrUKevCQ
         qi3A==
X-Forwarded-Encrypted: i=1; AJvYcCVpIeCXhu5PPILTos4cNuGWMm1HykMhTmhrfWzPDnLnbXiiQ9cu2r2E+et1cJfozJx8PNBd7MwVJ1V6g7Ag@vger.kernel.org
X-Gm-Message-State: AOJu0YxwT8CDZ6iVoNdrVlbUNd8zesgYXvr1zfLQiCWvD7Cd/Pw3bZxm
	wpUjXHm69S553Q0cN+g5ysnYkupod5CBjpotKX2SjiUPcGUWIRK+ptVdZ5wVZSTiV5603SoD/dD
	DUFSbbZt6i0j9eQImja7iTrSOqpFGbrEUc9m5dSdMBYi8cd229+W6TAopOHyhf5OCkgBnCN5+O5
	Rb
X-Gm-Gg: AY/fxX6U1GqQ9mDZs+oM26iygJmj3BddrtDI2vwbKGW8/7tnkjvfhu+eTy9eH3gRPaf
	6woLVB7DODFuYtXYN5IGu0VWAOnKxW7rq+ew9Go5+FEbu3/PAh2cESIryrKcpfoP247KMbAioqC
	IxatHUmIlVIm5xQfFrjfHEz45Aieb0JGItBu6w9mll7Stu3xE9InZyonPdWSjkYC2bvtTtGUqQi
	1q3n2Lmz/JWnl9dW05ZxQ3WNZLGVtdzC2RiueNrP86MIXkmXuPYZIv6CCeYnFlvvOwv5szdlpwM
	iKJxQdnbyApIZyYtSZfvHSHiWoRnTOTWHrpGtd4re+0RuFkbksMlIVzKYk0zsAUVZWutGBjL1Zd
	7Js8xk39I9Q+OUt8AxZE8DDmHVEFWkX8BbiZQyn9Of9dvH7FXQT0gui2rnx2rHvvB7fl8s8+8V2
	8XjPH6q0gElK1DxJ3F4ebQvs8=
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2313318285a.18.1768160824368;
        Sun, 11 Jan 2026 11:47:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaSQrfT7R0upbUsE8Ls5NpEYGw1E2ZBrGO7Xau6nDy45sHOd/GEvMQLRUH+vOz30b4yVIQ7Q==
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2313316185a.18.1768160823873;
        Sun, 11 Jan 2026 11:47:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eb22sm3234553e87.41.2026.01.11.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 11:47:03 -0800 (PST)
Date: Sun, 11 Jan 2026 21:47:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
Message-ID: <qv2nlupgk3unmyj2uvegfrtdjrbnii2wuqg6xb2wzowpnqpccf@p7n66642cuvm>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-6-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963fe39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7KhyCbUdoPYTC6S1WX4A:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE4MiBTYWx0ZWRfX0TJJPszywmYE
 Ja5CsHVSmvc9/9wJk8kbxlA5HQpbg32EBDa2hI3u+DxGUPPA7NTfdtP6apQ9LkuyKPsuMD3v9xn
 6NPOuU2bYhjdJgg84k87zc7y1+XZ5nkoc7gqDZYKn5ETHmEDNVj7sJWCPvIuHeftm8BnGzIdrg0
 +VRAz180gQ/gF69m/rZuG+F/w52qN07B57+trQ2JF7Ini7yivZBmGzrQcWJ7kg065biVvAaLt17
 v1qK6wV0lfCIZh3s9ksu6N4zJVcsmnX/EpDCpoc2mFBPrIdyLN0Ns8LrAdHBS0WoaH6EpHz3vjj
 1YaSQE9k/5P99DeXiqsfnlsZ4EIf3OQcdDe1Hc5wWnuFIVuxhWcHWZmhJik5BCOorIVVrLNx0tD
 dCWuNJNeURp+oeuvb+/0B3emcBpwfBoD0jXhthoN2Iadq5Wmmd987Vy1zOoQQGfYZ6fIv4ta2vZ
 RWL4rEJCx082iqfex6g==
X-Proofpoint-GUID: SXyla7-qUxj7EW2eTbZD0KaFVi_wsveH
X-Proofpoint-ORIG-GUID: SXyla7-qUxj7EW2eTbZD0KaFVi_wsveH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110182

On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
> 
> Working:
> - Wi-Fi (wcn3990 hw1.0)
> - Bluetooth
> - USB Type-A (USB3 and USB2)
> - Ethernet (over USB2)
> - HDMI Display
> - eMMC
> - SDHC (microSD slot)
> 
> Not included:
> - HDMI Audio
> - EC (IT8987)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 625 ++++++++++++++++++
>  2 files changed, 627 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> 
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
> +	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
> +
> +	status = "okay";

Almost missed it: please add the qcom,calibration-variant and, if the
original bdwlan file works, submit it to ath10k ML ([1]).

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

-- 
With best wishes
Dmitry

