Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5BF855DEBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240928AbiF0UDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240873AbiF0UDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:32 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912B81A81D
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:29 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-101cdfddfacso14302319fac.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2UU9jrzwqQ6pPz9wIQPn4/nG1jsHYecR4m9XhUjO6fc=;
        b=yUwzj0QwAX4V7nIILpws5tP5i6PcgH5giHNyYBLw0wjs42KFJD2G81nESgCD3Lu2M0
         ztPbWjhGd/6OZN/VNPIDt7DjWnwTjcspbQqN7zxw4I1nGAFOI5H4gBpkKTzLKL8YKVP1
         o1w3G+2ghrYXNvIx5stryyBU/S347P5pUdkaNXsItj3uy63Zb4YQKO3VEn84tPs9tlyw
         qqye4G6Rirl2LUGJf7it17bPT5l+2tTstK5o5wNFd8SSka0BNeWKxSOVZsmBHDhfKK/6
         sq90oIp+SSiNTm4YflNJ3OAdCphYWO0JCxlgthxpPcKYd2nH05hku/OWr6RObFDfZU6p
         JODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2UU9jrzwqQ6pPz9wIQPn4/nG1jsHYecR4m9XhUjO6fc=;
        b=EcGk51IU0TMBUpf1Dxjd/E8afYwIf6xbwitxcRFn3rfrsbuXgmuNjNUI/geZsCQc8z
         anS38YpTrt6kerqZB5UhJ4vWYOm8oziJf41aYvVw9rx9QNJbwBasOL0sbHXNJ1+VEH49
         +vvb2JCm8yvh0COTTX4lTACRZQHa9fZhzc8JcEy8W4Gf0xSjqXUz3YrGTpvCLklFoDip
         fY4BdSFXVbB56NOi1fksn2cplLf2i2axdWWfP44vyb6hLr1p2o9f+3tfPioxGHzWh3p2
         GT6G2d9Br3byZmp9fJJM+umDwjdafDo54lgJLPaCnoZRZbxXSwmbLgfKfwzQ37csV1Hj
         KTrA==
X-Gm-Message-State: AJIora8or91C3EVY22ykICZgT6GSQvDeth7fa72kzL9EHKGYdUlIjHbL
        lZ3efBrwIviNHV9TcD5mOuODyA==
X-Google-Smtp-Source: AGRyM1tm1ZJfQw+EXp6b1/wLZKgkmUMgmzD2RgmcAGo0UK2Zxdeu+rC63MGLxWC1ewZOc4IATX7gew==
X-Received: by 2002:a05:6870:2f15:b0:108:c28d:3304 with SMTP id qj21-20020a0568702f1500b00108c28d3304mr1621197oab.92.1656360209223;
        Mon, 27 Jun 2022 13:03:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: sm8450: add uart20 node
Date:   Mon, 27 Jun 2022 15:02:48 -0500
Message-Id: <165636016348.3080661.11016689127874668308.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220502195133.275209-1-dmitry.baryshkov@linaro.org>
References: <20220502195133.275209-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 22:51:33 +0300, Dmitry Baryshkov wrote:
> Add device tree node for uart20, which is typically used for Bluetooth attachment.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: add uart20 node
      commit: f5837418479a3f0fafca601ec83eaee0465b5a9e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
