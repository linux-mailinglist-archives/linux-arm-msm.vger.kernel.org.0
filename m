Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C12C4665ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355653AbhLBPAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:37 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:24066 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235854AbhLBPAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457025;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+On65RK/P0y1X+9L5FVYKDm1EJ1ZjlP8KZD5YNFlWzM=;
    b=AiL/0KmL7ZK4SQLe3rdZ9bYTPplrQgRl3H6Cod7RHEqmL4Bo9X8IdwbisltTUT6Tvs
    lUOfCXkYZ9F9S0IZ1E6zWtMcAnOD/Po1DJ8H+HurkHzht7iVoTy3loZxn1jeZ/JAjyUk
    zUrgY+/CFlUl7jrU82kMKRLtitze7pX9RS4PRv/TWVqwKRr1LPzoF4iZa5LMfpGjykRT
    35mk1QYwuDIYp7+90KGo4xAnfY3zhkROPVb3y7TmG8ZFyogOfStTQ9zMa0PW0Y0N+ax7
    x7UJwPd1WJYUZ/wZukwfC2NwdkNnXcz7ecj9mVGS4mf5DoBQnhe3TMezp8NhR9hqgXKV
    MZdQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev5pxu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:05 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
Date:   Thu,  2 Dec 2021 15:55:00 +0100
Message-Id: <20211202145505.58852-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series makes it possible to route audio through the combined
audio/modem DSP on MSM8916/APQ8016 devices instead of bypassing it using
the LPASS drivers. This is necessary to support certain functionality such
as voice call audio. See PATCH 4/5 for details.

Also, qcom,apq8016-sbc.txt is converted to DT schema by adding it to the
existing qcom,sm8250.yaml. The bindings are similar enough that it is easier
to share a single schema instead of duplicating everything into multiple ones.

Stephan Gerhold (5):
  ASoC: dt-bindings: qcom: sm8250: Drop redundant MultiMedia routes
  ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
  ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,sm8250 DT schema
  ASoC: dt-bindings: qcom: Document qcom,msm8916-qdsp6-sndcard
    compatible
  ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6

 .../bindings/sound/qcom,apq8016-sbc.txt       |  96 -------------
 .../bindings/sound/qcom,sm8250.yaml           | 136 +++++++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 134 ++++++++++++++++-
 3 files changed, 259 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt

-- 
2.34.1

