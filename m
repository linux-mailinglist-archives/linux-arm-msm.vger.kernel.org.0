Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CFE318F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhBKQGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 11:06:23 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:45675 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229955AbhBKQDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 11:03:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613059392; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=dND8Fw/N2yqIwZD3O288QSZRIeAgRKtIgjzd8mBfxKs=; b=o94rvsY4nzMeIbnRP1PuvZRl+fErYWgtn+4f4GpzzmwT0HNNgSLlzewzRFdRYyjJYNjB/lnq
 qA75CEacHsLX1rMdRsyKE8izZ5V6oW95Hb6RK/fo9avbZXxVO+AO1kT04U3NBJXHTbXcCdSJ
 C525DHWxxqRjcX1DfaQg3cgAK4w=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60255524e3df861f4bbb2b57 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 16:02:44
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1756CC43464; Thu, 11 Feb 2021 16:02:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF261C433C6;
        Thu, 11 Feb 2021 16:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF261C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 11 Feb 2021 09:02:37 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: a6xx: Make sure the SQE microcode is safe
Message-ID: <20210211160237.GB26503@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20210210005205.783377-1-jcrouse@codeaurora.org>
 <8aa916f9-238a-779c-bcaf-51bfb2b761d2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aa916f9-238a-779c-bcaf-51bfb2b761d2@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 11, 2021 at 06:50:28PM +0530, Akhil P Oommen wrote:
> On 2/10/2021 6:22 AM, Jordan Crouse wrote:
> >Most a6xx targets have security issues that were fixed with new versions
> >of the microcode(s). Make sure that we are booting with a safe version of
> >the microcode for the target and print a message and error if not.
> >
> >v2: Add more informative error messages and fix typos
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 77 ++++++++++++++++++++++-----
> >  1 file changed, 64 insertions(+), 13 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >index ba8e9d3cf0fe..064b7face504 100644
> >--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >@@ -522,28 +522,73 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
> >  	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> >  }
> >-static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
> >+/*
> >+ * Check that the microcode version is new enough to include several key
> >+ * security fixes. Return true if the ucode is safe.
> >+ */
> >+static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
> >  		struct drm_gem_object *obj)
> >  {
> >+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >+	struct msm_gpu *gpu = &adreno_gpu->base;
> >  	u32 *buf = msm_gem_get_vaddr(obj);
> >+	bool ret = false;
> >  	if (IS_ERR(buf))
> >-		return;
> >+		return false;
> >  	/*
> >-	 * If the lowest nibble is 0xa that is an indication that this microcode
> >-	 * has been patched. The actual version is in dword [3] but we only care
> >-	 * about the patchlevel which is the lowest nibble of dword [3]
> >-	 *
> >-	 * Otherwise check that the firmware is greater than or equal to 1.90
> >-	 * which was the first version that had this fix built in
> >+	 * Targets up to a640 (a618, a630 and a640) need to check for a
> >+	 * microcode version that is patched to support the whereami opcode or
> >+	 * one that is new enough to include it by default.
> >  	 */
> >-	if (((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1)
> >-		a6xx_gpu->has_whereami = true;
> >-	else if ((buf[0] & 0xfff) > 0x190)
> >-		a6xx_gpu->has_whereami = true;
> >+	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
> >+		adreno_is_a640(adreno_gpu)) {
> >+		/*
> >+		 * If the lowest nibble is 0xa that is an indication that this
> >+		 * microcode has been patched. The actual version is in dword
> >+		 * [3] but we only care about the patchlevel which is the lowest
> >+		 * nibble of dword [3]
> >+		 *
> >+		 * Otherwise check that the firmware is greater than or equal
> >+		 * to 1.90 which was the first version that had this fix built
> >+		 * in
> >+		 */
> >+		if ((((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1) ||
> >+			(buf[0] & 0xfff) >= 0x190) {
> >+			a6xx_gpu->has_whereami = true;
> >+			ret = true;
> >+			goto out;
> >+		}
> >+		DRM_DEV_ERROR(&gpu->pdev->dev,
> >+			"a630 SQE ucode is too old. Have version %x need at least %x\n",
> >+			buf[0] & 0xfff, 0x190);
> >+	}  else {
> >+		/*
> >+		 * a650 tier targets don't need whereami but still need to be
> >+		 * equal to or newer than 1.95 for other security fixes
> >+		 */
> >+		if (adreno_is_a650(adreno_gpu)) {
> >+			if ((buf[0] & 0xfff) >= 0x195) {
> >+				ret = true;
> >+				goto out;
> >+			}
> >+
> >+			DRM_DEV_ERROR(&gpu->pdev->dev,
> >+				"a650 SQE ucode is too old. Have version %x need at least %x\n",
> >+				buf[0] & 0xfff, 0x195);
> >+		}
> >+
> >+		/*
> >+		 * When a660 is added those targets should return true here
> >+		 * since those have all the critical security fixes built in
> >+		 * from the start
> >+		 */
> Or we can just initialize 'ret' as true.

I thought about it and I think I want to force an accept list here instead of
letting new targets get by with an implicit pass.

Jordan

> -Akhil
> >+	}
> >+out:
> >  	msm_gem_put_vaddr(obj);
> >+	return ret;
> >  }
> >  static int a6xx_ucode_init(struct msm_gpu *gpu)
> >@@ -566,7 +611,13 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
> >  		}
> >  		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
> >-		a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo);
> >+		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo)) {
> >+			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
> >+			drm_gem_object_put(a6xx_gpu->sqe_bo);
> >+
> >+			a6xx_gpu->sqe_bo = NULL;
> >+			return -EPERM;
> >+		}
> >  	}
> >  	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE_LO,
> >
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
