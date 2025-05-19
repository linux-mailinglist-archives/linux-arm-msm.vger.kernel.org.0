Return-Path: <linux-arm-msm+bounces-58391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08EABB9B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2290E3B357A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E82D26657D;
	Mon, 19 May 2025 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9HXMhgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F031F5402
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646751; cv=none; b=RCeQLGeVGPsig5X4XOGrlf+khJ0fOL5kWGBypnIACIYKywdgLm4Vma1LZo9DiSMRGghsKpijrk6iAEpiNZSag2xrcTycL08uxQbLYtRfI38cJyohSxI3aGLq77QxHiWDo9k51429k37hTK3qgm7bOLfaOIE/PpMe77f0sWJ8eUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646751; c=relaxed/simple;
	bh=w0g4PRmkicbmBv0K6QnY9IMFR6OueDieCzcnUpTktuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tij8bL4Ie75YwCrcXL6rm6kAFLBEivFAhRg2AZVuIPFfsdzpAtL0zxoZuIg5Poy3vGoCTZ3DV/aMe3bPGiHPCPMVp/aW6Ip4BdeEVk0pgRSl7lTRSgvIMtbjwwDdIRTg4/mxDJPd9OOpc4cxm0dhFWiovW8RTjPdZHEgnv7ZgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9HXMhgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INLtFK019020
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=; b=L9HXMhgn+sALb2cU
	vGZM3AXs3u9JKi+1eXAPTTIDY+C7wAXEPqWQH4hYJCsKdbex+OoLKoxfi57MQW2p
	10E6bUMthb+v7R7A5TEHtCgSheBz1PJFJqhov9kutEohNBa9RBZMLDu3pz/fEN6r
	UW1c6qPM4MDaGxSjWSzdYFBG644ClCSXBgW8dgbf1ZQ4/DbdZbwnsdU5l7SJoWLf
	cnimjiIAwyofN7jiISmebuKMCpEuCPwV1bpPh5UXyGwWRxAYzs8sLuWVnTfjxLUX
	pS2Mye5zSRSwIaQa3VLvvOoGJtqb60A7SQLZi6992peIAcidXwdJ43w1yTdC8doy
	eLw+iQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4uu9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:25:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so46554996d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 02:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747646748; x=1748251548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=;
        b=LZZjYe/zEoQ3kfNbXdhYVQKenFJZOztX2Ctnaa/bbNW+tggO5trbO1J176ZTotXz1c
         kf0sB8K9TBDVpj49eXFqNDYTzuCed3dAl6btQsh88soWtWvOrEOzPJAcB29P2UO6yMqX
         Eyr9oYm27Tunwppd+JC/jCcnZdW2Ywa4Mgn86GgVBUASYSV6duJenHfdZ8WXcJFs12J9
         XLiyN9ePMcQUXSB8JmCI6QOCOAmAqGzsvlaUnDCusmWiT03SDlLcRsnyiUhuvUOPwCPU
         CF8wkcgK0vqlgTilagQsYdrFoTY4muDZrzxVEGuu6QwUVCyE9qSrk53UA8DwNUmMIXDi
         UUyw==
X-Forwarded-Encrypted: i=1; AJvYcCVYd7jT2OTtDin+VquQ9fEIw/ov1lGeC6yQTsZLYhK5OPcwDp6YZpYw0bOZsQ3aTgkCxu9gKdR4CHbcq1hZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iTvljC33ifHqnKoz0IlAAYBBZ5F2VQIYGJbsGNdm2orQ5h/E
	LS/AfGAPSQjZ+LqN9pPsqH1JrCCrRLYkkg2c5HK1ECXbUWd2gNy2gKwMle/t04VU0geFi5aVMWH
	rLUBX2lPiqlwNEv3e9jWa3kXi+TWtDb0jETD+dnMVHlN20ip4I+IG7xTYbEt+u5dLGnMt
X-Gm-Gg: ASbGncsFUzUA/eYwZpOUqHp84MP16/An/CT7HvWxTdImtAM/aTUv7DuEfobbplfVrVV
	DTM/Vo6wZ/HnBJKNhAvilmFiXyKeqC5Gir9aI4T53JcuKycagDYoNliF2e3NfRrTjnAagSUnjDN
	yLHZ2YMDxJKTU2iLfabLeLL+8l9R80Qm7RQGU+ktPKocCiGxcM3o8VEyG83xDmuLIjCTeOvSiaE
	O1MSK5XT6a0SY+7HmzCtS5s3P2UZrdW/EnIHjH7Wn0DS5uHE4PiArunvwQwUxdU/2NrBQQuxwfa
	3PyIQsuH7MxdVwmiU699WKIl3Zr3SwBqMtR8LQ==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f8b085283amr192920026d6.29.1747646747726;
        Mon, 19 May 2025 02:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGiafe5ZWJ8f8DrhbWyQziFJ8QjaA0cqULFEHnBX08KZJAH9eyIz0zuHOhiSLANggQAhMIAA==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f8b085283amr192919816d6.29.1747646747371;
        Mon, 19 May 2025 02:25:47 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caaasm11928555f8f.83.2025.05.19.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:25:46 -0700 (PDT)
Message-ID: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:25:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682af91d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cMXQlDtNq5-FbXNvT68A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 3FJo45XH8pSSvvJqnQybErZdHZjQPnXK
X-Proofpoint-GUID: 3FJo45XH8pSSvvJqnQybErZdHZjQPnXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4OSBTYWx0ZWRfXxPO8Y26Ar6Ht
 yMBCKhNUOEDHmWEnHvt4Ygpdj6Tqs8DOvlyCy7pgK9/QmzXamPbbo+aG51QMvOQzxAnQiUEkZTA
 F11WqrXOVHN+ixAo1xd5KSexWIQunFo9wEVMDOTmsj9jumGhndkxYfiwXabr3r+Vz9TdIun6euF
 fGEtsRvW9CLX3j6R88FyRnY7t+VtAMVA4ziTuJE41I3+mILZ7xC0V8VV7PphgOLDyYUto25wzj1
 Hnuj9nwt10ObL0fv7GGhs9qOxfDcprl0rean7hw+XLqf5Hs15qUcMx5I41oblNAtMVhWIlA6moe
 lpn43jwAab8BRxOrMN3JF28NGszDR70zSb+XJ3M1SEKpYTBAQjjJZAxSbBnqdf+I8iSH0tI47Xy
 VuQb8EaBl8YtJBNQonZZksIygO1FgCnVIrBpbXMhlYIZ5ftLuDjVUrzgROC0B3OZUbwOtuu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190089

On 5/13/25 05:28, Ekansh Gupta wrote:
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.
> 
You are mostly defining the code here, but not the root cause of it,
What exactly is the call trace for this crash?

> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..ca3721365ddc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> +	if (!buf)
> +		return;
> +
Most of the users of the fastrpc_buf_free() already have the null
checks, It will be Interesting to know.

If we decide to make this function to do null null check, then the
existing checks in the caller are redundant.

--srini
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>  			  FASTRPC_PHYS(buf->phys));
>  	kfree(buf);


