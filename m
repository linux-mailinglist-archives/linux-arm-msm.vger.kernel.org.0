Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB374D64E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 16:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348818AbiCKPug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Mar 2022 10:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344588AbiCKPuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Mar 2022 10:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E8988BE2C
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647013770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=D2pmc0xLyfbXJv4H5Su2IjuCtdgSulAIgXXCBsJ28QE=;
        b=AU32QDGAaoHSpohv6znRds/qQDp94mzODdJBzkeU+293e1ND3CQcyhTbnEjajkBE2WiWqm
        FE+DdP1SuKIsggtDYvZInJt/4eOmJ3ZBxYqTAMUtxAf3EwNFD7jcTVvMlW/TnIzGaKkvtW
        vcoYUvjYRd+HEEoZZo2mGqc69TXMdyM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-7W__IiacMG-DjtBvsh943w-1; Fri, 11 Mar 2022 10:49:29 -0500
X-MC-Unique: 7W__IiacMG-DjtBvsh943w-1
Received: by mail-qk1-f198.google.com with SMTP id bj2-20020a05620a190200b005084968bb24so6379476qkb.23
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D2pmc0xLyfbXJv4H5Su2IjuCtdgSulAIgXXCBsJ28QE=;
        b=hYAVpwvL8QfnHRD8nR2rDlfN6lPH/UJFGmBIUj0vVEQLb2eNEZOinhFSJbzXJ8PSvE
         bmIqi1687ng22yIz8d7gBGlTv49jVgh6dP1OEDA1YM8wf88xlWfIj81o/ov6pBdRorXl
         r18T9zCnG8PzVx4kVU6Vw7phkkihOfMh0GNlPAUn23dG0ZGe5d5OFwGGG7339z7GAW18
         QiinmtEHFNXBgOO4Q0lurBE4QznEWgkQeV8ZgYEX+vYuWKsWqPR3Vth8ILqedKuI5olO
         TBqpgaP8cHxacyT3XkuBJ2htFW7Qkvhq/XeUhXwl2DIowuonwTHGDTvGqu4SdDWOkGO3
         sgjw==
X-Gm-Message-State: AOAM532l0/iXijPGdW03ZOTPGdetrUJWuFWhrDrvIVZm0kcdIhqeBmSf
        vNItyhb5S1vmnhLVP2BEkeb849LiOXuqUc9yjz0C4WzxYVl1pYi1dqii6KgWnfGvP3HhsHiyqLP
        Zn2DMhpKqkF9ruuSokfECKlpwig==
X-Received: by 2002:a05:622a:550:b0:2e0:7422:a1d5 with SMTP id m16-20020a05622a055000b002e07422a1d5mr8888175qtx.444.1647013769071;
        Fri, 11 Mar 2022 07:49:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycKl9MtiYetzeS9duFZfYrf1qfeHF2oqbyGQqrK2X38v2Q/P9G/k00aKlaQClsoPQJAlwqsA==
X-Received: by 2002:a05:622a:550:b0:2e0:7422:a1d5 with SMTP id m16-20020a05622a055000b002e07422a1d5mr8888165qtx.444.1647013768866;
        Fri, 11 Mar 2022 07:49:28 -0800 (PST)
Received: from xps13.. (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id z6-20020ae9c106000000b0067d3b9ef387sm3602719qki.28.2022.03.11.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 07:49:28 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     bjorn.andersson@linaro.org
Cc:     mani@kernel.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] ARM: qcom_defconfig: add crypto and debugfs support
Date:   Fri, 11 Mar 2022 10:49:17 -0500
Message-Id: <20220311154919.1797920-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's two minor additions to the defconfig for the Qualcomm random
number generator and debug fs.

Note that the DTS for the Qualcomm prng is already present in the
upstream tree for the msm8974.

Brian Masney (2):
  ARM: qcom_defconfig: enable options for Qualcomm random number
    generator
  ARM: qcom_defconfig: enable debug fs support

 arch/arm/configs/qcom_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1

