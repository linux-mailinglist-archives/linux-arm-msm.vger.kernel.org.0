Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8AEC7568E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 18:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjGQQRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 12:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjGQQRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 12:17:32 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB72E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 09:17:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so7577685e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689610649; x=1692202649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFU7cGHqkgdoz5m1pcWonKfTA7YVWiUsUb8DHWNDWZo=;
        b=Ue8V4tGQtKpifE7o2VP6/mxilgC9IC6PJfEUEtx4+Yn07bFFKjke6rujiY9eE3uiGo
         g2hZ51BDQp4wjOPrES7H7ksMBCNZmIPwIpsj+T50iBtwLGrG1GvOxnc1xtHfJxme2apc
         IGpscy050FTQ9g9gegZOKjguesgUJRQnm/UJcTHp5tHPITrInaSBPSdcYl22f3avm7IP
         ZZJ74KqgGMmX2uPvU7wqg0RhrkS2DbG7wq0HXySTyTcqE303x0PxPSAeBqZVYrHFl3Mt
         AxJjKjy8aT+sqXoH8jtL31/M10j2B397IRxgkufG3uiDqBYLPv8LgOSnqoT4wjItV6ES
         zALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689610649; x=1692202649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFU7cGHqkgdoz5m1pcWonKfTA7YVWiUsUb8DHWNDWZo=;
        b=C6zEJrGinnLQTtGD4QRtFLCb6jbKsPKdB8VzpeFVM9IdsPoq3DVeO2ELKl0D6Ht48p
         r0oxzjuDTR54I+ZWslEiTEo1KEOQYSD84bhZGinijDxijfd9i2/v/moKQ/5UlfNSFXT9
         fKQlDH8tpBHGBQ+l0O2vTTrRctI9sDjz7b20xn9lTlOoG5XEccBgS4LvwVzlxw4rZd+d
         RNWv/Z4sY52r7I3jqbspt6doDKqI6V5S9JucKlAEOwnwYbC9shDfKHLBY+38zde47iNv
         Y90E7mWFOPfRmfN9U1Uh0igk2EPZKaeYWhShaVJ8DmYc1OjnF0E95i53ln/ZgDWaPN0U
         qsOQ==
X-Gm-Message-State: ABy/qLbeP9ZCDx9D6DyxPDBlof1LVkFwrRqqsEP/sOrWqoszRF025EFh
        Iabzlh3W/e61R/8haSUDnZvKdg==
X-Google-Smtp-Source: APBJJlEbAXcK8MurlSKXwypJdOuzDF1QvrmB7+3M0ZnSTuG4089PJ6Afzrlqtg2dB1Sx5AqXkrCD5g==
X-Received: by 2002:a05:6512:208d:b0:4f9:5933:8ee8 with SMTP id t13-20020a056512208d00b004f959338ee8mr7984978lfr.32.1689610648829;
        Mon, 17 Jul 2023 09:17:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id i24-20020ac25238000000b004fbb610c354sm2909393lfl.0.2023.07.17.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 09:17:28 -0700 (PDT)
Message-ID: <58549eff-8b64-fc63-5b14-82dc85fccc98@linaro.org>
Date:   Mon, 17 Jul 2023 18:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/15] clk: qcom: gpucc-sm6375: Unregister critical clocks
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
 <20230717-topic-branch_aon_cleanup-v1-5-27784d27a4f4@linaro.org>
 <ZLVpH16co7wXWInI@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZLVpH16co7wXWInI@gerhold.net>
Content-Type: text/plain; charset=UTF-8
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

On 17.07.2023 18:15, Stephan Gerhold wrote:
> On Mon, Jul 17, 2023 at 05:19:12PM +0200, Konrad Dybcio wrote:
>> Some clocks need to be always-on, but we don't really do anything
>> with them, other than calling enable() once and telling Linux they're
>> enabled.
>>
>> Unregister them to save a couple of bytes and, perhaps more
>> importantly, allow for runtime suspend of the clock controller device,
>> as CLK_IS_CRITICAL prevents the latter.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

> You seem to revert PATCH 03/15 here.
> 
Argh, I had an iffy conflict resolution that I thought I had gotten
rid of.. but looks like in the end my brain farted anyway..

Thanks for spotting that!

Konrad
