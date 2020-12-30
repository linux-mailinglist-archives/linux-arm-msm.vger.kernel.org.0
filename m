Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6CE2E783F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 12:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgL3LzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 06:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgL3LzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 06:55:00 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1565CC06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 03:54:20 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h205so37086597lfd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 03:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2M74RCQrYC+dpBxVDixZ0cQDqu+PvVCAE1oG9CjXluo=;
        b=LMw8E7f7FjvTcek+eO5GVOC5uYr3vdcvFQjxCvqyYoTSDH/crDvMrN+mzoui6Tz7S6
         hsty1VV2pgHUqvhbYdkgv0teHhVtNPLzkPaNrb3n9uL6lp9ZVCtj89E/TnyA3t16w2/K
         D6qMz3IaCLwa0GwrbU6EG0Fh/4W0HsVRH8JsgbfZgG82KIA40iAMYtiTMTJquO6teNXd
         Kx/M/RAsFH5nDawMBJwgOGZvl2wKZkVEDdUdkcfnuyBaXeFoaGXBAq64b4jRoTlx8JLp
         daxoA4hx3ah/DxKyTjLUQasMU2KB+Wj/eYT6xOP1fpYpk2J+ruMuSfAuQx3KtX3nlHNx
         Jv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2M74RCQrYC+dpBxVDixZ0cQDqu+PvVCAE1oG9CjXluo=;
        b=ZKn4VNpNoULct3Qeuayp8L8gWjVArgEdOd8XKOOdreZenEkLl6sV5GTF375L7N7wLg
         8QxfjM4yDdXrINBu7n7h6fPNE6xbFBlBZ9/9eSpUAGNhDWsm7hayoZixRoEcWIlnWhCi
         PD/slDp9jHmNUlxENjEMosUpg719CIDVbXqST33HJ4+3BTJDYFvoFXFVlsnuPczWzHA5
         Gpg2RJSUIwEf6NH+gTB0hoFKTU8qEWmTeUpYM0i679/aZE4edgiD9Urn0N5+oXV1lk2u
         fggRNOBwRRpug0q2PcLfSQptkjzV36mrzJs/II9WZNm9D5z5fWEI26j9GHmvJs3W+fX5
         JB6w==
X-Gm-Message-State: AOAM532GkvwztXy27yvrc8Frxnlrt7RCA9itAeFtQ0MFHCOG3JGKwB9N
        El1TfFS7KniY+OUNlkkE+Mh+w1MdOL055w==
X-Google-Smtp-Source: ABdhPJxJXqgR94n1R3aaiCnA1NOyx0br2pDNfd74d/4i+1N0pW07r/C8oMvg6OzkiqgXMqkTct5zEA==
X-Received: by 2002:a2e:b058:: with SMTP id d24mr27740723ljl.296.1609329258166;
        Wed, 30 Dec 2020 03:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id a8sm5931484lfo.206.2020.12.30.03.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 03:54:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
Date:   Wed, 30 Dec 2020 14:54:06 +0300
Message-Id: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 SoC requires another clock to be up to power up the translation
unit. Add necessary bindings and driver support.


