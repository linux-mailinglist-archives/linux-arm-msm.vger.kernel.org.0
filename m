Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978CC30D8E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbhBCLjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbhBCLja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:39:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00009C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 03:38:49 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q7so23812862wre.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzTl5VS0DXOibk7o/EBFYAQiguTEh6y1Vagw26VELzs=;
        b=kwYUQ/ejOb3zOcNqXsqWQizlpVrOfOEBv1O1w/ZzPSkXRDky3L6fEY3JP0+tJnyQqe
         idwrCTv1XXe6NzlnT2C4GLMuRWLzNYg6cFs+QwkQb9wHij1Rdk9uh8uqK9/UWI1S98Lb
         gI/2j/M8Vt483BlfSvr31D0seDjWkBFWErjJcuCPzaGJmMyiDxIursMzuNZ1iY+JasjC
         FMX8+ugDNP8AIUaEqFDslZcVV2VeWA8ra5ZXd/QJ9DjTsEbMpPtfsf9t6ysqfWToSK03
         IFXOH4f481d0N5pu1CHDN0BSP46U/kvAvK/jr82HNQy3aUFmBdU/Al95lKNmE0Em+hvn
         6T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzTl5VS0DXOibk7o/EBFYAQiguTEh6y1Vagw26VELzs=;
        b=J4K86SRi54RifCHdwxJj4KAsBxrFgSCbXloZkLJlQ62ZajtrW5DdC3oUcbWKsOff8K
         fD0NXPB7Or3PvueSmwHQ6L02WDWb2f+CnBnAp2HYC7Gvu0uavhYNC73w/PENCZJzrDHt
         D/OPcIXHbdhlnmvBQ4sCrgcxuDr/3Ac9HPDYGnzGrgaNom6KfphXeVcLyrNkvzkbxxB/
         IcsB+IAxgn3f3wSpoZ98d2IQBxBoSChQadfZxYMUo1Q4yc6eVduAhm4qvH75TwPUMx3a
         3gJwT+LjVNNUpYXOXjsj68Ov0D+gAdvzTeU4OrymUODFUoGYsLqaI+7pBQBNv8aaDNw0
         weyA==
X-Gm-Message-State: AOAM531JTkm58HzZwSIhLyFzzqHQKAUmSkcoYmHRNZt6RETIxqGXVKSi
        syVR5wb6XXdcz+znhkHE/M+/pV7MsVcUgg==
X-Google-Smtp-Source: ABdhPJw0WH78usAGSkcXtC7Ocw5vQxJOedvZDDvN2S+u0K48EuPnDv6E3o67QhdFkdOC4K68b1+owQ==
X-Received: by 2002:a5d:460e:: with SMTP id t14mr3156843wrq.68.1612352328440;
        Wed, 03 Feb 2021 03:38:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r15sm3332540wrj.61.2021.02.03.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:38:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     dikshita@qti.qualcomm.com, vgarodia@qti.qualcomm.com,
        bryan.odonoghue@linaro.org, jonathan@marek.ca
Subject: [RESEND PATCH 0/1] Add dt bindings for sm8250 venus
Date:   Wed,  3 Feb 2021 11:39:13 +0000
Message-Id: <20210203113914.1072380-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding the dt-bindings for an upcoming series broken into various parts
over clocks, SoC dt and media to enable the venus encoder/decoder on
Qualcomm's sm8250.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=tracking-qcomlt-sm8250-venus

Bryan O'Donoghue (1):
  dt-bindings: media: venus: Add sm8250 dt schema

 .../bindings/media/qcom,sm8250-venus.yaml     | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml

-- 
2.29.2

