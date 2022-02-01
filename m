Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559044A5690
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbiBAFXD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbiBAFU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:59 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1F8C0613DC
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:51 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so15127994otr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dAgRdlbtzfDJA3fxDZWwcXLHlGsqMKwkA2c7On9l7mY=;
        b=EegnhEj9MYuo4VjqxEZMT4nrpVI8IQpnJd2TdoGSACTswGSco3YdYly9NgkXffOvaC
         QOx0z4TmADBEDlzMD4ytBLRKU+RzILggcxQ+Kd6rjarmCy6QnJdkMgaS6f8nh/qB0I/a
         gF4VS6QFDY3+wq7asipqFZ0ekGWCap3xd4TpMTEspnqM45rjFX8uGIxAI5iN9r7AtSNA
         FhTwyjPER9+1w1ijtv5Sh/09S3TZzSFlLPhzx30qBoIKQL0bJYf2QKTtqO4JK6C8vpRK
         4ETGeiLOhdV2+ITaRwPh3vH4ZBb73HzU4BcDxzWlppdRNJolwKvtIbHe1RGR2sYkBoH8
         B5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dAgRdlbtzfDJA3fxDZWwcXLHlGsqMKwkA2c7On9l7mY=;
        b=3seBjp13W/B+ExQ7y1YK6XlpPYFU03EtEWqCwjHd7fGdGRxvsnr2xkuS8HdCP/yBOe
         3385zDPA3/ynWReIUFk9+W6is309iIrbLQ3gQNASRCVM2fKkeb2e0GVcBmbJMLCTUOGD
         Tqm7PvA30KRs75p5hzoLK/fu8lxs1eamKmZvZt0F7pdfUfRsTNW/GPEX0qwobcqx7scT
         hdarmEYfQMx2Mh2M3xG0ZJAoFxJXTm22fdNoLVDGY//NFztujaRdV7X8DGELdLmwt9ge
         0gj+Cs/OOpRIxCJbNxcdcHIrpd7T17o2kvr1TGQPuLgnC0vXV9A3HcXzSDch1qxYNEtI
         iR8w==
X-Gm-Message-State: AOAM530iQlxbuegF+oRDO6yygi8iYfiFRs7SO4F9kGoBKNDiEVAy8iAM
        LgEDK6P/PfLyxBPVuALkuPfU0g==
X-Google-Smtp-Source: ABdhPJw6kXuZp3tSgSWyM4P90f/w4AkE856R/zJMf+1nAa0zqoHaYjyHf2ujG9/TtZA/XxPgKq7tsw==
X-Received: by 2002:a9d:7097:: with SMTP id l23mr13773313otj.190.1643692850692;
        Mon, 31 Jan 2022 21:20:50 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:50 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>,
        Mauro Carvalho <mchehab@kernel.org>,
        devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
        agross@kernel.org, Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/2] Remove clock-lanes DT property from device trees
Date:   Mon, 31 Jan 2022 23:20:00 -0600
Message-Id: <164369277342.3095904.5682243255804634032.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206154003.39892-1-robert.foss@linaro.org>
References: <20211206154003.39892-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Dec 2021 16:40:01 +0100, Robert Foss wrote:
> This series depends on the below series being merged.
> https://lore.kernel.org/all/20211206151811.39271-1-robert.foss@linaro.org/
> 
> Changes since v3:
>  - Bjorn: Added RBs for both patches
>  - Split series into two series for the ARM64 & Media trees
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: apq8016-sbc: Remove clock-lanes property from &camss node
      commit: 015bbdd314110ad20d440bec4d8483f73f4a8b58
[2/2] arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property from &camss node
      commit: 6bf3c1895f5848977ab3912eb76fd996bc4d2768

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
