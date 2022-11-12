Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441BE6267CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbiKLHtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiKLHtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:49:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668FE268
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:49:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g12so11496399lfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ip4CQbUOur2Z8auOo98Z8DR+uOdUvnl6ncRfh2kyCII=;
        b=bh/yt6zArCdN5ziU8NmNZu8cgH2NJ65gpkVTng+6UWgXQIbh4kWESXIxMe8OzKs9dK
         XMgliczUl3QQO7AKUkh54lVGaTMVUWVcrXaTVAtrororWEcG+Jxoh19TLPNUtJNs5jd7
         jYewpduAsjuywcgdv2HQDytTEGw9niWpkDWB/MDZZxunTHdLhuGt8yBE7iXfsIlzkyWb
         /dcsdzo9IRORDRf5x9Pk5v/oFZe4vJURPv9OZAxUYPcMBBfvdh9fyVA8G3EEyC+yKlL1
         Fub4iStp1ABEy+BjJ7I8d1nbPIuq9SyWXXuHmR9m4iMzBX11D4k2FJtKO8X4npCu3gLt
         8yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ip4CQbUOur2Z8auOo98Z8DR+uOdUvnl6ncRfh2kyCII=;
        b=dg5jG6GftLIGiSM9xRI/8K/hC90bFqeBhS+Qrv7x/foa6RUQ5liilmb4+RRioVANfA
         e7NEK2RJRyK2is9OY9O+QGTGhkLuTKYNCiMwdfhW7JdyCsJ3cRqjxZ9Csobz/vUR9CMH
         oSASwLzY4fb+6yh0RWK9v1CxL3uV+4BtvJYjjR2PLm/TBJ3K1beCypUO8iC4BjDaBZK5
         PyQzctl40BsVz0XQ+FICC49vlfvYQ/9MBPW4JpO1RojivU5nmBhTfsrqlWDJDah+So+M
         fCEaLdOrSQsFunVACZYpa2fsHNXRtfcSkG++xpJZbGS4OfvG1jZQb//4FIkDwFbW183z
         oOKw==
X-Gm-Message-State: ANoB5pmFbZGx9IWYfSbxZHrcgqRarT4Rw9vVuHqMaDt2vh1d+SNT86SG
        Ghyu+qvohAskAkkhViYc1S2f8A==
X-Google-Smtp-Source: AA0mqf43xUwIvzvUyPDv0Q3clCPGeMtgNl1ERzq5AEHoxIosoBwwdE1dpbE5Ve18pKHx1spyQh1ztw==
X-Received: by 2002:a19:651a:0:b0:4b0:a1e7:9160 with SMTP id z26-20020a19651a000000b004b0a1e79160mr1614933lfb.566.1668239352827;
        Fri, 11 Nov 2022 23:49:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004a26ba3458fsm747077lfo.62.2022.11.11.23.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:49:12 -0800 (PST)
Message-ID: <dfd3a8ef-6be1-dcdf-20bb-94d4c17a1203@linaro.org>
Date:   Sat, 12 Nov 2022 10:49:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 21/22] phy: qcom-qmp-combo: clean up PHY init
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-22-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-22-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Clean up the USB PHY initialisation somewhat by programming both tx and
> rx for the second lane after the first lane.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

