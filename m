Return-Path: <linux-arm-msm+bounces-110463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHPQJekqHGpwKwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 14:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3C61616A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 14:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1490D301F5D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 12:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E181355F43;
	Sun, 31 May 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+k7/jRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52E335BA;
	Sun, 31 May 2026 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780230841; cv=none; b=fWKC72d4Ol7GczEIXLZRt+LV6rmkxlYQL9sbzFaSf7UudhhwMhIkDzDQu/xJDYPLtJsNieCayVUU+71BT/Xo5IgtUNIil14/KU/UkztOTz0zvaA4V7ScRDhjymuAkHKoOpk9VwfjH9Xsp5O+VvDCYg6m7F9KgRw/NbVYXoPUIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780230841; c=relaxed/simple;
	bh=o1/NV/2/xBrlmCzMxvTMtKUXL1B7POeYLmC9Djrm684=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWO9zjmHqoETgKlynzaFduxOLhmeOn9XqBwIUSUGk75FeT8p+B7GGnV+j3k1ONSEqQovhQcimryC/BbqsaKm6ifTc5nTBAAOyyf0AkS8tev0CJJcqdejkOEuGfPf5stTzNfTcnte5tNV9QiC9DWP0jr+VQNSkmyuX2kz30uT1WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+k7/jRM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED561F00893;
	Sun, 31 May 2026 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780230839;
	bh=7GG6KQd5aX+5r9GRl8R9AHSJCz+bGDBDGfIlmgsIxCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+k7/jRMZgv6UDD+8mDBRak0bpERKAEgdl0DnOT6cEGv68m2oZZPflMWDBBXg5KWi
	 EV1ZTasmRmvCR5K4wUnFwuxGI4UFBxTrB8VIkyoOxEMJhKm2Hdx3kXSUFWABLYa5dl
	 R857gEWCreSSrUZSWoA1vXoNxykP5uKrmDxRXa9g8PwZ4mJ+Tj3DcZE209YZaC3qLh
	 UrR+cW3Tzl+DZE0QoQX9HUKTlv6NiK5BwG8u3tKhIzVz417gaHdjgMCwI1Xr9/2d2T
	 hy8MHXRUpjMrtzXg+LOvnaiOuMuTXmfVYFy9DCc8Qrr7VwPMf2feHqgDE08pj2k21Z
	 olhv99IQCYZrQ==
Date: Sun, 31 May 2026 14:33:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org, alim.akhtar@samsung.com, 
	bvanassche@acm.org, andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Hawi UFS PHY compatible
Message-ID: <20260531-rigorous-gay-sturgeon-e8cfe2@quoll>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-2-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526090956.2340262-2-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110463-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2AC3C61616A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 02:39:54PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Document QMP UFS PHY compatible for Hawi SoC.

Lack of compatibility is a mistake or intentional?

Best regards,
Krzysztof


