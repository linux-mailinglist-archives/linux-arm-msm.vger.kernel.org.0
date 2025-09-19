Return-Path: <linux-arm-msm+bounces-74237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497BCB8AE77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A1D7C06DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832B425B31D;
	Fri, 19 Sep 2025 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBI8VajJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16C1D8DE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758306207; cv=none; b=XEuBPhJVi9oqq6/3u4Z/UM+xI0Fg1jrEdju9/Zmkzddtypb+mP5o4PMq5JnBRJ92h1mUUMpaaUmVe5FSJVaxC6OlkHHByQmSWbiGqSXOTxaHROrgO8+pAS+1sGQR0VjzYOaQTYJmm4inI2MMCBoOh6jMPRrvadyeuG9wst2j28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758306207; c=relaxed/simple;
	bh=ZMlanAxFKexgGCKXayKLLyUygjm2ZbznDAdzTjViEy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC8NTrioa5pd2oVvf1O/127RX/u6DY5n55nAP4dhhcLLJHop+1yOyEv36TsjRQOVlcyROtob/qt+gSMnyv3OxXaza136MBWZ7QjjZBc491ik2GtQ/Uzw26PVjguki8sdVAGm0nRAZf4jMBfae9wpPDvmzk4ikiDpHSEXobwPpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBI8VajJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFNKjv018036
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2Rn0Zhk2qgPlF/bJPji0KgeEB74Opf+t5Tm2Q0n1/w=; b=pBI8VajJQpCv0y8r
	ng1nup7uOt4/HbABfBpalOq8BFXke5Ysktwl/FHNyGRG/Mf/iTOp0/1iiHaKGNQh
	LRsu1C1aAtFw9Rba6HMies2sVcZMWncqB8+e60FXeJ1ykTe2ySTyjDSUA7nHwPrc
	tq0zluMNISUwnlPQGMkj7E9uBPXucO0Z6C0AJebUlTAiUFExLfouX4C7sO9kwFsX
	uqIqMi4u94DgvzCHlz5dcbYvwsva3JB5Gw8Ey2awCbDfDJpN8Qoq82ae/OS0wzCM
	HC9HrMUKY+F/Ccg1AhmPBiCCT5PiEIHhbLgMzEDu5GT/grIqNBVVxHv0d2pvlX6A
	hYx56A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deg1jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:23:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so2111604a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306203; x=1758911003;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2Rn0Zhk2qgPlF/bJPji0KgeEB74Opf+t5Tm2Q0n1/w=;
        b=vSPblX43RZfW/e4HgSWdh9UfXBWmINO5pMyFgVNabn2/B/c6eHJeBtpE2e3WITcVSN
         4jtjocMiXjLwaLdP6s0T91+02d8a3DVrOm41S9drdrdl8TPgPuCC6TPlmwoX0hSE/P/P
         iKBxrbEkmJRAXLMy426n0Ty+WE20fthLy1ojZr49idXMKuUaBt8xzWa0F+EbdIhFvEpK
         Qw8aMQk1ExpfsAgEM+9eGZQopOUUYQiv+V9faIWIxEqeITgOHeaI67KIoVfZL/RU2frH
         4derE4WfL7Hd6tKwWkiZGllZ5YZ5i/SwuIQWL0tp/EqZJ6L1ph6S5dq5PF8AaymDsfhH
         jSMg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQp2PxnTp/yYXVaQBbnxwBBBUwdQP5NNJ8yDK2dj+piCa2I+SUuGkEljJP2Wub9/OQLxU6aK6UzQY5DXc@vger.kernel.org
X-Gm-Message-State: AOJu0YyETLs9RTv7k0VxYOUHPKjApzQwZ1rQt5tU0RZHnwEVOqwWrS2p
	3nYoOhoTtLri/b4ynk0/LwJddFdMumqHHs6OFgGFBYAeHsik333EyCearFC+nThl7sNotUGCe8+
	pLbLVmDHWNcDqQBbGAyPM+09VTPeDT16YMTmLy70tu4r9iEZCBDTMHGPJlhfXofh/F6ov
