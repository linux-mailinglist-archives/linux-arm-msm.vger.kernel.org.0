Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C933B7030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 02:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387468AbfISAw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 20:52:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45757 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbfISAw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 20:52:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id u12so741722pls.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=aUj5fH8SCIRKe1iMCkfPanIAovLrp8yYl66o/9NYKWo=;
        b=LvjG/HWQ46JzRrzs779G3GUc2EUjja+6eYYCQW+CN+ECtbzPA3uUmtYDCKTNyR9LTE
         vYcTOE+Bdm75vukwGdygoVdqTbrnQDtgCiOcL9mlcxORzWG5D7FSAknjtuIKnOOYd+BG
         lPkVmU8VbFq0PyVn9gLlHjMP6ZEHHkbe9eaB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=aUj5fH8SCIRKe1iMCkfPanIAovLrp8yYl66o/9NYKWo=;
        b=G18HGKJESGvF375b1OkaRa9Pg0bH223VY+VHgDa7n2hofqErWLVTMopJR1+ZNXS9uE
         +KvB3cRfeEJQvpo0P50llUieQZHB2syY3OfwgjIoEd+aJ64504hU78jHkzSCkIShZVnl
         ayL6Q+MJT6CFv92cTtT5++2OkUyyAkfYsn0DqBFu/fsS7S6voistBkSODrBy7OWsHJSG
         z4d9jwiTxSryGGUWJd/qrpHFiOHwBNmAsLmrVwxg+8py966MwaX01tLm9PjFO7An8zj0
         kPvAs9ze/lqthkewYXAz9tWypOgwcTg4isZ6Z6TniFAg0r6PPsNUVgdiN11uhj/GIqAR
         OV3g==
X-Gm-Message-State: APjAAAXY0GLzOPfiMgHFJ9NazVPaRUgH4E5qlIHHjwq8FZ+V45z0s437
        996mzgy8VxBjQuv5ZENzBUg32g==
X-Google-Smtp-Source: APXvYqxeWv0h8TDVgOgpmXUxVuXAum/bpheCYuG3gMeHHtM7Z7aGY8eDkRDr9gGiEsr+y2TRcL/Pjg==
X-Received: by 2002:a17:902:8b85:: with SMTP id ay5mr6635215plb.120.1568854346793;
        Wed, 18 Sep 2019 17:52:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u4sm9100156pfu.177.2019.09.18.17.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 17:52:26 -0700 (PDT)
Message-ID: <5d82d14a.1c69fb81.3a5ca.5ffc@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190919002501.GA20859@builder>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org> <1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org> <20190919002501.GA20859@builder>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
User-Agent: alot/0.8.1
Date:   Wed, 18 Sep 2019 17:52:25 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-09-18 17:25:01)
> On Tue 17 Sep 02:45 PDT 2019, Sai Prakash Ranjan wrote:
>=20
> > From: Vivek Gautam <vivek.gautam@codeaurora.org>
> >=20
> > There are other boards such as cheza whose bootloaders don't enable this
> > logic. Such boards don't implement callbacks to handle the specific SCM
> > call so disabling this logic for such boards will be a no-op.
> >=20
[...]
> > diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qco=
m.c
> > new file mode 100644
> > index 000000000000..24c071c1d8b0
> > --- /dev/null
> > +++ b/drivers/iommu/arm-smmu-qcom.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/qcom_scm.h>
> > +
> > +#include "arm-smmu.h"
> > +
> > +struct qcom_smmu {
> > +     struct arm_smmu_device smmu;
> > +};
> > +
> > +static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> > +{
> > +     int ret;
> > +
> > +     arm_mmu500_reset(smmu);
> > +
> > +     /*
> > +      * To address performance degradation in non-real time clients,
> > +      * such as USB and UFS, turn off wait-for-safe on sdm845 based bo=
ards,
> > +      * such as MTP and db845, whose firmwares implement secure monitor
> > +      * call handlers to turn on/off the wait-for-safe logic.
> > +      */
> > +     ret =3D qcom_scm_qsmmu500_wait_safe_toggle(0);
>=20
> In the transition to this new design we lost the ability to
> enable/disable the safe toggle per board, which according to Vivek
> would result in some issue with Cheza.
>=20
> Can you confirm that this is okay? (Or introduce the DT property for
> enabling the safe_toggle logic?)
>=20

I can test this on Cheza. Not sure if anything will happen but it's
worth a shot.

