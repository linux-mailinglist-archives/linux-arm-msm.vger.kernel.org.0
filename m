Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217A71794CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 17:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbgCDQRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 11:17:12 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37396 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388042AbgCDQRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 11:17:12 -0500
Received: by mail-oi1-f196.google.com with SMTP id q65so2642092oif.4;
        Wed, 04 Mar 2020 08:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hPJMFKMZOVY1sSzz68ERLW9GZKjEL6tZJX3IPiL2Z04=;
        b=sywg4ZC37VlDDuS6EbhtJw0Dhyqmns5kqMLlFUzOt6f52zknFCclnY1OQvDV9H4X+X
         TN/K7r4mQ4q7WK8fLU7YubGj3MyJdWSF0ig7N4W/JbIH5UamzRD2g1ilABkO5YRU0Yum
         GiFvPEDQbzBoYhIooWyJCEKa7ivehewO5Ol/Nt/va4VKFVfaK0UMOAuIGbulS8Dus354
         5743tkWk1NVSohgqLzUaFRROGAj+H5FZO1o0/25G2NsOf6t9otOS66iVBZWP9GV3XptP
         P0zfRjCo3CGWNHla6j6y46LPEokS9m7WU6fdFqgKMhSoAI87RPahxd0yb61/R2gp/akF
         zz6Q==
X-Gm-Message-State: ANhLgQ2FgJ/yLQQFhoAFFjoMEp+craSPvhtrFv4rbhYiRr9QFxydX4zb
        lmlTYsTK8X4SHVJTAg5MRg==
X-Google-Smtp-Source: ADFU+vt7hO9gxCqHxYY58e/pDKaHri4ZUKZOVFtBpHwZYFAM+cGK8HNV0cjIru21nI6P0NSvNckMrA==
X-Received: by 2002:aca:3554:: with SMTP id c81mr180849oia.0.1583338630985;
        Wed, 04 Mar 2020 08:17:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z10sm8898540oih.1.2020.03.04.08.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:17:10 -0800 (PST)
Received: (nullmailer pid 28440 invoked by uid 1000);
        Wed, 04 Mar 2020 16:17:09 -0000
Date:   Wed, 4 Mar 2020 10:17:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v7 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20200304161709.GA28382@bogus>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
 <20200303171159.246992-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303171159.246992-5-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue,  3 Mar 2020 17:11:45 +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed PHY. This PHY
> appears in a number of SoCs on various flavors of 20nm and 28nm nodes.
> 
> This commit adds information related to the 28nm node only.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> definitions.
> 
> [bod: converted to yaml format]
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