X-Gm-Gg: ASbGnctR1VEK9oOI+10Evp3vz3FzZhqs6HvC71B7DdgI43PPyhjfJnwf/pudT6K+aB6
	nIUPFKR5CQcJMcDoCyXLGFyzAw0YMPksz4jiJozFBPOex9y39lpWF334IoXVdoQBdgmKeyAwgIj
	Fi3EIiDISEWLes8vwvTRY6tQHG+PaX0fbwhM1cUwzmsDap8OH5myHOjSE0LGhI6y0YYkxDwb/ba
	IkDkRKHixGqPKRe/RWPrvn/vELaYGXJeM9H+jPtLCE0lV9f4cGW13OB671LTMdxTNPQKiAD7YBF
	DMyuFtvgTEOHvK3eQDmuI4lpQ5JSvR9StpX/fkYmNyRe8czG4YypEuyC1DEzFcycqjUO19u1mEQ
	yJL363LhqmGH4QpDViPkU0g7cUnA6dOtyx9eJ
X-Received: by 2002:a17:90b:3c85:b0:32e:a54a:be5d with SMTP id 98e67ed59e1d1-33097fd51bemr4758857a91.2.1758306203196;
        Fri, 19 Sep 2025 11:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrPPr/A79RaXqsrPS/Xqqb+C4t+vc2ZLNFhqzMrVIkwPB4cvK1/aMVX2xJwlhu213uyd53HQ==
X-Received: by 2002:a17:90b:3c85:b0:32e:a54a:be5d with SMTP id 98e67ed59e1d1-33097fd51bemr4758834a91.2.1758306202765;
        Fri, 19 Sep 2025 11:23:22 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551c279cd5sm2292066a12.3.2025.09.19.11.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 11:23:22 -0700 (PDT)
Message-ID: <dd5add54-c121-49dd-a3bd-0acc51fc3a33@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 11:23:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: enforce CPU-endian format for all
 QMI
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250918085406.2049559-1-alexander.wilhelm@westermo.com>
 <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
 <e8d283aa-fb73-45d6-a89a-54ff31f205c8@oss.qualcomm.com>
 <aM0BRto3lYNJdBYz@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aM0BRto3lYNJdBYz@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cd9f9c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GsdoeonjsfuC13c6vpsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3yxHY2ptjeIojgo8J8ys_d-kuAjWVQmc
X-Proofpoint-ORIG-GUID: 3yxHY2ptjeIojgo8J8ys_d-kuAjWVQmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX18vGvrmMlwXV
 ERkBsFSaWtZZ5ibbT0K6FBHdiv/G6gDRis/H70xCTVc1s8Ybkpn2xMiWrgaDDspp7tvDlZ/zG2G
 HuMC4LE/IXYVOoU2lq1mq14j70oBdOPm2llhvXEY6yXlC2ght3TKcl2Bd0Geus0LgKEn3O0Z2Ng
 cNkj2aI5OlpkNCK7EEojBnNazV1nXeT32voOuNS4RWG87WOeHFNBscAO2ZraYeeSQ6E8nmqrqSX
 zJXpJyJyCOepyFvAhRbe2BajZGVjUeoRaxIhi3qO3AOeV+vHWWnPi+47qkDalfDyXu9O7KycWPD
 4iI8gluXsmIO2VTxqASdHIKLSU3z/ky551a7X+drxlQ8AmCYpGSLx+aNMkSvhHPXjPgOOeQSPxT
 tgt5V47C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

On 9/19/2025 12:07 AM, Alexander Wilhelm wrote:
> On Thu, Sep 18, 2025 at 09:31:18AM -0700, Jeff Johnson wrote:
>> On 9/18/2025 1:53 AM, Alexander Wilhelm wrote:
>>> Due to internal endianness handling within the QMI subsystem, all QMI
>>> requests and responses must now be provided in CPU byte order. Replace all
>>> QMI-related data types with CPU-endian types and add the necessary
>>> conversions to ensure correct interpretation across architectures.
>>
>> I think you can break this out into a separate patch, but reword in a manner
>> that doesn't indicate any dependency upon your series (it can be a predecessor)
> 
> Sure, I will do that. I have only two questions:
> * If I split this patch series, should I start on each one with v1 again, right?

for the qmi series use v2 and in the rev history note you dropped the ath12k
patch. for the ath12k singleton use v1

> * When I mention that BE support will only work on future kernel version, should
>   I better avoid the "Fixed:" tag or not?

i'd avoid the Fixes tag.
If you eventually need this series backported, you can do it yourself rather
than have the stable team unnecessarily backport it.

/jeff

