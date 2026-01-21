Return-Path: <linux-arm-msm+bounces-89943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HSoHFI8cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:39:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 133804FE72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD668A2DA81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E1034CFB3;
	Wed, 21 Jan 2026 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8vm0aX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F934BA54;
	Wed, 21 Jan 2026 02:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962967; cv=none; b=kn6utmgat4EJf9Sj1GovU1sYLA6b04zVC0x3+fJvlHj2XSn7jh+gRbY9jcrIhEwQWo3870lD6zWbyDKSdZJ+QZVaBa5JuY9X6XlfJ64dY+6zYCBUBbDh1DCmbTBCk4pHWPtEEJ/45tFIU/NMgH+kGoO0wShJ+6hfjxSXSR8mFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962967; c=relaxed/simple;
	bh=FnqIU4qejZS4ruoOiEYIE3JKixs8pSw2Da+eUYvghBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbKt/YAwNOY2oXq0LbOWhU6/cp+wkf+v5gjOSUTJHiDheqzDdGFHfNmD5Bq5CO5ASThhsjGyacUQ/83KgX1XvKxseeN4RxLv3UoyCw+FX/GvaRpbi5I0nQ5Bx8gm0mae345Gm5yhvQ270vs9a4TyPJ0jyhQB/Y4DB+Gnc7zU4nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8vm0aX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5FBC19423;
	Wed, 21 Jan 2026 02:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962966;
	bh=FnqIU4qejZS4ruoOiEYIE3JKixs8pSw2Da+eUYvghBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8vm0aX8ToeraFrtjYB8aWWRctHYbd+4c+Nn4GqNEHRDEjQ62kMtPRNP3ozMUcL3l
	 lPIhRfgh+fr/3ubYwXAZv4LhVa3LDe6EO2YY1fZlwe2Ri2bzRGSQTfjI54mZnc7l4O
	 wdoO1Ga4NI55CA9b5vy+00WR77ApVOnep7PFvMxEgo5RIvSVmTjUTTHNWgrg/N+xi9
	 pKfcsghReCS2ZB2JOQgQsQCW/OtpbhEXPVW6xYRnWiqXhuc0MitTVoWKV9X7fgrtuV
	 /LDaEkdqv41WL/Op9OWk+4Qx0rMlZQboa4IeK2IjlKxWMGNO8+o2Mll9eWMO7/wQVB
	 F09NkPWJLkZsg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	Dmitry Baryshkov <lumag@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table
Date: Tue, 20 Jan 2026 20:35:55 -0600
Message-ID: <176896294110.1060469.5525109788160217073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-89943-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 133804FE72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 11 Nov 2025 22:33:50 +0530, Viken Dadhaniya wrote:
> QUP devices are currently marked with opp-shared in their OPP table,
> causing the kernel to treat them as part of a shared OPP domain. This
> leads to the qcom_geni_serial driver failing to probe with error
> -EBUSY (-16).
> 
> Remove the opp-shared property to ensure the OPP framework treats the
> QUP OPP table as device-specific, allowing the serial driver to probe
> successfully
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table
      commit: dda4bdd325326dd67ae4401f4f3d35b9cf781e3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

