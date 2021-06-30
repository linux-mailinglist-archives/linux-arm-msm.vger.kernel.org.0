Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB0B3B89D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 22:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhF3UpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 16:45:14 -0400
Received: from ixit.cz ([94.230.151.217]:45406 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233899AbhF3UpO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 16:45:14 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id D334A23B1D;
        Wed, 30 Jun 2021 22:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625085763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x5BohT94xA4qf4rETUETNc0mZxkiHQsEzkV26At7Bek=;
        b=ilyPIzGwoQoTnEmFNal10sGzsHygiud1jGP3FBgzuDUIz8t0ekyENBPSxBw8k0J3CNIinA
        xQCloVupxX8KQkOPM3gp2Jylkxb9ZrAVbw0HpSibxzfiUKJ/U8SXYWjQZ5HB3cOuclwAxc
        6uytdxzsPC5Z7Lc1u23bBxBW2hOvZuw=
Date:   Wed, 30 Jun 2021 22:41:56 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: "soc: qcom: mdt_loader: Support loading non-split images" breaks
 wcnss fw loading on Nexus 7
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-Id: <W58JVQ.R2HOMUQF8G643@ixit.cz>
In-Reply-To: <CAOCOHw6Sx3Xs8NomniP=9=UnKu9GuGy2KAGo5j8mLLD3gb+miQ@mail.gmail.com>
References: <TNZIVQ.NUOZ8IPZF0UA1@ixit.cz>
        <CAOCOHw6Sx3Xs8NomniP=9=UnKu9GuGy2KAGo5j8mLLD3gb+miQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you for responce Bjorn.

Here is output:

$ readelf -a wcnss.mdt [22:41:04]
ELF Header:
  Magic: 7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class: ELF32
  Data: 2's complement, little endian
  Version: 1 (current)
  OS/ABI: UNIX - System V
  ABI Version: 0
  Type: EXEC (Executable file)
  Machine: ARM
  Version: 0x1
  Entry point address: 0x8f001228
  Start of program headers: 52 (bytes into file)
  Start of section headers: 0 (bytes into file)
  Flags: 0x5000002, Version5 EABI, <unknown>
  Size of this header: 52 (bytes)
  Size of program headers: 32 (bytes)
  Number of program headers: 6
  Size of section headers: 40 (bytes)
  Number of section headers: 0
  Section header string table index: 0

There are no sections in this file.

There are no sections to group in this file.

Program Headers:
  Type Offset VirtAddr PhysAddr FileSiz MemSiz Flg Align
  NULL 0x000000 0x00000000 0x00000000 0x000f4 0x00000 0
  LOAD 0x001000 0x8f535000 0x8f535000 0x019a0 0x02000 0x1000
  LOAD 0x003000 0x8f000000 0x8f000000 0x025fc 0x02654 RWE 0x4
  LOAD 0x0055fc 0x8f010000 0x8f010000 0x00000 0x07000 RW 0x4
  LOAD 0x0055fc 0x8f017000 0x8f017000 0x01000 0x01000 RW 0x4
  LOAD 0x0065fc 0x8f018000 0x8f018000 0x243ec4 0x51cbf0 RWE 0x1000

There is no dynamic section in this file.

There are no relocations in this file.

Dynamic symbol information is not available for displaying symbols.

No version information found in this file.

Best regards
David Heidelberg

On Wed, Jun 30 2021 at 15:36:31 -0500, Bjorn Andersson 
<bjorn.andersson@linaro.org> wrote:
> On Wed, Jun 30, 2021 at 12:39 PM David Heidelberg <david@ixit.cz> 
> wrote:
>> 
>>  Kernel: stable-5.10.y
>>  HW: chipset APQ8064, Nexus 7 2013 (codename flo or deb)
>>  Problem first occured when I was porting Nexus from 4.19 to 5.4 LTS.
>> 
>>  Hello,
>> 
>>  after reverting this particular commit (
>>  498b98e939007f8bb65094dfa229e84b6bf30e62 ), I'm able do
>> 
>>  echo 'start' >
>>  
>> /sys/devices/platform/soc/3200800.riva-pil/remoteproc/remoteproc0/state
>> 
>>  [ 64.271634] remoteproc remoteproc0: powering up 3200800.riva-pil
>>  [ 64.276210] remoteproc remoteproc0: Booting fw image wcnss.mdt, 
>> size
>>  6804
>>  [ 70.087107] remoteproc remoteproc0: remote processor 
>> 3200800.riva-pil
>>  is now up
>>  [ 70.100817] qcom_wcnss_ctrl remoteproc0:smd-edge.WCNSS_CTRL.-1.-1:
>>  WCNSS Version 1.4 1.2
>>  [ 70.124279] wcn36xx: mac address: 18:00:2d:88:9c:a9
>>  [ 95.357907] wcn36xx: firmware WLAN version 'WCN v2.0 RadioPhy
>>  vIris_TSMC_2.0 with 48MHz XO' and CRM version '201080'
>>  [ 95.357938] wcn36xx: firmware API 1.4.1.2, 41 stations, 2 bssids
>> 
>>  with current stable-5.4.y - stable-5.10.y (cannot test later since 
>> it
>>  crashes without saving pstore dmesg):
>> 
> 
> I believe that the APQ8064 boards fell out of the various automation
> setups and we lost track of the status. Hopefully we can resurrect
> e.g. the ifc6410 to catch these kinds of regressions.
> 
>>  [ 50.972560] remoteproc remoteproc0: powering up 3200800.riva-pil
>>  [ 50.977121] remoteproc remoteproc0: Booting fw image wcnss.mdt, 
>> size
>>  6804
>>  [ 50.977166] remoteproc remoteproc0: Failed to load program 
>> segments:
>>  -22
>>  [ 50.977225] remoteproc remoteproc0: Boot failed: -22
> 
> Seems like the reasons for this would be that the ELF header and
> signature segment are stacked differently from the firmware I looked
> at when I came up with that patch.
> Can you please share the output of "readelf -a wcnss.mdt"?
> 
> Regards,
> Bjorn


