Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E61D4A9F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377649AbiBDSfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377601AbiBDSfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:38 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF202C061751
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:37 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id b15-20020a4a878f000000b002dccc412166so5593182ooi.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBViSbaYzUMB15L/ejiHdGOwZ3+2RejweIu9l4VdsyE=;
        b=CkCvqKSNlIHRpFB/7/Fs9kGIOpi7OXjL/IKj5SLmqt1ApZXp3akdEXHFMkKO8tpRcm
         k8nHUUt0Azs+s5hNXXyC5si5K9dBDhebHDgv+4KbipH3+p+FVmkursbYmz0SHHqC2j1g
         JHecyfnURXCGyBCYJctj8zpwyveKxFRLms49gL7iNf0+epGWK0jOG3Yl4CSAqGXOOxfP
         AdvCEsqN7KDULUVDKZmjpz3JzGXbAepSUTRZEF5s6Z7DAdzyHyHemPcZ845NiAWijiK5
         pfGWCtz038dQIMSmkiEAExSjqfLX6GLEQbuBwi54X1Mtj5kdOnaV9B//b1TldxQpVyfd
         5kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBViSbaYzUMB15L/ejiHdGOwZ3+2RejweIu9l4VdsyE=;
        b=ERbm3oMeiIaLaI2k/aTTPyzaRISrgbJ6HeDp+sW42KMEMlZZZk6Ck3AOEVBfy18Iug
         aKvCwMsys+eQCzorBiwRNasaXogq5iPvIJVFFjrlnXKXoI821gYWcm56HLqRQ6ObNRYp
         z+blaqnPmkn6Mz7tGkwfwo5x7JO9650d/G4+uhCrdzmhqa1pkLEfF6ra8QLEuleouVM4
         hzx46PtWTZooYkOAofT4ad/2KTMPFz+ttbUI1F/tPX6bffaSD2uh9qELB+ZKKIrPyLtN
         L6zzmwGEzH+D4uQmdqPQHpa7+Tmga+vKQUXCTtNpmCU4AN2x4/7349YWvnWAaXldHcIx
         w2fw==
X-Gm-Message-State: AOAM533MBn6DxeJU8w1o91FOhOOq7I/Sq6oj5UeQgI5ImT22jbB0v2qU
        bU75XUHKchqYMQJyoXrhmYb3FQ==
X-Google-Smtp-Source: ABdhPJyxh3i2AWtywcvFSpco2TGrSAdcxV99Dtc8riNY5vy7+HbF/ry6utVPf3DujMFwUg2BKLxTWw==
X-Received: by 2002:a05:6870:e3c3:: with SMTP id y3mr1036426oad.314.1643999737063;
        Fri, 04 Feb 2022 10:35:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, Xu Wang <vulab@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: apr: Remove redundant 'flush_workqueue()' calls
Date:   Fri,  4 Feb 2022 12:35:25 -0600
Message-Id: <164399969245.3386915.3373635838758090178.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114085019.42904-1-vulab@iscas.ac.cn>
References: <20220114085019.42904-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Jan 2022 08:50:19 +0000, Xu Wang wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> 

Applied, thanks!

[1/1] soc: qcom: apr: Remove redundant 'flush_workqueue()' calls
      commit: 4e6ae78ee61957800657d56ba78a10f034de174e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
