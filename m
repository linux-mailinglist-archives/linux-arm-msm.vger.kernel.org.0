Return-Path: <linux-arm-msm+bounces-35352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F889A9AF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D6B283039
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D8114A4F3;
	Tue, 22 Oct 2024 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QVDptM+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FD1494BF;
	Tue, 22 Oct 2024 07:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581982; cv=none; b=swPeOO3fZ345pnkmdCEsvAXzShf7aU4eK9mk/BUzttPUueW64Z3493OO569Mg9LiaNMWAE5/e7SJmyH7TKCb3MQJu9tFIQvvI9UOIFEZods4uDOiW7Zs5gzIzs7EprDM+Y15t4Qh6pt+s826HhguYP0FcZKtGUaQNpm8W56Y5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581982; c=relaxed/simple;
	bh=XXQtPBrZ9W84M1N+XoRyccWWIHR6QnK+jlUEKQ5ZI60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5/AIoJLIgzd49vxXecUsgXhYL3Hp1NJ3zQV4JtSePH86i6P4tXdxd5xZxF4YcfXjAN2RdL/rOaaGoKq2Qb57vfCINcj89TzFOsWAsRKNmIZzvlIq5m4Hm2/AR59qrHHzasQ+Sj6j+x/m3d3tKJnIzZBPeQ3V8oANtx+P2XnUoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QVDptM+8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729581978;
	bh=XXQtPBrZ9W84M1N+XoRyccWWIHR6QnK+jlUEKQ5ZI60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QVDptM+8fv9NCuIO6hY9PfOZT7AfeRldt9dyQd7CqnwieJIg7+gYW7/RB4+gicVCd
	 wL1fF6Dxv2CQtkb/atzcLWQYNQgqmMUpnhwkL/wUBVpChUK29PdGsgnnqHNPQAyYtV
	 TwbcMc2jVYevMQFKVc8ee7aP5ohHmtoSZMitj87hXKn1DGuwKzDsZlQSF+jhGI2toq
	 kL/nVBjUOhDfkPueMKFW8cU4D421EM3U2M2IzthMKvXd+yaeearUHRM700YBKU57aj
	 DgA2cgwFib6ZqQdpR0t3NI5oTFOcJUg/NMI4OCPXcB0BzF2cGXZ1O/gASEoUut/ZYx
	 oM7Mz8BbG+c6w==
Received: from [192.168.50.250] (unknown [171.76.81.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B69B317E10D2;
	Tue, 22 Oct 2024 09:26:15 +0200 (CEST)
Message-ID: <0cd1d4af-ee47-468a-be70-ee2c30948eb8@collabora.com>
Date: Tue, 22 Oct 2024 12:55:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/ci: refactor software-driver stage jobs
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
 <20241004133126.2436930-2-vignesh.raman@collabora.com>
 <CAPj87rPGD8Pu_CSPXfRtsS_w8UYVJGR9CoLx7RAT69EUKefs3A@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rPGD8Pu_CSPXfRtsS_w8UYVJGR9CoLx7RAT69EUKefs3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 07/10/24 22:07, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 4 Oct 2024 at 09:31, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> +.software-driver:
>> +  stage: software-driver
>> +  extends:
>> +    - .test-gl
>> +    - .test-rules
>> +  timeout: "1h30m"
>> +  tags:
>> +    - kvm
>> +  script:
>> +    - ln -sf $CI_PROJECT_DIR/install /install
>> +    - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
>> +    - mkdir -p $CI_PROJECT_DIR/results
>> +    - ln -sf $CI_PROJECT_DIR/results /results
>> +    - install/crosvm-runner.sh install/igt_runner.sh
> 
> Instead of inlining this here, can we please move towards reusing more
> of .gitlab-ci/common/init-stage[12].sh? If those files need to be
> modified then that's totally fine, but I'd rather have something more
> predictable, and fewer random pieces of shell in each job section.

Sure. I will look into init-stage[12].sh and see if we can reuse it. Thanks.

Regards,
Vignesh

