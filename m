Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE65430A1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344021AbhJQPdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344005AbhJQPde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:34 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F8AC061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:25 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t4so20912357oie.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bk3y/tUu/ycvoIdxSedTk9yD8cXswrshHOuRsgebxnM=;
        b=Jp43dBFzOdPJ/gnm86cDH2AJFsD3yHUk7s/vd91LoUhqfPOGzm279RIIwxKeiTnOcU
         kXQTBxn6rro0WPg+Erh9O+rJr5imuqJiFDQ1+JradxhuVpdQdlKyLIfqgjmuYhQYw029
         8G6fXDcocBoSrz8hSfZdz73CQhMXB07oWP43vI89a4V3qxrz+ojL7SA8pY7q/ekQSo9W
         pNWNP4dDBMnW1PPe87sMASDygRXgQ0iH6Ad4M6z+alcLUiedAcZxl431YGre4crvNGbN
         dHxCVYvvhldUw7yT6uaVFRnVOfT7KbVVA7x8Ou+sWF/DEOcbeitMiuNlRSytehg5vS4w
         J8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bk3y/tUu/ycvoIdxSedTk9yD8cXswrshHOuRsgebxnM=;
        b=jO0iS/CTokfWIW0AZHAHC8t5VU0BLiK5Fa3zMTATXRYIWo1FCRBpPFPDOxuRSlkLpi
         9S75xUDPapMlkF4OgxFxgC1gjp13rOCA9kCR1lu9KDV0SwgCEcSMkb8sIkSIHGBXqr1l
         /AM7KRInHizq6iBoO5Eq9AuHhwOSscqOVZ6NablTn1liFwR05BgVjQOpZCQG17oIxp6H
         /N/eyVGF6jDDWHq4lJbviCLmD0RaN1jjJa85pLcETCwdAsFgxty3MRQN6gcmaRf+jaeC
         Z/ekvXc0xcdH2fcwVcwtZbmV6ApJvO67jJieDMznWD7VL+Y5NtsMKZDnoRJLdiBtRpCE
         qCnw==
X-Gm-Message-State: AOAM533xIxxEXKEtiGVb2JptuAFUAalxabPgVVl3Egusfw2KjOl08c81
        EMyVXpseozVj/IY5UH4UWSmByg==
X-Google-Smtp-Source: ABdhPJztpe6QQ20jTCYWg0VzjRjE5jhWrsDieHM2W3NVZw0ONyYPperFKA46tlKxMi6btPEfvzVwhQ==
X-Received: by 2002:aca:c6c7:: with SMTP id w190mr25358409oif.116.1634484684485;
        Sun, 17 Oct 2021 08:31:24 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: socinfo: add two missing PMIC IDs
Date:   Sun, 17 Oct 2021 10:31:10 -0500
Message-Id: <163448466185.410927.14437510227820991644.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211016190607.49866-1-dmitry.baryshkov@linaro.org>
References: <20211016190607.49866-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 16 Oct 2021 22:06:07 +0300, Dmitry Baryshkov wrote:
> Add IDs for PMK8001 and PMI8996. They also fall in the list of
> 'duplicated' IDs, where the same index was used for multiple chips.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: add two missing PMIC IDs
      commit: 2fae3ecc70405b72ea6c923b216d34547559d6a9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
