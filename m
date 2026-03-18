Return-Path: <linux-arm-msm+bounces-98491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AHSCWCwumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:02:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEEC2BC896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAB953089057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE823E4C95;
	Wed, 18 Mar 2026 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBGaMeAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A23E0C73;
	Wed, 18 Mar 2026 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841868; cv=none; b=mvsMTJvlGBgwr0du67ceCwtZBffVeFHyJwQH01OH0muJG5coAIwRbF4T7bPRRZcPHTEyEC8iiL13Q0U8XbsXY+XoAIJgkc9dtBg2D8RnA0xYQWXiCY1gaRJDvFdbY3LXjCdDOFI/abAiE3m+bVUZU3CjPt5EnmtwaDV7+NwQOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841868; c=relaxed/simple;
	bh=QQozIBUp7nMiFiqoAT50JB6EObuW+mVQdMEmzroSzxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLkLNoYNzMiwKyG3/qP7BdPmwPKAi+I+I3VZIBqWI5LJIrBZF9FEg0THm+4xo5zXniXoOA/ysHvw8qHZ2eJZiZibDNfGHb2qYeTyMy7Ixlw6mOC3E8envzjq03/YEkFtHabUaKMzqBFeV17qMyrwAaR+vbV1x3Nx8eLHKS+TcOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBGaMeAh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831F9C2BCB0;
	Wed, 18 Mar 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841868;
	bh=QQozIBUp7nMiFiqoAT50JB6EObuW+mVQdMEmzroSzxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QBGaMeAhK36V+u2qEkpboOp3cfVUYfj1pLsIZIf5A3Lq0VA2Q1aA8gkxfeYf4XK++
	 dCaOu1sq5RuYtA/81evNH0YiC7bCy6YDCBP2GRFraOC0XD1vN6vm3WQ6zDi9JsEBwn
	 ITQZjCDezg/gyBRFw5m1wC6IGWOTh0C+fMb9JqEOGqaI6K9+txIbLu8pvwh715H2BH
	 9+SnpiatqVJpXOYmDQrShjqlCQOaN60Dk8NuJn5NPfy5XR7k/i0vXpcL7ZeFjUZkJg
	 IHz7S77Ch/lNz/hpA2FRu+XGMmutqQovxyfmHEY/ZMiRnea2P5K1udTEp8Qe6gpEJp
	 9pFwuzDWDiWXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Roger Shimizu <rosh@debian.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
Date: Wed, 18 Mar 2026 08:50:22 -0500
Message-ID: <177384182889.14526.9965886897282651295.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
References: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98491-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EEEC2BC896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 07 Feb 2026 02:45:25 -0800, Roger Shimizu wrote:
> Thundercomm AI MiniPC G1 IoT is single board computer with
> AI capability based on Qualcomm QCS6490 platform.
> 
> This device tree is confirmed to work as below:
> - GPU
> - HDMI output port
> - PCIe M.2 port (for external Wi-Fi or 5G connectivity)
> - UART / serial console port
> - UFS
> - USB Type-C port, with Display Port
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Thundercomm AI Mini PC G1 IoT
      commit: bc7cc1c4a3916efb72bd0c8c10e31386fefa1029
[2/3] arm64: dts: qcom: kodiak: Add missing usb-role-switch property
      commit: 5230355252d02f50491b3dbc34ba9cdab68fb82b
[3/3] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
      commit: 1cde54c54b83b33b49b9fdf760a58a7e6689789c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

