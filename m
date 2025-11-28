Return-Path: <linux-arm-msm+bounces-83771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836BCC91F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24F993A38D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465893277AF;
	Fri, 28 Nov 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXsQknLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAeNRBvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF522326D46
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331322; cv=none; b=TkF+cGXb5rLwkJOh5rAC3M6V39lSZNA/HoLkITOkFfOMKJyjxFv6LtUdsU6zyee25vdXGl/I/4Q0ymRPwonjO4K0e/xBx4L2WYzEAwY+q66csyYPvIV/hXRckpPuTqk3IcHxLHg7k9G29ukniuAUl+uN0BmMHganrapAajDG9F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331322; c=relaxed/simple;
	bh=ez6ZfBget/ZewewfGMj0lv8Jx9KTi+eO6/TTC4iDF2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lI+E9AVnp//eVU4SAFzRa7SHvp0qw9qNbyWIa0sKF0ahNXZlM0D+R6A/KaDGGrmsiMGkA9aaTlmUcZFePliuk+dfiRzBODV6so3uzg9wtDHv5myXyGlxYW2WvJGSyOH6C6EuhcZHw278ETdU341nSL4d8ykI66y8rO0Z4T+PQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXsQknLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAeNRBvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P9AF2986640
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPCghTC+1R1BRMrdVA14dsXuUuNhg9EncFVCyRzjMJE=; b=JXsQknLY4lYccr1a
	Ah14v73Awx5xRA3ydzj1yzKZX9/zcB2u2JmYLblZCS7KwMh0ke3+dIdTl7Q22ZM9
	AHQbpV/20OIqIba1GlYVfClHecurNl9L3oQ+cS9JqM9QYOBmAmwnkTGIXxbRawif
	rBYIV74O+3S2EQDSw4q9v8THh0PW2kn0tCcmiGHRKL28Ghwd43qjgT+Ut2qSr/eG
	sQpvrmjG9Z6/PQE+++2DynW9LgGu7UcRBDZHkxwGLZR7CTqUg0dDhrydf0dU3I/C
	az9R/MMoSyXJhqqPqJgSGZtia0Tr4hRN0kWdOgFTA8QtwwGObh9IiBOyEB+nTwrw
	/d2yoQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxk6xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:01:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5dbcf8b5a0dso196053137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331318; x=1764936118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPCghTC+1R1BRMrdVA14dsXuUuNhg9EncFVCyRzjMJE=;
        b=bAeNRBvRz37LT89zzldFOdLqhsilMPN5SGcmU1Qa1ejiXtAG5yQ1YxKMnOrVmyxe4L
         jeeF0/cx7ovp9lk3kAz2Pbg1y5vGWmN+5+xSLV7PWJjpSlbV91zdNYR9H2WnGEcAdJW4
         jta0SGY6inwBsnDE2IhqbzIgf34x9/w3ipDas5tbaopfragmydifBpSv9KgMlzhW5gYt
         cAYSzAJ/b98Bx+rLSS753SEgjSbdkHpThdsGauFPiR6b4GgZ5x1t8n3pa6VT12TJjy9k
         iaK5yz+fUq4LjX8QZfHZZYjXjkrblO5kXEvv9oa2uuZT14sm76wlYV0ymWjlOlENcIXz
         PKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331318; x=1764936118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPCghTC+1R1BRMrdVA14dsXuUuNhg9EncFVCyRzjMJE=;
        b=SIhjG3rQBBu7vHJm5YigYQdWlo40RJRIO/iEfb1bAO64rr3AHqFC1vJX5djgN+vWRu
         cqbLnJICFdm5HJWHljXrt3asK2E3GgJ6/hqbU01og15GIFxNEaDSVt0D9d8GbXfdrS4V
         ZWuYxfmiL00DuYclHfG2/xwrrg09FXnOq6jcNhPe0gXjJL75QH9m32FZj1NJ3rmZ/HGu
         cbezLg3+J4J40o+G72U1iZj5tj9kXR72QHTFvfGeFGUHe58Aaofbhre8O0FviSZyH/in
         mbJlk8gSDMd/5jGjlkegNDAaIMtlDS0BZ0Rhaqaeenke7NGvnHVghv5ufEGw43ZWlLPp
         pbDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHKJlzlddtB8rj80XHfBS06defja8Q1KXqyMMYHsKhxCKnUgRiKDuLEsUofpU7H5KD1WBTnbQGsqZ8NPpA@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxY/gEaFFuZ3mmj93IKxTjwGVIlRdOGc29kGR/yS+R+3S4cJJ
	/qjKBwV6zxrCsLqXZ4HvJAbxgzTCRP2vSYtjcvTrvwLesL/t7oi9dB5uOMIANEREx/NOazS+LTz
	FclzUMRFnFf1ebD3XS7vVLE9Sy4ZQOTSO5FpYndQ2ikHwYUFKc3MBhZJ4K8mvpkjAOT8J
