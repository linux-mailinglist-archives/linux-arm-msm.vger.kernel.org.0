Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A0E74ABE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 09:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjGGH0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 03:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjGGH0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 03:26:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EBF170F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 00:26:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 768C9617C2
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 07:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC04C433C8;
        Fri,  7 Jul 2023 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688714803;
        bh=756LPQWTOqhhx/zIkUsbRPWNm3vIwenx+BIkIwgR+V8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=W2LDACi9a3ojrZb4wRB2voA1UT5ATTdQqNjAwnHcXn5UUnY1ik4uNGrHuiWipKMN+
         bbhEWxtC7ANaVFE2N3jxjonv0hSZcBkA4dpFlNuwbWHmW2vrfTFelhoqwIj0oyjyEa
         ayfys8XJehCQ9qQfO8ILD3Bqryp1E4qPNxRIWc+3ljgwNnEfCLqX1rpKyzPkutpATC
         wOpU7mjYJqvLB0C3vNiH83Biln1PqegoNR3+0FMEi/Boy+JAREsifpNaAEqogB+cOo
         6i7AGnbnQhQor/9TA1cHvSLxsGHEhRXJqyKQHz++B2ya8YTd2aHVMCYTZnlZPzcHha
         p+KwTjsvs7DLA==
Message-ID: <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
Date:   Fri, 7 Jul 2023 09:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend bindings for
 chip-id
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-12-robdclark@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230706211045.204925-12-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Upcoming GPUs use an opaque chip-id for identifying the GPU.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof

