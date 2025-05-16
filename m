Return-Path: <linux-arm-msm+bounces-58239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3255ABA368
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 21:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDF24A7D03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 19:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE227F16F;
	Fri, 16 May 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcNBF8mC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD124678B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422446; cv=none; b=VQrWhPNQtVksUckgcP9/cd+Jsm99XllsV0BANcCbJHHHmMNnZY0LcJRnD3GT7/v5J0VM8EGsm9AWhy7SvZ2/AaM+WuSt9MeEc2eZ094nQ1Bu3HKT2m+rLwQrH9MGun4lnr/ufnHlxKVbrzsXem4sQCZ4ZLIx4gwCMVy7UJAPUsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422446; c=relaxed/simple;
	bh=6OMAleZ/ee9YO4/rsb0r1/EcIpx2FnUb2zPjPXqMYTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQrLyuS/DQkUgX/N7DX2yKSdXIz0KlElrAjhsNmr3lgs8G6wzsg0HhMAQNyjuPzyvXFCi9BWoXYLnr9RDShFjB4GSxvkEoOADKUUK0Zr38oA1dUCD+HYGg+aAtdzetin+1BgYnUKtAw7KZKj/YFrkMreGO0+ei8Hf/XWUiJIEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcNBF8mC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC6NZn020842
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=; b=QcNBF8mCDeyS5Naa
	0T8m/NLXdTMUNhPA/tfAQMn+l+rCX6qgTYgoGHGbr/2nCbMRoUv83DkADcWXRnzs
	+98CposOLGncta3FYfLQ7SyThCfMb6a+5++M3Da7ZCvgxXHGV3Bvr1O9KS83xG68
	4SegbEtYALcK6MT4ebdPPkvg1/RU9PnMoQO98unwPaOLlBT/jbVchSXIej79vOx1
	bavNeC1aZbwEnaMdbTqR0DqEIRYNxC+kVvafyuMoFRr39gA/eI4TZgrfYmZacZkZ
	69iEnyXf6BdClH6MsAGUAk0ngtahfqF9pVNplhiata72SH9VIEJHlrFR2ACXvLp/
	X5TMpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewars2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 19:07:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74235ee893fso3509488b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 12:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422442; x=1748027242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=;
        b=dK3HhmOzG9drL2ECfV5CNYooC3gpNOhwX8stPusOE+cK2UamqcesqvLtYvWkp7vtaN
         0F389T89VEvUjMKOh+qbYn+NOeiB6vdlqaKMUZi7rsQd/BfGZbL9QojdFR+f5X8Tenef
         x2dxIgMvWka9WL8Sp13halVz8jbPpK4ycm3rvdLaZCRuRR9j3J8j+5kVQqtQ/xspfwCA
         uQJ8N/Q0xVegbaAjhwDxrh/kHcVEFsnu/QEhCnYl0NyPUagaS5wPnq/Kybw4PuJTPmwI
         EdeilaX5sB0POT1Y1mg4oLDLl+tICJyIUYP4sxvd4KPgaCxUqRkYq9+vCTNYTiCBs4Zs
         8v5w==
X-Forwarded-Encrypted: i=1; AJvYcCUchYXXehNzyOcRGAsn2JTIJrI7pEeAhQ3+vrqyO4OxG0p5UB0POUIC2ipC9+VYBp0euu9omb8Xhj8+4LOg@vger.kernel.org
X-Gm-Message-State: AOJu0YwUw362b/RnqJm6dfVAlHh+sFEjluJiLJjPYw86i5eTIwQMp1xF
	FVbrBMBk/UWGcmMUnr/3cyXbhBsGgkcyqSJqpBXsb4jWZHenKsXSKE5sFCBfcW2wW/f2A1AHP8E
	6TdcTnlPX98x1nIvS+65yw6UsCkMoa9DHOLeX+8janDz4vfl3RxqlC0/JePawJJ9T1xzQ
X-Gm-Gg: ASbGncvRZdhDkk2wuickXvcyU6aKd7BDNQSqP5wtgMT0trK82tXTV/hAFrYIc/ZwIX9
	+YHZhPH7dDpT8eH8CM5N52FbZsEjukyV1MbHFTfhJjmbopPBjwoEFXuyN/hc+gsayr+NsD1VDY0
	az0y70DS9CyAZBbNOlpzMNRKVxrYe/6x9BZsZrwtM1dz2LDICG6LPqL44e7qQx/yBTVtySbHbj4
	LvEo/QI8o5nPhByXnNqlVDM/SVuXaf2gb18byMsMb5WhQs/bbNtS5LvMGgVjWzP3YsZGO/YY0Y2
	GE0iOOLTBMbwcYbdKgfRGT12mbvn05ximQeNk+6yY8lmjMaqbz18d3v4Hefn+g==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579633b3a.6.1747422442037;
        Fri, 16 May 2025 12:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrLgC8dkstiJdx29E4dD097tJ0PNl82Z3nmB55Pim85MbNDC4YrFBzPEITGZxbyFl2dSY5OA==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579575b3a.6.1747422441535;
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876d39sm1914504b3a.146.2025.05.16.12.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Message-ID: <b0c132e1-b75b-490a-b2b5-3f5e5c7b99ad@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:07:18 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
 <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
 <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -Sqc7StgFGJDK_2sC4MPc09_91mBZycT
X-Proofpoint-ORIG-GUID: -Sqc7StgFGJDK_2sC4MPc09_91mBZycT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfXwDKzys/a/9r3
 krmQIeC72nbIwXqUycDaeGKzR4ykw5xLsED+7Sz+KmI3FAy7xG5wmG4xawtzrHd321o7AU5htAC
 ektwhsT2vCmvR1jRIF4Xta5CqUV1wzdfQkmJPepEt/e2SLaKqbfgn7f64y0pvjnL7rkapfxCIih
 4kVHfBhusgs8DQy6ffKrLJXWDc0c/n3lk0ARa0XAuGxjZDv5VTZuXqcxiWw1+G7tfec2Ns8ZbvI
 brA1u7NSxr23AF9QVAspznfJ9PoJe3nw91jbpL9RYjbo/IDQ03LBKqw9yvGV7ELkJcukUKQCDzc
 AAzr4OemgtSei6onArIT7r2QvmiR+quXZhfIZB+kY/0Y6QT0LF+oVPxnfGuUHVO/BF/A2Vm64/O
 q58E8o1VVp6EDZfzkbeLXHP13CvpjD4pen8WEbswaUYNs5qm7nBOSs6AJp8yD0VzY9Xgroaq
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68278ceb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=REsDF6D9n_RRfkEuQ0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188

On 5/16/2025 12:42 PM, Muhammad Usama Anjum wrote:
> On 5/16/25 7:59 PM, Jeff Hugo wrote:
>> On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> There are two allocations of bhie; rddm and fbc. Optimize both of those
>>
>> There are 3, but you touch 2.  I just commented on this in v4.  Only
>> touching two is fine (the device for the 3rd one doesn't need this), but
>> the documentation must be accurate.
> Yeah, for 3rd one in mhi_load_image_bhie(), this optimization isn't
> needed. Let me rephrase and resent v6.
> 
>>
>>> allocations. The rddm is of constant size for a given hardware. While
>>> the fbc_image size depends on the firmware. If the firmware changes,
>>> we'll free and allocate new memory for it. This patch is moticated from
>>
>> moticated?  Motivated maybe?
> I'm using checkpatch --strict --codespell and hopping that it'll catch
> typos. But it misses some of them. Do you use any such tool?

I use the same. Codespell is nice, but doesn't catch everything.

-Jeff

