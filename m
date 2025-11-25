Return-Path: <linux-arm-msm+bounces-83157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4CC83588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 05:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 739A74E36BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 04:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22749286413;
	Tue, 25 Nov 2025 04:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYY97Ywd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyW1uLz+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5868D27F749
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764045597; cv=none; b=pKzXhXmbTLW1MF0V0FjUymckeZp+A8rwHfRf09/hAFo7n8B18+G9XTY3keKsDhRzpOtSI9ZHS8XDBSMgQSM0bSCfFKg9Qf8Cymm/Jy9FW8NwpFi00olEk242ZZAXyb2E0zLInpt9gDvD/wyPt56egjFFFp6U8deCeWVBOdmQLP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764045597; c=relaxed/simple;
	bh=PqhXoX6syIlr7YWSSRKqka0qQvPciO+riWeEDaFK1Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pc5D3w3pd+uB0OjYKo9kG0FVRDGThSKyP6M52fbAtyPDE9ZdhwaFy33tfgkKvbqkO6C042N5GieQ6KlcyBlIsfOapc20QiR4qe67l0laq7v1N3w9UgV7OgaLiNyUvYeazyBuCMG7LhEo/BbOp6Q8f3mNOMAKPQByv1LCwJYvIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYY97Ywd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyW1uLz+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ghag2008938
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKGJQRmKN668jJatHPk6H0FjYzmlIbNO0WQvdoTrBI0=; b=UYY97Ywd6nInmUh+
	Ae7VAqZjm7cH3iRelQK59JIKMEHz9vuWtLRz/Z2dKseSxz5ijYXJbOmxM/OHU4EB
	PBZAOCrWjC8Ex0qxSOp2to0WXoDlmyrDJ0xyt99Auzn9TqpxYx4ir97BmQ8BCofz
	GRWzfE2/m6K3MA7c+jdfzKN1ZicVxr8e00NYByWaIwBJsrWMf3QcKKMIv7jQ84hv
	ZY5Z9dbORWKVsYPY4dR8wqBodnW7F7U57wJaxm1bkCNFJByNzt+yHORgZLvj+Pus
	xtpnWdlm3O31+jYFSZe+JQ3yuptr7o+YsUnyyZPTFvASQp/++oGYh3ubCZmdZE08
	GiWPqg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknu6v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:39:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955f0b8895so60009495ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 20:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764045593; x=1764650393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKGJQRmKN668jJatHPk6H0FjYzmlIbNO0WQvdoTrBI0=;
        b=ZyW1uLz+TNYpXfS9nljYLDQy6Aj98sXpp0mDkjpPPc9De0Asa38eWj5IJG+5prqf7W
         /u0D2nRNr5LxvF4p072njzfAqcPHxzLqbqxAvQO7Q1LA6NAkr9lIV/0AkWzdVuMhIxZG
         +y9R6H9RZX8c7IEOPanv52WyJGHeGoeJOTXPQBOH4boLP6VHIHSr/87oo7EOH6bzA8kK
         bJ79TAOkCh/HFKDAmIgs1ZSnSv/j2ZFZO6pKPg6jKOZWqE80fIFlscjXf9JvTTWYjY6c
         JYBOxcG3XOCXG5nQuY2iZApx2XrKOgdI5XH4pX+VbpJEnBCzw8ky0o4IKH1hlhDfL9q6
         +htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764045593; x=1764650393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKGJQRmKN668jJatHPk6H0FjYzmlIbNO0WQvdoTrBI0=;
        b=Iqz4MjfWPLLLWIV6oVaIMmkNbIRFOouXxZZYwnqUm+1b6wLbJ+172lfS45xguRhoLM
         MlIp2jGRLyumDew6LGTfzUpKZgCMF7i0tM3HgNVeh+0uEAj0nXByxnFvLkdpMZlGvvv3
         SrwyvopLGBDAjt0hfr9i3/CEo5mBEEpikUePoluVLnFZMYakXxPlUQYKWuWwWoFW36KI
         2lNN8iAQHlbEhuTQ5mjYR/fwEOL3DP2QNtGLV/pcND4unncOvAJV7bfPv3c4hgiHgW8e
         BgRy3DX/f1Vz3fg6eSTs05XflYed6hhSIfrVfAz8M6K6ngIQM6p1ITk3mdDghFlGNAx9
         a3JA==
X-Forwarded-Encrypted: i=1; AJvYcCXY52v+1+bBwMGv677Z2cTPtZ8BNSPSYY0KawmRKLUMx1DH2Py/AKaDNJom2Ho/j/GNrT8p9c8ogGG1rP+r@vger.kernel.org
X-Gm-Message-State: AOJu0YxdqlwvfIzFsmSHOVLvBrHDwL800sNy+W4tmTWfaSMykmjR+gF4
	vGOOvLUbOaU/pfloGJsZ4JCy77xxsxUPSKD+x7v6HBTtYrg7fgNJu5reRY6D/b7zM2K70oa5gyw
	vhAL2mEcpK1tqycWZLLWqU+OKzDpxaXXnvkDeWx6lbgwKMKeGp6EvDaiKrpgejDNAPtjek1LhZV
	XQ
