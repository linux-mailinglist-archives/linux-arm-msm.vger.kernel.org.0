Return-Path: <linux-arm-msm+bounces-35725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6F9AEE66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5D01F25B54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BB21FC7F6;
	Thu, 24 Oct 2024 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgBBcvma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B51FC7EB;
	Thu, 24 Oct 2024 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791647; cv=none; b=WKaNRehe+KUB3JEX72OqNY58b2/oUZ+FjsJmAf+VHQ/nRSijPPFUHVqyICXsP545KSxWwcOuhRqsM4roG/7JZa0OJLAU82polgm4zyTgMgOG7No369u8j+JNrc9XR/tCxb60LfiMxIEZQ68q2QMh4P92kbSLkPf9ZYM3sdKvpNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791647; c=relaxed/simple;
	bh=z61wZmORZ8Y8YGjj3BjTQrqxc6rssIHZiu8ehtMQ2fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/M8b2RmgztUWfoDfV6GUGX+izoYGpIH3qHOCEOrg6gy360ZXXfkJoi+ATrAzZrffovz8gKqwvGBwF2+kVlAq9hJjOVKlzlzkpgn+hzqKnko5/2FyD2Cw886q9FLLjp6RrwFqdEc7+HzBgQpIK7S3V4nJd/4m/oy1TvSjYGD3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgBBcvma; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-288d74b3a91so806597fac.0;
        Thu, 24 Oct 2024 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729791645; x=1730396445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Zjv17dU8tomirllFdrleqaUh20JvDrMiKVCU2jx1Mw=;
        b=FgBBcvmaSw3+KUZHtxfAWf4dVn0aDkj3ey3rQQp4NOtVw6cIdPR9wsoGN6g0Jvrog9
         /gKHWpFlT/ufduYOC2rY6DoZq3QCS/oLKPmb2ki5j1OXMi/eHxfDUsIwqb9sibFM+fSV
         0+3jhGwvjvyh0vyN0HuSLbQciqdHI9VX+2bPTMkQrLLKhYOIBR4tImvbN6APpnF+ANGf
         DWsatXkrMr/g9T7Z2r7CcIBzXoItoU57sXWDw2G9PDtt31vlmxtW/Y72u/EDIo1KVHwE
         qraYBbvwv9/Qeg0iULOjXnMgThielaY99Zj7YNoDoBYm4mE6B5uUucuh5Ta+5HDvC6bL
         pdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729791645; x=1730396445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zjv17dU8tomirllFdrleqaUh20JvDrMiKVCU2jx1Mw=;
        b=rgWh1Dw+CK9EyyJAPJookb+eCoMSHsmzjjAS20ZAGtR8TDNx41Xe7BUrIIk3RwQbAT
         dpZOBfCutTG38+xFKW7VvmZ9QEJgRo+Q0L+iIn6kzHkm7BrdJMzd7HlGb7MWx97IO96p
         zFpAaaNTSTRwOyXPkhTDGPor5hyJRDiiKJxTtzVlVvl3Jv7s/00Xu/4eUWa8lp3EDrNl
         CYY8l98r01CPa3DdbSaijLXMW9/qeo8kWSiVWFn/ufX2Rfmlv4nqZOmULKBHewAJmrCz
         KzjBE9SffLwehnvJv2HNSvciCkLiBRxmwYJfP0ptqvKYqYl1mmyVoy+1Q+VG7/nZs74H
         G1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Qug5zO8ooqKPPLyZCLEOxRJ6n+CvGIoCdG0sIFSPodjLDn7X3H4xi7Qyzaqrd526dl8hk5cEr6l1Q0Ec@vger.kernel.org, AJvYcCWHTF9UiBeCTFWWskmwVG6GOIOgNc8/NX0z1gyETffXKpWYT4cbfhdocefc2ZGeaujFoZEv9Z97@vger.kernel.org, AJvYcCWbdQKTeuclyPYVZ4LgPaPSfEb6epfh69X61JMQa9j6Jao/8u7RMq/b4gglbyE7jZSCDevOvPywlmsuxmMd@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnCNVfXEhS6FkU2RMf64xCAUI68eZfPEfWJhWjgN/HvkjuULd
	eAC4fjzpmi5IreYhtfuXfgGRrGno0A4P8hNign2QgssTmJ62/Z4xoDQu0A==
X-Google-Smtp-Source: AGHT+IGSJ6qgqpeMJRK11qx1SIP451P6iwQsNeQsOzCtkpg5iVsmKfyd+oDf+9ZIT5jNRbu2JguyOA==
X-Received: by 2002:a05:6870:8a0a:b0:277:fdce:675c with SMTP id 586e51a60fabf-28ced27ba32mr3054949fac.15.1729791644741;
        Thu, 24 Oct 2024 10:40:44 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-28c79250b6dsm3150030fac.15.2024.10.24.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:40:44 -0700 (PDT)
Message-ID: <2c027bc3-6cab-4892-9544-10a0a23db871@gmail.com>
Date: Thu, 24 Oct 2024 12:40:43 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 06/10] net: qrtr: Allow sendmsg to target an
 endpoint
To: Chris Lew <quic_clew@quicinc.com>, netdev@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-7-denkenz@gmail.com>
 <e4fe74c7-6c37-4bab-96bf-a62727dcd468@quicinc.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <e4fe74c7-6c37-4bab-96bf-a62727dcd468@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

>> @@ -106,6 +106,36 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
>>       return container_of(sk, struct qrtr_sock, sk);
>>   }
>> +int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
>> +{
>> +    struct cmsghdr *cmsg;
>> +    u32 endpoint_id = 0;
>> +
>> +    for_each_cmsghdr(cmsg, msg) {
>> +        if (!CMSG_OK(msg, cmsg))
>> +            return -EINVAL;
>> +
>> +        if (cmsg->cmsg_level != SOL_QRTR)
>> +            continue;
>> +
>> +        if (cmsg->cmsg_type != QRTR_ENDPOINT)
>> +            return -EINVAL;
>> +
>> +        if (cmsg->cmsg_len < CMSG_LEN(sizeof(u32)))
>> +            return -EINVAL;
>> +
>> +        /* Endpoint ids start at 1 */
>> +        endpoint_id = *(u32 *)CMSG_DATA(cmsg);
>> +        if (!endpoint_id)
>> +            return -EINVAL;
>> +    }
>> +
>> +    if (out_endpoint_id)
>> +        *out_endpoint_id = endpoint_id;
> 
> In the case when there is no cmsg attached to the msg. Would it be safer to 
> assign out_endpoint_id to 0 before returning?

Hmm, isn't that what happens?  endpoint_id is initialized to 0 in the 
declaration block, so if no cmsg headers are present, out_endpoint_id will get a 
0 assigned.

> 
> I see that in qrtr_sendmsg() there is a risk of using msg_endpoint_id without it 
> being initialized or assigned a value in this function.

Calling this function in qrtr_sendmsg() should always assign msg_endpoint_id 
unless an error occurred.

Regards,
-Denis

