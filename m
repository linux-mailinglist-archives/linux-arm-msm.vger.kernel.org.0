Return-Path: <linux-arm-msm+bounces-83779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A5C9208F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8943A7E2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0AA329E79;
	Fri, 28 Nov 2025 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk/Wrfxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgWp7+CQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CF932ABCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334645; cv=none; b=bcYOuI2L2bkz8Xf3XVN9xouOWA9u11Io4oHKSxnLRBCIYR+HExuetLupdlCT1rYnWH92wX6bl8dFLCzeejrQkhbyXbAgqCl0F6QQ6w9YXDVctzgcNLwuM4IKdwQpxfXax/W8h7GW4Sqor4EsGPeT/MMnV6d15I5casbDfjo87Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334645; c=relaxed/simple;
	bh=Phg6H+8nPm5k0Q558yIc97aSgJoiWcWIP+LnfjeaZ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfQjW82h8h+AipaVSrXYqDEWV5Fs+a+1Iea3kEZb2RiWBiaF7E7ehdWX/3UZlEi1kW0/N+1asjDSnRUMIxz2AfXG42YiFTRRC3d9k/3s1ScYbu9tIVhBGF7SKZ5OBLCNQ7MROpuqWvRBld3vB7ZAXjxb07YJuP0KH+NV4v3kvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk/Wrfxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgWp7+CQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PVmu3797264
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4+S1KsCR+oTu8smc9oP0UxTPmQjSIc96c8vpuCaAbo=; b=lk/WrfxjzDy5T8LV
	+Pz4WMjA0eeMW2573oRzz4R2Dxggzi5ipotdOi+Z6DfUzMAOlURK3D2obZTqAsPy
	xfxrmwOsL2tK/PXd/iGqw9ED1QbtX8tYu9uxaQn7TWkQ7Uypa8A5Az+DeJOMfM4D
	VKhcFCim3pQB5c1LDR1/Z3pXqT20GaAZtHjrD+f6XOhXZuFC2o/Q5iWDgx48BCi7
	BmABnK07rjDZv5kLK34v3tWUtkZLSnJwLAeIHULokd53Kyox2TkJnMWeUp9zqI84
	W2ScLTPeOdsuQraiut1iXppI8B9rhhEBhBZ5aULFRvEKMArMDwv5yJIEDBwnVzm4
	jQXUuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudb6bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:57:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edace8bc76so3315141cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764334642; x=1764939442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4+S1KsCR+oTu8smc9oP0UxTPmQjSIc96c8vpuCaAbo=;
        b=JgWp7+CQuQi9510LBSSqAXaVqVCALIkRAuwopHTwMQYQ7RrXiq6MDA6SQsDaAhUsZ/
         lq47uEMkQFHvJU28EGmZgc9QPKyx+90zVcoRH7zh3Wd93AgMpcWI/tYkYP45mKw2Hr80
         0/qCZIiX+86RlHDEvVJolzuQ8vN/qw5mTir7OkovmHfVWm6EL897sejKgEc3fd1K4I71
         w3nmIMdmsdpwpsocw6lxq+G1loOR0gC8oYzkCrY5kI9DLQQUj9B/jg23mtYLCJuy10eY
         0D4NWrGGnydN2h+ez5KnQ8BbgpnojuOE45lY6KAZl3S+dTdqd07xInjvy28zJxkOTP6K
         IDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764334642; x=1764939442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4+S1KsCR+oTu8smc9oP0UxTPmQjSIc96c8vpuCaAbo=;
        b=H0MLdxnplNakzRP2M4XDILqCE3l0Uzq4KNGdYFbs6+MamtxapssGok4ldctWQT2SrC
         pRr4p4WV7Dw0g8Y8oNSljhLFEheOL1k/pPS4T07NE1mDS/59NCBrLtd6zWMXvQPDXQgD
         7tXPWvv51WNYcUEMpdmcEi/OdIFyCSWN5XabVRUZnWRTTLGRSx0VO7Qz2UgqsP/CHs3/
         5wVPXsO9Bjc9sz9WcY9gq6Yfh7ngoPuxdf6+0v9LD/d8Qnj/GS5PA97Dhis2m+RMxAvB
         MKlCJhKfZIkQ0Itno8QYnBE6u2byNdj55foYhf04dpdA4cB9aMLsnZnA/nd86jbodk2F
         16dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU1VdHuTfG8e7BDBVyyT/h6gYFRfosskGSIeeFJ5ViD/OnxxXvWu99F6od7pOhMi9Nv9HA175TFkLhc0Xf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/xszxbLj2jZqrp53WyfiG5AI/Jdi/fqw+yTQE0Yhxv3jeciB
	2d7GGbphbursR3P6C6k03AId96G2/z58jMZYYhEAQ23coIV4AU5HKMTdCd9ZXMzuKfLd6lEgvIr
	xkBk8XNTx7QRAKY8f4s3p+L5zZS4LlKk4JbQbfZ2bIt1TmHSEsNiKwyhC/hbZRLrjcp6Q
