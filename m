Return-Path: <linux-arm-msm+bounces-109145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEfnBARdD2oZJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B80555AB742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F982302DF94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A777A407CDE;
	Thu, 21 May 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA6Zp/yw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931613A544E;
	Thu, 21 May 2026 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391721; cv=none; b=urlAu9JAC2MYo9yWcNvBX4gKiBKVxz8lK5PLwrpGOqNoFBuJa4T4ukWa3/uc16tLUiBJgyp49zBH1e5o7AZoA9zUehS9FRp3dp13h2wPsSEJgoImi7G36lc+d4v57DorLqLwyyigAxYVtzfqdpBlGT6SVUzA1a0dltlWpFTaBqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391721; c=relaxed/simple;
	bh=QH8BsiIHUuRabkcSrGrQlKaPIqLSOZmWvmsSgOiHgrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJvolRbtGiLvUBNQXlY3S5xA88I/c0MpIk37HK+GtZXZ8TjLHifddCAQpOy1WHe+zJ5UW8gIS00BUF+esVLYTISJlvWtgllxqDhvDHQHwIdLJZ9RVmaMlmyjSGWJq9OdPgJaLuPqPEWcupBUpCUutKj+AFhL8LpYx24/WfAvgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA6Zp/yw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8391F00A3C;
	Thu, 21 May 2026 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391720;
	bh=WkrG6u4t2VKA/8RE1e9DkyZgSp+sVhYM1yYPaTV+yWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lA6Zp/ywYQ8AL5Oj3Fea0g/S/nAwmDRufb6Kdo0Y4CVQJnMXklgvd1voJMmuz6PPS
	 aXXC/MImXVUjleOq3iXp6jG8WXpK6pD7c0fAvetcTpj6jnXOSRtQWlpni7TVioXvTx
	 r/wt0oYqJU7Rap51lRPoOMCndjYS2XrSgEYM8WU1bsgd86K954EHUpMA17+NaFUEwv
	 zyi+09ItHvZ9q63GMzH5+utQgvui6jrcvbf8eaR7w8KlTlDF2M9ckIcIrgLZ8TJnSo
	 uvZsHVjQY51/x+LyT8VZTfuxFeujpBqkODniDM28+Ee3L88K6WptNDKflM6X7ZTYpn
	 gQpKWRTVPgw1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add SoC ID for Nord SA8797P
Date: Thu, 21 May 2026 14:28:28 -0500
Message-ID: <177939170559.182385.13527301063143554437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109145-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B80555AB742
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 27 Apr 2026 08:35:29 +0800, Shawn Guo wrote:
> Nord is a SoC family from Qualcomm designed as the next generation of
> Lemans series. SA8797P is the automotive variant of Nord, where the
> platform resources such as clocks, regulators, interconnects, etc. are
> managed by firmware through SCMI.
> 
> This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
> driver.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
      commit: 0670a10b7c22bef36d9e1ca5a75b832db4508a1b
[2/2] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
      commit: b0bc160c311a0e7163c00a7e66116d28ce9771df

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

