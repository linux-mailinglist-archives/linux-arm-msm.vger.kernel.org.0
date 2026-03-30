Return-Path: <linux-arm-msm+bounces-100840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAPBKzygymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:09:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3A35E6E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7395730255FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3162E38AC8D;
	Mon, 30 Mar 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHrnOzRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35738AC77;
	Mon, 30 Mar 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886522; cv=none; b=THsVGvoO0cCCQn2H+bo5QvId7bFSASU+wTjxJcrV4ajY5j4sfE3gvSLe8DXPXs2ZGBHAGsrzjZ6tVJGfRJ3Lxj5rCHZrxz4S1djDDjpWsGaL5V83DwZy4R4vInvFtSXZriiy0cVrnPeR0RQRDDVKu1tP4Jow52PH5t5NbJSRTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886522; c=relaxed/simple;
	bh=koYo+yLuvebxKhVW/TeuYKONtZdgfhNP1zbiYBgdN+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h40IoOBYGoD9v2fBdyQ8zaDXT1LJqDsQ01T4P4bfSL17txBHgRwzdb2jBQl3+wkn1WKInCKD19ZDlXT+g12br0tkRwnJoCZBIVBUDu3kBTfALfBR3A9EvfszyrAFtlI/3DmbfQSrI+8cCThqjD9UZ9/S2iQZuiMZVzVVm9qMsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHrnOzRl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AED5C4CEF7;
	Mon, 30 Mar 2026 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886521;
	bh=koYo+yLuvebxKhVW/TeuYKONtZdgfhNP1zbiYBgdN+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hHrnOzRlD+pU/+xEAq1NZ/mJxtudoV0WsTuTrqllzBoEsm/0BiSnq1Js5BCqVGMtP
	 Nsb2ple72fNmeZL+UCrj2nwPbdqQg4kCeE5JmRhHOKgXQYqpwaIUHQPs+jagnxxlwv
	 uwlETPwL/bTPZqZrug7Mf8GSltD08VSDwId0aEyUO6q/+pEeNYK/R5iUuoNBjmFrOY
	 blz6yyw54BlqopIKV/2iittVUsG/BBgQdii5/zE35p/FK+40ErZC0gWw/GsfxcSVl6
	 7QLhaK/ylDDbhP3IAEelnOgXhVw2LOxWzQmHm7JCyf+Lua6hzcE0oqQZuP5vWUa+mg
	 XOI9OD5BfP+TA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
Date: Mon, 30 Mar 2026 11:01:21 -0500
Message-ID: <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100840-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16F3A35E6E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 13:22:10 +0100, Krzysztof Kozlowski wrote:
> Device node has children with MMIO addressing, so must have ranges:
> 
>   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
      commit: 88bdac5443e5269bb39c4968d5ee0becbffe3f82

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

