Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873387D1EB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 19:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjJURsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 13:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJURsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 13:48:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB6811B
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:48:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so2511348e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697910488; x=1698515288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USibswDTLV5hhcZmfwN5wG8LNAeE5Zw2XQaGAnkihLs=;
        b=VNN02FtCZqKyG+jA86PXq8MyUCC2wgcBZf4BjMesMQC4y94wz0BqAi7o4T1he/Iq8J
         vMX5IywG/ULd5cJBNAC299Wq0o9u6Xrl+PoJCXakH3W2VUMvtSbBhhYHsy9enCKGcfro
         7HPu4Ip9n5NwRm1PjSYh1T8xHEk1Cg6t553/uNSPm/go7Kkv7EKayXSXv1bJCPBrrRzM
         GkhzUBUpEQ8VgG0A7/M+snksdcPbm2PI+5Wj5G4hr2Tw++5o48tKR2geHBgzmtS6xlC5
         GwkcGyDMnsqYXS3IGa+AMXBqwEeYGufjTIJ1Xskj3aXTODH8IoOc8nnnzRALesYhKrAg
         sLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697910488; x=1698515288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USibswDTLV5hhcZmfwN5wG8LNAeE5Zw2XQaGAnkihLs=;
        b=r7Nv32W4X+txAr0pjZls3x7+oZEBDu29fl7Z5Y+vVZP7zIVyj+gLSdyKypSwW+wiLl
         xXepIvWIt2dDK4sVAA3UQqMMfUIJ7OdyVhq6LxpeecSJhEMyWvuITKs/UmVL48ZFNP7a
         y/jHIGMKPtPrsGvcZjJYkGgS4TVFfxp9CQI6BSnPl/s3Uq3OKV4lTOhjCM36O4Xjefbo
         7rcef2VeqfZxNc2HU4DhScgesCYDDhLpvIbezEtddZO9g+qMOFSgd4JaWUzxrfTsOqs9
         fyQ7uwWMxFi4ca2bLzYNShimCdytZMJe0oqWPVgQ5jJyRCWrc/92WbzznAYinrs+HdAV
         p0LQ==
X-Gm-Message-State: AOJu0Yy4DQ1ttPg8Mh/sIMyPwamiBNKHt4Cmwr6IWYjjl2abRGM6OSe7
        ETbI7HqOYS+HET8ms6TEsUM7vA==
X-Google-Smtp-Source: AGHT+IHTVRoSS6yO+9sgzU02SfQJ15ZB0Hj1Y7XN1P7chtA/q9VuZxPnVgkf9XbYeIQPlxCaC1+JNg==
X-Received: by 2002:ac2:58e2:0:b0:500:99a9:bc40 with SMTP id v2-20020ac258e2000000b0050099a9bc40mr3174599lfo.69.1697910488571;
        Sat, 21 Oct 2023 10:48:08 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b00324853fc8adsm4061505wrx.104.2023.10.21.10.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:48:08 -0700 (PDT)
Message-ID: <a45a4bec-d675-42fc-b17b-a49f316ef5af@linaro.org>
Date:   Sat, 21 Oct 2023 19:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] pmdomain: qcom: rpmpd: Add MSM8917 power domains
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231014133823.14088-1-otto.pflueger@abscue.de>
 <20231014133823.14088-3-otto.pflueger@abscue.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231014133823.14088-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/14/23 15:38, Otto Pflüger wrote:
> MSM8917 uses the SMPA2 and LDOA3 regulators provided by the PM8937 PMIC
> for the VDDCX and VDDMX power domains in voltage level mode,
> respectively. These definitions should also work on MSM8937.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
