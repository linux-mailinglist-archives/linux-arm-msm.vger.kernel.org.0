Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6048E73D9A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 10:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjFZI2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 04:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjFZI2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 04:28:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9DA1B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:27:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so3190756a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687768077; x=1690360077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwqkeW3ZZPTqJTIZ+Cl9YLyxmGvASz7QiyF2BwVpXM8=;
        b=Nug96dyPAlYxDtafDI1vphRxcWndEbB4hVfXnHWQkRWtHgovThjDgOiAKTzUV0Wtm0
         2GZt9q+yKd6FfzoXGHGiSJcC6//2Sn07k71QxQCo99Xf/kAR+CgeClj//upGyyzvKcEc
         tHLjtAzQIkz/aUnf/D1H3LCeSx6gndzGQB5vR+1dl/wLYMYFJ2sOHTkC/HoaqBBTyZ/r
         x5+5IdY8vYi1/LDXNcXk601HbjLvnE7Qgc/nu1G2Rjkir6fBb5EOSj8jps3nHdCWLJFb
         K9ghClL4SG57+NQEl+aWWB/IoV6GmG0ul3fgD/dyLmOGmUCjtU923LNO8PCylZ1c8CKw
         i/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687768077; x=1690360077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwqkeW3ZZPTqJTIZ+Cl9YLyxmGvASz7QiyF2BwVpXM8=;
        b=EhoQvQnjs85d1cXKM3MpVbwrV6IWEkKmOiW6bM/paIdzkNyCENWrRsNXRz2JOmIE7x
         V6LjDx+cqePH15JYGkxK89+THcZvMLWC4QBNcJukzwo2SO3fRBLBAudaNOg40XtPxzgi
         kmiFBKs/zrBtKD4xIvMFri/lyflJjgjsW1d6J6rV5D6i/HRvR4ZnPlkUoquLHmQ9B1sN
         NsGB44sGmLdgLsy6BTbSTBZX9/j0JR6dkxF7uCFtSlCFdfjRvAhIopYeNt66u7wiA2KG
         CkphxY25VknwiR8g5nyU4fxY4pb/HY+kqiSCKxSSzJuUCRSO93jUk6Z/dILh0s6+tALT
         xxDQ==
X-Gm-Message-State: AC+VfDzPzykL9S/BrWGa8k1Df58wb7QLKlS2GWBArwGy4N+Q4lgw47tE
        2hdZvCS39zFhROoHMoqVyAgfnA==
X-Google-Smtp-Source: ACHHUZ6fEabVoAwNUS000CCde+ym+chv0Y7mKGE+yH+pF5sWW2DTTMjfHilixGBCTNreb2TYXlZQLw==
X-Received: by 2002:a05:6402:5207:b0:51b:c7fe:970 with SMTP id s7-20020a056402520700b0051bc7fe0970mr17105368edd.7.1687768076787;
        Mon, 26 Jun 2023 01:27:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id dy12-20020a05640231ec00b0051d95294583sm1467415edb.70.2023.06.26.01.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 01:27:56 -0700 (PDT)
Message-ID: <1f94de94-c5bd-738d-5fbe-907558333cb2@linaro.org>
Date:   Mon, 26 Jun 2023 10:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] dt-bindings: ufs: qcom: Fix sm8450 bindings
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Eric Biggers <ebiggers@google.com>
References: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
 <20221209-dt-binding-ufs-v4-3-14ced60f3d1b@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v4-3-14ced60f3d1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 10:15, Luca Weiss wrote:
> SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
> bindings and the example to match.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Reviewed-by: Iskren Chernev <me@iskren.info>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

SM8450 should be rather converted to qcom,ice.

Best regards,
Krzysztof

