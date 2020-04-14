Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AA41A85E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 18:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440686AbgDNQve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 12:51:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33416 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440657AbgDNQv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 12:51:29 -0400
Received: by mail-ot1-f68.google.com with SMTP id j26so93979ots.0;
        Tue, 14 Apr 2020 09:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E0UhtU0hOfN1mtluPKd6UxG6VtUuYZXqq6zaVbM+sI0=;
        b=O8kJaC2uYpCUsb7tA1jLJBmfhVAcro4KT01QHr2VDCVsIj+OXRheog2EKQwxW+llxt
         fX7l8xEkfhpEKvqJHJ3Q/AKbgzMlLR88KKw0B96nN5Y7DFEMm+iE7IuCBnm9Pp3B3180
         Jf9ztI/xyBVp5PHQn5CR3SUu5tGpJDYi61KtPitYYqh7T6PzFSDAdb0DpFOVE77er1fo
         w7tiwVt4A9IzSsi/rFXWXwlBQ9Cx0S6BCE/QoATyQa8d1Rb1Oabv/Brt0mrLQyUgYx5r
         MrFFdVXpfO8wIDyLro2fvS120+YYFWbEKwY4bWfSV2xXW6E+2Y2H6iGiqrO9znjynSvx
         5y5w==
X-Gm-Message-State: AGi0PubS6VP6TvVriGwsGZDfV6LMqop6Y2/MOCSeM4L496Nd0EiQK6gL
        8FRsEaGAnLm0jBdgFwtpIQ==
X-Google-Smtp-Source: APiQypIcslAsL6nTfjJohaUj1ZXbBo8tbhnBXcKvkKOBU0ppY4P1+HG4u8r7j/Gyi1aadTNcJDyzCw==
X-Received: by 2002:a4a:e0d1:: with SMTP id e17mr9696815oot.53.1586883088742;
        Tue, 14 Apr 2020 09:51:28 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s13sm6235555oov.28.2020.04.14.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:51:28 -0700 (PDT)
Received: (nullmailer pid 22116 invoked by uid 1000);
        Tue, 14 Apr 2020 16:51:27 -0000
Date:   Tue, 14 Apr 2020 11:51:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp: Convert QMP PHY
 bindings to yaml
Message-ID: <20200414165127.GA21637@bogus>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org>
 <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu,  2 Apr 2020 12:08:52 +0530, Sandeep Maheswaram wrote:
> Convert QMP PHY bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 332 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
>  2 files changed, 332 insertions(+), 242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
