Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33CC355C264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiF0JQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 05:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233798AbiF0JQT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 05:16:19 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800922DE7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id q6so17687339eji.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dnwgVpAbJCk5Y0HQ5/+yPejv4FlYS0Er713npeMnQc8=;
        b=gdnXEvThmlVanmnDgJF5kH1vYKVD+Ah/E45c754FapkvJDVVJ0qCihos+Q4r6bGUR9
         gk9Ne30rQy2aAgUHvqntoMUhhEcWLzO88pK33a5omJV6yfjVWA7FgCs7kpMJJoY7eZQq
         z1ix05EoytrOA9cjSdKrDECAAIMNFoQALOanRhSG9zq1N9XkA8Swuh6dACnVv1kJ9U2y
         4wCu8UITUFyzP4snwSw1dsJ/84HHj+LCHbO7cpM4lKjkLCW7pEJbMtWXNT7fYynLumCS
         T/NyS4xZ+JI44hlDyImGmR2yb0NjvcSliYOVNxzUQ9P07mo2FO7+6EcUIuXYA7Gnmzys
         q6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnwgVpAbJCk5Y0HQ5/+yPejv4FlYS0Er713npeMnQc8=;
        b=MMqqbGppe4aT60mpXQBnAnA1yA2Q6LAYrc35TZsMC9v8Erg00OAxE5qcuxJedRNwBo
         E58MAQPElf2vi8ogerQv2li5mF9AKnr68d6J3hxB9VE0Z6dYytXki1KVcDaBtDSTAwhL
         snXfM6awojCPEYcnG/webDyiN90xxKwZwFtZmBkh40fxmFHUKnNwPkRdSkfQsODgfHoX
         zgi2nuLXbr2ZlpT2r01++S+3U88cVqJ+dW4176U1Xhq4SMWNwsDFjOxXaW4dksB81MdI
         25efTK2ULYcmps4jh1kSVpFNh4McF62otyRWT1epuaPnTZ+Pn+W1SvUHUbXPsi0WjWJW
         kYBg==
X-Gm-Message-State: AJIora/gcoo9WcJYJqaGRJPrnTmV1oS22bH6E3cUY9b6songoUKGMu5b
        21Oh9m2mtNHCKPwpSYq3fiZAaA==
X-Google-Smtp-Source: AGRyM1v2enS+B3+GGR6dCC4IEVkGqOz4P4eE9RSKXkrea+0vqJaqo6CwmCj9/s0i3BxCLEvUwFM3Eg==
X-Received: by 2002:a17:906:7a0b:b0:722:dac6:a8ff with SMTP id d11-20020a1709067a0b00b00722dac6a8ffmr11614667ejo.593.1656321377053;
        Mon, 27 Jun 2022 02:16:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     soc@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        arm@kernel.org, bjorn.andersson@linaro.org, olof@lixom.net
Subject: Re: (subset) [PATCH v3 21/40] arm64: dts: qcom: align gpio-key node names with dtschema
Date:   Mon, 27 Jun 2022 11:15:51 +0200
Message-Id: <165632135505.81841.13615326187016120694.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
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

On Wed, 15 Jun 2022 17:53:14 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[21/40] arm64: dts: qcom: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/f118c00637144d0cec0b862dda283f565413539b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
