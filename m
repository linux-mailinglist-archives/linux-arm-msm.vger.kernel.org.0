Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22128554932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355289AbiFVIg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354718AbiFVIgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:01 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEDD38D8B
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id t5so110244eje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BsJ9AjExKxS8yeQKPuiXrngSiNMZjysQO2j+WxtI0l8=;
        b=aIHLGGh6nKlhUde7z1f+qNmLdyXR/tOGlJN+Vf4B74ijIDsu0cdwowYkzRubsgL8mr
         uox4P12u962oGW1UABisPD7ibuTvAVwuDkXhUijF91Rbu7NLCkj5EcSd7fS9nA9JMDFQ
         SSTAayJetZ/7/yvMMnlZ48ZRlSr25fTNDsLBNMB8tFQiWaFD9davQznx15tOCTzX3sPu
         3okTQb/ExzI2h5PS4AZQI4kyaf+MdY3nCHMlXmzdvFFLcak1Sntos9XftHx337uEMkAg
         FCjtRJkYXOqeuqUYJ9tvcfcrnpplqutuebGI7RdNJJtO0XFsP05huQzpW5goTX7OKV8S
         m0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsJ9AjExKxS8yeQKPuiXrngSiNMZjysQO2j+WxtI0l8=;
        b=NIcqu9jDGeaTrxE8ugVHO11HPnC8douluh3zh2N2ieb1ekn6UXLWjf7L5JfOFfQqQ4
         /5VB9NOYpUeoPJYk8GUOCjmJFfbqZdvWqCAoLIU7AyoBhjLM1rBzIYgD2UV+selFP/lk
         jakXsMizk5H+p7XolY6RI0bcyuKMq/Vy1cbVzPmF4pOE709qvOcS+eMIW6uhYmcMNO03
         wJsxAzkDFWVns7siWOz64iX3F3XDjwoqdEFcdqi3OcKpf1iaILOvq5bR+ZiLW7UnFZWH
         u2HKLaYMM+K5W6MRoyf1QP/QlGM40R+8Xb1uRatRsQc2NXMIH4e8uIJccGld08kPQL0s
         ZuQA==
X-Gm-Message-State: AJIora/Dm6PU8HR+24aB1Tk6lh7DBz48BqlU6n+XMvVYmRqiDZnVhkpi
        IJs6TpzagD5adqAcfZHaYOtfUg==
X-Google-Smtp-Source: AGRyM1teJ7lkpIDq+FmyAzllCvPp71rU4IJ/dvt17qxwuMQQdXtA9pISOpaz9GXoyQnJRIbOKaning==
X-Received: by 2002:a17:907:7288:b0:712:174:8745 with SMTP id dt8-20020a170907728800b0071201748745mr2016602ejc.268.1655886953275;
        Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH 4/6] ARM: dts: qcom: apq8064: add unit addresses to QFPROM regions
Date:   Wed, 22 Jun 2022 10:35:38 +0200
Message-Id: <165588692598.15720.15275892628171765658.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505113802.243301-4-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org> <20220505113802.243301-4-krzysztof.kozlowski@linaro.org>
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

On Thu, 5 May 2022 13:38:00 +0200, Krzysztof Kozlowski wrote:
> QFPROM children have 'reg' so they must have unit address.
> 
> 

Applied, thanks!

[4/6] ARM: dts: qcom: apq8064: add unit addresses to QFPROM regions
      https://git.kernel.org/krzk/linux/c/439e49349c146c0965bd6c9e214c2b703119108f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
