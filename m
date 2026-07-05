Return-Path: <linux-arm-msm+bounces-116601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id brK6LeHGSmr2HQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805A70B6AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aHxmvhKT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F03E6302C7B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA253B1004;
	Sun,  5 Jul 2026 20:58:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535643A83B1;
	Sun,  5 Jul 2026 20:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285098; cv=none; b=t+Yn+9oMOIaXH85YYBAq3F4uI7E5Bk5a1BMgge074y3Gby5LpcJsYkG9rIKAZExOAaAiVx+//vstFXGs41uFx3nPfwaCdKIE4gAGLu7m5fExV6ZdCFwAYztG+HAIE+UGsIy9RnflEWzmzHg8PAUH6n9nVHqaXEpHRNb3BJMAoNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285098; c=relaxed/simple;
	bh=4rlxsxoVH6r5OwX7ExhQgRYkFrkxtTy6/6Uw4jyiK7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hK+G7PenyTPMISDMxEHSI3rjSDyWJszdLpyqZm1NUaV35nt1RTZyDelcZ5y/7kjjNl0LQGDrpVzha3/LQ0xRZCQkjo2ke2KzS7RccE4HxA2NVAevKIVWmTY69YVHVDrN7Bxv9dbahY5uMX1uiNKK2uLTOTvCWOD8vFmImQ3/tI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHxmvhKT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C9E1F00A3E;
	Sun,  5 Jul 2026 20:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285097;
	bh=Q1S+qzlIG3wvMl1NLo8aWtt10rEBmCums4Uj0ebABh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aHxmvhKTNqnoCbPteAQ2rlZNGdox0T3JHxpY+ULbFBi+RT7ZAig7AhUW0slF88Mdh
	 GPTosK5jl5S4zk5+5yLAtp6nS+Wqve0EnQtXZFwwRFMrWVrBKmL+Ecm5sy2darrKSD
	 aL3StMdelNcEMYnYrjrvNkyEG9Od0d8K8LtmkfgS5/1X99ygHpabT3gi5LYq+87hvC
	 t4YghHkC9Ts+64HfD9n7XIt9/Fl7aVkpz47EtwCD/8BCU8emvfaFcRhy2NDVSEmYTP
	 SnOJBVsdBE+DKlKaekscnAvTAKEDG792ApXZoRdOfKnCQ6KDhsvBL105QOEySQjAHy
	 zUhWqyW3N/OpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/28] soc/qcom/ubwc: rework UBWC configuration database
Date: Sun,  5 Jul 2026 15:57:55 -0500
Message-ID: <178328508276.1157743.7408067266001474378.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116601-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2805A70B6AE


On Wed, 20 May 2026 17:51:07 +0300, Dmitry Baryshkov wrote:
> Currently we store several settings in the configuration database. Some
> of them are incorrect or not completely matching the expected
> configuration settings. Others are directly derivable from the UBWC
> version. Rework how we handle the values in the database, trimming it
> down to the UBWC version, HBB and several flags.
> 
> The series includes patches for drm/msm as well as for the soc/qcom. My
> suggestion would be to either create an immutable tag for the first
> batch of soc/qcom patches, which we can pull into drm/msm or to ack
> merging the first patches through drm/msm tree directly.
> 
> [...]

Applied, thanks!

[22/28] soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
        commit: e21d3b2e5c4387b243424daa0ff2d45c6fbf73e2
[23/28] soc: qcom: ubwc: drop ubwc_dec_version
        commit: e7012ac2fc000fe7ae3e58a7449b80fa955b124a
[24/28] soc: qcom: ubwc: drop ubwc_bank_spread
        commit: 5a9f4c535ae05facd4f6ef116b18062f9f2ad768
[25/28] soc: qcom: ubwc: drop macrotile_mode from the database
        commit: fc54caf87a5a7289502ecbcdc80bb71f7bb5de9c
[26/28] soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
        commit: 17120525ff070da978effc009877bace3d788698
[27/28] soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
        commit: 31e1c3248586dcc9aae42539152ab271dcfd37b6
[28/28] soc: qcom: ubwc: deduplicate UBWC configuration data
        commit: d39d5ff3e550393dea28da2fa2afe7fe3cee7f42

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

