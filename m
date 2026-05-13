Return-Path: <linux-arm-msm+bounces-107504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHVpDE4HBWpRRgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 01:20:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6D53BEB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 01:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ACA1301903E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243253876AF;
	Wed, 13 May 2026 23:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb0tSt3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DA3655F1;
	Wed, 13 May 2026 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714442; cv=none; b=S77x2XaqZc+9ZAPVzWUg7zMQjhyS5yLh++1+zl+CWN5gy1Rs/SYr1fIuhs65wUmCJmylr0Xp++C1i5lJ07j+bQvrEd5hmN52gMEsUF+mz9zkSKdP9dE7g+LAJezuWtDzX3WVinHbcWYfid0x8lXwFI1GwIvAq2zKTuyVF08v0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714442; c=relaxed/simple;
	bh=rSvLrYMZaQ1/Qq/EZ3LS+CQkZYr/sql1EhvB64w9ByQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwBQMEj6zzB1DRDC6LSRhd6RIclALsvR8lFimjx/YzPAamxMGLA45vY1IcYjY9i1YlVU+NoqzKOA5bSKxxqzzE0HG3aqcCOEgmUAxstPFrIHE73zJ0EdfYPCV5jrSkgVuAkrOhQIxf088vZvBRUe2fgg7MK8WGa7fXSWEAEdKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb0tSt3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C66C19425;
	Wed, 13 May 2026 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714441;
	bh=rSvLrYMZaQ1/Qq/EZ3LS+CQkZYr/sql1EhvB64w9ByQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kb0tSt3OZ0FL4POeX6XhBWm9xURVc/Iliq6xsOn+lOy9wTLCN7ayrNuaB38v5rpMF
	 FsLO3kdRtxsa3A50hELs1rNcehuIzXqxtd3Q0CzD/moOvjKewqOYdhFDtIIihHOYny
	 lS/dcz5YZxwbfPGDAbAPSVMN/Xfglsj35znhc44yc8o44Mml3A8QvEvmz8SVQ/vaXe
	 1fQ87ipbr6zcZIQNxwLKm9eqNayOpfy2XJeJJTBGCbvEh/TWGf/CAUl88osSBVpX36
	 PRMQ42kb4gCAsnRDFjCCyu/nUMZc1uoNkVlEsNLBw1ldiCH4Jz1HWcCvJjlhIkEh8u
	 Oq7CGxz4IZEEg==
Date: Wed, 13 May 2026 18:20:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Message-ID: <177871443226.2291767.12227722553273027376.robh@kernel.org>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>
X-Rspamd-Queue-Id: C6B6D53BEB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com,gerhold.net,linaro.org];
	TAGGED_FROM(0.00)[bounces-107504-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action


On Fri, 08 May 2026 16:10:47 +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra RPM processor.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


