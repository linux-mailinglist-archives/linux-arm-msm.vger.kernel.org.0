Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85424110342
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 18:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfLCRRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 12:17:39 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37712 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfLCRRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 12:17:38 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so3620836otn.4;
        Tue, 03 Dec 2019 09:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ArPIadxBEM3m94vyZBP3lWb7orwIJHnZVomLbNctvNE=;
        b=d5cTuJDHF0xHJR+1aMTCANpZ7q2Ub8OpaXQLMdx3R6/t3NLKmjuBNTCc3Z9IazK8pe
         G0t+V+CsWm0Fa730RXedZZltWq2kLF6VEEzQUFy585X/bYU+JiE3zo78RDaY8nBV9BR2
         NuVbikTFAuJ9FUDnFmxHksNAnu81MOV1GW5xrvMuDVaO+/sUUsggqQb3NYzDmNVv8o39
         g4EMKR0viAy/dwcCGcT/Ndbf+xqNCjhQtbA6HvAuxmtGJVD+WfuW4C/JvxMUl0wicr2c
         dktP7WaDJ5Zn5RvhfYJHr1DAeeJQ6/aiqfnoBzwAea6MM8jVstq0PHvZJFUyiLhSmvDV
         AcJA==
X-Gm-Message-State: APjAAAVwbzIEI/UV8gCddTrzDoZ2UnP+VCInhS7iqOYTR+B75ZnavYSm
        dGllhqJ+jmOHWE9Vb+IThQ==
X-Google-Smtp-Source: APXvYqxG2VUWZhaj4nSknQVnpZuIGZe61K8deqyXR6HI2JePzrPG3D0H6+TgcsHHe6ZaHPzb/84J8g==
X-Received: by 2002:a05:6830:579:: with SMTP id f25mr4164157otc.248.1575393457736;
        Tue, 03 Dec 2019 09:17:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x15sm1223872otq.30.2019.12.03.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:17:36 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:17:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 DISPCC clock bindings
Message-ID: <20191203171735.GA11514@bogus>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
 <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Nov 2019 15:34:03 +0530, Taniya Das wrote:
> The DISPCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc.txt      | 19 -------
>  .../devicetree/bindings/clock/qcom,dispcc.yaml     | 66 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
