Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB0453ACFB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 20:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiFASnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 14:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbiFASnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 14:43:21 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF336C560
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 11:43:19 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso2893789pjg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CylZr84lNM4w3HdFBlt6SOrJM7582Y3Dp242aVUdYDw=;
        b=ftb+nI02XlOPJXHTuaCLRci64mITA4Omfb/UUtLIC1sXgKoZUnJeCFbeUk7ni7ghht
         9yUXBo+ObvjCXB+H7YHfFLQMHeayMiGA4fq8pjQZ7Qk/1Qq2ZJxJRJVZ5BIQvZQs7zVW
         rtMZDxS9Xx5l+e9aEAa5p/z6/cas7TtS8xSBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CylZr84lNM4w3HdFBlt6SOrJM7582Y3Dp242aVUdYDw=;
        b=iWzNiLiDsxFf2ggvwX7WDrk+hm8DejQUhh6okdIZSGE5AcozTzZQCxovVQWf14b84D
         Xxd473FMGZxeNWlgpuoBvRtRgdYm3ChnCWqOeGJZfU9Xs2sCwxEGu/oWR2qExH8hvoSn
         tAtGiYMuI+3AJCNQP9OxExkN3yT4DocGhQ+UJ9+04MvCbpkD+ZD1L2yPYrKoinYxgzZ9
         YYLlaItOFgkfM/yBOdCGG5S7lOfJ4PVakV/1zUUK9LkfSIv478/fa4gokzoJnqqH8H53
         g5OBxNFYG7kAcgpc7aatxQS2lmjwlWal+cDOqtoNsZXqE2MTec0QO3yjwV2hjMwCkeE0
         XsXg==
X-Gm-Message-State: AOAM532DdQXHvvM2dlIcv6zhByOJ6bgTLPqVJF2rfvaQqsjon1rzY1NO
        ZzOcYYz6HmAFrbAR0GsdHiDRbg==
X-Google-Smtp-Source: ABdhPJwLE5i5A07i5SgY07uY/UOCAYp5F1osDKzp7pdDjaN8DDsYjIkyNUSDef3lAjYbk0rLYGQu4w==
X-Received: by 2002:a17:902:b10e:b0:165:7c1b:67fc with SMTP id q14-20020a170902b10e00b001657c1b67fcmr776571plr.77.1654108998830;
        Wed, 01 Jun 2022 11:43:18 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e69e:f483:e751:7c7c])
        by smtp.gmail.com with UTF8SMTPSA id t1-20020a63f341000000b003fc4cc19414sm1648304pgj.45.2022.06.01.11.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 11:43:18 -0700 (PDT)
Date:   Wed, 1 Jun 2022 11:43:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
Message-ID: <YpexqxRtnMEFUki7@google.com>
References: <20220523100058.26241-1-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523100058.26241-1-quic_tdas@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 23, 2022 at 03:30:58PM +0530, Taniya Das wrote:
> Add the low pass audio clock controller device nodes. Keep the lpasscc
> clock node disabled and enabled for lpass pil based devices.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Why is this series still evolving? v3 landed in Bjorn's tree some time ago:

9499240d15f2 arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers

If what landed is not correct or needs to be adapted you should send a patch
that is based on the current QCOM tree and makes the necessary changes. The
versioning of that patch should start with v1.
