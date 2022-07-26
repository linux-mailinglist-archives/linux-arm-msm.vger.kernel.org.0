Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE645812DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 14:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbiGZMLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 08:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238657AbiGZMLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 08:11:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA0F2B184
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 05:11:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m17so19580084wrw.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ho5DlxVbtPE4xqHB8U7OSblTYt6T62dXAInLoexUb7c=;
        b=td+ZMO9vaTOjHcShANKmdrEG3ohGjJWhz0ubUGOiKseIwRAYBB9Tufnfw6slyPxKRd
         va5OA6gOsUAb6hCUCjDV+U2VkbDY1XXOTNFZML78VVBXgkEOMQD+C0NyrDi+Wg+nrK+O
         W+z0n3LJ9Wfp4CgVPK43lsaG2JtddaDnlK6kL+SYNHsR1f7bBANFuUn7OhMw2gdDjEvs
         Yg3lXVqv/H92roLKk3kM7zVQesgpPX9anwHenhgvLqpPETj7iT6g1rWcIz+xpVqzT8dU
         u3KimG7VmsrfvlJQjGlhbcMXy06rY2hZfqoMk846LS5r2fqHGLBitGKTpWDZgNt6eyzb
         oFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ho5DlxVbtPE4xqHB8U7OSblTYt6T62dXAInLoexUb7c=;
        b=j9gqSrn4xWDvvd5/pzOe+8R5D2XSgrvqpFoQML+CMIPOyC7ZpgG2g1r+10RmTG1Zsp
         wkvKXWOWGFKEFd3uxj3jol5XmvBqjt05kKdavFjFrbT5+QlTnw3bBnFXQbczk1daFL14
         JF5jxJ1fSZRydP5pzr0L0NP1zJNlziRmaPYmulmYCqKlejEIfdzhJ/gkTamXtAsHeYJ+
         Mh5pn3iCo5tJcGgi+88jkOahukXs3PDJSLEe0xPNWuKw812i3vFachsjqrDT131uxCnu
         /XVFf9FsZR0msH39qCphyRnmuQIWCDkzcDyrcauWQI11ggWGsuOJzCFZysnLV1hrjsm1
         ZVvQ==
X-Gm-Message-State: AJIora8niANzBwTgmexVFMt9rT39TBFqsQFJbNcJTbAKMKpjwRgK/+QI
        XxTmBAxfAp8pxImFOO4uJDslSg==
X-Google-Smtp-Source: AGRyM1vydTkqV6+v+KByHbdetz5QCnlkt2zBBZAI+fERpOrH+XCPyzLyz5qb5qa1djSNITMh6ToUtw==
X-Received: by 2002:adf:e70e:0:b0:21d:7f90:7501 with SMTP id c14-20020adfe70e000000b0021d7f907501mr10100395wrm.447.1658837475428;
        Tue, 26 Jul 2022 05:11:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15-20020a7bcb8f000000b003a2e27fc275sm16953875wmi.12.2022.07.26.05.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 05:11:14 -0700 (PDT)
Message-ID: <faeaab3a-503c-ed14-bed0-e897b1f94662@nexus-software.ie>
Date:   Tue, 26 Jul 2022 13:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] media: venus: Fix up buffer handling for
 HFI_VERSION_1XX
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2022 03:14, Bryan O'Donoghue wrote:
> This series fixes two buffer handling bugs. The first bug is trivial and
> ~impossible to hit without the second bug but with fixing anyway. Its a
> simple NULL pointer handling issue.
> 
> The second bug relates to HFI_VERSION_1XX output buffers. Unfortunately
> these have been broken since
> 
> Commit: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")
> 
> A bit of bisecting the commits in venus found it handily enough. Once the
> fix is applied we have I have decode working again on db410c.
> 
> Bryan O'Donoghue (2):
>    media: venus: dec: Handle the case where find_format fails
>    media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX
> 
>   drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
>   drivers/media/platform/qcom/venus/vdec.c    |  2 ++
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 

Not withstanding my 3am misspelled text above, I've also just validated 
this changes on RB5/HFI_VERSION_6xx.

---
bod
