Return-Path: <linux-arm-msm+bounces-83774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27852C91F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5BAC534EFE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E18327C09;
	Fri, 28 Nov 2025 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl6wxasr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLyRGSjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81345327C11
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331746; cv=none; b=Nb5QNgTFcl+CutvlZmpsvHcG1Fp9vbTa0ebT9ajKX6iSL72RaHuXKQdY/YsbybS1btpmqxZSWo+H6E+hqpTKXcY6MbSSxqQ0fnIcJRej7qrLmQTpLh0Ts1FYAHNb/8gBkXTHdg0KetTdeV9yTFNfr/tRdMRoGwH6YvS2aKhYvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331746; c=relaxed/simple;
	bh=ueLyq46JDjBihegO9qj7nvGBPhhfHALgUnFEM90Acb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1xc3oIR6sBZdTDNvLEjt5pfRFrFcCuES5hRr5Q1i5Ckj7pPuXWYiOjEHSV0cSO8FjpSK2ABl53CvyR/bLKk55e0BT1qXeEICB/Pt8ZRfxg7Kp9PzC/toRw9loRI7imidhi7YYy+2L4OZrxVNpvrgC8eFWMj/Jaj6SUSN6AOq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl6wxasr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLyRGSjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PKLH4122298
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=; b=Wl6wxasr5uWhH+yp
	XGPWcbtqtx3qebtX19hT3w1qs3t9v0S3K3pr1tjIk7DLXghxMbb9Eg1vsYLa6esK
	mmY+61Y+msMzPumjPb6Jy96QxhIRl63IaVlVgh8WKtB+XiQVVz7Me6qM8cORra/J
	aNWsWRn59rYFGsiPiF7oDUrRkpBSkJuUtIhfkXbBGqsW33EahkMOsumFfgqa7sjh
	YVZXzdOoNbiz6yM+JnTqYZHifIe30h7Uq816FA6vuca9wxj+gibSle85lB6R2MxU
	W0Toc8vZiTvE83l1WPTAV43193Zdf2fDHx3uit/kfDy52d99UtcBgX+EABLPElvO
	oOoM+g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61uc7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:08:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dfadf913a8so166545137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331736; x=1764936536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=;
        b=RLyRGSjEn9LnHZondWLGZmFvMqoTL9Lq+pc8K7OGAcIrpgrVNIRgJRUyyWPrt6KVvq
         xCoyebtmopiNZWl/z0spIBKZApJSYOD1h6fHmZdBv76A6q7mS5vKl4KUeyLSf50AQJ0z
         acEAVfKU3FHxH1S7+9HtVcp99EoBpUa8D/uY7yVQZSuSRx0dr3qDEkVSutapWQznMH2G
         x7708Pe/5cq2w4J4YYAzsYEAWbFFEhq9R71KS4jpAjwUqjD0H8vq9uYLdpaoaoHZSqga
         AhrGi9F8Ms1kF+eSIpnGh5V/4X1R8RWa3Z+JS/Zg2TNnzc0vQfRYgRQ8op5QkN/JfH8w
         o9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331736; x=1764936536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=;
        b=LbfF9r+VYLj/Ca0X9QYohEfwTyftkI2r9Dszx7AA9BzU7OTC7PMaHxOWb13Kw15i6U
         ZGjKCNRVNcwBtp0wSiQj9R92B4p7Wfzq9J1FjYMwH1qBD2HoRhmfI65URs4mpmqzAU9c
         fZi3d/1e4XU7KRqEm9hxIPuzZbWc5wmyoSwb2iceNqfONsL69XjyKKZzUzBaFcXvHVSL
         7sL2FrzTK6woj5nwdrKp9qZs3QJyphG43w3fxmABH4PDjk6Dw2BtHqcLTcFwmng0+4yY
         e/7yQTVlprfynu+fehqlnaGj8EYdw/T8rCXdEViLwTNJYrCaSeqjX+MM6C77n1lZdyha
         AfgA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZNUmcHqDTLo3uqMZtUkZZ/ADivMganaCejEPkHrcanr9K9b6VF9e0WDwfGGvQn7+mCMOmx+N9mxtTOKP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8YtkyiEeKJzzEYyG5zF6KCQ/P7fPYDcLGUr3saqGrPuSuK2PV
	AJtpggraYcrY4ne4p68OPfhZhcbf+MhnoSvx+BL5PrNmK5ogF/yArVwWyBg0MO3p6BdrXWNozfA
	aEWtW8nDxWMKlINKXEIzgGMoYbQFA5iskXRKnlZq97oNS0eLQxfMOp/00OT3XoLRE9c08
