Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039176F0F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 01:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjD0XfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 19:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344237AbjD0XfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 19:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9264A273B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=MOrWLxFdXApybiuFt3Vg9kLxQUjpXHw8cw0js24W0dO5kftNfGpvhnrX9zVGCxbD4H1CW+
        c3e2+a/eEGAXdNnO8rLVPywXWve2ozjyONJkjHBwMMnlpcu9LTRijqGkMqhzmzOA2bZFSL
        OScKLdzZs/w438dL5EG9FqniadtRZlE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648--H_BpgOlNiyZ-IyU0vQuIQ-1; Thu, 27 Apr 2023 19:34:36 -0400
X-MC-Unique: -H_BpgOlNiyZ-IyU0vQuIQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-556011695d1so124348587b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638475; x=1685230475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=fsyFb7WHF+W6xr/ZayJ0LhaSuRXeWq2TGSvbNHfHIlaDskSrl5Pk7NyUDP2Jiky3X7
         0D1snii/Y/+qOsrkuV1e24ZMtLQEc3zhErgqmSTQtoqVOaJUkcszU3Z8YaCRjlWlCmWo
         b8jWRlbtNAxdudQpNXiFMEkAU4kiCwSzUG6SNwGu4xdl402CIIDviRDZfbCQKpPIay6k
         11Zain64KHPJvEbXEncv740Aw1jVOs06Ib9ukr600eCDWsuQ9Tlhmzkhlz436Ka/2DbJ
         5YtXNl44B/sENjpypkNmJij1t1JTIEfJVhzN/1V6JZm4zcHaX1aJvSZ7Ie0DC/1HvBrW
         c3aQ==
X-Gm-Message-State: AC+VfDy6vfKNI8a6lTLhsDlpn2mFrBMBBf38QM6cvhzOk71nFO3vOtH1
        JiGs7lPwcPu9UgBZfCIJhj4nmkNtEna+Oak8tnY3xnJ+cAkyvFISc7+Tf8LJu90KPBlSDHdmaTB
        s0UyHg9u2TQxWB8N+j2ncTi0Syw==
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381995ywd.40.1682638475579;
        Thu, 27 Apr 2023 16:34:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73hjwG6+Ltq+wLdLn36T+dLP3PI+N06414PCgAVqJLApv/bdsLxACX1f3tsLzSETOMQ8YF9A==
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381963ywd.40.1682638474836;
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id h190-20020a0dc5c7000000b00545a08184f8sm5137345ywd.136.2023.04.27.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:34:32 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Add vibrator
Message-ID: <ZEsGiERTqoMJVh/h@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:29PM +0200, Luca Weiss wrote:
> The Nexus 5 has a vibrator connected to the clock output of GP1_CLK
> which we can use with the clk-pwm driver, then we can use that pwm with
> pwm-vibrator to get haptics functionality.
> 
> This patch is based on Brian Masney's previous patch with clk-vibrator.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

