Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF37CB8210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 22:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392344AbfISUAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 16:00:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38246 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392351AbfISUAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 16:00:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so3000965pfe.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 13:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=9iE/fQwbEI86AAV9fsy+eA8BJHdmoZczt8XRdjCLHVg=;
        b=G1NZg1so9GgzKFvCHvGKBM6Uc4u9SKeSlJSkKxRygJVib/OfcZHo2nZFnsvMQCGhKs
         zycvLxKiQtN/TrkUGZwgdntuLhr6vO5k3GEAD9K3Xfru0BX8RkKNsO9BFGf35dgqR5FN
         Z6pEiyu730ZfZOy9JH94iiwYN4KD5MkuQb92I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=9iE/fQwbEI86AAV9fsy+eA8BJHdmoZczt8XRdjCLHVg=;
        b=atPqr2efhHMoWsSxIgHgoxRxOLlguoGi8WNnvQKbl4pp5br6Ib6z7GXPLHzKrKgHZ8
         fOQ/JaWczD2g7e1v5w6EfRi5ehkuR0NeaRUG9alcbmIfDFQ7Wub3FkBaPPqmVfbQiCyV
         M1TOG9Jr1mnVGqNhnHhsq4EdnfxkeC6N5bheSodZDZr6qcjAT5S5pci98EIGUT5B0rQM
         NCgl6JmmhJodTkyoIuBtJoAthCTplNJHNjRSwouZvS11G7OThepem+8AdXnh2L9+k0df
         /NJEXxyAldD0EHEXCUU1TCTV5Xem5USAo5QIC7uQDk2Z7Hi5mdPDPnt9akJdwluXB+/d
         HS/Q==
X-Gm-Message-State: APjAAAXtZCWetaVZyrCQPnNb/2MLi/ez2VzgvvJbFN3jVNqbxtcbVaIa
        TtcUKkwFP9PU3TJvLi7lVnL4BA==
X-Google-Smtp-Source: APXvYqwblG8awSx8tqE4wTapKOkBur/6RwrbMVL74XUWHvi/ehVchoyA2iAuuT8W5diexnCOtr3PpQ==
X-Received: by 2002:a62:cf82:: with SMTP id b124mr12123966pfg.159.1568923252840;
        Thu, 19 Sep 2019 13:00:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r28sm13572503pfg.62.2019.09.19.13.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 13:00:52 -0700 (PDT)
Message-ID: <5d83de74.1c69fb81.71c0f.f162@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <081fff2f5dacfa7b6f5df6364f088045@codeaurora.org>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org> <1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org> <20190919002501.GA20859@builder> <a45e8fb6fe1a8cc914fedbfac65af009@codeaurora.org> <081fff2f5dacfa7b6f5df6364f088045@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
User-Agent: alot/0.8.1
Date:   Thu, 19 Sep 2019 13:00:51 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-09-19 11:54:27)
> On 2019-09-19 08:48, Sai Prakash Ranjan wrote:
> > On 2019-09-19 05:55, Bjorn Andersson wrote:
> >> In the transition to this new design we lost the ability to
> >> enable/disable the safe toggle per board, which according to Vivek
> >> would result in some issue with Cheza.
> >>=20
> >> Can you confirm that this is okay? (Or introduce the DT property for
> >> enabling the safe_toggle logic?)
> >>=20
> >=20
> > Hmm, I don't remember Vivek telling about any issue on Cheza because
> > of this logic.
> > But I will test this on Cheza and let you know.
> >=20
>=20
> I tested this on Cheza and no perf degradation nor any other issue is=20
> seen
> atleast openly, although I see this below stack dump always with=20
> cant_sleep change added.

The usage of cant_sleep() here is wrong then, and the comment should be
removed from the scm API as well because it looks like it's perfectly OK
to call the function from a context that can sleep.

>=20
> [    5.048860] BUG: assuming atomic context at=20
> /mnt/host/source/src/third_party/kernel/v5.3/drivers/firmware/qcom_scm-64=
.c:206
> [    5.060303] in_atomic(): 0, irqs_disabled(): 0, pid: 1, name:=20
> swapper/0
> [    5.067118] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.3.0 #102
> [    5.073299] Hardware name: Google Cheza (rev3+) (DT)
> [    5.078416] Call trace:
> [    5.080953]  dump_backtrace+0x0/0x16c
> [    5.084727]  show_stack+0x20/0x2c
> [    5.088156]  dump_stack+0x90/0xcc
> [    5.091585]  __cant_sleep+0xb4/0xc4
> [    5.095192]  __qcom_scm_qsmmu500_wait_safe_toggle+0x5c/0xa0
> [    5.100929]  qcom_scm_qsmmu500_wait_safe_toggle+0x28/0x34
> [    5.106491]  qcom_sdm845_smmu500_reset+0x24/0x50
> [    5.111249]  arm_smmu_device_reset+0x1a4/0x25c
> [    5.115827]  arm_smmu_device_probe+0x418/0x50c
> [    5.120406]  platform_drv_probe+0x90/0xb0
