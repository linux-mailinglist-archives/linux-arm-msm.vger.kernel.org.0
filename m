Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690C550A26B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388988AbiDUOa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389315AbiDUOaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:21 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6E63EF1B
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:28 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 12so5753625oix.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=09r0zv3Eg6SiUBI7fQYP/qp7WkBDV+XQ5KMKFkihQXg=;
        b=V9a1EG2HzIuNnqZBorgDu6lrJ0RkxaJEFc+oe+kuDIXDhkZdhRYDO1VxjiCv7rnnX2
         ezV6GdQW4xCyRihclJwrDTWaMJxtSpxy7nPk2n1p/e+LvClsWGKTKuZ47VbrX21NZ/so
         NtVsPP+4ALpy3VBb6Ps497/mqKzCV4smvXCv4wnOp38hKkJ4L05RpatADvd3vvObtTFQ
         CZo4oDrITw9FMVsHaMLLLo8Kl5ke6Xqf9SBLxEu/5OaOyL6zK9qvV0a7bTVKtoJvtkp3
         etYgMxdfYDLPr33PKjmscdb0QK0+zzZdPZzTi9JIDBd03liFBWTh12fM7KzJ/oIX0CNR
         Zxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09r0zv3Eg6SiUBI7fQYP/qp7WkBDV+XQ5KMKFkihQXg=;
        b=PLmkr77vXiEpcs8dRDJXZlMOkktvjhgm6ESbMlEqAx1A1H3WoZcxaYwf7jEoITmpgp
         hGb/1p4GDZLTBHmj2LyCX2jEtMmfEGoj2/Zi0aWxTnrK3M0oMCd3CszJm8On5vcOb4Cf
         1BnxZ1jx9l8NBvUM73iSGIVHe+PXXf2Sxo/l/DjxbtTOF1EJuy2p0Q0fjKiGOfOIt6HC
         8XRhzKpMiNkfBhoKp5IolqZaGb5sfrNrywC2bdPx8k3GGUVm83EoVXCE8Q1nhmmajSl7
         mRpl3JYuKV5/AWu0039aWL2JIvnU/pqZsRWPceR1VT1Zb+04QY5uyfU4Zu1NWgPNfGhJ
         hBzg==
X-Gm-Message-State: AOAM531A+JEHksdaAt3xDHiJUkz+nCdC8zr5JjWggTlMYO5umiXwYs9H
        SWyB2GHwhQEO0phwaHAkJtpvIg==
X-Google-Smtp-Source: ABdhPJyfBzIe9i36gp8CFD6yyUeYDAsqL0aLshRuSzretd3B5D5TUTzS0f/hmY7C0nFiEOu7xSaMYA==
X-Received: by 2002:a05:6808:1693:b0:2f7:2aac:b47f with SMTP id bb19-20020a056808169300b002f72aacb47fmr4249184oib.104.1650551247375;
        Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, michael.srba@seznam.cz
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [RESEND v9 0/5] enable use of resources on the SSC bus on (some) qcom SoCs
Date:   Thu, 21 Apr 2022 09:27:03 -0500
Message-Id: <165055095989.2574292.9107007554506586100.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411072156.24451-1-michael.srba@seznam.cz>
References: <20220411072156.24451-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Apr 2022 09:21:51 +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> NOTE: previous versions of this series didn't use a cover letter,
> it's added in this resend in order to not upset the kernel bot.
> 
> This series adds necessary changes for accessing recources in the SSC block
> on msm8998 (though it should be possible to extend this to support other
> SoCs).
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks
      commit: 1ed29355df221407370933522a94dc8a0f47eb35

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
