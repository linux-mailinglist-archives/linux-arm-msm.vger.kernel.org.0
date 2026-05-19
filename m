Return-Path: <linux-arm-msm+bounces-108463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH9FIppEDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:08:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE27557D339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D1963098710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6474ADD86;
	Tue, 19 May 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKPVXE0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D93F4DF1;
	Tue, 19 May 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187864; cv=none; b=Rx4Mkm0GUmDi1n3iT4somzTWfU3M0bCHJTl1fjGdBPGMGdKth3XaVYR61QC8BIX/qdNfz7XoyWXY3gbuEwTkb2YKsV7XRcNkkiHFisyXoDI8XbESl43ltu4ZxGjokkeuF1IefbU4tN8hY/SJ/PApZKbNc6MLMeEZMbkCO8NrDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187864; c=relaxed/simple;
	bh=XZelrUIsw6mRLO3EbBQPPgeGG9TmcGjbNjoZX/8V70k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGSCDhQszdKFyvHmEdDodwwZDcU4smY3neZu2tWeNZGLayP9I5UyZd/PLOfINbrL800itvAdbzJxog21fVVcIPzAUTg8vhqZyAqPms53UV31I6QYpuzjUEWPI0Na9XcTl6zZo2ye4+cm/S9ncAFRvOH8Vxh5jqMDY3rfGK8PrR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKPVXE0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D441C2BCB8;
	Tue, 19 May 2026 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187863;
	bh=XZelrUIsw6mRLO3EbBQPPgeGG9TmcGjbNjoZX/8V70k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKPVXE0k6tlVcr1HQrzv8iNSED0lQYgW0TF+25DbmgXpILQInwSk55c7PbzQhVxMt
	 gmltD6sn1yJ1RsNSYiISAyTfEqtryBHrSY5PfAOdhqMD5Qc+ECpMdu4+7DUCNHN61M
	 OMWUwsJzDDEYoj15sNemVP+7H0dQyvnUSnAwUlB04ihL88DuCpGYJfrpmI2Jza3JhZ
	 dRPZs2dsLvO3lQi2iWbFO0fK1OFVhuRyC/lIc6x4bnVaVW08mi8t+HA3BIaW/FI445
	 LbDW6YI0DWlm6rARdf6mE4jS3tHxORl7y6d8sQuLheUrgy+YS99JZx63FQ++ER69VS
	 +65qOg4VDGmxA==
Date: Tue, 19 May 2026 12:51:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 PMI8998
Message-ID: <20260519-spirited-vengeful-crane-dc32a0@quoll>
References: <cover.1779127507.git.taygoth@gmail.com>
 <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108463-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AE27557D339
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:22:46AM +0500, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
> inside its SMB2 charger block at offset 0x1100. The OTG control
> register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
> OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
> qcom_usb_vbus-regulator driver can drive it without code changes via
> compatible cascade.
> 
> Verified by inspecting the downstream qpnp-smb2 driver and reading
> live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
> mainline Linux.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>

Incomplete identity. Please use real names. We do not accept anonymous
contributions.

Best regards,
Krzysztof


