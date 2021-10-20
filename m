Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0104346FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 10:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhJTIgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 04:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTIgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 04:36:17 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705E1C06161C;
        Wed, 20 Oct 2021 01:34:03 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r19so13397685lfe.10;
        Wed, 20 Oct 2021 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=lhlJC9eINwtf3OPi5fDRUQ5o8RilMSHMkBZ4fEM0caE=;
        b=iX4g1pCFVllFCpx63AQ86dbyahwxdCqygPhUx28cGYjP2ii5yZmdDXvPa7qNdm6V9G
         9arAuTVBQlTZVYOKBWPxcZsi37ylXoWnueEiKyUH2JM/TPKkGaGLE03iERv51qYOu8d6
         cv6B6ovg9CGd2nXfJe8wJ8Y3mbEeouQDZd6h+K+pT4MFpr5SvySxUS4fVIiSwAHpzXMM
         B7BQvXv8Hz9r2xdwziYmKOJ1kXLvifkr8Wb25Sza9ELCN5BudVNkzLLk2xJNKX2Dmp6g
         pkpdv+QpS+/iQXKEzzsJImARntvdrW+nEpBIOcUBvOJAZ/+LkfMJ+BhBQz7WmmOwEErr
         QJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lhlJC9eINwtf3OPi5fDRUQ5o8RilMSHMkBZ4fEM0caE=;
        b=RdD/PLYq+W8dXLwZnS8xnPDdeJPP3kfzJHRwjxgk3eqBsnEBacQufg+EgnIcDcSTsh
         9Ju0PlzZ7H05onDJRMurVUDTAPNMNr9NgPdy9KIqzBn0GQDYxIiyKxAZ8+mXQj+qlTGE
         mOcVqKSu1emurmmT8CQnTzn/aekAxKGG0ksH96z63Fwv7Sz+sFm1wszrmVXnphldjWLC
         OFU2KCyyuNj5k0pVlFEQZZhzC2S6Cj4PRUnt8wCViajCZpMNSMrNzQnDvzG8ZdRKygm9
         K5xdyzqKW0bz7yoOzVmkUL7JaXlfOEmWlC8vZOh4+aLEpZM7wSQh1q9D+/Vamt2n/yrn
         2S3g==
X-Gm-Message-State: AOAM530fCGpuvmZjA+37T0GvLdq/zqU960cIXQ1P1qvWHbgRY5AorQlH
        I36l75mR2A3jqspkwAHmnQ8=
X-Google-Smtp-Source: ABdhPJyCzQ/cI8HRaRTFUKYOJc35UsvwijD1Z3dH7ElJANOry74TXJmFtqEwmagpApv3ugGRB8/50Q==
X-Received: by 2002:a05:6512:3c83:: with SMTP id h3mr10833527lfv.170.1634718841033;
        Wed, 20 Oct 2021 01:34:01 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl. [194.29.137.1])
        by smtp.gmail.com with ESMTPSA id c6sm136045lfs.211.2021.10.20.01.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 01:34:00 -0700 (PDT)
Message-ID: <a0bf8a10-a73f-a322-422d-ce638212d45c@gmail.com>
Date:   Wed, 20 Oct 2021 10:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] dt-bindings: arm: qcom: Nexus 4 was build by LG, not Asus
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211020001327.37490-1-david@ixit.cz>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211020001327.37490-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


 > dt-bindings: arm: qcom: Nexus 4 was build by LG, not Asus


Very cool, but what does that patch change? (It should be more in the 
likes of

"Fix Nexus 4 vendor prefix", as the patch title should describe the 
change or

the point of it, not the problem)


Konrad

