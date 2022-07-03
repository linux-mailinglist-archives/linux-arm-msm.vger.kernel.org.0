Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102635643DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiGCD5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbiGCD5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:14 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FDBB1E7
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:12 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10bda9c4b58so2626715fac.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
        b=lQv1BdJni9Px/WEEhsnaFpO5GuaonU55zc14yKU+LSh+octtrDzM1XiRp1pREg7zpd
         fZUNGjJu2ArjO1UeuXLMvUC+N3x2fFvS3oYa0UWpXv/tHHWIhxlGaXIh4jgYquQ5VQ18
         0ysDWH5JXOzKCi6yu80CtbJvfD0YTmgnVcqePfeqDhQkASxogm9fPiPkHDLU/AQ9KIEE
         441A+lz8K+Mku+YxDfWHY1cUqU+75PQmD8SpR2+OqYu1Vq+R1WmyS1EHsicjWoRMj4p8
         bch0TbdRy/txwR2iIPoQJID/3ifmU9sePRuGGuEEufMJ9qm29K+r1/dUtM44T88Jwp1Z
         dtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
        b=26Qyfpaflo7i0453BLQzhs8Xhxy2x4SmtCeMvqOHgaXhFaLJecZ3SlFP0FIr2RwccJ
         ReFt/jJByENWMztZD7S3w/Hamh3c1eeQCe0zzdqht4OY1IDEbe3pjTO3NqicRBO+mIe+
         M91XRo0clksck1taNM4jnD8A62/tzEJFXIbdvSK/3EE79/pBA6gdYoyRNa6wn4Abdvsn
         +AM39IWI1bHfMMFYnfYuaVBUDZONy7q3qiH7aQiRwH7dx+S+E9+1bvsHTvupMCjiQ+/9
         933TqYcXWvMGhj42W2Qo9XuM3pgnNNGR5YzLSeWiMylhz03S6XMAUHkpnGZG52KI32yN
         RF6Q==
X-Gm-Message-State: AJIora+ZMm/+FTG7muSkrokAn17rGVM6j1l807hQXImvCFPWMYNGEuw3
        8EdBIelaYRC3CVfN+OqyYV9FBQ==
X-Google-Smtp-Source: AGRyM1sKOIgfdKvYKJgJH7p7gU/hFoji4Z+mz/VwOJMgNWtzLtip0KO3QlhQZJkrJbW4hY+m0QEDEA==
X-Received: by 2002:a05:6870:6a8a:b0:106:a8fe:c621 with SMTP id mv10-20020a0568706a8a00b00106a8fec621mr14301860oab.163.1656820631293;
        Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH v3 14/14] arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
Date:   Sat,  2 Jul 2022 22:56:07 -0500
Message-Id: <165682055971.445910.4131004773759034075.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org> <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Jun 2022 15:23:50 +0300, Dmitry Baryshkov wrote:
> The HDMI driver doesn't use the phy-names to identify the PHY. Different
> Qualcomm platforms have used different names for the PHY. So, we are
> deprecating phy-names propertty of the HDMI device and dropping them
> from existing DTs.
> 
> 

Applied, thanks!

[14/14] arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
        commit: 917a6de1b0a0d55c67533c5d3827ddd4388b14a5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
