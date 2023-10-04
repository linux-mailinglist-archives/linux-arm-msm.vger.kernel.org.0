Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892317B7FCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 14:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbjJDMwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 08:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbjJDMwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 08:52:20 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20588A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Oct 2023 05:52:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4065f29e933so21213035e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Oct 2023 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696423935; x=1697028735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbDugttl8nO7QnKFiEkqSWobIkIULpVRulw4zvA/9Ss=;
        b=RdM10Roetvp/F7AwBdUeMimTvL1d+ozpcJfIvrfcTnYrttxurFoiAkCKeJnfnZ8c5h
         /JBnjj+BVS1RpCd8EDoepPKl7Py+/oBIGyNCvesNawPRD8UHn/0RLaa4hS0PqlG1afDN
         OzjxlbuAUIRWdUD5Z5M7FEJfNZeAg8f2efRuouyYvJRGf6uVvZDX/aJwRTxipsPi3BfV
         2hJWAoQz+zm+oxLnFiGGFs8DY0iG53XQDi4F3Heq9T8oqKE9DScerrj5CCjgCcAvg4sH
         YBCRe6OSxOgUteOBPsRBnI8ZnyTxP9DQ+C7HJTlwBK/IG8r8gglES1h2WeBObZluYre1
         A1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423935; x=1697028735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbDugttl8nO7QnKFiEkqSWobIkIULpVRulw4zvA/9Ss=;
        b=e5Kc2n7JYx1OrRV4Rzzxz5CEqnmV8WPCGJHRs+sI/uX7ew/yb3KB7kHloAaugOxuvh
         aVm8f5RHzPeicSwt9NWkntMpBKJ717Vp3OK8nxlKGOcPBz5RJVpxuHQQTrOEkIauQTJy
         IwjAXMXe4Vp2lvPc4xn3eSQXPAOkLKU7bqYABS4LwgtQojP1fqffsQQX1BbI1L94QC7O
         2n8BwjpQMKvkDx/UUFX8QE1oWVrVtakez3PXcs1efq7/rB8P9QUdwuRcAqh0bb+5Km5x
         UWumtPik0UmX+dPJTeFXCNSvTuNCIQ2zHGLjXlUVA+XXVH7buJu93HxA4Akjk9LfrXW+
         H7Eg==
X-Gm-Message-State: AOJu0YzYh1SIucsjpTpZPy4pmxLJhscm1OoX90/vuy/LsohDfMDkCg6V
        E5m7bqOsI5rNC8n2Yo6zZ3NX6aac8V8es/yYkeoF7A==
X-Google-Smtp-Source: AGHT+IGJ+zdeWqpzPPRNv7wIiJfoVXE4TrlF8rAbJtAcx3+5BGhrWDha7q+twXf5IEiIS8VaX5i7gA==
X-Received: by 2002:adf:ec82:0:b0:321:65f3:4100 with SMTP id z2-20020adfec82000000b0032165f34100mr2027993wrn.7.1696423935197;
        Wed, 04 Oct 2023 05:52:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a12-20020a5d570c000000b00327bf4f2f16sm3927903wrv.30.2023.10.04.05.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 05:52:14 -0700 (PDT)
Message-ID: <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
Date:   Wed, 4 Oct 2023 13:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2023 13:08, Dmitry Baryshkov wrote:
> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>> must not be completely turned off. However its design has one major
>>> drawback: it doesn't allow us to properly implement the is_enabled
>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>
>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>> switched off (and shared most of the implementation with
>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>> parent map doesn't conain the safe (parked) clock source. Instead if the
>>> CFG_REG register points to the safe source, the clock is considered to
>>> be disabled.
>>
>> Why not have a new bit in .flags ?
>>
>> Instead of lying about the clock being off, mark the clock as "parked",
>> or "safe parked" or whatever term we choose for it ?
> 
> The main problem with adding flags doesn't fully scale. From the CCF
> perspective, what should be the difference between parked and disabled
> clocks? How should it treat the parked one?

Exactly the same as a disabled clock, except you get a "parked" instead 
of a "disabled" when looking up its state and you don't have to

-	{ .fw_name = "bi_tcxo" },

Also you can then flag for branch2 clocks the same thing - so parking 
would be done at a higher level in the CCF.

---
bod
