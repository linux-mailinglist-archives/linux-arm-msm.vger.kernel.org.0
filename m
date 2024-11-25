Return-Path: <linux-arm-msm+bounces-39087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6019D855C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E241B2896E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446501917EB;
	Mon, 25 Nov 2024 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtGERbQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7517BEC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537292; cv=none; b=rX53x0sM7P85OstZNr9DfaJffKofz4kVbL3MKM1H7nZxV2QQZBNfi5niWTFJ9GfDKyRDPePiqN+x3M088gDUP/9XQy8bFimhipIE/cXuBZTd09+UDYadFWd0kVYnd/Q+3DvmO9Dj08ITPIkGQIwTb7N9I/3oSdoOnYsOOe5en7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537292; c=relaxed/simple;
	bh=Xun8L5uQ0SPhaUj4P1wBPJtCieaRpbRBWBM7C6nWscI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzlCEbv+2dJQ8v3q+O7WyoMSQ00DtmOwc7TCD6SslRTyydp/vFsV1todjvVy4JyHB24F9XvrQvbGLWuBW3f476Bks/Bogq2YBVAzRTeYXkORvJVd/d4MSYeevxkcZGpL1/eXrZ1GQC7g+N8O5aYIEqJ6DqHfsHahUAtoRyRDYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtGERbQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP8gsWl014403
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDBzRlkGCEyYFmZ5YmtwhBflQYtmhi09NNPtB9yI/i0=; b=HtGERbQFnQFOzFv4
	Uz7ujJTSAXT7EXMgN3uKT3vyXeickcjmAyfD859wdZZAkCUOfG4fV0J3rgMMj4P0
	QsBvxJ29cTZ3hWFR2a1bajVLKJy9rrSGOgCljd+jsG1Gtz78QgokY0zpgyv8xMps
	hXQa2iCeTh77aNDIZAcvX+7q0LSw4IHrwKDbMVk2PvaLOthdAFvx40NhVPRnH7Rd
	r9VMBZQ6gtPmm9dNZ1fT1ztZundGV4EBbblKA7N7igeUw469O5t8/8ACOZG4Cve8
	bc660XCK9qxbONvjxyFTfDrYSKioLzV2NmR+M/FMfDSQ5aw/LllDnMpGOPXpnm2k
	Hr3iPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg0p8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:21:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4668f02aeebso2772051cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 04:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537266; x=1733142066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDBzRlkGCEyYFmZ5YmtwhBflQYtmhi09NNPtB9yI/i0=;
        b=kogG1BVHOrIzzhDFwvOInocozJ7lymJ0HX23C9d/DT60kguR6iW3sVlEabx7G2nnpt
         LjXa4qUhtBrURE676UQLGpGoKQLK8i0ouaCiACrhOfrA+ygM1rDu4rR/cN9BHFJbBfkq
         aApZ5ZNiahc4UKG3wg7kxkCM4OXRL2TbHMharuKNfWYnZb8rFwM6EB+tmhEIvxAY1XHe
         QCaghSzONIJ9460WYUX6w5Xdk00ESfgquG6PswybFUtXZ5scQBB8165b8bfu8+ZAVqVM
         oOK5lyy47OO/3b6J2Z1YRQDQOhBTvIBAKtRCyYhVMHYVTNiyQgkwm46n4jDOlSL1AfP5
         oKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNxGAHnZD9wtsFEv82JUv3ZxCWzkZbDhOU103olp5XppE0nZPx4N6ttDCnOS9rbJDxF0sEP4zvowhPf+TE@vger.kernel.org
X-Gm-Message-State: AOJu0YwM/L6q5P6LuFv/PA49g5MF85amiB8FKhemv+LMBHWeD3K+iqZd
	l6MKyncgG7RzHUtkBGMcs0kbU9DiuiRe/xu69sFsHwTkRhh/IIyvCPwpYx0zT+YRwjsh7MZrZ48
	n3Ov6dweEEF7/XGKkicu9ixgOFVPNxUjsBIQ71+LI8poUldYjxHabQISdCq9wHFsg
X-Gm-Gg: ASbGncu4Z8hPWQECb0+KokS0ZFEfWUDttQ/Z9xIDk4J8Vt1DfmFpHbuxl/0xG0phYQN
	LTfYPgFMloXjalbGx+bG0ahad6if7Q19f+VhA6YUWL2aVs7WHHw6clgB+5YDQsOoi6P4WfcCTHi
	7u1iL2t5DAO0vOED+nqQdU0WJ5iyLgFT+WgCZfSQQUiIeBO9fL7yJrMs+qskG3WiPnwsj7D03yO
	pWST/Ha+Y/MyEWZf8FQphKr/VV6BBiKLCFk312uCjPSN7C6zlq8WdToPgp07lkLB9h5eCr1tLCd
	rKRgcXMVrCFjuFqVJeY4qVZhYLVRVPA=
X-Received: by 2002:a05:622a:2994:b0:466:8c48:7222 with SMTP id d75a77b69052e-4668c488b82mr26078261cf.3.1732537265761;
        Mon, 25 Nov 2024 04:21:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG897EHQwM/DGNzZZKU4h1dAJu36wkURTvQ3FH3Ph9u3QiO5bPEdDagAHgNEDb2GbIGXUHf9g==
X-Received: by 2002:a05:622a:2994:b0:466:8c48:7222 with SMTP id d75a77b69052e-4668c488b82mr26078101cf.3.1732537265315;
        Mon, 25 Nov 2024 04:21:05 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01f9c2dd2sm3976328a12.18.2024.11.25.04.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:21:04 -0800 (PST)
Message-ID: <af6f4b48-7e9b-4561-818d-150fe954d821@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 13:21:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V4urbE11aCEJRrDfgpKSmKraBMDzWSCD
X-Proofpoint-ORIG-GUID: V4urbE11aCEJRrDfgpKSmKraBMDzWSCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=990 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250106

On 24.11.2024 11:00 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 uses the ATNA56AC03 panel.
> This panel is controlled by the atna33xc20 driver instead of the generic
> edp-panel driver
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index f25991b887de3fca0092c5f81c881c5d8bd71aac..dbc85aff50a95bfc2ac11528d1901979ec7b1501 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -407,9 +407,13 @@ &mdss_dp3 {
>  
>  	aux-bus {
>  		panel {
> -			compatible = "edp-panel";
> +			compatible = "samsung,atna56ac03", "samsung,atna33xc20";
> +			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>  			power-supply = <&vreg_edp_3p3>;
>  
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
> +
>  			port {
>  				edp_panel_in: endpoint {
>  					remote-endpoint = <&mdss_dp3_out>;
> @@ -475,6 +479,16 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;

This is <1> on other boards.. I'm guessing you verified this against
at-boot values?

Konrad

