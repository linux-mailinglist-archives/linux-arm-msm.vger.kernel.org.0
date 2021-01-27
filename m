Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB92306841
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhA0XqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 18:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbhA0Xmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 18:42:43 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DBBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:26 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m22so5156726lfg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6eKdJ+dvn2bCuFLVakptICRfWlK/sSOkkxMKcgRaQg=;
        b=Ar6vdtp3cWWkDaW6edmCYEi50ZPnVs/t3KGaB3UKxgPHfAIE+Mrc113/jJ+721fcus
         QM73mcv5Nv5z7kNX/zxtF8fZFEzKUlvenTv2uRY6f2e1LVxc5G5hNlYufPIyPIEN/od6
         CZRqLfBTfC9lXkyD3LFyGJzpjzH5ndH/9rRhAxmJgxu5KzUYiERU3XkJXzrfGJ7TC1QH
         ZANUtnJEmSmRA11QpH+Fag85VjWbmBeWC4sSzqz93ud8+u0oDp0sEkJkEiQPJzb5sLR/
         iwHWeFSUNdu0u6dLaivRfUZ5q5+FX06iHOT4E12OTqRDe+peyF3GNQ9fOJ6fQ3jxh7z9
         va0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6eKdJ+dvn2bCuFLVakptICRfWlK/sSOkkxMKcgRaQg=;
        b=UUKW5DlxV3D77wAMbw0dTbRXIj5DD7PXJzIUTipOTnZGPy7N7dpawej6/We4rnjRCW
         bKlectgodfW0uTA2CRUGkcIEfu4NH7+cFro+y06xq0KTTNCXXe3KUE8bEmH4vsnyeF/W
         95t/KWUBsOnChaftu7w5vJ/fRClbLieiyTDCQ2KuNL7ZNfIU5hKjjGrkM8dkVkb2SzmO
         zbz/Bg4J1Ant/cp4G5nJBN0Wf0LltHqvk+td5h1+iJ+8QndvhUQWRU7sgLQsSpPLpUI2
         xPSD2FeGg8Ng4HVoXzEDfW+Q3s9RHvKkkdWKLc7W1DBkmlOdnTmWwAab7pIn+uo/vJ+/
         0GhQ==
X-Gm-Message-State: AOAM530opMEZzMr2kxFSqVs+MOxAeVQwofpj2jG4O5GMtCMDzpfX3vfh
        n72eMmtoGUkflM/FPqZiclxJew==
X-Google-Smtp-Source: ABdhPJx+NindjC5Rn2ls8JAZEiGqOP/KOIaynws3nWXDHIulcrqtaXbfkT7k/kTI99k5PdHqcI+pAg==
X-Received: by 2002:a19:c504:: with SMTP id w4mr2260042lfe.193.1611790945128;
        Wed, 27 Jan 2021 15:42:25 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id f82sm939541lfd.280.2021.01.27.15.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 15:42:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Enable PCIe support on rb5 platform
Date:   Thu, 28 Jan 2021 02:42:19 +0300
Message-Id: <20210127234221.947306-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

These two patches enable PCIe support on Qualcomm's RB5 platform.

Dependencies:
 - https://lore.kernel.org/linux-arm-msm/20210117013114.441973-1-dmitry.baryshkov@linaro.org/


