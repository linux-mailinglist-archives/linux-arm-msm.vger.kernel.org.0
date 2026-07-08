Return-Path: <linux-arm-msm+bounces-117694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qjFUFzxsTmq7MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB681727FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MqVFV8N0;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5B2313635F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AF53B8948;
	Wed,  8 Jul 2026 14:57:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5243AD50F;
	Wed,  8 Jul 2026 14:57:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522626; cv=none; b=htjGNlzEZB7tcDK+hXzGowbAe4R5+lGHzNyzj+59kl2uVLfIptr8PWic8fYjgokl5ZdA/UZD5i974sVbQCAW+CD0BBPEIIHGaxNjzo+2PmAQBlyBHVdaM4h0hxf59foLKf2C9Bx185cCc+k8eWX5SUYShmAf3iN1UYTr+USuwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522626; c=relaxed/simple;
	bh=UzRfL5nrhbV38SWlq8GKb9sAXDLqfaAxp80Irg4X90c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pdq86vX+NnVZPStcJU5yVgH6LTGmY7UBXP3dpL6IA0uwFDYLIIZH4f1Suh+904fq1FbCsZVIt1bkT8B9rxS0kdIwkvu4RlNL7h2hATN9huE7cxxSYShIRHweH84Ufc11ibdNJuRjGqrmeZcSd9+eVKmI4EWfzKu7SwmexfRZBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqVFV8N0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B157D1F000E9;
	Wed,  8 Jul 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522625;
	bh=qhL8DDYBvzEg1D2vKj2eStEXxlj4RbY++jB2YiUfGwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MqVFV8N0q0YF3mOV5uba0LIXTLEx5dDKoQy+ZGFrzzPzJt2I1tYwUuMh2N57Ajm0o
	 V79IXQNj5+aV1qbYX03SdzYFOUdY3K3u9jDYD0b6qXEr14zacO+V5GxIAeuCP1rzsM
	 yLu+kNjOLc8VdWlMogQwGyiLatngo9PQoYQw26iaANljxcXbG638eT8e3wETV7zUua
	 p9nC58aKRfd7+LonD/jfKaGIR2reWVDo3++9dvm9u59yrt+gkLljv8L2EK4sN0C8MN
	 Mc/Xrpd1eaJFPNQma7b7O+rVjivoual27GBNexk/86LxUMNAqB+er1PdTfgR4TD2bZ
	 Of6gVp5+GxjVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
Date: Wed,  8 Jul 2026 09:56:06 -0500
Message-ID: <178352261647.2235436.9683002784544233361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
References: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117694-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB681727FE9


On Tue, 30 Jun 2026 10:50:20 +0300, Abel Vesa wrote:
> Both the CQS SoM and the MTP have the following array of PMICs:
> PMK8550, PM7550, 2x PM8550VS, PMIV0102 and PMR735D.
> 
> Since on Eliza there is already support for SPMI multi-master,
> it is necessary to duplicate the devicetree description for each
> of these PMICs, due to the SPMI bus index and address.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
      commit: 89652f946ae31820b6d2b47df93b7d81ce98cb37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

