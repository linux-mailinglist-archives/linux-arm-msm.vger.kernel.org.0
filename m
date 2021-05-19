Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FDC3895A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 20:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhESSnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 14:43:12 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:34586 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhESSnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 14:43:11 -0400
Received: by mail-oo1-f49.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so3222529ool.1;
        Wed, 19 May 2021 11:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Z68T+rBd2A3UCAEtenNosOLWPpZqExwgl+UfWe8E4M=;
        b=RprdH8wC2hT5sqCzbDzLYOriDCdsBCZPRXy1smsHPSfNaB3Q8KrbzhOndFM1nQVKg7
         15mKxfuRchTY9E0H3AH6NrqyITGDoD5mMcLX3a7TLtNnsWMnFut3dJUZOsFQQnjKN60O
         wfHJP7JhmJKreq3vngquJGBWz3nzd+Vp4+Z4yr0fJhm45WRz1BMrp/14XtCNnGITdvz7
         tQHlv5SAXrAt0M6eNMP7R+uuLRvq9jdNDODbWuPhtAsDgPeNUcavJkkIfMMbTOaSgDUS
         Y53AI8y8jH8WI+YQK6pacooO5altrTHItBVdPwRoTtxjX9o95kU/ermvB5S+KL/JraRs
         5j8A==
X-Gm-Message-State: AOAM532/qrECCFK0+JKMDHzZhA0GId1DT1WdPN4qVl+X8nvkdr5XmC70
        EmdFC+U/LhqDfVIOnM1qIA==
X-Google-Smtp-Source: ABdhPJz2FZxc8TGo6vOqIjI8M6MENCLA1AMdUEnYpyxG1R6A7uX2gdoEkBx/vhUkvHp4/26U+lww4A==
X-Received: by 2002:a4a:8dd6:: with SMTP id a22mr597898ool.74.1621449711388;
        Wed, 19 May 2021 11:41:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p1sm121955otk.58.2021.05.19.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:41:50 -0700 (PDT)
Received: (nullmailer pid 3428012 invoked by uid 1000);
        Wed, 19 May 2021 18:41:49 -0000
Date:   Wed, 19 May 2021 13:41:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     mka@chromium.org, hbandi@codeaurora.org,
        linux-arm-msm@vger.kernel.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, hemantg@codeaurora.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        devicetree@vger.kernel.org, abhishekpandit@chromium.org,
        marcel@holtmann.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v4 5/5] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn6750
Message-ID: <20210519184149.GA3427851@robh.at.kernel.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
 <1621355686-29550-6-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621355686-29550-6-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 May 2021 22:04:46 +0530, Venkata Lakshmi Narayana Gubba wrote:
> This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
> controller.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../bindings/net/qualcomm-bluetooth.yaml           | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
