Return-Path: <linux-arm-msm+bounces-84840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE9CB18B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDC830F238F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C981DEFF5;
	Wed, 10 Dec 2025 00:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVSmtGlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frgQdORR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964AF146D53
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327374; cv=none; b=BxfV1tfCfYIVqj3eESZ57dOgCymrEQTAVgaXN0N7sIfqm/11+lp+tO1Ul06MDXIi1lTp1miinJEz7j0Oj3hZKFbyvcZdPz34XrrbnbruzMcuBvZ82s4AnpIbaKSIoDU5ufaVVVufYpupW2hXgchcQAeN7e3wEPbuykRncU1XtlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327374; c=relaxed/simple;
	bh=7Sbuvvp5hnBQS47YtlqHNWSEXE93SjfjqA3dxa+L8fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAgKXy64HLuyYHy5J5laGern81U4R5MbNNja+DM36BAMWFr6SsPmBAQUq9SdtTrAgi4Nef6BwQQrMR7ogOh7r+/mEAoWjUvz/wO8WpWvbHjv0eOAybZnF+klADBWILUvXYmIiy+JHDmm2wMVbTBQpPGgQQo+LGpSl2tV1D0Dh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVSmtGlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frgQdORR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0P5jF1723435
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6BEYi2/GH2p9A5hKfgzF4OLdlHIhSO4xUJhrVrBexI=; b=VVSmtGlGeWxx9qli
	HcvYsnA/butcXkjuUYvfsBLRVol9vIu2Q/i9AUiM6uaJW4s1MWhLb1CetPoi2nqi
	OajE2KbRoMB64BY9RA24luJodQ1ZFds2x2emvA5mDykevDSLrxdgKQiA0rBmAv2C
	W0I7rjdAhzCrtzlxwJBOQYpp/9GpUVhTM2PmzU6pN5aEKFI6phE3yiB8Xl+KY2xi
	JfDU4X2vQ9F+RrlEg0YMJhdT8a+DXAP9aE3EYpkfXvznS+5ldlGFsk1FwEEVoJKC
	5t6iO+wF291X20SPhJURf60sIWLV7E7iCY+wM9h5n5HADKkMn67wdMshsioDEkPN
	VmLx2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu596xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:42:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7aed9ebcd67so1067755b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327370; x=1765932170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6BEYi2/GH2p9A5hKfgzF4OLdlHIhSO4xUJhrVrBexI=;
        b=frgQdORRjxXowJMGX6SZIR5heRFOrZDdhGzLhlUXRutkQ/ROjqt7hWtnAN7jHD8H+D
         c/z7RRUA/PXfh+7IsLCANxwKfDgH4bfIYKbQAyi9N0nayO1dzvdoVOxgu9H7/YpIYm2b
         O/yEmG0hf0uqv9awAsth/iFhqkDDvpXOB/bbd6403sGbyN4Sovrbx2BycU/WGy5Jcuvb
         yzzBJjAYgzP7aIN6uRmqqMFCQFrLFRzmShtZA50xpMkbq6d3HCG9QqbVIKGcBDmpVbRi
         aSYwyCZHfNENzyhSl7CbHHPHdDXleDSWmH3K4jL4FV99Gy9+mLJLBi6gsTIP8N6qv5yi
         GGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327370; x=1765932170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6BEYi2/GH2p9A5hKfgzF4OLdlHIhSO4xUJhrVrBexI=;
        b=hoiTOkxNolrLZL/kF2gNLIWOItuBj/R7aCdEyWiZmFeR56f3J2LDWpG3tI5QG8cm42
         nYa8DhZvBbmRdJSb+IN66qFb//7m3QPnK4ieu4ed629RVE2GXzAWia3Gkr3e9FvvORBw
         D/RfGrxnvVaoOieK6Qq43Bsgi5MLWyTz/6eHDTKv3zYnQSCQhu4qmYNCJd8Ea5rmAiAe
         klVGFEIAwfS87bjUV3B4644C31fOoEV2ACjKfkF+OXg27mXv+LY2wJIit8t+khbWz3wo
         6hTzdprEc2oHktoadfwsHum1dWkh1vXNmifp/1JorhrqRMjTA1m/WNDe8TD90NBxOv3I
         bTIw==
