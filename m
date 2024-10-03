Return-Path: <linux-arm-msm+bounces-33018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324098F122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCBA3B22C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 14:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BB219C57F;
	Thu,  3 Oct 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b="EdVEHlGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D81990AA;
	Thu,  3 Oct 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964588; cv=pass; b=W8QMyeHZKVqrUT9iW1GtVutUHgdtd2Lm33iVmyr+P1ZZdGoxU3b/OHuPmJy2HZSBS4Dc6Prg6B2FS5YshQMzrsDD2UrVqFmsCNt0E22Jtku+S/pcyFhsUAfzCHE7TNJHwrM0jL70PuT4Wcvmk8EccQXeuREqOpwcBahnO+nLyR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964588; c=relaxed/simple;
	bh=LTnd3jdSNvNjGZdqtD6vI/EHupSMLeh5Jy6AQmo5xIU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=eNQE9s2JadtVpdJ7toyHZXRXoySkwc+ZH8zq6nDSteC1qJfWn9inZrjD3So4fxEU/GHS46PKGJ3lQuzvFw6N8LIOiXRamjUvFBUme1c13O4ewg3MKiDhX6HrRijKFJGK46kRFIlKVMRtT8wJPMGFP5e89j+xtkPe3yjSwGtSW3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b=EdVEHlGX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727964567; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PxzjsxdZoHLLEWUXBUtJIbx9FvlzyWRBvnpXUEH8ZVkpiZfTLPGvy/XA4HWYH3GdXWX+Fz+Ry4cIzMuHahHXJgKCenG8jEWyZTKZyolivk+j54T4ML2Pv/4qbGoKaFOfbRo6H73BvIGULY1NSAmuOjbDWWcC+iPHvUooV3igJ74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727964567; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1OHhhNZ+OELPUq/O9d/iIoYUAyuuf7NZlomVKgtomd4=; 
	b=ZQ39KtJe+AupNLqYeceIQqzdxeoBXyc7+0+sM3kEHQadskrnS4I2nYcJIKzFZ6S6tT88hqj7BNMI3YkvxswsQoVqav0d37uWoeLGPwvWWGLRC3KyNnFYhzpPcv2naDvBK0ZmHLei4vv1jQtS+gO8XV4X2dxwr8Y1s6xchvBbZfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727964566;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1OHhhNZ+OELPUq/O9d/iIoYUAyuuf7NZlomVKgtomd4=;
	b=EdVEHlGXFsAxJN+19yf//ol9ieQSDoRqLCvgjjIZOMKb7c74NYzeDUO6lVicMw25
	TfSDEhx15h+ibwLHoPb6jl72/1Bqu4PAePPAaebr6aFNNBGM+9Bf1cQHGBqxtcl9Rre
	77I8HB53JN/onRr797LMXBEI+94fzCMDmNvIoeyc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1727964564611390.8472928612191; Thu, 3 Oct 2024 07:09:24 -0700 (PDT)
Date: Thu, 03 Oct 2024 11:09:24 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
	"daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
	"daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
	"guilherme.gallo" <guilherme.gallo@collabora.com>,
	"sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
	"deborah.brouwer" <deborah.brouwer@collabora.com>,
	"dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
	"mripard" <mripard@kernel.org>,
	"rodrigo.vivi" <rodrigo.vivi@intel.com>,
	"quic_abhinavk" <quic_abhinavk@quicinc.com>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>,
	"linux-amlogic" <linux-amlogic@lists.infradead.org>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>,
	"amd-gfx" <amd-gfx@lists.freedesktop.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
	"intel-gfx" <intel-gfx@lists.freedesktop.org>,
	"virtualization" <virtualization@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19252b6cc3e.e564b8892647525.6443730088827538481@collabora.com>
In-Reply-To: <20240930095255.2071586-1-vignesh.raman@collabora.com>
References: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v4] docs/gpu: ci: update flake tests requirements
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail





---- On Mon, 30 Sep 2024 06:52:47 -0300 Vignesh Raman  wrote ---

 > Update the documentation to specify linking to a relevant GitLab 
 > issue or email report for each new flake entry. Added specific 
 > GitLab issue urls for amdgpu, i915, msm and xe driver. 
 >  
 > Acked-by: Maxime Ripard mripard@kernel.org> 
 > Acked-by: Rodrigo Vivi rodrigo.vivi@intel.com> #intel and xe 
 > Acked-by: Abhinav Kumar quic_abhinavk@quicinc.com> # msm 
 > Acked-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org> # msm 
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 

Applied to drm-misc-next
Thanks!

Helen

 > --- 
 >  
 > v2: 
 > - Add gitlab issue link for msm driver. 
 >  
 > v3: 
 > - Update docs to specify we use email reporting or GitLab issues for flake entries. 
 >  
 > v4: 
 > - Add gitlab issue link for xe driver. 
 >  
 > --- 
 >  Documentation/gpu/automated_testing.rst | 14 ++++++++++---- 
 >  1 file changed, 10 insertions(+), 4 deletions(-) 
 >  
 > diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst 
 > index 2d5a28866afe..6d7c6086034d 100644 
 > --- a/Documentation/gpu/automated_testing.rst 
 > +++ b/Documentation/gpu/automated_testing.rst 
 > @@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of 
 >  the result. They will still be run. 
 >  
 >  Each new flake entry must be associated with a link to the email reporting the 
 > -bug to the author of the affected driver, the board name or Device Tree name of 
 > -the board, the first kernel version affected, the IGT version used for tests, 
 > -and an approximation of the failure rate. 
 > +bug to the author of the affected driver or the relevant GitLab issue. The entry 
 > +must also include the board name or Device Tree name, the first kernel version 
 > +affected, the IGT version used for tests, and an approximation of the failure rate. 
 >  
 >  They should be provided under the following format:: 
 >  
 > -  # Bug Report: $LORE_OR_PATCHWORK_URL 
 > +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE 
 >  # Board Name: broken-board.dtb 
 >  # Linux Version: 6.6-rc1 
 >  # IGT Version: 1.28-gd2af13d9f 
 >  # Failure Rate: 100 
 >  flaky-test 
 >  
 > +Use the appropriate link below to create a GitLab issue: 
 > +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues 
 > +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues 
 > +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues 
 > +xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues 
 > + 
 >  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt 
 >  ----------------------------------------------------------- 
 >  
 > -- 
 > 2.43.0 
 >  
 > 

