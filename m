Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B58BD67AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 18:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387973AbfJNQt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 12:49:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42069 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387406AbfJNQtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 12:49:55 -0400
Received: by mail-oi1-f195.google.com with SMTP id i185so14270807oif.9;
        Mon, 14 Oct 2019 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O1XOar50WCvs1jpXbab4u3D0t/+Pzo/X0PwAW53vAEo=;
        b=a/tS2VXmTZKaLH8Xp4vDkCRzas/e2Ar/y8oQ5h57LetVavSs63UtBxOWlCvJLPI5BJ
         r07PBoYuxfn/9nUHIRTYB0u8FAZLdrsfUOkzJSlPzCOHBBfI1yildKtMBiULJnLLK2+Z
         VWfX4AQysqbSTraUflz+zAFkUvRkb3yNMc792pZe3ewBy6/ifPz+nXEWiZQG6SseyG7F
         WuQtrz6x3BSDLz6s+ZxYUiArbxTOD219xGLAVLF0Nwm/cSoEtE6rPTVqfoxKXi9H1oNe
         bh5885/TWZuz3OP1u2pXeHT5DbjhaeudAMNoraf7lC+2Wmmk11gkgvuQON/3PZrbQIt9
         GSag==
X-Gm-Message-State: APjAAAUbS9LCtG+eAGd8shLlV9RYALD9SYpmulCARpeqSdMQG4Jt6vt3
        Bdqc/O/MDEki2+DI5c1/fQ==
X-Google-Smtp-Source: APXvYqz0cOr5teHUT9FD1F10/A2v+Mbj9gu5Fj9l3XL0dHvBZuhm7P2k7DsVTzQvG0NqoxmFx7SaUQ==
X-Received: by 2002:a54:4e8a:: with SMTP id c10mr25204194oiy.14.1571071794729;
        Mon, 14 Oct 2019 09:49:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z3sm5596715otk.45.2019.10.14.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:49:54 -0700 (PDT)
Date:   Mon, 14 Oct 2019 11:49:53 -0500
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
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 GCC clock bindings
Message-ID: <20191014164953.GA21327@bogus>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-4-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-4-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Oct 2019 15:53:06 +0530, Taniya Das wrote:
> The GCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |  94 ----------
>  .../devicetree/bindings/clock/qcom,gcc.yaml   | 174 ++++++++++++++++++
>  2 files changed, 174 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
