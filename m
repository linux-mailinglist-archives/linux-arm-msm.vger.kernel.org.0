Return-Path: <linux-arm-msm+bounces-98496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD1YOCivumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:56:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7272BC73F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BC3530478B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31193E639E;
	Wed, 18 Mar 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+SoHBoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090B3E6391;
	Wed, 18 Mar 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841875; cv=none; b=SaUMMsCz9BR2XWsfYP989TZoS0qmx662MC+EJQBiaUKMma8Gd0o9UE5TZgywzds43oTD84+x6n+vH+Eytp1A0gh6xPT9qVgS2Xy1odbdp8rtBKOdZ6z+Kqw4249PUvw9KF6kLQKJiWQUpYgBF1ILGAXWfkPDSsAr4KSl8o6jv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841875; c=relaxed/simple;
	bh=B046GaZQY6/Rj+UiNavkcUmbHfe5L3UsB99jQ0VkEvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6DdE405HuWigCYd+pHr0w7YXjWmajdWaf0tmVmwKBgmS0IUud7v8DPDaLKQP0hXxi8fAVkRlIggy6UwFEKIuerjWxbo9aAgEsPYO5hM26S2LFWrJCcCpEhefYSIhJ5HXKcXNdYJ1fgumjdfhZDFzxguLoBc6B204/mqTCP3358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+SoHBoN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCE2C2BC87;
	Wed, 18 Mar 2026 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841875;
	bh=B046GaZQY6/Rj+UiNavkcUmbHfe5L3UsB99jQ0VkEvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+SoHBoNe75S/ujZOKMOIwIPxtZHjhr65xV8uJaSxkI/kLOQ/AhEgMARVtPUpa2Yb
	 JRpwIoWFq4/uSygoRbPSrLb+6n9YF65vR4KLP8uz7OQrQfJe05PiCIqkRhXgpzp2cE
	 LJXDPSVWaqBbErByk4e6mX/Zhujous6PLYbaVIk/hEUaqiCjAER6aphWfWYoEsB03P
	 GQqPL+ECehDCKWb18y4LVDcy/BabwoRwdiRLKpclyHxtFSab9xWakgI7F5VWsx9Iht
	 nv2DKeZoBE/PUOcMHg862Fv2pNiVbOSfzoM/SiF9uqe700E5eCtLk6IKP9r4NxiWQ0
	 tR8lElrbeQgew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xilin Wu <wuxilin123@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
Date: Wed, 18 Mar 2026 08:50:27 -0500
Message-ID: <177384182874.14526.11341123273307525693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98496-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A7272BC73F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 28 Jan 2026 13:11:28 -0600, Aaron Kling wrote:
> The original values provided by Qualcomm appear to be quite
> inaccurate. Specifically, some heavy gaming tasks could be
> improperly assigned to the A510 cores by the scheduler, resulting
> in a CPU bottleneck. This update to the EAS properties aims to
> enhance the user experience across various scenarios.
> 
> The power numbers were obtained using a Type-C power meter, which
> was directly connected to the battery connector on the AYN Odin 2
> motherboard, acting as a fake battery.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Update EAS properties
      commit: 00569c634222d58dbc145ce1667c889b0fad3cbc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

