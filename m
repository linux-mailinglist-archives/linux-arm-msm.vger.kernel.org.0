Return-Path: <linux-arm-msm+bounces-107457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNknGVzMBGpJPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:09:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838A5399E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 604183021F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCA73B2FEA;
	Wed, 13 May 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAhDFCEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDDF3B2FC6;
	Wed, 13 May 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699333; cv=none; b=Ir2sV74/rz8tE/gkJNH7d/jxSjAW+Cdi2BW1+ambYfq+owgqxtl0z0ZRTdHHSpTeFOZEnILEfevxFNGgWvscowotF15M1A1WV4qr1/JZZUoJzMr9cY6U0U3lrDPCrKhN5wXKISDF8oMQDbuVJe6AU5tjJxkfVOH+LoAPt5BtNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699333; c=relaxed/simple;
	bh=CSx39vCVs5CjMe6jCYZKcbCWuCMGQ6sMI6xOsnzlEVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=In+wnemWkb2ZZJZ8tdeLcUCQF/9JMwpkiJUoYuisZLzZFbaZY7fcKhlHttVJDCTM3zIPfrGxStEFgCTFcaAJVyar0opPY09mnolK5GI+6wOa5fDH3TiBZS6eSoTX2SrBtxj613Gv4xREgMg7A4d9hBqOFWwTzaYnDy0uHMqL8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAhDFCEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA754C2BCC7;
	Wed, 13 May 2026 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699332;
	bh=CSx39vCVs5CjMe6jCYZKcbCWuCMGQ6sMI6xOsnzlEVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAhDFCEsnvqJPjMFO5zUtX4nl1/JU2t05+ng0RHIO6J31qrhx41bZWm9NR36GlOcA
	 2//iXsgvw4rg550ESk2zS6KMFdBtNklF3b5v849VlzPN2fR9E2aA8pL0qptj0mvuNv
	 2wl9zG1iKuuPC6WkA6frL5LfOu/9gI0q+foImnoCPgRBd63hK/ovhCX+GTtljb7SXV
	 RZ2f3iiCnZy7FabuEMUT2EnAgOnU47Ge1n1KOcbvJb2ZoOb9ADoAJtJHNBr6N7RJJT
	 sTouMJBs2KAQoZuWy6Q9lWg9YEIE/wbIM39nocyVCVynQBc9F7pIXG4aVxVrW8bSPO
	 e2bsSR5KrT68Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
Date: Wed, 13 May 2026 14:08:41 -0500
Message-ID: <177869930355.1496076.9673964503644608298.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
References: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4838A5399E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107457-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 01 Apr 2026 18:08:25 +0530, Mukesh Ojha wrote:
> Document SCM compatible for the Qualcomm Hawi SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
      commit: 35246d44bbea86fd7717c93faba4fcde9733a3be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

