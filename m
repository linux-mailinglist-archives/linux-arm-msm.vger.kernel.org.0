Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6906110D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 21:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfEATm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 15:42:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41129 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfEATm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 15:42:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id g8so5025otl.8;
        Wed, 01 May 2019 12:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/akMSMW0lkhkcz4fLafCmBrbNFX/5xviGaoV6lXM1Y8=;
        b=NyFG1lEsp8uwSAL33/aZOkumkCoxlJy//Ep6DoGcQ+Bz2GPohsp6M/+tr+jRc7J60q
         wvpfM7IL78LlZfPz55o0iWRnyz8wxKEgzVx9U6wlRboMH6vwSiTUO7tNJPNXfUfo0mie
         ET3+1JgsHRtRgf50W0lxKp2pl5jIswJSjs3CO1A8LV7htp5K349SgddKx/P69ah4yWG1
         et5akwOD6svGngHLJA+D2KwENyEcR+I6+K8QmTStBklAqrfvG+cLQnMugsxxnX+v3g7K
         Dt2G4I4Xs2KGpy4Lbrd2av5LqTBD4NammLlnE17/ktgw8GU8PYNz9Z4LHgynK/To2eBX
         /nJg==
X-Gm-Message-State: APjAAAVWMOizvYq+VR29WpX20TY7AfVusVpoHHVsNaHy5bVgu3dY5Djq
        h9BnFQ6TX9J9To3vSCA1Bw==
X-Google-Smtp-Source: APXvYqy7QZlChMFuDIvHaPNMKu8rKskf7m4kpsM8BwMmpGUyLD23FF9FutcQYt299vngj2/BqVSlmw==
X-Received: by 2002:a9d:30f:: with SMTP id 15mr17258580otv.236.1556739746283;
        Wed, 01 May 2019 12:42:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b51sm18552291otc.8.2019.05.01.12.42.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 12:42:25 -0700 (PDT)
Date:   Wed, 1 May 2019 14:42:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Message-ID: <20190501194224.GA991@bogus>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Apr 2019 21:37:31 -0700, Bjorn Andersson wrote:
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Added #clock-cells
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 81 +++++++++++++++++++
>  include/dt-bindings/power/qcom-aoss-qmp.h     | 14 ++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
