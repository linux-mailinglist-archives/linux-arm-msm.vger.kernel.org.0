Return-Path: <linux-arm-msm+bounces-83583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CFC8E176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319783AC1D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602D632D440;
	Thu, 27 Nov 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQ9hhOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM16Inbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4A31A07C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244046; cv=none; b=RYl/Hfwf1DhdrqKO7p72AgVD7Xh+bXxLMa1l4gtKIAN7m3+fx8mOSTf3MV1fXHA1CAF65zXqRDRxmWlS14306R7jqhHM9vlpyn/AUw1oEr2INsHgIlipZQ/ojpmtLOFoTkYyklgXiW0Vz0cAh1KqOFKiY6z/+1EZeKY6hcjPTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244046; c=relaxed/simple;
	bh=+X3+94lwOmi0u7SCPKjv9X3UO1pZjgIpwxWjWXZl0c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmPNF/ReGOu2aNnScBoohHFRwBs8XsYhCWqTu8Hr1ki1pvKrCtYmXj9xqhkPluBqX01ELkTTQm02DK0mJ6zd0jgJqZU5WgCKnMIruwuOvTVDv3zpW5128xPAah4j6MWbMU5zJhkPzy/+ZBeh1JYZj9f2bnKFkhOMTTajk3ee50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcQ9hhOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM16Inbk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR87A7x2387776
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=; b=NcQ9hhOmBQZcoBBy
	GAPckl7O4+fagCfKuLGJPe+JEF93c08dak98J+ZU30OiQyApBKfWsNFxJiF/Lggh
	r4nrYJ5XHWGyjfyje7uPZj6ygtkW78Wrb4haDx4iRBqXgN0GN2b+eAntixRONw3a
	yfq57ctL9XLyBoC609Cg5mJxFYPV+Yj/u2+UlhxVP/C52kTD4rV7NgIVWBm2zPvx
	vZPSXtMnVM2I3QTFE3gP0EyjrqVfNc+yZsuOF2dMJh6c8C0l3dqQIF6kf4rjQF6L
	KHK7YGuRwpqvqHVTXWkC9Bt31a8pGXBSphAsAD+agZ81MkpKzZbzFPGyFONDX8Kd
	bx58LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8j9q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso3395161cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244042; x=1764848842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=;
        b=OM16Inbkm47hyhMsVmtFgmVn4tH13SDkVa6h08Ac6SfR8C1jMCxMaIec58KxNdBRa8
         j1ohL896XDYBD6ZlE2b9gEfO3RlFTqpazFadWqyW9PLHI5Z6jTyyC0mwvzYR2nuZsdpR
         svP52eL4gLw1qdqmB5lmFG5jfhaQrYfH1fYSvS7Ay8JXAVUcjhNwy65lA/3EA3AiOxgA
         cRdmPQi6ewHAJcgDX+oi9X4YVMEcZwO0EO3w/hpNMoPoCzjQwROsm0zAkzovNMf07+6K
         2bCN47Ph9VyCoMPf9xktnwHAN6Z0uG/7UkE+6Kkwjaorh5/AyqrosnVIQ3Qhtx/LnIVK
         DubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244042; x=1764848842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/RzqhvLeO73dOkNIHPYAf57nLA0gWJO5DL8nIR799E=;
        b=BYkp9xtDPPv1TX4303/fW8u17reMDCE40jPIVYVzGZx/ouo/rUyROYI2w4+TyNFgjx
         WYidhn4Z6TJQh0fGxwO4tpPytkDX5taJzTKBFBBJzU/OvaunohuJL/uqRICPSSXqSNnf
         XePGAhHtx+6acDrN5y+b0BKHlXM6RWCdYVQ/spj/Y/qNtMjqAMZCJWf0QqX9SqzJDj4S
         p8CmNUuv4SA/qytk8meUg5PI8JG0xbGgkqX6iCUDUO4EHDO1nQrmUjiEFNaBUD/lPk4O
         7mLdM4lM0yiGlrccJ36JKKXnsFTXMW4LQJr4AVjq2ddgiDcxFmMkX/0CUih46PaxH+ii
         nG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZRtDVKqbvbHVd8GzGCtb7bKOGlS8EXza5BpK30hN7w1wqZYt8I38xmQ1V83+u9bIJJB2W/4NS/4EheRR4@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQDpb/CQF62CsbwyQgOW4sgALtiWVzZYL3q4vjd60WDUgnKUF
	4jmTZqiG0deqI5Fzpx9G30C85xBh1bEETlXoqlKkmR9gGp5AF/MSwV+SiS+hIngSoRD7pPtJoa+
	7CTidVXYuF+NzH0B7SnrRwva9bd3WkhVREwEZu7T/u46qCxqVAl9dKG33pL9kiIl6VdoE
