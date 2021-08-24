Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961453F62EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 18:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhHXQni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 12:43:38 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:43903 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbhHXQnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 12:43:35 -0400
Received: by mail-oo1-f48.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so6709490oos.10;
        Tue, 24 Aug 2021 09:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hhHlpptcTpuZfc3ki276UoFwiPzlLWRosRVN+oyfAP8=;
        b=IUhjeaieHEkH73L0wCKrGWPW3kAQseqDj03NtXnVrIPhi3goqrvyiDN/V+HOApBqZR
         +Gcm7IQCiST8BMlqGMwuONbgvh8OdEDukbfPLmd3lxT+7mb9hjDXAP0iF6yvWlJrkHo1
         ub9uTOoZVmmwCD5DCajNektho0NwwE/yVlYSPRJJLZv+7poWYhp4kMYumfx45mF+7Bik
         K+ibLhf3JF+MguuREEhc+SzRtoQo8G8eK4+bWvAN5a89USLl+A5W6ZfcCZ0PtQmoZiTJ
         7i5u0lb11YKC7jGoDfYDGu+1/wT3BWIBtAmysCZfz2V67r3lRRt8CfogYcUTrcXXNmUh
         J6hA==
X-Gm-Message-State: AOAM5303FExdywcCIn03R/D8H420AJKQtQBitNl9hJjRNJ7ybIu5XRqi
        n10oER/MqzLEGtF6geBGuXkb0QUQ+g==
X-Google-Smtp-Source: ABdhPJzUbM12NadcegpKF8o+y4R9VXy4G6mc8UlumeZjQ6smiTwqh/STt1xCyu23cb/zQg+fqwPqQA==
X-Received: by 2002:a4a:ba86:: with SMTP id d6mr30812461oop.61.1629823370704;
        Tue, 24 Aug 2021 09:42:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h2sm2399896otu.76.2021.08.24.09.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:42:50 -0700 (PDT)
Received: (nullmailer pid 599895 invoked by uid 1000);
        Tue, 24 Aug 2021 16:42:49 -0000
Date:   Tue, 24 Aug 2021 11:42:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        jamipkettunen@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: aoss: Add SM6350 compatible
Message-ID: <YSUhiSiO5Wx//IaX@robh.at.kernel.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
 <20210820203105.229764-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203105.229764-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Aug 2021 22:31:00 +0200, Konrad Dybcio wrote:
> Add SM6350 AOSS QMP compatible to the list of possible bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
