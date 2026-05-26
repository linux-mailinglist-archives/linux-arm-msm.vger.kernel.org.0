Return-Path: <linux-arm-msm+bounces-109888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBJbNTHHFWqMbAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:15:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A45155D97AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B1C33024635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D233AF643;
	Tue, 26 May 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Cfp3jBb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F973AEF51
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811815; cv=none; b=SoX+wPKug3hf1riiXGNDOhVkM4XX809EL7Fdk+JFrTUZ4BUyno4nBUsnjKYvyr11Zcix+zugvEYSUXbLW+rPW5czqJUOTKF8n+toX+fiD26METL9PQjzgX6apYixUf5IBqrGx7ff4MgjLBCNvOtwEjWrCAkQYOW7Z60hZmseLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811815; c=relaxed/simple;
	bh=HvyHk7qSrPoN5Q3jlOqYSL2JqdhxRCkSA2jB2BQ90iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYC75GN5zNBQfV7G6WvmO3ZCenK6ZD6sg/lb9gcYkVjZzgpDyYGIuax3C2y7TAuRGR2jGoZSGAIY8/WYjmtw2HBlTJXpyqvsac45eJANL0zlc89+A39jWZJJc0PiHttNiz4H/xOGM36C3JFWIasgjbBq/7ywt0hskMXMe8gYypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Cfp3jBb3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NVQM7BLJHLhYOoEkHmhcc4JzD44t4ayT0gYW6wGZvM8=; b=Cfp3jBb3IptkOfKHa1BABv6j/+
	YKng3/sOJCVjqe/8w/BxORBpdqVOQVLI23YS2wSdtyYm3IFk3iFNsA9vFwALePv9cn0G3zV8qjGKZ
	iTJ2tIfRbT59Pbk5HFeWisp+nVIAmdUX2rK5qS62o5VSU9DZhWtaJEIHTHjjvYUAnfLlA9eE+zNdj
	wfvOgsQufXC8Uxqnh+KG7S4PyxbSQvK06BbMDsBxQOr2dyH4Xnvs5Ymp+7QZbN0nvWYmVVPmPh1QX
	ykaU+DvJnmOqVMpicrVy1XZemmh/wxrERU/+PT4z/sHcgkxoIifVukzMKHTwuVW7ozjRHjtLqDZcR
	An595ZJQ==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wRuLR-008VeX-Vv; Tue, 26 May 2026 18:09:30 +0200
Message-ID: <9d30ef2d-cea8-44dc-9669-492ddaa02108@igalia.com>
Date: Tue, 26 May 2026 18:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/amd/display: use plane color_mgmt_changed to
 track colorop changes
To: Alex Hung <alex.hung@amd.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260525100524.304263-1-mwen@igalia.com>
 <20260525100524.304263-5-mwen@igalia.com>
 <85aad1b1-3ac8-464a-ab5a-69c92a491925@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <85aad1b1-3ac8-464a-ab5a-69c92a491925@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109888-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: A45155D97AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 26/05/2026 05:29, Alex Hung wrote:
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Hi Alex,

Thanks for the reviews.
As this last patch depends on the previous one, I think the entire 
series should go via AMD's branch, instead of drm-misc.
WDYT?

Melissa

>
> On 5/25/26 03:50, Melissa Wen wrote:
>> Ensure the driver tracks changes in any colorop property of a plane
>> color pipeline by using the same mechanism of CRTC color management and
>> update plane color blocks when any colorop property changes. It fixes an
>> issue observed on gamescope settings for night mode which is done via
>> shaper/3D-LUT updates.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index d590f0df6abd..36425d9c2a67 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10198,7 +10198,7 @@ static void amdgpu_dm_commit_planes(struct 
>> drm_atomic_commit *state,
>>               continue;
>>             bundle->surface_updates[planes_count].surface = dc_plane;
>> -        if (new_pcrtc_state->color_mgmt_changed) {
>> +        if (new_pcrtc_state->color_mgmt_changed || 
>> new_plane_state->color_mgmt_changed) {
>>               bundle->surface_updates[planes_count].gamma = 
>> &dc_plane->gamma_correction;
>> bundle->surface_updates[planes_count].in_transfer_func = 
>> &dc_plane->in_transfer_func;
>> bundle->surface_updates[planes_count].gamut_remap_matrix = 
>> &dc_plane->gamut_remap_matrix;
>> @@ -12024,6 +12024,10 @@ static bool should_reset_plane(struct 
>> drm_atomic_commit *state,
>>       if (new_crtc_state->color_mgmt_changed)
>>           return true;
>>   +    /* Plane color pipeline or its colorop changes. */
>> +    if (new_plane_state->color_mgmt_changed)
>> +        return true;
>> +
>>       /*
>>        * On zpos change, planes need to be reordered by removing and 
>> re-adding
>>        * them one by one to the dc state, in order of descending zpos.
>


