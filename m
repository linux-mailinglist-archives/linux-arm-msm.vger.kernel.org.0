Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9835643D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiGCD5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiGCD5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:03 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E68B1E7
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:03 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 72-20020a9d064e000000b00616c2a174bcso5076984otn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReE+gYjejCgybMmC7KlaPA5PsLgtTo7V9X67NZ4pYAk=;
        b=gp2XzifH+Zs8kldL7uO21jT+JDe4R8mUvI41QPX+iVOjNeUH1qB89P3ul9P4bFS7ME
         TNyfQYdk9pyT3q8FdGqNcJBdrUP4uYwPnq9/I1xEch8quoIOVaISYl/Udle2pjiV1YPo
         EUl9ON58sX1cr1GxGP/nAeeESr9Ve5DvfCIwow9kfguSIX0xNOeLnkY0ptu5umA+u/l3
         0uO6+QqioL30GAqmyJF38311LVsk++YgZtFgKCPLuuliLmg63bPkJIcql/3XO7qAjsxz
         +hhJ4BAkG3JEC6gxdB1WnNmPITP+CgNdX9CAnwlm2pJPXlerpQI/z6AUqYF66MZsYnLl
         9gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReE+gYjejCgybMmC7KlaPA5PsLgtTo7V9X67NZ4pYAk=;
        b=kXkKbTG8IT0Cb4F7bKNZSDtI3pVOG9VkRgVPI0d1TWLoiKx2dpndw0CcqVu0nDvRqt
         zwXAflCyAqbOPSZpmhUoQmAALtWnzUzqNNJJkPpb26jxRs2xr8CHe4iZoBcrKu18/CYR
         KKgZNu3osCHMGVa2ceWhywYOsyfrSpOxjacd20oE9secUfSeAmlsgzwlDQfHoVVJUkJw
         cI81LgP1pz/JR8kGtH5jkwBHIpgZJiCRm5qd1unkz0KKAy2+4RyCZZLn01fhxlwfURJc
         kPvQjxcjEQSs7uueAbiBQp8X0cqASz3xI7///zGaOgVryK5wAHAvYcHjHVpcqmk1/Oyc
         rvDw==
X-Gm-Message-State: AJIora/3l6lOPxMShLfFl7HzCuMXM8M9S6BTBoAeU6PwJH3Iofllvxeb
        ER+Z6Y1uO2Rkjv2armnRXAbvbP7RNtnY7w==
X-Google-Smtp-Source: AGRyM1vfg6vhz+0ztl/DKpquzzFyeDA2GHkriXX2hTqqN44/oKBhzaV2duqjOigywYQkBOqIvyg3oA==
X-Received: by 2002:a05:6830:2705:b0:618:ba52:86fb with SMTP id j5-20020a056830270500b00618ba5286fbmr6821792otu.202.1656820622072;
        Sat, 02 Jul 2022 20:57:02 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-kernel@vger.kernel.org, vkoul@kernel.org,
        bhupesh.linux@gmail.com, robh@kernel.org,
        linux-phy@lists.infradead.org, konrad.dybcio@somainline.org
Subject: Re: (subset) [PATCH v4 4/4] arm64: dts: qcom: Remove unused 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
Date:   Sat,  2 Jul 2022 22:55:58 -0500
Message-Id: <165682055969.445910.18270347064167236555.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516063155.1332683-5-bhupesh.sharma@linaro.org>
References: <20220516063155.1332683-1-bhupesh.sharma@linaro.org> <20220516063155.1332683-5-bhupesh.sharma@linaro.org>
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

On Mon, 16 May 2022 12:01:55 +0530, Bhupesh Sharma wrote:
> As Bjorn noted in [1], since the qmp phy driver doesn't
> use the 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
> currently, let's remove them from the dts files as well.
> 
> Otherwise, it leads to the following '$ make dtbs_check'
> warning(s):
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: Remove unused 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
      commit: ddc35664a38e31034c3519de71c2dea52005bc2a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
