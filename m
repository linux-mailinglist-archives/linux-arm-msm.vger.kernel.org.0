Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD13723D8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 11:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbjFFJdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 05:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbjFFJcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 05:32:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1511AE6B
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 02:32:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so1436019e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043942; x=1688635942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+vX86GlZTe1uH6YYdDVRRF9k+jJOeF++qGe0rXU7E=;
        b=Sp942XLutsbJGRwO05zi6YC50mZg24y+R/2/XXT6y/SGyhQacT8xsra1KxvK49VzZ5
         Tm63YZwd8p2fKSOZ2f782uziW6KGL77zpcfBUqYXb1dSrTGYFGfRc3vg9MpSD7dX/GNu
         ncYfkGPk7mqLfwjzYWus46T1sCu9sAos8NP4lsh6Z7YKm/ixoXXYbZLkuJwwNUwfgPMZ
         x15zy+ON9IcDIYajEJevk9hDG13yGVHZx2TP1fqzk8TR+WeoXdytluTwmTj1/urlOTcf
         M/JMuX9hFMB+yUNwYBYJJmgndlm10uSNdbE9syYd75crvlMKaJDd73phauOJmTINAFGN
         nvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043942; x=1688635942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+vX86GlZTe1uH6YYdDVRRF9k+jJOeF++qGe0rXU7E=;
        b=fRlZnY2FWVUy4l8x16cbBJGtBi53+Vm3nGDT3mcrlhWj59i1u5FDTSKUZAP+U4E2N8
         sHIU3sIICtYtJwCLhhBEwPSyQNqZeTpMaMaGPnHG+jr+Emq1U2kotJak1koPDaaUwOnF
         AKBNfICOzGthPfsZFvMiY0LVBjNq3rN96odDfTIFSv6PSAQwDsyExPi4uqAZA70/MghE
         W84dnOQYoflZl6hHCE11h5IeZaWJ73O84EcxdNFu1MvWx2XAz3KSNsfpDgaQib/tkXS1
         etEUb0ZqEj8ZbBTBD0akWwp0k3rP12zfyQtQb7G1AdgGNQ2WmcrqNEHB+GOdbR2nEW7k
         VavA==
X-Gm-Message-State: AC+VfDygJMogKZYvurLWs4tMk/oBVsIESpzYvPuJGIGD0ukNLpIEmiKz
        jxv+8ExVVXJ9NQli+nq8QjTnaQ==
X-Google-Smtp-Source: ACHHUZ6cNLID/KMuAbWWIvg1VV8xKQioIFy6SqTRFqnRVb1g5POe1m/0jvDxgek/tnd2k6tRITBDAA==
X-Received: by 2002:a2e:980b:0:b0:2b1:d210:10c9 with SMTP id a11-20020a2e980b000000b002b1d21010c9mr1205504ljj.43.1686043942246;
        Tue, 06 Jun 2023 02:32:22 -0700 (PDT)
Received: from [192.168.178.106] ([185.176.222.176])
        by smtp.gmail.com with ESMTPSA id f14-20020a2e9e8e000000b002ad9057fd00sm1798652ljk.85.2023.06.06.02.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:32:21 -0700 (PDT)
Message-ID: <858eacff-c97d-6504-06c8-d7586055e142@linaro.org>
Date:   Tue, 6 Jun 2023 10:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: Split sdm845-db845c to add headless
 support
Content-Language: en-US
To:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20230605094710.2037879-1-amit.pundir@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230605094710.2037879-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/06/2023 10:47, Amit Pundir wrote:
> This is a follow-up of the upstream discussion,
> https://lore.kernel.org/linux-kernel/20230124182857.1524912-1-amit.pundir@linaro.org/T/#u,
> around adding a reserved memory region in sdm845-db845c
> for the framebuffer memory (the splash region set up by
> the bootloader) but the general opinion was to avoid
> adding that reserved memory for the headless DB845c
> usecase.
> 
> So this patch splits the sdm845-db845c into a common dtsi,
> a new sdm845-db845-headless DT, which disables the mdss
> display subsystem, and a new sdm845-db845c DT with an
> additional reserved-memory region for the framebuffer.

The bootloader always sets up this memory region, it's defined in XBL. 
If someone is building a product based on db845c SoM they would need to 
modify XBL to free up this memory, at that point I think a new DT would 
make sense.

Given that we only found that this was missing because the kernel 
randomly allocated memory there and it broke things, marking the region 
as reserved is a fix, not reserving it is a bug.

The original patch makes sense, imo this region should go in sdm845.dtsi 
as almost all devices utilise this.

I have a pair of patches [1][2] to fix this on sdm845 and sdm850, but I 
haven't sent them yet as there doesn't seem to be a consensus on this. 
Would this be ok with everyone given the above?

[1]: 
https://gitlab.com/sdm845-mainline/linux/-/commit/784f04850b56238c63c30dfea400c7a9ea8fda97
[2]: 
https://gitlab.com/sdm845-mainline/linux/-/commit/52f7ac40c6524be0edad5f4416ed76dbf3298dab
> 
> The default sdm845-db845c.dtb remains pretty much the same
> (with an exception of additional reserved-memory region),
> while others can use sdm845-db845c-headless.dtb for their
> headless systems.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
