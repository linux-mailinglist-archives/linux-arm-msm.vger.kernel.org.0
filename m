Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC62107B28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2019 00:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVXPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 18:15:06 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37496 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKVXPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 18:15:06 -0500
Received: by mail-oi1-f196.google.com with SMTP id y194so8036478oie.4;
        Fri, 22 Nov 2019 15:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sbcn4XcjBZZ8DdvE6xrv9N01S1kfNpZpyArR33CA/Js=;
        b=UxOrKcSrd4F/UtgNXfW1ZBtVHX/sGumWemn42U5KN7vOMqZ7kw84jN7f4YGd45ytoU
         /IG940NtZeyPMsA+U4/SGcCaErMOeivbNHX3OinT4IRzOsBa6EIUO/Op5K5fyfkZMLnN
         G8dH6OLeDUwlam6Hb++zMFTEpHum+hKWp6vG7NibAYwy5ae9ITV9gyQSlIoBJ1u7EN8+
         /nhMVIIVN7O9ZtW8q5sgTWTsJTwesXumfRVNQ7lSgFFbToMh1Wbg8rIHkSL1LzY3Robb
         riRRUNjZwMx45OF8B0eaLhLK1uMAmWoyTUJBHaeIqJbogDWyjUlGi0jnP0rN4kEJffvT
         MXYA==
X-Gm-Message-State: APjAAAUD7RA3ex+dBnjNjfPX3r/oyjMZh3QcWccB5zav26pqnLTRxLa4
        KtvRmJSdXi61yVpdjkPNSQ==
X-Google-Smtp-Source: APXvYqxF5NOskuE5nbrzXxqNbNbHu0S9uDTbl42+XDwC8k9p99Q7Gpx5Ue5wCqcbcqSMdy1V1zoCeg==
X-Received: by 2002:aca:48cb:: with SMTP id v194mr14580195oia.156.1574464505588;
        Fri, 22 Nov 2019 15:15:05 -0800 (PST)
Received: from localhost ([2607:fb90:bde:716a:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id l32sm2723717otl.74.2019.11.22.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 15:15:04 -0800 (PST)
Date:   Fri, 22 Nov 2019 17:15:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com,
        mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 06/16] dt-bindings: remoteproc: qcom: Add power-domain
 bindings for Q6V5 PAS
Message-ID: <20191122231503.GA13027@bogus>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80788d28-7370e0e3-7380-4cc7-9233-40b9fd76e8f3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e80788d28-7370e0e3-7380-4cc7-9233-40b9fd76e8f3-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Nov 2019 21:43:34 +0000, Sibi Sankar wrote:
> Add power-domain bindings for Q6V5 PAS on MSM8974/MSM8996/QCS404/SDM845
> SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,adsp.txt         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
