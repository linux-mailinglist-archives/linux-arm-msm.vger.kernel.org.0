Return-Path: <linux-arm-msm+bounces-118525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZrnLDWyfUmqlRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96033742C4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VPtBEH6f;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DEB2306C9B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926B343892;
	Sat, 11 Jul 2026 19:50:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D0341650;
	Sat, 11 Jul 2026 19:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799414; cv=none; b=Smya8FHTUBwCm/Jb6/XOewjmhrgIby60K5o3KKcfCHX1JA3rwYVz2zBcd9z1ZgRuyjwBCwgy0aovA3vCETN0YBCzmoiaA09+GWQfL8JqxiFK3BP3mWjU9UA+EIKvsWDJCVZKis83OJGPrqIdVlokBHWx/eRFLV0yVQKy0AZDShI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799414; c=relaxed/simple;
	bh=LnmGk3K0XGyZVi6F13cwZR++4w9/+KgUOhCfgX3MN+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtsPWQA4h6YYtOpF5dN8k+j7CZLUFSgFiKMpSg0DCexDaD/wPZt2yQvK1/rfMduE8ZPdu4ZqFUlkxsGaaqX/+FHZbANNtCFgtBVwtC69x0Q4uUoYkSdEjKfag+r/HdWLUGw9CWt4kEyvipCEpNX2HxzHyWgr6HaZO26Th+ny1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPtBEH6f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D711F000E9;
	Sat, 11 Jul 2026 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799413;
	bh=zEDUAS4ZIf7hFydb0YvfRpL6FyJCsFw9LtFfoBfuEu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPtBEH6fmObO23HE/AO6TkG1Bj5fsErhOlRCvyH9CEBmoy2sIjOxygMGJQN+rEVkc
	 TzDUyxn/lOFfvuR8U35sB2r92hvjApdy91HedsaR0amAdajGHTkyY7wcHUCAeiWunL
	 wVaFRFC8H+SYZj+97U2RfzDskWgpxHSnJQ7bFufGuv39Ois9Eg+sr0wA8zom1bXAjZ
	 j87TAWwUR1HV84Y76G+Uf48Ih3NgZluyPR9yO82zhBfU9Pd6n/HdjXDImqCZ0/IcNL
	 eHW1Z4iaFKMB4TWWaoN4HtOGqsLQmFt62YDDdjbk7UO15aXzGz1Ubey9u+Bk+ch9PS
	 ElSFc+NWm3B3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints
Date: Sat, 11 Jul 2026 14:49:51 -0500
Message-ID: <178379938599.163099.14937825832505451907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com> <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:konradybcio@kernel.org,m:bod@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118525-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96033742C4C


On Mon, 06 Jul 2026 18:01:08 +0530, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints
      commit: 07801dd72ed290dc3f2030df90c8b4190e711020

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

