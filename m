Return-Path: <linux-arm-msm+bounces-103018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHc9MmKk3Wl8hAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0913F4F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACF6B3018766
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 02:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD4F273816;
	Tue, 14 Apr 2026 02:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="QCA6SqHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA341270545;
	Tue, 14 Apr 2026 02:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776133115; cv=pass; b=h/m80xYy0pyD2cvXWsffUOZuqQ2+couPD19xzHolUlZ0GrPYK7iRBr4ZhDR/T+nu7m2X6XjvTTo2xZ45ElUOl/ILgIsEWqfVoOdbJjzu2Z04xk8aVORBtlCy/aKoAU5TN9eEEm6Pv67eWRLxQVjBKfR6sus22AeqhPV4HMJOmes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776133115; c=relaxed/simple;
	bh=0N6RVWG+ANs708PpZVlqi28Ojv+F+7rYrSYrrlAhpn8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hyFyzBZUkLvWUGAGZV36IczmVDfX2cNbTkzk6m5WWHu59aU5tpLjhfPVRLfpHzOycNi+17bXsj/B082ehX+EJNQRsJjIGkihknDlbAVenfxMEJrfGI9ZaXC60fOpjq4MoJjKUTuyYvWvu5NLlvnSBS/rOgZHp8AhMP7D79NYdCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b=QCA6SqHa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776133104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c42+mUu/ZmzPos/OoMn7m+KIM2DGTXwaSpMWbSZlfK32eqjYTnjGbWYuMUuR+iC/7R8C43jLanAqBWQXdY8C7SL+nk6YhzrCX+w4U7TQNJPcrV0PgUAgOar4yhZ+Lwtgmp9lFM39xKFOX+DB3okGAo2TAzv7dCM4wbruOZtJk2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776133104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hZudGe9ubCswbpqHpdr5DgXDqpHTXjpX4gG5xwikxVw=; 
	b=ACie2l32VpRamkT1DsY5bg5cGlmVUTXvtNozWeRTRbXpI0Eo47WJQbKB5Lm1x8HjZoXJVotCgFys+xegHRge54bkTLuevgfwGJj2iiXXplvxJOljHG0d+zEZR+OIWyY35SzraBp4ACCBG8K1nTg7t1mnv4jUw4iiKqaq5CX1l88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
	dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776133104;
	s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hZudGe9ubCswbpqHpdr5DgXDqpHTXjpX4gG5xwikxVw=;
	b=QCA6SqHaiJHxmfuxCtczGCRHnm29X2D0exlZ/HfTZj38hNy1GO3T0ZcbVFxxqUxs
	Z2kQn1eXadoE/1jlSUF7FPLfRkG7Ci0wkYQ6yqMvuDvgNs3WKVU0sXDj0n7m+5K95aP
	VoDmdpN9LJ9LMbFYDmArOLZ3imq0JLCewqdaGytg=
Received: by mx.zohomail.com with SMTPS id 1776133100933602.9332167813777;
	Mon, 13 Apr 2026 19:18:20 -0700 (PDT)
Message-ID: <78568e6b-a92c-4d6d-8f15-8bf48ce6a5c7@collabora.com>
Date: Tue, 14 Apr 2026 07:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
From: Vignesh Raman <vignesh.raman@collabora.com>
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
 <107b1aca-40be-4555-9541-e2a9d56f0b3f@collabora.com>
Content-Language: en-US
In-Reply-To: <107b1aca-40be-4555-9541-e2a9d56f0b3f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103018-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED0913F4F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 01/04/26 11:18, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 24/03/26 00:56, Dmitry Baryshkov wrote:
>> On Sun, Mar 01, 2026 at 02:23:40PM +0200, Dmitry Baryshkov wrote:
>>> On Tue, Feb 24, 2026 at 01:40:34PM +0530, Vignesh Raman wrote:
>>>> Add job that executes the IGT test suite for
>>>> sc7180-trogdor-wormdingler-rev1-boe.
>>>>
>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>> ---
>>>>
>>>> v1:
>>>>    - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
>>>>    - Depends on https://lore.kernel.org/dri- 
>>>> devel/20260210071138.2256773-1-vignesh.raman@collabora.com/
>>>>
>>>> ---
>>>>   drivers/gpu/drm/ci/arm64.config               |  4 +++
>>>>   drivers/gpu/drm/ci/build.sh                   |  1 +
>>>>   drivers/gpu/drm/ci/test.yml                   | 10 +++++++
>>>>   ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++
>>>>   ...180-trogdor-wormdingler-rev1-boe-skips.txt | 30 +++++++++++++++ 
>>>> ++++
>>>>   5 files changed, 68 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor- 
>>>> wormdingler-rev1-boe-fails.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor- 
>>>> wormdingler-rev1-boe-skips.txt
>>>>
>>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor- 
>>>> wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm- 
>>>> sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>>>> new file mode 100644
>>>> index 000000000000..4af93eeeaf99
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1- 
>>>> boe-fails.txt
>>>> @@ -0,0 +1,23 @@
>>>> +core_setmaster@master-drop-set-user,Fail
>>>> +kms_color@ctm-0-25,Fail
>>>> +kms_color@ctm-0-50,Fail
>>>> +kms_color@ctm-0-75,Fail
>>>> +kms_color@ctm-blue-to-red,Fail
>>>> +kms_color@ctm-green-to-red,Fail
>>>> +kms_color@ctm-negative,Fail
>>>> +kms_color@ctm-red-to-blue,Fail
>>>> +kms_color@ctm-signed,Fail
>>>> +kms_color@gamma,Fail
>>>> +kms_color@legacy-gamma,Fail
>>>> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>>> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>>>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>>>> +kms_flip@flip-vs-panning-vs-hang,Fail
>>>> +kms_invalid_mode@overflow-vrefresh,Fail
>>>
>>> I don't see this failure in the logs. If it is removed, then all three
>>> failure lists (and all three skip lists) are the same.
>>
>> Any updates?
> 
> I will review this again this week and update.

Please can you check this pipeline which has the failure jobs,
https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1642103

I will resend a v2 with some minor updates.

Regards,
Vignesh

> 
> Regards,
> Vignesh


