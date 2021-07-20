Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEACE3CF4E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242437AbhGTGQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 02:16:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49137 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239984AbhGTGQD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 02:16:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626764202; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8VWaABdAhBRGHanwpZF/mF08jZhYkLDVGaS3vQELGJs=;
 b=pfcB5OUxQSbBUmFeBhd+UgkGqijGf1VwvBQbO4HLdVU3uuirwyCsQPnsUJ1vhNKMX+xH5t8U
 0FffjT2LukYZlLmZcZzm8gnVA7sIfBtashB0Wa5jVCkkwx+z51Whmk07WWQUiCeGEcU41EZq
 o64l/Uq53cr794XYH2WvjaMPE0c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f6738c1d1afe585e688d33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 06:56:12
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07CC9C4360C; Tue, 20 Jul 2021 06:56:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3657EC433D3;
        Tue, 20 Jul 2021 06:56:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Jul 2021 12:26:11 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 1/4] dt-bindings: pci: qcom: Document PCIe bindings for
 SC720
In-Reply-To: <CAE-0n51g66F7A7Kuz+GQwnYfEX_BXKQR7YD=4PhJAEGkBu6AsQ@mail.gmail.com>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-2-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n51g66F7A7Kuz+GQwnYfEX_BXKQR7YD=4PhJAEGkBu6AsQ@mail.gmail.com>
Message-ID: <64bc17a0ba77edde716bbc24e10e01e9@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-17 00:57, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-07-16 06:58:44)
>> Document the PCIe DT bindings for SC7280 SoC.The PCIe IP is similar
>> to the one used on SM8250. Add the compatible for SC7280.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Any chance this file can be converted to YAML?

Yes, we can convert into YAML. we will incorporate the change in next 
version.
