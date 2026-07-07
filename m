Return-Path: <linux-arm-msm+bounces-117090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BnuIV1xTGqIkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A344717086
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ecpIew3l;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A2730612E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805B734A3A5;
	Tue,  7 Jul 2026 03:21:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362535A381;
	Tue,  7 Jul 2026 03:21:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394515; cv=none; b=dQST8EzUqgpRoOpPjt3ttGakrhiv6ET2RLvbKWwOOb7Wi6Uti8vIZMR+Hv6xYvPk72kMEk1e/JNvmAMP/ad5I7ceF+qvG+WWr1sFizdfv0LzCrPYxx4E2SbXhmpUE441xdNfAS7uZ2c9u5EKTWBhLGOH/9kPINnDj3FVQ/t6CqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394515; c=relaxed/simple;
	bh=iiS/2f2/UhwVpt/ELxkZaoXdgri6I0uPNMU0M6IuSh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvYuRUA2F8MgPINdNoa18ZQiVjcP89rEGCv0umUssP8ToIHE6Xg9OoBFsTTvboIja4YbkZl1rEc+n7VL44ACEM1rModAaGeRSWCitM9FWRw3U4SHEG+g21bQWsbUuWcK8nHK2/oHe6jBz3+w7U5KY13QOx7z9EPSAdIPgJLwJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecpIew3l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3260C1F00ACA;
	Tue,  7 Jul 2026 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394510;
	bh=1dIVPtImX7jLIE24GWrUX4aZFUn/4c4mr+A3Hzlpmfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ecpIew3lZggl1SSmL93IvWvDOeqKImC30c+Qeamw1AaauxvTVs2Kp6YWOVJmQZwvp
	 A3B5eLAbWgRlakZsqRtYqDIydIyke8/zMZm5yFCPE8z27FBZ59mPFAlji7GNjXePtB
	 sH4L/+D34GAPoyFeZWpxcmawx1lh1VMlSTSKYmo82hRVwYVOrbSWlfMHknZ/j4aamz
	 e6VSzAjMzPcwBrAvTJc3j7Js7B83w7wh+mQHMU5vZrfVZv5JEV036sSln3xOqHvGML
	 URR5sfdAvyVKnUsCmzeb6X25JTbG9GljU/WkVYdkc2dHaXGt7Kl698k8pOO7EDQTYb
	 NxgAAmjC3blIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
Date: Mon,  6 Jul 2026 22:21:25 -0500
Message-ID: <178339449913.1938770.2225743388496970441.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-glymur-mahua-common-nodes-v3-1-98cc00943359@oss.qualcomm.com>
References: <20260629-glymur-mahua-common-nodes-v3-1-98cc00943359@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gopikrishna.garmidi@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-117090-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A344717086


On Mon, 29 Jun 2026 03:22:57 -0700, Gopikrishna Garmidi wrote:
> Mahua CRD is pin-to-pin compatible with Glymur CRD, as verified
> against schematics; only the external peripherals connected differ.
> Move the common board nodes from glymur-crd.dts to glymur-crd.dtsi
> to enable reuse by Mahua CRD.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
      commit: 711e6f11640f800f649d416b260c7f8555b0c955

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

