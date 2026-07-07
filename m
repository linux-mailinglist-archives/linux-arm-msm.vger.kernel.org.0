Return-Path: <linux-arm-msm+bounces-117089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eFNdAzRxTGpykgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B6717062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:23:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YKtp0CLS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 269D0305540D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C4A1B3925;
	Tue,  7 Jul 2026 03:21:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F437C912;
	Tue,  7 Jul 2026 03:21:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394510; cv=none; b=D5KFUs/XW+RZD89rsfreJgRF10ybAtKhiWYhZOX0Y0fRzwP5atqoxDbQVuyTb6orvNv0Sif5PUuimuvPCqEya1cXBGWJ2PC1HvQit9WbO46cyMgmUyVFZNWxEmkb+n9Tk+Qk3J4LBawgYS3p6vF880B07R1LB6MZABahEi56Lp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394510; c=relaxed/simple;
	bh=JwK+h7RZ8B5SwQBusL+NUmmmqFar7YzhHhM3CniUMQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpyhUHVQ8ACOywmoRLoaqu+e2Z/uqe2zSBi0wRJ+AOwY2feBDf/krXYPGd3JafYYmGyDHe74BVnG4zvP/aFkT9h4QIAFCd9mlyPX5SKWFCbnNiLwDS7TZw97OPPw07D5ifdvw0N3/zz2ZU4JJrjuwA79ViQdALZkq7bgjMsCffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKtp0CLS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2A41F000E9;
	Tue,  7 Jul 2026 03:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394509;
	bh=bgA1gKP6ZYIPuLheJvK9+zwKoC7LWez1LN3bdTKdjfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YKtp0CLSf7pFS33AnLbRJC21dvvwvCBCbuKYLfJxz9bFkmXqVA1VJ2Ec7bqPvG6gN
	 lcKOMjU8BZlNEnxMhIrOsoYtJnrS20lP6fMb3GzzcL7tAbeYJZ88eXUQVLPdlU6x7q
	 c/+4Ca+QKo1yx2+Z6KpGT5sNukeNpbQOepw+5MLjCkLaIODdVeasXOuzXvjCw2T/LD
	 n36WpSF3541IENfMDMW8AdbUm5el8NRvbVptdKEt+LhKdyvzUhe9RudXiMRtAC4CvU
	 +HZ1H7VgMZI/qLvUnLb/h6veuB3Qp6k2rvpfDR1Bzg2ACbtJHrCo6zCWTuGe6mrC0B
	 fCzD+optF4Azw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
Date: Mon,  6 Jul 2026 22:21:24 -0500
Message-ID: <178339449922.1938770.5251861233824750421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
References: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:gopikrishna.garmidi@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-117089-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B5B6717062


On Mon, 18 May 2026 04:16:17 -0700, Gopikrishna Garmidi wrote:
> The spmi_bus2 node was named spmi@c48000, but its reg property
> specifies the base address as 0x0c448000. Fix the node name to
> spmi@c448000 to match the actual register base address.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
      commit: 82a766b68cd4d323b302a28082fbb7924f1146e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

