Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E871982FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 20:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgC3SHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 14:07:30 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45228 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbgC3SH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 14:07:29 -0400
Received: by mail-il1-f193.google.com with SMTP id x16so16762466ilp.12;
        Mon, 30 Mar 2020 11:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X6Rm7pqIHT/ZZieSSimVABq7HFocgGJ+F6beDGS/Zj0=;
        b=YxaHpY9hq2ETy7ZT9wsfuZh+Al3GsSo/uZh8MTXYuP+TtkXojmMimLUkO+l0dl2byQ
         4vfuz9IXIQGpCqVu08PO3GChcqIRC8W0VPwOxtuHlAOUZY7V2SAZwLtYkmBaKrRYq7gA
         x00rlKAjZelvsv4kZ9bOe8FfDaE2watV1FFl0zqN6fJHO7ZLOQD9utkq4/ZgpcQk86Sg
         lR4KrvJa/UT4bph6ANKg+tp/0LNFVaVlLwKtLVdEFMZ8RNB0c6sD7MH32JtCJp2Qj699
         fgQeW72EuwrzkvZoOA3UaDNcEBzdoCJqyUisNWi6c2Rpc/yIdW8JwYUCg6i0eWpspqKy
         EijA==
X-Gm-Message-State: ANhLgQ3vk37ENmtef5uesi+uIDHJkiYJ2MMlT9jsfFGf1w5uwhaYZ7c0
        bTwkJ+OrvPsF/0b6T9zVXA==
X-Google-Smtp-Source: ADFU+vvLlcdF6jawVNDoIZEEWczuYZ+X06SdUAcAB3/cUQVHUpNUfY2aKkUG4UP9cI1cQZfQJpG6+w==
X-Received: by 2002:a92:d108:: with SMTP id a8mr12764691ilb.107.1585591648623;
        Mon, 30 Mar 2020 11:07:28 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d27sm5125485ilg.13.2020.03.30.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 11:07:27 -0700 (PDT)
Received: (nullmailer pid 2568 invoked by uid 1000);
        Mon, 30 Mar 2020 18:07:26 -0000
Date:   Mon, 30 Mar 2020 12:07:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: spi: Convert QSPI bindings to YAML
Message-ID: <20200330180726.GA2312@bogus>
References: <1584098121-18075-1-git-send-email-akashast@codeaurora.org>
 <1584098121-18075-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584098121-18075-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Mar 2020 16:45:20 +0530, Akash Asthana wrote:
> Convert QSPI bindings to DT schema format using json-schema.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Stephen's comment, dropped properties "#address-cells" &
>    "#size-cells" from QSPI node as it's already defined in 
>    $ref: /spi/spi-controller.yaml#.
>  - As per Stephen's comment, dropped description for reg property and
>    answered few Nitpicks.
> 
>  .../devicetree/bindings/spi/qcom,spi-qcom-qspi.txt | 36 ----------
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 79 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> 

Applied, thanks.

Rob
