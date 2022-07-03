Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63555643E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbiGCD5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiGCD5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:15 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392E1B4A0
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:14 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-101b4f9e825so8838656fac.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
        b=sg0Mf81AA/jHMB1Cnn1hgvmo9Je2PEjby6cq8FtWMppDV0dwTUm//kJBHbv8pR4BwB
         j/FtBj4e+TRgW0b8LLpE75Wl/UfDgN709J3WOsfkzkGqFrIy564VLTVlm0+sHgOW5DKX
         MSChhovfWwB/MwOeg3N7teweUFs8YJabN58sYDuRd6ZkoX14s1xq1HxH6K3VyF0Bwjry
         i+veKmfxr+3s/KqsXC6tv8EpMERmtrqerMQkdN72RjBqsfbB4eGnIPTLngTx4y1hItZk
         pcd18M4XQ7uT8kIY6cHEz++jthJoe+kJSmxLt8i7cpOKc53OBfjFf7+CQSb5Ufla3+Re
         QOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pyUyqVKFfsPns6kkRYcl2oPKrKQVySYYiE4xgpYN7k=;
        b=xVdWXpoJwpN4Om7ZuTJczocHPKif0fSZ+jL181ef8vuRhuEft7A6LnSOssDh2BLyij
         6dfsJr1/Jbx9VtYiTCKEIHdb13X5LBtLP3E7Ixiw6uWyOwQEJW7t4QfdoskB6dBIYTso
         6XrHCKGV8cYTsyNU0rr3QkcsWa0tZVda/Qnhyt6Vy7zFEdnT0vn4suG5oh5T0dPWEdfK
         Tx80kG+0yxQl1AZ7WXt89qrAeF89okpUjPiXFZbdLpQPVzrWc3w6x/TMJ499u0/n+qB7
         INjPki5F5D7/HNcz/NJJClJ5wrWhYm6DQHriAqbjeaMjaDMSETFNDxYYLOKvk9EtRdt9
         +xvw==
X-Gm-Message-State: AJIora9l1Uplz4QLlpuMGVuWkAyGB8CMrT2m+vvLLJVXMdOwx8uKxMI7
        ufLbxgMQ4l1EKAKL/8FVcrm1jg==
X-Google-Smtp-Source: AGRyM1uiElpgE5xH020B9DsxznQsQNmrJaanTne9n2tfx5H6+oy7R6pbP02jWzluWtfowxz9M4K1wQ==
X-Received: by 2002:a05:6870:8292:b0:101:c67e:1b4d with SMTP id q18-20020a056870829200b00101c67e1b4dmr14586983oae.88.1656820633300;
        Sat, 02 Jul 2022 20:57:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, freedreno@lists.freedesktop.org
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
Date:   Sat,  2 Jul 2022 22:56:09 -0500
Message-Id: <165682055971.445910.5959383973914812219.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614230136.3726047-2-emma@anholt.net>
References: <20220614230136.3726047-1-emma@anholt.net> <20220614230136.3726047-2-emma@anholt.net>
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

On Tue, 14 Jun 2022 16:01:36 -0700, Emma Anholt wrote:
> This is an SMMU for the adreno gpu, and adding this compatible lets
> the driver use per-fd page tables, which are required for security
> between GPU clients.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
      commit: 213d7368723709cf4567488e63dd667802378202

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
