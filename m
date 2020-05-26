Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2391E1EE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 11:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731735AbgEZJmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 05:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgEZJmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 05:42:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016CFC03E97E;
        Tue, 26 May 2020 02:42:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j16so7284484wrb.7;
        Tue, 26 May 2020 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UhW5rzzft+OEaSoE2TBO2iHGY9SJECQYAYg9UffWAk=;
        b=ZvFKYRsOzogk0YA/7ew8KXxjxofyeoeLY0htM4L2q0VMu4ZItrbjE1eWiMTRkfeW2l
         WmvM7xcfE1bCEMak8arcSBV1GrNz1dxoSAAlk2DfgCn6v2MTVQpvlSCWd3soLqwlwvRe
         7sLp0prQThsEJTXp8SkOxqqhg1VK7upxdyWcKSEuXPUZFn2k0a0ozy5Ndk786cMKBCPN
         Halmn96kPbJzf1i4zu2r03tmAdYQZOVPF+SWIQPIr18jLSLz0IDlqG9MG85lieKgNwIV
         cPYtac9Z/wr/JLJE03F6o/tEotPCW46DYcUFKI2OtA50s8r5INYggUIelrymdJcnk3cf
         6iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UhW5rzzft+OEaSoE2TBO2iHGY9SJECQYAYg9UffWAk=;
        b=JBmmLLBGNe2Z4K4ebCbj59Z8+ZbCQdyGsSRE3tXghywwwcIG8go9AQzKHQA/m/Olze
         dVqWY87MXsogE0e4cRN7mbXdPqORY0RipE4gOLW9zDumXTjEs9zAxNE3mmVffeX1AbDu
         mjH0ajQyFpYNw+xfqGhAnpTfnYh7w+TVyBmo/wflXb7U85NGXVskrfcRRn93T3K3e8yM
         pdRUNxYUsfBMTcXS1rTx3Wt+fxZCx+PzVMsUajwcGnCi+OhwaHdY5GfHyx9szkIV3pJ+
         0s+nQsKc1mfsMFrb5uThJVRsoJx6NqCBs0Su2mLUfkQ3gbJFqwtBmwifqhrrNA6FbOtG
         RbzQ==
X-Gm-Message-State: AOAM531FjbF00NTJoZUbjY5UzWb3l13s3Q0rTjJEddp6dxWfUxie76pE
        vHflCf+MVHZDZJw8lSM7tRc=
X-Google-Smtp-Source: ABdhPJxf7l1rVuIyVqBW1rJlGcbIOpVb4aw2XaHf6b66cVMjhtwY35OTm3FyzL/jWhfRlEgz2h74Tg==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr18517057wro.240.1590486121738;
        Tue, 26 May 2020 02:42:01 -0700 (PDT)
Received: from ubuntu-g3.micron.com ([165.225.203.62])
        by smtp.googlemail.com with ESMTPSA id b9sm1708039wrt.39.2020.05.26.02.41.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 02:42:01 -0700 (PDT)
Message-ID: <229fb4b001341c536f5996151ec6d78e925ecda4.camel@gmail.com>
Subject: Re: [PATCH] scsi: ufs-qcom: Fix scheduling while atomic issue
From:   Bean Huo <huobean@gmail.com>
To:     Avri Altman <Avri.Altman@wdc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "subhashj@codeaurora.org" <subhashj@codeaurora.org>,
        "venkatg@codeaurora.org" <venkatg@codeaurora.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 26 May 2020 11:41:52 +0200
In-Reply-To: <SN6PR04MB4640A91499223A26A7460738FCB00@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
         <SN6PR04MB4640A91499223A26A7460738FCB00@SN6PR04MB4640.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2020-05-26 at 06:25 +0000, Avri Altman wrote:
>  
> > ufs_qcom_dump_dbg_regs() uses usleep_range, a sleeping function,
> > but can
> > be called from atomic context in the following flow:
> > 
> > ufshcd_intr -> ufshcd_sl_intr -> ufshcd_check_errors ->
> > ufshcd_print_host_regs -> ufshcd_vops_dbg_register_dump ->
> > ufs_qcom_dump_dbg_regs
> > 
> > This causes a boot crash on the Lenovo Miix 630 when the interrupt
> > is
> > handled on the idle thread.
> > 
> > Fix the issue by switching to udelay().
> > 
> > Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus
> > registers")
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 
> Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

