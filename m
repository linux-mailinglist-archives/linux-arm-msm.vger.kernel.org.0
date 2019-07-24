Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3ED57402A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 22:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388005AbfGXUiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 16:38:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38603 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfGXUiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 16:38:17 -0400
Received: by mail-io1-f68.google.com with SMTP id j6so17301579ioa.5;
        Wed, 24 Jul 2019 13:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ig1T9SyqlUDJYVe+Q7QUnZx6uhT+8970g64EOP4FCE=;
        b=ORARdmkLzdjhzKN/VQwZdJlGHi038+0mnEAR2ulZwqSx5TVRc1hmU8WRdBiQTfh4xc
         qAFsWpQpGpN6UjTek+7zCn4AShBRqWIXUNLRL+bgd2X5Gl7H5E25rY8sqdeeaVUeoc5t
         99crDCknPOJCTAbiyz+tK2sCcytE5HM0A79+bsADMyMpjJ+y37tO0AXgCiMb/4ZqQr6q
         J2iFcOoQmsdD+b0iqwQlECbxBXzr1DwnjDZgnnGIkWFBgzpfbOD3u6JXy8JAIumSlTGN
         sIat8fXug1JPCutFKQYD2cvM4CxRNmKd4IPxTzjzq4V/jcRjrn2y68o9EhaolUYWURHC
         ZmUg==
X-Gm-Message-State: APjAAAVpP3bix0qfq4/PUsF9Pr1fwc8hfVWwvrfNZhOma6ZpqOyB+i5S
        5mukkKAeFXhP1KtOJB+8gw==
X-Google-Smtp-Source: APXvYqwlzrx3OBmeqGyfmRd3NDYYWQ2IgAzVUZHO6FxVcQomCCfRTCWfHeDO5LVjNiuSa45nkbMgkg==
X-Received: by 2002:a02:ccdc:: with SMTP id k28mr4836178jaq.41.1564000696478;
        Wed, 24 Jul 2019 13:38:16 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id f20sm36795049ioh.17.2019.07.24.13.38.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:38:16 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:38:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH 10/12] dt-bindings: firmware: qcom: Add compatible for
 IPQ8074 SoC
Message-ID: <20190724203815.GA29982@bogus>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-11-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562859668-14209-11-git-send-email-gokulsri@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Jul 2019 21:11:06 +0530, Gokul Sriram Palanisamy wrote:
> Add compatible for IPQ8074 support.
> This does not need clocks for scm calls.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
