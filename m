Return-Path: <linux-arm-msm+bounces-109055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBNKK3H8DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:37:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F65A4EC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFFC03078AD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC3C3CC7D8;
	Thu, 21 May 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LK7jjMjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DX5RCLMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB43BBA01
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366556; cv=none; b=Z7RByVzSyTuJbM+yzF9bZbcTRcUKhTX+G3WO+8GhWA9t/5L85uXX1cwWdzJHLS0ucgK1Q8D/RdOIqDXmAVqNj57A1lqAzvV8KGxH2bw01zyxlY4BKb0AKooydLe+TkO+Fv0GtMOcdwN9KKwqCRzmpBTo2mYNw0+DWbaSkKLDPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366556; c=relaxed/simple;
	bh=kHDTbzNbUumACjHOVh3NPKf8pbqkkE6rXVbSML6l4Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9L53sReJwPLv9VcMAH7S87qHkyUKTwrGpmIOh2ho1mbJ1kuV1G/apyp2OXM08/PnQlsbeE2HIhFyARLWp7f+65HIQrEU1t1frddEGNixwywWgar5FZe3//wwGZh+VqCgwJf3jLtVKBx7hIYcvqS1gtd/4grkyIhAQ9rh/Tkrp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LK7jjMjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DX5RCLMx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jwu3527290
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8Xi5z+FCk7PL+V8zhBB5Imo+U7JiUrOw4e7dC2VIrQ=; b=LK7jjMjDcqfftAVi
	DdyZ5JwoTkvnNvM7R0IexhiLZ/Y0u+SzE91W9Ms7IW5kDEJkv9AsIGYbX3Fg/ejA
	q10YVl3MsGKC/s2+UceInp35b3xQ1bMm8BtPgyD56YYkeIPu4HlkBFCd7yLbpR7W
	Ssucl+UqyR3X9lhNtddLz+hiJ0FFapFB2Dt+XunmPzUXGNlkPOOd8Cna7sXZLCqB
	VJACbNCSAaB5qP1KkSuKI7YPH9/OAXLTYwFVR6UMN7DcrQPWDb2F8h9feBDISxkg
	UWXEgDAJ1JqaIOo82s9e6hWJH3BUZjYsuCVDOK+6dhSP9b4xVvt8kQAL+nuqrGDP
	vyf1Ow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhj71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:29:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa366fb79so8265029b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779366552; x=1779971352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8Xi5z+FCk7PL+V8zhBB5Imo+U7JiUrOw4e7dC2VIrQ=;
        b=DX5RCLMx7ejcy1fzleQQxOXU+OO0YfpAKAqJAY44dkH6g5CJwPGuemwWa/M7w00iQM
         +qR8uLWe+ACrnR133iAEEllVzes8kdVEJffjOOSlcV9obJUov9hKIZfhZdf962zVY/fg
         kGxmmBr6xwxZ8iUm60RI0nzwY2wWpCYPjU8xYBIjE3VAxctTaCIMhh253u7cyhAWBfBX
         8TWgmy5dJBUkGJK+cAesPTXiQiJgc7qE8w9OdufCj2PA7NC6aQT2YPo/T+Hr8vSC/xDq
         SDtmb6B66Yx71IYTXzMhtAqD0syL6RERnBcYw8LKfrWYTAs0iy/+J3qjJbC3NddcSlBC
         EuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366552; x=1779971352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8Xi5z+FCk7PL+V8zhBB5Imo+U7JiUrOw4e7dC2VIrQ=;
        b=l+1kZtW0mGsBT6KxR4sPyLJ2AdKy8VPLS0Xw9bBYNQSTk7mLO4LxSU8lAljGnndEPQ
         eN1Qi3RmuS//o5WEmRmgGDJcnxm4KVnSE+KtGQfDzWgIoZWp5W0QlIdUEZjessCEDMMY
         VQcxzqybiM8eMOpRnUIOQkEdR/ZXbXuGfnyowIY+vt1hKHh+GYDOKNK5a8sRYeGFnHRZ
         Fb0oHRvR7HFDzhPHdOVmXH03RT6QHRtzJSCz6Co/qr2rXkp37n3NfUl23hPHSO7Fyp9s
         EwCHeIlD/m6/o/khQRJ5mED7/53sPI5XmMO89gPoUK4oJwLw//gL0ZMulgm2Lzjo+qxG
         FQcg==
X-Forwarded-Encrypted: i=1; AFNElJ8eeLR1BpA7edXdxaElWvEsKKHxEm0QzFT7XPCF41RjUGE7nUZpMuw8d28mt3HdwYGqCihxCrSMqzTSicL2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3O2UkE3uI3E+h2pE6Qgq4/VGaJT5lvOQRGBxbwXt4Jdcc13Y/
	XK3n1vxS9YR0Q9UrOE7uBTZ9dQZPaWbxhVFm/f3uukOeBzF3mjYAVaWkA4PVxxCtJwMFU/BiY6D
	oH/WFh5i1HeSjDiFlyqlWoaZ7nEY5+ByxT/OTvoxtM8/Vyn8d/QohpHKWgrS2NbNjVsgH
