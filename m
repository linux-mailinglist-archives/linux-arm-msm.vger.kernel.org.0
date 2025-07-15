Return-Path: <linux-arm-msm+bounces-65013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F4B0576D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946763A81A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4FD23F403;
	Tue, 15 Jul 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMqEb0k9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A352D6400
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573869; cv=none; b=lJnVvT2Gs6Ag50onCPbgPWvRXGh7lYN97rcWX2mR+Z4xbtRBQJqihlaQAnc3TACz98Oicmjkit2LQSBqIeCEhKyX6QtHaUE8HEkQfVCsiwJhwoEI4sUvXF+cKCU34lYLTTHASMDHaspo6Tlc1+uPX8RDbXV+Xf79dZfbjtaj2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573869; c=relaxed/simple;
	bh=BNgJdx2kgLGA+3XaVIpYoIeQu4ysU05k9jPfvfGKAYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqLg5isClWjHGeAZPZldEvGKBWHwwQzUTQSLGLGOhIZ1LJ/bofW7yOeTNNdfLjP6VwDh+sfuClLZ9sAJ8HHGhpbZdn6g0gZald6kLEHlZKRp9i9zI5uZB4wLhIFuEcBW9/RnFULCyNNHY8MyWBzw30MojOHhXlg50EBYZMxWawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMqEb0k9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8VGIE006695
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHYSJD27uvDlRUQTR51LeWjSN/YPjznDBPWdLD1taHo=; b=fMqEb0k9eOsvPtRq
	pgvyCg8P1RYy3WiwKPOu3hnglFNcOIKalBAIKpJFwvy9Edf5SD16CyGWB1j6KNK3
	wI1pFEitRq2zsqcLKcHn8KaJaR9C62cbR0hxyO0Icz9tF+UM6fbCF7MW1zPCv/y1
	IaBKsqfrFvrJ6l+lJ/dPNSoJxsGvmBu4MEf1tzgUUCn0xnaVbwepLQQjWna939WK
	2PsSQ6hzVP9RvXzzmaCfhvLtE7f6Lcvm0FDy7vtkXDO4Y+7ae28ubPcbtpTJ6r2r
	SFMoUVunvGXifOs/tf3RLhrNQe5V2z5H+PcRG4YUJD3CQQGEC3cKWX6LmwAeg+Uo
	eaCPgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu87pxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:04:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e0003c5851so27796585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573864; x=1753178664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHYSJD27uvDlRUQTR51LeWjSN/YPjznDBPWdLD1taHo=;
        b=DthVjooddBAy09uof7jnnYY93gLZ3cjnfUaHky/jk8+KaGm/FRHnpTLDZdb6JjG8S6
         qOm9Tg7Jo8JkLuzH4QqNPP7HkcsLAr9nrBmnyezSN/FYz6vN4IuT90kSb2maIz4kytyY
         qo4jdKbsB7yxJBbJhw5P3SWlbJtnd5WiMYk7gu2+fMloUKMXq7syyytz6q+b5/57O3jG
         DNWgJ5ysSEwpksQ3Pj/w0hB7JhOs51vkUcvySjna6VEiVxANfzJEArIhGmY+ljP8/E71
         o+bjQPt56hmRJy8Z0K9JEeDAYlzCR6siOWo4D1jahi6AenPghvNAidZEFa/xiF+C7WPa
         STVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV2eILu6ZSJdt7O5tk30Pz4XM5wHWK3bVyli3/T9LIjlEiQILW0qrqWKOyn5muoNAoe+00oYRwWXD0p/zp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87JxZg67N/yO2axrHDgjO/qqphcPB3TTf1Wndr6grb2nCcvZe
	LcZDjPwlfrr5h9EF64KPx9Nlmlrk/Sy5EDRnzmcCTHiR0NlddgXj7KV7Gygo0ceSu8T4T+BzRM6
	AVkB/stUAlD5l3kXkVrHQXFqR49Zg8SCPtwrFd8jbC/7twfuZTxJVIXKhhVW+4eGUuBRy
