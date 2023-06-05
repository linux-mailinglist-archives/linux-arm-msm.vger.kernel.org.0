Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5193723025
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbjFETsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbjFETsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:48:16 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BA3E64
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:47:55 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-33d5df1a862so14153405ab.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994474; x=1688586474;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rm3H1hL3UyU3RqlFttRQWiBz05ketFmwfg40BdOH1ZU=;
        b=SITkELcFQJDG5gJLFqib9UtoPvUcxRZmTNcu/+i0u/Yq8MM5N6ZAoHLbr7vaSMQaZv
         C4pG28bC9RBDsYoQKsqzSpr/qi1+61Ut0jNGQDs7zmqyvDi7bkCAswp7pw9brhiSaNzx
         Bosd7YKGALHP/Sitlx/8YLsM+p0ZxUKufMx0f8Fj+dHE774KcvjUi6vVRKPrrIFxHSPq
         8EQNjXo2k9taHLUsDb25/Jpb5rPb9zcF9R7wDgPNLLq/PuNFPe7jRlJvGMTPw2DBB/mN
         mZR1sIKm3nBE+AUpXRvOCIouyzxHLGROqlZ2REAo3atxm6J1iMm1/Uw3LpFe18lug31w
         jNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994474; x=1688586474;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rm3H1hL3UyU3RqlFttRQWiBz05ketFmwfg40BdOH1ZU=;
        b=WeYfqyVufs2fRtPT/vrc1iMQXpfCmf2tam21bZ6YX59ILy0VwnSAblD7Vo08BIib4l
         s0gXGOy2rCUk4UKR9VYM+V8Q5epxU56O/lTCU+HNJg4oX5z2DY25ijNp1q27IDCXducq
         P288ZkvDFJl/70mYa9v/EQwhFjMLvB+vcXh1afIDGuQxBYRKBWXNmwJtKRSVZRP5e1+7
         0WAOr1KcCkXbJaLDYuDlD4R1T7uG1LC83Wi70bsw0kiYfrAS9beJbc07XzHinwJK2Zw+
         JTmKbhZ13rlej7y4MrTbyexC+LbLeJUr4vfNLCRzCsbNQUnOlBzBGu4A8KVQG2MnoVSJ
         Hbzw==
X-Gm-Message-State: AC+VfDygKhkEfviyCLMMFbMQ7G+3QESNgG+Z2AbYy/Oqm5nm2T8MNSTo
        F3ZHxUkiXUJaGEC+uSSoJ+/tUA==
X-Google-Smtp-Source: ACHHUZ7vzn7P9JmR/YlK2PVdEvnBd6GYA0sS+iuOeg4fx7+1R2v4nqdx5QOBIq8wTtCAevPyc9xCog==
X-Received: by 2002:a92:4a07:0:b0:335:de72:23ca with SMTP id m7-20020a924a07000000b00335de7223camr101291ilf.1.1685994474372;
        Mon, 05 Jun 2023 12:47:54 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id x6-20020a92dc46000000b0033d2b3928d1sm2563333ilq.51.2023.06.05.12.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:47:54 -0700 (PDT)
Message-ID: <181df717-66d1-1054-2f52-07a7fb6601b8@linaro.org>
Date:   Mon, 5 Jun 2023 14:47:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 07/24] gunyah: rsc_mgr: Add VM lifecycle RPC
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-8-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-8-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:47 PM, Elliot Berman wrote:
> Add Gunyah Resource Manager RPC to launch an unauthenticated VM.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/virt/gunyah/Makefile      |   2 +-
>   drivers/virt/gunyah/rsc_mgr_rpc.c | 259 ++++++++++++++++++++++++++++++
>   include/linux/gunyah_rsc_mgr.h    |  73 +++++++++
>   3 files changed, 333 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/virt/gunyah/rsc_mgr_rpc.c

. . .