X-Gm-Gg: ASbGncvI2oqTl8F7ZXyaC1x+mjMCb+85NHb1ArUhCrWqhWd9UigiGLAwE66PO8HSULv
	K0DHdKjWNL1yGS912muBthhtIuRh/N2bbXLJrbCJg1LtqxxwkCRLoSEq1OYrgnfAGUmK8f2UQbF
	bDKXWoHgj0zyfrM2fxgcbEV2Yzo/xh5WDDGHFTvzgFjRNktC3OGBih/Da+jmCFj8HYlDSUcWkUv
	MCAHUJuoBZEopgRqh4QSKQaCjNUqekoPbX5hHdUJIijfCciNg4AyUOsIWyEKrGw1viPu4oV0mp/
	NKT9SF3ZevibTRnOavy8sp++6Tekq4PZAuVPvNFecy9o0Q4ME2RR3J7oaRsdZUNk4toBmhrbeQH
	lLNWZNO4fzzj/rAtsmEBrx60viXuOmL1XrRtr3L58YKXu9ogaWS531HHtk0iZ9EFAPzs=
X-Received: by 2002:a05:6102:4411:b0:5df:9ae0:45e2 with SMTP id ada2fe7eead31-5e1de35e7b3mr4803444137.3.1764331317595;
        Fri, 28 Nov 2025 04:01:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn3muLP/KsUJgciuhct1kPT54VeocYtfrXUW3eNc73Ai5lFIVKCQGnCEe+b0zevi9VvUlV/w==
X-Received: by 2002:a05:6102:4411:b0:5df:9ae0:45e2 with SMTP id ada2fe7eead31-5e1de35e7b3mr4803262137.3.1764331315925;
        Fri, 28 Nov 2025 04:01:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035d4csm4018538a12.21.2025.11.28.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:01:54 -0800 (PST)
Message-ID: <b1d8234a-6d29-49f6-bfc7-bdc738895d79@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:01:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/11] crypto: qce - Remove unused ignore_buf
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
 <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69298f36 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jrMBgjXTAAAA:20 a=KKAkSRfTAAAA:8
 a=wXQIig4NBtMv4ZYXLh4A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4oDuuJyJ1WBOJI55eyNxMU1KIOxonW0S
X-Proofpoint-ORIG-GUID: 4oDuuJyJ1WBOJI55eyNxMU1KIOxonW0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfX9vjWoMTUeRdF
 stsik4sZnhOvaXtWbrlkW7fcnKMqmoB+32J/5HqbppVMIjw4oE9mNU+62CiOARI6uIX5mRrlHDY
 S7Yr2kWS94XAJtiUfTH5IEnPva7oxdu9sH7BWtllAz4+tyj5WUnCqGbGa4eUo/U7Hbbuep0aLIy
 feYGHIXS7suV43xnruQc10MML3y2v+cQKaVJvc0yxUHTdXKZoJAJWR7uG/FicS1l0KZgwvtUyoH
 Re+mypIr0p67beTaeCNd5Nze4+Ur8/KaSzatEnmjeqlh/bCWVbE9vpXESV79CwdkIufTAgO0las
 Df6LtHaMkTVQCUWWbn1jpUkdfmJjkg27SX5GTR6mlUsfyKXsOstGF8oaJlUkmdrmjLAUl4ctIQk
 Wbjgvkr9P7Jiz9YmsWFuyJDhvkXEVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280088

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It's unclear what the purpose of this field is. It has been here since
> the initial commit but without any explanation. The driver works fine
> without it. We still keep allocating more space in the result buffer, we
> just don't need to store its address. While at it: move the
> QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
> compilation unit.

It's apparently used downstream, at a glance to work around some oddities

https://github.com/cupid-development/android_kernel_xiaomi_sm8450/blob/lineage-22.2/drivers/crypto/msm/qce50.c

Konrad

