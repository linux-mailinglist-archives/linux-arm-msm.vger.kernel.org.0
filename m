Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD1F3100D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 00:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBDXkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 18:40:22 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:34727 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhBDXkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 18:40:17 -0500
Received: by mail-oi1-f180.google.com with SMTP id h192so5647715oib.1;
        Thu, 04 Feb 2021 15:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5GQHrqEfP/qkwIRLdLdnADatda2rpnQETgAt2j0ygXo=;
        b=IYF9NbSa5ueW8aGUYjm9yWjjxB7ddQnMF2ZW/hx1HexqcVvnUEa/9dM9okqENtjZka
         1wOJ/scKIKYVfME0XjqbWsKc1/K+KY9odBhv1DFy6+pVc4k9s+qSQcOXgiISjeGInxSJ
         HgtZtTNYbdmSLuwfG1RGXMs2vFJWuiMahXx6T3NwVt/o3L45McouSyVgFOKyfQEiPOAu
         t2slFVzbRTMexrjV+59D8xM3NToTx3O3hI87FClElCiMYzO30AoVBtefXDuBaMeCwVl7
         5Z5i3ZM3odNNnK/JZjv8HKH66piKHw+9e4Kqo/j6PGVJuhVi8HB5KauAk7KA7VRVGwwK
         XBcA==
X-Gm-Message-State: AOAM530lIhSVFmo4K4M9z1bNgX6B0UOM/oKyoRAme8P66sEDof+lvKd0
        b7GeX6oEqqNSkrbrHWMThQ==
X-Google-Smtp-Source: ABdhPJznSlbQlfcVKn+rh6985IYJmQ0sGEMdwg1mdkNPQ+BT6nuWZ069yaak1ll7q2qmXNZGtoVPyA==
X-Received: by 2002:aca:31c1:: with SMTP id x184mr1322104oix.74.1612481947660;
        Thu, 04 Feb 2021 15:39:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c2sm1379016ooo.17.2021.02.04.15.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 15:39:06 -0800 (PST)
Received: (nullmailer pid 1334577 invoked by uid 1000);
        Thu, 04 Feb 2021 23:39:05 -0000
Date:   Thu, 4 Feb 2021 17:39:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     vgarodia@qti.qualcomm.com, robh+dt@kernel.org, agross@kernel.org,
        dikshita@qti.qualcomm.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        stanimir.varbanov@linaro.org, jonathan@marek.ca
Subject: Re: [PATCH 1/1] dt-bindings: media: venus: Add sm8250 dt schema
Message-ID: <20210204233905.GA1334487@robh.at.kernel.org>
References: <20210203113914.1072380-1-bryan.odonoghue@linaro.org>
 <20210203113914.1072380-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203113914.1072380-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Feb 2021 11:39:14 +0000, Bryan O'Donoghue wrote:
> Add a schema description for the venus video encoder/decoder on the sm8250.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8250-venus.yaml     | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> 

Applied, thanks!
