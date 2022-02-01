Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856D64A5686
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiBAFVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234219AbiBAFUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:48 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB88C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:45 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id y23so31122216oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gc4d+mJV9MCv7yDWAF73c6XrdPx3pGuNA/L39Cbelk=;
        b=VCTxRN4Dl4Ev68KzOliMDp//TYysmXy6rDK7ijEX+ofZrPY62R+kYV1dwDx+Hwl9Ka
         T2p7cW8n5wMFbwELYwsa+qWFwHaV4INU12dUzT36paFAU0+G5YnLwwHuctEXRSUPNz94
         rHMMViKEI1esVgd2uOIoUcgHh97BvSTc0GEdij8qFHDuQtkgZ2+U4EgXSEw8RceCZXk8
         j8jKi/uhtVEN1Q83017dvGCc/O9xOaoQRzkhrMvO0JhwCRixIYbNIN4ESFo0mjxWXsQT
         LT/TWT8pu5pYdpbh/mE09DFKE3CKfPcZ/1SYnjcyM7zo5OnQznhHLVIgKa18sYurJ5j+
         W6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gc4d+mJV9MCv7yDWAF73c6XrdPx3pGuNA/L39Cbelk=;
        b=eF3Lz3Oh0iaKoHMwNVWFkvcq7t7TuE5/eQzh6DdUL7GeDNiP+WNp7Lh/Fr+KFKonQn
         rL98nc21aJDuADirwZvnHCzPVBjp5Mg5IaAVfLFzNVIbJLS4KLqvWobWcJ0S6gWfxdvy
         aBEOkY8u7gmOQufo2WeqQhkhpEwjzQOdZp84cW068sfEkYUyp/LxIXj0hMULEyqhPvPo
         SELr+GQfoTFgHK7ku/1gvc6d0yrEAJleoBuAKjXyIrEnORhgOI6iSjQubiO1vSoiVqia
         KiYaFsRrH9DFxqUQ9AsTKvFzWoxchgTEGXLTY8MpjMPJLktuMFvxybDiQ9b59Nw4yEpw
         aMxQ==
X-Gm-Message-State: AOAM532PIFSyWgQIJbOuxU9MED7sb8tMEZ771GbVR+gT9ykn836HLTXb
        +HjSLb1XziQANbJUUMQRlE5yhiRxV5nGeQ==
X-Google-Smtp-Source: ABdhPJxEy/ZQUv6tV8wHl/M+IhTQ4d7SBK2g4W2+2RLY7rILhOEij+iloYKhfY2X2kLY5B4Mcllmng==
X-Received: by 2002:a05:6808:e85:: with SMTP id k5mr224125oil.238.1643692845088;
        Mon, 31 Jan 2022 21:20:45 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:44 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Taniya Das <tdas@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-mmc@vger.kernel.org,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: (subset) [PATCH 0/6] msm8994-huawei-angler and msm8992-lg-bullhead sdhc1 fixes
Date:   Mon, 31 Jan 2022 23:19:54 -0600
Message-Id: <164369277345.3095904.15450214704701068210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Jan 2022 00:33:52 +0100, Petr Vorel wrote:
> Besides fixing sdhc1 for msm8994-huawei-angler and msm8992-lg-bullhead
> I also rebased and reposted Jean's patches (Makefile didn't apply on
> current for-next) and also rename angler's DTS.
> 
> sdhc1 (i.e. mmc0) is working on both, but there are overclocking
> warnings. I suspected issue similar to using clk_rcg2_ops instead of
> clk_rcg2_floor_ops (i.e. 3f905469c8ce ("clk: qcom: gcc: Use floor ops
> for SDCC clocks") or 148ddaa89d4a ("clk: qcom: gcc-sc7180: Use floor ops
> for the correct sdcc1 clk"), but it looks to be correct for gcc-msm8994.c.
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC
      commit: 4dd1ad6192748523878463a285346db408b34a02
[4/6] arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei
      commit: 8af90d6daa36a7180a2cd6aad874136aade27412

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
