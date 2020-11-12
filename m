Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720B12B060F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 14:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgKLNNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 08:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLNNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 08:13:54 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946C0C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 05:13:54 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id d12so5907312wrr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bo6b3plJGeSCfqA2TlRi1WC3RGLlmTiYJkUzuyFzqgg=;
        b=xqEnu3qOxGCBmIvnubq6qgbQFbZ1GALhsKcWy3ouPmFAnGxWqncXENS0E3AOCV/4+J
         ZDMV3iem5aUNFgb9zxQzPdO96qfck5iIHcs1je+WjE2DSXc334BC9pqMG3SFMcvEtTg/
         yuVD5XBeRhIdSwyjRHrf4yQW3rk/eqUvkIl4h6Ne11juJcsx+O1i7hZ9e3+CO0l5itft
         K3DCOwWVVAkP29iBXMUkxPs94dS/gxyICz5wV7bfoVg6Q92Onq0nSzbvgP/0B0UUKIMg
         koAMbzCfFK8Z2RVYcLIVKvncInJ/mhAeKnJCSd3dcpfz9JNQkAzEBrKHvCRZjCJ12xzX
         TMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bo6b3plJGeSCfqA2TlRi1WC3RGLlmTiYJkUzuyFzqgg=;
        b=JWYTx0+PvEs88XiM8VELewxNgxXq0ee2erG/KS3rYocCpHo69vzh/enzpUYWvnGGiu
         Akuw4gih/wCpk6Y7ijlNnE+FdRm7ljcMMCsnCADzoIYVE88hwcVMg2nh8jwT1sL/Lzfm
         nTjLEB7kRFwlE/JswZtbiQyG7z8SyHC1DuZIK8eemWuP9wk0Hw5wB4b9hbM6nhgp6A13
         KyAmXHLI4b50/x3ndQoG2qCY6P/Es+yzMP+beiOrZJCCB6mTd4D3KfCV1Xy9QnzGcCgR
         F7txzFBEaUcu0jABddc9UVdBZOXHHMTylpXWkKh7Z9Fnq6CGuMJdWeUNEDVaMTnuJ6rH
         lDAw==
X-Gm-Message-State: AOAM532T7LNS1B31SwEHRrhoBb01s01xDVesy7sAJxdAhSzaryWVwMB5
        VcsG9fJVGBy56RED+q4WUQ+uyQ==
X-Google-Smtp-Source: ABdhPJzSZTM0aetNvyM1aDGThFnDswNgJp25u/ogvbOp/15JLROiREI2JWpn1R9Gf3vaCpfyMX0yHg==
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr9205512wrt.348.1605186833116;
        Thu, 12 Nov 2020 05:13:53 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96? ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
        by smtp.googlemail.com with ESMTPSA id f7sm7379008wrx.64.2020.11.12.05.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 05:13:52 -0800 (PST)
Subject: Re: [PATCH v9 00/15] qcom: pm8150: add support for thermal monitoring
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
References: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
 <c943f56c-f72c-0f14-b6ed-b67e91573b1e@linaro.org>
 <CAA8EJpp+=sQAre+kCiDLEFT+gDB0wO7KypGTXeCDncO8wWzQ-Q@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a66e75c1-ce30-df75-c77e-e58e660f0105@linaro.org>
Date:   Thu, 12 Nov 2020 14:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJpp+=sQAre+kCiDLEFT+gDB0wO7KypGTXeCDncO8wWzQ-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/11/2020 13:41, Dmitry Baryshkov wrote:
> On Thu, 12 Nov 2020 at 14:39, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>>
>> Shall I take patch 1/15 and 12/15 ?
> 
> 12/15 will not compile without several previous patches, so it might
> be better to take all of them through the single tree.

Ok, I will take some time to review the driver and ack it, so it can be
merged through the iio tree.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
