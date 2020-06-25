Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F1F20A60C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406461AbgFYTm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406069AbgFYTm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:42:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9963BC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:42:28 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d21so3861932lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 12:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qqOtE9pf+vADynm60513eX4noVoy/Y+X3v6nlzQzbtQ=;
        b=pYiQVql9Rw2juLICgPCa1oGJ7iBQQ4226I524m4p+uW6aOkcQrOckSzd8MlLM667j+
         Qla0189UJHHFDOGdFKtAy9MQh5kO34fAaSYqA/4XBbi9s+N145R6+TkOfUutfeA7DkwR
         2UPSdF9AKmz+y29uVhNr01/fqh1CXbeUckJ91jfQ/6jZ8M9M4tOIRs1v4r2xXXn4Mg4x
         y+Xy4tzBq4BfordUDR38y4H+6HQ/GZfHvQq/O3J4VTmYwlgBEnD5uobXkfb48T9IOYtu
         zrdNPo2yTwj2WCi/N9ip+y+JyVUFj3y9Z5ZANUycqWTQ+YWC1ZK37zaoiQqTkQWB1RKK
         GUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qqOtE9pf+vADynm60513eX4noVoy/Y+X3v6nlzQzbtQ=;
        b=lGoYFzg4i/RGbXOqqr/PJXzCGgilyAIZLDaqkH8z2ZWBmTq+Tg5BS1UKwQ4fCut48E
         6RgUmRofRdjrAROTkhK40pD7qiydOq5lPNxASkmdHHN4MXFz2AyQlBbR48B42XkCHD70
         hupqEXPaWXgVomskN9U6vy2jA11tsUk8PM5kAk03rXGpTEkuAZluNuIC4iUwhkXF0utC
         GSLrYh2mDX6EpaAcwgDVJKokof6miKq78r/E/57N2qmKFMj154jaG8vObA4jsdiyyw5d
         TJ0ZbGez+s6Fmg/42aNSJZ0Sb2Xg2Jc5+9rubIuurhlb0xXKQApj9NAJQxYPnFg1gLzT
         GE8g==
X-Gm-Message-State: AOAM531ZwiQsM9lYW6W0FYTLSij8EULudN/zAiBwRzHPYhhLScK/pQgm
        TwYjOmPJEa7N7etdddAKOFnidQ==
X-Google-Smtp-Source: ABdhPJyhkNBhO+MljMG+su9jY4L/TwP6XUf7v6nKmEa7JlRT+pUqOYmjpSbNk0AEtJteaIhp0/m6iA==
X-Received: by 2002:ac2:4550:: with SMTP id j16mr19306070lfm.37.1593114147133;
        Thu, 25 Jun 2020 12:42:27 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.162])
        by smtp.gmail.com with ESMTPSA id l16sm6158085lfg.2.2020.06.25.12.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 12:42:26 -0700 (PDT)
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add QMP V4 USB3 PHY support for sm8250
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-4-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <47e016a4-b7c8-e8c1-f9fd-b6b049e9e0b7@linaro.org>
Date:   Thu, 25 Jun 2020 22:42:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200524021416.17049-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/05/2020 05:14, Jonathan Marek wrote:
> Add both the DP and UNI PHY for primary/secondary usb controllers.
> 
> The tables are very similar to sm8150 (serdes_tbl is identical), but there
> are some differences.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