X-Gm-Gg: Acq92OG/LGJDnPUZqHYvhqlMwUTaqXBmq9DhT/kXf2rbMjsbm01+lJILffOJM/1gFue
	6IdIl5xismAgQchve5vASqx+m1yUyZ8/hdWHDlehWTo+nIyzweZnxGIffe3EaS7LKWYhUkh3urW
	32PAF8gkAPAllegC7SQVpSgsdH7Aj+cMeu1R2nrXd10H1f+lu5ceTcIHXcUViOlRhx9YeT8Naq0
	KKgSmyDOxiONVC7U+IhBE0x1GQ6DyLdDR+OVjm1mfPyIMqTZjIAZmIIAaq7a4Q3DyNKHnQ811rt
	akDmlNLxI/0SWynxvA1WE5+b+goMd8M/10O2J5Xpp7S4MtZQ9b0egiYBMgujGqiAKIXb0O03sni
	IGZpQHbWphqZHMp735v3nLVxkgOAXv0ZLOKWRZQgoUG5zR1uDtMLCGZtz4wFEsa4CedebrYq0SZ
	5ryujbINsgxwyAlI8JGIikNUzFPrYV
X-Received: by 2002:a05:6a00:4655:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-8414adfcf5emr2926542b3a.32.1779366551779;
        Thu, 21 May 2026 05:29:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4655:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-8414adfcf5emr2926480b3a.32.1779366551232;
        Thu, 21 May 2026 05:29:11 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e1d0a8sm1279516b3a.42.2026.05.21.05.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:29:10 -0700 (PDT)
Message-ID: <6a5144f5-8734-40ae-b170-eae107089a3e@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:29:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
 <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
 <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
 <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
 <d4c5d26c-47f1-4e42-9852-d407982cb4f6@oss.qualcomm.com>
 <djigwx5k7j2rkaoq7g6paor6l6i25srvq7chjqqnjlbs3shcco@x5drauwxzngp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <djigwx5k7j2rkaoq7g6paor6l6i25srvq7chjqqnjlbs3shcco@x5drauwxzngp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNSBTYWx0ZWRfX2ZP9v9mjgrsv
 f6BfUBKvq10QNdFcUBybyikxni+PRBuucrzf+0SceD5d5Un4gxM9Z7VZZOawpplBt3gR3OnyM8N
 AhgPGsL/GEHo8JgLWYkxjgNY3JP7sJvkL59lMyBsLq2BuJFmjnnqBxAxb4LAFS2Y87D6J3KJJ4s
 3aHmKArBaTpRBSuelVZZZ0fUJCMulM4NadjNSQhr/kclHqxkGA35C2O+FahfKlrZKPK8u6a7wZV
 ozSH38eItkfRMBVnLXLG/CV5FyKsG396+i3+G9woYC+K29d1waBveVvvCBh72NPwCundkofuN5e
 lAc0UyLtdT7tHU3v/1u6ApxZQK8pOjxO9mtkr16nBg2nYng0igYcBFFVnq1D8yNX2RzrjatGzuC
 u57pwPYCn5nlLkmUrNUGF6Fxa4DfiGUGP0vEDtAfxWpN1yC0wqwgCRfL5H1hz2ADbg3y/I3T77G
 ZjjoczSV1bb0E1eNFUw==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0efa98 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L-3u8DrejJcmkFE2JFAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jp8W5bQeRLZa6b6E_CABTvy4sJqSidvL
