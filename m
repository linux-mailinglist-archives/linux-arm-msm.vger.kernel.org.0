Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7812A336BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 06:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCKFcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 00:32:20 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:36607 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhCKFcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 00:32:10 -0500
Received: by mail-lj1-f170.google.com with SMTP id z25so552648lja.3;
        Wed, 10 Mar 2021 21:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=RiROpEyznFr1DscZ4+yFU5uNuzzwZqDw1ral9tCx3AM=;
        b=AGgNhD0HVaUGaKZnxorP5nv7FP9CAwlrCnqHCJUg6L0JHr2Njf8dyUV/+PFL5J3HdO
         44w7f1ItUOgaMZoOEH45BVLWcB+ixrG5QQmQmSwqNOKEzwuYUXZLt/+BAEEXkb/PL/H/
         9g3jno2gzn/DvOzFQKw2GTW+mrZsnXSDIojdsJ5aiOW5PYWjH3g72oZN3kk2gUC1Jo1P
         RzhNjA3PXupoWH/yAySmUtlDaGdX36Gd8cr32EW5JsaBtBnYgGrZJfjmCV/hzgaOBBq1
         zpK9/W3feMpF2AjA4xoYngJNs79Mq7iPyabwbBj0OOKc9JgEp0L53BhTIdknZSYPcwt5
         a2Fw==
X-Gm-Message-State: AOAM5308TvGqm5E2mV/W1kg7YRTi8vb5xzfuzMPqwX+jZIdrJm9Gi31m
        fryxvbkWkGlu8n3JTfhtKN8=
X-Google-Smtp-Source: ABdhPJxWZc6rVmvoCwZEhYe1iDvpr8ysupf8L4jWJuKSQaFpNnubov7T8AoorZsQ3FdZGXOBGGtxTw==
X-Received: by 2002:a2e:3913:: with SMTP id g19mr3459509lja.294.1615440728958;
        Wed, 10 Mar 2021 21:32:08 -0800 (PST)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id g26sm604523lja.10.2021.03.10.21.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 21:32:08 -0800 (PST)
Message-ID: <763406f888de18df462fc5533230345ac3d8a4e5.camel@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v2 0/7] Extend regulator notification support
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 11 Mar 2021 07:32:02 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Peeps,

On Wed, 2021-03-10 at 15:07 +0200, Matti Vaittinen wrote:
> Extend regulator notification support
> 
> This is an RFC series for getting feedback on extending the regulator
> notification and error flag support.

I am sorry. It seems I've sent bad version of the series. This series
contains some untested changes squashed in. Please skip the review for
the v2. I will try to fix the mess and send v3 when I got my git
branches sorted.

...This is what happens when you suddenly pause work for over a week
because it starts to rain in the kitchen >.<;

Best Regards
	Matti Vaittinen

