Return-Path: <linux-arm-msm+bounces-83661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5246C8FEC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41AB83A9FD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218832ED15F;
	Thu, 27 Nov 2025 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMs+FfiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZbcpLr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA42D9485
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764268493; cv=none; b=PHDWKtN+WxzKrNL4c/3WLo4VQ0fWIuObnvSbBbFPzQclEd2ti8rbeV/DjuwR8dQWx5wURMBAkwUjw7urdsRNZdPyprn4N/nLmvDEfngvm8X15Sx61cdgNS5j5JcqWkToNOcCd5S745kqjY4VZltf0Qwuo+3BZKRu7vqzFrMsYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764268493; c=relaxed/simple;
	bh=CyqAt8eyHK/sR9OuQQqTRXOD5oCRUVXplse9uxEzUww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8CojqcTOrUScqTP5CK5Iz0wzIz6UmG01ReAky51D07rUHYv44BrA9kP9uTKs2iy1mDBI0lNWxE5+JQEivmRnLO+WnsG7aJfq2j6MGeXrxinu65rHPjnT7ZN34aRNlS41Zj1IYaMkvtHRT0MYemqFMEi4vYrHvIqNUg//lnDHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMs+FfiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZbcpLr3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3Y68848321
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=; b=UMs+FfiMgCb9oBmk
	1Xs/gFOWqXgXhf//5DdFunv0vvfgCUO4EOcQIPeC9G90HRoZSmrW1w3qZtNUhv0o
	GyNf0fWwYa0PcBmVgmQ71gy5u4AO7iMTjLcoUE0TG4hILGT6iXeElu+lw9Scmewd
	IPZo4AXxjqmueldmoEfNYUzQFogmny3tLCTjKXjzaP6COG4VLHl8s2suo+ptUKUb
	PvBEIELL/lQR8ZwmKLRyM37LaN/UOaodlRDfLNSohVBbBpOODFn4CWkeCYH5hQCq
	lNVfZoZAIIbHIICWte2VSYcjqaHQV11Yfpbn1Yuhhy9JtGQX05WAq5xlLUnpjywW
	DSX3Vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd976e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:34:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so3796191cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764268490; x=1764873290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=;
        b=gZbcpLr35yTpS009S0pxb2uMl4k/Ced3o2eWZ9aNuHuJJC2g5RWy9MM25h42jMLmjG
         iR4GDQ368GuPBQ67kLpSpgEbTBJDEB+vTlXhLgmgwrkFvz56gQ8Fd4Tgmw0rLRQKbMAZ
         1u7R9JtMZjqvsKC7F4pxamb2F2mia/jTYgpqZl9s45IE9douVZL5n0LtGhUF5hdlowD1
         3rBRe0NZZiTEpcuNJ4AgZQf7bq4pWMHEkDj0hhZK3s4TxV18v9WqIFr3oijVh18MLdMK
         OOpXoto3YRvmLZr4tF81jUVh5S3V/5dSxKJcVs/YWo/Iw+Fz8QrVL8GXUOxKdDduL1xQ
         DpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764268490; x=1764873290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=;
        b=YrEihgqvzLvR0pCKCvasfqVNlGYtTZskaELzXvaHWHkfV8WH5dSog8QLmCALMTPrXf
         nMH+rlGz5GtaFQPS1DsRX/vgwgoOY4IyNqfY0jY4wyp4PSEPyqiVs2JEfB3HqkgHBQJT
         P9aGX8UiWtYajQj/0GEvmLvXwsxb4x5Kn7QRPoTKHIkTbc3mjnyC3YYmvKNR280Exa64
         E6c7/8HMvj16+I91WosiN+iw3Z7WrDMsRuCBhlalsYZpCQ3UAXibxbXuPEs9yIoLHGPY
         XNdMJmXUFyLiWiSiTxAJQCuLhwy1RRnUzzHug+SqZHtLZ7EL5AE3CedyMsEdaqMxD0+G
         bQzg==
X-Forwarded-Encrypted: i=1; AJvYcCVOWLCS0BTeVfzOEIg1ROn1HkLQNju8V3NQNd2Wd9KY8OO6TdoAcq8UjmMVORpYCVRrGo5iaF+AjkQzqnhr@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhPZd9VgfrYd+vUlSYEC9xQ6MzYddZgAk3NJJ90Dr45JvO8Sk
	X2avS2+AX7vOUp7cMDtDU4SDM9mWUyXmJox9VHmDVW5cIIh2J1a/l6axmA+NiN4LsKeBNIhwGdu
	gIaB3rhb3D9F0MN3fcAjIeuMgkzVzFPsOFeok52H+2jKw949HHs4pBY3CElsBxh7XOUQ4
