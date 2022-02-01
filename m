Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DF74A5677
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbiBAFV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiBAFUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:41 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DECC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:40 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id q186so31201336oih.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g1xAd7MhWM114EP/lwapQoULra05aKelSN/7cTNRJ0I=;
        b=T1dKB6l2snA7lgKPCks1ks13hIqSTQ6YBMknAlnYZYkpxA2M1bWlJd5U+xN1nVN3G2
         s11kYH6Z2ZM9srQu5NARZcYY+QTzUXAxisOB3V+3SN5tJv5btTwM6rFVCvh7+pj1FN6W
         lCRF44RLxC6BW0D4DioXhBfQ+fJHUOT+27QrAFzLEs6nDl2Tj627gHAm/cuHy06sZGgg
         xT9TDey8LX+VZMBP1e3fHrIRTJstn0P6SEZ0++TRHtp+vqtuowfOEn9IfPdU1FVopIT4
         daEBkIEWrmkFTBgmNkxoGgsmusajJaAykgWPebFpqOIApV7pQXqY+bS0bfCIrbh3jQC5
         OQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1xAd7MhWM114EP/lwapQoULra05aKelSN/7cTNRJ0I=;
        b=pfYZVigOESL0M0BjQFNepmN+IJG4tzBqcVixhtxPwgNUk7x2acnn+sOEF+HX3eNgWZ
         9sRjZYQdt802YJGm0dG6B9IPiLYvlzN+XDra/TvREYLQEo4/tVNy4BxnjKh1Rzj7se9k
         d6gCMFq1BgruKM3wC1zzq6/WsptJxk7QPlFGwP6HkW/ZtV3tU70s0fgWsPGcj59rcToy
         QkDl0h2RiwnlSQA0pTs9D/vWNODpOPknVMbQPi3uov9ctWcYvkpgRNeKTl4b4I59eXuf
         uNr94lqQCvW36CWwHwbb6Jq8YvUKTYf1esgCEwT9pF073zvigMqfwqHgi5eK90QFM3BP
         //Hw==
X-Gm-Message-State: AOAM532LO8mlpsXWZjuxeQmmH1sA42H25GEsQT6FR/6BpFkYLNiK8d7t
        2mpyRqYuIgZddR7rBPJzYj+YlWpZW17hTw==
X-Google-Smtp-Source: ABdhPJxo2omDXankE0jqJ/j4SG+TP6imO5bLi/34uTkLJWm74Vq42aWzp6gTmYp2htyCU97kMIknMA==
X-Received: by 2002:aca:398a:: with SMTP id g132mr203882oia.207.1643692840370;
        Mon, 31 Jan 2022 21:20:40 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Matthews <jm5112356@gmail.com>, linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, luca@z3ntu.xyz,
        devicetree@vger.kernel.org, bartosz.dudziak@snejp.pl,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: pm8226: Add vibration motor node
Date:   Mon, 31 Jan 2022 23:19:49 -0600
Message-Id: <164369277342.3095904.17898703423921081111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211123003256.2467776-1-jm5112356@gmail.com>
References: <20211123003256.2467776-1-jm5112356@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Nov 2021 00:32:55 +0000, Jack Matthews wrote:
> Add a node for pm8226's vibration motor driver.
> Keep it disabled by default, some devices don't make use of it.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: pm8226: Add vibration motor node
      commit: d88198fcb540268e2165d2d1eecca005ca5fc394

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
