Return-Path: <linux-arm-msm+bounces-40625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1819E6038
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABA9284CD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618881B85CC;
	Thu,  5 Dec 2024 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqteXwO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25AF1AD9F9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 21:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435200; cv=none; b=eSdEzSeozlAMJvifqbBl6DR75A40myh9TvjJbR7KPDGWo+Wf5Rm3yKfq+L+moRI4IVzd7d9pIjTPoqmtA0esdftTdPAws+TIHeU/pyK15lmpWixZqLLvhaHiaPuMNvieIgIBUyIF8/S4xjbUJQt9wzkM4WV6qFdxo+m8VkIU8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435200; c=relaxed/simple;
	bh=NOvBU5kPr//INWOr0+0y9QOrcf9NtMLBo14Y0ptvaiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTYpYLxwMw4ivr1N2ZGLFRQrORnbptYUAKgJdp7bGIAHuHBAQ0/3QhJ8nwOWHbf71fYtCxVjiw8qMbQB4Kh5nog2abwMzdS7NWB0+ZmoM8E/cVONDlzKhrNHZCp6/WDUwofg0pIhHgnXYMzY17/xSGb66xd7UOyw0rcTVlzuNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqteXwO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Jhlh5018707
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 21:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klKiOTWRYLpHJsIA7V1xW4E3d1Zon1XQRRggfmfjlrs=; b=hqteXwO7JDZmSf9M
	LWy1w/6A7FepABguTaxfmzqnPT9yvQSZ4iSnwfar2qhLo+DJQoGajsw8TyL58G79
	CvT2G+wLgtND44LFSc9VAg1CoP+w8SCqQ8PUaTFGPENbKXn+zs+tUOqTj3kTzUw2
	s+j9VekxL6kPIQLn0Ez2PeCa+UJ6LNAEgwj8qhJhQ+Dvrpz4ojP94bjkjwpjm/MJ
	Tz+9h/okGRsOSZv5npRn6vJpJI1wljPu+hGg1uHTp1lMwoEt97y7K5k9CvLkA3xM
	pk15D0NU8lOIJskIpTbqDtwln3e/nQJgR9hFgtp6dpXTeCtCFJEfBDkXkEDjuu4n
	/Dmmmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8r7q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 21:46:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4668c9aa8c7so3533801cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 13:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733435197; x=1734039997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=klKiOTWRYLpHJsIA7V1xW4E3d1Zon1XQRRggfmfjlrs=;
        b=OyVWgd0cx7Fpr60qPdc5PK4+5sxarHc+QlX8qRDoEdplwcak2LnrT485MPZVhz4D69
         XFhxzYpB1c2d5peUHGLbRt1CpmHEiug4uT85FZQp9WtzLgoZfvrNnAvVZNLgHJ9O6r8n
         QBaxRJH7AZCyIQBA7t6QKxF9JvvVi2vR0nxchZNHjJsuEOzTozY9Px0ji5oBrYvwHUil
         7wZhBbRL8rbIU+m4xgRpwS3e6CV5u2zE7QiiFALTd+LXx1tjuaH/d6sHjqh6ga6mQF3f
         DM2wrZC6edsfo9WswE165YlX8zn5cRud/M9rWwKFfXD2wk7tmOBQQruzDzj75kO4Xcqb
         LCYw==
X-Gm-Message-State: AOJu0YzaGuKJPf13AIWuoox4ohzBxkSGsz/wVQRl8Xf81vzGa8fnSjSx
	xmp6I7s6zx+VsqUx9wAGOXodOVIdtrKKbanUO7UTmKg66PO1qu2J0rGCjo2kODli3gq8j+/4t4j
	X+iWA4cCQq/hGCI0A5CQqVGD+gyQNrBKa3vUxQzjMfCIf0FC51vpyzzZ1cX5RS9CW
X-Gm-Gg: ASbGncu2hSnTzBI2i//QUU/T6Y3XZ9UoUrsDhHB/liXm9ZrwEqzA5dR6xLjSMezAa+x
	RlZzTK51BxqljBxs3t7JKMe6K9Qv6DN+d71AHIZ3pX+pDq6TbVgHatGg9mWWDIJ1qRxmCnbpqLG
	y6crHevcpb9hlTVhBRxYTkFAqewf3lDpKkAoDavERenJ8yd+ep+Z/IeehMqkvtT8WWaIwOP80fB
	qIJsN1ONAVg8hWdT5xNRtZTYHq7GlmLzvzX2WEFdW2+hs0aM2HJFYh5p5Q+hwRILseaLdhVCJo2
	+oARSGCKXuPJ9ql7bHvK6yNjnBs3cDA=
X-Received: by 2002:ac8:5943:0:b0:463:648d:56 with SMTP id d75a77b69052e-46734cbceedmr4793961cf.5.1733435196946;
        Thu, 05 Dec 2024 13:46:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8DilADacg13bVlIRhRs75Bxsdhk32J4YapDiQecr0yhzNtzVm6UbqIkKibQ0R0Bj6FzmCw==
X-Received: by 2002:ac8:5943:0:b0:463:648d:56 with SMTP id d75a77b69052e-46734cbceedmr4793711cf.5.1733435196578;
        Thu, 05 Dec 2024 13:46:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58e0asm143634266b.5.2024.12.05.13.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:46:36 -0800 (PST)
Message-ID: <466ea213-5f20-4a9f-a9dc-751756792845@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 22:46:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-2-e3d13dec4233@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241127-dp_dts_qcs8300-v1-2-e3d13dec4233@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G1eHF-QTV8jPNCy_EOet1pRzXAquCU7o
X-Proofpoint-GUID: G1eHF-QTV8jPNCy_EOet1pRzXAquCU7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050162

On 27.11.2024 11:45 AM, Yongxing Mou wrote:
> Enable DPTX0 along with their corresponding PHYs for
> qcs8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

[...]

> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";

I was surprised to see it but yeah this is real

> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -223,6 +235,30 @@ &gcc {
>  		 <0>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
status should be the last property

> +
> +	pinctrl-0 = <&dp_hot_plug_det>;
> +	pinctrl-names = "default";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
> +&mdss_dp0_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l4a>;
I couldn't find the reference for these, so I have to trust you

Konrad


