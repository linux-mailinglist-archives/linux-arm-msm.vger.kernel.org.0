Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3529453F1BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 23:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbiFFVcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 17:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiFFVcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 17:32:04 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379EB56407
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 14:32:03 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id o6so8079821plg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zwFgEioW6+dps+UZ8YhmtNSvhyshGyl8govd5a3fXPY=;
        b=jqydjtFc/RmZBMb24ewb0gU1WiC+ZnxuHT3FEHsdMtskE5j4ahApOqYXpBKXXqzCOh
         W+WDAoOfOL2+RYTx71LmIhsbRHMCezEvetTlGVgUCWzurIfYOA+rxIv8fRe9coJGq1hl
         HY1BnJs04Edh0RxBt/4LzVg4PLgZ2bLYWUaoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zwFgEioW6+dps+UZ8YhmtNSvhyshGyl8govd5a3fXPY=;
        b=6m8bG+ObVf7gEE7iHWjB/4dHcXkgJy6Ee9tH2FfjUUhJKu/PS/zSp90U+ksgVqWRCm
         KZ+TuFdpV9pkoK77+YrssomcpJ2WzirOUVdGoIFpSgLQ4FirV+pbv87q+EbKwPbBOKST
         zKWFwhm+Tk0kFOsrYgj+/oE9qMxkZJZXh32BgO5TbxQ0MGVD4/WMPHfmXjr1zVGYpywE
         ftYhEsy7dXSYcCf6chPZy5SfeUgXP9XstHzSyuqERY1tb1cwhHIXIs0s8OsMyqgFHaFn
         +VqdfCSjpkT9uw+vm/wZn1EejCvG3YxWuvmRVbJfMF6rAZksA9PKomeniZnoA7bVXu6K
         W+dA==
X-Gm-Message-State: AOAM530WpI8XTRXR4VJ8SxbW3KSg/mg2NJaL89gwf5atHdaDsODXVCwt
        x63fANgV8Bm5G7QNo0QIrriFCw==
X-Google-Smtp-Source: ABdhPJzFCoz1wnK2i6ZyDNCl+1R8AH5AkRe8lRZiN2HEGNRw8Rd7b9GLNMQNG4fMTtAAJ2M5c8qZaQ==
X-Received: by 2002:a17:90b:1a8a:b0:1e8:9388:5b5b with SMTP id ng10-20020a17090b1a8a00b001e893885b5bmr4265017pjb.50.1654551122739;
        Mon, 06 Jun 2022 14:32:02 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:196:a14c:7344:f6db])
        by smtp.gmail.com with UTF8SMTPSA id i3-20020a056a00004300b0050dc76281c9sm11227962pfk.163.2022.06.06.14.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 14:32:02 -0700 (PDT)
Date:   Mon, 6 Jun 2022 14:32:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Subject: Re: [PATCH v12 00/12] Add soundcard support for sc7280 based
 platforms.
Message-ID: <Yp5yUSvC05wOxtei@google.com>
References: <1653049124-24713-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1653049124-24713-1-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 20, 2022 at 05:48:32PM +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add bolero digital macros, WCD and maxim codecs nodes
> for audio on sc7280 based platforms.
> 
> This patch set depends on:
>     -- https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638776
>     -- https://patchwork.kernel.org/project/linux-arm-msm/list/?series=634597
>     -- https://patchwork.kernel.org/project/linux-clk/list/?series=637999
>     -- https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638002

Another dependency (at least in terms of functionality) is:

ASoC: qcom: soundwire: Add support for controlling audio CGCR from HLOS
https://patchwork.kernel.org/patch/12853622/

And then there is this:

arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers
https://patchwork.kernel.org/project/linux-arm-msm/patch/20220523100058.26241-1-quic_tdas@quicinc.com/

A previous version (v3) of that patch already landed (9499240d15f2
"arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers"),
it is not clear to me why it is still evolving as if that weren't the
case.

From the newer version of the patch at least marking the 'lpasscc' node
as disabled is needed.
