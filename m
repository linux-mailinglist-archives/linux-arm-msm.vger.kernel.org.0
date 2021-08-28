Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDB93FA58C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 14:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhH1L5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 07:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbhH1L5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 07:57:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90298C061756;
        Sat, 28 Aug 2021 04:57:04 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bt14so19876744ejb.3;
        Sat, 28 Aug 2021 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/LquTxgB8yeywkZTQuKhulBY+lQnXOj7io3Z67t10Y=;
        b=jJ6N5B8nZJYrgv14X639TtTc+V0pYIKpisTfjba63zWBD32UtdLbN3CSTZUOV0Tfoi
         X85zp3sQmAoS3NRMC45C5LCeDp/OGyJHmBgAUwzKrOVGpcaSh2r1KKQ7R/amh/frMUns
         Gvxq8aEvjBDqj2bmZli4If9y7gurfh4Z1omctVQM01Qb8X3lZqFrNkTlctLZ4jcAzx5W
         zzFzYyU1oDInh+NNkA6Zs3PHwO2jw3N7TPCo7KKqWhtQ39qd+u8DHl7ssj+KEnd/wqPs
         1bVPzyPRkk7ke0t2kYE/Po1J8xQHmcMsJeSi6adej8nTNUEQPtonqOgOCC0TQ8Ddixp0
         rubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/LquTxgB8yeywkZTQuKhulBY+lQnXOj7io3Z67t10Y=;
        b=EEef2trVeq3NLqnYu/XGIQKkGanr/Ed3APCRf3ZhT7gz5WYLIkO4bA3c716DCQLAqv
         tU1hhXvef+Dggq0MILS3OaPhTArA++I4L+BeLu6w0ztgZsjuzXkU874zt+sIOq7ricKw
         BBBIizpo/uqoWgXRFG6mYP+3BH7N3bytf8OXqTyGa+p1SEtSylXD923TgraLf5lrcZjs
         tU57TwrdcxYzOaPSstvLjEtt4wpeXNpS3OJPj/Vb2ieJbCVNuVzCpyyMQRB5NtIPyn/L
         OCHSk3onW/QmEOqpe22KMlePvNMbsNLEKTHCTuY0Fid0MbAblAhbAZt+kFws0kPeNi3/
         u7ww==
X-Gm-Message-State: AOAM531LeadA0R7UiS1juTM17ALn8/iMBbKSCgHduR9DnB9HP7exUjZ9
        Cf++A2YsksMxFC8u7EVyHTs=
X-Google-Smtp-Source: ABdhPJzSLTP9wy7Ky6dAZvS6I+EczFJAV2d52NenIBkOTeDyZDHJUYlplorCOjZHfdlUi4TKt3QGFw==
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr14922055ejk.147.1630151823031;
        Sat, 28 Aug 2021 04:57:03 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id h19sm4183215ejt.46.2021.08.28.04.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 04:57:02 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [RFC PATCH 0/2] PM6125 regulator support
Date:   Sat, 28 Aug 2021 14:56:52 +0300
Message-Id: <20210828115654.647548-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds SPMI and SMD regulator support for the PM6125 found on
SM4250/SM6115 SoCs from QCom.

The main source used for this change is qpnp pm6125 support patch from caf [1]:

[1]: https://source.codeaurora.org/quic/la/kernel/msm-5.4/commit/?h=kernel.lnx.5.4.r1-rel&id=d1220daeffaa440ffff0a8c47322eb0033bf54f5

Unfortunatelly the source patch doesn't contain regulator source groups, so all
regulators define their own source. If that was available (suggestions are
welcome), this patch could become acceptable.

While at it I have a few suggestions:
- spmi determines how to treat each regulator based on type,subtype,revision
  read from regulator register. I assume this information is fixed for a givem
  PM chip. It would be really helpful if it was available somewhere in code
  (comment) or maybe the commit message, so correct voltage range and ops can
  be determined without firing up an actual device and extracting that info.
  I've included this info in the spmi commit message in patch 1/2.
- according to caf source, there are 3 general revisions of regs/ops, called
  common, common2, common3. I think this is cleaner than picking the first
  regulator name from the new generation and naming ops/regs on it. For example
  ftsmps426 functions/regs are common2 in caf, and my patch introduces common3
  (named ftsmps3).

About correctness:
- spmi patch was compile-tested
- rpm/smd patch was tested (voltage ranges come from spmi+type/subtype info)

Iskren Chernev (2):
  regulator: qcom_spmi: Add PM6125 regulators
  regulator: qcom_smd: Add PM6125 regulator support

 drivers/regulator/qcom_smd-regulator.c  |  46 +++++++
 drivers/regulator/qcom_spmi-regulator.c | 160 +++++++++++++++++++++++-
 2 files changed, 204 insertions(+), 2 deletions(-)


base-commit: 5e63226c72287bc6c6724d4fc7e157af0e3d7908
--
2.33.0

