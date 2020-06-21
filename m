Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB02B202980
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 10:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgFUIKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 04:10:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42945 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729443AbgFUIKC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 04:10:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592727001; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HyZDykHix6taHtVq72aHUlzecKTkuNU4dxaJTt++DpU=;
 b=NB6yQuWMgvH4y/a7ygAAJ8fvUHN496LihtaMtk+RkXePJezsMsw09UzwBJ/MsmhyhbsnlVms
 Ai+xzLESBMp/MKdmC10tx2pmeDvDm/Wk4LbJSfAwlYnyD8GIL/EYaRgG2gqf5hxTzB8DRk+t
 UySTIatxaevTz9uMgMLihvEvzuo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5eef15cd4c9690533aae8e5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 21 Jun 2020 08:09:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4D9AC433A0; Sun, 21 Jun 2020 08:09:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F709C433CA;
        Sun, 21 Jun 2020 08:09:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 21 Jun 2020 13:39:49 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
In-Reply-To: <20200621072213.GG128451@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <20200621072213.GG128451@builder.lan>
Message-ID: <f40621b2b01f836a8a97686707599dd0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-06-21 12:52, Bjorn Andersson wrote:
> On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:
> 
>> Define iommus property for Coresight ETR component in
>> SC7180 SoC with the SID and mask to enable SMMU
>> translation for this master.
>> 
> 
> We don't have &apps_smmu in linux-next, as we've yet to figure out how
> to disable the boot splash or support the stream mapping handover.
> 
> So I'm not able to apply this.
> 

This is for SC7180 which has apps_smmu not SM8150.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
