Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D748B4A5680
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiBAFVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233663AbiBAFUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:48 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49E2C06176F
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:43 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id n6-20020a9d6f06000000b005a0750019a7so15167401otq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ry1KVCLodT30pxR0phJHQWO+PZtDOVeQMcsip3OfdTY=;
        b=aTZPtmAGdZDLvzurlF4oSjIoWR4277PVrc7Uac/gOWuizOuTRgFF//g0uor42N1wZv
         iA9UWLJ8bp5aZ9UB+1FIDJGxeaDYgLj6wl3RLjaZgthR1bgLV/c/GUh0rdNroedI5ZcM
         l4ZI4E6atRazjLTnfCcNzSYGiXLYypFpeAy9v+DxNQmCvlnm6Suu1rexiBgyzJpecbPq
         l666nVHNxb8/IIuoYHmI8twC7ysskypBpLWuCMnzZnPKhStwJwuUe/z+4RxWx+6nk4h4
         FLF4qDONAW9lKHNSdUZ/KDiCwlbnY7Dk4/OFNojRoOMp4xOglCKsCxrIAf+fzY/bzkri
         GKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ry1KVCLodT30pxR0phJHQWO+PZtDOVeQMcsip3OfdTY=;
        b=5L9wTpzyYss416FZHo0RDvC0r3tKWFM0h1hNPSZR4WbAyH/VborIXs2wow51SGbY6W
         jofrraVIfZpuYFUEvJ6Za/HYodgoMRO8ALCtihDGJgVKN8/8L0rg3Rre5QrAAt5IJZCt
         y9JLSVqNURUrDtUxt00i5olYwba+Ik20C21vN4UEsnbPz1Nx+xgQf5QAqDAj4/6Np6O5
         S5CN/Pz2uf9OzL3UQpzIZC8xn1j2Yl+jGo75m2a8kwtVyxIJWQjcR1w/U6xF+79ZlaXk
         RFMcSOEXPGEM5AAxpVkI5gz6HDbhMU3IsjmE5ojNzgq2t1iaDi7/AAQHgYmmA6GUVbGw
         PUBA==
X-Gm-Message-State: AOAM530fHsW9oZ60OwKMQ7dzbMxF02KItBbPqcUV/u9wq2g63rg2IznI
        oWX9SPfIOPRanNcKA1hqzuhZmQ==
X-Google-Smtp-Source: ABdhPJztSrYUbSJw7VycFZKQ2ZDAlLdb4aHLheqEoISnXvoiYEOmY/wM2qKkHnqDV4c6LKDu0dcufA==
X-Received: by 2002:a9d:7cc3:: with SMTP id r3mr13724563otn.121.1643692843179;
        Mon, 31 Jan 2022 21:20:43 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:42 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     stable@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2
Date:   Mon, 31 Jan 2022 23:19:52 -0600
Message-Id: <164369277345.3095904.4546009312058638059.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220112035556.5108-1-manivannan.sadhasivam@linaro.org>
References: <20220112035556.5108-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jan 2022 09:25:56 +0530, Manivannan Sadhasivam wrote:
> Fix the MSI IRQ used for PCIe instances 1 and 2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2
      commit: 1b7101e8124b450f2d6a35591e9cbb478c143ace

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
