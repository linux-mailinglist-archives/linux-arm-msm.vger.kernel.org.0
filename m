Return-Path: <linux-arm-msm+bounces-101230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEplKaaxzGnIVgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 07:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A1374F55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 07:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F836302AAED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 05:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B492C21F8;
	Wed,  1 Apr 2026 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d3M2pXji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6117B425;
	Wed,  1 Apr 2026 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022495; cv=none; b=RjDFGHhLKzbubmfAqWcDni3xvx3bA/pXyGOtnuIsEOx/m+fS3+DC43u5qb51/TA1stUERtdabWF9UB481hJ3wWHQdICMwUE6Ny8Mpl8PWGViQcjQj49RTM4HiVOENZkw02zyuc4abrehgmfPuAwXNM2kg7mSsjU5upaeMTGowUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022495; c=relaxed/simple;
	bh=1zqNQlzQvZgzONTUlDEXkk0XrQwfQYtDkTgTaMTLRR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Duupj+ly5m4s7ObggkcdZEYpnsB/iqWoVBZ6oEi0pxhWXeU0kL+lEZfs6Gf9RI25DobLDmPnY6PMWMOZ1mrwUmvUG8g/2hxyJZhJUSg+E8gV+UsourGFr/z83fawPNeF8mHON3kTxf837jQDDzAkqVs+HvA+tx/k4x2xK3BcHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d3M2pXji; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775022492;
	bh=1zqNQlzQvZgzONTUlDEXkk0XrQwfQYtDkTgTaMTLRR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d3M2pXjiJYXYd1/0Tec3q9sH/Agd8E4CE77T0c+ZHD1bEyHZ0GpDVB0yy/tLAVCzl
	 IFX6hrj1O4JqTo3p/WCAj6JhJhpEb5kUpN6mfVeqfpzxelWZ2Lao1csZjus0Z1bakP
	 CTWbhjkLGeTGmjqN2612QUsL8zaLJipy2xN7QN478ymIuktlfGfovBKx5ew0Cx+GX6
	 OiHRy5LxnlMTZvfGFSmXh45GTHXD2Rlqtg4Y8m5WqkcZ5T/WlfVN1FtNTCnIFrVLPf
	 aVnhxp6k8dkuCtCHJinAXO1QLa0BE6HSmsIPtCWRz2++cBHCifl+SqKBXOypyS0Wbh
	 lBgsYgLVUJtQA==
Received: from [192.168.50.190] (unknown [171.76.80.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E327D17E72C1;
	Wed,  1 Apr 2026 07:48:09 +0200 (CEST)
Message-ID: <107b1aca-40be-4555-9541-e2a9d56f0b3f@collabora.com>
Date: Wed, 1 Apr 2026 11:18:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260224081036.220820-1-vignesh.raman@collabora.com>
 <hnlupswfdkrzv45y6jl5x5u25zp2k642z6ordzthqbdw4azhxb@6gz5hx4dcujc>
 <fs6nbg44r2ralxrkuc7slciapnufyyw6derolzlwzt7hjxlx62@vftuo2vmfpom>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <fs6nbg44r2ralxrkuc7slciapnufyyw6derolzlwzt7hjxlx62@vftuo2vmfpom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101230-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A09A1374F55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 24/03/26 00:56, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:23:40PM +0200, Dmitry Baryshkov wrote:
>> On Tue, Feb 24, 2026 at 01:40:34PM +0530, Vignesh Raman wrote:
>>> Add job that executes the IGT test suite for
>>> sc7180-trogdor-wormdingler-rev1-boe.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v1:
>>>    - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
>>>    - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/
>>>
>>> ---
>>>   drivers/gpu/drm/ci/arm64.config               |  4 +++
>>>   drivers/gpu/drm/ci/build.sh                   |  1 +
>>>   drivers/gpu/drm/ci/test.yml                   | 10 +++++++
>>>   ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++
>>>   ...180-trogdor-wormdingler-rev1-boe-skips.txt | 30 +++++++++++++++++++
>>>   5 files changed, 68 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
>>>
>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>>> new file mode 100644
>>> index 000000000000..4af93eeeaf99
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>>> @@ -0,0 +1,23 @@
>>> +core_setmaster@master-drop-set-user,Fail
>>> +kms_color@ctm-0-25,Fail
>>> +kms_color@ctm-0-50,Fail
>>> +kms_color@ctm-0-75,Fail
>>> +kms_color@ctm-blue-to-red,Fail
>>> +kms_color@ctm-green-to-red,Fail
>>> +kms_color@ctm-negative,Fail
>>> +kms_color@ctm-red-to-blue,Fail
>>> +kms_color@ctm-signed,Fail
>>> +kms_color@gamma,Fail
>>> +kms_color@legacy-gamma,Fail
>>> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>>> +kms_flip@flip-vs-panning-vs-hang,Fail
>>> +kms_invalid_mode@overflow-vrefresh,Fail
>>
>> I don't see this failure in the logs. If it is removed, then all three
>> failure lists (and all three skip lists) are the same.
> 
> Any updates?

I will review this again this week and update.

Regards,
Vignesh

