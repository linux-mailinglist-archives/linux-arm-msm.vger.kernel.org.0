Return-Path: <linux-arm-msm+bounces-57469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF41AB1843
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877FA3AE1C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1128F22F173;
	Fri,  9 May 2025 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNiRD6Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3121D3F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803985; cv=none; b=NCejaf0WzAFts14LyTJhgh8jHLhnp/Wu+O0JlzH3gZCgIwsb7S0rwqLW6/wBgGen/IH24iqCj7DntCgiqNPIYC4VlUkkjJTuIwv5vxkhbfR7ckWxyLRRRovKmqKpYkz5FjtbLkFBphcz/oaLNfktADZWBVKKlPqbxKnHBfThal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803985; c=relaxed/simple;
	bh=m8aROJFjpKUVyoRqALJjh1WRQTPMz0f/huyI4HbWrnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLrX81sdTUh96u9OsIS+FS8pHhjzjrOSYPj8W8CdlX0VONP5fmoF0kBqUmuuuvPx1YUKcyVh6f54NTu92Sxic7JnQvDymhPldA0msqvuZyXHnmY9ZmD1wAelLdGCuTE+dpjrZTGNROzI+9VtblyJCVZX4dpegRDvUc8sHQiJqfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNiRD6Ga; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so3248084a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746803982; x=1747408782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piveaIt51APJH/cy/5pKer1njMs8SNMZ9Efypy4VJ1I=;
        b=dNiRD6GaI77D5dW6OOZQ4/6JdA7T9ukKMjthTX0yONwvPcRqTCnkz9DgmE8funeHNk
         elFJBjzITJsuXnqUddYp3esGhRKDDiJfTlVLiswUR1oz4KYO0imArHdy69twLlYJSuae
         P8x/dSVTNjFObmRURW0sknerC7BK2cb+USvos4DHX49RWex5wfwpjaRuCLnYH9tt1nxY
         fpnYwYvMUpfs2QjKamYzbfDqDs7k4bZZR8JW4iWyuqmrMXUPh+0WWrAJNfw0FfICGDBY
         ARrEUpLNbeZuyoFok1YOSq4jvwYnJeMK6nacKci/IAoI96EcSw/b4G38SJQMcMYBV81y
         uA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803982; x=1747408782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piveaIt51APJH/cy/5pKer1njMs8SNMZ9Efypy4VJ1I=;
        b=wcf2s6DguVOYtlpv/kqacfEnYD2WgIqW5191XRUv4UJe9OfnlJn9Dm7HmivzVVRajI
         JGyk6W0k2yMyR0qfvbhvnpXOPJru95Q9AO3indbbtNTF/lW12lynbR82qkbo3YMCz4dJ
         ZIWjAU7kuvWm2Zyrwt1W/ZPSf0/dqqQHjTDvPVEP/y9pSZE+pS79x4hUv1HSabWNADVm
         tdl2On2UCzwGYRH8BZadqmfE+2uvfrdbkAfffcH1umBVyHn+3C2SV4Phf2tfL2XYb0AI
         0z93PA+YRqgTEMImzc56W6BtTrpEVEUo2fvnuQX0GK0ObCWqlyGunF+BzB45eGF+iI0j
         7bxA==
X-Forwarded-Encrypted: i=1; AJvYcCWBc6f/vKJm4S/x/7og8iS5NRdO9TxP8VFDaBehJdwBzpemFc2fl0yx5O/LchArZoH+z175+G3Afk6EZbn2@vger.kernel.org
X-Gm-Message-State: AOJu0YybDzBUBkq0z5qESoUOpT92lceOdpPhhe6xc0f+WK4oGrPgE34c
	ngwM7LDM6ilVc7gClgdYE8SzR9aVH4Fx9jgL5CCHyJ/pW13z+pBZNYYu1e0llf8=
X-Gm-Gg: ASbGnctUAVpWB+jex2peUmR9pr9yMlyYYMfflpVjFw6AT42Odkh/FoSCckA6Fxeir2S
	BUhGWNwhT49v64DCPWI22jsfYHpdOkWMk1ZqzNPB7rCmyf0RCKG34nLc5O3Dab7RuDxerMij929
	AsHUZCUnC+SM2j9hOuUDXkZhLFH5JDQBWqjIy8AadU1K5WhmFtDpd9r7HAA2wnZ+6EC5/Vz398x
	D3F2ANUwtqd9Z2pzdSt4FxfAsAsGnEVcFoTvo0ESy4cX40NTx8r9XySzdfQ0BKK9EEUy0bXIwBy
	fU+bFjWeTzuoIxq0HvIugms77dtn1CrYtFLdHDIvfYQ1tJq5
X-Google-Smtp-Source: AGHT+IHT7wYtfS2u3TlvINr8fJyTrH7JNqE175qLt+rBrEgAFEQwhYwKbs1ehus30wxqNmhfrYAvHA==
X-Received: by 2002:a17:907:a2cd:b0:ace:caff:675a with SMTP id a640c23a62f3a-ad218e47c9bmr314645166b.10.1746803981845;
        Fri, 09 May 2025 08:19:41 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd4d3sm164125066b.132.2025.05.09.08.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:19:41 -0700 (PDT)
Message-ID: <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Date: Fri, 9 May 2025 18:19:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, pmladek@suse.com, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Bjorn,

