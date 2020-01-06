Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339B4131AF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 23:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgAFWEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 17:04:20 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40760 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 17:04:20 -0500
Received: by mail-ot1-f67.google.com with SMTP id w21so65801700otj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 14:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fFftcAxBxD84neD4s5xVO4mH7xPSROdINRJxfvD8MYA=;
        b=BlTbQztYLxuMTpr9l5AKduIytbSnjeIk2KysKDKruP83iRfH3zpIONtTvX9+uapeRy
         FK7LLP3x/Hp+xLw2DfLEtd9NDwyWI7qq6NldF2jyWsTA1stv3QXL+xUGhx+K6MDSbXrS
         nYd1Tj9OmvImVlp++x0+lEqnEBiBZAePP+F2xKiKndr8wYyGh98ORx9CriRGg5PLGsSs
         5sl2a6FsbBpMS8BFq95Gt7JMHRDttasfI33QslSaKYGjGymamgOyhxnGtV4q0ggwCYaa
         z5PEvOAadKe+MxkBQZIMpil5BJ42oKQqolSIXBhq90ELyToXZ7gvDU0mN5gH+ZLw7eij
         DBfw==
X-Gm-Message-State: APjAAAVYqC63Y2kiGK2W4LkQUBgWfukUS4YFJnolWAeJIgfLJPnVvbzB
        YJD6gNhg+5xn6c369MYKrl6qZb4=
X-Google-Smtp-Source: APXvYqz1Z3p7jHnKvyPB4gl0fRiryxH2+ylPWx51Hj4U/dpkMF+TcMxlfxjFakv+a28pHwPSTjGfjQ==
X-Received: by 2002:a9d:24ea:: with SMTP id z97mr120967108ota.345.1578348259093;
        Mon, 06 Jan 2020 14:04:19 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id y6sm24435034oti.44.2020.01.06.14.04.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:04:18 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220d32
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:04:14 -0600
Date:   Mon, 6 Jan 2020 16:04:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200106220414.GA10744@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  6 Jan 2020 17:49:23 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
