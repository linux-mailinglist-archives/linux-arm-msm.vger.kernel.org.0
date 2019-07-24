Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113DA74024
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388053AbfGXUiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 16:38:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38526 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfGXUiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 16:38:00 -0400
Received: by mail-io1-f68.google.com with SMTP id j6so17299874ioa.5;
        Wed, 24 Jul 2019 13:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vuZaaqg7zp+px1f/EMydKkqWowLjakXiBGgYXvJfuxU=;
        b=bO1NOiJN4c0HQU1U2tYrKKAsmr0k8drmkUorpN3WHRAL/nL6PnayKyY6sUseSYup5F
         sgE30RAR69dvJLeRSo8CJbhiUpte0I845SxNCSSrgQDvGMbqQi3I/2Jm5CXL3DtEVERt
         l41CLDbUBSKyN1f15B2ZdMJWKahrTDID8vHbEmedbfC3j4gvghXnrCUQwO3TeMUF1ruu
         RgpgYcZhay39pJnQWbhohezNwOHlfElhxlTRN1YV1BqkE0ssueVLkj50YjgPIYJFcSt+
         xhto3Rrt0Vl2RebNd/kaFQu9w4YQovlc4AhfFa8T+iTsVQxqaKYg2CDl0jOWVJdf+MDG
         W4cQ==
X-Gm-Message-State: APjAAAXDD/3LI3/61mE52PxgrfJpSzLFDNiX7fC26JglGni/egh6VMB0
        mjhsRL64AtrPYCOhhLObRQ==
X-Google-Smtp-Source: APXvYqzAOT60HWVFpcXqzw8BNfHsBQ5wQ094AhUr5MLLO771e0c3yCmmof4JSmAIfOKyCEQfSlbzcA==
X-Received: by 2002:a02:242a:: with SMTP id f42mr86568614jaa.42.1564000679795;
        Wed, 24 Jul 2019 13:37:59 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id n26sm34621091ioc.74.2019.07.24.13.37.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:37:59 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:37:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS
 compatible
Message-ID: <20190724203758.GA29329@bogus>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-9-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562859668-14209-9-git-send-email-gokulsri@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Jul 2019 21:11:04 +0530, Gokul Sriram Palanisamy wrote:
> Add mailbox support required in IPQ8074 SoCs.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
