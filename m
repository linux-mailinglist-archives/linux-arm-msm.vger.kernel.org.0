Return-Path: <linux-arm-msm+bounces-1783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99D7F6D14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 08:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9EAC281331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 07:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7B68C1B;
	Fri, 24 Nov 2023 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z9ihSIAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D480D40;
	Thu, 23 Nov 2023 23:46:36 -0800 (PST)
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE18466022D8;
	Fri, 24 Nov 2023 07:46:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700811993;
	bh=8LvJc8DaAgHeIHvOQk6AYJxeRlrV3q4wIVakxhIdGb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z9ihSIAdqUhMuQz9cCS/bwAmg2YL6c12FYaZKZOE5E7g8/LQH3vK7Z5qQiqUpBp7C
	 H/E0LW/5bWnBo0sXZAYEL6+5JpXKxm0emC+OR/R2hQTJBn/6lU7fl4ile4YO3aSwT2
	 BuR3+9KMeMjwQL09nvKxfl/kjb1Kc9He7tUmzKnVqZxBWehMdO1nmbNcTBxWAMkU+D
	 /5UN0N8+uUwJf1DC8gzc/BSCwMTmK01P379ZRX77WH8aFX3f4Qt4NQm9DFRPAIVrFg
	 yF0tNZWvbSZ0b+JbadNjsRbBorMOmlwMqYiO7pqx99IHuoyyl7xhdPkJkUO0GOw4e1
	 vVXd1rSFeLQxw==
Message-ID: <92467afc-cd50-41aa-a3a5-481c9da30a4c@collabora.com>
Date: Fri, 24 Nov 2023 13:16:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
 <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 19/10/23 13:55, Daniel Stone wrote:
> 
> By the time we get this error, it indicates that there was previously
> memory corruption, but it is only being noticed at a later point. The
> skip lists here are way too big - stuff like drm_read is common
> testing not affected by virtio at all - so we really need to isolate
> the test which is actually breaking things.
> 
> The way to do this would be to use valgrind to detect where the memory
> corruption is. VirtIO can be run locally so this is something you can
> do on your machine.

Thank you for the hints and suggestions. This is now fixed in 
igt-gpu-tools, and the patches are merged. I will uprev igt in drm-ci 
and rerun the tests.

Also will drop the tests from virtio_gpu-none-skips.txt and send an 
updated version.

Regards,
Vignesh


