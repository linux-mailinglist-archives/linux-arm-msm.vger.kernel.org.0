Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0644E139D12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 00:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgAMXDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 18:03:16 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35185 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgAMXDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 18:03:16 -0500
Received: by mail-oi1-f194.google.com with SMTP id k4so10031882oik.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 15:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ri61tZzvuw9GVovdm8Wr7vnv/tkJpOEIL8vV4DTKISA=;
        b=Kcs7ZI0vfnoJHkraWLDVzEScJ9PuAwKXpsw5dUd76DhZvb9/mKt/6kiEq3PQYeYHOA
         J0JaXtKQKH8IualafFpIVXG9NmawTlCjDXIwyOMxkh0x9Xdb4wy2iAjhMPqg2LQAvd2Q
         k/HVZYS0zQu44isg4qmr+PRY4RHJOwxcNQ9o9hEKH7QMWVt5xRFSQgl+qiqhGkCrNUYu
         tPHh5QtPG+LdoRp2lfeh3OMy90UpJYVh1HS9H1GPAQkQhDBi99htNUqMF8n1nw/jaO04
         uUYYtqgiB5mgwGIgsank2D8+rAbSXH/ig/f4exRGpVHeOAc+MD7viriUQZ6qLo7BoK1S
         NQ5w==
X-Gm-Message-State: APjAAAWu5aFutfeeNa5yLoETc8hKCGHYXvk7tQXltEFpoo+KHIYGBsNJ
        vmeD04zoDDJzNRfdc2VO/05biSo=
X-Google-Smtp-Source: APXvYqxM7Gdlpma6g9DPUqTlAnqb43ugv80DKGurvlf4q1aM9Fptmo5rgT8Bsve2Lf0uycfxJT8Xxw==
X-Received: by 2002:aca:fcd0:: with SMTP id a199mr13910473oii.143.1578956595583;
        Mon, 13 Jan 2020 15:03:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm3992767oie.49.2020.01.13.15.03.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:03:14 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:03:14 -0600
Date:   Mon, 13 Jan 2020 17:03:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom-qusb2: Add support for
 overriding Phy tuning parameters
Message-ID: <20200113230314.GA1041@bogus>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578658699-30458-4-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jan 2020 17:48:17 +0530, Sandeep Maheswaram wrote:
> Add support for overriding QUSB2 V2 phy tuning parameters
> in device tree bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
