Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92581111B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 23:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfLCWC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 17:02:28 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37283 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbfLCWC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 17:02:27 -0500
Received: by mail-oi1-f195.google.com with SMTP id x195so4887737oix.4;
        Tue, 03 Dec 2019 14:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=90kwbqDcp7UEOW069UgJZG7CeERSPfvM2e/4IVBQtmg=;
        b=QYOlkSWRkkDvZ9P/VRtt/JhR9JZtVOp/Oy9BNK8f+3oG+/VvoqjVS1cFH4J56czoBw
         se1VTkJ1ckCYzEF8FXXCb8WNC1NfOI3TTV4uAq4tF79jCdNaSVIIWbVXYIwH3EL6EIl7
         Tfrxq2Ga4PJQxiQGCtgx0CQ4ODep6FutOqtwZVg3X35lZKN+7giRxkEzaECN8cjhWxJF
         W4/Rbk0j0eoFi949WQ3lj7uixPCpC9w0BS6nbCbozQG7uHpFTG0thD44Xu2M2KzCPFib
         Dp0LEC46i1jPaWXG6br5O6gInL5hsosOes/xyw00rCcDV8D/NOrQAfxxGzlwFe2cpgDq
         mE8Q==
X-Gm-Message-State: APjAAAUOcWkRkaV95NrGg6Isr+1Jx4SCbl8ZS0xlNbYLqbazlFCsXszi
        MmNKx+M/cNfXKieV1d5T4g==
X-Google-Smtp-Source: APXvYqxrRfI0UN95eqjO4C8gSA0I9sLWnVvsUts8X9Qr0NL09XMOoPTbWgGcEBLbzFgRiTnhvrIi8w==
X-Received: by 2002:aca:5cc4:: with SMTP id q187mr155936oib.45.1575410546786;
        Tue, 03 Dec 2019 14:02:26 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n15sm1488396otr.67.2019.12.03.14.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 14:02:26 -0800 (PST)
Date:   Tue, 3 Dec 2019 16:02:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com,
        mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 10/16] dt-bindings: remoteproc: qcom: SM8150 Add ADSP,
 CDSP, MPSS and SLPI support
Message-ID: <20191203220225.GA22560@bogus>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e8078dad4-458c8501-93fd-4daa-8938-d01027f248cb-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e8078dad4-458c8501-93fd-4daa-8938-d01027f248cb-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Nov 2019 21:43:54 +0000, Sibi Sankar wrote:
> Add ADSP, CDSP, MPSS and SLPI compatibles for SM8150 SoC.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
