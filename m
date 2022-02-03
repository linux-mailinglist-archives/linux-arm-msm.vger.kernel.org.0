Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FFF4A8F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240351AbiBCVLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiBCVLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:11:45 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EE5C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:11:45 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id u13so6104021oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oeVrFtNofbuB+ZhWlT8G/+fPgQFlWUIHjK7ZzXamo7c=;
        b=ne+1MfkJOr7+6oCtdJUKubGyWL+Yi2jn0JgXd7hknvEPAEUkqM/RLxnBG1jl3oAO8F
         Dp4O3Mqvk0Jt6Ygp+bg7JDT1EpihzKMH5Hyp2AG3HRs9oitrJ6HlEro8i5U9iqbE8qqD
         w2Ht8upFL4p7CWgL61nSfGp2NA/0Qio9bZDpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oeVrFtNofbuB+ZhWlT8G/+fPgQFlWUIHjK7ZzXamo7c=;
        b=DYHuugeEvcBShLGHIcXKHk9AOz+eIocrNWEPnl7kqJWh68Kn4uCgmmtoO6QEfg8Qng
         fr6KRDJ3wHXMoht7Nq1An+9RgKizes8VJyvpc51heleXX8xC+/tN7FkO3k0NsXgk/JIo
         D9IKznWJDrdvzKhuqG4dORiWeWVvHVBFtNqanPLb6VEVbbMZ31ubYQDfWEREUnx/W/FD
         o7WGTGKGuaGJMX25NZ/FZw7/VfMQ/Y3rwtlWLpmUY8CBBAYCA3IAcXnzYGFfXXXBASdw
         tmfNhkdfZi4/xnzT/KweASoTkbrW6J2YyE1tyA991kKlZgBHy/riYHFJ3C3lhYUyyupJ
         liEw==
X-Gm-Message-State: AOAM533fjjPU2c+CdUvdW63FjA68deKVrMm2kHxXF4qj0Te5jmFkImbJ
        I80xji1WzIh9uGTC4c13SWjnu03Up0jkkNYPyPi54w==
X-Google-Smtp-Source: ABdhPJyv0IcqnXzgrl8LRqLF1SKBlCAyRuYAeLd1IlwbuAFwWtMqsQNtnVTyMks5Sr3fK5G3hpBFUzpAYGm72xqRbUs=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr8672435oib.40.1643922704919;
 Thu, 03 Feb 2022 13:11:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:11:44 +0000
MIME-Version: 1.0
In-Reply-To: <20211218140223.500390-1-dmitry.baryshkov@linaro.org>
References: <20211218140223.500390-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:11:44 +0000
Message-ID: <CAE-0n52qs0fe2Cz2QChc0RmnddcWtuw-u1Q34=_Q7FVJSw=q2g@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI: qcom: pipe_clk_src fixes for pcie-qcom driver
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-18 06:02:20)
> After comparing upstream and downstream Qualcomm PCIe drivers, change
> the way the driver works with the pipe_clk_src multiplexing.
>
> The clock should be switched to using ref_clk (TCXO) as a parent before
> turning the PCIE_x_GDSC power domain off and can be switched to using
> PHY's pipe_clk after this power domain is turned on.
>
> Downstream driver uses regulators for the GDSC, so current approach also
> (incorrectly) uses them. However upstream driver uses power-domain and
> so GDSC is maintained using pm_runtime_foo() calls. Change order of
> operations to implement these requirements.

Prasad, can you test/review this series?
