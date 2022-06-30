Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2192B562147
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbiF3RaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiF3RaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:30:07 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C5B1EACC
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:30:05 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o16-20020a05600c379000b003a02eaea815so2981594wmr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rBlnAHZeL5VXmWVXaof16R/ixBz+W8sUAmztG7bWwdA=;
        b=K/Dd7SQmYF1n30wjzfyn+wicHPLnbgHBONWFA8yAzv5u7Fky/uX0TGZGQaO+6dFuom
         awxlBLCLS0X9hQhgqJoAMg6wxGndw53pbu69G315tkgEUpHyFbeY3Vpkjirw3+vb3tsw
         kNoYgqP9blq7fPXcJEIZzxuE2kCGoQrJMzxEMeOs6A1FPTa++hVZHHveIt8jEWbTf5Vt
         sCpqz0irESo8uEhacBZmzgdgVIJPeRrkYnCmhBNcXs7TrBn3tDc7J7VYMcCXHCI2wxgR
         oQdua2yioRJKcxkhcmgDSVtH8LOas0DUeKKZe0WnAmVmagyolaBzbSzPqiudslvlVrnY
         sdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rBlnAHZeL5VXmWVXaof16R/ixBz+W8sUAmztG7bWwdA=;
        b=gMcErCNxmghH2hxUNbWTJyrzbhOYTBvDdHbOGx2O/1j0DvKshf3saGjSRXb+ZQc256
         NjDw2MXmHAQBkaKR4r3Pr1IikzMy3yg+5dROLYt7wjEApog3gtQT944RRCntti7XF5dL
         sZi9Y3T2YbgfW4lhGPoXJM6+ObQbqdc3a0dhqlYqZXK89HfdAGzhiWCgceQwm/5H2902
         mGUDxg5b0N3ghEYJYKHv+Pi9ecAo1E9477YiK0bJH86do9+5u17u24CtnEVos7B6fgw8
         tFxei90Zm9jtjkLr/XcjhOxQhga5LhZrUeO3BWfyS89R0HZa99riGdsGuxAUlWI9tFaT
         EGww==
X-Gm-Message-State: AJIora8CWDxkOwzeouQKRbEgmADwqDnozVQ4jIiXN+Vueqarok2BIy7t
        0fH55yHqhftlh8kqluGp9HNC4A==
X-Google-Smtp-Source: AGRyM1tLj/vYf0am5BBMHwtKy2IXo0Ez0eVYfADzx1DrAlAhLtgm15DK4/UdzX7sr7zxKR5O2uYPJg==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id l20-20020a7bc354000000b0039c675321f8mr11578038wmj.113.1656610204470;
        Thu, 30 Jun 2022 10:30:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w24-20020a7bc758000000b003a018e43df2sm3323922wmk.34.2022.06.30.10.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:30:04 -0700 (PDT)
Message-ID: <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
Date:   Thu, 30 Jun 2022 18:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
 <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 18:16, Dmitry Baryshkov wrote:
> 
> All three descriptions are the same. This looks like a c&p issue

Those are what the previous values were.

I'll come up with something less robotic though.
