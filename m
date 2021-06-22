Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21793B0D1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhFVSqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 14:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhFVSqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 14:46:06 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217F7C061574;
        Tue, 22 Jun 2021 11:43:50 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id p10-20020a05600c430ab02901df57d735f7so2408172wme.3;
        Tue, 22 Jun 2021 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=ij57y9QyVqsVZQZ9EmdKCd4tPPR9xvNugibrUiD2Ezg=;
        b=Y4rQxoyxHm9Dku7wvmmKcJxmF4PD70ImFadzO06BwY+3YiBDBj1sSpuNHFtNPVtlnL
         3Mda7mCX/XVcvnz2oQpt41nhzN04PDtfySprgCT8EFaWQXyrzRV/TLYYQjGZ6JRRMJbn
         b68/7hjhDWaTKUsNmA0RSbHDSlZu64fy6j55wE81NnUiO42lpY07QKBeb7t0YxtFdrBC
         H+QM1yu8ca1mILKsxv+vRw90ZsLC7DAqMZW66KrCF7ylCeCnNmQ1LGsEjKjfTyqSfhQE
         2OREFbzoN6izXe6Z/c72t7Jnd8hYJBV5xuNhv2FlU2ewkyeP89rg/odUFpdu7+xt33cS
         P4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=ij57y9QyVqsVZQZ9EmdKCd4tPPR9xvNugibrUiD2Ezg=;
        b=a7pal9KGFcZrNxswi4teVWM+h8XjEIBmCwrx5AGv9sAKbsnvZ9l/ndAo+DsiC9DEou
         7ch3GiJEcRgODA+kZJ5laf0HhZQGEsI/V+0T/1lCPocQTLMzlsrItHRLbEZi9PDOlMPl
         l9RKVFOt/rbaiuSsVerNVBs8EowPGZzMhgrcTCz7RuB7C5/8YwGX9Z2wWTItlefuySbZ
         otAhG3iyR6QjHEMUL8yTzYMbb9xUZuAn63BDpQAMxTsZ+6oWnPpZagmn/4smp+MFCJXJ
         KJF7L+U4vzBnjt8vtuAvnBv/tfSSFmu0WgQ5iBVmnHkFeRQBfbFgvjP9Gd3WgpmTEJpH
         7Tlg==
X-Gm-Message-State: AOAM533fwpoM8s/JCzZjt6tuopfb2M0MqauW00Ve4RI1noMf0t/tBHQl
        K45m7AHXFCjgYduZ3ssJhX4=
X-Google-Smtp-Source: ABdhPJwjJSDRBScEE6dQC00xM4RUvb1vZW8ttmfYbsu3P0B9YpoFFLHZnMyptDQaGavR+KLL5eyg9g==
X-Received: by 2002:a1c:5413:: with SMTP id i19mr6459260wmb.12.1624387428745;
        Tue, 22 Jun 2021 11:43:48 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id x18sm202418wrw.19.2021.06.22.11.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:43:48 -0700 (PDT)
Date:   Tue, 22 Jun 2021 20:43:44 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: msm8994-angler: Fix
 cont_splash_mem
Message-ID: <YNIvYJpxpuXOr22R@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210622181056.27632-1-petr.vorel@gmail.com>
 <de10e844-b4c1-b3d4-cdd7-1491335285d9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de10e844-b4c1-b3d4-cdd7-1491335285d9@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

> Ah yes, I think I know the issue..


> Angler's firmware (probably Huawei's job, but unsure) seems to make IOMMUs (another guesstimate)
> not report where the memory is allocated. If it's an issue only on these boards, I reckon
> it would be better to just add


> "/delete-node/ &cont_splash_mem;"
Makes sense, I'll send v3. I didn't know proper syntax, that's why used
memory@3800000 instead of alias.

> in angler/bullhead DTSI, as other 8992/4 devices seem to not have this issue. But as I've said, bullhead could

> probably work anyway, but if it doesn't, it's probably Google's job after all..
Although bullhead is from LG, it might be affected as well.
Hope somebody with this device test it and send patch if needed.


> P.S
> I did not suggest redefining the node, as the memory@0 is reserved for SoC registers
> and your firmware is just playing tricks on you. Your RAM starts @ 0x80000000.
Thanks for an explanation.

> Konrad

Kind regards,
Petr
