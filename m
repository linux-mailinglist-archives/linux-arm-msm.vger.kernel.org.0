Return-Path: <linux-arm-msm+bounces-107581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BtQF869BWpZaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:19:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE57541811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C354302A1AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71CC3C2B8B;
	Thu, 14 May 2026 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwq/HOJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE73815CE;
	Thu, 14 May 2026 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761161; cv=none; b=V7VKnYQjpw5ZpiRro+4FH3Vpb7tJ+U2LcfSXWIkWNNNBRcEIiAyPKeBWDeRt/Bpdh0ZHPl9FHd9QIA9ZwFmYU84ObOJUQJTdF8hZdUocOdjbf/uoq7K3x4F+kRQbw51ge3BShpKDKm3MkuN0Z5P4Kb1IxeBZrWmczTZjOpRH7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761161; c=relaxed/simple;
	bh=CkunwXmj5Ji2ssJBtPURn/UB03j1DsOT7F/uPVZjSso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZzQB5jVvrCDnxtLj9dV6qQ4QcJg2ZgVPGcEmAh45WewjUx7v7QdmANFli6CFikp3jNK0iJAao/VdQFKWjW9bJX0HNia9rEQID7yT4qfxnv+Qd3Iy5hoAn8+aGpQ+6L34kKLwq7PjtQVahKTC/W0cUBvo7EmMriKcY+5HQIB3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwq/HOJC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CCDC2BCB3;
	Thu, 14 May 2026 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761161;
	bh=CkunwXmj5Ji2ssJBtPURn/UB03j1DsOT7F/uPVZjSso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iwq/HOJCkabT3VoWyhoVtNzwPxL3UTf+hDsXeRWWrjRi8ptl/Eyb6WYUnZ19iPFeJ
	 lN8WjM76quUPQzRBsjAZC2gb3PvKu7foveMF0wq3ZMzxpTIlb6tZTL5/g9F37rVe0k
	 D/MISE/YPBTWA0vhLaMu2qIgZqili3Lp8dXkJLXEc00Rr+7RiXrkB1rHLxMtzp2I8W
	 4sJJu30gIhO55SMRK5aWMUDmc7rMSaO+HO2cqOzU4cUyskXiRzSe2+UX5RYEbZFVoA
	 Unh0+fyKX9aqD08/W53DES8jpQ9SqtOsOidEutsu/qdgo3Wv5wGgB4Z2YNubp5dl0B
	 cbperbtpXlhPQ==
Date: Thu, 14 May 2026 14:19:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
Message-ID: <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1EE57541811
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107581-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:59:34PM +0800, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

I do not see you responded to previous comments and FIRST one was not
implemented, so I am ignoring the rest. Not going to review this.

Best regards,
Krzysztof


