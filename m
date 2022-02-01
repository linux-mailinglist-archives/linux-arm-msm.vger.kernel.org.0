Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EBF4A6314
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 18:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbiBAR7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 12:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbiBAR7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 12:59:01 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0435FC061714
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 09:59:01 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id z131so15975545pgz.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rFvrRBFYRkSNYSi6O0ttf9bwGkRMX6RYVT/6/lJeLok=;
        b=PY+xxDCzAMHt2lg40chWYBo5Y90OZfcEPXi/CdWCoZu843MG4rCT96JMgN3487fGzG
         XJLZuEH6na9zI07H7uGh7Hhzf9fgBoXxmER9fxEuicvV+u5OjNq8YaNsemDUkSIYfxs/
         XY3R+vDruuYr29uU91i73Up4roBPOIDpY6I1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rFvrRBFYRkSNYSi6O0ttf9bwGkRMX6RYVT/6/lJeLok=;
        b=3vAEHfiW+ztWmAQJFcuA23Dcsjs5Ug2BsVtuv+rlXxbmGNsQGtX/oKK1ADhZo/pcab
         OB/pV7R2LMnMacuGOUQVHJCo7iNgnQQNDSQ884JglrZHPTQRomCx5nEFjybWY1AAVv46
         2fGl7t2g8DdMpt/UMVSFgSKMPhnfdWGT8Fa9IdAL2dOer8oirzId4TfHOi+XF9pcD1Bm
         xbNygN+1XvZWb5Ibad7sXL3pgtI1/9yVh6KZzd/fE7Xws1l01XXKPO8MoN43ZEwtRahN
         68oS6lYaHAOXTWiVCI7orj86OYiQm86H5SXdnnlhZgYh9r1Mc8YAJWRjjAe7ScAi5cO3
         9hRA==
X-Gm-Message-State: AOAM533FidJd385zZh6qdA6x8wneK30KRTUOWZFz8NaO+BBSLZQYPdta
        4EPVWS6eW3XOLUxC+miC3/EL5w==
X-Google-Smtp-Source: ABdhPJx5I/ackme38S3wD0KRczU01kWmkJruHtPxIf9wCJQB/mV7gmiTtoUIFK1lK9nG4PXb5SQojQ==
X-Received: by 2002:a63:8a4a:: with SMTP id y71mr9110713pgd.207.1643738340441;
        Tue, 01 Feb 2022 09:59:00 -0800 (PST)
Received: from localhost ([2620:15c:202:201:aca9:b3a5:6f80:8fb5])
        by smtp.gmail.com with UTF8SMTPSA id d20sm23757577pfv.74.2022.02.01.09.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 09:59:00 -0800 (PST)
Date:   Tue, 1 Feb 2022 09:58:58 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        swboyd@chromium.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc7280-herobrine: Consistently add
 "-regulator" suffix
Message-ID: <Yfl04n9YhB87Qe0F@google.com>
References: <20220201001042.3724523-1-dianders@chromium.org>
 <20220131161034.2.I627e60c5488d54a45fd1482ca19f0f6e45192db2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131161034.2.I627e60c5488d54a45fd1482ca19f0f6e45192db2@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 31, 2022 at 04:10:39PM -0800, Douglas Anderson wrote:
> Some of the fixed regulators were missing the "-regulator" suffix. Add
> it to be consistent within the file and consistent with the fixed
> regulators in sc7180-trogdor.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
