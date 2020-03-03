Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74541769FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 02:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgCCB1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 20:27:42 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43760 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgCCB1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 20:27:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id p125so1307398oif.10;
        Mon, 02 Mar 2020 17:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dm1t6njmdF0LcQ/JwaxNIGbhSwo1xAC4p4QTQOmO8R8=;
        b=CawXHVjfucDcm8PYnJUG/zvfmRygGW4rLRzlMdkP8R1kGSqpoMoNGQ4mkSVJikLGkl
         yZISzWrEgfN7++yRcjeNLLuV8BIe7eKSjdtBhXLWr0N/625sFuMM5Zpq1B0r0F381Z+q
         IykjheosVhjawX5de5FBfMzBvxjS46ftid2C+fIw2Q5Y2Vt/O/OHldYsCE5aH3sUcDcp
         9xj7oc9Lr6vDpRM3f8+QRfkdw3VmGDXmCRF1jf8FkjSjlzheu20/KPyZwYvk3YD6YI3D
         F6DfUN9G7NA9qmr2G5nxrQqvKlvigLDL2+K8QpKm70uk9w5v1hIZZ/lVntV1b6vYk4Jw
         snww==
X-Gm-Message-State: ANhLgQ3biRK11PsE3S+BQQMwujax5Nf0RaSXguVWMPFWOwcSDYPtke/H
        chUckhlC8AR54Z3sihAlwg==
X-Google-Smtp-Source: ADFU+vsOLrRbJEqg2mCQ42mkiK8649lsfjK2gGOYitmyBCzRYRCQ7IPikdu5vvzjOfnVmGDit5rOJg==
X-Received: by 2002:a05:6808:b13:: with SMTP id s19mr849527oij.119.1583198861487;
        Mon, 02 Mar 2020 17:27:41 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 16sm6352863otc.33.2020.03.02.17.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 17:27:40 -0800 (PST)
Received: (nullmailer pid 6739 invoked by uid 1000);
        Tue, 03 Mar 2020 01:27:39 -0000
Date:   Mon, 2 Mar 2020 19:27:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: soc: qcom: apr: Add protection
 domain bindings
Message-ID: <20200303012739.GA6699@bogus>
References: <20200302184723.16420-1-sibis@codeaurora.org>
 <20200302184723.16420-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302184723.16420-3-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue,  3 Mar 2020 00:17:22 +0530, Sibi Sankar wrote:
> Qualcomm SoCs (starting with MSM8998) allow for multiple protection
> domains (PDs) to run on the same Q6 sub-system. This allows for
> services like AVS AUDIO to have their own separate address space and
> crash/recover without disrupting the other PDs running on the same Q6
> ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
> between the APR service and the PD on which the apr service runs.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> V5:
>  * Picked up Bjorn's R-b
> 
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
