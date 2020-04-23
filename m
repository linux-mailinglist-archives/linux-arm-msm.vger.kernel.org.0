Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F0C1B620A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 19:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgDWRgl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 13:36:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:22792 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729969AbgDWRgk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 13:36:40 -0400
IronPort-SDR: A0Z2onBO/W2rY++WJY6aLoEZWpzSaDouvc0mRf1w6Oha6Z7wafJb6QUc8NwQ7KFXadQtZk3qr+
 A/xtMZga2Qwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 10:36:40 -0700
IronPort-SDR: F56fV1v4CRjaRAG+AQxfylJmyOoYnx8CzFBdaSmTWX9pAIGINLxHY5zhRiRJljM/U1vSmxPUzG
 FlXP54XZcsbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="274303516"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by orsmga002.jf.intel.com with ESMTP; 23 Apr 2020 10:36:39 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Apr 2020 10:36:32 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.13]) by
 fmsmsx163.amr.corp.intel.com ([169.254.6.217]) with mapi id 14.03.0439.000;
 Thu, 23 Apr 2020 10:36:31 -0700
From:   "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To:     Jonathan Marek <jonathan@marek.ca>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Thread-Topic: [PATCH v2 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Thread-Index: AQHWGDZ6Omqe7A3vo0ucim42QSTzGqiG+s+g
Date:   Thu, 23 Apr 2020 17:36:31 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010212DE20@FMSMSX108.amr.corp.intel.com>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-7-jonathan@marek.ca>
In-Reply-To: <20200421234127.27965-7-jonathan@marek.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>-----Original Message-----
>From: Jonathan Marek <jonathan@marek.ca>
>Sent: Tuesday, April 21, 2020 7:41 PM
>To: freedreno@lists.freedesktop.org
>Cc: Rob Clark <robdclark@gmail.com>; Sean Paul <sean@poorly.run>; David
>Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Jordan Crouse
><jcrouse@codeaurora.org>; Sharat Masetty <smasetty@codeaurora.org>;
>Ruhl, Michael J <michael.j.ruhl@intel.com>; open list:DRM DRIVER FOR MSM
>ADRENO GPU <linux-arm-msm@vger.kernel.org>; open list:DRM DRIVER FOR
>MSM ADRENO GPU <dri-devel@lists.freedesktop.org>; open list <linux-
>kernel@vger.kernel.org>
>Subject: [PATCH v2 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
>
>Newer GPUs have different GMU firmware path.
>
>Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>---
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 135 +++++++++++++++++++-
>--
> drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  11 ++
> drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
> 3 files changed, 136 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>index b22a69e2f4b0..4aef5fe985d6 100644
>--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>@@ -571,6 +571,8 @@ static void a6xx_gmu_power_config(struct a6xx_gmu
>*gmu)
> {
> 	/* Disable GMU WB/RB buffer */
> 	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
>+	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
>+	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
>
> 	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL,
>0x9c40400);
>
>@@ -600,14 +602,91 @@ static void a6xx_gmu_power_config(struct
>a6xx_gmu *gmu)
> 		A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE);
> }
>
>+static int in_range(u32 addr, u32 start, u32 size)
>+{
>+	return addr >= start && addr < start + size;
>+}

Minor nit:

should this return a bool?

M

