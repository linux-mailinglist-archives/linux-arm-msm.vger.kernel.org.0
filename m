Return-Path: <linux-arm-msm+bounces-38726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A09D55D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1271E1F22342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013641DC05D;
	Thu, 21 Nov 2024 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7M3K5WA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA121D47A3;
	Thu, 21 Nov 2024 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732229589; cv=none; b=i30gXzt7Ej4m0gbkcTeirB1kwme0lNFypUIickxU4QnrA1brsJuNdCpRe754uOtFikOxvXgZsrc3/iDErKtf6UvyiTMIyVYj/0UDFlL97jLTqF2Vz07KSf4rNfGRe6X2KicbH5HqASQxwzQMjSmk4syo0irfEP9qz95Bxi7wC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732229589; c=relaxed/simple;
	bh=uIK/PTf4YdNVAmm4jEqvx8eLPG0wqWfoLwVs85Te3ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bseVCBaKJBt393tGBzxa0tLl7T039JaRnW+aZmBAO8AMAzXk77hD12/qO6LRhmQ23AYNLhijmSbrwzpACiWY7dOvEPhw8TnpDiGglre68hvG9oNzD0qNa+lKLchCPj+BTyD32lZboPZvAIm95IShYfI0a37I3pON9aOb+qS6Y/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7M3K5WA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3823f1ed492so1432242f8f.1;
        Thu, 21 Nov 2024 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732229586; x=1732834386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy8Cvw23mQ6QDS6EoeKT1hV8E5eJnXnzttW4UOQSIhc=;
        b=R7M3K5WAmNYynUWKsBSb+idrG7QKxDFz/9RWyjnlWqQLoRrKflHoQgotr252KZ3jS0
         KTLZigCORJ1UJzklSTBwPYT5KDN5rXgD6TNC+mAp6R7q/W2vnzbKswm1IQpGb4ZwAWCN
         5TlegViVXqTi5uEQYfQpN826E3NKYugNCktW1Tkdwu1HIVTv53NQmAjPE3Uchq2K7MyD
         7iLTzwBlQC3CY7U/cM0q4rjxPkI/zyK+Uc5xr+Qj/L/78hQaEfD66o+nefu0bJViN7FR
         zg5oyVYDDS9XXY5aP/8QTp+SdAWFgpa+toZ9RqldrsF/X1UEFFr2qNBtjdqVhaOS9MO6
         CI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732229586; x=1732834386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy8Cvw23mQ6QDS6EoeKT1hV8E5eJnXnzttW4UOQSIhc=;
        b=cHXmjFj+Sb89ces10WqvRjnOBTlMrLmhJyFNjngqpDhuVsrcliFIOkOgNOVCpzWhpS
         547MbsnzkS87TxQtfvawNJLXlPspxtFtZ/5g5wMKGni0WgFoxGSfdn2dEhGVqf+CBLGI
         TSaILawO6Wv9qsJh03Xgygr6fQg+eAPyHMJP0g5RKBwFeqD30+GErp51kcPVHFA7oPx9
         DoJtFG3BERKHKjIMuA3EJVlfyvogsZTRJcOTqmV4btwLkFb7Mrn/HkAtboqEtpwqVOuy
         lfj5iOxlAEHszZa4c0z/Fn/C+PVEB03pGQ2L79Q5DC3/eltEXyVcvVa+PHZEkAkMgaR+
         K31w==
X-Forwarded-Encrypted: i=1; AJvYcCVnVvueJVlOjNqaMWqgN+ojBRY0dj2lM/AmGPP6X9FkZwdMsjuIq3/yKx18fWIC+YpKsQA0cHFt@vger.kernel.org, AJvYcCXlgKEp4ILUb2sBFdOr+83bBTav05yjlTcpjl19oeHjg8UMkBgQhPk6+c23RgdExe3OtSx7O//dKyVkhXmV@vger.kernel.org, AJvYcCXvas3Ju4O735IpeWBSx0v303Syupz4+NUEUO4Y0Gmlan3S57AHH4QZR8OdlaNAGtH/do1Ym+m/AU1O8PKp@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlfMN62gU9DPoCdJ43cUlyO8xpiMOG7lzu/RwzaR5zw5P8VYM
	U4fVxFvW9staI/h5XDZq0xLAqilcocaV6pmC3mE+/zL7lyYpZo8W
X-Gm-Gg: ASbGncsjWSTFYJ8hPltUg3SZTVXoYaq4qTzLI89kDfUNnSHb203vxPqkEE6iOFewqxi
	QS+WbkGu7Q8N6m73UF/OySup7ryBWTmoKHFAiKtsDLy6j2dCcNmhkmt9HfDaMf7SYR/JVyLYxRS
	WZm6Do6SWcSXgLNLzfoGJIapGKNktPC0Ob5vOtiKTGgjtRu8HQU5bZEOWEedqT0YUW16/Atl6OU
	pBxU+Tnlv/4QhbAKXabCNfejkXFLtQPaxV85PepVO3NV5XgZEI=
X-Google-Smtp-Source: AGHT+IHkG+U0+oDFtDlZAwwzq2TdFMKDYnwddF1dsNGhH0SxOu849/djbN7vKv8OvZm0mxEXJgLfuA==
X-Received: by 2002:a05:6000:1fa5:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-38259d2c161mr4352419f8f.23.1732229586334;
        Thu, 21 Nov 2024 14:53:06 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b46430f1sm70137405e9.43.2024.11.21.14.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 14:53:04 -0800 (PST)
Message-ID: <7c263cbf-0a2f-4ce9-ac81-359ab69e6377@gmail.com>
Date: Fri, 22 Nov 2024 00:53:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Jerry Meng <jerry.meng.lk@quectel.com>, loic.poulain@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
 <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jeffrey,

On 20.11.2024 23:48, Jeffrey Hugo wrote:
> On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
>> +Manivannan
>>
>> Hello Jerry,
>>
>> this version looks a way better, still there is one minor thing to 
>> improve. See below.
>>
>> Manivannan, Loic, could you advice is it Ok to export that SAHARA port 
>> as is?
> 
> I'm against this.
> 
> There is an in-kernel Sahara implementation, which is going to be used 
> by QDU100.  If WWAN is going to own the "SAHARA" MHI channel name, then 
> no one else can use it which will conflict with QDU100.
> 
> I expect the in-kernel implementation can be leveraged for this.

Make sense. Can you share a link to this in-kernel implementation? I've 
searched through the code and found nothing similar. Is it merged or has 
it a different name?

--
Sergey

