Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A6643F717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 08:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhJ2GY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 02:24:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46529 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231992AbhJ2GY2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 02:24:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635488519; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=Yel3esmV8ei5iyYJSk+StxllpC/vBvdmQ3GqhawlDvw=; b=jYPAdadsxL0VS9vb9sepW0xq1KKVNyZ29r4T5+B6bh9chC6i+jBk97emlvh1twaCqt+Y17sd
 Nix9LpeobkSUVmuqLbeMzhYydpXKlamyVLJ6A3a0tfO3wyscVcy1ccljD678hPS7MF4jy8WU
 2yu80BH9oRe40JybZa758HEY8F0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 617b9307c8c1b282a5bd3698 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 06:21:59
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26CE2C43460; Fri, 29 Oct 2021 06:21:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD7CEC4338F;
        Fri, 29 Oct 2021 06:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BD7CEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org> <CAE-0n53rkv5SKO74M+7bkuMgaD7tS0k6a8m7KeQL8j3DTHdB_Q@mail.gmail.com> <001401d7cbfc$f0d1d700$d2758500$@codeaurora.org> <CAE-0n53KCUoJWdKTY954OviRX4yShigByHB4L3OGTAGQEaHoqQ@mail.gmail.com>
In-Reply-To: <CAE-0n53KCUoJWdKTY954OviRX4yShigByHB4L3OGTAGQEaHoqQ@mail.gmail.com>
Subject: RE: [PATCH v6 0/3] Add support for sc7280 WPSS PIL loading
Date:   Fri, 29 Oct 2021 11:51:49 +0530
Message-ID: <000001d7cc8d$467fe1c0$d37fa540$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKwJKLJ4tjmgoIJWycFdR/OOcUEpALtul/YAs7NybQC8YyikanzYCeQ
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Friday, October 29, 2021 3:32 AM
> To: agross@kernel.org; bjorn.andersson@linaro.org;
> mathieu.poirier@linaro.org; ohad@wizery.com; p.zabel@pengutronix.de;
> pillair@codeaurora.org; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> kuabhs@chromium.org
> Subject: RE: [PATCH v6 0/3] Add support for sc7280 WPSS PIL loading
>=20
> Quoting pillair@codeaurora.org (2021-10-28 06:08:39)
> >
> >
> > > -----Original Message-----
> > > From: Stephen Boyd <swboyd@chromium.org>
> > > Sent: Friday, October 8, 2021 12:05 AM
> > > To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> > > bjorn.andersson@linaro.org; mathieu.poirier@linaro.org;
> > > ohad@wizery.com; p.zabel@pengutronix.de; robh+dt@kernel.org
> > > Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org;
> > > linux- kernel@vger.kernel.org; sibis@codeaurora.org;
> > > mpubbise@codeaurora.org; kuabhs@chromium.org
> > > Subject: Re: [PATCH v6 0/3] Add support for sc7280 WPSS PIL =
loading
> > >
> > > Quoting Rakesh Pillai (2021-10-03 23:48:50)
> > > > Add support for PIL loading of WPSS co-processor for SC7280 =
SOCs.
> > > >
> > > > Changes from v4/v5:
> > > > - Add yaml conversion for adsp/cdsp dt-bindings
> > > > - Change clock names in wpss dt-bindings
> > > > - Correct mistake in signed-off enail ID
> > >
> > > Can you keep a running tally here of the full progression of the =
series?
> > > That helps to look back and make sure we don't make a comment that
> > > has already been made before.
> > >
> > > One more request. Can you add support for 'firmware-name' like =
there
> > > is in Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt =
so
> > > that we can install firmware into some namespaced/versioned place
> > > instead of having to put wpss files into /lib/firmware?
> >
> > Hi Stephen,
> > I have posted v7 with the support for firmware-name to be provided =
in the
> DT entry.
>=20
> Thanks. I didn't see it in my inbox. No Cc for me?
>=20
> >
> > > It would also be nice to load a
> > > single firmware file instead of having to split the file into many =
pieces.
> >
> > This would require lot of changes and lot of code duplication from =
request
> firmware.
> > Also the base ath11k firmware files have been posted as split files.
> >
>=20
> Other firmwares have done it so it seems technically possible. So =
nothing is
> preventing it?

Yes it should be possible.
I can probably add that support and post it as a different patch series, =
so as to
not club it with the current patch series. Does that sound okay ?

Thanks,
Rakesh Pillai.