X-Gm-Gg: ASbGncuZ67wlZqfGLxKQTN2UMSWbVRyXbaW8vm7LW5YckGFOngFMI9onoZWnuOlAlxj
	uioEZx04A37wuzgGohCPuZzmVHOPLuOSHt0PoxR9qenZsMleecVr5ZS+CBZ1ObxP2EHjkELTv7k
	22zYuwB0XuCb+2hF26AG9Lv5Curgotcwdx09Le9Y59El0VlJ9VtEmPqFZT/jcvB9UdKIGWXOzzp
	/mhSNvgZdxY/0PHQnwqRksMeGEJ/GbL+tzgjvDQCqiXD+CfcQd6g+ctmsCJpzkkhnQsAqFaopc8
	r5lyHdI1bSYbyewWCIIR1HnBbZRGBZbyf/YRmBnCWYELS4tg3utxxjeYY4oLZDAI62z5fEXKLj4
	2dKrC7gEffHlPX8dQfO71SvQzOuQj/zHzsogXvG+CFuz2CCHpiZGlLIVio2sfSuzhNjs=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr231591251cf.3.1764244042337;
        Thu, 27 Nov 2025 03:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhxaIf+g9okytCq4TlpAS+LV2z9LubN/g6fb6B3B32+bqXFcjKeoz6+qy+/7HmKg43sCJreA==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr231591001cf.3.1764244041799;
        Thu, 27 Nov 2025 03:47:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm1373506a12.8.2025.11.27.03.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:47:21 -0800 (PST)
Message-ID: <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:47:19 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSWnTE-jeHEg12N3@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iQf10MRE_wxUDSCTSF0FgSvnbwI9wjDd
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=69283a4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g2FNSR5juNlgVfHlpaMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: iQf10MRE_wxUDSCTSF0FgSvnbwI9wjDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfX41QCpyT+KcVI
 rWxb0YW6B87YQwUr+5MCkC8C/+ijlpjbWI6kdWrsd2MabKKolVGLATeGwl7lPGnI8U+HMtcCGrc
 V8J5fn5qdXooa63gHTUjJRGuH/w3Wed0NVcJ0xL+c/oihdmNNWpzk9oZa8PYmoIAPpYMNKpjLEe
 CenmfVZGxr0QxoqSgksuuEOqDveXdTCwL+rYUJ4lB3dSwhTqPIRAkGHKkHqhRXBThH9MPprdv9k
 W7AZsAYJROFnKte2Skf5vx1KJnBi8SHhGCAGSkXWBQuHFMfc2vr/zqDiCGDw8VQoAUaoXHFiA5A
 5P/A3F0QaM8x/Jyc8ISDp1BnKq8z89tA1iDnZKomjpG7MELLvi/p1akRuJvvG4fISUYJzhy1Kcv
 SNVjB4ZjXVbeC5AR4nz8lqTiuSZDgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087

On 11/25/25 1:55 PM, Jorge Ramirez wrote:
> On 21/11/25 20:22:13, Konrad Dybcio wrote:
>> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
>>> The Venus encoder and decoder video devices currently report the same
>>> bus_info string ("platform:qcom-venus").
>>>
>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>> parent device name. With this change v4l2-ctl will display two separate
>>> logical devices
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>
>> Perhaps that's a stupid question, but is there a reason they're
>> separate at all?
> 
> not sure I understand, enc/dec support different APIs, v4l2 controls..is
> that what you mean?

Perhaps that shows my lack of knowledge about V4L2. I had imagined that
a single video device could implement (non-colliding) enc_xyz and dec_xyz
operations and was wondering why we need two.

Konrad

