Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD4362BCEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237236AbiKPMDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbiKPMCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2947186EC
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668599648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yHWoqeKZ7WE5OL+yeStXVIueVj6+ARPoJ0PKpaYIJ9Q=;
        b=eY1y2+UKYIFIknBl8UCVlWxFHlQS+FDJWwHWWeO+E+4DmVxjd9V/BfwTrMcqH1RK65qwnL
        8N86Yvq6aQqf11Z29CmQv2pfQ9HDj5EV4AyMlmzlVdqhL5a6pwGa/A9+LPdejVYxkZA4sA
        UXEXN9sfQAsPd+G9bAJqZGS8q1cqmgA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-5cv7XP1WOz-omOKCBwgUlg-1; Wed, 16 Nov 2022 06:54:06 -0500
X-MC-Unique: 5cv7XP1WOz-omOKCBwgUlg-1
Received: by mail-wr1-f71.google.com with SMTP id v12-20020adfa1cc000000b00236eaee7197so3587300wrv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHWoqeKZ7WE5OL+yeStXVIueVj6+ARPoJ0PKpaYIJ9Q=;
        b=OwzTNhqVM3Sj25F5LRuAF1nY1ywFMmn/RS6KElz1S/lb9tkgVcZBzw7gv388ynNohw
         1iSg6b6mKWHnIMn0lE0MhI8dDsqn3KgfxLT7mfNiY1M71S3YpziNB69AxkCXIKtBa3K2
         OVZP7evOZxvcN0O+49JHz9/aw+vGle3T7PKNJdvsaxkVU4Vc5VWPsHRPRTlQfYUrccz3
         6OEnxK8k5pfDadsaozVpgAj3lNo9b/7fMu84vNck3eTzr4wUP5r3NtHCP0Ul3G31qSkB
         LBliAUxe5YGoT0JjpzB7j8HCciQRoQEeIaeYipKIpFSOSxksOgizmmAS4GdFajZqjQLL
         6uSQ==
X-Gm-Message-State: ANoB5pnFel5q7k6XdTSeLX+ULR5PpzfCWCNY4xHfxvLwkAkRj9ABBlGd
        pO60CPbieZ7ZoWq8gWcodBb6bc+fIPPhgXlSVbUEQTFJhqDyNjztpphSrn8UVSdnkIwVDXt8K71
        RN2wyVLS/CBul1HYFRKlIP4Rj6w==
X-Received: by 2002:a5d:6284:0:b0:236:87e7:da6d with SMTP id k4-20020a5d6284000000b0023687e7da6dmr13408028wru.384.1668599645544;
        Wed, 16 Nov 2022 03:54:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5kcpGTwPuTC6azYsnoEZOl/mzvCaD+GO9+Yyk/oSqcCijgBjHRjLjE9xSyCgu3T71pho0DKg==
X-Received: by 2002:a5d:6284:0:b0:236:87e7:da6d with SMTP id k4-20020a5d6284000000b0023687e7da6dmr13408001wru.384.1668599645178;
        Wed, 16 Nov 2022 03:54:05 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003cf37c5ddc0sm2059939wms.22.2022.11.16.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:54:04 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@suse.de>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/4] driver core: Decouple device links enforcing and probe deferral timeouts
Date:   Wed, 16 Nov 2022 12:53:44 +0100
Message-Id: <20221116115348.517599-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is a v2 of patch "driver core: Disable driver deferred probe
timeout by default" [0] but using a slightly different approach after the
feedback I got on v1.

The problem with v1 was that just disabling the probe deferral timeout by
default would cause a regression for drivers that may want to probe even
if their (optional) dependencies are not present yet.

But this was achieved by timing out the probe deferral mechanism, which
calls fw_devlink_drivers_done() in its work queue function handler. There
is not reason to tie the two though, it should be possible to relax the
device links to allow drivers to probe even if their optional suppliers
are not present, while still keep the probe deferral mechanism enabled
so that drivers that have required dependencies are still able to defer
their probe.

This series decouple the two operations by adding a fw_devlink.timeout=
command line parameter. That way, the probe deferral timeout can be set
to -1 by default, reverting to the previous behaviour while still allow
drivers to probe with optional dependencies missing.

Patch #1 is just a cleanup that makes the driver_deferred_probe_timeout
variable static since isn't used outside of its compilation unit.

Patch #2 disables the deferred probe mechanism after late_initcall if
modules are disable. Since there is no point to schedule the timer in
that case.

Patch #3 adds the new "fw_devlink.timeout=" cmdline param, that can be
used to set a timeout for the device links enforcing. The semantics are
quite similar to the existing "deferred_probe_timeout=" cmdline param.

Patch #4 then changes the default value for the probe deferral timeout,
to just disable it by default and make the probe deferral mechanism to
revert to the behaviour that had before. That is, to just try to probe
the drivers indefinitely. But the device link enforcing timeout is set
to 10 seconds, to keep the existing expectations for drivers that want
to probe even if their optional dependencies are not present.

I have tested on my HP X2 Chromebook and the DRM driver that was failing
to probe before now works without any cmdline parameters. I also tested
with different combinations of device links and deferred probe timeouts.

[0]: https://lore.kernel.org/lkml/354820e8-939c-781a-0d76-c1574c43b7f3@redhat.com/T/#t

Best regards,
Javier

Changes in v2:
- Mention in the commit messsage the specific machine and drivers that
  are affected by the issue (Greg).
- Double check the commit message for accuracy (John).
- Add a second workqueue to timeout the devlink enforcing and allow
  drivers to probe even without their optional dependencies available.

Javier Martinez Canillas (4):
  driver core: Make driver_deferred_probe_timeout a static variable
  driver core: Set deferred probe timeout to 0 if modules are disabled
  driver core: Add fw_devlink.timeout param to stop waiting for devlinks
  driver core: Disable driver deferred probe timeout by default

 .../admin-guide/kernel-parameters.txt         |  7 +++
 drivers/base/dd.c                             | 48 +++++++++++++++----
 include/linux/device/driver.h                 |  1 -
 3 files changed, 47 insertions(+), 9 deletions(-)

-- 
2.38.1

