Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB11D8698
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387765AbgERSZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbgERSZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:25:20 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC64C061A0C;
        Mon, 18 May 2020 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=OE58ZX5Oa1e7YVFVtcnMs3q7vetLAsEVZFBhervmLAg=; b=AiY/uLPBryeGz2O3iSwnv2CjWr
        ujQoBLXSfuBBAjlkjq0ulWqpgFLwNekgBcgIXC+S7lHtWIiPtPhm24fzgoXL3vwmYJ7QKjOJPeflM
        wmcn2q/0JVYMFs3Z1NENUh+ICdIiiag18rd83YQKRX6Nkn9ziafYT+qvBum9gkw3IETWNPZiTgrtG
        0ZOBICkuZB3uFgRC+RpZCSK7Hm5fIcEndKUwxFB7lCJURSxB5eJRSWXb76EfmdmnW2MsZR5ai90iS
        MU13u+6ftBh+nVDqcSev6jJt87a66WlnXd5WiXbaCh2xZzjFxN+O2QJVDTFwXy07OMCNlxg8/nGIg
        SOX5PV6Q==;
Received: from [2001:4d48:ad59:1409:4::2] (helo=youmian.o362.us)
        by the.earth.li with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1jakCk-0008Ji-Ac; Mon, 18 May 2020 19:09:34 +0100
Date:   Mon, 18 May 2020 19:09:31 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add MikroTik
Message-ID: <aae96cddb2d1426482cae7f6fc4d1dc0aecfde5d.1589824955.git.noodles@earth.li>
References: <cover.1589824955.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1589824955.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MikroTik (SIA Mikrotīkls) is a Latvian company who develop routers and
wireless ISP systems.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..d3277fe6640b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -633,6 +633,8 @@ patternProperties:
     description: Microsoft Corporation
   "^mikroe,.*":
     description: MikroElektronika d.o.o.
+  "^mikrotik,.*":
+    description: MikroTik
   "^miniand,.*":
     description: Miniand Tech
   "^minix,.*":
-- 
2.20.1

