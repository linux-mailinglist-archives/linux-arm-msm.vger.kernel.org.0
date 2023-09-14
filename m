Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0637A03D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 14:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbjINM3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 08:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237943AbjINM3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 08:29:15 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EC61FC7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 05:29:11 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d7e741729a2so944531276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 05:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694694550; x=1695299350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtLDd3fxzJ2qWrurLeB9pHYuc3+Ev2d1hMk3Oahu1Wo=;
        b=eZiVWtqHfj9kvHKThEITGuUn41nfbpcr+VFfJAISZm7A2GMCm33W2qMKBKVMlJjXyF
         TKqufbNXUWPDsewBTbFg/WgRLEsIiEhd1BenNJQi3bmyDLys2a1wBsTWMtfaCwfQszXX
         yLf7QoOOXCj5YDkJj7WRX9Qn/if5SVDykKZeY9me2i9DuLuLDcx8mLCSdFBT1x+nBND9
         B7n9tmiaigyS7vX9q1b+dIQPL9Aayk2J+0k8C19TuwD1wyEtZHRnxk7O2xxjkuQbfVgO
         AqLE9UdjxE5ovmPFMLzf4gw7dEC7p5333Bp8K0hvgVB+CaHpiWX0p1b2NyDgt7t565k3
         KzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694694550; x=1695299350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtLDd3fxzJ2qWrurLeB9pHYuc3+Ev2d1hMk3Oahu1Wo=;
        b=ACCo2j/EC+wv5cwAholC/WBS5ZyHdz63dnL1CouScNxsjVHUn7AZoH4EF90BLqLg1i
         u5lcITpTbAj571yTjCoxPcP2DvYCyLNaE23aXjzRKNnRAk8fgvgd9mL4ED1a1+qtXr/8
         7D+Ldp4wYZ1S644lfzkC3CUuV3rw/AouuoBwkVEWehc7NwgEs/bUT8s9HyttCf1NLPg2
         lPR+dM9/sJRjguoGz2PFiFD/B8/BYyRrB2HGrjlvfhFMBl3mFcpEopERD1cWLrEQYu5C
         yVVh/BORdZLPz0dueSCSs9qZuG1T3C4c24q2PcsPDujFmObcDEciWnJWvrfxHo+B+umS
         lVew==
X-Gm-Message-State: AOJu0Yxr1FqI/Iu+9tD8XfpySsiUUy9KaxMaSjGQLO6LORRIWP4ihgvk
        xJkvXHLyqPVeI1oKi9OefYTUZ05qTk6HMuVwN+W3hQ==
X-Google-Smtp-Source: AGHT+IFKzxsuOJHD2I2G9JidYU6beywYTq4S1b179IHAIq/bnk1xXw7mkm/fBLJ/vc1OHT+Dq/2wiGVPBeOWWrBBbDg=
X-Received: by 2002:a25:40d:0:b0:d7b:3917:4609 with SMTP id
 13-20020a25040d000000b00d7b39174609mr4683812ybe.19.1694694550698; Thu, 14 Sep
 2023 05:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <1694411968-14413-1-git-send-email-quic_cang@quicinc.com> <1694411968-14413-5-git-send-email-quic_cang@quicinc.com>
In-Reply-To: <1694411968-14413-5-git-send-email-quic_cang@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 14 Sep 2023 15:28:59 +0300
Message-ID: <CAA8EJpoWnXeJKPB04kJW6Qo7ifAnt1u2ZSiq+W2HWOez=hi5gA@mail.gmail.com>
Subject: Re: [PATCH 4/6] phy: qualcomm: phy-qcom-qmp-ufs: Move data structs
 and setting tables to header
To:     Can Guo <quic_cang@quicinc.com>
Cc:     mani@kernel.org, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Sept 2023 at 09:01, Can Guo <quic_cang@quicinc.com> wrote:
>
> To make the code more readable, move the data structs and PHY settting
> tables to a header file, namely the phy-qcom-qmp-ufs.h.
>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 802 +------------------------------
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.h | 805 ++++++++++++++++++++++++++++++++
>  2 files changed, 806 insertions(+), 801 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.h

Is there any reason to do so? Other than just moving stuff around, it
doesn't give us anything. This header will not be shared with any
other driver. Just moving data tables to the header (ugh, static data
in the header) doesn't make code more readable.

If you really would like to clean up the QMP drivers, please consider
splitting _common_ parts. But at this point I highly doubt that it is
possible in a useful way.

-- 
With best wishes
Dmitry
