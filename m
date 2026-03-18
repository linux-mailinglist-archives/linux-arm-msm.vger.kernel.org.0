Return-Path: <linux-arm-msm+bounces-98480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDJjM7yuumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 315692BC6BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC480304A86B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0933DD500;
	Wed, 18 Mar 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XT8f/tCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A323DCDB5;
	Wed, 18 Mar 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841851; cv=none; b=Kut6SeBrogJ4/HcVD7EYWOknHC/GtGqUPQsfugwViMU2XrY/kd1MDXml97HTeM6VY8whX7uC5eUnLv0pS0E3LigvQB/OzQ/XXSCH4aEcwBdxOR6QVSKHS2HV98ARKNif4PUx75O8m0kWO1k+fRfwmiXhX8/bl4+GdBmslLpakJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841851; c=relaxed/simple;
	bh=bYmJU8hDq5tEXGv0ab5w3ft+M6a12orrx2A0ypZlKn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYyn7Yhx1sd9yPoWg5wcHvcO6V0Xhxux5qpPTcnGAOoDvIB0nBGn7jyBTwxlG5WrnKVj+rjmncFoYHtWGhvNnBR7hwYT2nkhBf3TD2WWoG5uS58div9DiwctfDLlMyeGt7ijZsKmZSkmYTwtCUTuB5dqI/W1Rl3Y4a4cnWmxsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XT8f/tCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28225C19421;
	Wed, 18 Mar 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841851;
	bh=bYmJU8hDq5tEXGv0ab5w3ft+M6a12orrx2A0ypZlKn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XT8f/tCzMUyP4JtYmYdu0hfygNrNgjudPIsG0NhisfPFZ1ancWOu6ElMGKe7ZlCmj
	 dtytArnELu0QqzBtdT5vzUxsctKMUMT48E9FNwxahCLO716l/tXI+mVpjR7hALim/O
	 SI9CE9XVaNYigS3iyahWrHJsA50PLdR9GBWbBiV+hYlvdTXCsH/GpA7KCchux7+MJG
	 /FiY1F5IVLYK2wi4EFX9LPhoD+MbSPI4nPs+WCqOwFXXZk3NndforKMCmjzaMSWRV4
	 Vjgti7kSNWweoVojy8lByrjeInIxVuoi3L3BVbtKGue7aR+nshNCs7FgmxMevRcXBn
	 68/0gSiBNzhfA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support
Date: Wed, 18 Mar 2026 08:50:11 -0500
Message-ID: <177384182893.14526.15474276434838592182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
References: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98480-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 315692BC6BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 10 Feb 2026 10:40:37 +0800, Le Qi wrote:
> The hamoa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
> the sound card from exposing these playback paths. Add the missing links
> to enable audio output on both DP interfaces.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support
      commit: a210cb039b41a68595c517918640813430a1c8ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

