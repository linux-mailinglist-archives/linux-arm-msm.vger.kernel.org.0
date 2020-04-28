Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190931BBB2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 12:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgD1KZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 06:25:46 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48811 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727025AbgD1KZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 06:25:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588069545; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mt8ZKt7ekHYxZxwdLyFwpLcwX/dr8EXCmWDuLwuteJM=;
 b=bYn2LaU3du2Raq3HjXY3pjLcFDVHWlOz919rEBEFupw81k5aH752YCI6i2ZzKIRH/fB2Ontj
 eusu35UOjNuZ0OK+PAq9PLa+Z/WgqtXFsBPqo0sD3Pt6V46nFCTSJg1tIPvUd3L9lzrXlPMf
 Pfp9vzVJ1PiQjdxLGgISb+Ur6qY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea804a5.7fbc61c1f688-smtp-out-n05;
 Tue, 28 Apr 2020 10:25:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5E44C433F2; Tue, 28 Apr 2020 10:25:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34211C433CB;
        Tue, 28 Apr 2020 10:25:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Apr 2020 15:55:40 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8250
 remoteprocs
In-Reply-To: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
References: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
Message-ID: <e131cbd9e7e5971ead1e21f21d3eb2f1@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

On 2020-04-28 05:31, Bjorn Andersson wrote:
> Add the SM8250 audio, compute and sensor remoteprocs to the PAS DT
> binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9938918b2fea..49ec30454198 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -21,6 +21,9 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,sm8150-cdsp-pas"
>  		    "qcom,sm8150-mpss-pas"
>  		    "qcom,sm8150-slpi-pas"
> +		    "qcom,sm8250-adsp-pas"
> +		    "qcom,sm8250-cdsp-pas"
> +		    "qcom,sm8250-slpi-pas"
> 
>  - interrupts-extended:
>  	Usage: required
> @@ -44,6 +47,9 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
>  	qcom,sm8150-slpi-pas:
> +	qcom,sm8250-adsp-pas:
> +	qcom,sm8250-cdsp-pas:
> +	qcom,sm8250-slpi-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  	qcom,qcs404-wcss-pas:
>  	qcom,sm8150-mpss-pas:
> @@ -105,10 +111,13 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sdm845-cdsp-pas:
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
> +	qcom,sm8250-adsp-pas:

Looks like adsp also uses lcx and lmx
similar to slpi, the rest looks good

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +	qcom,sm8250-cdsp-pas:
>  		    must be "cx", "load_state"
>  	qcom,sm8150-mpss-pas:
>  		    must be "cx", "load_state", "mss"
>  	qcom,sm8150-slpi-pas:
> +	qcom,sm8250-slpi-pas:
>  		    must be "lcx", "lmx", "load_state"
> 
>  - memory-region:

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
