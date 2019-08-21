Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2008098795
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 01:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731287AbfHUXCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 19:02:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41573 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbfHUXCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 19:02:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so2173787pls.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 16:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NpuoQpLKK7WyEkPSccJxDwY6STNHznjukxBqZ31nzB4=;
        b=OzsNA61dc5J+KQA9dM2aHRJYNGKNDPTCblKWMfh4/UWZQleUwplGb5CCKwPToD2cAx
         FcMT/7tDtdVWavTPAWVuj5i6ncwyz/OL+I5ZYxCGCVDAQc6/h0IbKyyzsHuaenGNWz2t
         kVRQWGtQDOvlsg9SnUnKU5a8c7Rl2oVR03N89QrWEiFdqERXBcO8tLGd2qenDJtofH/S
         CTg+KgIqan+qgQUiT+ijzNLnvIBfAYWyyggsooT7jNIIwN8LTAHCRtPosnqlYk1Tdn29
         +heKXNQ+NGewltTzenkU+cpu5vI4OJ5qup2kjb28r5SW2hZ961Aw8oyEZV0ZfLcP/dxf
         WLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NpuoQpLKK7WyEkPSccJxDwY6STNHznjukxBqZ31nzB4=;
        b=ipkS+WY2UFUUVPoR9DkGfP6rG4vaMKHDatDGAS1ob2klovBeZdGINMM5FF+e/KMUnU
         DJObzSaf8xXq2p4SmuKg3CxbyxHH+Mo2SINhgu3zx3jtdsnh0NuGLh8tGMpFiSyK68EH
         na2NsQT34UsjIwKi3Sins1cD+Aq90TGPlZNodyqUfAMtrnhx/Q6wjj9D//QxS7sJh2Rc
         tV8pzQpWWeBA1ajSNQe9z64tKl7lZPc4I9qGI0l0aDGvuIeTg6dpw6pdGZSnNJma0iSS
         o1oigOF/U7wDln2+TrQ9PqazkAjBVXzs5RKA2E7lyt4VJcl96n4F59hgkokPBMAW5JpO
         NKcA==
X-Gm-Message-State: APjAAAXhSMwHeECJq/iw02UJTu/aUfDVQ15hgyb+8V5hzliy1voO/iuC
        yVEBDpCnxwSt2NtrFoaSsC3vvA==
X-Google-Smtp-Source: APXvYqxkzHLGY8L8dgDlNxoq4G+xKv8wVs2YvpjbObYmqSCZZWIvjwfgn1krBkgU0vu+qoeM1SVaXg==
X-Received: by 2002:a17:902:4201:: with SMTP id g1mr36449071pld.300.1566428530503;
        Wed, 21 Aug 2019 16:02:10 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 67sm968321pjo.29.2019.08.21.16.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 16:02:09 -0700 (PDT)
Date:   Wed, 21 Aug 2019 16:03:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org,
        mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org
Subject: Re: [PATCH v2 0/7] Add support for Qualcomm SM8150 and SC7180 SoCs
Message-ID: <20190821230356.GB1892@tuxbook-pro>
References: <20190807070957.30655-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807070957.30655-1-sibis@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Aug 00:09 PDT 2019, Sibi Sankar wrote:

> This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
> support on SM8150 and SC7180 SoCs.
> 
> v2:
>  * re-arrange the compatible lists in sort order
> 

Applied patches 1-3 and 6-7.

Regards,
Bjorn

> Sibi Sankar (7):
>   soc: qcom: smem: Update max processor count
>   dt-bindings: firmware: scm: re-order compatible list
>   dt-bindings: firmware: scm: Add SM8150 and SC7180 support
>   dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
>   mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
>   dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
>   soc: qcom: aoss: Add AOSS QMP support
> 
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 4 +++-
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
>  drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
>  drivers/soc/qcom/smem.c                                      | 2 +-
>  6 files changed, 14 insertions(+), 3 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
