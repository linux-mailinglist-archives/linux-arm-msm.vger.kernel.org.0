Return-Path: <linux-arm-msm+bounces-78377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B5BFD4FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC1018824DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34DA280A20;
	Wed, 22 Oct 2025 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6khpsQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106527FD6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150654; cv=none; b=aEaN5KfjuoTwbqUgsQNxe//fSI5BAGpV3ChXJOvSPiEVDisnDkKyRRpMwQks+uvF7ImBQ5fzKVcJ3RdQbwLyUGlm1zSYBqHSrRKP5nocFiTKFH7sZbu4lBx00bLyDV3ROiakahU1pkKX4s9jFf4zaV/dushes63Yjr4xYeJNUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150654; c=relaxed/simple;
	bh=La7x/Dfx+5qr87QAvTtAos4Z7Qa6KJfwV6YG2/W0mQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf6VJSTsJoLJ4hUCtOKmIYmC9Dfog/JgopKk8ml0GRI7rETiXNUV34hUj1gSL0Ag9nOmuVQQuC7KZV5a+YMuSUpUeB/vZGhI6Ir+vomyc8Gb67zCk3P0XLPKriYCZg2qg8pPHm7eZiLAA3hVwuMahIkcoLGG2liMofaM/XRPpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6khpsQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA006x000307
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVExzC/ZCldcYzHdZY/GkmSX7NUaqTgV3yEbwJDlx0c=; b=E6khpsQydcbAEi40
	zoafvNR9ktTHOR8zf7JsDSjupDet2ik4ZOKBJIsEpZVztICNanQQLUxcxo5lZNLZ
	FuBA7G1OlGkXlDALhK8uC9qyAqaSd4wp0SjY4ViiP2fdI9wJaz3zAhxWcusHNJT0
	mERFRU+kG4v8Oj2ITg9nmOmxD/v7ylNhz3cx7pny/1cVhCm+I8BsVGbqR8Xpswf6
	dDwC1TiL0wqS0I6Sc2uAb7fVg29N30DB+q6F8YTMvBT73SFDq3mSa3yGSy/xV+sR
	6jlvEBm0w79AcXVy1GSwtVLqfeSW+aMZ3fLBQzZ2Wvpt6VIejC6PUKjpuOi7HE/b
	oQYSnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wayy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:30:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e886630291so4076141cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150651; x=1761755451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVExzC/ZCldcYzHdZY/GkmSX7NUaqTgV3yEbwJDlx0c=;
        b=YdAcUkclByb3I0zuBguUQB3RwelWDrYjOsx6dyXBRUIkyqE1HcIYQQPcY6s3koMkTE
         rUMnuc6NgKfP0u/MajRJe2UmchJLLrPbQybHcCEL4xJ/89PvnGrAcfA3PazaNjPUg5lC
         8y8Gv5kNjgIwBFlanAglw5+GrNgt+qkbRP1AnAQzF3ESA2NlpBP7sG1yyBP/Xa5Hx7iX
         Jw7hz7v84yObA/tF+Xaj+I4dnXRiifo0PINJjycYddxHHAPvkeDQ/qb4KrxPLnGESHUM
         o0cjRvj8+SgO1NUvhn7BOwfRoe7bzdfYOCORYJmcDTvGRxMDa3zRRonmFH3ZRzDwUTjj
         uITw==
X-Forwarded-Encrypted: i=1; AJvYcCWJI7I3bEdrwvqXzf+FHOTxA0LY46OM23k7gWIbc8ICGxsIhrBH5qlA4vt59hpuwZRN5G6eu93L8LPPBRCi@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbK2mxgk4pS1Z9ogI9DWeFQYgJHG7D1sj59Yaay8B/1VY0xdq
	JcXiD4NZHiDs5VPE73U4ySqW9Mqx1pDKpD1WaV0nOC5wOaRlBfGEekNSbXQxMfeq9BDyjNW6pyJ
	U9KOspcyy1DFVJplCfNx6vk8qof6hdtBY5yrSXhZMTZ4oDVN3E5BAkc+3F4ZlhgYxOq1O
