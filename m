Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648047D22F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 13:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjJVLkq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Oct 2023 07:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJVLkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Oct 2023 07:40:46 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB57F4
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 04:40:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32daeed7771so1597586f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1697974843; x=1698579643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SAtwbRjnY+U/XLUS1QtVkAFPEpVXUGS+vk/XhP3IX0E=;
        b=MbFoa7D0K+IwxYnS6YM1aa4soBreWtqsQ7o+8gAMNDwRlpvKngNUU+OatrNiUWZJtE
         ZoXxbOUDehfDUVrJztnyQMjB1OA89OSH+LVO1ORAqXWTZdPnGWjrG4bLUxaizmCKUitf
         bH2NTVAiLZHePZUrJCySLL0VMci7zF+FFYG2/y5fAMRiJ8JRc5YXu9L7BC1bGUIefMpq
         QPgUnnbTTpV/VGkosL/wxQdlV8P/WmQydTVp7uQDtgVnwsYjIh3BBzYa7mZ3PpGmS/eP
         guhYU8yNLE+evBlztk16ijWKw4KpLj9J3vqJLTt3Z0u2JfXWl2aH/1YZVPANzGeC2UbB
         eWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697974843; x=1698579643;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAtwbRjnY+U/XLUS1QtVkAFPEpVXUGS+vk/XhP3IX0E=;
        b=cPcKX6P60sELdj4a+kj8wQ2DBFrgYfETPwcZyf6ITSKCsVz/b2NzJ9Sau6Q7kQ//Pj
         fl0hyFJLrZGAz7pNPS6dAyKL8iLBbNgkKdK8UPmZ2Yh6ChNOIhDsByfL7VicwkAxKARN
         mYOS82/qbzVSBBEABSpfeU4w4TGBDeiZkwQfPmkR1Qrp0ZkSdacZXh0Q4Go2IaFM590A
         bCOIwTknXuxeGGEAx3kNnY8HhMpgu+PVyk+wtciohNOSDiPe0KrqZpfNnupjBfZ0BwiR
         QpcQlv1mhA0k8+jvLmn9hz4zSa7Bnf3N9E7kSt/DDfGhLMYCvAdTR8NYgdkh6sigGaLg
         6aqQ==
X-Gm-Message-State: AOJu0Yx4GB24ohAuABtyQ32sTTxIrtKuAy/Nd7CiKQms98c/NzsCkYBA
        SvgP8W1VrVIZkCJ/VjFlIloQ+A==
X-Google-Smtp-Source: AGHT+IEyoCnb5m/VQGuoPz9dsEtgdL3tEaAAIur+/1/IMdFCSP9/cbYT4lGJX1CZ3WYqfOjrj0+f5w==
X-Received: by 2002:a5d:63ce:0:b0:32d:bc6e:7f0e with SMTP id c14-20020a5d63ce000000b0032dbc6e7f0emr4913874wrw.3.1697974842829;
        Sun, 22 Oct 2023 04:40:42 -0700 (PDT)
Received: from ?IPv6:2a02:8070:d89:b820:87f5:4b33:b582:39f3? ([2a02:8070:d89:b820:87f5:4b33:b582:39f3])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b0032d886039easm5496136wrt.14.2023.10.22.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 04:40:42 -0700 (PDT)
Message-ID: <fc5234cd33b78369f792479795abd02710dfcdbf.camel@aceart.de>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5
 (2016)
From:   lukas walter <lukas.walter@aceart.de>
To:     conor@kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.walter@aceart.de, phone-devel@vger.kernel.org,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 22 Oct 2023 13:40:41 +0200
In-Reply-To: <20231022-arousal-glowing-f72c8f2e44fa@spud>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>How come this v1 has an ack?

This is supposed to be a v2, but I had problems sending it correctly,
sorry
https://patchwork.kernel.org/project/linux-arm-msm/patch/20230916134147.163=
764-1-lukas.walter@aceart.de/
