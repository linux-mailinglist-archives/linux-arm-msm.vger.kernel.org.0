Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F2C64DE6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 17:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiLOQSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 11:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiLOQSx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 11:18:53 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFD130F4E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 08:18:51 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4NXy8p3FwVz1S5Cv
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 11:18:50 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:content-type:in-reply-to:from
        :references:to:content-language:subject:user-agent:mime-version
        :date:message-id; s=dkim; t=1671121129; x=1671985130; bh=KkVQrr7
        8sLYl1634PDnonKW+zcJGh/Ag3vGU/8LnAcM=; b=Fyyd/cy3FsiFJsU8wy24dJQ
        G3biulGyJ0BMoB4xW3Fl4dLdAAiKIxwWgtEP95GxZ+xQw6awb8iQgjlqovf/hFDU
        TIsAf4A2uf13+6BJ+e1vRBFd8RFcYX0bdywCYJ5yri8Ctp5RKIQd5wfBY96A94LL
        T+zAc/AluAzZA5Skvyxl9V0m6X+TqpEQScfcf0hW+0W3BijvQwa6G8ucLM13/bAT
        zGmdp/vfGQpx5b4IK2Y866ymV4p42uddo0rwMU6cOP0Gh2BzxBET9ma5FRXNewJt
        GjAZVT9r4KHezYx3kp5AxU5fOialNfYGiaNQYI4L0Zf1rXpSr9SlrUyrIMz+emw=
        =
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vzKmq8jmJ9T9 for <linux-arm-msm@vger.kernel.org>;
        Thu, 15 Dec 2022 11:18:49 -0500 (EST)
Received: from [192.168.4.25] (unknown [190.196.92.66])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4NXy8j4Kg2z1S4t9;
        Thu, 15 Dec 2022 11:18:45 -0500 (EST)
Message-ID: <8e7c0b67-e8e8-4d54-080a-02065e09da5e@mint.lgbt>
Date:   Thu, 15 Dec 2022 13:18:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-laurel-sprout
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20221215161258.355962-1-they@mint.lgbt>
 <20221215161258.355962-4-they@mint.lgbt>
From:   Lux Aliaga <they@mint.lgbt>
In-Reply-To: <20221215161258.355962-4-they@mint.lgbt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/12/2022 13:12, Lux Aliaga wrote:

> This commit implements support for the Xiaomi Mi A3
> (xiaomi-laurel-sprout). Here's a summary on what's working.
Noticed an issue with my commit message. After review I'll send a new 
version rewording it.

-- 
Lux Aliaga
https://nixgoat.me/

