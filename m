Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3681B26886F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 11:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgINJdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 05:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgINJdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 05:33:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1EEC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:33:00 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so12691966lfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1ukXh4E4C9HWubv5WEbFDBlcoGtdgyjZ7+sFn5yMCq0=;
        b=SX7KaW8Lj2XjbPVBroBk+4l+k/BIq4ET+lb2gLRiGJ7wweeQ1uzStDg10pxMuI/vr0
         +d2lu4hrI6k63wetkb5drC2w16tcWdDOwF6OiHL+cCwp6CShJM3Q5waXPtcb9em8P2Za
         TY37mbdNRkssKwzPHNmvIL3v3cjOmxKNfqTznI6dxpuVSby4KfIy5yzrEI3NbafmaLnK
         yXDsNEhEk4P5y94ItVUmAVhs2P0Q2dH1iFrRgoBqn+QoO9EZ72vpxGhWw+vptUbfmqLi
         eSlbaW1Zioz9GwXH5f9M8gObyOKuwe3wclj7wuBaUoYknBQvY1iCvcewIw04WHbD8G8P
         ckDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ukXh4E4C9HWubv5WEbFDBlcoGtdgyjZ7+sFn5yMCq0=;
        b=cu7PKdOyY2sUvtHN05z88vHSEOc/h7KIGQtDyt3sREolGxYY4xDomaVMiiUI7gJD7O
         gOw9ZFkwB8VeNqkhO8CcqAsgqlHs7X1ChkTT1yn4LpJcEr3g49rwEP6S9k3cfY7Zz9cT
         IymiDWZ0u54lxw04JT8jSzwkRIYwArlXZQr24HBA7R4VTwfwUAhwItNx1+pEvp6NyTJB
         DgrakGZXBsZyIGpAmy807anNaQojBMN4gk6gY3s6PJKD4Aih7iKQNkV/ZPjpQIlmPJ60
         8m/q/qDE8VYNTLwHRtHfJuqSVw22JSmw/ITHxSeQuTqv+MwPx3DukqVBNv+XJxlY6pT4
         sQ3A==
X-Gm-Message-State: AOAM531sEl7qH/4CJFavvB2q9Lm05CViHsw0LItawXqIzotF15PgMVMI
        T7NP86ykb3griXQ8+Of3ZlRHiOoH/6SkqA==
X-Google-Smtp-Source: ABdhPJy30YRlAG1Z12xbc3cBgQHgtGJUXj20vk5WFMRKcxPjteiD2sb0j9ZIOAGSxzT7RcY89NDhlg==
X-Received: by 2002:ac2:4d2e:: with SMTP id h14mr3810638lfk.541.1600075978627;
        Mon, 14 Sep 2020 02:32:58 -0700 (PDT)
Received: from [192.168.1.145] ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id z6sm3271811lfq.297.2020.09.14.02.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 02:32:58 -0700 (PDT)
Subject: Re: [PATCH] arch64: dts: qcom: sm8250: add uart nodes
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200909103238.149761-1-dmitry.baryshkov@linaro.org>
 <20200909103238.149761-2-dmitry.baryshkov@linaro.org>
Message-ID: <685388a4-e0a3-266f-1ced-0670720d264c@linaro.org>
Date:   Mon, 14 Sep 2020 12:32:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909103238.149761-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2020 13:32, Dmitry Baryshkov wrote:
> Currently sm8250.dtsi only defines default debug uart. Port rest uart
> nodes from the downstream dtsi file.

Gracious ping for this patch

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)


-- 
With best wishes
Dmitry
