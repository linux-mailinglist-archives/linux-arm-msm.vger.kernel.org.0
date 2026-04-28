Return-Path: <linux-arm-msm+bounces-105053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPxnBdjn8Gn2awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:01:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A802489853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A8F5302A6D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB3133A9C1;
	Tue, 28 Apr 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jn0ofNKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F2334C1D;
	Tue, 28 Apr 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395201; cv=none; b=rTiU2gz1KCVcJbt8w4K05SlfpyyrHfsDVuummumZLMrfc7r+IRGHhbr5LPkaD/EpekgBNvAsD/Q6EEhRh/qSi45u6ovoFQtM1PFhTaOXwDBhbbPnhoUtpF/0N98DH1R2d7g+PkELofepwrshyQpruveF061AN+/29AKzCaHN674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395201; c=relaxed/simple;
	bh=bF8lF79WIGJyItaSzHEqexpfDyT/VpRTRn6Mci2vVGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=u5Bt4YR3fo03NrVCc+MInNYJFOXKjj0aD/nr0QftuUrZBBEVseD7U4vfA5Jo9f8CcTCEkZ7kdXCq+GRGFg53yMXj4T84zQOTUEqjJ+Qr8rYzdx35HDyJ8JhaNjAp5ysSwTjwO1mDOOhHmNvo+eQIbDI5uq6e/RV0vZvExwcY8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jn0ofNKc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01031C5CD55;
	Tue, 28 Apr 2026 16:54:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42E2E601D0;
	Tue, 28 Apr 2026 16:53:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52D6E10728FB4;
	Tue, 28 Apr 2026 18:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777395195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j17uIs2uSTZoslQO8sNkyZKLiUN4S6LiyldQE9M8uqs=;
	b=jn0ofNKcSjS7aBuwPqSIA3GjilSnM1Fi4lLPm8K+6s/MikfEa64Epqh/fLM3NM/EGa+YzE
	uUQyJ44k/mSph8gkWDq4lO+dxb5/SSMuygUIm/v3n6KasZIdEDf1Q7sKge4xjpVS3M2Qn1
	UjWkDO9jPkiDz1eWlFfahzgbTmjV81PtWp7XCBCzoqxjCDAxADj+YIJzq3P3F31VCwmIVY
	kg3b6/esSGyuwalMf5VoXc3w9CTLN+lzxEtByTbiyRGUco52qvTeS06DSCTdtAEB+mrTzj
	/ZuZ8ub1uiGmMMeQ/XfKamK2BByabe5ndrQs6qWN4Di4EFWIwTNGjB9YhYYP6A==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 18:53:05 +0200
Message-Id: <DI4Y0BT5TYCP.25I7SGJ3L223L@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
To: "Biju Das" <biju.das.jz@bp.renesas.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "laurent.pinchart"
 <laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Yongqin Liu"
 <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-10-a537b5567add@bootlin.com> <TY3PR01MB113469B7764079DD361E3FE8D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469B7764079DD361E3FE8D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9A802489853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105053-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.5:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,bootlin.com:dkim,bootlin.com:mid]

On Tue Apr 28, 2026 at 5:37 PM CEST, Biju Das wrote:
>> @@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>>  	 * Acquire the next bridge in the chain. Ignore errors caused by port@=
5
>>  	 * not being connected for backward-compatibility with older DTs.
>>  	 */
>> -	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
>> -					  &dp->next_bridge);
>> -	if (ret < 0 && ret !=3D -ENODEV)
>> -		goto err_reset;
>> +	dp->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dp->dev->of_n=
ode, 5, 0);
>> +	if (IS_ERR(dp->bridge.next_bridge)) {
>> +		if (PTR_ERR(dp->bridge.next_bridge) =3D=3D -ENODEV) {
>> +			dp->bridge.next_bridge;
>
>
> A warning on this patch
>
> drivers/gpu/drm/xlnx/zynqmp_dp.c: In function =E2=80=98zynqmp_dp_probe=E2=
=80=99:
> drivers/gpu/drm/xlnx/zynqmp_dp.c:2465:35: warning: statement with no effe=
ct [-Wunused-value]
>  2465 |                         dp->bridge.next_bridge;
>       |                         ~~~~~~~~~~^~~~~~~~~~~~

Ouch. Guess I should have pondered a bit longer before sending, will do
before v4...

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