X-Gm-Gg: ASbGnctAaD5JjAgBueEh0GbnMUjz9lEgMiGYHWxisfovufZ4x+JGRGA9G4rUeUt1B7L
	h2EggHI+VN7rHjamtVs3Jy/AfqL4dJUz9ua3U6atXvn8C4gVGnLExuEiA8wwwqRvTCyo+Hv4Yml
	9L2BKXFyr0SeZpUu4GWwxY/9jdIlijPRMuWOU9l9GPU4Gxm+a1Y8WF0Vvaw5sVATYNRtXxYBbfg
	3dTEsAYDTyPa+BHNi4uYqg6pgeeI6ivEEVSvumNAjD9IuK5hVz6ZJuwMMbgSca5HVbJBELYfQhV
	SRjOdZqcVR9jEseSYZHeBZ1k3TsC77w5m29UpszjuFjvPtNoMMSJKvbiUl+RvgzR4nbbRgtJGq8
	CX5A+uv1B8aX/TFuLR7u5iu27/qBKf34FcoypXxpLhQ==
X-Received: by 2002:a17:903:3c67:b0:29a:69d:acdc with SMTP id d9443c01a7336-29b6bffd87amr128408245ad.25.1764045592775;
        Mon, 24 Nov 2025 20:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrUh65gzF34YTtoe7WZeNXxWSJVbbsWN2fH6U/+v9lEO6lwtOlTOXkPO/OwueK9HnEl8fClw==
X-Received: by 2002:a17:903:3c67:b0:29a:69d:acdc with SMTP id d9443c01a7336-29b6bffd87amr128407905ad.25.1764045592070;
        Mon, 24 Nov 2025 20:39:52 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1077e9sm154734895ad.15.2025.11.24.20.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 20:39:51 -0800 (PST)
Message-ID: <563d673a-19e8-f161-ab2f-6e8acd420531@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 10:09:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: vdec: restrict EOS addr quirk to IRIS2 only
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Mecid Urganci <mecid@mecomediagroup.de>
References: <20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com>
 <2622656e-9abd-4407-b1fa-228da9959d60@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <2622656e-9abd-4407-b1fa-228da9959d60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DCtzrmh471l6esfl-hEbvQRJm4gcpnz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAzNSBTYWx0ZWRfX1inyLNftClyH
 Qj0k4U+EcfwrVPuw0wpizRFDML+ILf8MIVIjIJD5MFu0n0w/NT50cqQMcLorQvdTbDeVmRpL+X3
 U5tS+HHrty0HkKYp6ZUqSrOewWIDG9b3JOppgOTlM9EX+v4/i+Dwf7Gw7lg8iVdmR93ObHEh/p3
 ixEL/0Y90zUpSSwkW7MA/mp5ZT8IJWNA8FekTeJ/f15WdY1y7ATiBiRbjACrve0Wgy4Hxln1yNC
 rqOpdxXeZPt0OLvbvk9BGmdYfQoqjYFW2RwlQ+OOWlpnJPgZkNOR13wDKE3U+uzQMRDsUxPMeoL
 Qgum5H35R1XvNXH+z/qNRz9aBsfMFD5eZxSY/EAs9wGiwtsJtXs42yJ2sJLnlCwYdrrLjxogtz8
 fVMnGmm3ZMu0knToh2QRsCgGgZVVlQ==
X-Proofpoint-GUID: DCtzrmh471l6esfl-hEbvQRJm4gcpnz9
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=6925331a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=9Av3R2nQW4dSFDgMc8UA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250035



On 11/24/2025 4:36 PM, Konrad Dybcio wrote:
> On 11/24/25 11:58 AM, Dikshita Agarwal wrote:
>> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
>> not handle a dummy device address for EOS buffers, so a NULL device
>> address is sent instead. The existing check used IS_V6() alongside a
>> firmware version gate:
>>
>>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>>         fdata.device_addr = 0;
>>     else
>> 	fdata.device_addr = 0xdeadb000;
>>
>> However, SC7280 which is also V6, uses a firmware string of the form
>> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
>> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
>> condition on SC7280. Combined with IS_V6() matching there as well, the
>> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
>>
>> Constrain the check to IRIS2 (SM8250) only, which is the only platform
>> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
>> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
> 
> This really needs an inline comment, since you provided a long backstory
> explaining how fragile this check is

Sure, will add.

> 
>> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
>> Cc: stable@vger.kernel.org
>> Reported-by: Mecid <notifications@github.com>
> 
> This is certainly not a correct email to use... it will at best bounce
> or get ignored and at worst cause some unintended interactions with gh if
> you have an account registered with the email you're sending from 
> 
> I opened that person's GH profile and grabbed the git identify of a recent
> commit made attributed to this account:
> 
> Mecid Urganci <mecid@mecomediagroup.de>

Thanks for this, I tried but couldn't find the proper id, will fix in v2.

Regards,
Dikshita
> 
> (+CC Mecid, -CC github, fwiw)
> 
> Konrad

