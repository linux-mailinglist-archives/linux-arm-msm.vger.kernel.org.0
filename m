Return-Path: <linux-arm-msm+bounces-72492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EDDB485E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E129F7A450D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA0F221FD4;
	Mon,  8 Sep 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azhN1hsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07252E8DEF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317391; cv=none; b=tfVngqooTnb3v7DCoXI+MLB0XQhskEgXF7CG7Jt5DIv9dZ6bx0GmhQTC5lw9qxgKB0twIEjnUJT8A1//gd+Pc8OkmdpTFLTXeF0AVF5kyD6R8nR6gbwojeNM081/x/QD+Mvam5TuX15m4g2Zw4i0fJ/1zHW3t0AjI9KavW7+2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317391; c=relaxed/simple;
	bh=WYg45bgT0XRN0euq4QCobxp8IotvXOVZG3lh3FUmcVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0nQgmlFvn1WRp4mM3gxJCHTc43PYlvuKyGy7zhckucdiLWcjrS0YyPlWfIxar+FmnMXX30wxxl2uox7W375h5KS3dNQXPjs499GtOykoA273SQEdWeQyobf1bfuA9Pbc14YU+hYJjhN5Ap4mxhkBVze8XF67JJnoX3Y0dCU96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azhN1hsC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MlHE7021523
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1grmPgipKFGWJ92VbKgO7RBjzC/AoySVCE8pyMqTBpA=; b=azhN1hsCVGW3xN9R
	qqm2DukADn+E924Sqz/YT4jdrwM1TmQWOMC5Ve3I9HKQUqnt4uZznMwbqIp9GEWC
	A7ztNMDfXG2aR667ua+FQoVHEfwQ7TCwfalb85O3/KuGazvZXarDkIBXirZdMYw6
	EhBpVPTY0+cemuOTQxwBgPNYm8x9TXwK9dARAbaw2dGO/DHjPpbUv7w6vK1GGsvw
	ydQcZK8sgatnDoX1yCqNLOc0IjTMirkh2P8jjEp7ppwW2yS7L/ORf0GinaRrRFH7
	it0nG1ontF3vliJnH68uU8TFtmWbxiUwzCxok5kR6QrScto3geAbvjxHC7X46p5K
	GOXOTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8us4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 07:43:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7224cb09e84so94326956d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 00:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317387; x=1757922187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1grmPgipKFGWJ92VbKgO7RBjzC/AoySVCE8pyMqTBpA=;
        b=NGX5eTrX6OCAoETygkYgY/UYIN12SAzLtGjY5g1ubDR3EJKHTN0dVKVrAv6gcHOw8k
         skUNzE0ihUNtve1zkD6bPzugTevVnAcz9Ui3Ub5DGPFk1A1fd8riv84zoYyoSIF2wPqg
         o6qriCFZSOF7LsJ4PosHFfVVpVlF876kvBKTVQBxLffn9YrpYlYcXvkNGQPLaKCOmkoC
         qtClGoAp1g9vjF5BTBN4oLaiUvqhelXeFGTDfjhpRf8eWX6JOUgHJjJSTV2KqBV35zgB
         oCGzSpsqUwueifBeLKp4WwgR6M62hkEhg3u18VvCQopEJeFYn6ia2EicoZak5qsFdtx7
         tU6A==
X-Gm-Message-State: AOJu0YxE0RFhq0Uz2JkQyDRSBQzWmoVLmFDbfFrpjjt5DvE7ob4YooyS
	EXfW7dLqsDZF50YiJXkEJnswpKdddTLdrnNx1uS5BF+t1l/Tl1xdXl7XBhUeOW+8YXqm5VZCZrs
	h0m57qFKOrzoZ/5IWdxNMuiNySODtNlAm3L6EdhOCjhKzwMsqKjG7ox9aNT4Tya2qYXpT
X-Gm-Gg: ASbGncsYXmWXGHWqn0JRTLEtiHl2dD5BwdbtNUmIRadWMS4Bt9BbgJKIzd7886Yz+eC
	9D3IgUoJts5IAB2oNtYestN/vO0TFMptJ5VCpFq75Oei707/RqtjBOXRInZukHZYETGWrLAmwaS
	hvwrvuqsY6NehkypqyLqMH4l6bkGBK8c7eOtb3avkGWn0w7nYvZgQIbLeY40FHk9QVBL7mGvt+P
	Jn8VKttPqk33Eegz5hVCvCHIiPRsg8Iu4UjoegTVFpnQTu4rK7IkluvzfaIqr1XYnDXYJpdp8bM
	O+4kcDdNyUmKPznIWHsITxrgPNq/m17IIW9nGYIQAxwyDRNmhwOAeyYzm/yOD7PrF44=
X-Received: by 2002:a05:6214:ca6:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-72bbdcead63mr126284816d6.1.1757317387159;
        Mon, 08 Sep 2025 00:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgAcdbDq5zNfyipOZBWdCcXswZ41a9jDEPvBfo2g42KlKJ6RgThA5OuAMoeYELmzFt39Z6Gg==
X-Received: by 2002:a05:6214:ca6:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-72bbdcead63mr126284616d6.1.1757317386708;
        Mon, 08 Sep 2025 00:43:06 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm225190345e9.13.2025.09.08.00.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:43:06 -0700 (PDT)
Message-ID: <9842b149-0c39-4114-88dd-2fbd4423d077@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 08:43:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add support for QCS8300
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905142647.2566951-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be890c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NPwD-xthdEbpHelLTGYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: njtVzj_i1uvSkLn8LJfieu8f3QeZeHL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8JCq+dVCX76H
 GqUY6Qtw7/zt1YeYnUyIWvyK7lESAaVbpALKtfAQdPDFEOcf8c69c00BPDSta0LE8fnUXlsj+bZ
 CBbyq/AQsN5JpihyllkdYwEmLpKj2e53r4ByfnNaUj2BhrXXXDZJKJhDjW3XU6dWQssER/K+kW6
 sDsiKcCtVEwbc9rEaqxCAm98YtF3WoFA9gX11KYgdXt/jM9TbvcctFUXjE+q9nkfmXNasvAhH2D
 bPjr4XY4qG2ZbKTnB4hgwRWU7t/fMm2qwvc4dAkCPxsuHAuhLPi8vpyWeO/nMjzKJbDP8OtBfgG
 1URevLrk2ueYg9dyYdLvTNEJSVx4HOQNdm/5tZDkWX2wZgHuS7BZ3R77OfQX/imKx+kNu2JjXCL
 PxTHa8tJ
X-Proofpoint-ORIG-GUID: njtVzj_i1uvSkLn8LJfieu8f3QeZeHL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/5/25 3:26 PM, Mohammad Rafi Shaik wrote:
> Add compatible for sound card on Qualcomm QCS8300 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
>  sound/soc/qcom/sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..c6aa62b1f66f 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -187,6 +187,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
>  	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
> +	{.compatible = "qcom,qcs8300-sndcard", "qcs8300"},
>  	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
>  	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},


