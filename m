Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43AB20A608
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406701AbgFYTmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406069AbgFYTmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:42:19 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF753C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:42:18 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so3884567lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RBqVnpfnVrl3Eo0TwToDu8x11M7fxl+21M8g4ZFsyRc=;
        b=qCKjj3/AaQfadF2MqDeWIU2rCcH6pnvafyTZrHJtL9EnOyUO3uVvExihLmMI9XvETl
         o7hubNXY7Zhim8aCPWrVw5MkAgbkyCDE3B6w/9wAIp0lMLwZhlhK/RhhAR/Ju8VJdWtx
         TM6RddLYSB4pRAfrcDWnLmwXs1xMZLJg/x3ULIJCJ/XtdTnaXdDC0d5rQSdUt08L0LzM
         y+qgJprN39qmuZl1tZHgLlQOaWmfvf1wsI3xC+bG32IGROcwhJPnOl9l9/zFq2toGQWX
         bCgXFUBOH8OyWzKt6PYjPwNSj3mDr5iVg7sffwtl1c6UQhmG13J5OXdTzACip7VWLX+r
         Mxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RBqVnpfnVrl3Eo0TwToDu8x11M7fxl+21M8g4ZFsyRc=;
        b=cebg5FXkaR95kmxpH2BCOTrlXRnay7lc8VhWmHJTwjtAZeG4ZqBNkllilFJ/FkMVri
         6lmuw9IDaPQhX/YU3oXqfHMCNQ8V6Stwzl7UJzHPZ5LMD5Y38/+ncnqtl01L7fbv+aSm
         8U0sgcdJfzO1sWjkiko3O9L3HQ8a0iRtkQlIkCPP24CDDw8IB2z0XxNdb7gh+UE21E/q
         uPbOO/mWX87EdVdpL12XisFv17x32bHB6huDpA+QS1s61/XTdXbSbfGRuq1czPCZmyMr
         FeajyHkasHAiTWuM3a7tcxhMwxHpfiW9tdTnzwA2CoswLN3ZmEb+e3/ybhYjrj6+eHXZ
         kMPQ==
X-Gm-Message-State: AOAM531qPuNEF5SjAjxtkQ9AA9shyeHQCO1xBFGna3Y8RoLzQk7zwuC7
        LSQgovIVujaKShYVy2S3ftJ9LA==
X-Google-Smtp-Source: ABdhPJzSOUisrMhM5vq2c+dSBqiSjCjDeE1j1fmo/G3ck5o2Q2Gso9ahJsOwn6621Vmx9QJsY2YGAg==
X-Received: by 2002:a19:c797:: with SMTP id x145mr19437302lff.143.1593114137429;
        Thu, 25 Jun 2020 12:42:17 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.162])
        by smtp.gmail.com with ESMTPSA id y16sm4985018ljm.19.2020.06.25.12.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 12:42:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] phy: qcom-qmp: Add QMP V4 USB3 UNIPHY
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-3-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4df0c6c4-985f-de43-8ecd-697e3062b44c@linaro.org>
Date:   Thu, 25 Jun 2020 22:42:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200524021416.17049-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/05/2020 05:14, Jonathan Marek wrote:
> Add support for the USB3 PHY used by the secondary usb controller on sm8150
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
