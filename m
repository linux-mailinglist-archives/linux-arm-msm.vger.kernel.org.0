Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C9B785E58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 19:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbjHWRNh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 13:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjHWRNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 13:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600EF198
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692810766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bG2xKU4nKpiOTOC7jJuTobG/6zkTN0J89oQdXZw7UhM=;
        b=aEVsa1uAziQhQhe86gmTUSdolHRC5ShuQoQn1mZ7wxEJTdGOmpGp5eN6StF2YEE1bbNzou
        DbSpQ6dHO6PVyICgDnI035iAsy6QjSYJ1OEfiRifZdT7v9auIAqUKrGMXMnu3wz/DRmJXl
        VMxzl98zEMe0J9PKg+1j0Q2an6wIGpM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-lpLMRvZmNF2-J-sBAaMyDA-1; Wed, 23 Aug 2023 13:12:45 -0400
X-MC-Unique: lpLMRvZmNF2-J-sBAaMyDA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-63d1695e445so72456526d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692810764; x=1693415564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bG2xKU4nKpiOTOC7jJuTobG/6zkTN0J89oQdXZw7UhM=;
        b=YGl66nzuUsf/DnwkGzb9jGJItnyCFsK6cleOw+CsyOyKP3aRxP2btZIbmWhbsLn9oC
         4rjmTAlrtO08SshnHbge+aMLMAsCGfVeGofuORIS1q6rxzCnCggrOKb4I0Pvw/OOy4Bi
         6uLHnjZPMkDoSbOzT3m+8AdaoaJWgSt4V1h68wsgBIFonDeJcfD7O1xjNp9rbWFzrW4T
         fa1c+K5f0/QJiKRi7gVTYgG6iyiZdeAx0b7okUpObuBNmAhdm8Wc5RChexlMxR1bJJpL
         NdqW8DKlvNmGXyjZmW/vzVjxT4zea7MTkBIbdfOfMX2kpH2MowjRP1UHYJBMbn45NRZf
         B8yg==
X-Gm-Message-State: AOJu0YxivO/lH82b1OjfT0FlJKcQnLmQcSj5cYd2SmquTFpP9sEBLDNG
        neIQdTXedUoc17zgmdIc0bkzP4lZUCFqXYiU2lGfE1fch2QC7dI3hr2+9blDuVuJLA3VaFieON+
        Ca+QUusuCPXea/yYsqGlfULRe2w==
X-Received: by 2002:a0c:f444:0:b0:63d:3bea:f663 with SMTP id h4-20020a0cf444000000b0063d3beaf663mr15207941qvm.47.1692810764633;
        Wed, 23 Aug 2023 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8uCC/0yI3Az36Prqurd1xYXWgO5afBwAhxf8NrFzm+xa3Ccxb/poVMFhz33ZB/0s+TGZVsA==
X-Received: by 2002:a0c:f444:0:b0:63d:3bea:f663 with SMTP id h4-20020a0cf444000000b0063d3beaf663mr15207933qvm.47.1692810764402;
        Wed, 23 Aug 2023 10:12:44 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id x26-20020ae9f81a000000b0076ca9f79e1fsm4056361qkh.46.2023.08.23.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 10:12:43 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 0/2] phy: qcom-qmp-usb: fix initialization of PCS_USB
Date:   Wed, 23 Aug 2023 13:12:03 -0400
Message-ID: <20230823171208.18382-1-athierry@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series attempts at making sure PCS_USB registers are properly
initialized. Please note I don't have access to the qmp phy datasheet and
only reasoned from the code, so I appreciate a double check to make sure
I'm not messing with the registers.

Adrien Thierry (2):
  phy: qcom-qmp-usb: initialize PCS_USB registers
  phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p

 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.41.0