X-Forwarded-Encrypted: i=1; AJvYcCVEu9l/dCu/We+eO5WJ/Dy/VEMzvLkXju9+YiVnK9Qvl4uI+IYogzE2rJ3e6oYWxxYzeyH1HUvxPeg8GOpn@vger.kernel.org
X-Gm-Message-State: AOJu0YwuF5cAaC9/6ATWHoLnb/q2UEsFoAgrHye2KPLAxxU3DqMK+1Sq
	psb8XINX0RgI+xgDHB2TAS22AlwL736TO6i3kmm4t9u7T/SkMEbl/yXKS+T7y3ntZ7FaBpuc+u4
	Ju6lmwdLqyN5TiXzE3F3bPdsIlSCmrvRA1gC8ZXOceooe7uh0Vx3xuW9SXArpi25chA3w
X-Gm-Gg: ASbGncvsc4ZfPemdZs2mwj44nb4hUVX+E75EZLLskpnGoq4pjin4sNBVJCjvHYlOmfk
	58Hdu6pUmApvBU6SsLxWTVmE+G2TFFEMbd1FikFRb9KXx5HzBbx2+iGWDl88/UODncQK6WBnshf
	/v1txHwDeJYB+19l1KYPjgi9GpwYaM3Bi9NK5nyYD84UKTZjVq8vH/1P7+VPRJxayW5j/wWTXo3
	FQA50Bz5OKn61Au0PG6dV9H7MoLgtE7X0uMIowOM+ig8qUrJ0aa3emNKr5JoCX971Tsd57Tp78h
	WNcL4+nhp4e13b5XSGxaxATgJAH5aygep2uzeM8gCImOa2bUjx1lzsN8e6324IXAYIcZYr4a2Dn
	qdLOiLv01FbjpG9+/JMZEJqEXMdAK3/wuEcoB8tMRouJIuJDhGI6mGcOfrvj8GOTHElSmsPCq
X-Received: by 2002:a05:7022:249c:b0:11b:acd7:4e48 with SMTP id a92af1059eb24-11f29631fc3mr285356c88.2.1765327370396;
        Tue, 09 Dec 2025 16:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHejN4p/igRjwx/tx80+JsXSDDGp6uMU8x1c+dTUlIw+vxG2eQCUttmA8gT8M15scHQ2SsOuQ==
X-Received: by 2002:a05:7022:249c:b0:11b:acd7:4e48 with SMTP id a92af1059eb24-11f29631fc3mr285332c88.2.1765327369849;
        Tue, 09 Dec 2025 16:42:49 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552211sm80413083c88.1.2025.12.09.16.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:42:49 -0800 (PST)
Message-ID: <9a6bc6ea-f1f2-43ec-8955-f18d9958489f@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:42:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Enable support for AV1 stateful decoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
References: <XWtaMcg7lGClZ4pwr8czLvqGdhEXidF54raCx36v4Rahfsker2E__wKY0i87ff9Os9OAZxAepPTDFO00wvXLlg==@protonmail.internalid>
 <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
 <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cLidkD7PLvFLpC1kGMnLzQEWhYG0rfgA
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938c20b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=z8D-9cvodM965mSEd1sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cLidkD7PLvFLpC1kGMnLzQEWhYG0rfgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX2pcQS+YodYoq
 G0MtQqjZNkHg1mHV26pm7LF/cfquAmp3ZhLVsq+UoDNe/Iify2t/kFZC5wJxLhZPNxU+Rk91LF8
 CtzlS2U1Zce9/fG3ieSRdYbNP76fS3OLZ8IIsndp9vPkDL6j/Ph+TTactPB0y/mjl4Lmu7ogJY0
 3yFi+w3zv2YrER70SL/zb6YT9GtyYQVlNMTBfSIRzI/Kv7s8lFkmqC1JLM5cJIAdSreAZ+oMORQ
 eO++oyJxYOiZVXHR+lAg6AG4cuLPDk7cpgex/DWRjoOLH1mfXf1ncr9LtgQR+SokzVgfR5qk0j1
 tB1fOuZFeE+nWiWnokJuUcDvIpv5OfnaKENhQaQOzrwtPz3GSGlBjAPKdH5//sZTM/5ORpglnZI
 f6BbXAYLoJtYCCynZvPPfxbT7YkQoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100004


On 12/9/2025 4:41 PM, Bryan O'Donoghue wrote:
> On 10/12/2025 00:39, Deepa Guthyappa Madivalara wrote:
>> - Add inst_iris_fmts tp all the platforms in gen2 (Wangao)
>
> Is this part tested or just added ?
I tested it out sm8550 and Wangao has tested it on others as he has the 
setup
>
> ---
> bod

