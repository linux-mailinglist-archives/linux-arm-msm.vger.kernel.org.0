Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB1B1CF965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 17:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgELPhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 11:37:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45782 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgELPhw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 11:37:52 -0400
Received: by mail-ot1-f68.google.com with SMTP id e20so10819530otk.12;
        Tue, 12 May 2020 08:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zHYiE//KG7sYXg64AbmwY8PpXkOO57mwt3IeZH0kDgI=;
        b=uZ4lN6si6itnhwYMyQfa8sfYoD/0xbapa23BzeKRnf/8TpRUqJmMM7JVcWBb6OCXHz
         ovv/0B94ymp/UdqBOoyCiJ4Dkq4y5So6Vc79lbVi8bW3YZU6TDAoXLK65Jjey7xEjgAN
         p/U1nY04i8E5ZTEgTNOqp7bvcO1Uc0R19hUqJmWOwoSq10R961vI4NX77HTDZhSR5VDO
         fo8RYuD6uH9+Vdd1KMPoXzt2MqUXYt4yp73BcWnZJegR6dsrWGRMeTZDkXOxLQP0JQ4j
         tCqm6DfurhMVspWdTMbVF5m/y2JU8OY3hCieVWQbpBvuJoXbsqi/exRdga6nw8yeCbnL
         4goQ==
X-Gm-Message-State: AGi0PuZuQyC5bOYUY3SOxWbClqVxVgvSrd9MIHO67ai62tr0PP7QJ6xB
        Nyap5yb5XeC5zn/IwOrKiQ==
X-Google-Smtp-Source: APiQypKGiqazmKa1llrIVH5iI9hlhiwrjndF3SjPLhcd9EbAnc9f9RBnfa/Ps9rE2pQdkek8vTqmUQ==
X-Received: by 2002:a05:6830:1082:: with SMTP id y2mr16684544oto.123.1589297871719;
        Tue, 12 May 2020 08:37:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm3501710ott.51.2020.05.12.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:37:50 -0700 (PDT)
Received: (nullmailer pid 24997 invoked by uid 1000);
        Tue, 12 May 2020 15:37:49 -0000
Date:   Tue, 12 May 2020 10:37:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8250
 remoteprocs
Message-ID: <20200512153749.GA24921@bogus>
References: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Apr 2020 11:00:50 -0700, Bjorn Andersson wrote:
> Add the SM8250 audio, compute and sensor remoteprocs to the PAS DT
> binding.
> 
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Changed adsp power-domains to lcx and added missing lmx
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
