Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A32850A274
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377082AbiDUOab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389281AbiDUOaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:22 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6753F328
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:29 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id e189so5757506oia.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0w23URXeycXFwHQWgdXQr4pbeMphaV2jmFrrqqfSE3s=;
        b=Kebsc3zy2R6yFz94yzcf5L02awCw06FtzoKktwaU4iZ/+LNtOXn4l4wjwnFA8Xih3N
         VPPlS4BHiIxYilcUMU2sRgVAvEJxkOxD1J8/HnmpZ8Dh/hNWGzH1/Kd2Jgm4Bx5ugpM7
         3BVW5CbZ9hV+f9TvQuGyzrFZZU9DimKCStk4OmEOdq1MzjP0Sw7WKH1fTQe0BZXj/NZD
         t7O4lcWpctPZEB+jxdXNPnwMpmAJoKSOMFXWFss8V9bg7/RXtzsAdaEAR/MLDEL6RGZ4
         6zKGlSwaAFZ5kUBI1dHspvlo3sqi37zqx2jNTTZfqMmED0PR8UnWCBcpEq3H4b9ykIB5
         aLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0w23URXeycXFwHQWgdXQr4pbeMphaV2jmFrrqqfSE3s=;
        b=AbmJrhzM+cn+Zeb1M1ofFo+UGjsd0j8oMF4zOfLb0BF38E1pPp7O9ogSfV4aaa15T/
         9WjFXMDx38SZxT6SssQTsReFFa+M2g40PzbV97QLtOKWDQ3RQcQ2IbTxcQSyiw9BAFWZ
         32A3kw5X2ueuUNdYn+qkTVDX4oCimTmvW4E39c4kx+A/aYrBFcxi+ULBT/n6gIRlz/cL
         pvvVhuT8/wIW0BtuU6CNX/jxEXeg2FL+0P3d8OeaYQLa6/hxSGhMmT5RcEQUByV8gpc3
         /dCehDr2q/3yNwD+6gmbuE0xwKt4h4hZn0dyPArfrX5sRtr/UHuIXLmw/mIa+YrYZH11
         rlWw==
X-Gm-Message-State: AOAM531t9L3qv/kIiHORPXeDH+X0zxt34NTQLnHxxpUagj8C04FRXbTD
        FwSBImSxBPlmfic0ZRnqktK0UQ==
X-Google-Smtp-Source: ABdhPJxCL7XWF6jtZFt9pOGaDmdX7DhZt/kmdmrCbgrDyE4fGGQ4vEqB3z2nqbkDX62yOn6G/+njBg==
X-Received: by 2002:aca:bed6:0:b0:322:bd33:7efc with SMTP id o205-20020acabed6000000b00322bd337efcmr4424116oif.95.1650551248383;
        Thu, 21 Apr 2022 07:27:28 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd
Date:   Thu, 21 Apr 2022 09:27:04 -0500
Message-Id: <165055095991.2574292.1674742785100690480.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415172238.1.I671bdf40fdfce7a35f6349fca0dc56145d4210ee@changeid>
References: <20220415172238.1.I671bdf40fdfce7a35f6349fca0dc56145d4210ee@changeid>
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

On Fri, 15 Apr 2022 17:22:41 -0700, Matthias Kaehlcke wrote:
> Enable the two SAR sensors of the CRD based on herobrine.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd
      commit: 5d04419045e7ad28155e2f7403599b2fdbd1548f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
