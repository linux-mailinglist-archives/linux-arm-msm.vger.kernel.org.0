Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C79426235
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhJHCBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 22:01:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43568 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231259AbhJHCBE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 22:01:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633658349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GCFiim/rTvfKlleCreUXvJn479MEzv6lw3Z8MYg2T+8=;
 b=qBG80E2IY3hYj325c9/pUm/JcbOnh3biCBmXO0AG476o9iGm/vz93Vxp0UGlq0ibE8GKRvxY
 QBucz3ROcoxHCgqHplXa8fPAaaIFDUbEI/HouCVVcuYrazS9mP8h66Pco3XB1/wBtBe8NO56
 7hf8gR95DVc0DPWtdQfu9dvmxOk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615fa5eaf3e5b80f1f0c829e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 01:59:06
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46D66C43619; Fri,  8 Oct 2021 01:59:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84BBEC4338F;
        Fri,  8 Oct 2021 01:59:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Oct 2021 07:29:05 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v12 4/5] PCI: qcom: Add a flag in match data along with
 ops
In-Reply-To: <CAE-0n51NfLevCSwDDK0pxg=zmdw7pqw-wGEV2_MxBZZvh_caOQ@mail.gmail.com>
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org>
 <1633628923-25047-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n51NfLevCSwDDK0pxg=zmdw7pqw-wGEV2_MxBZZvh_caOQ@mail.gmail.com>
Message-ID: <6007d4168a942dd95661705a675bd8dc@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-07 23:33, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-10-07 10:48:42)
>> Add pipe_clk_need_muxing flag in match data and configure
> 
> This commit text isn't accurate. The flag isn't added in this patch
> anymore. Same goes for the commit title/subject. Can you please update
> it to say something like "Point match data to config struct"?
> 
Hi Bjorn,

Could you please update below commit text while taking this patch.

"PCI: qcom: Replace ops with struct pcie_cfg in pcie match data.

Add struct qcom_pcie_cfg as match data for all platforms.
Assign appropriate platform ops into qcom_pcie_cfg and read
Using of_device_is_compatible in pcie probe. "

Thanks
-Prasad

>> If the platform needs to switch pipe_clk_src.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
> 
> Otherwise code looks fine:
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
