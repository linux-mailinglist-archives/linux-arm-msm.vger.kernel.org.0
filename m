Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F811E1F07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 11:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbgEZJrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 05:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728686AbgEZJrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 05:47:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3479C08C5C1;
        Tue, 26 May 2020 02:46:59 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id k8so1040841edq.4;
        Tue, 26 May 2020 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KA+bHp9rxExZP+OmYeJADOO2BQciqNprrH+ZtH7Ib5w=;
        b=oItybm9+cVLjWxgJ+rDptOHtBHE6kr6yNWQsIox7nSinLI3JpxSaoqxAx920NjXfUi
         Q2fSayYCnjKvr80kS/31ypg0JBNbsSO9kjdfk1K9BCA6PdaoF0vMDYRja0ZrUjGt9+G8
         j7zT8z6juG9No67gRinhMFcUUzuVOLp4hEH4qkGVBKFM3YyrY3p0ghCzcaYsygfzGfs8
         R62UadC3lGwAK123fEkCYcKbJGGCx7qavkYhKLq28co7nIYKlDTMl/53xkTv1k8xwR9o
         PydReAVu6HK6OC6F2RAv7FIhUbPlDEomtieLPwvJRrmIwr5wtvxZ+apafRc2dDpEOX+X
         +LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KA+bHp9rxExZP+OmYeJADOO2BQciqNprrH+ZtH7Ib5w=;
        b=K4gQ7Fknk7UdQbpP8yr3tzM2fooP4hlG1cy96a9uleLg2hVldYRq/Il6+VjRZtEhtj
         7LBSzxtr0hvL/+mh0V9uwK4V56k/otkav9ea98MfPBoQanA9fACO76s+VNInJPC0evm+
         At/JgIHU/LgJ31xJYz3KY/8WkuBUpvUn6kAFYR2zBsqfR3cYOs2+tvZpldFqm2xBf3kV
         oVLwr1QfHV9DvjNQoeqqhtFJzWt4h4wpZtqUsbKO/wJatBdE+NIRFuFLk+MLQZ6eqe1w
         ZGaf9WNOB1Ps6BxWdespoyQR/aUTMufh97tjTZmBbyOHUD5QCH8kqM/WC61ia8/Iyhtp
         gSJQ==
X-Gm-Message-State: AOAM5310+hX5e2qi8I73XADKXEkcUPzNS+sL9uPtD3EcXOFg/rmQHJg4
        qEVIPLhJP+sDML6VeTA7vb4u5bDU3Bot75y8Sdw=
X-Google-Smtp-Source: ABdhPJz0ztayBlOshX2YgK2JYPAQqnJVAvCGzcRKxvIz1xNVZXJJ5SZZwaSyxwob8ClcShJxauvUdAHXGkGkvwLOURI=
X-Received: by 2002:aa7:cd4e:: with SMTP id v14mr2135151edw.297.1590486417763;
 Tue, 26 May 2020 02:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200517131348.688405-1-bryan.odonoghue@linaro.org>
 <20200517131348.688405-3-bryan.odonoghue@linaro.org> <af35d732-08bf-fe95-3c98-063b32fe992a@nexus-software.ie>
In-Reply-To: <af35d732-08bf-fe95-3c98-063b32fe992a@nexus-software.ie>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 26 May 2020 11:46:21 +0200
Message-ID: <CAMS8qEWUBDy684UU1eLYcB5QFZtRcJEweG_9VO+9LxSKCF29iQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller
To:     "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, p.zabel@pengutronix.de,
        Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just adding my few cents, working fine on Asus Zenfone 2 Z00T, MSM8939.

Tested-by: Konrad Dybcio <konradybcio@gmail.com>
