Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128115BE4A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 13:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiITLkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 07:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiITLkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 07:40:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19DD6B174
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 04:40:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id rt12so258385pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0lnlyjG9F2tldy9kaULLQnBUx9Q4MWzH14af6yb3ESA=;
        b=r5DQwNXbYFUO5IGE+VU44m+ULFynmVB/hv/PQAz9SWPpZov933+sutBPOa3sQBewqz
         4zcBFNAFLXdRD3EH8v1hjiJwPScTU3TLj1D3kS18faAv14r+16vfhxMokJf6nNboiqzD
         ZCDDK71+VdlzjIfXYZxZsbrN7ClgZiwyUSz6QNx8pRWzKULtKbOcwLg6HtJ/WfleSBN1
         MDOWp/WPq34T7URZqmb1HVDf+HToNBlpzyA77O34gG+qBsJscYk+Cb427jn2pp3f23/p
         DEofB8VxtCWTzQwYNBzTrAnKJH30htGOp3fo/kBjSSUZSLaH2jaFnapYkLVpEFQ0Xn7U
         dvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0lnlyjG9F2tldy9kaULLQnBUx9Q4MWzH14af6yb3ESA=;
        b=shaTn4L/5+A7/Ty33GebBKjtqOz6pPsqOp/tWFN6qbUGowMuHDJOgqCJYQB806bBBX
         UWaiYXkqePcLHHsKf3TPBCl58N2f/c6Q78rfMag5dFBwnLKY12GuaeLiGvWEn293gaKz
         imPhWwABZIJrUngIrXC7Ve30CGGpRpfJwehKIPjHWpVxxBiGD1DpMlHjGzC0IhDPhWjS
         rEaMqAQXviuz69dPSSfGJGXUT0zmBFFbP+cn1ykn+WXfphv9WaO9aRThCUQ0tQxGU6Wi
         gUAi7/mrjfn5jNv2VVFN0gLWhV3/qorRRWW/HZVSFYPjgd9eW1/KMRQMcptIlZqITGWY
         2L4A==
X-Gm-Message-State: ACrzQf31RmmEB64EWdbKQL5dHv1q06jqUTILz/HCKnZzg4AT0vdC6can
        WPNXmnaj709YTuh+yZn1xs7fGg==
X-Google-Smtp-Source: AMsMyM5MGkMU3EnSjEHGtL+qbiCmHr1BVo9Vst+MoGVh/3fqN3HoT88v1m++RqzbPZdMT8hCnORLTw==
X-Received: by 2002:a17:902:ef82:b0:178:72bc:983b with SMTP id iz2-20020a170902ef8200b0017872bc983bmr4477829plb.0.1663674044480;
        Tue, 20 Sep 2022 04:40:44 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b00174fa8cbf31sm1192425plh.303.2022.09.20.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 04:40:42 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     dianders@chromium.org
Cc:     agross@kernel.org, andersson@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_sibis@quicinc.com, robh+dt@kernel.org,
        sheng-liang.pan@quanta.corp-partner.google.com, swboyd@chromium.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: All current evoker boards are LTE
Date:   Tue, 20 Sep 2022 19:40:20 +0800
Message-Id: <20220920114020.2185607-1-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919165808.1.Idfb956ebc035c3bd0d682f4697c297c7a975c50d@changeid>
References: <20220919165808.1.Idfb956ebc035c3bd0d682f4697c297c7a975c50d@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> At the time that commit 2abf6b6b9429 ("arm64: dts: qcom: sc7280: Add
> device tree for herobrine evoker") was posted, all herobrine SKUs were
> LTE.
>
> At the time that commit d42fae738f3a ("arm64: dts: qcom: Add LTE SKUs
> for sc7280-villager family"), the evoker board device tree hadn't yet
> landed.
>
> I belive that the above two facts mean that the evoker boards ought to
> be setup for LTE but currently aren't. Let's fix that.
Evoker should also have wifi/lte SKU, 
I think we need to follow villager to create evoker.dtsi then separate wifi/lte dts.
