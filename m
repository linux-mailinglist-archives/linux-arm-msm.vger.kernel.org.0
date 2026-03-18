Return-Path: <linux-arm-msm+bounces-98495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHZ9H+ywumkVawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:04:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1802BC941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BF1630A0D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16CE3E5EE9;
	Wed, 18 Mar 2026 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhg8Eg78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3DC3DA7DF;
	Wed, 18 Mar 2026 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841874; cv=none; b=jxZLiyj74fEXrYGuE90elDZNW/8G68DiGgdeO/dofx9Xb+8jtiOUC1iXTRWWGvUAt6bgnpQ+D9PXv5XOHgEvYFA2ZCwZsQwNkkqpoWlabfzM9+7Js7YLdFMwOm30FMvLh/OAN2ML1pwxdGgO8vjX50TC9bkf2ThP86kR3W7uYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841874; c=relaxed/simple;
	bh=OgKSFpPvwa2xNE3g76mztkonfkaAmuQnBsMlyqQfix0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhZOGLnFLSN7ECl0+d1V18jMLa4JbLeFHMZEbxTZ/4JpUgUzygQYzjclcXpYpl11IWZoy2v3eiSmyHObqE2pWHZdop2xvT9jy+hk5gywWuweoqytsRCKI9Qm9diT4G7C0BS6X4mo3BYFUDM8oOF8Px8vt1Ky5dKTHMu7GjqrzWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhg8Eg78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C629C19421;
	Wed, 18 Mar 2026 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841874;
	bh=OgKSFpPvwa2xNE3g76mztkonfkaAmuQnBsMlyqQfix0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhg8Eg78ST0+k+Kb+tpB8BrCY9NUB2JZowXAepvtcvuYSbTLkou2f0lRJnpiFz2Br
	 hduZpVSHF68wwLGqA0q/IwCLEZzo5m91FpMzgEyPEA629A2VOnS8kdz+MmqWGKNFW3
	 M2QIPCGJKaVbNR+hh8u9zrFx4zbULTKLwNpSoKV33vifWRgguJW4mkL6Bf8Tk4mafY
	 qQbiQA8tCEYNsMcX0EB9EmHPpH+rjlXJ6rLj0puzaGsLj5aenvrikAI47IElrJyQn5
	 HVDo8SYbMADIRqxm9VQPPUa3mHQFiUscrlGr/YX5Yzh4/s95KXsMbeXbbz4zpCPbwc
	 65vpkg+MxL1BA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add ACD levels for GPU
Date: Wed, 18 Mar 2026 08:50:26 -0500
Message-ID: <177384182888.14526.129612350795050867.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207-sm8550-acd-v1-1-53d084c58c9a@gmail.com>
References: <20260207-sm8550-acd-v1-1-53d084c58c9a@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-98495-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE1802BC941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 07 Feb 2026 19:20:00 -0600, Aaron Kling wrote:
> Update GPU node to include acd level values.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Add ACD levels for GPU
      commit: 453f8a15232faa55e84ae00c2bf1fed37262856e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

