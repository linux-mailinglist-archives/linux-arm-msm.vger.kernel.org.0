Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE7B6EC955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 11:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjDXJqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 05:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjDXJqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 05:46:31 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0F40E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 02:45:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94f0dd117dcso584107566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682329549; x=1684921549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MFXkgVpCP/1bbpvk371W/p2qFNZ62l76LxqdbpjYPw=;
        b=pexz5snrTLVLUJy9+1Rkx5LnVnA8IFqCUFnbiAaGiUem0VZX6DCBXEKWlPuZgbn2Jh
         AgeZpyprm5FqCGnZmORSIyuzmjohn50cupUPdxbAp5RqpcjFm4a5Pl8SYa6zaG1Ehp5x
         G0ynkphF5Hi1KrltzR+1/uQOEO+AqlKWuvnBvNaFhKX76GdVMyRtJxVnNXETemUOU6rY
         XBvT5qgmEMrr2QMT0JWpHQznbtvrF87rkakUNOfv624N9Wc7r6ss+hGNkV+qAd2Vgtyx
         58xJaXQJTtdWTlbx88QdRpew+LISMVQqhZiKjYGJOZDtFrRqTfuTEPc+a+PS61K7Vs38
         4cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329549; x=1684921549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MFXkgVpCP/1bbpvk371W/p2qFNZ62l76LxqdbpjYPw=;
        b=ShoAIPAQTUJVyluRctn5iRUgusjcfrhz/VVHnT7y52qgmvzMllSpIYlCkKV84oswNO
         3gvT5ACC1CAt4do6AmYp7ZId0+0LLVd/mDpmPQHahf5+Qk/KNNoagCRFSGRjq6MvJCpA
         1WTs9gUFZ9TAPZizZ1PV3OYOpJ+g0XO+xLNN1Z7Bdyw7ed2ZNx6cvHiP/lY6dwM+3j6H
         KuJRa3MwZrfOXvw3ben0fvFPBi/eHQemfGmQZuHGqicKA6v1zS9iFR8Sn8hj9fInz9rz
         1Btb8mQTl1LH5cv80e+qVFOEt/zf+wjrmgUHP23tDdC2m3yY5XSqmh0VPlqQWkdrKzFQ
         i64g==
X-Gm-Message-State: AAQBX9fqKi9QXfzfMrDVHo8RhPPpxDK1AApleuSPUyu5Rl3yEMi/uKxZ
        CsQ0lM6reL+C8x06JP/IgSM2aA==
X-Google-Smtp-Source: AKy350b7bES42d04i6D4v9CMoAzS13SI/cWDLB3UEV3BDuDus8hRcUfX0GD2TekhgGNZhKhzpwNQGw==
X-Received: by 2002:a17:906:a103:b0:8aa:a9fe:a3fc with SMTP id t3-20020a170906a10300b008aaa9fea3fcmr10033847ejy.8.1682329549394;
        Mon, 24 Apr 2023 02:45:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:fcdb:bf53:d053:3a52? ([2a02:810d:15c0:828:fcdb:bf53:d053:3a52])
        by smtp.gmail.com with ESMTPSA id w17-20020a17090649d100b009537ef8eb17sm5289845ejv.217.2023.04.24.02.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 02:45:48 -0700 (PDT)
Message-ID: <f863aca5-0acd-2eae-7127-819136cd78dc@linaro.org>
Date:   Mon, 24 Apr 2023 11:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SDX75 pinctrl
 devicetree compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <1682327030-25535-1-git-send-email-quic_rohiagar@quicinc.com>
 <1682327030-25535-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1682327030-25535-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/04/2023 11:03, Rohit Agarwal wrote:
> Add device tree binding Documentation details for Qualcomm SDX75
> pinctrl driver.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