On 5/7/25 19:54, Bjorn Andersson wrote:
> On Tue, Apr 22, 2025 at 02:31:42PM +0300, Eugen Hristev wrote:
>> kmemdump is a mechanism which allows the kernel to mark specific memory
>> areas for dumping or specific backend usage.
>> Once regions are marked, kmemdump keeps an internal list with the regions
>> and registers them in the backend.
>> Further, depending on the backend driver, these regions can be dumped using
>> firmware or different hardware block.
>> Regions being marked beforehand, when the system is up and running, there
>> is no need nor dependency on a panic handler, or a working kernel that can
>> dump the debug information.
>> The kmemdump approach works when pstore, kdump, or another mechanism do not.
>> Pstore relies on persistent storage, a dedicated RAM area or flash, which
>> has the disadvantage of having the memory reserved all the time, or another
>> specific non volatile memory. Some devices cannot keep the RAM contents on
>> reboot so ramoops does not work. Some devices do not allow kexec to run
>> another kernel to debug the crashed one.
>> For such devices, that have another mechanism to help debugging, like
>> firmware, kmemdump is a viable solution.
>>
>> kmemdump can create a core image, similar with /proc/vmcore, with only
>> the registered regions included. This can be loaded into crash tool/gdb and
>> analyzed.
>> To have this working, specific information from the kernel is registered,
>> and this is done at kmemdump init time, no need for the kmemdump user to
>> do anything.
>>
>> The implementation is based on the initial Pstore/directly mapped zones
>> published as an RFC here:
>> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
>>
>> The back-end implementation for qcom_smem is based on the minidump
>> patch series and driver written by Mukesh Ojha, thanks:
>> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
>>
>> I appreciate the feedback on this series, I know it is a longshot, and there
>> is a lot to improve, but I hope I am on the right track.
>>
>> Thanks,
>> Eugen
>>
>> PS. Here is how crash tool reports the dump:
>>
>>      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>>     DUMPFILE: /home/eugen/eee
> 
> Can you please describe the steps taken to get acquire/generate this
> file and how to invoke crash?
> 

Thank you for looking into this.

Next week, on 16th of May, on Friday, there will be a talk related to
this patch series at Linaro Connect in Lisbon. In that talk I will also
show a demo in which all the process of acquiring the core dump and
crash will be covered.
I will be traveling the following days, if I get the time I will submit
the steps as a reply to this email, if not, then for sure I will submit
them after the talk in Lisbon.

Eugen

> Regards,
> Bjorn
> 
>>         CPUS: 8 [OFFLINE: 7]
>>         DATE: Thu Jan  1 02:00:00 EET 1970
>>       UPTIME: 00:00:28
>>     NODENAME: qemuarm64
>>      RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
>>      VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>      MACHINE: aarch64  (unknown Mhz)
>>       MEMORY: 0
>>        PANIC: ""
>>
>> crash> log
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
>> [    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>> [    0.000000] KASLR enabled
>> [...]
>>
>> Eugen Hristev (14):
>>   Documentation: add kmemdump
>>   kmemdump: introduce kmemdump
>>   kmemdump: introduce qcom-md backend driver
>>   soc: qcom: smem: add minidump device
>>   Documentation: kmemdump: add section for coreimage ELF
>>   kmemdump: add coreimage ELF layer
>>   printk: add kmsg_kmemdump_register
>>   kmemdump: coreimage: add kmsg registration
>>   genirq: add irq_kmemdump_register
>>   kmemdump: coreimage: add irq registration
>>   panic: add panic_kmemdump_register
>>   kmemdump: coreimage: add panic registration
>>   sched: add sched_kmemdump_register
>>   kmemdump: coreimage: add sched registration
>>
>>  Documentation/debug/index.rst      |  17 ++
>>  Documentation/debug/kmemdump.rst   |  83 +++++
>>  drivers/Kconfig                    |   2 +
>>  drivers/Makefile                   |   2 +
>>  drivers/debug/Kconfig              |  39 +++
>>  drivers/debug/Makefile             |   5 +
>>  drivers/debug/kmemdump.c           | 197 ++++++++++++
>>  drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
>>  drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
>>  drivers/soc/qcom/smem.c            |  10 +
>>  include/linux/irqnr.h              |   1 +
>>  include/linux/kmemdump.h           |  77 +++++
>>  include/linux/kmsg_dump.h          |   6 +
>>  include/linux/panic.h              |   1 +
>>  include/linux/sched.h              |   1 +
>>  kernel/irq/irqdesc.c               |   7 +
>>  kernel/panic.c                     |   8 +
>>  kernel/printk/printk.c             |  13 +
>>  kernel/sched/core.c                |   7 +
>>  19 files changed, 1236 insertions(+)
>>  create mode 100644 Documentation/debug/index.rst
>>  create mode 100644 Documentation/debug/kmemdump.rst
>>  create mode 100644 drivers/debug/Kconfig
>>  create mode 100644 drivers/debug/Makefile
>>  create mode 100644 drivers/debug/kmemdump.c
>>  create mode 100644 drivers/debug/kmemdump_coreimage.c
>>  create mode 100644 drivers/debug/qcom_md.c
>>  create mode 100644 include/linux/kmemdump.h
>>
>> -- 
>> 2.43.0
>>


