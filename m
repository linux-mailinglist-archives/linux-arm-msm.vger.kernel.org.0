Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96777374F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 21:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjFTTQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 15:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjFTTQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 15:16:10 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138109B
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 12:16:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f9b4a715d9so17121635e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 12:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687288567; x=1689880567;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1mD9I4nNUeLdpFMPXDPLZezt3lAmxRCFthasDSn18PM=;
        b=jQatyIPfnr/GickdR7M/CtBDgpq4n7sh4fxj3o6rLZC8wXSl2AZ+NVsLiurfcJLHZA
         6R3OYfuzsABcvRqOCx95ad8ZP3zYE6IULkEuIz0vtbXOfZNi4i8C+hyEqnF5SRV0vpGh
         6kOdq6bMnkRcvyf/I2fSIlh/deQwwzKyz6UibaBm3ZXfMNVk14JjfETuelBgbQnGuqIe
         fko71Fi3fRkdWn+GWHYzjD8mBAOE4jxV4JyFYaMQYvt9PVMMT/K0oKrtyuxqui+LuO9+
         aro/E3Srf7h6StIyYzG6jj/EI3MwWIsYh1QyIl9kXtAzONDOScRDlSfOB9GpTaHs+23c
         gI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687288567; x=1689880567;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mD9I4nNUeLdpFMPXDPLZezt3lAmxRCFthasDSn18PM=;
        b=cC6VQ4ZM6pEgNW5f609u3hiH8XCFyVSpo2zZn1hJOs0kEm/PqpqK2mctqwK4OXuXuQ
         nxRi6P1MM0uNbu7GTpyfw2XH5acuPN8PDnbknftxnkd6mj5t+NC+6YORpkxfsHYbSICX
         cILvlxLM/pTaPg56JlQYXmLTl+S9hRH5V79GtHtlgO01ZTdfKbyfqj1PlBJROBjVIoRf
         2vWyfGx4QvIHvoCnqOp9twLOVFrcojm4AgXr6I6SQg9FIzeG/f30tkSjiuSfm3F00P+l
         YtwJgnWYxtbI5XZQ9w3QIomG7MOQAhrhFemdsGWlNZx5AXDUg5nuwDHHf28OS5F90XTj
         Fmkw==
X-Gm-Message-State: AC+VfDwAhuRgYEWqtSWNyHRt24zCu1YaxZwjfpQ2IrE0fBJMaKzcSU1D
        gS2agprFbKoE8WXU7c9A4WCbCV7Pw+Nlam3g7eT95Q==
