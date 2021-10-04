Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAE5420857
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 11:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhJDJfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 05:35:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19710 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229957AbhJDJfl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 05:35:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633340033; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=qUNHZb0uOBf23YbH/IKy0LIqI7m7T3i+2/LOp8jLh68=; b=immGSCGdIBRFpuh7Qm43AtdGVNeyRFE9+H5uxsNtjeYFGdM3y5SIexzVfGhwqIOuOkNf1t1d
 HjgdHyUNp5xh7sfOvMT3VNUF2s/CnEkD/9KYDmaE4PfvCRdTG0TKUmO4bPuCak/0kyBSWCcS
 Mw2+w672cMlvWHJrr4owINNgucs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615aca7c63b1f18658e7cafc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 09:33:48
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DD34FC4360C; Mon,  4 Oct 2021 09:33:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76272C43460;
        Mon,  4 Oct 2021 09:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 76272C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <swboyd@chromium.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1631874884-5166-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1631874884-5166-1-git-send-email-pillair@codeaurora.org>
Subject: RE: [PATCH v4] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Mon, 4 Oct 2021 15:03:39 +0530
Message-ID: <004601d7b902$ed85a1b0$c890e510$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
thread-index: AQG/dyCBpBhr7yDJIbp2QEPSU1NhJ6vzF1uw
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Friday, September 17, 2021 4:05 PM
> To: agross@kernel.org; bjorn.andersson@linaro.org; robh+dt@kernel.org;
> swboyd@chromium.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> kuabhs@chromium.org; Rakesh Pillai <pillair@codeaurora.org>
> Subject: [PATCH v4] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
> 
> Add the WPSS remoteproc node in dts for
> PIL loading.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v3:
> - Fix the qcom,halt-regs
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 63
> +++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 

I have sent v5 after rebasing to latest linux-next.

Thanks,
Rakesh Pillai

