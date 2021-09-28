Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628C541B315
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241473AbhI1Pkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 11:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241600AbhI1Pkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 11:40:31 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F38FC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:51 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so7425025otu.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/BTvQpPVNKgxMTK/nBY1CVBNCOMqwDcqqaf4Emy82EY=;
        b=SCEz76ZfAMmmqaHk3wkNObEkhwAhWTB6urBlvG5yfyLi3qxHmhBtxH5PzLT1MrILcX
         ZoeMwhKAH0x3kcykKnOqVR+qab7IO9aLcw/Bh7nscDuJJfEoixSl5gwapMx05Zf8e/kQ
         t+js7dck4DEIILfCbZYghAHIo1Xg9qiXfYWLnQzPQItyz6fZn7ULPz0IuidEqw5WIPbo
         JhnIRyj8Cb/Rk7BZ2jkMcKtH2G9qy3zLNx+kfsm87giz0RvBhGP/9e4ALZ3gPqBeqb47
         IWr2xSvuLDZ/EtLcJk2Ez3tRNP2yc6ZDEjffZ5WMc16h0DWWZZpgNmyi5gyoCGFlqSgu
         Q3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BTvQpPVNKgxMTK/nBY1CVBNCOMqwDcqqaf4Emy82EY=;
        b=p80nJSh45RNem5A9k0A4G0YH3PXRFhjbYFSzuCTskKKsWqngbDkb4uYCCkkUnyqEMT
         XSU+x2NSKQ28OTN0wS4b0QrDt5Jdh9ZGxOKM8Xjazh2/4xwykMFNL2OjiEEK/bDlcDAO
         Hb3MOgsQWVhnOcETiRVIsZoz45axZ1QotDw+ctMIeEseLoGq3cY2XNMpjiUFu7As36mw
         vcFCBQIzmUTNuiZ57R0u3cV3/A8oXgZtFXsRMA9NKfuK7Yo7mOwHtUkh2K3QSKCxO0+x
         uKDQbvAFkZ244kVizFkVMVkurEyaPFV3EpiXww6XIQ8ej4F+yMK2tkRQ1GgeX6q84HlV
         aESQ==
X-Gm-Message-State: AOAM533CVFmOAbrv+4iZ8ALJZQuz1Sg38XcYhYmphykgWUF44HfIjC6B
        03jYhe+Hf0MLUKa/QVMmjfhZUQ==
X-Google-Smtp-Source: ABdhPJxsxHQlBRohzzSm76bZT7sTEprhydi/9GB5wvRdlH2i+bDzxpxAfq9c/mPY5TAyxnQ3K/18Hg==
X-Received: by 2002:a9d:711d:: with SMTP id n29mr5752034otj.304.1632843530886;
        Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 18sm4753034otj.10.2021.09.28.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm630-nile: Correct regulator label name
Date:   Tue, 28 Sep 2021 10:38:47 -0500
Message-Id: <163284350355.1592203.13124373993937139741.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926072215.27517-1-shawn.guo@linaro.org>
References: <20210926072215.27517-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sep 2021 15:22:15 +0800, Shawn Guo wrote:
> 29.5V (29p5) is obviously wrong for regulator l4 and l5.  Correct them
> to be 2.95V (2p95).  No functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630-nile: Correct regulator label name
      commit: c22441a7cbd014e2546329af89363b2a43cc8bf2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
