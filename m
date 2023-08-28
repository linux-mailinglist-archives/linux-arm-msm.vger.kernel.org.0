Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10B78B465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 17:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjH1PZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 11:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjH1PY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 11:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325F7E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693236249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fvt8AW+mIi2eZBWcexrLs2yuZIumHq8i5HiBkv83ZV4=;
        b=Szj9H3Dfr6iaQ+6/zhTBVqVWZdYADwV0OJxHlPg2awQugoo7XSQK/CL7i3Z+HwlCSxJEoy
        1fGrKHnOkI62zokrPz4mKHfy92IvqGZ0TUz0qVBEgMOU7AaEjKPh08YDKWZpf0LGYCzkPK
        FqrNPUxbN/cFk/Dftc1VETIgXWRHzfY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561--KheOTpNMVyGdt8dxjswXw-1; Mon, 28 Aug 2023 11:24:08 -0400
X-MC-Unique: -KheOTpNMVyGdt8dxjswXw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6491907dba4so30232016d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693236247; x=1693841047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvt8AW+mIi2eZBWcexrLs2yuZIumHq8i5HiBkv83ZV4=;
        b=G69F2QMsK4AaoDOKc/DW4kxnz3O+jQKS9mj+TjoHjJSmbX8hLlSJAkmt94/cWTAouD
         9MUbmV/czJEI2MsISHxx7m4dTr5sDN7rPPHBrgVh2vC4eXU/OzD8rNfFK9caPn49IpdC
         kXoL1qqhuXuPjpwbly1VNTL3W7Hvv7HKLpYSrSIP/7CiMhmZXUS5Jqjus49uAtbajnDC
         D1oBjwXgNk0AjKjcCEqoAN1R9zSUGLSnBsYrkAHdaYr+kv4LaGVYiy/aea2D1ChSkYW8
         CgRmSDrlQgXR0eKHODZSrqeWBmEKdfui/MCTAe5IpfeSKiICx5jqeQONl1YRpFoq6W6k
         ay4Q==
X-Gm-Message-State: AOJu0Yyvc/3XuwDYeAoVnQ9ZSitzpVqmBrJtrCY8xVoHG/EHot8qTWhk
        z2Kw/a1bWmPJxp8krriZZ2v2KcXY0va46eb6y6/wm3gdRIyRhug6OCAVUI3DmgsdWGRya+U++qk
        tSuRcsYpJ+QwCKCN16efDXDwEwQ==
X-Received: by 2002:ad4:5d66:0:b0:647:225e:13cc with SMTP id fn6-20020ad45d66000000b00647225e13ccmr32576420qvb.31.1693236247637;
        Mon, 28 Aug 2023 08:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl6XRmltSExgA8qzDmTIFQeCM0HRt2xpp2Va0ZoaBZdkg+stEwSFsNHM1N6xPTJIw21/P/hw==
X-Received: by 2002:ad4:5d66:0:b0:647:225e:13cc with SMTP id fn6-20020ad45d66000000b00647225e13ccmr32576403qvb.31.1693236247434;
        Mon, 28 Aug 2023 08:24:07 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id m9-20020a0cf189000000b0063fbfbde4adsm2632860qvl.129.2023.08.28.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:24:06 -0700 (PDT)
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
Subject: [PATCH v2 0/2] phy: qcom-qmp-usb: fix initialization of PCS_USB
Date:   Mon, 28 Aug 2023 11:23:49 -0400
Message-ID: <20230828152353.16529-1-athierry@redhat.com>
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
initialized. I tested it on the sa8775p. AFAICT there's no noticeable
change before/after the patch series: lsusb and dmesg output are the same.
USB is still working properly. I don't know what those PCS_USB registers
do exactly on the qmp PHY and I don't have access to the PHY datasheet, so
it's hard for me to tell the impact of them being initialized vs not.

v1 -> v2:
- Don't fallback to pcs for PCS_USB initialization (Dmitry Baryshkov)

Adrien Thierry (2):
  phy: qcom-qmp-usb: initialize PCS_USB registers
  phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p

 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.41.0

