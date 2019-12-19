Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44141126491
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 15:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfLSOZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 09:25:31 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33496 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSOZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 09:25:31 -0500
Received: by mail-io1-f67.google.com with SMTP id z8so5942570ioh.0;
        Thu, 19 Dec 2019 06:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XnF/uehLL84V1vkG+Snc8Ul1hkW/yuH+aVf155kbS4=;
        b=GcIQFBxCUDQnZv4JORlyc6AJAPDoWIQkad1VCZEHwSk4CYCaxgaaELYyObtNudWhLu
         DdqB1OgWOg7zyTGLuXc2wSMF/OnK6lRWfPoo8YIhk5RLr0PJBzNni0QC77pIzgniqzHp
         kN5C71xyD/btbzMeAIjkFUB7RHSYr+0pZJrQmp/orAw2GP5W4b0vzx7ZasU4r/y6+ir8
         LNOGignP3BcqPOW0+OpmSE4YL0IpMC4A51+QkOY5id+Em5nC/fUdSA9DP+Sy3mtygF4D
         0qgUkjGjnAYr5d5+FWh8QG5K0zrTTFrqtx8Y4NDcb+nNyW9vEt1y0ivEleN3djCsMBNW
         X57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XnF/uehLL84V1vkG+Snc8Ul1hkW/yuH+aVf155kbS4=;
        b=Hjp6QmYJrrw2VRid1IgeVbX77gJUcRVtOdMScHnbv3LCjKHsfd3J+yR2NHIDkbqjxh
         mVeSiIwLlnli/uJj1GEyZtiZNm2UM2XCSb71yjQ4i5JmuXmj7Kdb6P9/I/7VXvkcy5ug
         XPGcjliKj+GwTvaDRG6x4wytZO7UgzFA6vqp0D0XGOX4QFAO82DTKdaFbMIkwnnyeA+I
         LJAZ4hghtfghJ/Bws/uEu0ctZwo446RsSp2V2eVXAAMPoF2KL7vd1ODKCkEg/PqRIO2+
         KBV3QHsy2ON6ZZC4d7e2QcUyDkbqnrl6tgxQoNsev2QGOjLZq9wCJnfXZPxl5HAFv5ru
         DiFg==
X-Gm-Message-State: APjAAAU9uaSeFdUj39jyYtV36G7nlP2RORt6fDg7vSza6Cxmem562oFY
        WtJWVicjsVrvdoQyboFfs7ADRcV6emzV8uvQj9o=
X-Google-Smtp-Source: APXvYqxV8p46grVHwtLDZow1CVwGexIWq2/WeOp2R1mxJR2VAMQLIcTNTaK0Otep4R6omcV1hDFNmaAuZfn2Fm9RcS0=
X-Received: by 2002:a5d:9c4e:: with SMTP id 14mr6220184iof.166.1576765530409;
 Thu, 19 Dec 2019 06:25:30 -0800 (PST)
MIME-Version: 1.0
References: <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
 <20191217041342.GM2536@vkoul-mobl> <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl> <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
 <20191217150852.GO2536@vkoul-mobl> <CAOCk7Np691Hau1FdJqWs1UY6jvEvYfzA6NnG9U--ZcRsuV5=Zw@mail.gmail.com>
 <75f7065d08f450c6cbb2b2662658ecaa@codeaurora.org> <20191218041200.GP2536@vkoul-mobl>
 <983c21bb5ad2d38e11c074528d8898b9@codeaurora.org> <20191219142145.GV2536@vkoul-mobl>
In-Reply-To: <20191219142145.GV2536@vkoul-mobl>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 19 Dec 2019 07:25:19 -0700
Message-ID: <CAOCk7NrKRXsTffNyQFt_tQmdNq7+SaH+kAJVk8AAPJWJjPxYYw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for host controller
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, Mark Salyzyn <salyzyn@google.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 7:21 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 19-12-19, 15:12, cang@codeaurora.org wrote:
> > On 2019-12-18 12:12, Vinod Koul wrote:
> > > On 18-12-19, 02:44, cang@codeaurora.org wrote:
>
> >
> > Aside of the phy settings, your DT needs some modifications too,
> > seems you copied most of them from sdm845.
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3834a2e92229ef26d30de28acb698b2b23d3e397
> >
> > <--snip-->
> > > +           ufs_mem_phy: phy@1d87000 {
> > > +                   compatible = "qcom,sm8150-qmp-ufs-phy";
> > > +                   reg = <0 0x01d87000 0 0x18c>;
> >
> > The size 0x18c is wrong, in the code you are even accessing registers
> > whose offsets are beyond 0x18c, see
> >
> > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0     0x1ac
> > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0     0x1b0
> > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1     0x1b4
> > #define QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL           0x1bc
> > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1     0x1b8
> >
> > FYI, the total size of serdes registers is 0x1c0.
>
> Yeah I will update it to 0x1c0
>
> >
> > <--snip-->
> > > +                   ufs_mem_phy_lanes: lanes@1d87400 {
> > > +                           reg = <0 0x01d87400 0 0x108>,
> > > +                                 <0 0x01d87600 0 0x1e0>,
> > > +                                 <0 0x01d87c00 0 0x1dc>,
> >
> > Same as above, see
> >
> > #define QPHY_V4_MULTI_LANE_CTRL1                      0x1e0
> >
> > FYI, the total size of PCS registers is 0x200
> >
> > > +                                 <0 0x01d87800 0 0x108>,
> > > +                                 <0 0x01d87a00 0 0x1e0>;
> > > +                           #phy-cells = <0>;
> > > +                   };
> > <--snip-->
>
> So I managed to fix it by configuring QPHY_SW_RESET in
> qcom_qmp_phy_com_init() before invoking the configuration. That makes it
> work for me. Will send patches shortly

So, you are going to send some fixes to make sm8150 work.  We also
need the extended timeout for all platforms, yes?  Who is going to
send up the patch for the timeout?  All of this should be -rc material
since Can's change caused these issues to appear, and thus impact
users, no?
