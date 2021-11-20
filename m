Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D92458111
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237766AbhKTX64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237686AbhKTX6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:52 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73599C061748
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:48 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so22723284otk.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4UABa8cQHuNV3BAHClltIWLONf9pc7Ehwb7QZu/ZE9A=;
        b=dmp/YINVTWBWBDfejU2v8Zki8OgZw8zQDc0W/cEEtXZvQ2iNdSf3KRiGdHmh76wUZ+
         gdXO2oopHQHh/bRpDl/abXZLkjd0HBidVqjQxpnjHbCS2cpdV2Yzhx4eYh0p5rEvqaQ5
         uhWwlFwQxg0SKvjTCn27+K973JewRo0NEZtLSkajx7NB4U/9N03LI5mIbpNnzq+2J9Es
         l53Mo3ux9mFOXoMajdZuCHUt58gmJyLYBhHGdZbxMgWXI/v26PL7drO56FFwFgxyce+1
         JoHzPVGQZ4hK5IM/x3GL0JL1VkOHwljMf2v0yWkqkBreaTBT5m4FIfMrJ/4DS0jjl6ao
         QhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UABa8cQHuNV3BAHClltIWLONf9pc7Ehwb7QZu/ZE9A=;
        b=w0jGhqJ+Qno5XEzn187Q0xEP+70vjfrzYpnbGpxqiDZNzh0Ptcb/kpmf7HkFtCILzt
         e6kVCQZKh4OsyWJoR3Ce4cOCnS3TQef8Lq9ntIBzNokXWonBgixQBcUvAK5njkJot1a+
         pobIApKjovXUt/P0SGOe6qbeJNHQW0JV8pQVgj96BCmU7N8gXuhsYA9Sb9knmx/Upcyi
         96az+gAzJl4DhSRXTG+YhPQ34HHl/nV0wVuC0a83i8oK/8Z8xBiID1ONLkf13CWk0VMX
         zQN7THq2LsBDwY8qhFpGO19Eb+NoA5t2Nqc8hbCQ3w187ReMWveVcQHHsf+Dy1oso91z
         ngQw==
X-Gm-Message-State: AOAM5329jCgVUJq0y+wBlEb78XKUkd4ef+9jdwQkwbI+Fgbi4n8Di+EA
        4XJdgQtAm+yPX1qKru56leOUxA==
X-Google-Smtp-Source: ABdhPJw0HOJiw8gXM70jkqCqb1tR4JODQ4d4MtZ8HAPz9EPvItyqunhmieUl4I/7nKgTdcUUeoABrg==
X-Received: by 2002:a9d:7e84:: with SMTP id m4mr14241826otp.102.1637452547839;
        Sat, 20 Nov 2021 15:55:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, martin.botka@somainline.org,
        Kees Cook <keescook@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, jamipkettunen@somainline.org,
        Tony Luck <tony.luck@intel.com>,
        angelogioacchino.delregno@somainline.org,
        Colin Cross <ccross@android.com>,
        marijn.suijten@somainline.org, Anton Vorontsov <anton@enomsg.org>
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)
Date:   Sat, 20 Nov 2021 17:55:24 -0600
Message-Id: <163745250541.1078332.12810364311770443265.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211111184630.605035-1-konrad.dybcio@somainline.org>
References: <20211111184630.605035-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Nov 2021 19:46:28 +0100, Konrad Dybcio wrote:
> Add support for SONY Xperia XZ2, XZ2 Compact and XZ3 smartphones, all based on
> the Qualcomm SDM845 chipset. There also exists a fourth Tama device, the XZ2
> Premium (Aurora) with a 4K display, but it's relatively rare.
> 
> The devices are affected by a scary UFS behaviour where sending a certain UFS
> command (which is worked around on downstream) renders the device unbootable,
> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are strictly
> disabled for now.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)
      commit: 30a7f99befc655cb3eacdd3a0f2394a5209a492f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
