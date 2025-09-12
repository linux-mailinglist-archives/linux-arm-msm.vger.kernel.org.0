Return-Path: <linux-arm-msm+bounces-73382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFFB55649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 20:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D2D1730D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B6832ED2D;
	Fri, 12 Sep 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeOxtFpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366223D7FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757702160; cv=none; b=HmoSxDfHE0ztK0eVnIhw1WASbKVxT30AvZASX5NutcyL0aaK56LnlctHS8lFKUqxsTo+ZmX8kuv8P4QjAMZRWuu2hw14/2QvScdACvjiCpYoItcbKeqgQtnxJpFef8PtKOWHVPYRNrfsIwp/K8oR3GR+vIS7kBw28jSUYbxsDNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757702160; c=relaxed/simple;
	bh=y4gWWqmz84oG206JRwdNKi7A9nqe8+bM/0jPZWiNXtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kweEjAJUjoX2t55MpQAdkGGIreWGFC/DRVPYZAZhcLFUdoC63g8H1h249NFmntdgZ6FtGtAtCh9ZlcMGUgsyNJcP/Xoq8ki0HesvKk5XdFbp9BScICdXviPT3DlDhtD35J60JoJp99vLEbnkFff3M7OSCsg+niZw0QB80JrUtOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeOxtFpt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d19699240dso1893313f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757702157; x=1758306957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=TeOxtFptWOd1RU9pHqHLwx2CyO2LBGwUxnU+jShsmNmONkCQB/x2UZkLqoIKZlziZh
         /oumduplmrNAWzJ85JCY9ON3Y7PVG2dcE+tOcK/wbSo5wqspnWaObSgEvOkcazk25P41
         OH8Po3w0R0ixOXE6nP+fhUDpHYaiHKcihJRB9k5xqGdZpYxnL3Ty1Nslx+KcvABgzd+z
         VZMG6kYSdLmivO6XWXfZDD8VQSwJ5JNLBu+JdnKZFfJ9a501LJFKaEWknwKUS/ygzUOy
         6U82LPqwAZ2zRvO95NRQzOrUUeBj7DVRvPXm+kjR76ZYzfFfMnc2JoP7wPDtcoBA4eQs
         SJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757702157; x=1758306957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=ayxBzHj0CnEowGMfM+1ZHhWxmLio/vAack4y4hAbuNo5vrZGWt+duzRRP+OrY4RPqu
         uoakitxsQgDn9rCKXOJyL1Jks4b2otQbpL/lACn9vRuwdGvuV6mJ2naN8JMhYJG4lqFX
         +r1pdmc7fpr7XAXZP/81VHTaCIL8ftowq9ZGI51xU2Fh40q+v4WlkVhO6MGodgkn0E9x
         kZp2GsONxFLoB3oFn6tabxBtOF7BD5EPnH/+b52G+f0hPZCtc11d7UYj5fcJJ4wXADat
         onfEQHadZKHlWjl0X/jwlBlr684+qw1rl0HqeO0j1YC5nLxVfNGka3tOqcxEKu7hPLFz
         A6lg==
X-Forwarded-Encrypted: i=1; AJvYcCUbp67h7cD/4A9kzL0NrFT/wtWha8N0kLhbKnhdiXXFIFeWYTfjlITFnuoSMU/kW42++Wq1rG8eStvYNEJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+AogbHFil2Gjg/GiMuI95ZxmVcfixXk7NDnIupX3wlTGKbskR
	uRBXrwq+8874JhEvWZoBlA1dmRl6/PeOYqYOb7MBQKyfE6NNB1ZohzhW8E7bJhLI8SqlW33++yF
	g1XyUkwCQ1Q==
X-Gm-Gg: ASbGncsgkshqo+XeHwDmwV5ujvHsHHl0QaN26vGBKLhnURLmji9lnYDy6YyUPfHQDvQ
	/tr1jgpBgM9D1jLLT+UifY5XvZhVLhmGIJ/CyWq0QQJYDg2Ebw5C1GjSm2antqlZkwMeYcyy6Yc
	eg0jlGcvj8zuFypS3iS+WzDHB+GGQJK0kJv8WI4QuFphNdAyhUpd6bw9cC9N0Q+3cHy6fnyrSxn
	HC+ACTNzeoAggulcJHoMKbClWpwHBQ6yL+yuKL++/WojwIwCEKmFwKhHq6WXszybCowSZyovjwy
	vh7zQhLHxHrtgtJZiZONu17ygSQegjb5+SNzocsDc+URqJY39tYehbzNbMnkhliL0UHqsu7fW30
	VvO439Qg6JfHC7BcdDa1uJdGwWE0K1WLGNRlFMvv49zj52Q==
X-Google-Smtp-Source: AGHT+IEFXfAwL8n5C3J9dCog5MqYjz/0z+tjRYy8VBux8QIcdwHNBxHHgPhwuMllRtUOig1ksCGmnw==
X-Received: by 2002:a05:6000:26c6:b0:3cf:3f1:acd8 with SMTP id ffacd0b85a97d-3e765a2367emr4237912f8f.28.1757702157424;
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Received: from [192.168.68.105] ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm7293297f8f.39.2025.09.12.11.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Message-ID: <0bc838d3-26ad-4f2f-8bb5-1c34748e1fbb@linaro.org>
Date: Fri, 12 Sep 2025 21:35:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: David Hildenbrand <david@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/25 18:56, David Hildenbrand wrote:
>>
>> Changelog since the v2 of the RFC:
>> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
>> - Removed the .section as requested by David Hildenbrand.
>> - Moved all kmemdump registration(when possible) to vmcoreinfo.
>> - Because of this, some of the variables that I was registering had to be non-static
>> so I had to modify this as per David Hildenbrand suggestion.
>> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
>> compiler warnings, fixed the copyright and remove some useless includes.
>> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
>> and it's now available in kernel hacking, as per Randy Dunlap review
>> - Reworked some of the Documentation as per review from Jon Corbet
> 
> IIUC, it's now only printk.c where we do kmemdump-related magic, right?
> 

Yes. The other places just have some changes such that I am able to
gather the data inside vmcoreinfo. (remove static, add some function to
get sizes)


