Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA316694E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241494AbjAMKzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240865AbjAMKxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:53:42 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8491077D23
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:51:57 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id fy8so51282456ejc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVIRGlLILuzeFN6Ecbj6xNhD78JzmMdP7D8BXzaKLDE=;
        b=cZVdngUKizaMzfuybu7kx8nI6niVZX4C9kDoxFXDDGZxlPy5Ma5T6jw29z2JdXfXZf
         MFCNh3j/PXEjBPJ7OA/4y1uyF3wsiE9tzAmAUdRaSPgz3sZHya9KbiD5saew+Ny54GBf
         NmocppHVQKtiR1zFSbZKiGLUzK+i9+C8f+prXOvuM8V7cmDLkUlutYVojEFWd1GAlTlp
         EOqkzd4EN/EoA6HBpsgr+mvwfRg/VVPBXKCpOPodGq/QBVVo6zW57OPDqFcJOq3F9ywV
         eLCm/2Dq8egu9Ssp/zrkNY1x+iNa78af/uBHHB0BhY0pTlnbt3DhP/IXeUKYGEtTU7gy
         kXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVIRGlLILuzeFN6Ecbj6xNhD78JzmMdP7D8BXzaKLDE=;
        b=3xmMGk0NQcE0AMD0c7OjFRE2XIJBRqLSx1/+x+NQdgnexdVojgI+aQYDAxPm+8ZeYB
         MLhxjJp7FkvcHMsTF4WWVNpnXJDUCncoObEFlwOgGUwlmbYedwUKoOv0rThWUDbSE+wQ
         3ICwhaunJc6Qly2p+l0hOdfSTiDRRxKgjpDjiyNTVl9kiEnw7hLVuKO/tny/n7rPBnhi
         wbf9uLUD6Hi5HzzFabWIVrDeY36p+kNLGAkd6os0HQpHcle+dKWfrqbLuQjERVLwNRNR
         6GgEpO9l+TwL1CjBwGHo4oC4cqm//0Bi0GNko40dB3iWieEMW3Rjb6o8h7jE8MDnV1r7
         DPhQ==
X-Gm-Message-State: AFqh2kr9dOYjFC+H9Rwre6AoVjP2xR+RfRW1XOjVnEVgSammLEKHFli5
        GpQB3IB/A9zn2b3itVZGUkSk9w==
X-Google-Smtp-Source: AMrXdXvSYksoI1bc3CcKgvOKB5oCnpwnjmnEES/kNN0+b1yIaLROWiazpcJs3gcVFWw0kivPm1Mx/A==
X-Received: by 2002:a17:906:c0c2:b0:836:3d22:5d73 with SMTP id bn2-20020a170906c0c200b008363d225d73mr67468940ejb.39.1673607116039;
        Fri, 13 Jan 2023 02:51:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b0086b7ffb3b92sm146352ejh.205.2023.01.13.02.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:51:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,sdm845-pinctrl: add GPIO hogs
Date:   Fri, 13 Jan 2023 11:51:43 +0100
Message-Id: <167360709871.32944.13432996083602508399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121081221.30745-1-krzysztof.kozlowski@linaro.org>
References: <20221121081221.30745-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Nov 2022 09:12:21 +0100, Krzysztof Kozlowski wrote:
> Allow GPIO hogs in pin controller node.  qcom/sdm845-cheza.dtsi already
> uses it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,sdm845-pinctrl: add GPIO hogs
      https://git.kernel.org/krzk/linux-dt/c/9eef05e606387b597a86d071f3d72e8ee3e68df7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
