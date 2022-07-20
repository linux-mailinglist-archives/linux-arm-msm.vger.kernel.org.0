Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E14957BD6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 20:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiGTSJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 14:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiGTSJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 14:09:43 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2781D643C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 11:09:40 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-10d8880d055so2688134fac.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ROY/IC4x7MMdt2osYbkvCIiF4pzgjr8GaOBy9qb1Yg=;
        b=Q2oN8BE4Oo3XhGmhJMhRqkN0TRUBdutUz77lutdeczrg3TNcJu5sQlCQ3gfSfREZd9
         dd7LvlrKtqh1gG1xpEvBE+SYShnWXIOX1X10VrFb7fyJHB72lOdPYIxdPCLnFxK6ipC6
         zfkgJXxkdu67utsLJhj0pzXXNrqavGSEtsYUvBbyQnKkNhIVv+O/djed4Az7XP3Zpl5z
         Htne0DRK7LSGDPyhOeGxu3YE58fpfYJZi71njj6gO82bU6uT3GnpSSC8g9AOQOnsqY+h
         bbOHHNomwAavApbyynVeudN2mMbtAL/YUnVnEn9AESMNmtQ/MKJ5BmU+5uBr3919SjnM
         0KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ROY/IC4x7MMdt2osYbkvCIiF4pzgjr8GaOBy9qb1Yg=;
        b=5MrwsK0uCk4Z90y2x2v0eNMpXG2bxR4GOM7CT/d9fVtP/Z1hNydwOQMECuSBvfDXUX
         WGmJNwdeUOgPEzXeeGHMBdSg3WsVYpb/g8dQNdREEplIuEFtd9ypJT+XDw1b+GmPbX5O
         gFNPi1gJuJocU34t8gauWLBBMp2EhDAYr0XxPBHlEtbuvBgTp0CSLNeof2fI6ugNIagI
         sLz0BhNw39Hpe9d9wY+O6B+1HKTnPkIa5E7OvJO6Z8+NVXRRHnRVg/t9ddgKgJ1uagu7
         Iy9bIzYAuGHfFwA6tn9GNRMhRqPBmikiOJtt3yuSeWRQp/JwRjh5Bt7vSrkPiF/c5QOQ
         E/cg==
X-Gm-Message-State: AJIora+odDz1bUZ2hOWgKzbucCG4wmeQ+1Jxx244bYjhX/Ns6OR+PWOR
        rjFiDW0GyIuBQBEbe/RtdLup9A==
X-Google-Smtp-Source: AGRyM1u5YZTwC+dJwmepol4C/HtAeXxmXyVSQbrfkkE9xQySv867g49ictjYWazEsVL7wc7tdBvrng==
X-Received: by 2002:a05:6870:f2a3:b0:fe:51a2:cc61 with SMTP id u35-20020a056870f2a300b000fe51a2cc61mr3149312oap.3.1658340578748;
        Wed, 20 Jul 2022 11:09:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r131-20020acac189000000b0032e548d96e0sm1603602oif.23.2022.07.20.11.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:09:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sboyd@codeaurora.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mollysophia379@gmail.com, agross@kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s bindings
Date:   Wed, 20 Jul 2022 13:09:36 -0500
Message-Id: <165834057118.2095894.5433547373289100407.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220712145139.9473-1-mollysophia379@gmail.com>
References: <20220712145139.9473-1-mollysophia379@gmail.com>
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

On Tue, 12 Jul 2022 22:51:38 +0800, Molly Sophia wrote:
> Add documentation for "xiaomi,polaris" device.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s bindings
      commit: 5aca0822aabf4fc9c33131f0d419289fefdc70ac
[2/2] arm64: dts: qcom: Add support for Xiaomi Mi Mix2s
      commit: be497abe19bf08fba549dd236624e7bb90597323

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
