Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C4932FD76
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 22:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCFVWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 16:22:25 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]:46409 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCFVWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 16:22:03 -0500
Received: by mail-qk1-f172.google.com with SMTP id a9so5660461qkn.13;
        Sat, 06 Mar 2021 13:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E7eYftR2wMfewj1sTXJZYikKAn2RMMlfLmgDJ6YQCRs=;
        b=dnMBOb5z1nPZEXtdcq/2LlK9irRKvrOtiGns1veD+IW8zQFTNG4SyT6ebkREdBnM0i
         29Xz0UNiwk2KJeMCDZF0Bz6MYo+Gr4pea9YwGKMot6ncY6kRYgZUznMwPewukOAZaSTR
         mAosfh7Bi13E9MvLVm6ux/WOaI/0fVuolTn52lkWwssr5lJhbXrRyJQTqkhB1aPMJG2z
         pgRuxL9w7yiR1sIgYu5jJN8LWPGlyd+5nfa3IF2ay4Mc//G78fIU/QoKFcZbEa3vE7Ys
         +/vJhRQRPS3f5sMJ6GOX4h0kx3p4kyR0h+FbBQkBDdyvbI5NSHTDwLvpeS586vo0gfcT
         AelQ==
X-Gm-Message-State: AOAM530XSEItXExVeksymnGiswktt5X7gmkJGWo+XA9AYihcnuXDIPX5
        SU7aR1fXErVt6J/dfpWCPw==
X-Google-Smtp-Source: ABdhPJzrIgAu0rpWZvQNOf0zfohllEMJAadakNVhLzWYsX5BzsN0CU7JxK7dqON1CD7XoeW+sFDoxg==
X-Received: by 2002:a37:a715:: with SMTP id q21mr14577025qke.309.1615065722395;
        Sat, 06 Mar 2021 13:22:02 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id m21sm4518002qka.28.2021.03.06.13.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:22:01 -0800 (PST)
Received: (nullmailer pid 1233861 invoked by uid 1000);
        Sat, 06 Mar 2021 21:21:56 -0000
Date:   Sat, 6 Mar 2021 14:21:56 -0700
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        martin.botka@somainline.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] iio: qcom-spmi-vadc: Add definitions for USB DP/DM
 VADCs
Message-ID: <20210306212156.GA1233807@robh.at.kernel.org>
References: <20210225213605.117201-1-konrad.dybcio@somainline.org>
 <20210225213605.117201-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225213605.117201-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 22:36:05 +0100, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Some SoCs do have a USB DP/DM ADC at 0x43, 0x44.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
