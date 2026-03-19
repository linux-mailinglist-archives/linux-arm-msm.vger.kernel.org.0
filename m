Return-Path: <linux-arm-msm+bounces-98608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIwsGbxzu2kdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:55:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A32C5BED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC4BF301707F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4685132863D;
	Thu, 19 Mar 2026 03:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr4h4uGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007C13B293;
	Thu, 19 Mar 2026 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892534; cv=none; b=Wby6h35ijNDOjufV1/Nvafx6xRYO0rqTLu8dchv1gecmORuUGqZDZnlgHt6MO0mLUQ1GPa0PRm3RRGDjAs306f0NtatjmxzN4A5MhELHj0FeXd7deJbCFbhWWWZBMN5rgI8mCndQ59rqgWLS+PoKSu9hCXoRclZMdCOtnV+8x7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892534; c=relaxed/simple;
	bh=aYVIRntfK6i+k67CFFrpk34Ovp8peftZCkHYeOOi51c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVUMts+GCn5iKwq5nCWojnobst/1TO5MVLOsAfGg2iXsBGaN37BhpBtNxkR6O+kXjtZNBQDgAXVXvo5/Ry91If5rEjIcRwYXKj9NlYgr2Sn6RqtXx3sxLV36h8D6jV3g3Z9ilcpcpSjLsKIKLluquS7OZuA0Gu7HqSGUNOTckWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr4h4uGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC0DC19425;
	Thu, 19 Mar 2026 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773892533;
	bh=aYVIRntfK6i+k67CFFrpk34Ovp8peftZCkHYeOOi51c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cr4h4uGg50dNoH9I0uwRQWAfSyj/MDejNyjJTP5m+U60RLIaSg1iA6MiWb0Y1aFDT
	 zoLzdLogp0MbOM6WEmNHmPbdSo//xpU2aamXcTpSMyu2TkkIUOnr7gTa2ry0fYpICJ
	 YBMcPJqecOHVv6pTSor6MBhbdh2w1j+WFkPMwNlvCAMimUZadi0MXc7XGDIXfw0idE
	 PyMdM2fNn5XpWt/6EN8JpKJSFk1WPYMPTrYqa+XtS7Ln/DhI/u5FJnQqiCccY+ujGZ
	 pTQWxeD5AB5YTLP7CFabhM8BDKG6t5XzYrEUP1WLu4223XMvtwm5WdjUUI0Vbkc9He
	 TFIiCcnxS0JOg==
Date: Wed, 18 Mar 2026 22:55:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <abtzM6iAXmkene8W@baldur>
References: <20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98608-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D66A32C5BED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:53:22PM +0200, Abel Vesa wrote:
[..]
> base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
> change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
> prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
> prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
> prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
> prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
> prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e
> 

"4 out of 5 hunks FAILED"

Can you please clean up the dependencies so that I can merge this?

Regards,
Bjorn

