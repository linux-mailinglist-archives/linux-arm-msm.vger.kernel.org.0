Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB51375E50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 03:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbhEGBUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 21:20:15 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:44005 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhEGBUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 21:20:14 -0400
Received: by mail-ot1-f45.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso5830700ots.10;
        Thu, 06 May 2021 18:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iTRiEv/+c31w1knsIgiLTIV+1F0Vw0ef9aNvXKYG0/M=;
        b=pkouxRVbkiG9cirC0aqotu3NAIOlNAoqaUscfy2FXBEwDnq8HOzoCFl429IoTxDA4e
         oNk+oETH9N3Un+7Kw27TNWuMK5XBVBHfiE7bJ8XcMiogaNfQ7a4j+Uk+i6VUXJHVWUDN
         4qkwEN2TS1T6dEWbAcbVrNe7HFbSA+BT4r+L825t5Vow2B4aAkPHDRa7w5FpAI0LEMfR
         M6w/PO/fFgbB00lwQZft5OsPh9V4uo4O/BzgwuUeunfYLKYmJhKnQg47nvzkyn+Mgm8F
         S3RsVlfSw9DrPt4UIZ/NogV0EReyu3n3xgYqyvPIGi98/0Srs4sA9tZ3VltssiJo5sGz
         ttcg==
X-Gm-Message-State: AOAM532oBnOE5K5/vK1MSz5DmlNREn/rG/NYmAFlYRrxcsbCLXgWHl3N
        nTnP+gQ0ufA2gzDX+Tag3g==
X-Google-Smtp-Source: ABdhPJwPMNVgkYoUMeIdVLdofJLqZe2HJ2aWT28cmU2/jeNKZAqSuKtsNJ/sYxzF5visBCFJ01x8lg==
X-Received: by 2002:a9d:543:: with SMTP id 61mr2637297otw.287.1620350354494;
        Thu, 06 May 2021 18:19:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o6sm731687oih.44.2021.05.06.18.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 18:19:13 -0700 (PDT)
Received: (nullmailer pid 1133400 invoked by uid 1000);
        Fri, 07 May 2021 01:19:12 -0000
Date:   Thu, 6 May 2021 20:19:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     rjliao@codeaurora.org, abhishekpandit@chromium.org,
        hbandi@codeaurora.org, bgodavar@codeaurora.org,
        devicetree@vger.kernel.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        mka@chromium.org, hemantg@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn6750
Message-ID: <20210507011912.GA1133328@robh.at.kernel.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-6-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620322392-27148-6-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 06 May 2021 23:03:12 +0530, Venkata Lakshmi Narayana Gubba wrote:
> This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
> controller.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../bindings/net/qualcomm-bluetooth.yaml           | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
