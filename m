Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D0E50000D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 22:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbiDMUjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 16:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbiDMUji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 16:39:38 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4099F4CD68
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 13:37:16 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p10so2922277plf.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=561d3TuyxJYJX7jFDENACAIZB9UHFv2jKUtYOnNdzJ4=;
        b=oPjHfRmAUcTkgs3S/vhHe/NXTBQmMsN9zz5JgSjKDYozfGoNBLUV/gjOx01FaHjdvG
         ntLT9uab+PHEbd/g+NDXdx3BwDf3OmH8YesnWLiPc/4Cqn9cGDr3JvzOIdx1bH6/QCWe
         mO9LwMxm92L+k1bxGIBgg/DVnnQD3b//KFCjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=561d3TuyxJYJX7jFDENACAIZB9UHFv2jKUtYOnNdzJ4=;
        b=IxIpdntS68jJ3b11+fMe9ouyrHjxkGMRvuVDaKf2g/aUOszlQDAB3SMpexqiAdqeF/
         zuQPJ3ID1bcM8zB8fCIyrkfL2nLD+3Z2kkJRQenqJa7aymhypvxF6lzP9A03FnVXCPRX
         rX86JNEQLE+OaLeYp/DXFkeJ+VbfQmUYUthOpI8Rx4Jkr/caGIzWbJf3u7ewfyEKazif
         xTjRGTmHulvCW2OXKeTR1xUnWCB0pdLjtxqSyRqSXELVhEHhAElKa7j5bA+NJtrSNonx
         BRsc/NMID+k4iFimPFjHjVZezSfIUSqdzzmyMGiE7dlzMcccpdXq7p//Uo9AtSi1kZeW
         Lv0Q==
X-Gm-Message-State: AOAM530Fzq6HuDQ7bl1pQj8UYha/KQ8Ftx+xDpUKcj0PHpipIYVfkUfP
        PA0jjSZLICBfh0eoU1R7iXEp5SpDJkaJJQ==
X-Google-Smtp-Source: ABdhPJxlS6V+yaBYXnD7Ck6dhm8oz9vcrEy+zm2UNOOBnri1Nu+76MZmLzBqdBHOJi+YIOix36X8cQ==
X-Received: by 2002:a17:902:d051:b0:158:5910:d67a with SMTP id l17-20020a170902d05100b001585910d67amr18105963pll.15.1649882235801;
        Wed, 13 Apr 2022 13:37:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6a4f:9277:743f:c648])
        by smtp.gmail.com with UTF8SMTPSA id n20-20020a634d54000000b0039d18bf7864sm6666996pgl.20.2022.04.13.13.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:37:14 -0700 (PDT)
Date:   Wed, 13 Apr 2022 13:37:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sc7280: Add lpass cpu node
Message-ID: <Ylc0eYIXnLZMybp6@google.com>
References: <1649863277-31615-1-git-send-email-quic_srivasam@quicinc.com>
 <1649863277-31615-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649863277-31615-4-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 08:51:16PM +0530, Srinivasa Rao Mandadapu wrote:
> Add lpass cpu node for audio on sc7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