X-Gm-Gg: ASbGncu3sPP0JXKYwujbSCZ2hngfgJvgJiOKP5mahs9tZhwPj+eH0Gp4qtIxGj8++mu
	Rh3XNkJmrxY3P1J3s/eBGEFayslUOPo3xFzboszdGdT3iJZ+aqojz7H1l2rpZm+RAMgSMITPvy0
	6UmoQ4DrafhARF51FQGnfy0RelgGwuDxk2fDKCk3gpqMCp1+SiFtxIW+Cc+dCH1o0DQj4ElVprM
	+FsUhZeKhU52j8rfT6Drr9j8BUibiqoJX96hAOmWMA0dja4Jr2vMZyacXC9rbXtGMRyEbFwRJXc
	ic967Plrf5eKDHNyFTaPicRsIswLqlrnpYtP7zzK6qCnYcB7o6rx0HDCkuS7BMqIKcf0eGAcKpR
	NOeedNuIiFCJ7rVAQIJhZzN+VG8eIYB8ezM3ww7l3XTuw4dGI/fVV0j11DpyS+0MgCE4=
X-Received: by 2002:a05:622a:1a9b:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee5887286amr271533541cf.5.1764268489795;
        Thu, 27 Nov 2025 10:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZG3UQ/f/J/2CXIPraZWvUkXW8+fbMv65eK//ZWApgcMmgaOemOv+yiLDqVMqmhCALXLXUSw==
X-Received: by 2002:a05:622a:1a9b:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee5887286amr271533341cf.5.1764268489394;
        Thu, 27 Nov 2025 10:34:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a74sm229597766b.45.2025.11.27.10.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:34:48 -0800 (PST)
Message-ID: <edbb4ed5-dada-4451-b883-2e3cf535fb52@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
 <aSWnTE-jeHEg12N3@trex>
 <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
 <aSiGU4Z81Lr0twpj@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSiGU4Z81Lr0twpj@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G7xopxPu46jURmZd_x-1xcFZJcGqQskL
X-Proofpoint-ORIG-GUID: G7xopxPu46jURmZd_x-1xcFZJcGqQskL
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=692899ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bB1j1K4SiuvE0lrpVroA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzOSBTYWx0ZWRfX+cnPrAkImjBt
 2Qr2EUGELnrPkl/EnUIL1Ijq3CcOsWCBPlfxC6QREu/5faagPJdSnTdutgVh2+cLXWAChZitGo4
 nb3uyhoyECWWb2A4493Mjdx87lIc5oBfeWXu2HWIz14ZXbdxK5C8QyfpH35VJ+w+x1bkYHYYqH7
 68oxuwGWm/TkVoc/u+2G4MEIM5UQqjqhwUdmZIzFImlz+OwrRhiP5RRw7IgWCdJRiuScWwO5Tvs
 jGxCfHli7BiuOXMOHO8jtBid3jxA/MBkOBEE4N/OmdlSWmpxpvrYgIZgUB+jFqLtUNKmUrfWQa2
 qU0+ZV/bfvV4GTaZO1336OtVHgPn6KsefY6IjAj20EszBHEGQ+CPuKlIUNkDIGurOl+97hhgYv9
 FrasCuEKJuMRVyoIkvd1cWeAmDMVDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270139

On 11/27/25 6:11 PM, Jorge Ramirez wrote:
> On 27/11/25 12:47:19, Konrad Dybcio wrote:
>> On 11/25/25 1:55 PM, Jorge Ramirez wrote:
>>> On 21/11/25 20:22:13, Konrad Dybcio wrote:
>>>> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
>>>>> The Venus encoder and decoder video devices currently report the same
>>>>> bus_info string ("platform:qcom-venus").
>>>>>
>>>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>>>> parent device name. With this change v4l2-ctl will display two separate
>>>>> logical devices
>>>>>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Perhaps that's a stupid question, but is there a reason they're
>>>> separate at all?
>>>
>>> not sure I understand, enc/dec support different APIs, v4l2 controls..is
>>> that what you mean?
>>
>> Perhaps that shows my lack of knowledge about V4L2. I had imagined that
>> a single video device could implement (non-colliding) enc_xyz and dec_xyz
>> operations and was wondering why we need two.
>>
> 
> I think the main issue is that the pipelines have very different
> flows/states and semantics so even if the IP block serves both, the
> v4l2 abstraction needs to have them separate (plus we want concurrency).

Ah right, that makes sense

Thanks!

Konrad

