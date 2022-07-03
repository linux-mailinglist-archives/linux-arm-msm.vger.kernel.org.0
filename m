Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8349656446C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbiGCD5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbiGCD5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:21 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562EFB48F
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:17 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-101b4f9e825so8838752fac.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rQQRjlUfoieJKHDRe/Btfw8pvqJc3nwY2GtYlAFBsqg=;
        b=YI67ZrWvymTy/JtDk+8EXQRR4mqYSsDbKqP6d8ozbf3wQ1TtiJtrIt7yYKtdhgsGjL
         15hqPsRAY+f0fZ81H5k3dN85E/wBchFzgL2OhK3Hls77tEWGnlCBVRS30C4ils+8mjjx
         ZrAxhK4BCE1PWfGB5TQSWpctwAqFIhirKoZqpkdiGT+oazFiQ82/thYqLQelXJmMXad/
         D62jVTFYXzvfgxf69vz4bKgdpDDVvnKHtc6m193iJgkojwcUTG+Jev/p1iAphTfX7O8I
         jeSRBX7HhB20sfrOo+wweCEmy/QGXDawlSRblbaTYJYYkJUM72B+RCvNmiPnxmzc3ntv
         0VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rQQRjlUfoieJKHDRe/Btfw8pvqJc3nwY2GtYlAFBsqg=;
        b=vDB8L84uIKigvusX9T9BQekN48uSmpIVvL8n0+L81metTP6sifcPOIHZ3Cas0tDeIk
         j+HcIZLmFALuLddQG1AAqNjmPlea6uqAa7TuY76/KASNkHSeZGdJLZBANPiILQKEygDB
         D1B9yl8dQr4YDmjo2eCMym4xnhbCBnqqS5GqISlzepdTMxYjw61nUg5x7ygDiha5z3eg
         uOLgeoDe8KoidLrE71JiHKuSep3GKfXixEbVmLAc6f0aUh4EjGtkS6+nvnxNu67kUwSG
         iwsLaTnLBg/hXWqhFEsBrG7nTG2iHDbOiVF/2kdqnoPlB/tiZhhCgGLxdTNB86PW0dWR
         EOaQ==
X-Gm-Message-State: AJIora8HbNQ68o/b1IBcU6Ks8EAkO2r0TN27b4PFWsVKCeIuS/go8qDH
        EW+SU+c2EHA+LCA9U6cPEUAB9A==
X-Google-Smtp-Source: AGRyM1s6fGI0kg64wF2hXXbf/WMK5nJWH2iwcJ4aeOHPxc7op55m7hdI2KkqJ6o1H/RmaZz7c7rNMw==
X-Received: by 2002:a05:6870:4b44:b0:108:5271:d378 with SMTP id ls4-20020a0568704b4400b001085271d378mr14478286oab.240.1656820637107;
        Sat, 02 Jul 2022 20:57:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree
Date:   Sat,  2 Jul 2022 22:56:13 -0500
Message-Id: <165682055967.445910.376914934680767276.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622132617.24604-1-johan+linaro@kernel.org>
References: <YrMVqifgV4kZaP7F@hovoldconsulting.com> <20220622132617.24604-1-johan+linaro@kernel.org>
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

On Wed, 22 Jun 2022 15:26:17 +0200, Johan Hovold wrote:
> Add an initial devicetree for the Lenovo Thinkpad X13s with support for
> USB, backlight, keyboard, touchpad, touchscreen (to be verified), PMICs
> and remoteprocs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree
      commit: 32c231385ed437bd088d67ce7f505e1784a26430

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
