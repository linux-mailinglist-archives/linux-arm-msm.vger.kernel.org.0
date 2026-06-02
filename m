Return-Path: <linux-arm-msm+bounces-110838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvs/FJ0gH2odhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:27:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6A631107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oldschoolsolutions.biz header.s=s1-ionos header.b=LAfJlkCA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=oldschoolsolutions.biz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD617301A285
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 18:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156E739281B;
	Tue,  2 Jun 2026 18:27:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5479391831;
	Tue,  2 Jun 2026 18:27:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424852; cv=none; b=rmYKPx2LE5TCFqA+Zcloj4Ndu1mkqily2rElQMIOUrmCiqkGqdBMgYOdZLIUmg9vdJbse/YAbS/aMqGuZqzYUFEH6dbepIWlOjCvWniUJpLhnNOnU5ofhmYHuNJfcdGoJAs4sw04kKrD5FQOnkDTDt1z68bNeAdJ1KsU7uJKVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424852; c=relaxed/simple;
	bh=s2g27FFj4SyeGT+RQPpmlU62O+1qoErhbW7atINmYwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0T6xX+PbehBAiwDi3C95mkFgGGdsF6O0s8NlRVIcqn31dDwdRJ74sCNKtlYde1T0sPkC+L7xalrf9dXGaoiPfZe84xDSGsDY89WMGYQvHMeLrqFclryOtk1sWdEJbZvq/0OsUo70O/Gyzs1T1zSVuxpefeoyiYt2HJVXNxWw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=LAfJlkCA; arc=none smtp.client-ip=217.72.192.74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1780424795; x=1781029595;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=s2g27FFj4SyeGT+RQPpmlU62O+1qoErhbW7atINmYwo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LAfJlkCAMRzFTC8yO0nOV9JFfpv7yylwmBf4T7LwDQHsDBBUjScHCZ77d5SWFywN
	 /1mo7LWiajv80HHyQNBu6zXy9y8M/2fBGsCzkJ/VcEAozB7qwLvepv86WOGwCCOIF
	 bE3VILsfc0kW/dMgT8bxNjViyN0Fx7tGGDXc3T218ri6C3/j8wyZ645rUFr3sA5G6
	 poQnk+sqVPL/FFlSU3J3pz5xAGgzRFUBZj4JhSRSQrmBPMSJc5b2keNFAiTeJtNZK
	 QaieIYNB+7zTef9zyvWgOeP9pb1YfXK5MUEaODPY2nhB8mLRUi5ZJidQ6xlpFNb2o
	 S8N9zf1YA799QnXVgw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N33AR-1xQggY1yvt-00slrF; Tue, 02
 Jun 2026 20:26:35 +0200
Message-ID: <240b394b-46c5-4d9b-85fa-981e2c3b9457@oldschoolsolutions.biz>
Date: Tue, 2 Jun 2026 20:26:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] drm/msm/dp: add EDID re-read retry in
 msm_dp_panel_get_modes()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
 <d50293fab9e6292220b1817a8e85bbd89743b708@intel.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <d50293fab9e6292220b1817a8e85bbd89743b708@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ESetc5kZkGB0y4ImqTCqke0Rum4vzm47lKLJRUXoDQl/vZrSps+
 OLtheZoqtvb3BowbhFGRufRKZxZzWgGUCIdlkk14i+K8REH8vHureNMLFZFO1IbAPpzacgD
 RphZk/KIaD1/8m22ejZ20YSIYCcmQNIIcv7BqIveGZvQTEIf89NpZ55rvSH1h3dPtXVBmR6
 7R1eZkVsGN9v+eDXp8mEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1C9+wbZyQ28=;PZ4Ij34bUbBDM9dFXAxiktzQnDX
 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
 h5Nn3WZWV90Kka+Jc9hHEhSpH5acs=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110838-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:devnull+jens.glathe.oldschoolsolutions.biz@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,jens.glathe.oldschoolsolutions.biz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:from_mime,oldschoolsolutions.biz:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEF6A631107

On 01.06.26 12:57, Jani Nikula wrote:
> Did you actually bisect to this commit? It's a bit of a surprise.
Hi Jani,

haha yes, sort of. I did a few weeks of bisecting for a different issue=20
[1] and this error message came up increasingly, so after resolving (or=20
so) the first one I took a shot at it. The commit was the result of git=20
blame for the line that the retry was programmed around. And as v2=20
shows, it was the right intuition.

[1]:=20
https://lore.kernel.org/all/20260530-typc-mux-modeset-v1-1-64b0281e2cd6@ol=
dschoolsolutions.biz/

with best regards

Jens


