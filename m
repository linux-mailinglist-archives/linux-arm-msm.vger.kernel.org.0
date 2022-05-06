Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685A051DB6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442605AbiEFPHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442581AbiEFPHA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:07:00 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0816B083
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:03:17 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r1so7754499oie.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JT/QUvDx0MUmQfgp+Nz+UuQG04gCMDAAR/5xY3qRX5k=;
        b=PLJOFtKn7CihQ8C1wrfXnY8usa26Ajq7mKTCISLFPFqFLE4N2L7bSTXYAbb5Vh0yo3
         MeyJVltCWDCT9d5N7G0wY8Xq6X3HqJ8BcUlOILFT5Mk6DxPvZ9auk3jX7PB3vDTZL0yQ
         nLpHbRTjLBTVN9UD1H+eVxJpCMSfmcFIVoUM5WlL78bomuxiRnMew4EMb/6LqpM/oK3Y
         Ikdyf+nlmUJOz2xxddAxQdLClwfNmACDNi5zunwSsSxpb+1g1xnyKEqjPAdOBk5Bm+q+
         EgdHhvbPXBiBmRxvgIMiPCQqK/wXC8ZRUCWYQ9UZh2C278jy5+NUSMi0lQOnbDKjWa1k
         e8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JT/QUvDx0MUmQfgp+Nz+UuQG04gCMDAAR/5xY3qRX5k=;
        b=Vt3+mxex6uTalm+jPzPpglz0os4WnjOXy8tgoMwwwrvlFCXTbEeg1rVmpOnJdVhlhC
         6c9SJeG+l5YXmDLz0oTy//A8Avze67lsSMu8NmyTDHVzhAYmG4AHg6s8dJYru3OYH5aO
         llmXi8uO48So5loWk7aA9zilzkYtZzCm0g7XdJkIpLdP/CYyJ2EMe8TcrVrZ6gTn1Tny
         TAz221CNtm7m7tV7x76dtdccsXetZZcZ61qyOf+PPU9hZfa7YYl8g3r+4CVJ0w4qvd9u
         aINvgACoG31s60ZxHjViQbfxEICN+lA7biaIpmx+K7gfeGaRL9LDphqx86jSmlphZ5Kk
         95sw==
X-Gm-Message-State: AOAM530d9/S8YtLoWaoQoVYKGyiiKUyu3cuZSOJOgD5QJ4g5ItFqtZ5O
        He4KBDV5KaUk9z2Mv+rZXuAcEQ==
X-Google-Smtp-Source: ABdhPJwKoUVhMgdExdxlBglro+jK41z5Vd7eQOJiCPN5++lcvaKyrPf6wrOdxsekgwYwyd7e2a5nXA==
X-Received: by 2002:a54:4f87:0:b0:324:ea60:b97d with SMTP id g7-20020a544f87000000b00324ea60b97dmr5184360oiy.87.1651849396802;
        Fri, 06 May 2022 08:03:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e21-20020a056808111500b00325cda1ffb9sm1665311oih.56.2022.05.06.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:03:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: sm8150: Fix iommu sid value for SDC2 controller
Date:   Fri,  6 May 2022 10:03:05 -0500
Message-Id: <165184936433.73465.7280388293264645764.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422210611.173842-1-bhupesh.sharma@linaro.org>
References: <20220422210611.173842-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 23 Apr 2022 02:36:11 +0530, Bhupesh Sharma wrote:
> Fix the IOMMU sid value for SDC2 controller, to ensure that no
> ADMA error is observed when the microSD card is detected on the
> SA8155p-ADP board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150: Fix iommu sid value for SDC2 controller
      commit: 9583009097c8933a30110097d373a09624cb8c37

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
