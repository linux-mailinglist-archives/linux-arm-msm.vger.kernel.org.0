Return-Path: <linux-arm-msm+bounces-35434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA19AB1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9F41C20ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FF41A0BEC;
	Tue, 22 Oct 2024 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCqltAEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7022193409;
	Tue, 22 Oct 2024 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609650; cv=none; b=rQ7sykUT4BOnLr/+ucQaQyrlRupx5+7h6dArWbXNkrjzNS1LbNMRYk8lmrOfDRyJXnCClAqZB9KwUzU2W8dJ7aMUCpG+0hwmDURgFiRHnidUzllNyI/jQojGc3I66kXi2FHmkf21Qwo4gMS2q5Fr/dvoIiz4kBqnVlYAAbmr23E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609650; c=relaxed/simple;
	bh=9kncNoCYnoZkS9pve++ljroQDhSRbJF/pxJtccQpvOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0EtHGZwYEbM2jcNuCHjVsnEcgO6UqvHB1sHTlp1TkDMaTw7/bPT0hiIjUuAWQeasaybYP8CKZW7NuTNUEMap1qwMKLMJu5jmm1AXuBfXhk56pNos2eXzix7q6vU4HIEfDwr8M6yKV8UAIjYVCnNJJqCPRsZ5X91M0HbuwMDpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCqltAEj; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7181b86a749so1696198a34.3;
        Tue, 22 Oct 2024 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729609648; x=1730214448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vXDpIcbmYR82/ZYPEZaowKd47+J3jKlxJBdjk/u5Rs=;
        b=aCqltAEjE8e3+qhoX5C8hltotk611Rq5lTnb4hYTOUPOCUJij8mmBshdXZROeVnQRi
         vVhrQh1U1S8ELI8zpf++fy/Np5lUfrcaCzvzWNjaU/Ch3ITD9hC59iOuoNxDvI8yO0yC
         NWrInm4CTz5thXReM4tNjwKjFynR1vUqVWEt+jqqI95HTqEXIepAfLM4A52XcsOQq4/6
         R+aUua04Nf8vvEdN08s19wI9MjSkvADTKYu5HW6yZi0T803hXfaIy7We3iBw74CU58W6
         cXKFneAA4VdYw6pn6mD3fTwcV25s4+JGGJClPVeBDhxYFo762FQG78/dnKT6CvIpPgGr
         W8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729609648; x=1730214448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vXDpIcbmYR82/ZYPEZaowKd47+J3jKlxJBdjk/u5Rs=;
        b=mui52oVWDQP1JiZtnH8JDR/b+dfzHRtAKIswTkdkY9RBnQ00PdUX2+8DsWnN78uCjY
         JAKXX4vjmHJOjhlEMK6/8NbgLZoaiMfmb03rtlEOPFlljePpUVzFM+MUp3Q9rjjWdKt9
         hPr+/Tjz6dBJvo+pqN9oyTUJOPqXarYUgvXfauBO9DJkj9S/zpjMjNjCz62MzzXZvT9v
         0XTpWQF5kwi1KVb3mEoX6igU/5FMLxzAbCHQq+V0nQ1qRwc8JAMjL2nR6qzrpie5rN6o
         LQWAnabdnQ491kgSY6q0RREI27C+55XoGSXCHcfY5qlYh4QL/akHSpU0MKK6INeqNNUP
         n5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUlqYV1dq5PjIq1e2KKKFEfKLjisefgvWaFd7js00TraLZlOmEhUfrMOgLD21HkwefjcZM1jBi/@vger.kernel.org, AJvYcCVROH+e3Euqnc+L3Dpe+TMOoVm+9r0YimJ6NiFSkPFy0NnFvmFdThBemOd6IXXD2l/kuW563Njc9s4MtRYQ@vger.kernel.org, AJvYcCVj5bqw+M4e4CC+xWERneouB9FjFE69aex6qcgHr8bIhOtvQ9l3RrDXh27Q4IOswcKG2MeDpOJSbWK4M0JR@vger.kernel.org
X-Gm-Message-State: AOJu0YxleKXPRCtODZDj26KvCblrpFlKC2Dl+aU/lFFft5WwOzrV/QS4
	zCAbJFHqqwk445KnlwaFUCX/UZ7UJDWriLKUyPuZw6jE+cMDgzPwp+Xby3MX
