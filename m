Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FBC685C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 02:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjBABA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 20:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBABA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 20:00:26 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C53E45887;
        Tue, 31 Jan 2023 17:00:25 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id w3so6759339qts.7;
        Tue, 31 Jan 2023 17:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7lw42yXtZsbmVwQTLkPLleNDRKNTbRDhw91I+3IQ+I=;
        b=dhM5KuIuzIAPz/I20BQ60algkzU95sIY6zxr8/e/IxgB9QNObPjBs3lWkE0cKB2gAc
         hRqG7nSEtaWoo1wzI4inadgEGYH7G76YIj9dx1zyT6pO1QG5eBb09cPqA06D64KwT1gq
         IQV3ovhPkeq43XpHW4WXfXsUf0VI+QFf+fpzASN748gl2hs32k/Y7YvYsnVoaTz6paet
         cgvS+mv1/we1G7h3SOA3fJKSkYhV6TzVut65x+Z1bo9kzqM6lnEjGwWbmsopbcZfWydw
         WjozLa1dlMqTBdVZOK5vMCM9OoJvF83cbTmg3mQ0hyGZMe+jRnuWA3abUatZKDilEydQ
         crkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7lw42yXtZsbmVwQTLkPLleNDRKNTbRDhw91I+3IQ+I=;
        b=Z134mvCQLMzToZPG27aH/ppw9LVmN0TZyu7C7jbl0wo8ZlHBSMMt3vPXhwPe1ORH5I
         pdMgUajKHxq02soz0EjKUMIT4mtYfZWlGPp6++A6a76120p3/ygZbHjGlTHWBIYOEpc2
         43y1jHhFNPa/+okC8EoSwfP8ENNfj+U44zn9+tajI0SC25M/2Fnz7ahysSpp1OnewoSm
         xASxNTonxx3GDt2rxrZ/ACB2088E6TBBra2F91yLmnUdQJvWvEG1H6DksGi5MQi3cKCU
         Yhg5JX+q6bgaHQL4bSwcCpZLXhR31AWVU9ZXO7oldT+pzXauyMy0ed4MJvCRBPA0dCun
         BymQ==
X-Gm-Message-State: AO0yUKUE9INRY4jfSMsjvccrtej6q5Gz0GLEliz8T+r1W6VOy5pyZUqB
        AEu1fIT/Uu7uijbjTSGibEPx5xOiJ51jqA==
X-Google-Smtp-Source: AK7set9lk3mIWzqrmxgJd7jc6uWB9y3D1CbrY4BEpQB+B62hJWsMWagTRt5Q7GOVLF6Ht3Sff6vuRg==
X-Received: by 2002:a05:622a:28c:b0:3b9:b4b5:4b7a with SMTP id z12-20020a05622a028c00b003b9b4b54b7amr1495461qtw.11.1675213224391;
        Tue, 31 Jan 2023 17:00:24 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::2e4f])
        by smtp.gmail.com with ESMTPSA id f23-20020ac80157000000b003b868cdc689sm5337320qtg.5.2023.01.31.17.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 17:00:23 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/2] SDM670 Interconnects (now with dts patches only)
Date:   Tue, 31 Jan 2023 20:00:18 -0500
Message-Id: <20230201010020.84586-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v4 (20230111005155.50452-1-mailingradian@gmail.com):
 - drop applied bindings and driver patches (previously 1-2/4)

Changes since v3:
 - fix a merge conflict on linux-next (1/4)

Changes since v2:
 - change qcom,sdm670.h to qcom,sdm670-rpmh.h (2/4)
 - use SPDX v3 license identifiers (1/4, 2/4)
 - accumulate ack tag (1/4)
 - format changelog (0/4)

Changes since v1:
 - change qcom,sdm670.h to qcom,sdm670-rpmh.h (1/4, 4/4)

This series adds interconnects nodes and consumers to the Snapdragon 670.

Richard Acayan (2):
  arm64: dts: qcom: sdm670: add interconnects
  arm64: dts: qcom: sdm670: add opps for peripherals

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 165 +++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

-- 
2.39.1

