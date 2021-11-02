Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E124B442F47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 14:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhKBNsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 09:48:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63332 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231576AbhKBNrz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 09:47:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635860720; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=KUvUGRZzsphP6mR3IJn0PbjCPeH/bpgZmxetMRolTjY=; b=TizQjLp6B6VkfeqBpNhztxJBYSPculUD3TKYA2ORaaTgLbF6oHsQiaRNwPHkl/HmU9+ZYCSY
 kC+MTuiYVVpqHC+kFI+4m9uqw4LGANOoSCBMWvOod+kl8AqA+zgj0dRhpCM9OFdnxHtvCNXJ
 QJtGraGWx4ZczNeq6SFfN7VGhUg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 618140f097bbea7fcc7f5019 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 13:45:20
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E139C43637; Tue,  2 Nov 2021 13:45:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9DFFC4338F;
        Tue,  2 Nov 2021 13:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D9DFFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org> <1635408817-14426-3-git-send-email-pillair@codeaurora.org> <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com> <000201d7ccb2$300dba50$90292ef0$@codeaurora.org> <CAE-0n5155J4vvvFES9V5=v+nX3BhZsBgZxkB=uLQOPij=-sf-Q@mail.gmail.com>
In-Reply-To: <CAE-0n5155J4vvvFES9V5=v+nX3BhZsBgZxkB=uLQOPij=-sf-Q@mail.gmail.com>
Subject: RE: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Tue, 2 Nov 2021 19:15:09 +0530
Message-ID: <001f01d7cfef$dee34a50$9ca9def0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJgH59fIqV+fNPJ+TYlgPfT9cxLcAIxEhLJAenqyY8CQYFEaQEeLmltqqOPGyA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Saturday, October 30, 2021 12:34 AM
> To: agross@kernel.org; bjorn.andersson@linaro.org;
> mathieu.poirier@linaro.org; ohad@wizery.com; p.zabel@pengutronix.de;
> pillair@codeaurora.org; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: RE: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
>=20
> Quoting pillair@codeaurora.org (2021-10-29 03:46:03)
> >
> > > > +
> > > > +        glink-edge {
> > > > +            interrupts-extended =3D <&ipcc IPCC_CLIENT_WPSS
> > > > +                                         =
IPCC_MPROC_SIGNAL_GLINK_QMP
> > > > +                                         IRQ_TYPE_EDGE_RISING>;
> > > > +            mboxes =3D <&ipcc IPCC_CLIENT_WPSS
> > > > +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > > > +
> > > > +            label =3D "wpss";
> > > > +            qcom,remote-pid =3D <13>;
> > >
> > > There are a few properties here that don't seem to be required. Is
> > > that intentional?
> >
> > Hi Stephen,
> > All the properties in the example are listed as required (except for =
status,
> which will be removed in the subsequent patchset).
> > Do you mean the glink-edge node properties ?
>=20
> Yes I mean all the properties in the glink-edge node. Are they =
required?
> If so then we need to list them in the schema.

Hi Stephen,
I have sent v8 with glink-edge properties also included in the =
dt-bindings.

Thanks,
Rakesh Pillai.