X-Google-Smtp-Source: AGHT+IGY644/swDDzE7wgLAigf2fcU39yfuvfVlwvsuHZ8BCg9yHMVVKwEoVj2dTjNFoKNEkMikAxg==
X-Received: by 2002:a05:6808:654b:b0:3e6:14a6:4282 with SMTP id 5614622812f47-3e614a64545mr6109191b6e.2.1729609647846;
        Tue, 22 Oct 2024 08:07:27 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3e61035fe39sm1312453b6e.56.2024.10.22.08.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 08:07:27 -0700 (PDT)
Message-ID: <cbe1fd40-2d9f-4396-84a0-741db2c5c586@gmail.com>
Date: Tue, 22 Oct 2024 10:07:25 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 04/10] net: qrtr: Report sender endpoint in aux
 data
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: agross@kernel.org, almasrymina@google.com, asml.silence@gmail.com,
 axboe@kernel.dk, davem@davemloft.net, edumazet@google.com, krisman@suse.de,
 kuba@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 marcel@holtmann.org, netdev@vger.kernel.org, pabeni@redhat.com
References: <20241018181842.1368394-5-denkenz@gmail.com>
 <20241019002232.43313-1-kuniyu@amazon.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <20241019002232.43313-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/24 7:22 PM, Kuniyuki Iwashima wrote:
> From: Denis Kenzior <denkenz@gmail.com>
> Date: Fri, 18 Oct 2024 13:18:22 -0500
>> @@ -1234,6 +1247,78 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
>>   	return rc;
>>   }
>>   
>> +static int qrtr_setsockopt(struct socket *sock, int level, int optname,
>> +			   sockptr_t optval, unsigned int optlen)
>> +{
>> +	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
>> +	struct sock *sk = sock->sk;
>> +	unsigned int val = 0;
>> +	int rc = 0;
>> +
>> +	if (level != SOL_QRTR)
>> +		return -ENOPROTOOPT;
>> +
>> +	if (optlen >= sizeof(val) &&
>> +	    copy_from_sockptr(&val, optval, sizeof(val)))
>> +		return -EFAULT;
>> +
>> +	lock_sock(sk);
> 
> This seems unnecessary to me.
> 
> sk_setsockopt(), do_ip_setsockopt(), and do_ipv6_setsockopt() do not
> hold lock_sock() for assign_bit().

Indeed, thanks for spotting that.  I'll fix this in the next version.  I'll also 
drop lock_sock/release_sock in qrtr_sock_set_report_endpoint (patch 9).

> 
> Also, QRTR_BIND_ENDPOINT in a later patch will not need lock_sock()
> neither.  The value is u32, so you can use WRITE_ONCE() here and
> READ_ONCE() in getsockopt().
> 

Makes sense, I'll fix this as well.

> 
>> +
>> +	switch (optname) {
>> +	case QRTR_REPORT_ENDPOINT:
>> +		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
>> +		break;
>> +	default:
>> +		rc = -ENOPROTOOPT;
>> +	}
>> +
>> +	release_sock(sk);
>> +
>> +	return rc;
>> +}
>> +
>> +static int qrtr_getsockopt(struct socket *sock, int level, int optname,
>> +			   char __user *optval, int __user *optlen)
>> +{
>> +	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
>> +	struct sock *sk = sock->sk;
>> +	unsigned int val;
>> +	int len;
>> +	int rc = 0;
>> +
>> +	if (level != SOL_QRTR)
>> +		return -ENOPROTOOPT;
>> +
>> +	if (get_user(len, optlen))
>> +		return -EFAULT;
>> +
>> +	if (len < sizeof(val))
>> +		return -EINVAL;
>> +
>> +	lock_sock(sk);
> 
> Same remark.
> 
> 
>> +
>> +	switch (optname) {
>> +	case QRTR_REPORT_ENDPOINT:
>> +		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
>> +		break;
>> +	default:
>> +		rc = -ENOPROTOOPT;
>> +	}
>> +
>> +	release_sock(sk);
>> +
>> +	if (rc)
>> +		return rc;
>> +
>> +	len = sizeof(int);
>> +
>> +	if (put_user(len, optlen) ||
>> +	    copy_to_user(optval, &val, len))
>> +		rc = -EFAULT;
>> +
>> +	return rc;
>> +}
>> +
>>   static int qrtr_release(struct socket *sock)
>>   {
>>   	struct sock *sk = sock->sk;


