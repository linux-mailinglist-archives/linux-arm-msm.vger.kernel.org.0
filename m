Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EDF77C390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 00:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjHNWiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 18:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbjHNWhm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 18:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10588AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692052621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8xPZ1/xlI71ydv1yEQsl/onkcYiBnM+8gBhN3BH1EFg=;
        b=LXzaFXJW3KX/NOlU2inTp1FKWCIC3ycZ20Rvno9/1UcDu9lhiQrdtApuBOIQG5qjPnL9la
        4+/Jk7gHAng1AamRwdpjIxyu5UiilCOkFCh9to9tRATrDvvDHTdEuz8Eqhbd4QBPGRKGWQ
        YJyxGEHLq/53juYRshqevSHYDHqoHIc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-lyDhlk5TNoizdkKQHTMuwA-1; Mon, 14 Aug 2023 18:36:59 -0400
X-MC-Unique: lyDhlk5TNoizdkKQHTMuwA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6418a57b340so48582116d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 15:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692052618; x=1692657418;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xPZ1/xlI71ydv1yEQsl/onkcYiBnM+8gBhN3BH1EFg=;
        b=IQ2SC3a6aZ1UTbNtBN7t1YDxhHz3cnRMNgCRhRI2O9tECljf7r2JrUrBEkElGpwmiu
         GHt9+W7zNHOlpRrEMNFDG3L9w/xYlxpg7/GIeRrVgW6bMRUeIpFwGIlPr/UH4PntUh2g
         ehYsidxs+WbjQr4eabOx4PfrdPUekFQlXJY3UJetrHR9fNWdD8DAExUh4EXeymk0HAET
         WQb26QpwG/Awo/DNKk1IBpLOI+sLveXi/1uapgJBEu+CSeptyBR8AKJBFPEPjYXbKMdB
         GSxUanKmdCG2Kw9vVr6twrxzB2wzsPIYC1dF7SYNyCvgXLtSAfmtWy26m/KzJalkmmfG
         Ru4A==
X-Gm-Message-State: AOJu0Yw90rof5gMlJ/AxfsvB5x0SXp0arSREltk+2TuPi/esXZbB9JiF
        O9JVbARB3t4orzVp/U6uZFs4PKsOqkG/7zQj7y+oCg1D/d1pQoduOht0DnxoEtNE8Dg+5KuxnDw
        e/Z1lAwh8nJTnIOQGxtPNxOchMB6oV1d+anuaxP1vPEzLOeJoCamPXNEakYbRZlUH53KTtehrMi
        mVJVTH81Ky
X-Received: by 2002:a0c:f192:0:b0:646:d5ea:d69c with SMTP id m18-20020a0cf192000000b00646d5ead69cmr9353317qvl.38.1692052618416;
        Mon, 14 Aug 2023 15:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtHT8a1Fckwo9a1snViQSBUov419fwLoNwnMf/zXblWs8KtXw4TkxyqZiqD1RfVCl8pszAeQ==
X-Received: by 2002:a0c:f192:0:b0:646:d5ea:d69c with SMTP id m18-20020a0cf192000000b00646d5ead69cmr9353305qvl.38.1692052618088;
        Mon, 14 Aug 2023 15:36:58 -0700 (PDT)
Received: from thinkpad-p1.localdomain (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id q19-20020ae9e413000000b0076ceb5eb309sm3327567qkc.74.2023.08.14.15.36.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 15:36:57 -0700 (PDT)
Message-ID: <92de74746a624c2ece615a6286301db7647b5590.camel@redhat.com>
Subject: sa8540p-ride crash when all PCI buses are disabled
From:   Radu Rendec <rrendec@redhat.com>
To:     linux-arm-msm@vger.kernel.org
Date:   Mon, 14 Aug 2023 18:36:56 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello everyone,

I'm consistently getting a system crash followed by a ramdump on
sa8540p-ride (sc8280xp) when icc_sync_state() goes all the way through
(count =3D=3D providers_count).

Context: all PCIe buses are disabled due to [1]. Previously, due to
some local kernel misconfiguration, icc_sync_state() never really did
anything (because count was always less than providers_count).

I was able to isolate the problem to the qns_pcie_gem_noc icc node.
What happens is that both avg_bw and peak_bw for this node end up as 0
after aggregate_requests() gets called. The request list associated
with the node is empty.

For testing purposes, I modified icc_sync_state() to skip calling
aggregate_requests() and subsequently p->set(n, n) for that particular
node only. With that change in place, the system no longer crashes.

Surprisingly, none of the icc nodes that link to qns_pcie_gem_noc (e.g.
xm_pcie3_0, xm_pcie3_1, etc.) has any associated request and so they
all have 0 bandwidth after aggregate_requests() gets called, but that
doesn't seem to be a problem and the system is stable. This makes me
think there is a missing link somewhere, and something doesn't claim
any bandwidth on qns_pcie_gem_noc when it should. And it's probably
none of the xm_pcie3_* nodes, since setting their bandwidth to 0 seems
to be fine.

For what is worth, when pcie2a is not disabled, xm_pcie3_2a ends up
with avg_bw=3D0kBps and peak_bw=3D1970000kBps, which is also reflected in
qns_pcie_gem_noc. Both of these nodes get a request from 1c20000.pcie:

# cat /sys/kernel/debug/interconnect/interconnect_summary

 node                                  tag          avg         peak
--------------------------------------------------------------------
...
xm_pcie3_2a                                           0      1970000
  1c20000.pcie                           0            0      1970000
...
qns_pcie_gem_noc                                      0      1970000
  1c20000.pcie                           0            0      1970000
...

Any thoughts or suggestions would be highly appreciated. Thanks!

Best regards,
Radu Rendec

[1] https://lore.kernel.org/linux-arm-msm/pmodcoakbs25z2a7mlo5gpuz63zluh35v=
bgb5itn6k5aqhjnny@jvphbpvahtse/

