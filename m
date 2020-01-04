Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3438812FF9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 01:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgADAdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 19:33:25 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:46050 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgADAdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 19:33:22 -0500
Received: by mail-il1-f196.google.com with SMTP id p8so37995814iln.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 16:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k8CKT1is0EUxteWZfaLzNNpxRWfsUWmMNgxluVtAzcQ=;
        b=fPnd/ll1LDhhTnTSg9zlbX91EL409/DXY0wh8oB8cc3amnBFZxf9qZxJkTcivv3ycK
         aUnlUx7d+FZaI33ZXvjBlGJlIolplXjU8JHvq53UH2lkIdvIu2MFXwzv9ALOASZhDk4a
         +/o2BsQiem5Xb+Kq1KIa9wi1aqBt/HljHeghDuI4EHa6VhTJDsHL6sm0gJ9nJsPev2Nd
         c8yj2IvyWwA7a3Cx/td7EcI1trsiuNLxVyQlWSSd4O/XUdLjKVfLLgaCvAGIy4KowS+Z
         d7iZXpgyTt+L3j0LRz189RCo3i/OFBo/ga0v0KLRJVVE9StfbsI/V/Bj5jwpK5IISBh9
         VZvg==
X-Gm-Message-State: APjAAAVqaViwd7D7SAmqPxGc3NUwtZ0oaNOwv5lNVbwBi6RYP0N7b2qP
        2q4zym0/7gpPvuEL7Q1ZZCKATlQ=
X-Google-Smtp-Source: APXvYqxrRjizK5jk7YQwcZHzG7XuUEGcXV2oKP4ZIEqvdhne5P2iehgH15NNcJef6Yu4K54JKx8RqA==
X-Received: by 2002:a92:d3cc:: with SMTP id c12mr79060331ilh.266.1578098001935;
        Fri, 03 Jan 2020 16:33:21 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id o70sm21359552ilb.8.2020.01.03.16.33.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:33:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219ec
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:33:18 -0700
Date:   Fri, 3 Jan 2020 17:33:18 -0700
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
Message-ID: <20200104003318.GA5129@bogus>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
 <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Dec 2019 12:08:29 +0530, Taniya Das wrote:
> The GPUCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.txt       | 24 --------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      | 71 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
