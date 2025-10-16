Return-Path: <linux-arm-msm+bounces-77598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE652BE3E63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A9874FDDCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEA733CEA3;
	Thu, 16 Oct 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPP33xnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9733EAF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760624692; cv=none; b=Bims7kDEUsTKpmBaXZ85xo7YiH6Z6gIUOZ3o3LZ18i6V1IzFWkqf3jWYyfomL4R7fYdSN0gmf1RThy3Hx1HOH+RYThu1g/yZ/ehCWfvTikKQos7zuKpBlRhIJnyrtw/1tyBUNwaQuEvaftVX52AEbVHHX5zBSnKwwihxT1QBV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760624692; c=relaxed/simple;
	bh=NzwL7kMyuDL8HK7k0VWDNm8cZ0DqXRQGUdp1s3bKqUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHUo3JX1ce84z8tSENrw+z5mgUEaZ+yJAHXjpGjFpWGLoa22iEM6m3WTNZUX+RSgpqjdlfcHcbKM1x4GHwgUOZPapD88kdblHcUnpGa9O8Kf8mh6AdINlI/jv3G1z99ooA2v2MfJ/fphX4uMBkEdK3hEVINGqNJLkMo1qvv74s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPP33xnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GAJkh4023174
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYxFtwVPrpEIQI1zK10YVWHnFZH1g3euqyuaohsvw1c=; b=KPP33xnO7ExkhhSu
	BD1z255otm3eHH5m8BsEP0Z0gRPr7is6fOtzKurPP9v0yMIrCJESQZ40AROMQ4Yq
	UGJESLKBhZNop3kalGH6B8+tU9vRij8KlQDVWzt/WoLF93K0MIkWnTyVkXksvaet
	Lr6S7NWXCRgiFbsdhcySDkIFSLcE4quKSGLNNZ8QG2rzgEXsZ6RpUaIvuzj9IVu2
	u1Fd6plKcdTBzydT2bWxRC8RtEZL5s3uOhZMVsAAF2AJ990/ozcg2C8QlzblrF3P
	a9P/b4bW7nIrXD3e4AdgQ/rYwfvvIgsipC1OfpqsOD0bYzGa2Fr4ufrV1CZFSk61
	bftQaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvphy19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:24:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8906059f6b2so36774885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760624689; x=1761229489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYxFtwVPrpEIQI1zK10YVWHnFZH1g3euqyuaohsvw1c=;
        b=eF61HZpBYgQdef0RufkiSjWG4wB8p7o7JF6yGNmOeWS1FxpmFGLEONmJMbNTIdsi7i
         ESCiUnKPrDo/Htd9RD5QCzq2UH0A+4Pwv5yhICuWjzMx18SOMRri5jiTH7NKqBGGSAn9
         /jdLJmJSsovjzND/FXGEVfQyVvujF0Uk+r9d5RAufJueROzVC5JLbsHUASFsC/C21zD/
         2CY+/vE4sme0egjpKn0vc6E4JKLanHuHuSS8kP2EZcNJcXqY98sl569uQ+JZhhlOx9Cw
         7SkW4q52VfhvYeCvqZpoWsoMlL7KpCdskhh0MG1bKqFcYz6kRgAtgzdeiWYdM4nWJ/vI
         e+2w==
X-Forwarded-Encrypted: i=1; AJvYcCUOf2W07G3RKsrQJwPYK03qKPn+TZsGag8CoACg8dkIbza0XtTs7N5yqR4uwmnc+x0c8uRaia+1trE5EYoh@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMLLSVwSCt9M4da4WbUOM2TdQCHBbirGa9JckDtOBvFe7sDxy
	24EYM5CSGf1qD3Q78bl535znIE8sMQhZy1Jpf09UdGpBlECyW/nNT06mrPADWp7OtM+9QFE2UCp
	LnmOVZ3DMtXz61GGdCenLHpJq2I5h2i40VsGUJMilLkplvct8DS9kv35O7dFb+0Yj71gl
