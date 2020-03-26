Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BCF193DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 12:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgCZLXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 07:23:22 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40976 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727560AbgCZLXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 07:23:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585221801; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=V7U5JvFT204MJ8+8hEWOkXRat6eH6xB2Y/6EMB2A6vY=; b=jAQTIHpRbq//KfGSfkOz6iiVbcaQgb+rqtO5bioORCeD0QyzBNw+B5B5M0ou4pVALLng8vaU
 U1drMm0+CxCrGS9Vys417ucMvQs3Prn1grbQVDZaG8ZwGOMCaVRfI7YX9QM4KU9SIKUYkTll
 jeE2FiKCs3c++bGSWQm+h2PFhTw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c909f.7f655da0d260-smtp-out-n01;
 Thu, 26 Mar 2020 11:23:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE755C433BA; Thu, 26 Mar 2020 11:23:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.66.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C65AC433D2;
        Thu, 26 Mar 2020 11:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C65AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Evan Green'" <evgreen@chromium.org>
Cc:     "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>,
        "'linux-arm Mailing List'" <linux-arm-kernel@lists.infradead.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org> <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com> <000901d60295$3acc79b0$b0656d10$@codeaurora.org> <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
In-Reply-To: <CAE=gft7zqbUnx+BULDD+35z2p1=545=jF0=n6kFXZgo3ZTdCHQ@mail.gmail.com>
Subject: RE: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Thu, 26 Mar 2020 16:53:05 +0530
Message-ID: <000c01d60360$eea25c90$cbe715b0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr1eNiqDxek+JigOIeIUW3T4FxSwDFrKGDAq7vyx4BaNAawqeIIUVw
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Evan,

I have sent out the v7 patch by marking a dependency on the below =
mentioned series
https://patchwork.kernel.org/project/linux-wireless/list/?series=3D261367=
=20

> The clocks are missing:
> clocks =3D <&rpmhcc RPMH_RF_CLK2>;
> clock-names =3D "cxo_ref_clk_pin";
These clocks are optional and were required for older firmware.
It's not needed now.

Thanks,
Rakesh Pillai

> -----Original Message-----
> From: Evan Green <evgreen@chromium.org>
> Sent: Wednesday, March 25, 2020 9:34 PM
> To: pillair@codeaurora.org
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; linux-arm Mailing List <linux-arm-
> kernel@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>; =
linux-
> arm-msm <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
>=20
> On Wed, Mar 25, 2020 at 4:05 AM <pillair@codeaurora.org> wrote:
> >
> > Hi Evan,
> >
> > I will send out a v7 for this patchset.
> > Since I have to configure the S2 SIDs, it is dependent on below =
ath10k
> patchset.
> > =
https://patchwork.kernel.org/project/linux-wireless/list/?series=3D261367=

>=20
> Ah, right. Thanks for the info, I'll check out that series as well.
> -Evan
