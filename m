Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E1FD7DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388739AbfJORZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 13:25:55 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43894 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388722AbfJORZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 13:25:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id t84so17518073oih.10;
        Tue, 15 Oct 2019 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TuLY0T5XCanlGHWiiteaVAS0AqJDC0pQFFmFd4/UATA=;
        b=LtEsW1HuAp629IJBd5FW9dHUPIb4l5EnwWl+sfRYkdmdM2grT341mwT8OajDN4PY7x
         74/Y8NSxupWgMgoKv5fuKst7tC9zlyDAxGmwqHDmq0RNB3itHcPC+bJI7M3prVQqmUp+
         DPrWHvW9aQ88NRAUzKiMelc7MmQ9Q1KeD3W4v18cNguVYi0+//FG/u08TkOrlemhNLaW
         hahReiOYAm7+dzF774Gm6p8ERkZMhkjoGKXqlk+Ji9H4Rri9xzVlPkWuW4xC2Om610bv
         2XF74BCNDnOP6z998nmTTWyOKNRDlsmFRtlZdfpTPJnH1EoTzC2feGv6qEpIkrqiKxDU
         pfew==
X-Gm-Message-State: APjAAAU2VHyVKywH5zahLcvcgxJ6UykF6j3cnGIfDeu2tV06JLQPbn/X
        i7v8gWGRhdcgokH0zcgnRg==
X-Google-Smtp-Source: APXvYqyh/AJuW5SKmbZ5+aKVbLFBePskQhmFvgqaWcF+4jvMRtRbccQskyol9LKjgN6XrE7Ol69g6A==
X-Received: by 2002:aca:2807:: with SMTP id 7mr30578217oix.99.1571160351713;
        Tue, 15 Oct 2019 10:25:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm6549012oto.2.2019.10.15.10.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:25:51 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:25:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert sharp,ld-d5116z01b panel
 to DT schema
Message-ID: <20191015172550.GA4197@bogus>
References: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 10 Oct 2019 14:06:54 -0700, Jeffrey Hugo wrote:
> Convert the sharp,ld-d5116z01b panel binding to DT schema.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../display/panel/sharp,ld-d5116z01b.txt      | 26 ----------------
>  .../display/panel/sharp,ld-d5116z01b.yaml     | 30 +++++++++++++++++++
>  2 files changed, 30 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
> 

Applied, thanks.

Rob
