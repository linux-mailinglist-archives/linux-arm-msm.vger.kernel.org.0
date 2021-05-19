Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D402B3895A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 20:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhESSm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 14:42:28 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43569 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhESSm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 14:42:27 -0400
Received: by mail-ot1-f41.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso1990968otu.10;
        Wed, 19 May 2021 11:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rtf8KMzzJr42v64G2RjuzNWf/9gnkzjTH/NKtoSThvI=;
        b=l6bUevFSjAPWsLP83CQ46DeOFq8mPGVydCVF/G4gzhFjQmkxsI1sBXBDM1NSW33AJ8
         XnUrkYZ9uUSDs+XWZeo09X2ehanV85x8hJTeRvKaSB5i6HlqPLSjFE2ZHPrtK/NkMQ05
         b6TwPdGQamZYDIgeeaZVZH8Te/IYG2EylI8C/EHrX9Y4VSgnchwmuV2BQtNNQfkVOTD6
         2c6oKQoV4H9rhMYfMLsPdKlmw0hdY3yBMVG3E0rOeEy8nYeyALqaTsuYTce3cCnCOOOP
         72KQFFR+ApcqRIftw3JOpQpzkqiUG75UDnyK3XnGhOkjuJ60500imrG7vf5o+UecftF0
         ADlA==
X-Gm-Message-State: AOAM530cGdE1eaU7mt2f0BbneUdEiS95bEVQaWbpKJjUW5mKbF3Uj0n/
        eRQnRe5vefSRzoGF7TbS7Q==
X-Google-Smtp-Source: ABdhPJzKCNKgPqJxkK3ZoO9FffuSqLJK2JvlvJ6vh/99VzIiSeIzxlVQ0Sr+TkVmJPVPrkbVdiu1QQ==
X-Received: by 2002:a9d:863:: with SMTP id 90mr653159oty.335.1621449667558;
        Wed, 19 May 2021 11:41:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z6sm90480oiz.39.2021.05.19.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:41:07 -0700 (PDT)
Received: (nullmailer pid 3426747 invoked by uid 1000);
        Wed, 19 May 2021 18:41:05 -0000
Date:   Wed, 19 May 2021 13:41:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     mka@chromium.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantg@codeaurora.org, johan.hedberg@gmail.com,
        rjliao@codeaurora.org, bgodavar@codeaurora.org,
        abhishekpandit@chromium.org, devicetree@vger.kernel.org,
        marcel@holtmann.org, hbandi@codeaurora.org
Subject: Re: [PATCH v4 4/5] dt-bindings: net: bluetooth: Convert Qualcomm BT
 binding to DT schema
Message-ID: <20210519184105.GA3426539@robh.at.kernel.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
 <1621355686-29550-5-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621355686-29550-5-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 May 2021 22:04:45 +0530, Venkata Lakshmi Narayana Gubba wrote:
> Converted Qualcomm Bluetooth binidings to DT schema.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 -------------
>  .../bindings/net/qualcomm-bluetooth.yaml           | 112 +++++++++++++++++++++
>  2 files changed, 112 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
