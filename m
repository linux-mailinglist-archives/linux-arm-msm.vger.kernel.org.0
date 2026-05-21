Return-Path: <linux-arm-msm+bounces-109020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL82AD7fDmoVCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 895425A35A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C02AC308C5AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A983A1A4D;
	Thu, 21 May 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DP1Gk7yA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926B3A1695;
	Thu, 21 May 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359245; cv=none; b=q12/BZDsQ559TzxuqKkQ711rx8slobZ98YnpcVZfBKzBNw+Qm6SwLTMA1/qo1orozkW+isRL5hdoSMTQaWsFdBLVuRuRMkzx6za683HqSLOu3f0tXZNTAk9wRlTDJADcGJwNL3qbipTdwLqkBRo4XQKzAR5N53sfA1pn9k+6qNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359245; c=relaxed/simple;
	bh=vpQGoE/t3q+i0Qnd+KlHa7R6iLo0EN/1ZhwDVPbxIWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRHB+o5bsycan96QJPO1kdBkK/gb+u7Hj/sOg6vzptQpaNYFitoTGyS1QUYZX4EWy/FCN36VyN6OLcge0+LpmV0beR4/dd9eSSTNO5Rz/nuctAjXMbMdmhjxDTVriRajy6ModBmpXXzIFOXjAQx0idq4vcp7anOAkA/OvhoBcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DP1Gk7yA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAC01F000E9;
	Thu, 21 May 2026 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779359243;
	bh=6UKm7IohSoMp4xhzCIyfqAWE32QeWV+gE1Gh8Ky41yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DP1Gk7yA0FOkO7mqztPhHiPxWZTQEqXUi7AhDduLReAf3KNxS2MXXttcCsjr6jJED
	 4nei0HydFZP6pQWs+KxLIUitexm+SI0Ke6EAnrp0bYPpSoGfrPuRN0ChqlURDp3OvM
	 v3UdK//H4d34hGb5gI2T/xt71C6nk3rDhVjfipYo/0UKZeKG0zGaimT3y0hyp9r83W
	 dJ0TgXUJlwIeNRLkFVtmJ6iAgYyKwZ5jSfdB+0BA2lkpV6NTXMcxO+jZnSvGT3lQDa
	 mM5V2MVhJwCz0h83LqCoS72DNjwoA0MTGpDXosmcO9C5XuY4j/8Md67n+NmRo4/ieC
	 KlJ28qlZVs1MA==
Date: Thu, 21 May 2026 12:27:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
Message-ID: <20260521-pig-of-undeniable-abundance-91f70c@quoll>
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
 <2b5a516d-f847-4cb6-9ea5-21f56448b00f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b5a516d-f847-4cb6-9ea5-21f56448b00f@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109020-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 895425A35A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:00:03AM +0200, Konrad Dybcio wrote:
> On 5/20/26 8:49 PM, Krzysztof Kozlowski wrote:
> > Revert commit c70f7dcd0921 ("interconnect: qcom: x1e80100: enable QoS
> > configuration") because it breaks the ABI without justification what was
> > broken and what was not working.  It claims the clocks are needed for
> > QoS, which might be correct, but QoS itself is not a mandatory thing for
> > the device to operate.
> 
> ???
> 
> Would a saner resolution not be to simply adjust the bindings change to
> mimic the other post-factum QoS clock additions, where `required:`
> wasn't altered?

Maybe saner but I am really annoyed with the fact that authors don't
care about dtbs_check rules and impact on users.

Anyway, commits were dropped, so this patchset can be ignored.

Best regards,
Krzysztof


