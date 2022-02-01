Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72E94A566B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbiBAFVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbiBAFUk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:40 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B412C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:39 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id m10so6178927oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=34Rw8f6vjA7d0v/+KP4f6iYwSkK8B7CNSNYde14ozds=;
        b=E+9Thk/LgvhyheeZK4absHRLEN9dWHW/0ZW9XXCSULAHsfqxgV+uqITU049peTKgHV
         fZRtuxZnwmlAQhmc2kvjJEkGf0FGy/mvc/VZx1eBlT3vOPztf2mdtrmJ7MLczp6G8oqv
         qVNGZHLniIBAuqctGRUQO1EvOI8jJ66u22AKfFcdAU3mKMue2O0ukIvTt+DEgVtuj4KM
         Byn0yj+WNw3Mm96kZRs/oKNytXU/74x1VY9xfc5/vCKO/X5ttH1fCaEf+ejb+f1+MMWh
         kTHWqwH/bKTXrzeQBw3FjpOX/r+42qubOBbQBzemrlYHzEK5I6Lhbf+1C1Zgn5xkwBoJ
         uncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=34Rw8f6vjA7d0v/+KP4f6iYwSkK8B7CNSNYde14ozds=;
        b=nYLqfnIfscv18Y7DpJ/wapaxvCvq2Er7fA0lyJEcxuFNDHP1Ua4tvKTUrgyhUVhv5j
         SrE5j09QVbaXi2KzpNp1S5f27hp0gV0WHQBAQ2JLn1kbF0N7ApM0XvvtccoNdaIjhRYv
         ougE0lh+8Ig5dRqmNrcN7OLfd4xluQtBwiq6oEa7m6/kdFd7Ni2BiulCsZ4JNptAKqur
         /5xaVH9+GfSr+5YQ1Dvy9IArqMMGCXuaROd+aD+rH3F9l8TJRoCQhAciS+BYk6rgS3Ra
         biMPMQMBq8o9U2EXKlC6G9rCnez+MWjR6CySx7psuGz9NLFaghN3ZS534Mm0ONwzG6uJ
         9GSw==
X-Gm-Message-State: AOAM531cq3XGJESwL9HDqWIt4X9DxR6PYaIR9Bqv90Ihi5qedMFrN+M1
        xFls675eco+6jr1mOncBg/PqcA==
X-Google-Smtp-Source: ABdhPJzlSqq5W6AczykltWwcjYDFuq8S+hcwxmSsiCnGdGveqsro415e4nI81Bz0Ikt5v0OtjuouzQ==
X-Received: by 2002:a05:6808:1647:: with SMTP id az7mr202164oib.335.1643692838598;
        Mon, 31 Jan 2022 21:20:38 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:38 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>, Will Deacon <will@kernel.org>
Cc:     =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Enable PM8916 watchdog driver
Date:   Mon, 31 Jan 2022 23:19:47 -0600
Message-Id: <164369277345.3095904.4113520996683357146.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131202721.2122605-1-dmitry.baryshkov@linaro.org>
References: <20220131202721.2122605-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 31 Jan 2022 23:27:20 +0300, Dmitry Baryshkov wrote:
> From: Aníbal Limón <anibal.limon@linaro.org>
> 
> Enable watchdog driver for pm8916 block. It is used on msm8916/apq8016
> platforms (e.g. Dragonboard 410c).
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: Enable PM8916 watchdog driver
      commit: d3173e421b7267754aaf9b410d79d4b30c547596
[2/2] arm64: defconfig: Enable SM8250 video clock controller
      commit: cd7ce3e18afa7bef1ce371706416918de1aa3bc5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
