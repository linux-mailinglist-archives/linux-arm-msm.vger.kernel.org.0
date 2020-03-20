Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461E418D68C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 19:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCTSHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 14:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCTSHt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 14:07:49 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9FED20739;
        Fri, 20 Mar 2020 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584727668;
        bh=U8oXIP5oXGvZd/1FPI5kRuFkzQslAnVxi3jbhT86N8g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zl8vTyVaCE7XSqVRaFQHGYQ1hpT6gdLgT/OoUVQkp8avDWWFAKgBIZ23zn4RsyXhZ
         VguFbxdJpa/PGLXWCV9PaVDpQjjZHtZSseureYdhCvaemCgfMmOM3Bv3sFN2Lsmaew
         mrsprz7Pwc35y2W87l/SHVNcMFgNDyeyT4nWo3Uk=
Received: by mail-qk1-f173.google.com with SMTP id l25so2944357qki.7;
        Fri, 20 Mar 2020 11:07:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1SQ2xxjsfeClJc2ACehrcRA1ASOgmw5nO7QbHIEsOlEAMNugo8
        uOobKars663p97UVtEYV1LjJB9aoYG6Hvtbqvw==
X-Google-Smtp-Source: ADFU+vuxhlkoXyT1YY53b7HKSyPc40/5axtT/yKvtUn1tYpPSEZWkUnm5O/F/s11tGwXXgPTo5JaJMBZdIsGq9/lTho=
X-Received: by 2002:a37:634d:: with SMTP id x74mr9645562qkb.254.1584727667842;
 Fri, 20 Mar 2020 11:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org> <1584095350-841-4-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1584095350-841-4-git-send-email-akashast@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 20 Mar 2020 12:07:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
Message-ID: <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin swap
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, rojay@codeaurora.org,
        c_skakit@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 13, 2020 at 4:29 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Add documentation to support RX/TX/CTS/RTS pin swap in HW.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V5:
>  -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART
>     child node.
>
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

STM32 folks need something similar. Can you move this to a common
location. That's serial.txt, but that is being converted to DT schema.

Rob
