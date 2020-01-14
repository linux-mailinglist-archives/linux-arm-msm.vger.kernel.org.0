Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDBF13AC28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 15:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgANOVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 09:21:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:37334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgANOVS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 09:21:18 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 813BE24680;
        Tue, 14 Jan 2020 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579011677;
        bh=WmHeyYbk+acKt1B7uRipvxWcM5jtLkT/HkGrHvbVIP8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ji9j4uOda263DrA/LDjuL6qxua/nBrkhGwVwGA7hk8qZ0l3FdL5klSIaZODJf0WpL
         /aOzL6OqNpekm/p7OW0oXe5UOB+fHMfm3ECmgBn03MsCb5M2qqsGt6hDmON1qq3Zdr
         eG4YSlaFRlkMHDD3go2/gCCJAZdsytViiyrX7/EM=
Received: by mail-qk1-f182.google.com with SMTP id z14so12197289qkg.9;
        Tue, 14 Jan 2020 06:21:17 -0800 (PST)
X-Gm-Message-State: APjAAAV3hL1JUyZPNhUGuNhlxHAX9Il4OqaPWzmONwvN9JwlgYrp35Kb
        cdCytKtWb8R0sxKJJtyHJGu49HApQdebbQzZ8w==
X-Google-Smtp-Source: APXvYqyarUPegS8e0tl/XhZj/arNTBzvcSHjfnyTYDdgMeRZpDE/s8eo6yPV9T/54VtGg/qkkv3akPQIfx0E+NfympE=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr22688107qkn.254.1579011676689;
 Tue, 14 Jan 2020 06:21:16 -0800 (PST)
MIME-Version: 1.0
References: <1578985692-20309-1-git-send-email-sthella@codeaurora.org>
In-Reply-To: <1578985692-20309-1-git-send-email-sthella@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 14 Jan 2020 08:21:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3RxFa+3kN1vV1uJcUM-QKBLCYhWWYeLFUiZZY9_PCnw@mail.gmail.com>
Message-ID: <CAL_JsqL3RxFa+3kN1vV1uJcUM-QKBLCYhWWYeLFUiZZY9_PCnw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: nvmem: add binding for QTI SPMI SDAM
To:     Shyam Kumar Thella <sthella@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 14, 2020 at 1:08 AM Shyam Kumar Thella
<sthella@codeaurora.org> wrote:
>
> QTI SDAM allows PMIC peripherals to access the shared memory that is
> available on QTI PMICs. Add documentation for it.
>
> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
> ---
>  .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
