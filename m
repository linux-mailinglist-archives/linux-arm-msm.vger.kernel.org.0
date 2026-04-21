Return-Path: <linux-arm-msm+bounces-103979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGBdI42y52no/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 19:23:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9143DE38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 19:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF798302BA64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1A92FD66D;
	Tue, 21 Apr 2026 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUbVsx0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2582FB0A3;
	Tue, 21 Apr 2026 17:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792157; cv=none; b=mvv3fHve7YQpN+vX5VL7TVyfhM9MAht7W3+4j6F7XjFabQ67842GaW4QaS34oaQsYdhvAIiM1UMiCZOCvkate5VPiDN9uzbY6H5QYjSLvhIwdmDd5IOiGgBT+4sMQPFp+OYIjzgeupz9uAfjsJY9gUjAOR2MZUkfqPMzPsVBT3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792157; c=relaxed/simple;
	bh=3Vs6A64Z/cDlXVKcYXu50l5AsAhPt9hHRpJl6Q5QeDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwFmiBkwE58GyJAuWHjvnkHGuLrlh+WhbNYq3+l+nSETl/fWbjP1LI/6C4DyTIa6256oxx1M16oReudFspL8j6p2ouSzjo75nHh1BSO7woyukfmduRGG28eO5In3VyHHUOen9EbLxP4F+mqS4OFV0PU+tfocxmhO3WUmWkR6TsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUbVsx0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1E5C2BCB0;
	Tue, 21 Apr 2026 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792157;
	bh=3Vs6A64Z/cDlXVKcYXu50l5AsAhPt9hHRpJl6Q5QeDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUbVsx0JZYXdZIPnb4GcWVt5grZUZ90U/44RRRqtVC6RKcwfR5ET+ZRLDrSeStWCe
	 YaT9WmEjq0sbNhZGXyBPaFmApEtpdloJOmfbiwi3PuJ0zktT1oGQgE0HalyIV285Hm
	 46mjd0YYuNXuKLFHtuu333vEk2uqsrOqUaW7UNSX8ou9wgV0iv+dC3i+01ivQF4EI7
	 UjUJRQrnPTIO61LDHFnHzAcDRRE1j+ZErt6Xh+PYoqxbRTGqrnXsO+GFz+6/ZdDZ3z
	 wbhPy/ZkMqeeLQaOfRgD/UgYxZBzBoyh3N7Gt1q0Mqotxi7ZeFyId21lkIcorqpUxE
	 XXVDYhGI3gSFg==
Date: Tue, 21 Apr 2026 12:22:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: qcom,rpmhpd: Fix whitespace in
 RPMHPD defines
Message-ID: <177679215038.1337457.8627312083472225787.robh@kernel.org>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414035909.652992-2-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103979-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6D9143DE38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 14 Apr 2026 11:59:07 +0800, Shawn Guo wrote:
> Some RPMHPD_* defines in the Generic RPMH Power Domain Indexes section
> were using spaces instead of tabs for alignment. Fix them to be
> consistent with the rest of the file.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  include/dt-bindings/power/qcom,rpmhpd.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


