Return-Path: <linux-arm-msm+bounces-106531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM/uC1/5/GkrWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB04EED39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87F283081416
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722BA4A3415;
	Thu,  7 May 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGlsqKZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA734A33FC;
	Thu,  7 May 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186114; cv=none; b=JBAVzDlzuabwBUfDs4n4eGWsrJ6tdz3MRi0CtzwOdhr8vpIOo9wnGmAC4ffyLHN/Bz/b2IXEu8IXikI8L4DXUMWTCub7yahTJ5HQqIhegQt60qOCeoOBQJUX8Om/fbegZ0csBkt5HRVwUY1mxpBl3t/o7COVi4G4+xx6NHOcdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186114; c=relaxed/simple;
	bh=HILlO92SW0znJjse5gzT1MtszGLFwhctmq0VpKqP2ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icQTwww0ZFFNvXNEDim6zvarmFb3/KbmRLvGwWv4Qtmp8iZ+LfMcKW4tubRFP2jlq57Z2tGALnysGNljKf/Xb/ZIUGjwtqLJr1T5KCUoNIp6oQ5dPPsrQ7X6/jDCdE90X0jhprChgquYiqrQtkPVAg/hLR4QVKimP62oKELxRL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGlsqKZA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75CBC2BCB8;
	Thu,  7 May 2026 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186114;
	bh=HILlO92SW0znJjse5gzT1MtszGLFwhctmq0VpKqP2ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGlsqKZA1KlBsAHUd49GRZdVlrNae7YNtkTdd3WArm0Q/g989C8iv5y0Sl4yKUZyJ
	 B8zBdXhynXDjhTk3wx3GMOxwxqIuvSRDf5INdw1Vx0wsOrbyC/rivhvGHZf5AflsGd
	 hUz/OGck7kEVxUye8PwjgCA6PL9XG+6M20zTlOTO9vEIkzgPIZiHm2Y+0UZdoFeZlH
	 2IRRfacVK1ik82yN7ZJxpWVHV5kWhhiVObv96nqOVtESkgMvA9Y6ftcHcJiWrCOIML
	 h9nY5c1nlI9ecEVYjbb7gFKg8al07/WHxLYSWRRv4OOxZQNEKr6aUz7N69AKd75H2M
	 mKKXKfzo/Ts0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@oss.qualcomm.com,
	marijn.suijten@somainline.org,
	swboyd@chromium.org,
	mripard@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	sean@poorly.run,
	airlied@gmail.com,
	simona@ffwll.ch,
	alex.vinarskis@gmail.com,
	Abel Vesa <abelvesa@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	quic_rajeevny@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_riteshk@quicinc.com
Subject: Re: [PATCH v5 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu,  7 May 2026 15:34:29 -0500
Message-ID: <177818606044.73000.3306386577026904945.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B4DB04EED39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106531-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linux.dev,poorly.run,gmail.com,ffwll.ch,quicinc.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Thu, 02 Apr 2026 15:20:00 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride and lemans-evk-ifp-mezzanine platforms.
> 

Applied, thanks!

[1/3] arm64: dts: qcom: lemans: add mdss1 display device nodes
      commit: 3e6cd0c43cdf678622c19210bd1a70b04c8a79af
[2/3] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
      commit: fcc1a19f5bd5623c448e54b2ea6d50249abea77a
[3/3] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable mdss1 display Port
      commit: f0b64466e2896020ff2bcaa512bbcc4fea847635

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

