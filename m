Return-Path: <linux-arm-msm+bounces-94715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNfOLKcipGmMYAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:27:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117091CF52F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1FA2301651B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D16264A86;
	Sun,  1 Mar 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwFCYTKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC511D5CC9;
	Sun,  1 Mar 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772364452; cv=none; b=AVVXBpTSR6tn4rSbeh6KFouOI7TSM9+AS88fcdL7DQr29MhWWmS3cJYrHBHGwISlbiiQoHVe0Ssg4IphnxDlCsOt7/4p8TqmzMcMPwFlJ0HJJvCWY/ZYlvLm25OJkM1ktREyRMJ28MAVZij03L+nwlgVUPP7VH6xKVnv0G/Mb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772364452; c=relaxed/simple;
	bh=YjPVZ7Enj9qf0/xF78EBndOwhevaAmzCWZJ0gI5JAwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8fYQXjVylMmkLKaUVmlZzM18dWghVTdJbHB6ledg+u+WMOphQuR1ZQUwa2W9zjyC304AeZSMKMxvwDzWRnWqgSORl9/eCc94vWzj/2ebfFOlQ6LsNK7Bv9ISruZq6ljnG1IM6Dz9KZVxlJTUFkdOTSUmR0IekagNTPF4UZyntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwFCYTKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE25C116C6;
	Sun,  1 Mar 2026 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772364452;
	bh=YjPVZ7Enj9qf0/xF78EBndOwhevaAmzCWZJ0gI5JAwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwFCYTKxsrjOJ6H8TN3tIjFgKz3U8+Dj5V5ZIVEt2fwMRqUkuashTBsn584Tl4Dde
	 oKNdhoYLMtYHe/cjZxDjzyc56e+FvQfsZpRF/S0TwhcvylsZ4wj2dMhBjT74CbFUrC
	 5sDGTQCVeaOiOpGgR7XmWocesU9aTCdDKzbNGMPMqqG3sDhBhbZ+UUtyCOqS8Qz+Ln
	 SaGKVOAp/z84o48VXVeZkf8MZbh98c/7PMML9QXUci22mn38Vso3c1rOZnh+NfSjZh
	 ybwogYZyhEBUO/gCpM79amiavM+6hJOkAhpTsXiKtQtDHg0gusyJAig/k05FnHjrtE
	 To1bQ23md3/JA==
Date: Sun, 1 Mar 2026 12:27:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
Message-ID: <20260301-secret-exotic-nightingale-80f55c@quoll>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94715-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 117091CF52F
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:38:00PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm IPQ SoCs also have the IMEM(On-chip SRAM) region and used for
> the various debugging purposes like storing system restart reason and

This binding does not allow restart reason. pil-reloc-info was kind of
allowed, but now I think this might have been a mistake because that
bindings were posted incomplete.

> so on. As a preparatory work, first describe the IMEM region and

Nope, sorry. Bindings must be posted complete, see writing-bindings.

It makes no sense to squeeze here something knowingly incomplete and
then in two weeks remove it, because it is not correct. That's exactly
what happened with incomplete Kaanapali.

Post complete bindings.

Best regards,
Krzysztof


