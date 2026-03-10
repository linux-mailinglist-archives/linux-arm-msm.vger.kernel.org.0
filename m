Return-Path: <linux-arm-msm+bounces-96445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMCvDmWGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC741244611
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CEC1303675F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A963B5303;
	Tue, 10 Mar 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJVcc6G3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9E3ACA46;
	Tue, 10 Mar 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110830; cv=none; b=kLxjObvhLfebQCM8CAwk8YQSb4DzCOocsIGJFSS8lnXWn1Ux93d9/62wE3nGFoCVOKP+tVWsczDEi0VAD8iH/XoB/EuhlGn0rAlTl9mJn58QXnss0FbrqEn/kNYD9fieEYS6EVsndzFHkfPUjl8LFHy55yIZ7U7wDU1S1l9SGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110830; c=relaxed/simple;
	bh=MDe57vZC5hxNWu/K2trHIqxaZCHFDcgWM/cNO9eYLpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6h4kDSuICjqUi/hmW6dYka8DoPEgSLuZJBshVkPFHn+Bt51MiH++50xZ4g0paYRFpCDzjZItAVvVhjMcAgiHk8nSbtu0OjW1OiZez2TDVgvRCIaelnCwTsMcJOo1to4CRDfkU5/G5JdbrvUdw/o1GkTrJyARmYKyMDN4IgWWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJVcc6G3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA934C4CEF7;
	Tue, 10 Mar 2026 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110830;
	bh=MDe57vZC5hxNWu/K2trHIqxaZCHFDcgWM/cNO9eYLpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJVcc6G3IQaiiFm4CJ0c/iBbLMBn3d1nUaZCKCR6XOx0o2xbZbxb+DXLWOgud+nbA
	 W2sCiIYfqrOr7IA4S+jhYvIJ6Z+BgzZp0UzMlTDlistfboOXt9s6m1/28rGO6Fc4LK
	 jwctesJ+9bI+XrfwIJEmdDuDHzNTjSqXZOkXDbXziFi51ZfqwXOmg9uCtFt3GEpTro
	 Jzr2AZjqt/Xbluh2de5+upvBbYQy5ywWhDvozdg1qWSSv/1+AV5l8lsQ35xwkSabzB
	 QnGIfwcQdaOkujfl9EFjgTrNwrzypE7otuDXFAjtY11iGiDPD82s+aDl8W1hXSHAQO
	 Rh6GCDdSgq9gQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Flatten usb controller nodes on Talos
Date: Mon,  9 Mar 2026 21:45:34 -0500
Message-ID: <177311073301.23763.12804449944559025415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC741244611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96445-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 11:57:18 +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach. While at it, add the wakeup-source property
> to usb controller nodes.
> 
> Changes in v2:
> Reversed order of patches as per comment from Dmitry
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: talos: Flatten usb controller nodes
      commit: c1e77b13457d20f14c70e623f7c0a6a3cefc1d67
[2/2] arm64: dts: qcom: talos: Mark usb controllers are wakeup capable devices
      commit: d304777ee4988b4faac62a7fb731f79f64c17a8d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

