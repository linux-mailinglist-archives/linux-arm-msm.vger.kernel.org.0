Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CE7430A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343980AbhJQPde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343992AbhJQPdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:32 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FA6C061768
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:22 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so1479437ott.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pdfxl08R50FUxj15vHacy76BnG7Q2+qxHwmjL8wNFa8=;
        b=e8xfmuFTGzzWvk2s4MZtX/k7AM503RG5Z2G+V3tpGEzp3/1OrRjHYhadwQADG+vteB
         MEEBil49Sq9doAKNdlG8U1JX4PHjs1nLYuk1NNZNVr2Sr5sgO1YmUQKm4nB8TVn/jAH5
         9xY3QOX9PSfrafeBm0NChxuq4G6JLhnhnGqYKmi92hFC7geIgVNXibgyRlxK35nZwVGK
         1n6RJYsgdpbpJ6mnaDJYe2WanSo734OC95XcZdGT2FzKww8q+WHayE+uCgI464eGDNi4
         nEi4E/sLifnFKKLVin1B/PYhNOgF4j9QawwmifnTWVLs8zOPEGST03M1scrJn4BklwwS
         K01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pdfxl08R50FUxj15vHacy76BnG7Q2+qxHwmjL8wNFa8=;
        b=6MAelL80+GFUvVefGknMFhNhGiNAgONlNfSbrSl677fG+bdk5bCcIrk2/L37UpugM9
         HcjQMEDcb5ArmGyfWNys6nRITRbUpzERReyOi5ZpvWP1UN47zROnCPhuFFqj730e0ZEH
         ysbt/AVIwHyjc9k4yjYvVS/uuD8AesNu6dYiHtL9a+uI+YDEIXMKztckFQy5k3kxEoe9
         qoZTUMFCS34IpyVYijakxvRVKZu+UDG9WSHgUSVHxnGqB4xXnSjJpGq69bSTgHzMTWfp
         0PzpCe3WdWjia9liY61xzvYWh/Eua0qXJ5li93wmKB5VGdx6oUYr8Y35UgZcLJ6zu15J
         uPjg==
X-Gm-Message-State: AOAM533vxVd5lpnMPz/a3Tsq9k1H5MaSBV6jbnMb3j63E/+05dDb8VOm
        OVUJmSud2NzD+9DxE0S8AmKRxg==
X-Google-Smtp-Source: ABdhPJxz5Dh10GZUKWLZb20/3NIOGggcoAo0ZvmjOCgMaVaoghwfLPkD34uOMBhs95OfNi5p/2fEfQ==
X-Received: by 2002:a05:6830:1f5c:: with SMTP id u28mr17436518oth.3.1634484682162;
        Sun, 17 Oct 2021 08:31:22 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 4/4] arm64: dts: qcom: sdm845: Drop standalone smem node
Date:   Sun, 17 Oct 2021 10:31:07 -0500
Message-Id: <163448466184.410927.876599658454575045.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210930182111.57353-5-bjorn.andersson@linaro.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org> <20210930182111.57353-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Sep 2021 11:21:11 -0700, Bjorn Andersson wrote:
> Now that the SMEM binding and driver allows the SMEM node to be
> described in the reserved-memory region directly, move the compatible
> and hwlock properties to the reserved-memory node and drop the
> standadlone node.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sdm845: Drop standalone smem node
      commit: 622adb84b3e7c48a888c3df26fbf28679ded660b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
