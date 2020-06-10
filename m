Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5E41F5CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 22:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgFJUTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 16:19:10 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:34312 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJUTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 16:19:09 -0400
Received: by mail-il1-f194.google.com with SMTP id x18so3301177ilp.1;
        Wed, 10 Jun 2020 13:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+7fw0gwma6WwGh0C02clyslbFs78Aamzj3agJWj1Xtw=;
        b=n5LSYvebpQz2goaEH0vypLOpcc1qDFT1Qysncsyy6kF5isSJqAHYFYwrE8Nwu+a+rW
         0YnPGcOJUH2lU9cK+W/C89kf5S/JvprETmO5ST5ex4kKa6tu9JGnzWz7OuxLmYnhKJSJ
         T7Tpc4NAvKKfhAqrloNIvUhG2cscc4C5fC7eBYQZbblE8NlJVcm7PZAD+cx/GR+g3klJ
         ruF5eXbiRZAP8/Tf7amxZFE7d1ftWAWFTQfqlz7FHEiYbl7iU6RzZqyiSOxfzYVVM/BL
         aX02QbT0dC+RXYntUmALeMEjk3q774z4FRh6BO/nztnwpEiOlgo6g2+uIB5VbH6PGnNv
         RG/A==
X-Gm-Message-State: AOAM531dLbrrc8xwdRgBQujrl43EpKK55ZxSwhveKbZY23p7Etv3hUfd
        DGziNUbiM3AHwXaxT4dHQA==
X-Google-Smtp-Source: ABdhPJyYVOrwxjaY3oV22Cl1+BuIuNvB5odiiMsSLbWg1ovHXV6CwdPtV3h9ZDUOkTLrC+urPlIfPw==
X-Received: by 2002:a92:190:: with SMTP id 138mr4468427ilb.5.1591820348328;
        Wed, 10 Jun 2020 13:19:08 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v3sm416408ilh.53.2020.06.10.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:19:07 -0700 (PDT)
Received: (nullmailer pid 3644444 invoked by uid 1000);
        Wed, 10 Jun 2020 20:19:06 -0000
Date:   Wed, 10 Jun 2020 14:19:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/1] soc: qcom: smd-rpm: Add msm8994 compatible
Message-ID: <20200610201906.GA3644388@bogus>
References: <20200602200407.320908-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602200407.320908-1-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Jun 2020 22:04:07 +0200, Konrad Dybcio wrote:
> Add the compatible for the RPM in msm8994.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  drivers/soc/qcom/smd-rpm.c                                  | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