X-Gm-Gg: ASbGncum1dmAJt1TOagjFmeUkow+oWuN9gHAwq5NXaCSqi/fO3mEXvUp9BtWN4Xix13
	8aT6DWF+m5Sz1WG2KXfWAG9oLYWw3p7D85j/ii9K1B3D2F4NTQHei+3bZBKhl0Yy5vdMK7xoHQW
	hIPh2WZBzgAq0n6TCgb3vsVyq+OWLfrB/q9t2d9gNlxal3Dc94Qs8zn2U8EgmLJVuBqYToN45cm
	UfyyJcUfA/VN6sIkLYDQH0a+43qVpTiEKlJOaarhs3mEH9/Ek4SxuDoPgaQ8C34IMjuUApI1kLJ
	VfbWe9CUf92/WKHXvY0vYhGGW6MDa6UdUE8zCZe9wDKK8Fd1gTg9StjgaNz91uwEaoS9WqMJjDK
	BhEY/uicaZdxtssOMlytz
X-Received: by 2002:a05:620a:6405:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33c64d5d6mr50124485a.0.1752573864547;
        Tue, 15 Jul 2025 03:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUyozA445ADYpujI0kmNPEbeGrDOg9nc9SAGKkwFmSlzeir/EjIgg27sen+sL7L37zz326xg==
X-Received: by 2002:a05:620a:6405:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33c64d5d6mr50121285a.0.1752573863480;
        Tue, 15 Jul 2025 03:04:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8313036sm956336766b.180.2025.07.15.03.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:04:22 -0700 (PDT)
Message-ID: <babdaa54-8804-4f20-9847-9105cd485538@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:04:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: i2c: imx355: Support devicetree and power
 management
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5MSBTYWx0ZWRfXwvjM3nb36jcf
 i4VHL2S4zLae6M8oQzhc6uaJu9v0etyUgXBFmz/GLB+iHkrq1tRBF/PWSujcIyb0+Ee9ccG08eQ
 Yvi3bxPnRDTtYWAGnhzJA/vFvJkyVUbAsljcEmr//4qn0MMyAE/3wNtKRn/KtAWjpVuOJQw5xBg
 sPwZcb8NHhGUbAX7qoLVQqhIEFL8NJ7HBBlPE17nbxNFkbHra6K6Q2unOnOGigh6Ozf6zos4Dmh
 2d4f7knRtqpkyBK44ZqBqJgTkToHsZu3eEiB4/m34Jkkwbm2NjhMkaKZQVVj55V99tjeGA7EgnV
 5sgFKM/YMMnkqhaGYOfNk4VtGMYu1htJRD1KAL70NeVExKmTcsTDGuaXgke0I60tGEg+HBsL7nI
 RuNkVkNP+88dSNdmwM6AryhI7opjWcP6ltacmucZ10Zrk7Jh2k/XFuyegQmGj3JABvo8Sm/E
X-Proofpoint-ORIG-GUID: v09k3iOv36jI-tPD_ugJLtQMO5wTl0YV
X-Proofpoint-GUID: v09k3iOv36jI-tPD_ugJLtQMO5wTl0YV
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687627a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8
 a=UF4_Mx3OVNFJwZjtfFEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150091

On 7/14/25 11:02 PM, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	clk_disable_unprepare(imx355->mclk);
> +
> +	if (imx355->reset_gpio)
> +		gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);

FWIW power_off is normally a mirror image of power_on (so one would expect
thissequence to be reset_gpio->regulator->clk)

[...]

> +static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev, struct imx355 *imx355)
>  {
>  	struct imx355_hwcfg *cfg;
>  	struct v4l2_fwnode_endpoint bus_cfg = {
> @@ -1648,11 +1715,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  	if (!cfg)
>  		goto out_err;
>  
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &cfg->ext_clk);
> -	if (ret) {
> -		dev_err(dev, "can't get clock frequency");
> -		goto out_err;
> +	if (imx355->mclk) {
> +		cfg->ext_clk = clk_get_rate(imx355->mclk);

See:

<20250710174808.5361-1-laurent.pinchart@ideasonboard.com>

Konrad

