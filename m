Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09FF7650DF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 15:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiLSOsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 09:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiLSOr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 09:47:28 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3B410D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:47:17 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id v11so9295917ljk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLD8dux10p7Nk+pvZurTMiF9VIXyG4LPeFOVMPWpSog=;
        b=OSGTMrDX65y7EiwLUlUfxn7AzIWVAtzQ3dR/Dm9ainF4LRNRPeukjO0ZMYUvcawhkQ
         yNXOVD7YJD93xPyNUWQycq469k6f7Pj23jjCZNeyI+xI2Q8wbg3ShD3ZQCl/+91/Olse
         8msP0KmbjH+tYLdPI9kBuylJ8F4I54qXrmJsAjR7gSGhB3N8BIm5Fr+b2tqn7B7slqd0
         LeHsiuKjKs0K/vq22rixtgjrSnhnwHYDt6aWSAPbEU6sPMX5Bqn2ihv/i234eRKAvPnr
         rD6PAMdK0cFoQngGI7Y5Zn7BSoN2G3WtTUDNvk1hZZ3qXXj1P1QhmYZOGPqQRn+0jzmX
         +E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLD8dux10p7Nk+pvZurTMiF9VIXyG4LPeFOVMPWpSog=;
        b=3EKgSD37jLkcV7QnEXPz/Qq98xffNfrlMygR4v8eNeKmOrI4s78fpAUnIt0dYvlbzU
         i1hDO83rPzpUL7Y38TNlG87k4G/g38/H/0DS4QLdlkhm54D3bpRhl49Ri+iezhka1PSn
         xqL7ZzNtjeF53s9klv7pRwGf/JwKv1zc5QQMZk/Qr/fm5B4ePMxNKjBGvqoiEcf4xnbX
         kq/PaYF1abTf4JyP7ctxm6yPUkqh/uJ9IsWytvUrGb7wpmTI5t2N1YeD2m1NYWDbrsiC
         a7key6Qa2tGFP1ZMkfl4jSpDqUwsAGUvu2kKhrn4wOoUcv93tDJ+aA9i6WZaghwdAYol
         i4yw==
X-Gm-Message-State: ANoB5pkDeBLaMMrEkkfO+jtZQK3PIdTEkfeVf8pOlhCmn2NR5Lv8eFWM
        keA6iOE3BgsAsvk8o/K9tBNm2Q==
X-Google-Smtp-Source: AA0mqf6N/qTGNIcJCMTPTDJ187YNp5dHU2G+01SFS0ev4oRmQ7Uvy+x3GxqWos7gyqSwjG793Q0Gqg==
X-Received: by 2002:a2e:a406:0:b0:27a:3b74:7c0f with SMTP id p6-20020a2ea406000000b0027a3b747c0fmr11117199ljn.50.1671461235945;
        Mon, 19 Dec 2022 06:47:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y21-20020a2eb015000000b002774e7267a7sm763014ljk.25.2022.12.19.06.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 06:47:15 -0800 (PST)
Message-ID: <b3e3a8a9-9457-d546-cd04-80e5756cab2f@linaro.org>
Date:   Mon, 19 Dec 2022 15:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add wifi alias for SC7280-idp
Content-Language: en-US
To:     Youghandhar Chintala <quic_youghand@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mpubbise@quicinc.com
References: <20221219133303.20420-1-quic_youghand@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219133303.20420-1-quic_youghand@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/12/2022 14:33, Youghandhar Chintala wrote:
> Add wifi alias entry for SC7280-idp device tree.
> 

Why? Please explain in commit msg why you are doing such change. What
you are doing, we can see easily from diff.

Best regards,
Krzysztof

