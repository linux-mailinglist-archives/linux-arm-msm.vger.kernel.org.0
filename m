Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B3B7A9A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 20:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjIUSiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 14:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjIUSh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 14:37:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112355595
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:31:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31f71b25a99so1237289f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695317455; x=1695922255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEg9oi9fsFQj5N/t7+XiCLJ8W8KXemvDmRrScebryl0=;
        b=EuwVJEaKXkDowj8dS4ntC0R+MYGbylO576hvxXGuteUeWDYepx08bpKpC0II9726/Q
         SGSKZrHh/D0hS5kGtYDc9xBmMMWxv5IwxySIZaBV2xjSVtcmY22AQUesU9rTBHEQRhZi
         XcRSw0eysaN46JtJHFt1vVHcafYmpas3n4gM4CEOpEzZweBJPl8DOScvu0i/FOkOEUj3
         f234Po6KKXJgL1rFcRTA84TWd1nMJRgkG0I86s8WtFBTOOqkB6QgebatqKTRQ9TRlQFx
         AancP5FK/M8AMzgiK4Y3d94TCQL8ZEFx/xyP4ufDDm3tPB32aXsxtlXOPXx6xdwmVBed
         Ejcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317455; x=1695922255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEg9oi9fsFQj5N/t7+XiCLJ8W8KXemvDmRrScebryl0=;
        b=ImjmkQzVvILAZx0BaIoHy88FzjxRxN+pd0PuImeSBuPJZz/n8nnFcw8cKmaJ1jja10
         PkVJPU2pYWt0qDjfbBuXbo+2rjE7apXZwmlns4ePB+hVR/H6xWjDzRUPiVhgheLAmA1j
         e0eQqzUU3OQLouUGF75+msU6/od8CTNltKqZnbJGsVl95vwpDW+e6abzGH3xWHNjO6zQ
         NQKF6JlljbCX49IC+pOYjnO8NwqmVlKJrtZcYpVlmR062Of18qFwW7AtXTe4IX6Bz0Cg
         m3MRzjiNLF9Wnu7ty+wQlXoicfQQW4wmSFVIPYoJys7DKFv8y9PwkKHdtxwrqnO8B6vO
         zbxQ==
X-Gm-Message-State: AOJu0YwT8Y/KdCTgW1KLJpXJKWDQILdCmbFzWBy4Ebo38r3TaXh5c8g2
        GHc4P152qTMNH8xM4c/qi/B20aA7BMsAi8nkuNJSKg==
X-Google-Smtp-Source: AGHT+IHQrrrIHyHEDSkfYu9SO7d0pvsOVdZ1oGCXmoscM6UKG4H7ogFMpzJNut6Kcge3kLh4skQepQ==
X-Received: by 2002:a2e:86d6:0:b0:2bc:cc1a:139c with SMTP id n22-20020a2e86d6000000b002bccc1a139cmr4675996ljj.11.1695297522786;
        Thu, 21 Sep 2023 04:58:42 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090634ca00b00997e00e78e6sm931391ejb.112.2023.09.21.04.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 04:58:41 -0700 (PDT)
Message-ID: <707f3f85-d38d-f112-16a7-2c602c453298@linaro.org>
Date:   Thu, 21 Sep 2023 13:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: qcom,qmp-usb: Add SDX75 USB3 PHY
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com, dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1695291692-18850-1-git-send-email-quic_rohiagar@quicinc.com>
 <1695291692-18850-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1695291692-18850-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2023 12:21, Rohit Agarwal wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm SDX75.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