X-Gm-Gg: ASbGncuznNYeCyb9hbtH87ycQQSG7vp53sIeqrP06fxsFkmMgrSyeIuTOOJwxbt1sTs
	mvMssALqmDJkh4u9HugZIWgrwSJGNf5NW+5/Opx9+iZ3/kX7TPBAc3cwqBMWaHNNBfiQd0FVfGm
	s9mQWj6Yd4vzRLGqabK2bjW+hJ4qmQ93fPZZ/zFkffMqrz8aX4j99GCGCGmaI+dQGgsr/73B4G3
	Cm+JFCElsUCc08CqnJSK2IaPKb3yS82na61qKpclReN2HRtjum20V6z6CofF1TYJdY+/smtXZxG
	u8hxHaOMtbXbBxKEKN6auoD/NOv9WcG0fX2aWhdv4M/ReQ1rzic0t5q3+tLdrm+V4n0moCOa+qs
	jOzW+9qLgZ9AWgp4AHj3ujwA044oskB2qwkXCKs07m28IBBl8TbIYs7mFUaG2TtlOIJE=
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr265850381cf.11.1764334642339;
        Fri, 28 Nov 2025 04:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDeoOKipkkD6z6uDYBWbGsDCociwucSXrzeeVHv4vzgh2zwyR3EFUyJx41RNOHudMy5Znk+Q==
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr265850031cf.11.1764334641913;
        Fri, 28 Nov 2025 04:57:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510615c0sm4352008a12.30.2025.11.28.04.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:57:21 -0800 (PST)
Message-ID: <183b845c-5fd0-44b9-8133-9741acc94cd3@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for crypto
 I/O
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
 <afde1841-f809-4eb2-a024-6965539fcb94@oss.qualcomm.com>
 <CAMRc=Mefy=6XDzA2bqe6g_AZS3bbdNEKoq4Z9hV8VwSq5mYBSw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mefy=6XDzA2bqe6g_AZS3bbdNEKoq4Z9hV8VwSq5mYBSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o6U3PBI1h3AiFcNkSjTqC0iHofd15AWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA5NCBTYWx0ZWRfX5jsTaW1y0Sdz
 thGoAMkIg/ta7zHqNL+aZ2pdW+xjQuHPd3HODetFbJr//d2VNvuFpbAqhHH75p3NH7BmWedNHHw
 TRDZi2xMz850Zj1KNnBcaAXxMN5kyGJZYo004hpRa0O1d2xTpywY40ghf+UjcWfbjpOwcYB42ut
 BcWDKx0An4wBhe9tjkNpmUrxQnmJrM4SRrN1fJNE12STmz02yglFTXkSbOvH7EWuCD5bxf6VKOb
 8K8E8FCZVlt0tI/fqXE7TYr2zzqrl/1VmCJLo8iZ+uTA4uDnCrCWG0HuUG3OHB6I6Isi7cCoxRt
 20tqXTHw6TzRmiPGn/DM5eZOBoKhVUHwzUz9r0Hd0FjcNwUf+5l7q8UuNH5dVbnSnS00/iS/3hj
 2ieL7jedjDpqm5jML6RaixkuJymN0g==
X-Proofpoint-ORIG-GUID: o6U3PBI1h3AiFcNkSjTqC0iHofd15AWe
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69299c33 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LOu_IrZLGVboqkKOeDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280094

On 11/28/25 1:11 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 28, 2025 at 1:08 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> With everything else in place, we can now switch to actually using the
>>> BAM DMA for register I/O with DMA engine locking.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>> @@ -25,7 +26,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
>>>
>>>  static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
>>>  {
>>> -     writel(val, qce->base + offset);
>>> +     qce_write_dma(qce, offset, val);
>>>  }
>>
>> qce_write() seems no longer useful now
>>
> 
> I prefer to leave it like this if there are no strong objections. It
> reduces the size of the final patch and also - if for any reason in
> the future - we need to go back to supporting both DMA and CPU, we
> could handle it here.

alright

Konrad

