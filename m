Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04ECC7BFABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJJMFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 08:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjJJMFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 08:05:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AF599
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 05:05:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50585357903so7446921e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939520; x=1697544320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pokStYMDFDRvYsa5xe9xzjCMtzvcpQsjPKyHOxO1S3k=;
        b=B46f57eI6pBV7xbhbvwKH4p+uyRgPnbdV1rMcZ6iqkp0zKc69ibfcm3QMcFdpZ5iZe
         ywp9J7RbSiQSibwgc1d/jKUsckCfU1S2iuFTy2OIiH10sb5CX/Kxz0rjkSJHcn0OAH/4
         rWJLtF7HtLP3Sj8/I68zePIqicxwG3eXXD4EfXSgN2emOps+ARYLx41q+rGQMCLeMYIN
         n21HkXjF9gfKYpAhEl94e1Z2FmtN82j4s0U9OLvghnb2OWUDlVTQBCN9/18nsmJTnT8Q
         hzwyKOLjifLFQDK6q9MLL7CyYkQiGazIdyp2GwgL00CwyiHU4Usf6p2ZTzCw7e2q2jN+
         aifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939520; x=1697544320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pokStYMDFDRvYsa5xe9xzjCMtzvcpQsjPKyHOxO1S3k=;
        b=nlhjIABMbi7Dl4i9swauKkHI90ypNKQXi1ZGDLonobgLnxyuEvAK2s94XkAj9PIirY
         4nHWFH103Q1orzLBgeeSNTO1vza8rAs32v0ZbkRoqm2xlR7PDAQPtI+a4qfEqRp6N4zD
         +jY6ei5C0JaeOPbj5H7JofNP590c/ScGUdLtMaCg80hTP4s7lFVBA/2ktsjLQimN9yhh
         6YoXF0oBhP0ZAn5VOjAwrlOnU9aAqAI7BR1KCdUDkYWW8RA/RYjVnqfCrW5xm2zYSo+a
         f/gBsT7kUk5aXoMXP1wBMiusI4O30Is3vF4VVZfEnrm5rpsRN4vACTE6sq3W9EYeEZt1
         gqag==
X-Gm-Message-State: AOJu0YwGuBUqnsrfhW5YfOg6KNm+3rzBi9pJBcSWcpV+WgxNFfk14tbe
        THLTs8tZNZ6Py8d0JrsqJse5Kg==
X-Google-Smtp-Source: AGHT+IFaKBupOOKe3q0dsFxnIDxmHu7fHWGOSecpE6w6RECCPhgXqhgGmvxuhdiayv2olOh1/gMu9Q==
X-Received: by 2002:ac2:4f0f:0:b0:500:ac0b:8d58 with SMTP id k15-20020ac24f0f000000b00500ac0b8d58mr17158472lfr.18.1696939520423;
        Tue, 10 Oct 2023 05:05:20 -0700 (PDT)
Received: from [172.30.204.192] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25a01000000b00501c77ad909sm1785227lfn.208.2023.10.10.05.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:05:20 -0700 (PDT)
Message-ID: <f3a100f7-a876-45d8-a3b9-e64b2ddc33d6@linaro.org>
Date:   Tue, 10 Oct 2023 14:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: don't force usb peripheral
 mode
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231010-caleb-rb2-host-mode-v1-1-b057d443cd62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 12:46, Caleb Connolly wrote:
> The rb2 only has a single USB controller, it can be switched between a
> type-c port and an internal USB hub via a DIP switch. Until dynamic
> role switching is available it's preferable to put the USB controller
> in host mode so that the type-A ports and ethernet are available.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Fixes: eaa53a85748d ("arm64: dts: qcom: qrb4210-rb2: Enable USB node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
