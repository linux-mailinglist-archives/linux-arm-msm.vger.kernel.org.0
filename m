Return-Path: <linux-arm-msm+bounces-107186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD5oD0KOA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024D529399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012373086FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60633CD8A1;
	Tue, 12 May 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpqOWL/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20BD3CD8CD;
	Tue, 12 May 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617422; cv=none; b=Up9CeVad9V73Ks9UWxRvj0cxEXRhdGbIjBgaZMhW3mnBuyWVPuVcrYW5CiLDr3gar0gT2ZgTQTYgoNCaDrYMeUDw0tE6Wq/7KIlEdDlFl4uWP7y/u3MZ9/LiQnl+dtP14bpSH9NahlthsQjtdcJ+oSkL1J304WN0WxuIpl9NN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617422; c=relaxed/simple;
	bh=YAW97yDeiSiK4SmGtar9h3Fk3YupPspJbvGu/ciZq08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyhUguJQzI+q3Ueh/OEycknRL/wayTmhJJ8lfixArXTbZJjaw7HGpVZKqk/qiMxwa/g5w5sSC6SwMjq1eOcaBexKqOX4gALX/qNjUljaQk9Vu5VZXuZ/sugAvpw0qYxEdFGu07rUR4MpztWU0JZ1ut/oIoEVHdmxtn61FJS/+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpqOWL/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A45C2BCFA;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617422;
	bh=YAW97yDeiSiK4SmGtar9h3Fk3YupPspJbvGu/ciZq08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpqOWL/Tqd70OXuqh/A38NLSUgfk9sysFmsnXRmLXHL75x2cz5TyGYdjN1rIT8+IH
	 BVIf3a/2B2Ch+ARMs7Mvnro0RD5Mg4TCILDKk/s2bin5791V70iAytu3wWv316dzCM
	 G4mnCFVvANcgVNOUvG+LEWMbq3V/MPnWeArIre05IVI5jQPU4jlLbyQ4BAJyBiXPKI
	 FtyMLmDMwe60JU/rI9RSnwDAQFfFmDExfHgNUqOJkzmr5jo2gmxmsmCUaK5nqgXSuf
	 TrYcaPvNxOym1AiFhZW6SAB4HdPDieUZzOkUEJCE4BFwCQCueai4oqZTDxZbE/43+v
	 KQhaTeiq1HTow==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
Date: Tue, 12 May 2026 15:22:53 -0500
Message-ID: <177861739374.1242344.16417283499381566774.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
References: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0024D529399
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107186-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 02 May 2026 21:35:06 +0530, Komal Bajaj wrote:
> Document the Last Level Cache Controller on Shikra SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
      commit: f2e4a121f432a1608472c4f69ac8045f33830fc4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

