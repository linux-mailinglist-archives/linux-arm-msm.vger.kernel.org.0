Return-Path: <linux-arm-msm+bounces-100845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHlvIn6gymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E683935E76B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5AF303B4D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681C838F92B;
	Mon, 30 Mar 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhcZ4Ysg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8838E5C8;
	Mon, 30 Mar 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886528; cv=none; b=hu8wM/Qc/4rcE3teSJt3xHGFIOFRYb7Cg8UyuM2ygNZJSjhyhNgZWFwIr4skFQSv1xz9kMhyircgReVckhuMREQOdFckqJ5XwLCHFqQk+QzEogpJOVLhAQRNvreTjSOOfrjdHkg0tIxcRbqWJsChppz4ez5+NMJkj5qs5Ev6W/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886528; c=relaxed/simple;
	bh=JRe/h3QUUXC6ufx1Rcdh/ruu1ORtHrWd1AbceXMWXp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5x9qm5kAwyo7yhnyXSADHZKIBUNOX3jKuQvpI2f47sotcrCH07qr4Makyqit11kbIuTKgaUfpVvZmLh1XSycBw8+J9CbVgwGWnDaF15YD8KAilBNkmsAHMQc2jfTqah4+Zfh/oBI7fsKBAC/d8bj9kcm4n63gKdTZAzD5lumeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhcZ4Ysg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E230C4CEF7;
	Mon, 30 Mar 2026 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886528;
	bh=JRe/h3QUUXC6ufx1Rcdh/ruu1ORtHrWd1AbceXMWXp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhcZ4Ysg/DOpwcK9BdX4SXoUrkFQDzNi41uvEn+O5Wcrvm+4IRdUmm2agM5wc5gj1
	 h8WgqtrR4lNY8fj6h/lwJg6JOKzIjdqXcI9qOl4MK5cUXCXV0CUcV2Q7M/eBqrUeC2
	 qOlJYnEFXYthHOzCW0hjBRKx/o4MMvBttcKmymQ4lusczT7aM4EdxBiTcd9kbdm32e
	 0u/yWq1dVSsxdnA7VxwxwQpkwTSXueArNP+IlKMkTr116a44rxgs1OM5d9C5a+51Q9
	 5309N74oYVOqYnbRZK2h5+TwozFVqNYJ9OXBt/kwmOQ/451b307yn9Qprz+eIM6Lc9
	 j9/jnE7RYY3Ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Mon, 30 Mar 2026 11:01:26 -0500
Message-ID: <177488647766.633011.14712098899135901424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100845-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E683935E76B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 08 Mar 2026 14:48:31 +0800, Pengyu Luo wrote:
> Add DSI display support for SC8280XP.
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
      commit: 2f4c5dea9a285cc24a80e9fef8d7014bffce967b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

