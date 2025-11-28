Return-Path: <linux-arm-msm+bounces-83772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E88C91ED8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AAFCA34753A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38397327BF8;
	Fri, 28 Nov 2025 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXsj2XWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwJlR3aK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE0327BE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331401; cv=none; b=i7gsSQiwl88/GmBJGNMkdqhI4jfWWRp2cmesBF2E33IbmHgDDSVCae0PKdexx51yY8fYydYzdVvpadwIfoTB0Izn73d+KgbqeCJfby/hkCopJiBWT7sEbRTkJQkHEbUifwWpnWGnXr49eJ/pahvEHK5rDoP3UtEC711Db6riXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331401; c=relaxed/simple;
	bh=gI9TZ0qesYpRchQnmCsWfJle0T2gVsum9dhWtazzYhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCQK3hdJFmXnjapwO9Fj/T+sqXwdxEkutaYDHwNl/CJ/exQb5xfT2O+axspGTLqRO55zdxzk21mowDMjOyxsM1/3k0JlpHu+sn0Lr+nir5Lt97m1F5+IGJxXTr8OJJyolr31iI0BEgU/YnasDgVUt1YJyVwy1qTBhrj/G+GrYFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXsj2XWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwJlR3aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PMf14122414
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=; b=dXsj2XWpXgQOXeLa
	aAqQVWaY21Pn6MvDMbQE4/PLTC0WNqOghHZGX48heSclJ/JiBVu6QEVk6txrBAz6
	ub6qEg8B5JCIBqAuO1mmavE7DUl8xT5gPk252snPtL/8eSOP8kAXOdVH5qVsr63B
	NmgGMH8vRxNuiFw1IfkypQRVkcAgaVqREEXWj4TnY6y9lKPW37iXRBxPhi0HJ+7I
	JHXl/cAKQfmkdO9L+Q4+4QHit7oQ9ROkATSAv8/95s/NeWxUFuDqBDjo4fP+pSyO
	hgbl1Z+vpQ/EKzEYQ/bUGECnHlrGmg3gRyk6GTlVlEC2jONoWRBTsT0S3Q89d7a3
	T7vzwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61ubtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:03:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so6267841cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331395; x=1764936195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=;
        b=GwJlR3aKT/6ajh9GXicIegiVJJ3ZmwfzVl1JQkvYvKZUnkFCNDeVsI7glDevZ/uV5G
         9tm2mYo5hjQydFACPsv62klJg5BQGh0bzViJSv2O6tzcuVVGgBxUxwQmOtZRldo83luy
         wjCAwRQnWvI6JJftv8ivFBN+HOXLNz0DyG85BoJ9wuGoN2P9psDBQR/WeSR6cw0ykfuB
         0IIjUpNzXyiY6NTEBTsX2oROYvMsU4BMh6Kb70uW5UZqQf362UrTDIQzQCH8bJAJvk3M
         ze/3QquFEn70Qe1/g+XYfF3HIeXSeFd37i7GMh92rGURTI3VKTCFwgsaRneeTjZhb0wc
         Qwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331395; x=1764936195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=;
        b=ommV/AAz8iAxq40PXmRsL4Stc0y9BHId5At7zqWsVfiYD6+XjfB20R/IlQ5wAJMN8+
         9yHouePjXWyKrs7HSl8wJLEmRGUFzWuIZVzRe3/rbSonrX6FNnOYbsqe9NBzrBXvOSrT
         h0PYiXkRoWK9ZJLlAiBmpE6/ZjbZ8gXAjgunGQ1mV73WbPWTH2INIE1GW3Ak59aY3WJ/
         siWYJ010GsNBtsZUZls5EoudjGFrBbMDEKTxgEuTh9Jrps1MEo9dvkVkDTnrNqsnrCe8
         ZGfGwMtfe95Q/33VU+1DhJ2JpikVuofPWAl2up74YoKR9i8GaLuiRKFkxaFArvcP/OFI
         kyaA==
