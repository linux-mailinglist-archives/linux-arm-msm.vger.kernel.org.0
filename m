Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F6B20243D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgFTOoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:44:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58385 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgFTOov (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:44:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592664290; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=Z5Q7QuSRV0AlAio71S0FB6kALc6xp3I4DkvvHs47BtU=; b=rmwX1xLIe3ECo4b5bvCfbl6Qju6jzcoVBIBGNwBheWyGfPtzzK/2YNqSFuOUce0QtH6m6hIu
 vX/YOLW21XRfN8rfKD56y+CeTAYNaJql6k40BqRo82fRL38pB3SL3CCJ0cPhGtNHguC/Pe2L
 NrFc+QrDsfYgPy0dna4iZI7DxWE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5eee20e1356bcc26ab67d05b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 20 Jun 2020 14:44:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D697DC43387; Sat, 20 Jun 2020 14:44:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.71.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E189C433C9;
        Sat, 20 Jun 2020 14:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E189C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   "Rakesh Pillai" <pillair@codeaurora.org>
To:     "'Evan Green'" <evgreen@chromium.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>,
        "'linux-arm Mailing List'" <linux-arm-kernel@lists.infradead.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>
References: <1589946996-31264-1-git-send-email-pillair@codeaurora.org> <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com> <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
In-Reply-To: <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
Subject: RE: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Sat, 20 Jun 2020 20:14:43 +0530
Message-ID: <000101d64711$587929c0$096b7d40$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG/PI1FMT9lT4wFnqoECWl87ZLpcgLOq7cUAp/L6tWo5DW1wA==
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Evan,
All the dependent patches are already merged.

Thanks,
Rakesh Pillai.

> -----Original Message-----
> From: Evan Green <evgreen@chromium.org>
> Sent: Thursday, June 18, 2020 4:15 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; linux-arm Mailing List <linux-arm-
> kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>; linux-
> arm-msm <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
> 
> On Thu, May 21, 2020 at 9:19 AM Evan Green <evgreen@chromium.org>
> wrote:
> >
> > On Tue, May 19, 2020 at 8:57 PM Rakesh Pillai <pillair@codeaurora.org>
> wrote:
> > >
> > > Add device node for the ath10k SNOC platform driver probe
> > > and add resources required for WCN3990 on sc7180 soc.
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> >
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> 
> Looks like this never landed anywhere. Is it blocked on something?
> -Evan

