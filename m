Return-Path: <linux-arm-msm+bounces-82974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1FC7D1BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C38D3A99EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB065186E40;
	Sat, 22 Nov 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAKXcywd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Myn19mN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457A5661
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818741; cv=none; b=N77flp5srJD1ZPk6hAOwcM9XuavOF2ELvT0Z2BDUDKrhXNo15kM8uBu0qmCQTW1a9zsA+5E7JkfUhZ0MqZpe6uT4g+IkGFSThsGTRhLBNqB+tyWbh3GB/UYQXNVUD3D8OGRalqxcSzD9kBJ6zEVt0NnIFw7qtu9e3h4tIFkA7g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818741; c=relaxed/simple;
	bh=7iiUDV5uYgWWv66PWt9aviOFITCMKNH/gMzmfXDIgQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/RvOsog+fTtD+aHzM2VA+RSZAOQS9UZ/bjhBrWAoNPwjlD9rz0puqJhC3E6bqCnFGXhhTkzTwLYlXnRV6RXxHyOPqwtuziM3yPW5gdU12W2K4rbWe3YY3hLJBeHmuqfomHxb5cMKUDCUFyjCgX8I4ShneIoM2I2z0EZ7ZNsKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAKXcywd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Myn19mN2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCbmVR2955852
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=; b=jAKXcywd+z1jj0E7
	cnufw1sRGGRNMz92E4JJxBl7kO1YoZ70KqpuVvC3OYLq3lRD8ZyBUV/6pAA0+qlr
	iETqzThzad9+bhApzcezGOWDBcAimalgE0dDmtu7dR/oUQPFIojT0gGoO6NJIJjV
	8+iMWQEoIBOseCS1vnX1Tw1VzR/EPQFHxrlzVTshJkvscowyRPoNLCbDK+J5i731
	4qo6eHLu3mHnvJgvqCH4hn1OSrZ4KBKQqpWo2zPVCC5gv+S5WgXYD+LJYpytDXVs
	iwdGVO5LQ+W4Edglz2U1cFb8m5/e6l3Kbjw8r3vEUBoDSh9ltHefOrwWmm/1XPMN
	EmxEsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69sgrd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:38:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5ff5e770so6138831cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763818738; x=1764423538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=;
        b=Myn19mN259GzXhYd75MRqEodDBiyRu5OeZvyYA/ADvUFMikzyoNgJsz0I7YeSVLdyA
         pQt5EVJOnAtjZDM12DBRqRn1yNRemVf221+SB9WHqsoZ9IF6Vlt1oDZ9rEUBx3bRW67K
         GVYciOKwTAH7l+bI15RQRTkH3g32JHrrt+WIaKk9OH4cJJV36wnS+zvfoEK8yNf5ro3H
         +3lJxnd7no9IxECUiLJ1aa7CO/DdZw5s4PCuG0L83hkdcDvXHU8ik6Yhqt54HGLKC05E
         n67BhZj3y8zAtCRE2gRVvVLL84BS77w7rKzLgn4fckuT9zLmysVjUayCenHSphFsQNgM
         491A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763818738; x=1764423538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=;
        b=npdIb7LXnCckKvWxAavrMJ0GbB5bHsAcqsPRPYWy6p/3aDegj/14pPITIzhsWNkIsU
         yQET62OQxldPpQMFcDMS9WrnBEAXTj1NLNHX46mVTGI/4voYKW+9OF6KPbeF3u4Ys/Fx
         UtxSrGrrGK/MfNoaPbZQtH3jOFI72TXwFR5mQSrQwmtYo9Ndk8Wb1MWgluyN+WGn38ih
         vqlIap6OsnvB7MUeEv4D+eGPKm6YyzpLO2/euCPcpc7rgKrejUEmlpoziiKCw4fBCJBl
         NNVik6r46zA7x/eXqlPrIgojspWf524Z0aigRKmxAbieKyQ4TWQvyjcI7F848szfovA/
         fXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg856tAS/+hZPqUY8h+5Tyl6KgblGFTLXltQmkCaV4Bm8nKh8jPw0B5RS67vy+DOx2ShPfIXfgzPvRMURW@vger.kernel.org