X-Google-Smtp-Source: ACHHUZ7Wi8jQlrG/8Tz7cerVxiBskvE3mDHqDqzUD9L4DdnQLhDyZnlNN8q1ba1lOxGKAY/occt7pQ==
X-Received: by 2002:a05:600c:3b97:b0:3f9:b535:381a with SMTP id n23-20020a05600c3b9700b003f9b535381amr3743255wms.10.1687288567444;
        Tue, 20 Jun 2023 12:16:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b? ([2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003f8ec58995fsm3063313wmo.6.2023.06.20.12.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:16:07 -0700 (PDT)
Message-ID: <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
Date:   Tue, 20 Jun 2023 21:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
Content-Language: en-US
To:     Joey Gouly <joey.gouly@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>
Cc:     nd@arm.com, broonie@kernel.org, catalin.marinas@arm.com,
        james.morse@arm.com, mark.rutland@arm.com, maz@kernel.org,
        oliver.upton@linux.dev, shuah@kernel.org, suzuki.poulose@arm.com,
        will@kernel.org, yuzenghui@huawei.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230606145859.697944-17-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joey,

On 06/06/2023 16:58, Joey Gouly wrote:
> Now that the necessary changes have been made, set the Permission Indirection
> registers and enable the Permission Indirection Extension.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

This patch on linux-next causes a great amount of:

X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f

messages printed by the system firmware on the Qualcomm SM8550 SoC,
and the platform is barely usable.

Here is the SoC cpuinfo for reference:
# cat /proc/cpuinfo
processor	: 0
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd46
CPU revision	: 1

processor	: 1
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd46
CPU revision	: 1

processor	: 2
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd46
CPU revision	: 1

processor	: 3
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd4d
CPU revision	: 0

processor	: 4
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd4d
CPU revision	: 0

processor	: 5
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x2
CPU part	: 0xd47
CPU revision	: 0

processor	: 6
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x2
CPU part	: 0xd47
CPU revision	: 0

processor	: 7
BogoMIPS	: 38.40
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x1
CPU part	: 0xd4e
CPU revision	: 0

The bisect log for reference:
# bad: [925294c9aa184801cc0a451b69a18dd0fe7d847d] Add linux-next specific files for 20230615
# good: [858fd168a95c5b9669aac8db6c14a9aeab446375] Linux 6.4-rc6
git bisect start 'FETCH_HEAD' 'v6.4-rc6'
# bad: [c20f7e5e521ee3f50b064cdb441f65075ca6eb17] Merge branch 'nand/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect bad c20f7e5e521ee3f50b064cdb441f65075ca6eb17
# bad: [9b3c3144b2d3b5022370883e2834887fc7f3d5d3] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
git bisect bad 9b3c3144b2d3b5022370883e2834887fc7f3d5d3
# bad: [8a2e6adeea094195f860f1f5dd799c9f0015dd92] Merge branch 'at91-next' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
git bisect bad 8a2e6adeea094195f860f1f5dd799c9f0015dd92
# good: [4f826d17f9de4d708f2c07bb40a104426a22b384] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 4f826d17f9de4d708f2c07bb40a104426a22b384
# good: [62f97a067a7e77fd2016ce7d413fceaaf5882385] Merge branch 'for-next' of git://git.infradead.org/users/hch/dma-mapping.git
git bisect good 62f97a067a7e77fd2016ce7d413fceaaf5882385
# good: [e5047345bb6c8ee1e5d319c989dc9e3442f891c7] soc: document merges
git bisect good e5047345bb6c8ee1e5d319c989dc9e3442f891c7
# good: [cca5c2136d9ca679a9b0cdb51ce64c79cd7c092c] Merge branches 'for-next/kpti', 'for-next/missing-proto-warn', 'for-next/iss2-decode', 'for-next/kselftest', 'for-next/misc', 'for-next/feat_mops', 'for-next/module-alloc', 'for-next/sysreg', 'for-next/cpucap', 'for-next/acpi', 'for-next/kdump' and 'for-next/acpi-doc' into for-next/core
git bisect good cca5c2136d9ca679a9b0cdb51ce64c79cd7c092c
# bad: [b6719d317df3ab47dc86776c499fc1e2009e1b37] Merge branch 'for-next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
git bisect bad b6719d317df3ab47dc86776c499fc1e2009e1b37
# bad: [ee053e03b08e1b287d9a43152e4623a04cb24fe6] KVM: selftests: get-reg-list: support ID register features
git bisect bad ee053e03b08e1b287d9a43152e4623a04cb24fe6
# good: [86f9de9db1783b32e8812fe21c2c8cf02cf911ff] KVM: arm64: Save/restore PIE registers
git bisect good 86f9de9db1783b32e8812fe21c2c8cf02cf911ff
# good: [7df7170965a28c61f80a57b655b0cc10adb88ab9] arm64: disable EL2 traps for PIE
git bisect good 7df7170965a28c61f80a57b655b0cc10adb88ab9
# bad: [9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e] arm64: enable Permission Indirection Extension (PIE)
git bisect bad 9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e
# good: [eeda243dfeb996fe236c624796630c16237a18d6] arm64: add encodings of PIRx_ELx registers
git bisect good eeda243dfeb996fe236c624796630c16237a18d6
# first bad commit: [9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e] arm64: enable Permission Indirection Extension (PIE)

Thanks,
Neil

> ---
>   arch/arm64/mm/proc.S | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 9513a8d2ce0e..2baeec419f62 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -454,6 +454,21 @@ SYM_FUNC_START(__cpu_setup)
>   #endif	/* CONFIG_ARM64_HW_AFDBM */
>   	msr	mair_el1, mair
>   	msr	tcr_el1, tcr
> +
> +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
> +	cbz	x1, .Lskip_indirection
> +
> +	mov_q	x0, PIE_E0
> +	msr	REG_PIRE0_EL1, x0
> +	mov_q	x0, PIE_E1
> +	msr	REG_PIR_EL1, x0
> +
> +	mov	x0, TCR2_EL1x_PIE
> +	msr	REG_TCR2_EL1, x0
> +
> +.Lskip_indirection:
> +
>   	/*
>   	 * Prepare SCTLR
>   	 */