X-Proofpoint-ORIG-GUID: jp8W5bQeRLZa6b6E_CABTvy4sJqSidvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109055-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,patchwork.freedesktop.org:url,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155F65A4EC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 12:36 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 03:12:17PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/19/2026 8:29 AM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 15, 2026 at 06:32:29PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
>>>>>>
>>>>>>
>>>>>> On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
>>>>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>>>>
>>>>>>>>>> Add HPD callback for the MST module which shall be invoked from the
>>>>>>>>>> dp_display's HPD handler to perform MST specific operations in case
>>>>>>>>>> of HPD. In MST case, route the HPD messages to MST module.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>>>>>>>>>>       3 files changed, 48 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>>>>>>>>>       static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>>>>>>>>>>       {
>>>>>>>>>> -	int rc = 0;
>>>>>>>>>> -	u32 sink_request;
>>>>>>>>>>       	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>>>>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>>>>>>>> +	u32 sink_request;
>>>>>>>>>> +	int rc = 0;
>>>>>>>>>> +
>>>>>>>>>> +	if (msm_dp_display->mst_active) {
>>>>>>>>>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>>>>>>>>>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>>>>>>>>>> +		return 0;
>>>>>>>>>> +	}
>>>>>>>>>>       	/* check for any test request issued by sink */
>>>>>>>>>>       	rc = msm_dp_link_process_request(dp->link);
>>>>>>>>>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>>>>>>>>>       	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>>>>>>>>>>       		msm_dp_display_send_hpd_notification(dp, false);
>>>>>>>>>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>>>>>>>>>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>>>>>>>>>       		msm_dp_display_send_hpd_notification(dp, true);
>>>>>>>>>> +		msm_dp_irq_hpd_handle(dp, 0);
>>>>>>>>>
>>>>>>>>> Why is it a part of this patch?? It has nothing to do with MST.
>>>>>>>>>
>>>>>>>> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
>>>>>>>> I tried an alternative approach by calling the MST IRQ handler from
>>>>>>>> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
>>>>>>>> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
>>>>>>>> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
>>>>>>>> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
>>>>>>>> However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
>>>>>>>> MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
>>>>>>>
>>>>>>> When are the link status bits updated? Please remember, we need to
>>>>>>> support all three cases:
>>>>>>>
>>>>>>> - Native DP, native DP HPD pin handling
>>>>>>> - Native DP, DP HPD pin not handled by the controller
>>>>>>> - DP AltMode, DP HPD pin not used at all
>>>>>>>
>>>>>>> In the second and the third cases we will not be getting the IRQs.
>>>>>>> Instead one of the next bridges (connector, EC, AltMode, etc.) will send
>>>>>>> the HPD event, which lands in the .hpd_notify() callback.
>>>>>>>
>>>>>> I added some logs and did some testing. I think
>>>>>> msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
>>>>>> HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
>>>>>> in the IRQ flow, the HPD state machine has usually already finished pulse
>>>>>> classification and returned to Connected.
>>>>>
>>>>> But the IRQ should be sticky and it should be readable from the status
>>>>> bits.
>>>>>
>>>> Yes... I’m not sure how this is handled on other platforms, but on LeMans
>>>> can not get IRQ status from msm_dp_aux_is_link_connected().
>>>
>>> Can we clarify that somehow? Maybe with the hardware team if it is
>>> uncear from the HPG?
>>>
>>>>> Note, in the USB-C AltMode case the HPD machine is not used at all.
>>>>>
>>>>>>
>>>>>> Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
>>>>>> will usually not be hit.
>>>>>>
>>>>>> do you have any suggestion that in how to distinguish between an IRQ event
>>>>>> and a plug event in .hpd_notify() better? We probably don’t want to
>>>>>> introduce another state machine.
>>>>>
>>>>> Then, I assume, currently there is no way to actually distinguish those.
>>>>> The easiest way to handle the replug would be to store the current
>>>>> "connected" status and verify if we are receiving "connected" while
>>>>> being connected or if it is a disconnected -> connected change.
>>>>>
>>>> Emm.. Currently, regardless of whether it is the native DP HPD (on LeMans)
>>>> or DP over Type‑C Alt Mode(test on Hamoa), a single plug event always
>>>> results in two or more identical .hpd_notify() callbacks.
>>>
>>> Could you please check, why? On Hamoa it might be because of the LTTPRs.
>>>
>>>> In other words, after the transition from disconnected → connected is
>>>> completed, there is still one more .hpd_notify() with connected → connected.
>>>> So it still can store "connected" to distinguish between an IRQ event and a
>>>> plug event from .hpd_notify()?
>>>
>>> I've sent a series, which explicitly tracks the IRQ events. Hope that
>>> helps.
>>>
>> Very thanks for sending the HPD IRQ series
>> https://patchwork.freedesktop.org/series/151522/. it very helpful for TYPE-C
>> MST.
>>
>> I’ve been testing it locally based on HPD refator series, and TYPE-C basic
>> plug case works on my side (although with some local modify, maybe now it is
>> workaround). At least the IRQ is being delivered correctly now and the
>> simplest case works. It still need to do some additional testing.
>>
>> There is a small question:
>> When do you plan to merge the HPD refactor series?
> 
> Would you or your colleagues review it? Or at least T-B it?
> 
  I’ve given the T-B. Could Konrad help review this series?
>> and could you please
>> rebase the irq series patch to HPD refactor series ?
> 
> Once it is merged.
> 
>> so that i can keep MST
>> depend on those 2 series.
>>> Thoug storing of the "connected" state should help us to identify the
>>> long HPD pulse (wich should be treated as unplug & replug).
>>>
>>>> This is my current understanding. If this is incorrect, please feel free to
>>>> correct me. Thanks.
>>>> As an additional note, msm_dp_hpd_plug_handle runs through its full flow
>>>> twice for a single plug event. Also, the behavior I described above does not
>>>> include any MST-specific filtering codes.
>>>>> For a longer term (and granted that HDMI also has a notion of HPD pulse
>>>>> events) we might want to extend the DRM HPD API to pass through the "IRQ
>>>>> pulse" events as is (instead of converting those to
>>>>> connected-whilec-connected events).
>>>>>
>>>>> Let me sketch a draft for that.
>>>>>
>>>>
>>>
>>
> 


