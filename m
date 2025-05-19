Return-Path: <linux-arm-msm+bounces-58419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FEABBB4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC2F117838B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF74E27467F;
	Mon, 19 May 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtwP8YOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE4B274640
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651219; cv=none; b=fpllATWXXBCNGk97EJ/EqkpPBSMaADFkzLOroMSp5e2Rpyq+3sQAg+pM9H3XbXtcoYbkyIzzPyUw8mFSnTpAMJVmObh5E9QDXy96nwB0SwABA26AdkSy60cf/W+23IluULgEiVSFrt1vXzx805aDry51RBn8z8Z+F1bYO1Yk6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651219; c=relaxed/simple;
	bh=g84ZbQQBNZAZVCDuB5DQ1dXFC0XI1GSPWp3OkBhpjb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIyfFnd/vsPaZFh3UIQKmy0tOn7CxkASUmY3GkHuHAc5EwhPwFdAjo4hqGMVri4lKnUBnJHZXqfIC7mHIsEpEF/0gyA0Lx+Xm8V5wFBdwMnG+mqEYxKIiHxRR9WLpnRuYuaBX7nJVanR7LpujAYj8l/yfcQn3GbcCIyBds9WC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtwP8YOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9V1el023798
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNunvHAyKDRuQjsR5Fk3dGl22lS8zfx04q4ZmVMevxI=; b=jtwP8YOYH80PO8LJ
	ABnPoGcVt+YjCrc/xbkA0ZoWc9MvForvYW1qzms6fEM8yHxPUqCwLblwcWi638cr
	mJZFb0IOwRavM2xOgLL7epeUznpglQbpq7ci/9/ELs7XokMmBrjnQsQJcRIFfDLR
	q6fJf1rYqzhw7x2ucFyRdAPZOBczO1y0r+r4SV3GjVwRhvObk39Mpi469fbvDB/R
	W3DjHLs9he/GdyOd7tCXvzGmYI8GN2/CtzUX0x3WHXu+Iy/pllfBEyyqirtiEiGM
	BwbeexUJx+C+tn+3hZ0owN4gp9CIcuDe2WRyHSIWru50kDha20odrLYS3BaqhD8s
	sVrtbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv0q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:40:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990715so1254204685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651216; x=1748256016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNunvHAyKDRuQjsR5Fk3dGl22lS8zfx04q4ZmVMevxI=;
        b=feypFrkWH2Rae4NbSmdDxx8CYt/BBIdLLdi3l66S6tvz2/3zB0PxRYA5O6M1fkbSvJ
         nS8iAkd45J0QWEhOKRkV8xtH2rmGnqUHiBUy48OqPcnTYQHhTpIAlfVo973TfmbP0P65
         jL4dGEvDdxKwATXh6OHjWo8+YCDavMzt8NojJp0eKW9F+1t9mv5ugkAce8Ae/s9cf5L1
         g35hlzKDnFWty7NOpEsCBECsIB3cqXt1bBX+nEL3bQPlyGof7Od8WncJM7Nw9rhKCzl8
         qHudK5k5AphudlJYiz7uUJ3xuANhcy1PmycCi/WL+mkNhHY70DanDuI2NxiwHJh5xbuS
         G+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv9wppxv+d7VXwWEXWr5Me7dWJG2a1yNW7OnKYGtotQ2wC4eKJXu/5JQouruJZ6gvJZgPnPZQYwvLUOBb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyo3CgA37L1tNNTjjLLIlzy93yBcoung3gQ0yMJ2v4sH46YO6
	mgBQuRvLmNcZ4NkibaguByKSuzv8ykyh8rx5KLgZuvhGzyKX0SP/p03ZC7OQeRQLIkfvefv02x5
	A7d9WELgLqQjinH7vcGww4qSXwBE8cxXdYwb45430j1EWl6k+viBudh+q1wIX3+QDIhV/
