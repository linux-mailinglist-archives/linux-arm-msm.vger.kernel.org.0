Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963734A4E11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355100AbiAaSYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348956AbiAaSYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:40 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9ACC06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:40 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id v67so28308284oie.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
        b=JDl52j304GonUugjmEz7Oj8bVrx7wZrIhVuZL8MQTQFuL/8MFLOWZcd/OaTmOicGVM
         824qZZU1lzNgpSPyKP8OVtZyrtC6NXu4WzFAm4zX/p4zjsWKbGKCmlzQZZmt5THva4bj
         Siy/ZQyep4uJp7mMKwtyshkyo761rcOBDf0JYn3bGDmLmlllLNpAFdUlJN6bzrcRzsAu
         OcLwjwA7iY8UYptOVr/wqI+Z8ixONiaFXDa4jkPOnn1KTdy8JG8bZ8Qea4rIVO6oPCIl
         MUNHoHOW+cjY2YzosAlC/gpuT2/ut7qLxpQIQWg5UeEG9jRiuQuKwV8ZdHYQmsBPx5gu
         Y9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
        b=ovxf0z241Q5mmql9h1A5EajrEpHYKQndcSTYGI3U1OeKopqndtA5Dpl7sOPoIdQVlN
         IW2lWr2av2ghAWajIQIy3zdy8JH3WsRWSV0J2gX+s9bF60e1Wl4k8TXDB/H1Vyr7Oe6Q
         kkvd0i1R2OYQQqcyztdBNVYGG51OJp8Am+ytoFAgCb2psRKANr5ySjpXib2OsKlHy5iY
         ypXtK+j5PqsVSHAYXC4mYtt209c0+XuuKwq5BCb0xrNUOcLGPjnPjpYd8+Z29TAunbxu
         azMfzo0fXFt/dRGqf6ztgMtwh8eGoZuLh0JPCV4llmvguo+V1sNLo5L91yydzOvmfc4E
         0OAA==
X-Gm-Message-State: AOAM533jNj/1Hi8KeXdAwdNeUnEBiCxT1KHK9LlieAJ7uRwPd1EXCXeQ
        B/tPcZ7iAzegWxLGkm2FxrOW5g==
X-Google-Smtp-Source: ABdhPJzRbaJTu1CP/oi40yx3UKog6K9CaXVPNvF0Yk99zoOH4j6nXYBHdOpoDVHpkUDPo4bBKQ8nsA==
X-Received: by 2002:a05:6808:bca:: with SMTP id o10mr9686870oik.58.1643653479922;
        Mon, 31 Jan 2022 10:24:39 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, quic_khsieh@quicinc.com,
        quic_abhinavk@quicinc.com, quic_kalyant@quicinc.com,
        quic_mkrishn@quicinc.com, swboyd@chromium.org,
        seanpaul@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v5 0/4] arm: dts: qcom: sc7280: Add display DT nodes for sc7280
Date:   Mon, 31 Jan 2022 12:24:27 -0600
Message-Id: <164365345128.3009281.17096332459054539007.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Dec 2021 21:33:09 +0530, Sankeerth Billakanti wrote:
> Add display devicetree support for sc7280 platform.
> 
> Krishna Manikandan (1):
>   arm64: dts: qcom: sc7280: add display dt nodes
> 
> Kuogee Hsieh (1):
>   arm64: dts: qcom: sc7280: Add Display Port node
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f
[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
