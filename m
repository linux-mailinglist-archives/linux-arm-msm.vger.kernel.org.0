Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333422D3753
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 01:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbgLIACV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 19:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730366AbgLIACU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 19:02:20 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DF9C061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 16:01:40 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id s21so196245pfu.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 16:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IlcbnJ0w3R+raMjtafxvAzYGmc8w8Z5llSlkQt901bM=;
        b=nyk6eQgHhGSw071rTSS7MzO4THWk1VUrsRI/LHpf87JsjEQzsqgPeJlpnG+Hi4W6Br
         85UL+4mXvVvl37wJWbCgGKcTIN3sAzcxlsczb1vzy/GdWovHnnDqyygu1x/iLbrEvB9i
         1lkfhmEYOJ+4MR3l8WWlliON1fsd0GJ7eDhp+wIXNBNm9/kxSrHgnaQ1ISfUkZkF/rUm
         Bb0KCIR+NQj96+8B8tj5PoLbmCTDB7XO9BtH819J7b0E8WXSjUV4uDYyI6owO7RlLLY5
         WOaOKFe4QHDUE/oaEmMpY5vqRXqx8E1P7XAgCv7DqMWsAs9aoW/v0NSLfPX7WFkAkHMF
         wqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IlcbnJ0w3R+raMjtafxvAzYGmc8w8Z5llSlkQt901bM=;
        b=YaIg1WcNR1q6V/9gFYXQiL4d7bLRtXO+NwV1kONtMk18cl4X3ji9VqXc5x44end/Au
         /SyFwBSAasQWfEdj3RZ5yIDYpYCUd8FEes0OdhM3kLz+B0b2dzvPd7EEQyds/zcWMW0h
         Pk5T6MssY3r3cFx1SDVJdbOt9HyldD8p0TtenuEbmRWmV0M4TKwIOrY6rVmCRYRygX0h
         I90S2wyK2M++7OhbtRgPgcUIMCl6/qPZCWhxuBkDBcNtiJ7xoqhNWw64/Gnm04CINnRn
         v5WphkkxrVBTcdCi5bRmC0oTPQ51YZA6+LdH1FLbrbFqjmDJluxRGUQaFieOdkoYnsyB
         wh/g==
X-Gm-Message-State: AOAM53323NSyhGRRipsUWvFttXCASaGhPU4CYPXp5fpRReGMqJTg3e0z
        Y5eEA1ch+tbjYM3VEsrow76SNg==
X-Google-Smtp-Source: ABdhPJwCARYoRL9G+IP7htAPzDlrlYCs3aFvtjKiyWGKHZBF8E3q9b6+koRUn49SD/YXs0ZaalRNOg==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr13184pjp.68.1607472100086;
        Tue, 08 Dec 2020 16:01:40 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com. [35.233.137.154])
        by smtp.gmail.com with ESMTPSA id y189sm302341pfb.155.2020.12.08.16.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:01:39 -0800 (PST)
Date:   Wed, 9 Dec 2020 00:01:35 +0000
From:   Satya Tangirala <satyat@google.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fscrypt@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neeraj Soni <neersoni@codeaurora.org>,
        Barani Muthukumaran <bmuthuku@codeaurora.org>,
        Peng Zhou <peng.zhou@mediatek.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH v2 4/9] mmc: cqhci: add support for inline encryption
Message-ID: <X9AT3zULeDB+edNj@google.com>
References: <20201203020516.225701-1-ebiggers@kernel.org>
 <20201203020516.225701-5-ebiggers@kernel.org>
 <X8t82HijJtbHVyLM@google.com>
 <X8vMZBSP0hQSOqlA@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8vMZBSP0hQSOqlA@sol.localdomain>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 05, 2020 at 10:07:32AM -0800, Eric Biggers wrote:
> (Please quote just the part that you're actually replying to -- thanks!)
> 
Sorry about that. Will do so in future :)
> The comment gives the typical value that is stored in data_unit_size,
> but yeah it's a bad comment.  I'll just remove it.
> 
Cool. Please feel free to add
Reviewed-by: Satya Tangirala <satyat@google.com>
> - Eric
