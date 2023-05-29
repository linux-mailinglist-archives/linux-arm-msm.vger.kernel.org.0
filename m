Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8F9714F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 20:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjE2S7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 14:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE2S7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 14:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A177BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685386710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=T5pM1q03ybW1DThCl29sj5y8bq+37R0IpZbMzKJXM7A=;
        b=aNC+/44KEEpqpJIdcgalh+oqHRmqfuGFcfHyKFoawlI48oOxm4qjnR5IkT56oo7JUDRo9H
        Pd2Q5Y87hK9iZ19Hov/500pqBkVfXJlt0ZWm7sHWXY6uSFXCqGHQ6/zf8ViiyfCf7FKGdW
        nbK10P23XFxCPCeMvlrzyqmMr4jVUyk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-Bp1547KlMImIZ_7YG5diLw-1; Mon, 29 May 2023 14:58:29 -0400
X-MC-Unique: Bp1547KlMImIZ_7YG5diLw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6213569ba95so58859186d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685386708; x=1687978708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5pM1q03ybW1DThCl29sj5y8bq+37R0IpZbMzKJXM7A=;
        b=ev+kkHuoXxOvDdf19ADW2DMUifXKM658SzYs+3lUpxebbFWTqSJKCfswg04oV1ol/N
         PFzqgFKoEkMDoRvjT2HOmcqNvX0OVyT2IyN6JWRWUbrlo2EXPdl1DWBVsxzHrqlIjFGQ
         d458zPhxitlqkbaPtqV+JtNsGfD0PrNO3Euij0M8GqfjkJLu0XWcdorjMmH5Nefz0LGS
         vej5Tt9DWEmr2etEq2dd38TpqxJeGwx9oFrA0gZ+hyr+7yc1XyKAJKd6kKYvZzkxcY3g
         PyA0VQpJdENrREqeaIxtyQZYmp6Z7xi9XzccE3fJ3HpGiK09yfcSKkTSf9P4hfohwq0V
         bgkQ==
X-Gm-Message-State: AC+VfDw0ah5b/bxwbSGIo562C7nv58yVL6MxWKCZ1utrseGGGK8MyuBK
        znyeJ9vlGNzAEj3I2ng93DjYGO44DUxpHNrxVTkAtt4KP8swAXYgKOy/znm6BAVyBPldm7Gcu8j
        l6dcD2z+hFAqsqG2nlF8W+Ltn5KKiQWdXog==
X-Received: by 2002:a05:6214:2aa3:b0:625:aa49:9ab3 with SMTP id js3-20020a0562142aa300b00625aa499ab3mr10838214qvb.55.1685386708574;
        Mon, 29 May 2023 11:58:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HhoMT1jb15CvnsLLQDIP6J8Rw1/u7GLMvmAoOcUt4/KfzRQN3RGUi8hfhItE6lMDhZy+/Qw==
X-Received: by 2002:a05:6214:2aa3:b0:625:aa49:9ab3 with SMTP id js3-20020a0562142aa300b00625aa499ab3mr10838202qvb.55.1685386708395;
        Mon, 29 May 2023 11:58:28 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id ez3-20020ad45903000000b0061a0f7fb340sm3957382qvb.6.2023.05.29.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 11:58:27 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH RFC 0/2] Clock fixes for qcom-snps-femto-v2 PHY driver
Date:   Mon, 29 May 2023 14:56:35 -0400
Message-Id: <20230529185638.32376-1-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series attempts to fix a few weird clock usages in the
qcom-snps-femto-v2 PHY driver:
- ref_clk is never properly enabled
- cfg_ahb_clk is never assigned

Adrien Thierry (2):
  phy: qcom-snps-femto-v2: properly enable ref clock
  phy: qcom-snps-femto-v2: Remove AHB2PHY interface clock

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

-- 
2.40.1

