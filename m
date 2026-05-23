Return-Path: <linux-arm-msm+bounces-109449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK6DAc0PEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B25BCA09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 875EB305DB61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6FC3672B2;
	Sat, 23 May 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1zGegbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74536404B;
	Sat, 23 May 2026 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502827; cv=none; b=PgNJOkgQAOFQDhPCeTDGAzMtMZik8hSP//+FB6U+MsoW5UyM5aD/Ab7mYsxO9sDiT5zigA2wlAh7w3Un8ZKjHzdzw2Z/QnMNl1e08mY2CftmrquOc7+ssz6mNQBY/fPH7lFtuMIIIU3qXUxs6GhAX3aN4aTY81l909YeOe16Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502827; c=relaxed/simple;
	bh=asEfx2kQvX779LXjBLeJUR+DkMkC4Q3mETC/unhCi9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6U+xIncTGywsHhejdhr9PlzslU2aacuFigtFQRTVuA3V3kGYnTArjyLskASZ5SysW64RJD475F1tIt/Q+STo/vuZ2koXDx8ky++WZR7mXG5Xy63Z+iRIV+WyoqRMoZoPRaJ7JzkgRKByIF+GMHmLdBsghcLe/ogZe8Ws7DxYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1zGegbN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165161F00ACF;
	Sat, 23 May 2026 02:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502825;
	bh=JqWbEwylK9zhBH1MLhTdFmLMSEquh6KTcixiWvkV3jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A1zGegbNs8uiNM66X4SlyC03jYa8xGpOcXRzKLCg3FLiKRPKIkD6jk6XVtPD3YkPS
	 VYzt7d7dqTSkC2Z9+ytYUDiaDHIMI1DQ6zAeIGtr/xuWAU/WxhYKN3socCJ3FjcaVd
	 irjAXM/84SUVlo1cPjNYeHgWjP+Qq2CetrPTGb7uXY2lUjvkkfczZOfNIiuoWC6sNL
	 gkk6muhSB9L2Qcqc3rDmVmviJdYaEdYhx2Dqupzb8RP7/kP4/He50RzetPasR7BgQW
	 Y0XXOFJcISGaKilJruGemiULcA2rhxkKic8NLM21q+3BS6JpS0tb3zaZ+9wKNibmO9
	 WJguyf1i/ovKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
Date: Fri, 22 May 2026 21:19:53 -0500
Message-ID: <177950280362.1097700.2629719480660523852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109449-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D52B25BCA09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 11 May 2026 16:26:41 +0530, Kathiravan Thirumoorthy wrote:
> Add the watchdog device node for IPQ5210 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5210: add watchdog node
      commit: 7a473107f9785700a5c57cee69f60c19a9703f95

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

