Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4E870ABBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 02:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjEUAFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 20:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjEUAFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 20:05:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6333A13E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 17:05:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac785015d7so51110321fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684627512; x=1687219512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MT2O6oEN4amZYZbrPzoTSJIieP6gKCVAv+FAOIlFDXo=;
        b=XFBqKEra1c/S26nfesjWt8E3n4da7Md83Qiisn1UfjHJJkHSilc1MK4xgcu1Mmtn1z
         Ol+T86Oh+5cGxlezT7q7sp3KXGfDtqljAUaZVTCTc1IV0oicq6iZBDy7Pk77gMp2Y5tY
         0Ua/vlANdFKNbAUESeGGgwSOuWy7z42omTf7hJYcbo2RhcdhfBEz99rsB8Kt43JydXYc
         nrVrrbaTKpOhGyCe1+Fvfkliy7fQxUbi4ZNMXv0CqHeqFDAKHV6J6+vlMe/sJ9mkNXE0
         GdtHgQ/52xgOehvnXkBRw1O+qd1kj5gmOREAtIVI419LBTIfpmQN6F71y5CGXwPsVsgM
         p3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684627512; x=1687219512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MT2O6oEN4amZYZbrPzoTSJIieP6gKCVAv+FAOIlFDXo=;
        b=cNpNOyI7/spZjUkSculRYkpBAtr7puLdlou5XQ2+dMB0ZJ19pSbauRd2WoEHo+BTmZ
         XLx4aWQh8p8pxo6l8ocW1ud6LqHUkB5Ta9QPd4QsZu/wjnXsMKnMnZS4yi7XU1ptADIk
         n2QvnzmB+X37Mesj2toxtkJb0pHBr7NNCEjxgDP4M3h9IbzLChvmhZX0lnMCY75Qrs9q
         fv5OthYOQqBPrzLWGJ39OBhhiSSErl1ZqA2YniOFDR2sYi1Ij0DfgT30/XRvaSsN6RBp
         dJmNmEao32tyLiX4aNCNWzh2K7pTOi3XtzsyTOD8xRdx0dykx9NMS+qIuM9jBREgE4Qi
         +9HQ==
X-Gm-Message-State: AC+VfDyVQBJ5nSG6clRzY66fcPPTndj06s8ckwLTRzEHHVF0yvyR0dMs
        cPHd9T7DsY2cYOGuBXLvU8HerQ==
X-Google-Smtp-Source: ACHHUZ4jgVMNNvFJMhZdrVgAOcV35Yjx3chgNSXtiIxkETrAzXdaeq+4jbf5BxLmtDKv30mLNW2NFw==
X-Received: by 2002:a2e:3c0d:0:b0:2ac:826e:c5a with SMTP id j13-20020a2e3c0d000000b002ac826e0c5amr2828206lja.1.1684627512687;
        Sat, 20 May 2023 17:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p1-20020a2e9a81000000b002ad90280503sm488438lji.138.2023.05.20.17.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 May 2023 17:05:12 -0700 (PDT)
Message-ID: <828b2591-c160-b88c-bc8f-5105fffe23d3@linaro.org>
Date:   Sun, 21 May 2023 03:05:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 6/9] drm/msm/dpu: always clear every individual
 pending flush mask
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
 <1684452816-27848-7-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684452816-27848-7-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 02:33, Kuogee Hsieh wrote:
> There are two tiers of pending flush control, main controller and
> individual hardware block. Currently only the main controller of
> flush mask is reset to 0 but leave out some individual pending flush
> mask of particular hardware block keep previous value at
> clear_pending_flush(). Reset all individual hardware blocks flush
> mask to 0 to avoid individual hardware block be triggered accidentally.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

