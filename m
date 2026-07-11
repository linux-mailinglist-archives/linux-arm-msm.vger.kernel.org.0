Return-Path: <linux-arm-msm+bounces-118469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dg7rFj1yUmqRPwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B70FC742347
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YEQVHrVd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118469-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118469-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E3A3034558
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1397C3CBE8F;
	Sat, 11 Jul 2026 16:40:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3A03CAA54;
	Sat, 11 Jul 2026 16:40:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788051; cv=none; b=EdA1BuUprt0f4UySdcViU/t8L0OguuY2NtIXf139rzxKJYTx+LZlJXs52lj3pjydTbXfNO/WgvCia1PuSfEUgqnV7GoNICDLdwWOX3CXhiwFeBn7v0FL28OLNWHCMWKtO8NlsGOPWwCb8An2pqcz5TACnRnd4pD96O6URL85+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788051; c=relaxed/simple;
	bh=AJTBzz1seoXPE7X19l9bOj98BnrfotS6pXLG/JYE4JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dz5y9KY+oP+h3ni4kft1KtAsHwh3Mq8xdMPVSW4IxvQ7zh1VH2WxzChs/pz845r9JzgkWCQZ8a+BBLfCOB2B0pHkSl0TpHRfyW9IrXCmDknH5T1ny4gys1heUNW87qlVUEG/XOaBIioWzpLIqANN6b8vH2vGjNTDOD5bVbIUWXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEQVHrVd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A8D1F00A3E;
	Sat, 11 Jul 2026 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788049;
	bh=yVw5mffjnIlZHE4iDxRvoUQvwFWcH1yBdkxrebziRVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YEQVHrVd11nlZpECX6vCnMb7RudmJv30BvInh6+88kn0iVanvmX5eHBHVXWExGHoc
	 6OEHfiAslurz6q7OQIRX/Agn0GAXZtneoDjbm95l8O9bQOkGCq0PnQqkL5mwUds3II
	 oCmzXUZ0SPAeGJ2Gc5t/Evsz1k06vPAHqLMs/Gkej2BQ/tVGsiAVe6eefmjTBXOZZG
	 CVhm8RiF8RoYBL6sIXJjvEv0DvQUCU7I9enCYgOjopEPSWy8K6gB192XYtakMZ/oBg
	 SQZJWzs87JOY4IENCErr6Wx93MlGzqkVWRagMD5Md8WAq1RtXks3mT45Teghh8WZ5p
	 MaInSlzd9T1OQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] Add camera clock controller support on Glymur platform
Date: Sat, 11 Jul 2026 11:40:36 -0500
Message-ID: <178378800448.138068.15504604554748644272.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118469-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:taniya.das@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B70FC742347


On Wed, 24 Jun 2026 20:20:28 +0530, Jagadeesh Kona wrote:
> Add support for camera clock controller on Glymur platform
> for camera clients to be able to request for camcc clocks.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: glymur: Add camera clock controller support
      commit: 7df7325ffc4b959cabedb2e41827c1b9a39c8dab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

