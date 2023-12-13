Return-Path: <linux-arm-msm+bounces-4561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6638811C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A3EFB20B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E83E2555C;
	Wed, 13 Dec 2023 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HKaHHKc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC92D4A;
	Wed, 13 Dec 2023 10:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702492214;
	bh=siA7LXSw/cWZOr3eONb6GU7+2W3xc0vUDDvqYVEXHo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HKaHHKc0GUtMtMwGqB+JhK/Vd2s7zl9h17X37TcWvqJ0glMkrpvUvtD8ZM5zP8oTb
	 Oj4pz9a2wJo3jO39ryXI/U1WQnYL+fCTObQZwpY+LyftemSP7OKFByncn0wiOqL0kC
	 /R1gMJO5f0fFI42K/EPxi5SXCGcG2Xw4aifPcDczViY3hkFFI1nPp0pYsRjl4YWwCG
	 ag3BhjF/myOaupGXZQYNhPbCmDhTDYQuojNMX3AFXDhFkgl+6ltnI1kbYK8l8ZDfzW
	 kfTH6jskaTJOYZBhR6GtJsxacD1N9KrTqBgrdxzKkZTo8fXUZJeiEstd75yGdAhLHg
	 7Svf5ssqsr+0g==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 95141378149B;
	Wed, 13 Dec 2023 18:30:10 +0000 (UTC)
Message-ID: <dd153cf3-541b-40c8-b33c-ce9e7074cc37@collabora.com>
Date: Wed, 13 Dec 2023 15:30:07 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm: ci: fixes
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2023 06:18, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> 
> v2:
>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>    - Reworded the commit message for enabling jobs
>    - Added a new patch in the series to use scripts/config to enable/disable configs
> 
> v3:
>    - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
>    - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
>    - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig
> 
> v4:
>    - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
>    - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
>      This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/
> 
> v5:
>    - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
>    - Added a new patch in the series to make artifacts available for virtio jobs
>    - Added a new patch in the series to add pipeline url to fails and flakes files
>    - Generate fails and flakes file with the updated xfails script - https://www.spinics.net/lists/kernel/msg4959630.html
>    - Drop 'virtio: Update ci variables' patch as the tests which causes the malloc issue are skipped
> 
> v6:
>    - Updated commit message for enable DA9211 regulator fix
>    - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173 while setting IGT_FORCE_DRIVER
>    - Added a new patch in the series to uprev IGT to fix memory corruption
>    - Added a new patch in the series to update drm ci documentation
>    - Generate fails file with drm-misc-next
> 
> v7:
>    - Fix checkpatch style problems in commit message
>    - Rework mt8173 IGT_FORCE_DRIVER fix and reword the commit message
> 
> Vignesh Raman (10):
>    drm: ci: igt_runner: Remove todo
>    drm: ci: Force db410c to host mode
>    drm: ci: arm64.config: Enable DA9211 regulator
>    drm: ci: Enable new jobs
>    drm: ci: Use scripts/config to enable/disable configs
>    drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to panfrost
>    drm: ci: virtio: Make artifacts available
>    drm: ci: uprev IGT
>    drm/doc: ci: Add IGT version details for flaky tests
>    drm: ci: Update xfails
> 
>   Documentation/gpu/automated_testing.rst       |  7 +--
>   drivers/gpu/drm/ci/arm64.config               |  1 +
>   drivers/gpu/drm/ci/build.sh                   | 16 +++----
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
>   drivers/gpu/drm/ci/igt_runner.sh              | 10 +++-
>   drivers/gpu/drm/ci/test.yml                   | 13 ++----
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 13 ++++--
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 ++
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 46 +++++++++++++++++++
>   9 files changed, 86 insertions(+), 27 deletions(-)
> 


Applied to drm/drm-misc (drm-misc-next).

Thanks!
Helen


