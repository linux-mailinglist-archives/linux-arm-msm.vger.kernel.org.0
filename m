Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 640915547C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354544AbiFVIgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354357AbiFVIfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:35:48 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E2338BCE
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:46 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id cw10so8886925ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ibSeTeoGrJU9Aqagmc754YJgfL9Rjsjx962UCMljOXo=;
        b=Pv4rFnY614dxv6rhYl+a5MDZYYOkFrklTB1DqB56UO7YtAUEo3mZd0uvQ1Q0eJVru/
         qVIZI7IzKvUsiWg77KaNzq0vS2aWRj6NLWkNSbLv5YyXNZo1hLEcIDRmCeL+eKd1bP1Q
         A69a3aCK1pYjHy/D7CSiNab1TtnSv3tSIAs5lpc721ETXr1nkYoQgBbOEa9p8rjsZf0p
         OrBipnYrC2GcnXITndwrdayoWqv16ywaXQzyW6MI1Fji+Qx+UefAhGEqWHdacju2tvSI
         GgZbZsh/O9Vv0PEQDR7nUyBs1nUVkNWZiZBvosq4kMqlhRmCAEMg74l7oncgglf9Wwr9
         TAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibSeTeoGrJU9Aqagmc754YJgfL9Rjsjx962UCMljOXo=;
        b=CxafOZADIUbDPaS0Vquq2yzD8XK7QefHDQZtYZNP+eDH1h4wRxqdAznG6p4zMZGzKB
         g5I6+f8xn3dwxxMPVfZVY68war3k3+FC68OV3wHEHGF9kNGVQANJkNc+n1DOxoGWXi5n
         yqn+V67ggJTZPefqkrMXnwK/9ikHPEWDQZ1UV+lv3K5XsNwS418YcORrLOxVoVO4cFcX
         p2Ahx+JN8SG1P4TU9yQW+Y1JfFjti+toWHTZHfjeHQMjJMvvjJCJNXN3q1YYfZ8sQ0Bv
         vstC5SvyHuFnj06lhrvujsnu4vuYpcHosktD9V0KWsxPuGg81leKRVG8cMWy+VcdCE3A
         4Hrw==
X-Gm-Message-State: AJIora/jVGNbEWhs2juZjW9LGaCw9pYHWI3QJ0VeMtS9lvXqPoMNNuV7
        wT+isDnC81I4cT/URgkrvlP21g==
X-Google-Smtp-Source: AGRyM1ttLbxNCfJfZjrL1pM7VtFS0jyMlykBozG6xZbRJN3ZAHMlEmgKZip7Yto4hapdf8V/ANRK4Q==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr2011528ejc.66.1655886944973;
        Wed, 22 Jun 2022 01:35:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        krzysztof.kozlowski@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        mgautam@codeaurora.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH 05/13] arm64: dts: qcom: add missing AOSS QMP compatible fallback
Date:   Wed, 22 Jun 2022 10:35:31 +0200
Message-Id: <165588692597.15720.9610794575339246261.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504131923.214367-6-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org> <20220504131923.214367-6-krzysztof.kozlowski@linaro.org>
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

On Wed, 4 May 2022 15:19:15 +0200, Krzysztof Kozlowski wrote:
> The AOSS QMP bindings expect all compatibles to be followed by fallback
> "qcom,aoss-qmp" because all of these are actually compatible with each
> other.  This fixes dtbs_check warnings like:
> 
>   sm8250-hdk.dtb: power-controller@c300000: compatible: ['qcom,sm8250-aoss-qmp'] is too short
> 
> 
> [...]

Applied, thanks!

[05/13] arm64: dts: qcom: add missing AOSS QMP compatible fallback
        https://git.kernel.org/krzk/linux/c/9a2f272b5f665ac945bc06f7b2e7cdf1cd974cce

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
