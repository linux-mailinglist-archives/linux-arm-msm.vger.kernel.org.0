Return-Path: <linux-arm-msm+bounces-31381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1497279A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 05:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739F0B22D98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 03:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354114D718;
	Tue, 10 Sep 2024 03:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="BQxSpvV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209613A40C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725938312; cv=pass; b=QdtdbNiqxbA6EEotW+dMW5KPNH2xwf7ufEiwt9O+/6vMQVlrB5O2aB59cPNUA62iZ2caRSGhKtu/SoTJIFGLTR6npAlL9PiHT3tAx/SfcXNFa3Yuw4GU+69rvgoaUBKy5KmPGu6+qYDkmHGtSozx0EcJMZLCiIADmS0sWdmxqBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725938312; c=relaxed/simple;
	bh=gOE3mhIWKGa1YL/dDqzvf75hJj8GVM7WexL2cqORZoU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=I71IEbnewrYWTT5QMDF2UtD9nmq5J9eOyUjHVBc0XIrd/HxL+vnSuZ6No1Xltq4yIz1G3bt14pH2famyx3np5l6wHhCVJc4g4YNwdFOGdASN4LlzW0EeNiUvQoB+01tLNTzMzf0b3rxQRzLdY6UkAAFw1fLlY+DQS8SgQPr5Nr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b=BQxSpvV9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725938298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VtqSFNbvf928VOWfGCBQfRRCv3+VORszN9+RYtZf4MoCqQKRyzxAYTiP/oF/zSz3EXx2yAZI63TcHgaZ28Eb7xZr0RV10ZNz58bgPy0+tD0glIETDirBT155k+nanEjhKj7bjLU4l1BQM4AeBznIOrH+lQekl09SHN7Q2VhNmOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725938298; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zMNgk/4ul36ty1KhK1x7zRnURtnot5pmmHU7u4Zm8jM=; 
	b=iLWCo3/ajouoadXqSC+64xrgpDZ/0DKAX24OOUewf38/4vA4Orxk30eDlANQi89pdkTZnX9kktnokEJkkSoFbaG4YmjfeCjIOLIbTCf8xZ3urgp5pkSDlKLBygjryZBBfh1SATcDYbJb0dCJwMKxpNpApTtkGvAsTS9kC+pVTEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
	dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725938298;
	s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zMNgk/4ul36ty1KhK1x7zRnURtnot5pmmHU7u4Zm8jM=;
	b=BQxSpvV9Z3y2YpL/qH7qEptaokZujRj7WbxQflp8GOwDPh7OOQqSOrO90E34sXqY
	BkirA/UEIkyhwTu85sZu2UDkUGwLMNqJElxzcHkRGaedDCvTpawyDmVsdetLP7E1Vzp
	6cU7zO/ZcLCNijpPM3MgLbYrPiNqHdnpC7gIZJxA=
Received: by mx.zohomail.com with SMTPS id 1725938296652565.1949948862483;
	Mon, 9 Sep 2024 20:18:16 -0700 (PDT)
Message-ID: <64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com>
Date: Tue, 10 Sep 2024 08:48:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for msm driver testing
From: Vignesh Raman <vignesh.raman@collabora.com>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
 <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
Content-Language: en-US
In-Reply-To: <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Maintainers,

On 12/07/24 11:35, Vignesh Raman wrote:
> Hi Maintainers,
> 
> On 28/05/24 11:39, Vignesh Raman wrote:
>> Hi Maintainers,
>>
>> There are some flaky tests reported for msm driver testing in drm-ci 
>> for the below boards.
>>
>> *)
>> # Board Name: apq8096-db820c
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> dumb_buffer@create-clear
>>
>> *)
>> # Board Name: sc7180-trogdor-kingoftown
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> msm_mapping@shadow
>> msm_shrink@copy-gpu-oom-32
>> msm_shrink@copy-gpu-oom-8
>>
>> *)
>> # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> msm_mapping@shadow
>>
>> *)
>> # Board Name: sdm845-cheza-r3
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> kms_cursor_legacy@basic-flip-after-cursor-atomic
>> kms_cursor_legacy@basic-flip-after-cursor-legacy
>> kms_cursor_legacy@basic-flip-after-cursor-varying-size
>> kms_cursor_legacy@basic-flip-before-cursor-varying-size
>> kms_cursor_legacy@flip-vs-cursor-atomic-transitions
>> kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
>> kms_cursor_legacy@flip-vs-cursor-varying-size
>> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
>> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
>> kms_cursor_legacy@short-flip-after-cursor-toggle
>> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
>> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
>> msm_shrink@copy-gpu-32
>> msm_shrink@copy-gpu-oom-32
>>
>> Will add these tests in,
>> drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>> drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>>
>> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
>>
>> Please could you have a look at these test results and let us know if 
>> you need more information. Thank you.
> 
> There are some flaky tests reported for msm driver testing in drm-ci 
> with the recent IGT uprev 
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
> 
> *)
> # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> # Bug Report: 
> https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> # Failure Rate: 100
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_lease@page-flip-implicit-plane
> 
> *)
> # Board Name: sdm845-cheza-r3
> # Bug Report: 
> https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> # Failure Rate: 50
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_cursor_legacy@short-flip-before-cursor-toggle
> kms_cursor_legacy@flip-vs-cursor-toggle
> msm/msm_shrink@copy-mmap-oom-8s
> 
> The expectation files have been updated with these tests,
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

There are some flaky tests reported for msm driver testing in drm-ci 
with the recent IGT uprev.

# Board Name: sdm845-cheza-r3
# Failure Rate: 50
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_lease@page-flip-implicit-plane

# Board Name: sdm845-cheza-r3
# Failure Rate: 50
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc5
kms_flip@flip-vs-expired-vblank

The expectation files have been updated with these tests,

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