X-Gm-Message-State: AOJu0YweUHTYAUjPtcDajEqA5iOeMLJyEaPu6wrh8rFiz+Spc4KsfOgC
	jA19sVOYj/5rnHzM1GWB8Z/zbbiQtcWJSwfnaF1PUiY2ARnlWoZ7JfgSKRRksIqYZiS0GXnsiGh
	/JH3kCnCp01VYRTPS+hDzd7ZXHrrld1x3z5oTqP7/YIxAsnFwoe/gpdgmQ22gGYH6MGvT
X-Gm-Gg: ASbGnctZRiY0rcpFbOQfk8nUKkuPtngT6yC3Emfa6Vb4Vkfqh2JOAU/E51jQ/tW/n1D
	goUx5pYtJkm50vOwxs/A1RY5A7XEsazoZnxCJz2PUqfSIcrPqkPsm5Mi30XEHrZZRpt2+KY2aCW
	6kAyE4Hw7BboX5x59DL2+2iaa8Acco7gtqTlWukQCVa/G3kmGj4h6SFoofvOqMMHvPB5BK39r0P
	vgI/sQIo3FzOwu1yz5fIZGW9wt/MjA1c6Mll/kw8dE2J6DqLLcMPQRocb1/STgQmecIrLtP679r
	ZqDS+BQT2dsvAqlrNmA2vszR6r9a5NrpedhEXvA2oeTqwwHnGVn1/G9cHAf7jlQFFnDs0nxw+pd
	u0R6XYjaF/vQmDSoWvE/VukDJXm2jqENRA8YlISg9mxKa7VvvtiUJzM+qUVjj9c8ih0Y=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr57436751cf.10.1763818738322;
        Sat, 22 Nov 2025 05:38:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2lPPngRjH98213/0iV6w7rCFVvGxRvqEr5IE7cDS/Bmlf93oCCzqTQwYTweMRgaNxHpWPVg==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr57436521cf.10.1763818737837;
        Sat, 22 Nov 2025 05:38:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e51sm735525466b.42.2025.11.22.05.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:38:57 -0800 (PST)
Message-ID: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:38:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PNMCOPqC c=1 sm=1 tr=0 ts=6921bcf2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S4gWedWR7TB3ctbtemkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9rXr15d8xxVWOvkdUfr1tbWZ1i6p9m6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExMSBTYWx0ZWRfX/n3wrA3R/I/Y
 y5c3j9jE+l+iN1GsyDVmsYhkOt2cPkpn/z3QaasT+2N8/G2naXvRSXeU4xio3fNWETAqznYnqo3
 TTsnEgNDWtqs0dbB3Gxu1GS2hrrHMhiACdr/HZCGCz29WKT7iwNo70j4Gn9zYsEMCs0+ssInWO1
 VMYW9agoQcbhJH7yTchhZ2eoX5qLT/+oNWfYcPCKq9KiOLGlPK5x94RO1TH/i0ybG97Wqe2IcAH
 y3QbQdg3BUy8CKqOuVLa7bQmEzNSl8zeeHjY5YfGGrjQqsKKfPMQnOU7mxoTCe34NkenaGcT94i
 3lipDaFwbnZY9EBHpqfmPlYEzwPRIwvIosaZdmwmXXTAqNJiSfT475s5yKqh1QrbXgKYEBlfF9Q
 pKgKM6i6gQ777cWKT7Yh4NmRtgu34g==
X-Proofpoint-GUID: 9rXr15d8xxVWOvkdUfr1tbWZ1i6p9m6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220111

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5903cd891b49..9662201cd2e9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>  	return 0;
>  }
>  
> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> -		const char *name, resource_size_t *start)
> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)

Can we drop this and just use devm_platform_get_and_ioremap_resource()?

Konrad