X-Gm-Gg: ASbGncu3SmEnHPo4p9WVtGQsJcX7aTOmbG1J8Dl181zksledjfgghoisbH1DYUr7Cf7
	IpuNWzvrfpMyImSHJyrrct0CQe+1vDlp+H7Qvd4zLSMRWWFVydvbrqxOEl9Ocr8SZkjOH9GXFaD
	hGurrpTvdCvpSKHdZ0Gh1StAE0eizZUJmg7CchnxntidqZDg/US6PmdZjZz6D77ARBCW8pokdX8
	UXL7waoZXxnojFThos1sENrHmXTbMexQB0EPFXURMar6eGC2OA2viO8sKCrEkVMnusttCHNkdl9
	qZ+xAiamTv9Kghsyl+2GtdwYOMa6M4Kyi07XY4XCDUPGiH6ZvFP28NL4fwoAbZJdvG+Hj9EF+K+
	q8w4dWUBhbLGFNaR3IS9uOHTqvT0WcgyvvY4VDouqPFPaAxkRHA+w2VC3
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr64395071cf.10.1761150650924;
        Wed, 22 Oct 2025 09:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu5byM9VPY0GokSXOTKlkuO/ePXSQsQWPpLZUvvK8N8S7OzCxNnNQq8bwkQTgfXEaXa53r3Q==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr64394541cf.10.1761150650310;
        Wed, 22 Oct 2025 09:30:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83937a3sm1398041066b.23.2025.10.22.09.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:30:49 -0700 (PDT)
Message-ID: <8667f4c6-5d09-4ec0-96d3-d88c717a3d92@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:30:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
 <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
 <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BrCxr_xNwCsd76jqOe7NcnZXcyXSTIoM
X-Proofpoint-GUID: BrCxr_xNwCsd76jqOe7NcnZXcyXSTIoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX3wo6s6HvlT5u
 9WvbgnoC2PYZzaO857Ayn0x+adJHtpbzvZXc95zp4rVhTv7MJu06Q4PnZi1gRxECj7V/uUFWVOY
 NHY0o83Z8/kjVEn6fXTdh4+ypv2RIkufR0/R8R8zfRy+8qHDef792Fd60vtispMKc0lvFwPUqGe
 RUuhTno+nE948Tq7SYZs1uz7Ww4OMNfKOZljkxaY2b70ruLFECQLhRe1/4PpXTPtPqU0JIJb3TY
 hieAF41b+3HquWcyxlE8IR8LJnhwCfw9y27YEyBfE77SxAmK/aBj0sT7nssFuDXy56D+vWRC5gL
 pIGW4JFZid5QqQneT2zAUrpkvlz0qA27s0Z/fHaXjlmF2+L4z1TzwxulPC9/cOxvjB5qOixnC+w
 uxFGwzJZ9nLABaieKIDwo3+vK1xA/Q==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f906bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V4hQleJxWy1ojOnldBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/22/25 6:28 PM, Jeff Hugo wrote:
> On 10/22/2025 10:03 AM, Konrad Dybcio wrote:
>> On 10/8/25 12:40 AM, Youssef Samir wrote:
>>> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>>
>>> AIC200 uses the newer "XBL" firmware implementation which changes the
>>> expectations of how READ_DATA is performed. Larger data requests are
>>> supported via streaming the data over the transport instead of requiring
>>> a single transport transfer for everything.
>>
>> tldr just like reading/writing images in 'raw_mode' up until now?
> 
> I'm not sure I understand what you are asking here.

Sorry I confused sahara with firehose here.. The former doesn't have a
notion of what I referred to

> 
> AIC100 is the "old" SBL architecture. When the "current" XBL architecture came about, quite a bit of the components were rewritten. It seems like a different interpretation of the Sahara spec was taken for the XBL implementation.
> 
> In both cases, the boot component that is driving the Sahara component in FW will want segment X of the elf for the next step of processing.
> 
> In SBL, the Sahara component would have a specific MTU and break up the request (segment X of the elf) into MTU sized read requests for the host. The MTU is negotiated with the transport (MHI). The Sahara component expects the entire read request to be satisfied in a single return from the transport - anything less is an error.
> 
> In XBL, the Sahara component would make a single read request to the host for the entire request from the boot component (segment X of the elf), and expects the underlying transport to shove up data until the entire read request is satisfied (Sahara will sit in a loop until it gets all of the data).
> 
> There is a bit of oddity because the Sahara spec says that the host can indicate an error by sending a packet that is anything other than the requested read size, but "packet" is not defined. The SBL interpretation is that a "packet" is the transport packet - aka the MHI transfer.  The XBL interpretation is that the packet is a "Sahara packet" which is decoupled from the transport.
> 
> In the end, we have two different Sahara implementations in FW with different expectations, and both need to be supported.

Thanks

Konrad