X-Gm-Gg: ASbGncv/Wut1AQniPLw5ZGH8xVCPl1S7V8P5nfXcqnB50gKNt4JFftQv4UhQUkcFZ8Q
	tmSFZhQo26EDQRIXOLHiqODxb0sldNI2L/3vYWDPPwSz5P892eTGXk1oSm2tAUZ66BnH+UmLtGo
	JZmzN/V4Hb9+xI69/m2dd8sHyalZRsXUd2hVHkUjlr2A95P9Vt9veZezYn91Ju6FGtBOzabaUsi
	bFbxBjp6YK+PYobGMqcePP5D6O8tsipf3ZURXCpH8WOiy8LmkkUD1InM/bteYe9atbzXpVeed/l
	wcVY1dspG6ObqhogCoQFPLd5Bayfnk9cdG0Z2w==
X-Received: by 2002:a05:6214:d08:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f8b08f8b10mr180754536d6.43.1747651216016;
        Mon, 19 May 2025 03:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Skc9ACExrbEwLnHLmp+Q0PppdvM9V5a695hjjw29Yz8NJtOmhXksNLJDqqYJRHflxLJ8RQ==
X-Received: by 2002:a05:6214:d08:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f8b08f8b10mr180754126d6.43.1747651215476;
        Mon, 19 May 2025 03:40:15 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a79asm12163358f8f.25.2025.05.19.03.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:40:15 -0700 (PDT)
Message-ID: <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Date: Mon, 19 May 2025 11:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
 <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 26l6hm2Uq_Ykitiy1JgLxhYwmm8intP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMSBTYWx0ZWRfX5MHP3ZihS+9g
 MINoXLvk+hlkU33N4RtYRPVS8wJhoPZVJazp/trDXHC57SvV6xXJmpi6BiDarvWOqKi1sdHxxO9
 tJHqNa/xrQm0G0pU4ZqGBQgVDwNN3jLfNVp38/k/YYSwtB9OFZGeDNfWpSke2a7jXrTYBEtZWZX
 VqjHBAxfT+wOS+tmput5P7LXb0mZFK6J7S+iurzSxBsccrZ7MHriA6D1gC1AuDwtcJLI9sH2Nbn
 Dz+ZiLkbEzsGm+qM0z+8JgBB+xZ2Fygh3r8mhQMP1S9zcc6FKbhp+7p7bDuwrEcN4yaPsgmbPR8
 pULX8G/muPtWc8Uc9FwD5cCepZXy/ZC2Ncul/RYRlp77lt35KCyhPB9UcRoKbiFQG+xK5DvA1cQ
 5tq4jjYypwuptBcI26FNGgavQLB+tZrB6jQv0dJCD5QqcEOZqT3knT8PUIWfCd6uicKQKtyT
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0a90 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qkwAhwrShwPuNbHiLtAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 26l6hm2Uq_Ykitiy1JgLxhYwmm8intP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190101

On 5/19/25 11:09, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
>> On 5/13/25 05:28, Ekansh Gupta wrote:
>>> The fastrpc_buf_free function currently does not handle the case where
>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>> dereference, causing a crash or undefined behavior when the function
>>> attempts to access members of the buf structure. Add a NULL check to
>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>
>> You are mostly defining the code here, but not the root cause of it,
>> What exactly is the call trace for this crash?
>>
>>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ---
>>>  drivers/misc/fastrpc.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 7b7a22c91fe4..ca3721365ddc 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>>  
>>>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>>  {
>>> +	if (!buf)
>>> +		return;
>>> +
>> Most of the users of the fastrpc_buf_free() already have the null
>> checks, It will be Interesting to know.
>>
>> If we decide to make this function to do null null check, then the
>> existing checks in the caller are redundant.
> 
> I think it was a primary reason for a change: to eliminate NULL checks
> on the caller side, as we do in a lot of other kernel API.

Lets remove the existing NULL checks at caller side as part of this
patch too.


--Srini

> 
>>
>> --srini
>>>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>>>  			  FASTRPC_PHYS(buf->phys));
>>>  	kfree(buf);
>>
> 


