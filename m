Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95766139CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 23:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAMWvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 17:51:32 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35332 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbgAMWvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 17:51:32 -0500
Received: by mail-ot1-f65.google.com with SMTP id i15so10671193oto.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 14:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kHrOCgkkdDXDANIjbqsuSi8zgIrP7fM6uexZoRu9ItQ=;
        b=S59KsZKYMVIPDKmQ2fh74o4V2qiU3XT1/UEiTnIevQQZ+cIudQDA8fCloLsmI6M0Ey
         AZrpgMXeM7yP7/HcJgcXjBf1nTdeHYb8H7SzdcXB0Z+G7V4bR6jTJt7KyyNMlmQ2gdmL
         CI3UP55bEdKIS0DfsIX7KLWFv1NxcBuiBIM/fTPDIqnJaYNdQhX9a0Xwc8DNvPx/OAgf
         btXsUkILEZU8bTF1Nlq9O7Q/4q9kRTi6jc/rdUUOi4E1z4j29fUHhoBbzS2ueHJgFLj1
         lPJbwcKsM8ACGMY8YkBXPkSCac/D//ukPAX8zW/bBVJBU3Ka01LCDSyER590/o2o4D8S
         5FMQ==
X-Gm-Message-State: APjAAAVUTjMcFEHgewvoohIyxweem4DzlIoJHQgVFm2OoEuD3gLIWMOZ
        nI7C6oC3XM5du7DFvO2laPMBkto=
X-Google-Smtp-Source: APXvYqyn3K76QwBYaUDSxVKJMJzuxWMWpXRgl+m2uP+wWOCaOUYshgYSwo0up5QlnUynxN2/Ln0j5Q==
X-Received: by 2002:a9d:c02:: with SMTP id 2mr15065470otr.183.1578955891930;
        Mon, 13 Jan 2020 14:51:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l23sm4651334otf.23.2020.01.13.14.51.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:51:30 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:51:29 -0600
Date:   Mon, 13 Jan 2020 16:51:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: interconnect: Add OSM L3 DT binding
 on SC7180
Message-ID: <20200113225129.GA16336@bogus>
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109211215.18930-4-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jan 2020 02:42:14 +0530, Sibi Sankar wrote:
> Add OSM L3 interconnect provider binding on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
