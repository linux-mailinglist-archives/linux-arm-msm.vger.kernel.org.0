Return-Path: <linux-arm-msm+bounces-100849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CX0OuGgymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6835E81A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2BEA303E3FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8C7392C56;
	Mon, 30 Mar 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdJNQVuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBFB38F95A;
	Mon, 30 Mar 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886532; cv=none; b=PgsDzfzZeGsGqB77LQdzmQnrNQlDK9U1f1ksoNVQBnP49TJqzPWGJrR1yVbUUie9c1eXTwSnoofKaQ1Azwfn4K0NqdNDaWuP7gB6NE6CvZxGsdVPVNwD0YRwleyN4kJgO5AWqPi9pd6KdymzTVDW1yGYWR1TGMjiOLM/WKwEXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886532; c=relaxed/simple;
	bh=Rm0hm5DTYGPyx2RoTQjMeFnRUX6mw5hj+Ga97Mlqb3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhZxxcYs7ihnoq7vfCcwukcrHPoTV2++iJ6nilIiPEVlCrxojFXHchfRk+tKXW/8i7r+hRkDKQQ0ze6Q7ehqmdWcCYbn8pFtHb4Cu5MgTBqoPE4AjfUdozJTULgfSvj5CmoyeTOSj/EWWKau6Y7uDoGEE6rHTEiAHTFwa6tzrak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdJNQVuM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD01C2BCB1;
	Mon, 30 Mar 2026 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886532;
	bh=Rm0hm5DTYGPyx2RoTQjMeFnRUX6mw5hj+Ga97Mlqb3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdJNQVuMpn+EgzOfcHUy05Drp3GiOnNHr7eJwwLLOzGX8QIZ73zXl059Nqfz6y4XQ
	 o/LLAmdNbdELI3W/loLbBqxyUUwkUu0QQ1K8VI3Ojv6aIrfBaLyi1KUD9pWYBrem74
	 BVDtXVYjhM2Sz7xXaQ8nthQPFsMT9YWn4Me1tN3Jio+RjI+I2rOBxeSS2Oa9f0PSo0
	 n5Anhn5rxSDxhqxlR+YIb2khclG4qYQehOxMyoQaJCafGMj/qPFIojTHUkItE7hu9j
	 aHIb78kQJ8dZ/fQ9IUz9wws3asXTQHx4ktSu3z5lYmXNLTSmhjvllH17InGk4JN/85
	 YW5L1eUkTp7pg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Radu Rendec <rrendec@redhat.com>
Cc: Lei wang <quic_leiwan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] Add Qualcomm SA8650P SoC to socinfo
Date: Mon, 30 Mar 2026 11:01:30 -0500
Message-ID: <177488647773.633011.11756964457703997411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321152307.9131-1-rrendec@redhat.com>
References: <20260321152307.9131-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100849-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92F6835E81A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 21 Mar 2026 11:23:05 -0400, Radu Rendec wrote:
> Add SoC ID for SA8650P to socinfo.
> 
> Minor edits to commit messages for better clarity and to match previous
> submissions that add a SoC to socinfo.
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
      commit: a559a742c95c55ae3b347f2b57d26830c0cdd566
[2/2] soc: qcom: socinfo: Add SoC ID for SA8650P
      commit: f55fa3e3dcd8f766266fdf878994f0ec09459a7d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

