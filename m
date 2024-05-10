Return-Path: <linux-arm-msm+bounces-19707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6A48C25E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315E41F22950
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693F5127E0D;
	Fri, 10 May 2024 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3vGeAgym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87C5472A;
	Fri, 10 May 2024 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348297; cv=none; b=OyZzZy4ZwFBB662+ReOeSN3PGvQR9F2kJkPiQxApPFm2Ye7PF5eJ3wmyzNsaL6ZGuQMZoYm8+qXqjwdoNfd/Iu0TOmTL5qZndV+v3jCSUqo31YZGzrAArsrGljqmBhKGtMfPxwXHVVnM/XNXcL6meLwSnncsCwuSaAI00OseJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348297; c=relaxed/simple;
	bh=9M5UJc9C+G9SRyQypj1LM3e6cRMeJPZKj6icey2JQWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn3aSXU+GkeMLZfuqb52dOiP4itq2QWWmjJ9rouQzInJ8E9MSYyEoulDMvDOvoAsjNmPCFPs6JZzFRRKtyocV6q8Mbj4Lr3dC01X8B3PZRcG2DTzensb+iPnOyKauVe+8AXDGhb/iSZGYfIVvz8XojAKkhi8toOlLw3LmSuJORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3vGeAgym; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715348294;
	bh=9M5UJc9C+G9SRyQypj1LM3e6cRMeJPZKj6icey2JQWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3vGeAgymeAMzcAxMN7rZ7VcywZLqyxJ6HqBcuVZVw3pbZP0IOZ/s3qNwfD9spdzp+
	 AxnO6a2ks5YDDmiQKQGdGE587JsToH2SuMyGVjOtD8lcAWLG1X+qLJWu6/Fv9v8V2O
	 rVzZkTu2r22ZlxAwMQoQkjuJ9RCm6PKDUHuFXwoCCuxrJ4Kc48hbFKN2G0NOQE7XSg
	 dESKN/ZcsAi/8Y5/WsmqkZ99MtznQGh3C7gFTL+55B8H812a2tW9jozA+Nsg6YfguN
	 a5U2By8JSfkz0ZbpKkW58PnSJHhzi5oqLjqgJtYmdiOa/dAbF4SC62IxSy0jThXdHr
	 9KuZqUEzuFeVA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A1873781183;
	Fri, 10 May 2024 13:38:09 +0000 (UTC)
Message-ID: <4fcb2d0c-14f6-423a-998f-0965a139eae3@collabora.com>
Date: Fri, 10 May 2024 10:38:07 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/gen_header: allow skipping the validation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <CAA8EJppDNYR1D4NacrurY2e_xf5ycrtFBAAWaB2QVRBgSMESnQ@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJppDNYR1D4NacrurY2e_xf5ycrtFBAAWaB2QVRBgSMESnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/05/2024 17:23, Dmitry Baryshkov wrote:
> On Fri, 3 May 2024 at 21:15, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> In order to remove pointless messages regarding missing lxml, skip
>> validation of MSM register files against the schema. Only the driver
>> developers really care and/or can fix the files.
>>
>> Keep the validation enabled during one of DRM CI stages, so that we
>> still catch errors, introduced by mistake.
> 
> Helen, could you please ack merging the second patch through drm/msm tree?

Done.

> 
>> ---
>> Dmitry Baryshkov (2):
>>        drm/msm/gen_header: allow skipping the validation
>>        drm/ci: validate drm/msm XML register files against schema
> 

