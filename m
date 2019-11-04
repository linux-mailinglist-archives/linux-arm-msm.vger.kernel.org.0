Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 370A3EF0A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 23:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfKDWgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 17:36:02 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45405 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728940AbfKDWgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 17:36:01 -0500
Received: by mail-oi1-f193.google.com with SMTP id k2so15672165oij.12;
        Mon, 04 Nov 2019 14:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CsKuW9OBprzkXmoFyZ4W+njWtvNgklYLCbslz5USmAI=;
        b=AUCqdAquPjqqzlbGSFC+z1EvZOWqaAUTp+k1t/HScDrm3C8bnIEP0JYNxMdqc0rcyM
         ssp0VT7zZt0RSToT/tiBp7RUlTXVMg2570FVVtL9+rcN8DGwkATj+E7OLd2RWKj8ZkXv
         kqSmD5gPeH5jXBBVc2turN0Bxp6eFyLwZZ912Y+0zD34U2Pxa4OACWSLZBRG0rbkE00b
         gX/U28hOLM1zWh+bLNJ24OcTZPNHQ3mi9nR6j05E5OuxDT/5fY1Ms5DMsBV3CGOo2BZP
         aslgxz493eWydjVn+n07w/mPO4ejNSIq9PW9cZyiW+5MHc4OIKrt0AcFgQovwKcR68yP
         l3rw==
X-Gm-Message-State: APjAAAUIoVVvoMEs2ZhptK2dV4NkWdQ5K/rGt4P9IYlHntz6oaLPg7Q0
        4inESq13tMOmsPQoHom9kA==
X-Google-Smtp-Source: APXvYqyWHZgDCT6nYrIqrZ8BEV1XDy05uiMa4KWydaQPl3Tpiyuia+bIhBPRj4/ivk+pLiAmNJKqhw==
X-Received: by 2002:a05:6808:18b:: with SMTP id w11mr1135085oic.25.1572906961084;
        Mon, 04 Nov 2019 14:36:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 2sm4728627ots.21.2019.11.04.14.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 14:35:59 -0800 (PST)
Date:   Mon, 4 Nov 2019 16:35:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL
 binding for MSM8998
Message-ID: <20191104223558.GA17515@bogus>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
 <20191101024435.21975-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101024435.21975-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Oct 2019 19:44:35 -0700, Jeffrey Hugo wrote:
> Add new compatible string for Qualcomm MSM8998 SoCs.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
