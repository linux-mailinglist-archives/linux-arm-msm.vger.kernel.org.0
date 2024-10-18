Return-Path: <linux-arm-msm+bounces-34846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC149A335D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D5F1F23FFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 03:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FAE157E9F;
	Fri, 18 Oct 2024 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuP83qmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A42155744;
	Fri, 18 Oct 2024 03:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729222015; cv=none; b=BEhgOG0cI2oJ43w0RGBDtSuqjWYmUlX1jA7SF1/rol+bPa59lNtvtcmG6FTMSZHhyBlj/h82c6VZgqSjSA9QDnTLXoM5Q4wG+FeZXJ7ol1PPijjqRiUKt5Ybe78FxxtvNiJdMpXIfjruRxhh8sveZr4/zhkEB2wwNveIAeab6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729222015; c=relaxed/simple;
	bh=pp0xdFEq2xvTLyyQpNjgiFlzJ7fppjTZ/wj9ohuCh4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fprPOHt9MAlw7JkgQIVCfMMGo/aySpqrc/WoXQP2GoJfInEfg6W8DfkejSjfXgURxrb2rB3zBRIllJd4OR3B5M0yDN4oaelstaauDrIS5Fzb48lGa4BL4vvWT8DAjFQVs2MCEMClACuCi3vtenQ0DMTYxkjwZ7KCo/jVMiArRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuP83qmv; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbf0e6414aso7856726d6.1;
        Thu, 17 Oct 2024 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729222013; x=1729826813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRFYsm7JQn6FoiV+R8mnl3y+fSii5MhmQCkaq6Im0Kk=;
        b=cuP83qmv3CZVrBrhP0f2Ec/2c/nqcuo/tyOmYDsOD6TAyeEmejjZr7ZUf4eld80coB
         Tf6cyqKwJdKAWXeBc8QRPlu5MiSGb2yy/X8cPf/G2/R/Yk65xWKCQ+KeV1vJdsU2T+zz
         qaRLxhTnSTfwps2Y+ym9Hq9kFkM0qZHkIzfaaY+IvgqtnEjzX7eHA0es+TFM1+rW4SlY
         z4RTMYX4EUHxam/P6vqvH+bIp/olGWiQCj6GNE/2PqjVPAaw7LdcYAU828KLnJcSLPOP
         alctmxaY3Efz2GZ8m9ENqzCtZu2Ag9jExCTSx2EpqMDaATchRlkdNHJbh1FpWRyDIzDn
         34Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729222013; x=1729826813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRFYsm7JQn6FoiV+R8mnl3y+fSii5MhmQCkaq6Im0Kk=;
        b=Na1PuXzzg1jKCSnjyaPtsDudrzETDuOYcmzuGUX6VDN02ToZayitpwTa2ClioQQZ5c
         N+pJu4FLupmhj189slDBrV1tAdYqfyvOyjI9H6VBOh5XRE62kIqwphB/g28/fQq6K6PH
         /Mej1FWBGA4v1coKHBHeaifAcwyNIMez1CaNgiMGyFpXU++1wJatsp3y1URxOMnbNxj8
         4WvpHNQz5K5ZzAiCeM/rgUb6f8fQ3q/4JTT45plPANlgBFOtN34srx9bq7yBRVD8xx1Q
         pt0zxHYQ1gcxYIQWOcfzyADt12QnsUdCzZ9usAVG/Dk21MvsqYPIo23GHcdVS35IPmDd
         o9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUvDGLxWlbLlOM6suztB92GIvVNs2SCCsc07HwMPWOhtn8S3o21FPNaEvXbzZKfQPiWZQEN24W3+mQCAdHvJ09j@vger.kernel.org, AJvYcCV07kidwxbGopKwO6CIX95P7s64aJrqMt87jfhdFDyJX4+pt3Nhfz3MB46HdEXI6pH4WSoSOZf4wOWhbHzs@vger.kernel.org, AJvYcCVDwZUNYZ6cROdty/BFrNwFckcNB5pHaZ06JLXgJPX9dKqNPpootMhFDyLhj2rZqz00K1RQfNPM3iIG@vger.kernel.org, AJvYcCVOicuADKNTElrLokmUd76/qM1b7vQqAv5k0/+GRvXplT/jiDCNZ4BfHjjn9PMeH2RZztE8LGhAf89Dpaue@vger.kernel.org, AJvYcCWRrOpoCi86lkWsWukupqn8PqrUycrbDSphRYd6EBVDr2XYKyPDeJws4naGIgX2OFzqYxyi5DVL9HUya+A=@vger.kernel.org, AJvYcCWomsp4f0K61hGmT+G35HyOulJP5uLY04+kHTOxEgccoUU3aohjwZW8+ZCFNRtZQy4FuEQdb9aRYjuEvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFISAIFPyoclc3bN3gs6gDzzfVKYQzgBL0bHvEXSPcrq10vjYC
	3b61rKeUrpQ0DhyG4ivG8umCmWJhynyI4fHNU7apJ82+KxXLapE6
