Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7386F110353
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 18:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfLCRWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 12:22:04 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40522 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfLCRWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 12:22:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id 6so4024034oix.7;
        Tue, 03 Dec 2019 09:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EduQNuZ/frXhoLZv2wiMhaS2zZA1+4Gr77cWKQhGnsg=;
        b=YQs65eRu+JUInxe8FGaUbtad8isDFLEVbssmvlb52+Hzfstzl8LE9t2AGxaTZ0w0Fo
         bSY9eXEwcHoGzgnzrrEAZ2LSXUpobgGiEY5zWk1jCWnRVcsMY6oW9pKuFNTrSfh0l60N
         6EVsQYWKKV/izlhpK6x+LT4IYBFn5x/jVfHtuxw2+f1SOY3zwFlwoDYuOX3TzvT2o2/S
         GoXEvEpjv02CVUXDNl5GbjM1SgFezisOGVkmCDTzdDx+dvYDSF0JLRWPbMMs233FHjKG
         1TRS55iFjftxlBMFaxHu7CeBg7Q69uao5K/xBki2Zhl4wI9y7zZNXLtIFbdGkMOpbPSJ
         B9JA==
X-Gm-Message-State: APjAAAUkAaL9KM5QHbs2AqL2E26PNkQrxYZmhxAmrU68iZXVH+0Y9XFG
        PM10deZmMSl89rLA5eocgA==
X-Google-Smtp-Source: APXvYqyGYOZ644SZPs+4ZNKNRiOarH3mRzeAn1oNpytki1XcTzsrQlg7LEKOdDSGPMrZSVea4+ehkw==
X-Received: by 2002:aca:ad11:: with SMTP id w17mr4661144oie.85.1575393723611;
        Tue, 03 Dec 2019 09:22:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm1231165oti.44.2019.12.03.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:22:03 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:22:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: clock: Introduce QCOM Video clock
 bindings
Message-ID: <20191203172202.GA16424@bogus>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
 <1573812304-24074-8-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812304-24074-8-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 03:35:03PM +0530, Taniya Das wrote:
> Add device tree bindings for video clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml    |  1 +
>  include/dt-bindings/clock/qcom,videocc-sc7180.h    | 23 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7180.h

Again, subject is misleading and needs SC7180 in it.

Reviewed-by: Rob Herring <robh@kernel.org>
