Return-Path: <linux-arm-msm+bounces-100847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKHbNLCgymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DB35E7CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9DD3037C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A35339183F;
	Mon, 30 Mar 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqQHWYMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E733914E4;
	Mon, 30 Mar 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886530; cv=none; b=HEJ4HhTDwf+lRpO4ker/6qAcRr3Cmk+vlNAZEPa2PCQCQSi4jLFfWGDEkI/e6tBr+rXwMNFycMhJcgWgh/d1pqsU9xod70RNWtuJXOgFNY5AWIFw2RW/7Xa3F3lk5OlM9zGXJbRyvL4tXEGSVw6Kw8DdE3KLU3C2CepJUN74kWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886530; c=relaxed/simple;
	bh=utfzMihMYmDhK3LwKI9GulPoj6iCWH7Y5EAkhalANqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+gpWUHE/JZ9ePmrZzdPbn8YMWQsyjMRPct2shYNByivyVjHTAXDVxZQJKZCHyZ1i/HUKdOmvLyuZ7LRDeNSRRyOyjWLBYXTtUlFbgl0XMMR/XIknOmo3RI2JyKrMo5pa5ZGed8OMacnpo3PiqgWfu5dv5SfcdhcJ+o5YBAjpoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqQHWYMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC6FC4CEF7;
	Mon, 30 Mar 2026 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886530;
	bh=utfzMihMYmDhK3LwKI9GulPoj6iCWH7Y5EAkhalANqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqQHWYMuA4OGyinNkHM23E7DpW1R0a+TVE8Doemk0hdGeK0D/ZU5ezCxrzRkMTz2C
	 wjBJkfzxMOkmKPSXN6vi+dfZTt0p0PjywOm2hVVcK5H9NqykzBiBDVT3XH4j90JUsX
	 mWEMcm+ZNj+k8V4nODkis8ivHXoS05m4koEbjnrm0IdJnlBiHR5LLxHHN9xWdl0uP8
	 SxtupQmeTLTWUW6Yxdy3kHzGqa41CH3CS0SsE+Bvzao/UlWdKjcscqkS+R9wUbNOnL
	 T2/slx/GMydRNnm6Kdxlf0TxSiAC0Ge9MkWAUYPVrD8EtR1h8AMhEW9n0LzUIjWJ8m
	 I1xpGTR3MhIow==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
Date: Mon, 30 Mar 2026 11:01:28 -0500
Message-ID: <177488647771.633011.3376601666309332553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
References: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100847-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B19DB35E7CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 18:17:53 +0530, Pradeep P V K wrote:
> Enable UFS for purwa-iot-evk board.
> 
> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
> nodes for x1e80100 SoC
> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: purwa-iot-evk: Enable UFS
      commit: 7658e9b94849ca861ded82d641f52fcec303210d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

