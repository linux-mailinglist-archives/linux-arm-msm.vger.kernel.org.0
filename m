Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F1D199248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 11:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730263AbgCaJaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 05:30:23 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37882 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbgCaJaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 05:30:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id de14so24258924edb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cRf4XSMOaFJMe4go+8/QY1e2A8UYJy3i4Zzxrup/Gvo=;
        b=TCvC8IplBOkkC30T28VopRqymYOm2EFbGBHCP3eLUbu602822NIwK4+4dLt2mqYDTi
         w+kQjpM1NkbPdazJD9AhAZs5U737ydDNfX4/zSgrVMK9klM0YaPIIdCfy1wyfP2vZAgB
         U0kuWggt4Yldeb3LCZidaaAJW5VmrGPPLXthzX5AsNHP8jU0oIDlcmCiKwfaOTqnyqwW
         caCTpIc6iDfy9tQd0qpaIkPWyMYC0pnuKneKPzPO+UpJCS+eFtCXi1S+QYCrmrXezLat
         7buOEnP6awrLxpXkcnh5EKIIl6phVhG1mfn8gWhRCBJ8odlBJHcnBWwMLxLrZKKlfqBx
         hqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cRf4XSMOaFJMe4go+8/QY1e2A8UYJy3i4Zzxrup/Gvo=;
        b=bdgZjOfKEXxfavFoP5pexe69aZpHu3iV61TDcwjdKr1D9fsIlcBwPCGWUTWNZ/04XX
         AozmWEp0UpmTpJq1tFL0NTsk8CjOfGRG17ZRNLDfnvYdQuFCKr3fAzl41bapltwVIpNn
         GI6lMS86pbN1ujTxlvaM0HGMgDk9uK9owmoyDnDseZGnh6awUNDY+VW6eCBG7ZC+k8ha
         vzr0QybtzdQGIIhHQMfLuBjnv//zfh1Z2d2mryIUvi9YnoLyAnI2wWS12Yjv2o3BkVLq
         qOBjNWU36UHOmVwaNEufCHxR+PD37MM8cEZ5hjHWzEiGGU+WCrbJEtOTegnvaFq31kMt
         LPAw==
X-Gm-Message-State: ANhLgQ3YmhMvbBWHvdX/tjwQGbShK/+YlR2AfHvBOdiEbxsYQFqzM6bs
        5nHMkvyBuxBTGfzuISDo3Jh+kA==
X-Google-Smtp-Source: ADFU+vvGYvR25pBE8ZqwnJMdn+n24oyddUIhZdPZjNWvdjL9iMK/eUeZkt/q7655brjEjlcis9v7Sw==
X-Received: by 2002:a50:d613:: with SMTP id x19mr14653371edi.61.1585647021690;
        Tue, 31 Mar 2020 02:30:21 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u29sm2200201edd.47.2020.03.31.02.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 02:30:21 -0700 (PDT)
Subject: Re: [PATCH] clk: qcom: msm8916: Fix the address location of
 pll->config_reg
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
 <20200330204149.GA215915@minitux>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <b542e78a-9fa2-c7f8-460c-6cffa47d4ef6@linaro.org>
Date:   Tue, 31 Mar 2020 10:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330204149.GA215915@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2020 21:41, Bjorn Andersson wrote:
> So while your change is correct, afaict it's a nop unless you fill out
> the other fields as well.

Yes it shouldn't be a problem.

We cloned the 8196 driver and then started adding bits. In our case we 
need to start PLL3 and PLL4 from Linux, similar to line 3452 here

https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-gcc-8936.c?h=APSS.FSM.3.0

which does end up calling into the PLL recalc logic.

---
bod
