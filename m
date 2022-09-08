Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B953E5B1B73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiIHLbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 07:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiIHLbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 07:31:36 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B59C7BBC
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 04:31:33 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id c10so10031285ljj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oBgP2IH/MhseGLN+WdokUjxg0S5B7ZpRhyEMkEIva8k=;
        b=uBYa98bFz/YBBHxwCIWUL4lvzAG/gsNWBhW5bn/Oi4WjiOBm+elpq82L/F2mJdhRn2
         +M9nxuY9985tgRJg0CEK1NtepyJF+VA3r4n0a/IiBW7CDhUEUbeOYoflnLvJotU1KIoz
         Wvhg/jFOmzVmw8Wa9BMG0v7ugyBXUZnZj+DFFqBkNWJSfC4mi6H5EiOkcDuouibLzaIB
         ICLCJQo+hLmKcyAVASWn2D5bsDM4I/8NcTTcfI5tHJ6tyFrmLTyL0EhYiohxnmAWIRzm
         DbILj8V2ydRxRxPzg2mXcK15u16urAxsdzMhFgo3FJlgcGkflS4tknP6Ta0hduMFxEqL
         ytew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oBgP2IH/MhseGLN+WdokUjxg0S5B7ZpRhyEMkEIva8k=;
        b=vbo5Tyo3e/q7Ql4nGRG2mC85ksHp81PIALE0ji/31NcN95GVJJ33qOhFfGipc7vtzc
         vrZ0KUd24XZzRMPXY2DR1LVkaxscadbq3iP00ehBFzLc8YdMhr2dfzg/j0iyEvBOjoAf
         v3LcGzeLjoyXQXmKIf0/fP0eJdsucnNo/YVqXIGxXd6iyIVLZGr7/5KCAWL5Jb5Ld4sA
         tm46v/wLrg4d7pN5E6emddFYEy5U57JfRY0RYUOsLS7+ZkMM/wT3EU4K8gCcQVD+BSKk
         DD66ZHEpCVlq8dazY73QdId2KE6hs26LnqUPZfxEWV3KrV4OJ+FxY0wUWF7IjF5QsCRg
         vuUQ==
X-Gm-Message-State: ACgBeo2ZgpuxLwSwTNQb6SxH+NiZK4TabPkPYkV2rih7xc85/a4yVa97
        0161wzRltI4RvTusn5DhfqfgFlbmuKV3Dw==
X-Google-Smtp-Source: AA6agR7RDwsAtn3REz6wPvIDVcc6XRIo6jPVDxqr9TV9UspIHG54koCkEk4eri05OAHUhG1ei1MTjQ==
X-Received: by 2002:a2e:be05:0:b0:25f:d8fb:afbc with SMTP id z5-20020a2ebe05000000b0025fd8fbafbcmr2481898ljq.369.1662636691295;
        Thu, 08 Sep 2022 04:31:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x6-20020a056512046600b004979e1ff641sm1501374lfd.115.2022.09.08.04.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:31:30 -0700 (PDT)
Message-ID: <bdc0c7f8-70ca-af57-1ed2-ad9d0fd6b9d3@linaro.org>
Date:   Thu, 8 Sep 2022 13:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: Fix apq8016 compat string to match
 yaml
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220908105720.857294-1-bryan.odonoghue@linaro.org>
 <20220908105720.857294-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908105720.857294-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 12:57, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.
> 
> Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")

It's not a fix and should not be backported because of breaking ABI.

The other compatible was correct, just deprecated in June this year, I
think. Quite fast to replace the deprecated compatible. Maybe this
should be just documented in the bindings as deprecated.

Best regards,
Krzysztof
