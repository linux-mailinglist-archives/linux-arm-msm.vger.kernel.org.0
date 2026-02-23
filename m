Return-Path: <linux-arm-msm+bounces-93800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPHWFTyynGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:02:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A317CA89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C569318D20B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0388376491;
	Mon, 23 Feb 2026 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLH/fnX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E8374750;
	Mon, 23 Feb 2026 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876593; cv=none; b=JNb4grqkmQ4ZFduusA5MkWitFF4d3/e0k0F5vbcGolYv7wZjxPllCzNAyfVDOxKkkzb1/kB5MBcHpidcBbx2YSxw6CAgK7YOoCzWOuAY2Sd2ciBZ65r7MJ7uvvF0JCCwe4Yn6H2MGAMeOiEkuOElChrtNWqmivrPDbY6sqYvJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876593; c=relaxed/simple;
	bh=smw4sfKIZqXfSUYhaFq1CfR34uX/MMba0wcTawN4DDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGIeTdfhJLGr+bvVgLqjjNars4QnuilDXDMUvU5LyXiBGnWC1ZEiS2Z1s/etadlJ6eRV6RaNKRFTtyk+OSDZQf70PJ81OcJyDepvwLhM1jmqddwZMuFDJ9Gh1h8CfJTRxeS09/nd8EpqQysxVkkIW9tjbvyZP9sXJ9EG23RKISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLH/fnX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAC1C19421;
	Mon, 23 Feb 2026 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876593;
	bh=smw4sfKIZqXfSUYhaFq1CfR34uX/MMba0wcTawN4DDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLH/fnX5wXd7ik0SjAMI/PXUSPaRmOgMUx492nzePH18tHkq+so1uRCpgfSi8l0jP
	 ApyWFmdof7XcR1KWQNa+0PjLR5XzlJMUzocgE3EclQt67Lrczo3UsRh1lAnQRqLG6C
	 UX/1PMmhiJYUPleGju70yusGUf1p33gXSMTocFwp8OgajT8sK9k+0AUw/LJehCloZ9
	 KDj2399z++8kkLeGNU+684reEYy9msDZbe3Dq6LZOFreTUnXx2sjLO/DKIP1ud0XlU
	 zhocrA9x/JhpwZOytm3XcikYf2g88cB+KmT5nzDN6h5jWoitoNv3WxpOf+pgjoolYZ
	 bzKNXNIIQH/LA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
Date: Mon, 23 Feb 2026 13:56:12 -0600
Message-ID: <177187657310.166046.8943175608843959164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com>
References: <20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93800-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA7A317CA89
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 14:32:20 +0530, Ravi Hothi wrote:
> The WCD9370 audio codec reset line on QCM6490 IDP should be active-low, but
> the device tree described it as active-high. As a result, the codec is
> kept in reset and fails to reset the SoundWire, leading to timeouts
> and ASoC card probe failure (-ETIMEDOUT).
> 
> Fix the reset GPIO polarity to GPIO_ACTIVE_LOW so the codec can properly
> initialize.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
      commit: b7df21c59739cceb7b866c6c5e8a6ba03875ab71

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

