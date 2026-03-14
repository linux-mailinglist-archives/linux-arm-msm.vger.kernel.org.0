Return-Path: <linux-arm-msm+bounces-97705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG0HK9SxtWmR3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 20:07:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC3228E8DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 20:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6F6A30154A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 19:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81033308F1D;
	Sat, 14 Mar 2026 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="E1xR2ydD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8CE202997
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773515216; cv=none; b=Pdpov7XyapzIA9+ve6muBYP9ZFyTTkWavt7nznj6rVjlwN5Py+Gu9O9npzumt+Or+vsi0d6OwxBmpYOnw+vBuAPMgjqvmTpOnVuBxRRCOKo9Md1vYeWI/5Tz2kvdu1xDzjDI5baLLJbZXnFVV+lauJA/BZVeAfc9eDBarOOY7AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773515216; c=relaxed/simple;
	bh=7SOhBYgZ1tDBIsohOqzU1uIMagLQbWQ6HsjjsQ3UjNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1F6KtWSDEUj5pvWcOdQexXbH53gdJGakGGygtBnypSs0Z/mofuQe3BEWWZSU2Z/AwdgiBCcCJKEzKQ9tJY8Cmx1KOmmv8MSbm8DbThK8024eimZggdGKZTznC7t5ePa2FR1d0MpUCy0+jjFk6gK6OvLzCUMX3I9WeBbro7okxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=E1xR2ydD; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <776a18d5-9d7e-45ff-8cfd-4823522ea375@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773515211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VELqPgIB6lJjzY4lY2q9OaKX2wH9iEVX9q3tH0RH+Hw=;
	b=E1xR2ydDousep9/udzvTFKguVHFOIubLRyTYA9vAg05jT4/16msSO4zEzaY28OaUwWWcqo
	prJaX0gj+XqoGfj437iFmLKbAb3AyOvsmDUv8Tf3UveaArscXvIkbr+gZRrOxLuCpmcukF
	/UXituodo6xpkTSLfUbClARVpEfLdHIXqV2oEjfICkVaNmvb/cDupwtywElcj+Q8WQYtnt
	h4vx09lxV3Snar5UtCD4fnPdCt7484HOggAG8nUj2rCEqvfnxqJS8PoyluZqmWF/hArCLo
	4JIEpHO2LWk2Qr3EqzjgHTQuHnEjBp0cpNL0aNcakmssshQiMF3pixX7OorRyA==
Date: Sat, 14 Mar 2026 16:06:37 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: EEC3228E8DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/26/26 10:49 AM, Dmitry Baryshkov wrote:

> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1

Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455, 
with niri

Running with this for a few days, seems like no change, everything works 
as before. Any way to confirm virtual planes are being used?

~val


