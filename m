Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA5241A362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 00:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbhI0W57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 18:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbhI0W57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 18:57:59 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7471C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:20 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so26619630otj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c8jgVmQNcFDWtF6veEP52V7GWP5AdrcQkm6o+zqx+QM=;
        b=iCcPOuB0wdBLeVfK03OQ+I2/QBZKT1Ekr6KqJTGnv3Y90/ysCa0c7t9CYCUczUwtq6
         CVk7jFBOCRosDTmCai+Tp3xaqMw//4ZzKXyW9KgyYk1BqTqSiqLrIIVI+kq8esQ+GEJj
         geBaL48TkRwrLztWSV5M4NqkamvaLJmNW37ZUw0mFcg5BGbC+Z7xAB6XNq3fUlsZlhGY
         /xsWbUNRnzfaRBIVVsyyVBHa/EJYIrZOOB/XkXalNOgSYISDMEeQvn1IWaTKvTMbxcrE
         1uHPQFbf8p7CwavOLGgwgdIPJVB2unSISDKmBmf8OdLzA8X+4uDLrNfBUXnJ/SIWDUTS
         4hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c8jgVmQNcFDWtF6veEP52V7GWP5AdrcQkm6o+zqx+QM=;
        b=KsFU+j6wcQp5V09okLlbePLI8pqVmCv/NWQ2YX4lla5zb/DV6uurDDhbctXkF6NIZe
         cZAx5DGsuPhYZ5F5oJ3XT02l9EIN1n1Ub2DS27sYODx19oECW7slZXHHmgP9WtDvPPLR
         vEkZYlJzQkct4N0lVGARwsjsslaBrocvmJ/UHPVtWPqrG4gjGdOTWSSZ+nR02lu3T+R6
         iUmCWHgReYbi90SEM2TIvGpPQcVUKQtlUVoW8hoxXDPOKghd3xfxniXvgF/1NHXJJofF
         d/f2NLpVnAUuNJMu1bShDisp7ZK9A4OSifD7ISJYd/a9HNwiojuEXYmT5OtSwZneIyJI
         P4Eg==
X-Gm-Message-State: AOAM531z/galTNaGlWhKFvGNJs3bkRUtAFFIWsiXPa/Nht2rCdfR5OX1
        lM+g2bhsA75Heqw0dctJI2lTRg==
X-Google-Smtp-Source: ABdhPJy2USL2Zay74EzMCoQ6e0ManJiErKIbs6F5qYoQqId+2KJ4HbuUrJyJdcNMQMpuBTYFHlw5rQ==
X-Received: by 2002:a05:6830:1d71:: with SMTP id l17mr2303452oti.10.1632783380023;
        Mon, 27 Sep 2021 15:56:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w184sm4231084oie.35.2021.09.27.15.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 15:56:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, paul.bouchara@somainline.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Add support for MSM8998 F(x)tec Pro1 QX1000
Date:   Mon, 27 Sep 2021 17:56:13 -0500
Message-Id: <163278329751.1522839.14517246670065767128.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
References: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Sep 2021 14:38:20 +0200, AngeloGioacchino Del Regno wrote:
> Add device tree support for the F(x)tec Pro 1 (QX1000) smartphone;
> this is a minimal configuration to boot to serial console.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: Add support for MSM8998 F(x)tec Pro1 QX1000
      commit: 122d2c5f31b6e668a9c01bd023949b0f39954c76
[2/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add physical keyboard leds
      commit: 946c9a2cf8b02a21275e83f0d75826856c223eae
[3/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add Goodix GT9286 touchscreen
      commit: f66ea51f0e477b8a8ceff3a6257df163c54af478
[4/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add tlmm keyboard keys
      commit: cea83511353d896be613a69ccee1c464e68686f6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
