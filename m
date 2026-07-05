Return-Path: <linux-arm-msm+bounces-116610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYhVKUPHSmoJHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:06:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD0670B6EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eaUmDhZB;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCA1C3021860
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727213B8D6C;
	Sun,  5 Jul 2026 20:58:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE83AA9E2;
	Sun,  5 Jul 2026 20:58:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285112; cv=none; b=HmJKBVNEgTTd8qQ4SMF7spuuTZAB8QZMD67Ybzzh9PsSCIvPKA1UxOgpxj3DEN7XTimxDuua3lTEjj6OIGOeteYZVcTXjh/lK3Ypsesca4MV8sbxU8tQoMWlxxz60ga69CaqB4hLEVsXOSmgkRz2BqDxBsec9hn6ih8PQOhxFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285112; c=relaxed/simple;
	bh=RyUFxQBBqeqRHY+7uV88pXgol+yDi/IdbwacoWb8TVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aaRp+5n4mNhaTijColCUs5oinfB1cPUZAV6kYiWLNkrq7ProT69FOyFVDH+Eciv0Inv1j0+WRaOsxIt3Fs4DU+125eKnABP5ExvXHG8unkBte3zHOKXUL0L9tyXUD6S+2EBm1zL/OiDul9mYLvJn2fpQMzfhkXbEv1C3DBf1XI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaUmDhZB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECE61F00A3D;
	Sun,  5 Jul 2026 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285111;
	bh=kvF20U9p4jLz7Do8a9oYX/KULoHc0Sp1lSPWWya2vuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eaUmDhZBaFxjd09zhY3+FDSq+Px7XMxuZNvbEsF+vxHT/5hhHbqX2NAMXqtwZ9TEq
	 dOa/9LYLOPHKBtkow15dehRwO5Eih/iEc+qnH8Eghsd69dpc3GFReQ0wiq5LNSLP0r
	 kMSWIXfpzcE6I8Yr8wfNtXE3uLLSU9TveuPnCfDP0I4W4+xwD1yuZFBT5NQnquWd/F
	 7/HaZknHK4/rn5EaBCBNkbOoKXhCcKR4bRiY0UWTz9KRF5j6cM6+tdD47bCKo02S8m
	 +2omtd7EOZGi0FhEm324lZLKYt0hu8e7uvH9v8aodtNuBVEx/tpXIOZ5P+gyO6Wz/x
	 5f/dPx4zm6iig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Sun,  5 Jul 2026 15:58:04 -0500
Message-ID: <178328508279.1157743.6279460557736699887.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:akoskovich@pm.me,m:luca.weiss@fairphone.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116610-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DD0670B6EF


On Fri, 01 May 2026 09:14:42 +0200, Luca Weiss wrote:
> This series adds display support for the Milos SoC.
> 
> This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
> cmd mode), and the Nothing Phone (3a) has also been reported to work by
> Alexander Koskovich.
> 
> The panel driver for Fairphone (Gen. 6) and devicetree enablement will
> be sent later.
> 
> [...]

Applied, thanks!

[5/9] soc: qcom: ubwc: Add config for Milos
      commit: 889ee1f4f6633f8300500b529518d30bec282762

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

