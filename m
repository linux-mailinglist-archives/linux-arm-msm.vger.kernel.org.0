Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1668D450281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 11:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhKOK3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 05:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbhKOK3M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 05:29:12 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99952C061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 02:26:08 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 568011F625;
        Mon, 15 Nov 2021 11:26:04 +0100 (CET)
Message-ID: <2af9b75a-b8f9-4ee8-efbe-53dd04365a18@somainline.org>
Date:   Mon, 15 Nov 2021 11:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 13/16] arm64: dts: qcom: Add support for Xperia 1 III / 5
 III
To:     Trilok Soni <quic_tsoni@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
 <20211114012755.112226-13-konrad.dybcio@somainline.org>
 <51341a10-c0a5-079e-b7f1-159d42211bf3@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <51341a10-c0a5-079e-b7f1-159d42211bf3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 14/11/2021 20:47, Trilok Soni wrote:
> Hi Konrad,
>
> On 11/13/2021 5:27 PM, Konrad Dybcio wrote:
>>
>> Then, you need to flash it on the device and get rid of all the
>> vendor_boot/dtbo mess:
>>
>> fastboot flash boot boot.img-sony-xperia-pdx215
>> fastboot erase vendor_boot
>> fastboot flash dtbo emptydtbo.img
>> fastboot reboot
>>
>> Where emptydtbo.img is a tiny file that consists of 2 bytes (all 
>> zeroes), doing
>> a "fastboot erase" won't cut it, the bootloader will go crazy and 
>> things will
>> fall apart when it tries to overlay random bytes from an empty 
>> partition onto a
>> perfectly good appended DTB.
>
>
> I will check on this part and see if we can make simpler support 
> fastboot erase dtbo without the extra emptydtbo.
>
> ---Trilok Soni


Hi Trilok,


that sounds great, thanks for looking into it! Could you also check why 
using a boot.img header version 2 (with a dtb embedded into the boot 
image using the --dtb option in mkbootimg) seems to be broken on 8350, too?

I get a "your device is corrupted and will not boot" error, even though 
I disabled vbmeta/vbmeta_system and performed the same steps described 
in this commit message to dtbo/vendor_boot. It worked fine on 
4.19-release SoCs without vendor_boot (8250, 6350), but it seems it 
doesn't anymore.


Konrad

