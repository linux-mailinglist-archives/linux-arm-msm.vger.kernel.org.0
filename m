Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DE151AC32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359832AbiEDSG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359650AbiEDSGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:06:11 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FF56D3B0
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:21:30 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id e189so1831716oia.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wGaNEgkga2C3vR38cQjxSl3nf4BfaDAQqYW9Vv/BBTc=;
        b=PEfoXor+JdsqfPlN+A3GqSST7jD5o0bcF7nggWSaH6F54b6L4ub2nPZsEEL0/L8je6
         L4JS9CJXWZsNNZdMhgBhz8n/d1YQjBCcUoikb8NTH6h1ofErB23tOgwNHxn5sNy9bd4g
         ntydlC27R1G0Q0xUUUXK4+0O7HIoYEPFZkFa8VglaiHOo+ojUHG41As2Q925/PPtwt8C
         6iuIXGAuAWlSWr/laNZFzGfJAnj1iKhjkKwrm3tE7kBS4LgCeeJHHUMtWl70k+08eHIy
         qMJvomyu/rTkI/PjGmFUaHuimmIVCIwk6c3fZpoGkteqD/ynqbLr1fDQq2tqvz3Klae9
         nevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wGaNEgkga2C3vR38cQjxSl3nf4BfaDAQqYW9Vv/BBTc=;
        b=mTxP4EsO9btv2Kq1EZKDvvT/9E9pRWqSw2cSThY28vFe6c0mRMQjEbdXX8qdpJPwj8
         rRE8kO2Yy/ylprKvGWQ4uTBQrTZLzDdu/sDht8I4FRQWGvKGc3xxoQ22LNmOfQ4G3qA+
         FrondomChl8eWd2zIGJE2bZzF4HxEtvpBEcRpnO5Nb4FbsZIl38rne14zYfhzzN2797J
         9VBI8SiMRP1NDWQejoYcwXofvZozezZhj1UG2AJhMwa+WZ0weGnB/+vvhd/2/9c3e+2b
         7svbw9dlZMRDFWuWBtc6L9MFOaHYcRbRsfFXcsB0G50Tl7ERJ9BqU5CrzNs0MFJf5xgL
         CFWQ==
X-Gm-Message-State: AOAM532oIkXPt/jsL4NrSiCzsJzG7mRYCofhFVZAYfqjssF2jYFUSb/U
        EDZlXH8+YT0QoehCelcia+3CuA==
X-Google-Smtp-Source: ABdhPJwa6dp2UBzeU6Egf+BrynvyfLaVErlWkcSLlDE67ay70zmXc3sc2mENXNU1OiQ9R77IHyoDJQ==
X-Received: by 2002:a05:6808:1646:b0:2f7:50ea:85f3 with SMTP id az6-20020a056808164600b002f750ea85f3mr242567oib.137.1651684890264;
        Wed, 04 May 2022 10:21:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Alex Elder <elder@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <quic_tdas@quicinc.com>, patches@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: (subset) [PATCH 3/2] arm64: dts: qcom: sc7180: Remove ipa interconnect node
Date:   Wed,  4 May 2022 12:21:14 -0500
Message-Id: <165168485226.3730817.11676742538463355486.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415005828.1980055-1-swboyd@chromium.org>
References: <20220412220033.1273607-1-swboyd@chromium.org> <20220415005828.1980055-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Apr 2022 17:58:26 -0700, Stephen Boyd wrote:
> This device node is unused now that we've removed the driver that
> consumed it in the kernel. Drop the unused node to save some space.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sc7180: Remove ipa interconnect node
      commit: 067bc653b85e466048914c48e46659a50a907fa6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
