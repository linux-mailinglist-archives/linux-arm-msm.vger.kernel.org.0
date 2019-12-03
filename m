Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0002E111B47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 23:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfLCWBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 17:01:31 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43784 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbfLCWBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 17:01:31 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so4390152oth.10;
        Tue, 03 Dec 2019 14:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ssHKSGoKkEHtJdMwxpp+yPyrEs5401UP7IvVXv37ViI=;
        b=mBh+xuSNhhtH8dNUZkav6LqzH/vnyNwFPHXgyu9ymYo1P6NbTLSMihdDNMHFMVNg5R
         lkib5RxIitTPwNaMr2l5ts4kiLw/C012jzkqiM/A5vmSxVd18OkqXTccKRaRwnyz4Vvw
         +JOZSZJZIeiv8BB+sNub8Ovu7SIRqSUDEWRAbUw8M9kQN/LiQuhBb9h3WCoh6ccsb9Mg
         cjgtbryWRDbogKlBj/RCZpi+3dYe3PEooozV13AgmoCjPCsKeD5jRxtUfkI35htr/3Ey
         YaDBD1SSNc5Bg2JI7XNAw0qs5jIXHEGsyJAYyhsOUEIMluX9RML8AjWzcBc14JfuNm9m
         p4Mg==
X-Gm-Message-State: APjAAAVfx39uiMvoqD4Y+BR3aXahkiiWtfw622KFun/WhgBHPKCbe2w7
        mzwpswbgI+c688kZQARnYA==
X-Google-Smtp-Source: APXvYqwMnq80UUBpDV2cXHegMQxK9aSYFb9RTYgEkBBHBCKWiXTuW+DruOeNtwJhZGi7U4zduIKUSg==
X-Received: by 2002:a9d:53cb:: with SMTP id i11mr70500oth.158.1575410490238;
        Tue, 03 Dec 2019 14:01:30 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a74sm1599237oii.37.2019.12.03.14.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 14:01:29 -0800 (PST)
Date:   Tue, 3 Dec 2019 16:01:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com,
        mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 08/16] dt-bindings: remoteproc: qcom: Add ADSP and SLPI
 support for MSM8998 SoC
Message-ID: <20191203220128.GA21208@bogus>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e8078b957-e3cf34ad-0bd0-41b0-9d92-ec1d86df352c-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e8078b957-e3cf34ad-0bd0-41b0-9d92-ec1d86df352c-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Nov 2019 21:43:45 +0000, Sibi Sankar wrote:
> Add ADSP and SLPI compatibles for MSM8998 SoC.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