X-Google-Smtp-Source: AGHT+IGbNm4J7504L9d7tSHokebTr/bSREZo9pNVg4bVFxle2lyocyWjoZsfEt0kWM+ekwkhqpJNeg==
X-Received: by 2002:a05:6214:3d13:b0:6cd:4972:59af with SMTP id 6a1803df08f44-6cde150b8famr20524116d6.14.1729222012692;
        Thu, 17 Oct 2024 20:26:52 -0700 (PDT)
Received: from [10.56.180.205] (syn-076-188-177-122.res.spectrum.com. [76.188.177.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cde1366d72sm2925836d6.116.2024.10.17.20.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 20:26:52 -0700 (PDT)
Message-ID: <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
Date: Thu, 17 Oct 2024 23:26:49 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
To: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
 song@kernel.org, yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org,
 mpatocka@redhat.com, adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
 ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
 konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain> <ZvJt9ceeL18XKrTc@infradead.org>
Content-Language: en-US
From: Adrian Vovk <adrianvovk@gmail.com>
In-Reply-To: <ZvJt9ceeL18XKrTc@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/24 03:44, Christoph Hellwig wrote:
> On Sat, Sep 21, 2024 at 11:55:19AM -0700, Eric Biggers wrote:
>> (https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/md/dm-default-key.c),
>> and I've been looking for the best way to get the functionality upstream.  The
>> main challenge is that dm-default-key is integrated with fscrypt, such that if
>> fscrypt encrypts the data, then the data isn't also encrypted with the block
>> device key.  There are also cases such as f2fs garbage collection in which
>> filesystems read/write raw data without en/decryption by any key.  So
>> essentially a passthrough mode is supported on individual I/O requests.
> Adding a default key is not the job of a block remapping driver.  You'll
> need to fit that into the file system and/or file system level helpers.

fscrypt isn't the only thing that would use such functionality. If you 
put it in the filesystem layer then you're only serving fscrypt when 
there are other usecases that don't involve filesystems at all.

Let's say I'm using LVM, so I've got a physical partition that stores a 
couple different virtual partitions. I can use dm-default-key both 
underneath the physical partition, and on top of some of the virtual 
partitions. In such a configuration, the virtual partitions with their 
own dm-default-key instance get encrypted with their own key and passed 
through the lower dm-default-key instance onto the hardware. Virtual 
partitions that lack their own dm-default-key are encrypted once by the 
lower dm-default-key instance. There's no filesystem involved here, and 
yet to avoid the cost of double-encryption we need the passthrough 
functionality of dm-default-key. This scenario is constrained entirely 
to the block layer.

Other usecases involve loopback devices. This is a real scenario of 
something we do in userspace. I have a loopback file, with a partition 
table inside where some partitions are encrypted and others are not. I 
would like to store this loopback file in a filesystem that sits on top 
of a dm-crypt protected partition. With the current capabilities of the 
kernel, I'd have to double-encrypt. But with dm-default-key, I could 
encrypt just once. Unlike the previous case, this time there's a layer 
of filesystem between the block devices, but it still can't do anything: 
the filesystem that stores the loopback device can't do anything because 
it has no idea that any encryption is happening. fscrypt isn't being 
used, nor can it be used since the file is only partially encrypted, so 
the filesystem is unaware that the contents of the loopback file are 
encrypted. And the filesystem doesn't know that it's encrypted from 
below by its block device. So what can the filesystem do if, as far as 
it can tell, nothing is being encrypted?

Best,

Adrian


