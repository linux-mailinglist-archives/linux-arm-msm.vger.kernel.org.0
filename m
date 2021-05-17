Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34C386C6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 23:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237879AbhEQVms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 17:42:48 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39843 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbhEQVms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 17:42:48 -0400
Received: by mail-oi1-f179.google.com with SMTP id u144so7824149oie.6;
        Mon, 17 May 2021 14:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4ikjP177ecLloQSfBQANisXKQzJkiyosfekDEDkqQPk=;
        b=dXwpwu91/poafxBVPQtBprL7r7qFE1Lp9AyZHE2KCSPHGejZketW1MRPbM+Ep69j7o
         juyHdWQn75ZfnZLPD7iSk1EX1zj9ghpIL8onJo1BAEMlF/zmrZ32REjfKuCe8jV2uXfs
         0YG34e4TLXjfgptj1AFr93xwge2nZ8kF/Z6/mCh9X5nDEi/XMFQYxfZdfJhM634qlJYj
         oXebWi0szr/BHH79hv0G1mBP/ryCnJczSH7MDNh/snWaGCyQ0XPln1+lVQZTp+k1jOfN
         9P8twAFkHQLvEoEX2rhE1Kvhavzh7jEKH7tTL/CBHFbWZ1B8xpoaeUP78ww2idEyzSna
         qKlA==
X-Gm-Message-State: AOAM531iwMKGe5Iz5b0O/3oe/ZusuInp2RUqey8hxX8TB50BXfPCpfkd
        H7bgA7hNZHE7mjNrQbbyLQ==
X-Google-Smtp-Source: ABdhPJxKYB/lSvyXQMUOvz9iMcVsCiisbRcYxAxQXc22ZKSxtE9NG0HjDAmpmtvwV8ewyw5L/zf0uA==
X-Received: by 2002:a54:4e93:: with SMTP id c19mr1385964oiy.56.1621287690718;
        Mon, 17 May 2021 14:41:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 47sm2602277otd.37.2021.05.17.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:41:30 -0700 (PDT)
Received: (nullmailer pid 3251110 invoked by uid 1000);
        Mon, 17 May 2021 21:41:29 -0000
Date:   Mon, 17 May 2021 16:41:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8250: Add EDP clocks
Message-ID: <20210517214129.GA3251057@robh.at.kernel.org>
References: <20210511041719.591969-1-bjorn.andersson@linaro.org>
 <20210511041719.591969-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511041719.591969-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 May 2021 23:17:19 -0500, Bjorn Andersson wrote:
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c              | 186 +++++++++++++++++-
>  .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   9 +
>  2 files changed, 193 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
