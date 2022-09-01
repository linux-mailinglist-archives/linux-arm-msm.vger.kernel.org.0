Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07ACB5A9C75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbiIAQES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 12:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbiIAQER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 12:04:17 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10988FD72
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:04:16 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q9so16797760pgq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=RDQJd9j02PpeO+3EPY7C48IcXhi9uoKh6VvJ2TfCav8=;
        b=g9DjNy8TNMKe/ABwxBesrDJThY9V75D1n7Bbs/8tKWBXoKanaaQ1m6zzBtNRAV2DHr
         hDiLVvSi2JcFW6ySrgprvUHHqdxmcXRISbooh8SYIZcctpFSbR3E+XsJ5GbO8iKll/lq
         UEs8vXbvIFhbkii85XgluJqzRCg3Z+EETuBCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RDQJd9j02PpeO+3EPY7C48IcXhi9uoKh6VvJ2TfCav8=;
        b=71VJyfXfb6o49dhqd5nSnrV8wXSiTpkaj/rmoSEt/HjtHD1Klmigc/fnWXAO5r6BEQ
         kmLhnARik3wvTNR9HPgWBuzSEF6L5RGoPyLIWeN7Q9tqYVypW0BbCE/VyJI24skOI/CX
         bw/9ftzPfDXvvt4tccru7t/hbOgvN3CFccGGz+hKnop5OX5QplfFPAOl+mqurivWffbU
         0pzQ8kGZZtZOyEQuXie1TDPgtdc4Lr1DcQ1qitv6LE1eI/TxZUw7vEF3h8tPukzwYjm0
         ofSWqkpyNBdvv7jzd1Bpi6U0LoiwhoPbqOgnPIy26mwufNe2of77a3hqyN/KAk6B3hSL
         JA/g==
X-Gm-Message-State: ACgBeo3jVrnH98Ast19tRodUveqPAqpZ+Op8FVE+jfdnaXNIzaV8vSsQ
        NkJApjBo37u8NagBjKQnfZDlgg==
X-Google-Smtp-Source: AA6agR68eEfnYD04bZhFsoCtosKppWER481lrGds4DIRviTTJ9jvG4lZzwEduwGrvPvunR+WCVteng==
X-Received: by 2002:aa7:8712:0:b0:537:db6d:af66 with SMTP id b18-20020aa78712000000b00537db6daf66mr28963796pfo.55.1662048256465;
        Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:34cd:3659:c11f:5d05])
        by smtp.gmail.com with UTF8SMTPSA id g1-20020a17090a708100b001fbb0f0b00fsm3520455pjk.35.2022.09.01.09.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
Date:   Thu, 1 Sep 2022 09:04:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sc7180: Update the .pwrsts for usb
 gdsc
Message-ID: <YxDX/idqLo/3FD9s@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
 <20220901101756.28164-2-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220901101756.28164-2-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 03:47:55PM +0530, Rajendra Nayak wrote:
> USB on sc7180 cannot support wakeups from low power states
> if the GDSC is turned OFF. Update the .pwrsts for usb GDSC so it
> only transitions to RET in low power.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
