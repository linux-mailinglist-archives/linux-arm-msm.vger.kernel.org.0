Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF766710A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjARCGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbjARCGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:39 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0444E53D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:37 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt14so20933739ejc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOhzWcuJTV5IFxzT83GfyYBuQFtDL43V4pgyOp1rbt8=;
        b=BZJK9KYCD5pDLNx+WgkyVn+9Aice3BiaQUQN1pTMQjOe0S/UgnMYDMsd6auuyRRE8S
         H+Oo++QA68kwSRtjanvLC1c8pSUYlq5R6nDKMIdLhvKk/tsnye6h8asfpRBQ80BiMLNB
         YsjKRFT9YPM8996chk28sJipFpOnIcbSvk6zQKaIFdxFWWeJu/BUh52E7tvk52LBvbL6
         +DodcHcfFrO6Pds1bm4BukCz+ONuBuzOflwOu0HskpfOPSXcM6wZTjI2q8R85LiX1XbN
         AhwoqmzPpILLsGRqMFqWJVGBC2acu4PLhtRgVHCcZC9klniZSagH7uK1RwlOJnTCYJAQ
         V0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOhzWcuJTV5IFxzT83GfyYBuQFtDL43V4pgyOp1rbt8=;
        b=AbFQfiJfIxWVCR1blNSG5gM4lMJDuaIi9zMR+3gN4dljBp2SlYC4XKlb5m2tK+rZFy
         a+6HbgAfmE1Txkla9wUhD1mrBoWHQWWmbnCmfPZCsK5DFC4cAJBLponcCGhS3E4NALhR
         VzPjVfvdi3lvoA9vTtKy2lZYy+Hk2sfjdPK1JGca9C/qPN+nPCFhEu3KTd8wX6e1BfTv
         qzh3pW9pMuWZuF/fHJKlME+Y1vgiRNN1klIiW5ZbimTmEMB07vshdlX4dDXBgOMACG6v
         GQXWelRr1DPg3H43ERpbLIATFvVA4Ui5fqdlJywHBWQeM+wA8ZP8PSIBOLSap5nBscoS
         0w1A==
X-Gm-Message-State: AFqh2kqx1QeaCV2ywECXqUbZxgQxvwrQ4BDItSq8F/8F3d7+dtT/Mslg
        mAfZKS+oonxUmyB+oZT5kPGNONvwm9zUoFTo
X-Google-Smtp-Source: AMrXdXth30o8N6JigOeU9QfoMuA2uNMELa4iXuVsuYWhFwvd5DrSr8U0u5P3kBlF3wcOxEFzST5SJw==
X-Received: by 2002:a17:907:d606:b0:86f:b541:cd02 with SMTP id wd6-20020a170907d60600b0086fb541cd02mr5993456ejc.28.1674007595443;
        Tue, 17 Jan 2023 18:06:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
Date:   Wed, 18 Jan 2023 04:06:16 +0200
Message-Id: <167400670533.1683873.6641648531354230560.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116114059.346327-1-konrad.dybcio@linaro.org>
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 16 Jan 2023 12:40:58 +0100, Konrad Dybcio wrote:
> SM6375 has a single 7nm DSI PHY. Document it.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f8e6d45c8152
[2/2] drm/msm/dsi: Add phy configuration for SM6375
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88f46d2ccdf0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
