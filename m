Return-Path: <linux-arm-msm+bounces-86601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB34CDD29A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 01:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B85301766C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 00:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE8B41C63;
	Thu, 25 Dec 2025 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeeaece2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWW4M/ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E88C2BAF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766623579; cv=none; b=lF+ElugkeghXoWRwFNciFYKTHMBa+v2STnXgRfcM+V1TQ7jnGzN/RQH+gbJU0+BWbGJ/PfhBjW+UQS2W/HPBqHu+RqV7PbcLctyOAbVLGsR8Fegg8m+W0zwYNknNkCmLDtohPAsxlXENoqpoIjBRnZaQLP9T7SUiyhCE2CeFmdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766623579; c=relaxed/simple;
	bh=8DGWTajHedfNDn+ZC9egJ9XI3LcybK6uHuulexzuyK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRj1RkiSIGe2kPSHP0l6wECyPGnNTgJrQniqYSYqbmRGAm8KBwFf3qHZ11WDRAr9PYUcLO+eUA0Gc27CcenOWiKFCifXywZRIU94xcTu8AXmRzamQg9Z4MqEjG/NUMbNkpruIPBjZhHRBvkhteifA3mKGaygrKAk/bGHHWHYlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oeeaece2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWW4M/ye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP0h8m6455346
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 00:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=; b=Oeeaece2MZ3qzFTt
	7NKGkQzV0oPQKoo8SlhKKfk2ysifxGsgRQtqnSVYs+cp1yPIcRsXGNQPwAbmyS9c
	Pt5N3vtFiFS4HHAb0052LrkdcgtLjRkj9CJuZi+mTn7hLpzToguYk+gZbnmRJ65S
	CfcgecR5XN3CyLQg73ed21wwB4o3mbtyrT658sdxkhbZ+ICGY/g7Yn7CT0Gu2mqK
	s3q1OoaJ81amfAn4QPIVIStO1klV8CksbY0AR+cM7/Q4pqxWyvVZjAqwZ3xSMFW1
	FZTCmXDbwzW1SoaWSfVtoYYy2GJ+8G7Clbd7loGMuz1Wi64vJ3dzJhjWlM8U0aMI
	QNEKUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r38x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 00:46:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so13341065a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766623575; x=1767228375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
        b=bWW4M/yeafp18bRz59aPk10KCxw4aG6X/MEdOuyPdiW62u+kmtAFhv4Jjbqj2OlqN7
         nnpobMPFGFLvOcOv4rMRqDiaZSSAwHn3UjnOjQ8Lx11IXVSM0N8pmNTk1jXC7ll0j3cd
         H5iQdWnmroaz5K+kIxaOWb2OcQ0NbhkRMZ4tOpm4tTYIUInHatI+aNNWHFLTLlYWwSXY
         36V5uqAo0/427JvxvTrHYLYlqKFyYNypz8T6nGRyTzPhyGIehJ1O3TipYlkkPDYBpdwL
         6gD1OBdDn9RwkXrDj1S8DqRU5c4t/9vbRUthY62IgCV7RAQOjSnwr6uSeSOijAWzeICH
         5nWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766623575; x=1767228375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOjQHtR1y2v1403nVUZI/TN93ZvCJctn5qaK3e885+s=;
        b=sTUIkOrKhxssaoxmMC9th2GlRo2MZGtQMQv36Jb7BQhyqtRhTrzA6V8G8M/Gf/WB9V
         G3pD90nyuM2tB3gcqXlCEg5OiOplLFQtiQLT9klnnbWcgJ3H7U6AAGV+59xPkSoc3RzQ
         HMDPpFdYrrrZfv1DUWIb50Vzt7rpoGY1HIFgf5x/8z8n0cYukyRRCMw6wNQwLm3Ex4D7
         dz2rIVFykVMeYzf5j7LS+YJtCxSRh6EBOiUgtxlJzzT00xYwyI0O5yZ4ix6rXrxkK8FZ
         S+fiO2MCowLH+AotvTRwgtNgTYfhtmyK1pTGNEO6BIAnhg5688SPxT28oCncOYtig1c2
         ftcg==