X-Gm-Gg: ASbGncvwlQQ3MQUF7UEh4cpLrBTSk/bB/lxTxepuuW7j45HYAxMREM/V633Pnx1GvT6
	PJX5UWRJ+AAtMaThpBrKNFUjCOfS/wGsE8i4l02yoxdkMHYO889SQ6stRxI6UwGRZIDGmshHxfY
	0Dfl6jYkdgE73x7DsJGR3KY5QNejAoHu/8NaTXnoy2cvh6r87PmdNXCub51Rsco9PrlU1xP+1mT
	TsR9VY9B0/KkpQOrjR5SCjgXnYL3uau7MlEcr1vm6ZfmJp0EeMjCq6vHCdhqshDHJUBdv9oTKcF
	4eu8vPTNWcRiA7VXXF2949iZQBbtQ5Wd9hLzOzPbpHahscPWuKFV3B2lWCtbl+/n636f2m7ocZK
	NOe9NXAOBnKpuLvacRH5SYu9C7qW5fsjHkxT3YQ2nZ1D60Dq/8+2vWGjE2AaT6oaDKdM=
X-Received: by 2002:a05:6102:4420:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e1e617ee0cmr5243518137.0.1764331735646;
        Fri, 28 Nov 2025 04:08:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcDNhnYB3uQVovzvtUAgWZaPKJAKjhvoad+skVmq1ako0hV88tZALhYbd+C4wBmEePnEEdrQ==
X-Received: by 2002:a05:6102:4420:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e1e617ee0cmr5243461137.0.1764331735249;
        Fri, 28 Nov 2025 04:08:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162088sm432375166b.1.2025.11.28.04.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:08:53 -0800 (PST)
Message-ID: <afde1841-f809-4eb2-a024-6965539fcb94@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:08:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for crypto
 I/O
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oihqxy8Y0_0LWEsQry4LYrB9f_XeP6ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfX/o9NOxe3icez
 KSE+xiNPrRMERFf4QgE4YCCBYj0uBgTTypKDSWupFdtfKnz9aiq+Bp6ZsksPEz8+iAQrVLNDvNk
 vet5lO8rLD4v8JAhfyyPF1a64uea+OHsZJj06gbYhy4FVCD3JN2WPomEEaWZwCTJ9Gf0BwPBCyY
 zTW5/BNfowf3EhAYcop/tgRJi7Quyw8p9/+m+2QyWR9brz0ZB1f2dTXakHEHTOljwz16Bb2bpW8
 sQwaReDm580+pX5J9fnU8VsuX2mrCM9TRRaj/a/MpuhHLoZZTYtimZp41dLknAcBUiAa01Z3Ild
 Y24xRbIE4nfTZsD4UtT53cfSOxtnR3Of9XW/5Zx7yMz/Wi2Cvn5+w9cM1ZHA62ImdbU7kQQPstv
 xcZQh6H+nceuoITZwigJjNri2mShGg==
X-Proofpoint-ORIG-GUID: oihqxy8Y0_0LWEsQry4LYrB9f_XeP6ah
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=692990d8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=wXQIig4NBtMv4ZYXLh4A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280088

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With everything else in place, we can now switch to actually using the
> BAM DMA for register I/O with DMA engine locking.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> @@ -25,7 +26,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
>  
>  static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
>  {
> -	writel(val, qce->base + offset);
> +	qce_write_dma(qce, offset, val);
>  }

qce_write() seems no longer useful now

Konrad

