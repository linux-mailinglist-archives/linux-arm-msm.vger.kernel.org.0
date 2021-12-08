Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6850546DCE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 21:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhLHUYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 15:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240171AbhLHUYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 15:24:18 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA923C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 12:20:45 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t23so5678645oiw.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 12:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xRzOrKrRfEcjYkae/crpn8Pd/4qrYyfRbZCk/y9v/EM=;
        b=XJHIubbIJrPZhCujoGN+8lCTrAs2ILx0sGj3CN9N0Fes2gxWugm4IFuVMAVIEIqS4Q
         O9KPtnLZsZqPy+RnSztngbKrwU8Gi2ICsO+Y7Gx2sIOuYDeYr7KLYjY8Ejpp36Ay1qxo
         xm+siamXuJVFgroJ7jvmT31L+aS6Ebzddfnbp2Q/CBVKLRLlk035lDo0M1sJ0zB0ZMgN
         Q//1loPaVH/Hn3X1XAiAyNMu1IHIMyN1KX5MPzQgaV8odd7c48xezHfewhDRVKvZCzBr
         5+9VW8gGLbZArzntVOiWL38Co4L9QZy/GZd9Tv3vSpfBfAeTlfPwK7W4m7l7syOUO1/B
         fQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xRzOrKrRfEcjYkae/crpn8Pd/4qrYyfRbZCk/y9v/EM=;
        b=KOHpWSkfUneLnIin5V2iBnxL8Dxg8j26QDeTyDIqd02aRi8TR2I9DePHhJ3CzR64e2
         nUudtSR1zM95rrdDNvjaATd6KPcXWYNdUawhmDC6cpCtGiZnUK2pw+bbVawEsJfoTEZ/
         PoBfKzicX2XnFrAV+1QTsbPOdYRoEBLcIXqOKX6/BiKJuH19cUYVvkKuFR1ZLUPxWcKc
         x5pukZP3RuGll86o1dmbKy9wV1UK7qcJkRqt8iZ8dd61dohAhUaWlLtW8Qkl6PrNRQ0r
         5GiME/tJhh3bwYpdjd4SspB/XYJK2rEQKNNZ1+h+qk/47wOKZP+0cFaw2kcflhioHWuB
         oTPg==
X-Gm-Message-State: AOAM530bRH5ljeOUT/zsYSgIDjOX1V/ALfq+HnmwArxJQAzf73+iEQZ+
        fup5pppDCs6khOg0sJn8/4YfjwQUHrWCXw==
X-Google-Smtp-Source: ABdhPJwxYFVEgbApGBhd4DL+z2dalGuMIz7nnjhl5dkFNXsbfE2dA5XCYI7CRv0yF8vljRvSKaVvug==
X-Received: by 2002:a05:6808:2081:: with SMTP id s1mr1644314oiw.170.1638994843624;
        Wed, 08 Dec 2021 12:20:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 109sm622525otv.30.2021.12.08.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:20:43 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] soc: qcom: Add support for SM8450
Date:   Wed,  8 Dec 2021 14:20:39 -0600
Message-Id: <163899482765.2475437.12269054296642991582.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201072745.3969077-1-vkoul@kernel.org>
References: <20211201072745.3969077-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Dec 2021 12:57:38 +0530, Vinod Koul wrote:
> This series adds CPU, SoC and board compatible followed by rpmpd support
> for SM8450 and socinfo ID and update the smem processor count
> 
> Dmitry Baryshkov (4):
>   soc: qcom: smem: Update max processor count
>   dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
>   soc: qcom: rpmhpd: Add SM8450 power domains
>   soc: qcom: socinfo: add SM8450 ID
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: cpus: Add kryo780 compatible
      commit: f5ef92aa8b78dbe7e65c0eb27a176961f41d70ea
[2/7] dt-bindings: firmware: scm: Add SM8450 compatible
      commit: ff0ce949551fce08feb2ad9a6f59b785b59bad4e
[3/7] dt-bindings: arm: qcom: Document SM8450 SoC and boards
      commit: c1b360d254575a71ee683ad8f78e929a9450adda
[4/7] soc: qcom: smem: Update max processor count
      commit: 1f88aa7779247dd03c6396efd3d8d2c80964c1ac
[5/7] dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
      commit: 3fe1b82d947fa07fd40c76b099568c9b74300fab
[6/7] soc: qcom: rpmhpd: Add SM8450 power domains
      commit: 4f84580dbd71836131f1ef23c00835fcb1fd74dc
[7/7] soc: qcom: socinfo: add SM8450 ID
      commit: 34f92297694823b2a9f4f9a1d9f4f4ee265494f9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
