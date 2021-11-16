Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448BC4531A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 13:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235832AbhKPMEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 07:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbhKPMER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 07:04:17 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0DAC079795
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 03:59:32 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d27so37096891wrb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 03:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/m3XZ+G755BzYmyP/Uv5a29EFHr5uHufx87wdpq4QvU=;
        b=j35shWlUzCoLEt6NJm3Km7KIwcCLoCsPAl2FbcCE5rg5j9BuEdgXsByDb8WakSGCIk
         N13VB0q93qRbwXKlLPh1spLzexYvGgXil4xEXUYnypQS2RkzpE7f8A0Yaj/aR6IvA+uR
         yKZUBDdlwloQRTTAV1+osJYWQ6cVQY5uWZ+dv/Z7GqG2IdsIJM4H8jXRvrUgpdglz5o7
         1mAS+l5e7bEqbW6iOML5lIl1MdRGMTTeTWBdXMwrP/jyK7uUkTJzbIXXihnf9pQMGlDq
         aXSXP/tvtk4LWJwCaQC75/2hOLAKXtq6OvaRJCDarN1q4WM1uA3kaPCdmKEhh44d7Tci
         7v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/m3XZ+G755BzYmyP/Uv5a29EFHr5uHufx87wdpq4QvU=;
        b=1NbSStUmfh0jzIEUcVF61QEX+JcEaQEpGURPCWKK0GM6im/Y8aKxbkrf0Dsu0y9tp9
         kXUM3chQHay2QiLEI1Je147iPZDXGJaiJBrWf7dFXypeUbwbv/06xXnUAxFNVgA5wn9s
         91TkKrKjlRKKJAmXy7Cx70XLgg7K/tUJWaETWSe5ga2m4wgrVb+uteEVCdXv9WTEZiYj
         8Z/W3fQHcxCXN4kT4ZnJFK2mCI7WZz3RjgJ/mRsCfFDkLhFQJxER+ymbHflruLjp1Knn
         6WfIapc/q0NPsixJ1CqFSYxUYy3P+xtTBFrRBtiC3Olg6jzwTiie2fyP8szbZ6Vomfje
         MXIQ==
X-Gm-Message-State: AOAM533I8vyITwjUWUCLajLNgxc1ajSU8hQ88/pPw+DOkKxD+Wkc6Nyq
        KFrPbcq2+TdpEf/oQj1LZGwSpeGYqA39XXzz
X-Google-Smtp-Source: ABdhPJxICF1XvB5wZgxx9tEtO6Rvw+3x5bCBvlS1icpkxMJcnydKuWqlRc2CVsku3qMUBfUnFy1XYg==
X-Received: by 2002:a05:6000:2c7:: with SMTP id o7mr8731977wry.62.1637063971322;
        Tue, 16 Nov 2021 03:59:31 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h15sm2253427wml.9.2021.11.16.03.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 03:59:30 -0800 (PST)
Date:   Tue, 16 Nov 2021 11:59:28 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 5/9] backlight: qcom-wled: Override default length
 with qcom,enabled-strings
Message-ID: <20211116115928.yhabka5uaha3cyec@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-6-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 09:34:55PM +0100, Marijn Suijten wrote:
> The length of qcom,enabled-strings as property array is enough to
> determine the number of strings to be enabled, without needing to set
> qcom,num-strings to override the default number of strings when less
> than the default (which is also the maximum) is provided in DT.
> 
> This also introduces an extra warning when qcom,num-strings is set,
> denoting that it is not necessary to set both anymore.  It is usually
> more concise to set just qcom,num-length when a zero-based, contiguous
> range of strings is needed (the majority of the cases), or to only set
> qcom,enabled-strings when a specific set of indices is desired.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
