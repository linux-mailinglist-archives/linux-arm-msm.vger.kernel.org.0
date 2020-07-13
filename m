Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637BB21E05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 21:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgGMTCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 15:02:14 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35760 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 15:02:14 -0400
Received: by mail-io1-f66.google.com with SMTP id v8so14682300iox.2;
        Mon, 13 Jul 2020 12:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qQzS/AJXhtT2zFSo3Dszdq+1pBzYrAwv1FvWox6CELk=;
        b=dQTDOBtLNZHIQg4QBFMjfS9xruSOU1/FQ85CSSq6Fav3sb/JWhhHvIaGahHeecYBnM
         KraZQvmjqSMdo6vELhEA1KoVWNl+TEtjNwHM5hR5Fatft5fDT3/3lPeiS/UhfCwAylcE
         u/QHKgSwSgiVFno4wAwGoxJ4YO4rFxJWj5TcnrPhuDbZCmXZGFG4GMndRRpV10WMOJ8c
         TjDFEb5Od/e1N0ARfq8CX0nKQrVSHIAnnbEuqKTyF8dadEYV/jXJ/GhOSuZjTeZ2y5Pt
         LeWiNXUy8IMDg6XjP+hDQAun4MiVHbws4s4wzz+HY0ACFH3+mmAtb69ZUWJk+YVIc6lP
         AGcA==
X-Gm-Message-State: AOAM530yRlg9WbhYzOwrQ1DCB4CGWUUnCh9bpu1Jnxge5RSeqKYnyhkw
        fuUufozcvhHd5SuRPUqROA==
X-Google-Smtp-Source: ABdhPJytBhAc3DwxVXCUmjelGBDFS20+Vt6w8NKXCrXG0T8J8vfuj3ou7uT/Q995peg/pQtJvSHxLQ==
X-Received: by 2002:a05:6638:12c7:: with SMTP id v7mr1723305jas.56.1594666932865;
        Mon, 13 Jul 2020 12:02:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a13sm8655575ilk.19.2020.07.13.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:02:12 -0700 (PDT)
Received: (nullmailer pid 546299 invoked by uid 1000);
        Mon, 13 Jul 2020 19:02:11 -0000
Date:   Mon, 13 Jul 2020 13:02:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-kernel@vger.kernel.org, skrzynka@konradybcio.pl,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Tony Luck <tony.luck@intel.com>,
        Colin Cross <ccross@android.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/8] mailbox: qcom: Add msm8994 apcs compatible
Message-ID: <20200713190211.GA546226@bogus>
References: <20200624150107.76234-1-konradybcio@gmail.com>
 <20200624150107.76234-6-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624150107.76234-6-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Jun 2020 17:01:03 +0200, Konrad Dybcio wrote:
> MSM8994 has an APCS block similar to 8916, but
> with a different clock driver due to the former
> one having 2 clusters.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
