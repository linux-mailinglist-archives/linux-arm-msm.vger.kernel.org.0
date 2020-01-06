Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AAC131B07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 23:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgAFWGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 17:06:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36151 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgAFWGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 17:06:53 -0500
Received: by mail-ot1-f66.google.com with SMTP id 19so61059502otz.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 14:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J+PYNm7dQL8K14ScybU+6pQ9OSx67pufTIOMHAwIfCo=;
        b=l/LQ/5O7yitq4Rf5sWLNAhW8Edw0k1kpMXTQ+4d/8AQYytZHgK7mCf8/JZdjGB8It7
         2L6bN59JCZOJ0/DqpQAecQQ519pkyOIIRX5BwzyN9GM2WUeYNmH4rtu1VhVvB8gzd9ne
         QoPQ8wwpgLH+9QIpIvF6RoApUid39h4KOhN5eSJXUdwI7PJasZMdPMZ4CeAk6uGgdwSk
         Eqo00+8eMbwr9MUTadEAlcFxFVRuD464hC9YPF704xklwSHw6K6x873XtEPoy8qFGPsz
         MCIbcS5URDUXyDhqbeTQLkC2ntYrTceW9BG5IMqTNQyr26DBTzBVklg96DYt3X62pXm+
         b+dA==
X-Gm-Message-State: APjAAAWjJEmY6giFHaQ5QCU1AJgjB6Hq7+SoGD6hUhqMoUnQBEIp5mOE
        C3WHE1+Y3dw+S56gjb01Ed7p2aY=
X-Google-Smtp-Source: APXvYqzbOBiYkMYAXeWY2ayjDdgGHWa64BBTBUmSp53pwGMpFF1qX18iAZkX/TRJo1PK7O6cHHTWRA==
X-Received: by 2002:a9d:7d99:: with SMTP id j25mr101261187otn.226.1578348412717;
        Mon, 06 Jan 2020 14:06:52 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id v4sm4194228otf.7.2020.01.06.14.06.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:06:52 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2207cd
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:06:49 -0600
Date:   Mon, 6 Jan 2020 16:06:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 08/12] dt-bindings: media: venus: Convert sdm845 to DT
 schema
Message-ID: <20200106220649.GA15045@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-9-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-9-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  6 Jan 2020 17:49:25 +0200, Stanimir Varbanov wrote:
> Convert qcom,sdm845-venus Venus binding to DT schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-venus.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