X-Forwarded-Encrypted: i=1; AJvYcCWM3VacmIj1ETtnyytIr+WVxldosERMx6+iQHDcJVRhipazGdda4gDFj4jQe6GI6by+PSIUHkd4xxGpnB3k@vger.kernel.org
X-Gm-Message-State: AOJu0YxOK/yB2kkl1/cXceXGJj4Rm+I8nTb2CISdMX9H/Nt9sMYNTqXL
	Rj3hkoxUvxfhacwhCO8SLi/+IWGIGlxDOBD7NJBfZsOTzAcNiHRwT5DMqGzWBLme5HfMy6j18Lp
	IGHbWfNwo1I/XTYt13MmBIYjfwzf37ZMLxEpP5Xcju4JeQHp4uKBD8Ot24Rmxp1RzQ2cl
X-Gm-Gg: AY/fxX7VZYBjtCxuUqqmKaYW56hkUjvk9NgkpXByXhQEttgYxLxRJGV+OI3ypgPWlL4
	/fVpPTdPzYM/p96KnJf1QghtfaWUExdfzxjup5vKuUMxD1o9FEEPXAR822rZhAesZGGNsD1FXCE
	TfBwWNHBaR1q4JCjJdjkIpgsuez1wd8ZvIrvdNNNiylSoCGWd2XlBqGGeWnO+j4s/6pcr0yqyEw
	xjKGmRqRTkLVQtkVlBhECPKNTgZ1eOZ0hLZVDltYkZjYsErU4Z1hIDG+6pGoAOLwKe+kvoxFW0t
	146VdzQBf5eISyPLFP3Z68/PrfQbEQzCuCFr5WhWazZ7ec4bvKYCqtjUzfj6C2c+A20rMr4ZHhy
	LpzPlMJ8T3/DdxsCWrrX17y9dMMfzasFGtX81
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-34e92142aa0mr14731698a91.10.1766623575158;
        Wed, 24 Dec 2025 16:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXP9A6tpl8ucIRe8Ods2JAIDC87if9iUX4kBKrYAcnz4tFgm7QZa8EUdMVTSrI0HLbzd6muw==
X-Received: by 2002:a17:90b:582f:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-34e92142aa0mr14731687a91.10.1766623574691;
        Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Received: from [10.216.32.21] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70ddf58dsm19645493a91.17.2025.12.24.16.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 16:46:14 -0800 (PST)
Message-ID: <ab947157-37c6-4df0-9242-9d251defaced@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 06:13:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
 <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
 <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <5ucbip23c23z5cpoevo5uxifl5de7mfipjfkhblyiw2vbxv3j5@h464opwvswrd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xnwyFBdtG0u9mvNlFRkDETh_ePYfGA1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAwMyBTYWx0ZWRfXwC8i3ZvvjlqG
 4xD+OPVwLrZllveDPAeeWhv/fRlYYM8rm1S+cEVbgXEk/Vqd+oYMdRIEKyc8CczN/tAfi0ucJO8
 kH96cp1wiMEBBRDjZ3MeH/zAL8lAS6KWl8YWzSCtJ19eM3rdEPQVOPDWQ5YcaqsEXy+NYGfBHtu
 OZh5mIQJYf/Zl/twD2cfMC8fRUiHvJ5HkajB5MMsXWGkMSqKmbgDXZCpPcdOiraik1eGa/cjA9J
 GK1zEuj0WrfOaFMms49QBxP5HPmT6K3n9LgM/gzDWAk1gu6w2WUwpFRMlZw6Ap398F07RjvL+qf
 CdeAb882QwDMshvX9XQXD1vFmZ84TGTqVK50QbLWX8Ri0l30ujphT4kKkYI+9Sd37jONW0JoQEE
 +4iIXbKAcfADqvNJ0gM/PAvf1opu0AaD1Ia18FPxS3SOiR6r7mpeRNrMqn5eFRufo2LNUOEzj7q
 n3/KEDb5owf6+0BIc2g==
X-Proofpoint-GUID: xnwyFBdtG0u9mvNlFRkDETh_ePYfGA1s
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694c8958 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Pw9t7XW4HU1aVLqCAW8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250003



On 12/24/2025 12:05 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 26, 2025 at 02:32:41AM +0200, Dmitry Baryshkov wrote:
>> On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
>>> Add support for the merge3d block on sc7280 which will allow
>>> merge of streams coming from two layer mixers routed to single
>>> non DSC interface. This change helps to support larger buffer
>>> width which exceeds max_linewidth of 2400.
>>
>> Please see Documentation/process/submitting-patches.rst.
>>
>> First describe the issue that you observe, then describe steps required
>> for solving it.
>>
>>> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>
>> The patch LGTM.
> 
> Mahadevan, you got review comments about a month ago. Any updates?
I apologize for the delay. I will update the commit message as per your 
suggestion and post the revised patch within a week.
> 