X-Forwarded-Encrypted: i=1; AJvYcCXK/GA1T7djPVA6KKt+emOhS+ae5Q6APVtVPXY3RF7IwiCVMwzo6HY2RsYvfriVG9fnYFEiQ0zZuLH8lZhP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3y6zdBkId7qbm6R6Lu1TatjjDid2qixhYewlB3PjsFyqeaT3u
	hKZ6fzkWzQGm8CDV25iQZmBmbj+oot5WHxxizs5KNAH40chFYCRQ57LJYNhdDyPJ+HcDcSn2nQs
	/QAmpb6CSwKeHOxRjIhmLdY51nx6sfEST7Wm62F4AYefW+5cb0Jw7MA8ff6d6q83T/StP
X-Gm-Gg: ASbGnctqNbsZGwQoanzm1/yEZ6gtO1PERXKuIE4OfhDfEWynj91YOMbl/LmfdQhoHzF
	CLsibRpcOAefj5144DZ0eLSztKOsrsIuus66W0P5GrWIKg8eyP1jSKa2xftkGM9OJ9vLawxWXFx
	oteCcNa6cxzXdg4lvid8fAznHpE3HXXbE8a3kQWmOSM1vUg2Wfo4BDJejyB3v/QMTlLD8rsYzvk
	3r4XyA0H9O012frxZgeCCdMCFstJQQLlPBl8rd1V8Y5Uh0DemohwKwI0jpGVQ0c891b1la5G7ij
	nzgLJe5jBV3XeK6DUEA8O5FXFbXha3xYOvMN50EmzhHtrlIBy1qpv3CVfWd7dlhXVNr+4w3SECJ
	sDFr1MYKbughjZMinVUWSDXjOsC9n/dJmgA1gqX/xKLnQaU6Vl1/Ftt/QOnWIaHjfj0g=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr293260291cf.2.1764331395425;
        Fri, 28 Nov 2025 04:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpz0IsBfLxHZyIJ3r4cJaVCTuzbtrQbveyDFdAcyfDdx1RZCSL9CU2KkChwNM2o3JuZNqE+g==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr293259601cf.2.1764331394940;
        Fri, 28 Nov 2025 04:03:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c24sm4149349a12.22.2025.11.28.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:03:14 -0800 (PST)
Message-ID: <22a4ede2-2d9c-4067-b908-a95d3390573d@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/11] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
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
 <20251128-qcom-qce-cmd-descr-v9-7-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-7-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RcPeXKi2cMNUH8AEB8TMW2v6GDWXgLeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfX4hDUd/1+Ao+W
 lxFZIo7sSlvq3NlfrW4mxyvq0qlXp6kv+CG3PsrakF5cLBUXf9KC00/+vyaCAiT1L66W+I7NDEb
 WxZGX6R4BsjOxuDwYDkfdlIfu/+cM2q8snWlcTLHdsA5G2a2iQfZnE9WOz1VDrJY/obKfi+ygiC
 hc2OYnJROK3goWmvDvUcsBjcHtBhPUrEc/FjLmcTAriE2ZjkzQddMZnHuzCHTUu0jgNpFl9mpaW
 k+jbm9hcuf+s7SHw8PgKIJePFVDMw0IsMMiGVBMRO+GrfMh8yaAWNLYJPU6qzAquHMQX/7ytbB7
 gxa4/I43WKgDwlRE2AaXTcL53GYGP2O2aUITG50QBSgF+7pZnznIIQYTdaAGZgNQAWALVYVvZaf
 97m9akUmgx0KRsxZULRuhdPK3XwAyQ==
X-Proofpoint-ORIG-GUID: RcPeXKi2cMNUH8AEB8TMW2v6GDWXgLeW
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69298f84 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wXQIig4NBtMv4ZYXLh4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
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
> Switch to devm_kmalloc() and devm_dma_alloc_chan() in
> devm_qce_dma_request(). This allows us to drop two labels and shrink the
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