X-Gm-Gg: ASbGncsO5XHtjhA47RQaNEoPr0IWDfHlIvWgQSzLnMOiT0Ww7+3IuGxLBbjYHRL7x3P
	CLFXO4OXbsGYHij4wfGnygIbtYgxbbbSvhE+QJ+x5k+A4ZYwHCjfl9Xa4VNx00TnMT7EqjvedEd
	VN7SOw4YDFeCx8IE+pvJ0zGGL+a4Besy5b7crM2Dg/k0a5nsx8bPCD9OdV0E58CLCfL9f7tSR3o
	sOaTuv3zMsdQI2jlfCnBPDwZVUlB8gwYgufVrCM6J1EbQ1npBGoBCkNepgV3GE47wTSOEx5vJil
	hlxnMYvpwbHyHsP9AdP9DAlEai+TcN+dqE4XzMdXHw++XJckje8bvE76nzprH4X94T7hMy9UnV/
	BYaJHQHdwcNQ7SAdRumk+QDdT9g==
X-Received: by 2002:a05:622a:c5:b0:4df:194:b479 with SMTP id d75a77b69052e-4e89d3824f0mr4286411cf.59.1760624688841;
        Thu, 16 Oct 2025 07:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwoqSZ2hBru6Xko+64E79ey3lurH4UlOXMDwxvqHZlBSIPc76bdY6nqQzxg+YUuWg6+bXglw==
X-Received: by 2002:a05:622a:c5:b0:4df:194:b479 with SMTP id d75a77b69052e-4e89d3824f0mr4285971cf.59.1760624688301;
        Thu, 16 Oct 2025 07:24:48 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-471144b5c29sm29442725e9.12.2025.10.16.07.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:24:47 -0700 (PDT)
Message-ID: <c6ae5147-7ebf-4a17-9006-edf6f57a8689@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 15:24:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: sm8250: add qrb2210-sndcard compatible
 string
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-2-8222141bca79@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-2-8222141bca79@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f10031 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h-EO4oqJzKyq0k8zFzQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX6m9t99vIZRYU
 6+sux2urxdNSWzObNAKmyrRHQjYwN6Dumede89P2q8SNm9/AFl8Mdqzhr8gU8SLoevuHAGIKSsj
 TFiTCMNTa1wOEJ5IRqznODGbQHG2w5dSuJuNA98NUJS2feoaZWCQ48blL0YMzfvVPBhKXg1sON2
 3rQ3gDyeDi5Mf/YANCbM4CYBrwyk1iaE1rZEP2O7E4TKPc62W4XKNy150cx1hgdcRFyGF2KUfTW
 2jsXI6jsJCoiQLWMNihy5mOzmgfXLQbOp/gEREPXtaE4F9BM4+s5bz3vmG4oSE5d36A+FVfliRw
 eol/7PcFV95kWKaDUGMjiV+DCLL2M1Gp8L+O088bNzbY2VnYZ0QE/VRG/j/PGYeX/E4OVNYg+DU
 YYHlryrNqWdoMecQzhW1NoeFc1gp1A==
X-Proofpoint-ORIG-GUID: H0i8cTzUEaYT_qUaTM0jL2hJ19aO57ND
X-Proofpoint-GUID: H0i8cTzUEaYT_qUaTM0jL2hJ19aO57ND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017



On 10/7/25 2:26 AM, Alexey Klimov wrote:
> Add "qcom,qrb2210-sndcard" to the list of recognizable devices.
> Use "qcm2290" as name to let UCM to use it later. QRB2210 RB1
> and other QCM2290-based boards can use this sndcard compatible.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
LGTM,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f5b75a06e5bd20e00874f4cd29d1b947ee89d79f..bf71d9e4128873fd956750e71311a357d60099a8 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -210,6 +210,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id snd_sm8250_dt_match[] = {
>  	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
>  	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
> +	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
>  	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
>  	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>  	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> 


