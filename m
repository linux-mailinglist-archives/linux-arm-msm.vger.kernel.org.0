Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AD152F1A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 19:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244014AbiETR15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 13:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbiETR14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 13:27:56 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864E717CE43
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 10:27:55 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r71so8325965pgr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eIM1HdMIym/tfM1e3BFituEEkL9gJaLLK7OzFTcJTA4=;
        b=XkKfGcuzRDKMqh54Y+kww3omZXwBRjJcTjn7vbihRG3zBkjQOZ8/EQmVuyr28kSsHv
         ZMj8UDHoF2NQi8mqGNIGvyrEiY4WB2mrifWA0HWSt/IlVlsi+JgoLmRE9+FWglvclKuY
         HfHcun63PhTnLaV/cOX5LE+wmPuQZJKOvdISk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eIM1HdMIym/tfM1e3BFituEEkL9gJaLLK7OzFTcJTA4=;
        b=P9fLqH40Y2iE1shGHHDo6EmUap+rhH2t0qK508npi0bEhMWGgwjS/f0He04WjLBK7p
         GGZWln52cjOvrlJacXpILOiTglXhdiiSlUFrncxpEHO838PP7QVeKTJx+O5XP1w4bN32
         v2R5+JE6mCBkbfV+pJRYHdcVa1oSRx6/HfvmyzdYpFzloLbR3TZUralct3C7KtoNZqsg
         M/tn5W8fJw32miJ7k/ChkWbtM/wttHRA/tFT9g8kZr2NcgcZYoQ8obGrCBiGXPVcudc2
         Gh3tE930B1AIlTZduvnMtUzCDA30QKL6Q5/gkZ3I+c5u0klbSWQzhQtV2pwEDUWL2muw
         L56g==
X-Gm-Message-State: AOAM533A/v8to/fsWA/X/KAqorm9aJxObwj0mBCQSZFOH6/8e5XAJ9um
        KPBZ6g7PA7zQW8BgzSiR2fPRpw==
X-Google-Smtp-Source: ABdhPJw9BRVJIjFyI4cGbNFd8lKlV9t4on+fnb4eGMokHuQ26Vlyf0akHhXVo2qy5r/Mc/nwv6DPzA==
X-Received: by 2002:a05:6a00:18a6:b0:518:54e7:aeb3 with SMTP id x38-20020a056a0018a600b0051854e7aeb3mr5471821pfh.49.1653067675092;
        Fri, 20 May 2022 10:27:55 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id g20-20020a633754000000b003f27f91135asm1999pgn.76.2022.05.20.10.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 10:27:54 -0700 (PDT)
Date:   Fri, 20 May 2022 10:27:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf
 settings for mi2s1
Message-ID: <YofPmWtqy+xTLnND@google.com>
References: <20220520161004.1141554-1-judyhsiao@chromium.org>
 <20220520161004.1141554-2-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220520161004.1141554-2-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 20, 2022 at 04:10:02PM +0000, Judy Hsiao wrote:
> 1. Add drive strength property for mi2s1 on sc7280 based platforms.
> 2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
