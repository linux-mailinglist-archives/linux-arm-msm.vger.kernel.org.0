Return-Path: <linux-arm-msm+bounces-109144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDYXNhpdD2oZJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BFF5AB759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5B7E30427D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB5740584D;
	Thu, 21 May 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7XUtvhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27500403E91;
	Thu, 21 May 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391721; cv=none; b=XdFh+RAM+4cMfCwSYWqzF2awXgBpj/MOHo5MkZESsEnTo3vxFN7BXSaWjpN0cYAKYGaXyWUy0m1bp8fz+6V2R6qhdKNMAETEH6VoB4+CUuUxvaGSsqrydXaZtZ/jgFncgfez4ohiPwOL+CtAA9YolDUByo0qZU6hq4OcWKIdtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391721; c=relaxed/simple;
	bh=bGor1DnQLVv7iunYjH+JyzED5JOXo7fuz49btgdNV7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cr+KdUsY1X6r7u417LQ9Bn/TbGKg9Gfkrz0UrWSJli/liVDKAXXxYFxDWxIZOQ3b3Sspw8+01fan2qyarqPYoN3WsuTvLPgXpcH1R1GN84JSk8SRxSCdl1A32mcm1DSVn67HhE35FD01veM7d8Omc8O1Day7EajiOFeA58nfSh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7XUtvhp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184BC1F000E9;
	Thu, 21 May 2026 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391717;
	bh=WGkA5lXoVjlzSIZoeQLMLfIwbdSnbcmaBdnP/E1bVlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C7XUtvhpGoeeWmo+Zuzl0EaBzOUy6zQ2TeyiqDiBznoZNiqEADgShlFQ19vN6f//4
	 Jwr91LxgBIAKC13YBF2yo+HE2sIBoF2WJ4+AEYUGDQM0nlMCM+cyNe69xqLzsU2pKE
	 hjWgpCkYOWohouHCJf3Ur6w9Y+oijYytnX3887XGcZbIAYBQOy5xi6K+wkrndpU6l3
	 Ziz5KFZ4iNBf6tjdQOkTkeK7cZb/P7obJQD6aIuRWngSMNHqeHfKtNFqMgRHGfShon
	 SnCEP8nGkuz7ctLIWRBg9DsKvAydFvG2E0Ptjc+coF6vMOQ4H7sYNEryXh7+jglIUX
	 ZkcCpFSJ6Q+5A==
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
Subject: Re: (subset) [PATCH v4 00/29] soc/qcom/ubwc: rework UBWC configuration database
Date: Thu, 21 May 2026 14:28:26 -0500
Message-ID: <177939170564.182385.14385611507235354897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 53BFF5AB759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 07 May 2026 16:02:56 +0300, Dmitry Baryshkov wrote:
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

[02/29] soc: qcom: ubwc: define UBWC 3.1
        commit: ab7e4d7cf6f8efd37a675a85eb0aef3d6a4954ba
[03/29] soc: qcom: ubwc: define helper for MDSS and Adreno drivers
        commit: b5f7365c44d8fd58ef0224bf4111805c4fea0a1e
[04/29] soc: qcom: ubwc: add helper controlling AMSBC enablement
        commit: c5e3f2a3abcb925f0364df09abfd759ff0590454

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

