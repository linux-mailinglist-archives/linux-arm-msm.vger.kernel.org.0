Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FA42067E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387634AbgFWXHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388200AbgFWXHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:07:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD5AC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:07:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u8so152124pje.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H5tzGK8Ul6tfg3isVDLVBRlbu5v0xvfY4n3qpqbH1NI=;
        b=S1bCy5X06OFaFFNIdeDnS6CSjZ0Kdws9KkQcI1YuKKPPow3kSalVMW4MVN0P19JhbB
         AwyXcbyYpdsEM0IJwO0xPhelwzn2W7jASJZYkOexxveaAuXUaOQ7uOYC3epePjn9jltI
         lQOHuHv2T0gtLYpuYpMD6zRC+9vwL20ElP5Wzq6u7sgW+9JZYRzA8J0252oDhAIqlTQV
         YGRG+RAWmh862PZuA9ECrmEd/GEZgSIvuOXjdL/U4x/3CEVNmrgL4lE7cP9xCS4wPU+4
         l/3Gd7jY+5Jwg2evxhfuSRirITpsFdi1WghwcFzvGhDy3v8kxAQYLm5j4qYs3m/BeTlR
         POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5tzGK8Ul6tfg3isVDLVBRlbu5v0xvfY4n3qpqbH1NI=;
        b=UQhbMiGNRcPNZZrgSrUPhtnh8oo72KHepGNI3M86Nv/d8v204qUnOrtii5GlcVKuuf
         SN0H7iM8y0/savYtWqNPj59AmSXinphs1kCmPbI8sYSbi306va1yx/ILEao/7K1/u4Ry
         9wqLhlrWpVGu4VlgUJZLFXGiBoNCQBKWofYZic2Ue7Z6E/v0376vsSYQQ4P9xUyIrBDm
         R+JQJXOpsERCm9PJeeBSuJ+fpi9brldD0H5P19ETRKwyNd+4InPnz98nXMNoBM27Ex2a
         8ReyrLZlfO1qAzd1pVdHIamKGHVeBq8N6RNQbG10YEZcnSz8mZ1Hme/3OuwaEiBfIJC7
         V2+w==
X-Gm-Message-State: AOAM533vhi7+UO7mee8ZSMzPpwK2hC7hgMsjWKRf3O4A72oENu1hXShf
        jaTynpa+vb0Z8VOIhy8rtbPc5Q==
X-Google-Smtp-Source: ABdhPJyJrZ0h4pT6D7zRuXMtMqWbxZWmhLKSGmNzOwnfxEQyboY/eJWM4/LcweJZjH+HF/v0xL4zQw==
X-Received: by 2002:a17:902:ac94:: with SMTP id h20mr2016739plr.197.1592953651691;
        Tue, 23 Jun 2020 16:07:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b5sm3307716pjz.34.2020.06.23.16.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:07:31 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:04:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] arm64: dts: qcom: msm8994: Modernize the DTS
 style
Message-ID: <20200623230448.GG128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-2-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
[..]
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 2 0xff08>,
> +					<1 3 0xff08>,
> +					<1 4 0xff08>,
> +					<1 1 0xff08>;

Indentation is off here and these are supposed to be GIC_PPI. So I fixed
this and applied the patch.

Thanks,
Bjorn
