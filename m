Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F6B624B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiKJT40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiKJT4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:56:25 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2A12BF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:56:24 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id r2so1549158ilg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Twz3HFkY0DUZdHars31wPyhZ+a4OgI/3MwirkEIRfE=;
        b=vxpf/dup7yqM+TS7ew3fZE8UbuXbFiiYGNa8BGH+IzAiZBLqSl1QJLOuXYZRk49Opr
         ccW91uwM5gFfypHAIoBbufnMkMmezn7sWyodKkrBdHU7kpkMobtlVHgTUudN0C+ysZ9q
         1iarSJhxzZCZU6Y0QPoFYYG5HB6d9OSNlP5zH4OqkAvmM+ilrTv34BZkCP+6SgF5yJV3
         PgHd8l7u2Rtp1r5uB/5s8oNtOzvq8D54+bA3evTfLkfrIPUICLjjp38yeOQvniEyRmAq
         KmN9aWAUEegVjnuLZ3v7f3jFhOepPvkPAA++9deziJXntMU6FKIWFBZBfp3OJoHv/+0y
         sY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Twz3HFkY0DUZdHars31wPyhZ+a4OgI/3MwirkEIRfE=;
        b=qhG7wNDeSRMZy3WRAa4ne62JgCYt6kw/+nkDn5Zz7CaNEqLAT5bhDI2HvNrmxrfXu/
         D9+4mBa05u5/SAOLTPkJ1OABqSets//ACWm6RU6ENCgeqpnV9XAyRbS2xyupua8e5GkO
         kC9nYXUJ++5aKQHqii8v7mLO1hFNnggSPi93YSqzKe955NAwovueAeFtlPx9simYzvd2
         QA7U/1n1moqoH40N8H2TvUBgsCDieFFWfeg+qToswHuMW9CTPysLN6Z9rBY0P85uRLoW
         qcB1XRPnJbdvusM7Q7PXOYRdfqiOG2SywuBG3DGgMveTPa6vgYcLlul5uRO8EVXAnvFh
         ZTDQ==
X-Gm-Message-State: ANoB5pnEN20c/rS9xoJdjXcYd5efpTM54yhzlKxAsqXBMN6iGduZRi9U
        kRfItU/SpVj2c6XcbaRV7GH5bQ==
X-Google-Smtp-Source: AA0mqf77lvAH0WGbBO1SwQ3eSIi5lR1A16iRQkE39Azljgg7ogvSEytDdx/46q62XhE4Yjow3m4A2Q==
X-Received: by 2002:a92:c80f:0:b0:302:391a:f67b with SMTP id v15-20020a92c80f000000b00302391af67bmr455658iln.265.1668110184008;
        Thu, 10 Nov 2022 11:56:24 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id l2-20020a6b3e02000000b006bbddd49984sm28602ioa.9.2022.11.10.11.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:56:23 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] dt-bindings: net: qcom,ipa: relax some restrictions
Date:   Thu, 10 Nov 2022 13:56:16 -0600
Message-Id: <20221110195619.1276302-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch in this series simply removes an unnecessary
requirement in the IPA binding.  Previously, if the modem was doing
GSI firmware loading, the firmware name property was required to
*not* be present.  There is no harm in having the firmware name be
specified, so this restriction isn't needed.

The second patch restates a requirement on the "memory-region"
property more accurately.

These binding changes have no impact on existing code or DTS files.
These aren't really bug fixes, so no need to back-port.

David et al, to be clear, I intend for this to be taken through the
netdev tree.  Thanks.

					-Alex

Alex Elder (2):
  dt-bindings: net: qcom,ipa: remove an unnecessary restriction
  dt-bindings: net: qcom,ipa: restate a requirement

 .../devicetree/bindings/net/qcom,ipa.yaml     | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

-- 
2.34.1

