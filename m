Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3177856C30A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237377AbiGHWTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 18:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237157AbiGHWTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 18:19:09 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4DCA2E58
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 15:19:08 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u9so296644oiv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9I0SFAT4qZWBXThBg4GWRJ3eliYr1SjPFU1PmBCQKjY=;
        b=VT5J0T7E4pFKIRAbym9NqBOwcsZ9faKKxl5ZGxvq5TGos2qyJk3LYjB2971J4CVa7q
         bLPNudve2kGhTXpCa75rp7oBZX35RA8MEt0gya95I2iP05ugUogw4lAvCB4mE1a3NLVP
         WswMBJFw/By37sp4bLo3fDpEN9PLn7Otw8xGgqRwHs84DrAUVLORg3wNg+jnGhSsUVKc
         BxXKgLq6zI4HEGoz98/5/3wRkIb7bCTV7DxooKoEeWVwbsDFRp+bw4yxSf5TIw+lsDiO
         jpew4/bPbnk0SstHbXONoBvkEg6bQpFT/pA5pcNlOOhXHAhOifLyStFbUW7wStyZfjoB
         Jqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9I0SFAT4qZWBXThBg4GWRJ3eliYr1SjPFU1PmBCQKjY=;
        b=ol+Dxbmj6t2g7bvQdC/OzBcTjbwMjTtJhbljmdiB6csrN4xgTcg7RnF7QeT80UfhTv
         K6XbZwrApsdJ+VecbrnNpf5R8TVg3tzTdt/nvJ4mevswMldkgr3vPw2rtZYFS8LJpe/e
         ronxLqwJeysdp+4UbbI4nWP+JxK9DAX44Q/q2nzJ3jss+WYK/Jw2tfm1N+aLhDKDWq8t
         Ay2GmmlVlnihz/+koyHoVE/4AGQTw6KrR6c8X8AsOpe5hpOD35F+LcGpWrlVNkJsLAp8
         AbM1bVQsl5peCa3muccdCHZV9jFkP9N8uQQvfHqhOLX9w/49hofs87iXD1cCucmjA9rC
         sDYg==
X-Gm-Message-State: AJIora9EcM5l4yivOBb0yXrqbJnO0dqQsNjTLpOmCPV3SlvW9ABAo0qP
        tSf2/ceTVOk58p58ZVJd+wlq2Q==
X-Google-Smtp-Source: AGRyM1vY05jMLlDztoin5TcFW2xwx7InCI2TyZLrvhdC2twO+c8imYn4lby5wgw/K6LsnUrNcZ6WIA==
X-Received: by 2002:a05:6808:16a7:b0:2f9:39c4:c597 with SMTP id bb39-20020a05680816a700b002f939c4c597mr1144426oib.101.1657318747922;
        Fri, 08 Jul 2022 15:19:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y10-20020a9d518a000000b00616a2aa298asm48907otg.75.2022.07.08.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:19:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix usb_0 HS PHY ref clock
Date:   Fri,  8 Jul 2022 17:19:03 -0500
Message-Id: <165731872887.1018153.11340490580715781531.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220708072358.4583-1-johan+linaro@kernel.org>
References: <20220708072358.4583-1-johan+linaro@kernel.org>
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

On Fri, 8 Jul 2022 09:23:58 +0200, Johan Hovold wrote:
> Fix the usb_0 HS PHY reference clock which was mistakingly replaced with
> the first usb_2 PHY clock.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: fix usb_0 HS PHY ref clock
      commit: 43883cee061f46f47ccfd251a28c879f84832a7c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
