Return-Path: <linux-arm-msm+bounces-98577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNU+BdNju2lujQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:47:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7462C51D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B671A31243E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DAD3876B2;
	Thu, 19 Mar 2026 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJJm2nP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D2387591;
	Thu, 19 Mar 2026 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888417; cv=none; b=qEeWvngGbmBxwSQyFbJXqJsnjOprQGi4+I9oAxZ8xzDc792l653yNXlidNKUkyGIrsfSkMWC7SEe/Z1KTLy5MBdS58yxWfQWAn6bfVuv7E0N+3FdayNK8Gqrvc8g5bus2f8PJM70mXvUz66cVXvbi+p+Xx2uC0jMJO0T/FExVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888417; c=relaxed/simple;
	bh=B0gMn5d98XfdbryEYEKVROCW+vL/PzxIGV3624qtm9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6TUYCINZdRSi9p0VoFeycXCvWOOUoy+kq6mm8w8aCkaVMzC2pi67t0BxL+luYDyeWqh2jGWNBbvD2ZA5rxCYNISU8aTmj+K6TWN4gt1jPsll6FGCBrufMAJ1OulR3Uzhbnz98Mdj3Bc81fE69EX8u98C0GbplZUR4c5B5b89T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJJm2nP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C25C19421;
	Thu, 19 Mar 2026 02:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888417;
	bh=B0gMn5d98XfdbryEYEKVROCW+vL/PzxIGV3624qtm9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iJJm2nP2VUMzuN6GnAn049UVZSuazkjKj6HeM+tMFdq0ZeE6pnix9M+q4InECB4b7
	 h7Y7vy1CIze7DqpdiBuLCu61n+AD1P6soSBAoY9ZCDEcAzZk8J9BxT9T/5rJlt4tKz
	 HtHAXMSNgkczaTJXEMW+02X2vCYjqHkAimxtkezWlMEOx+dzUKoSmr+y1XVvPvPDDv
	 /vbyPKMeEwT0/+F21YAJMBxAY35Qa5S/Zndi053M3UG8vtGUY12v+MvUVLVT6n8o3d
	 ZXFlLTOM/8OpFUSdBzWqFWCxQDS5WQo3vB5AiePY+4mr/rnzQ9kRdPhVdQf+Azots+
	 jCqh18Z2kpzuQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: qcom: correct Iris corners for the MXC rail
Date: Wed, 18 Mar 2026 21:46:42 -0500
Message-ID: <177388840392.11529.1304202505056682929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9F7462C51D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 17:27:07 +0200, Dmitry Baryshkov wrote:
> The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
> match the PLL corners on the MXC rail. The slightly misleading
> documentation for the video clock controllers doesn't help with this
> subject. Correct the performance corners for the MXC rail following
> the PLL documentation.
> 
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: hamoa: correct Iris corners for the MXC rail
      commit: c8e354964507d97cef405b2633790f99bb6a5020
[2/6] arm64: dts: qcom: lemans: correct Iris corners for the MXC rail
      commit: a98ebb7e62a93a8d75de705e866d0398bb80afcf
[3/6] arm64: dts: qcom: monaco: correct Iris corners for the MXC rail
      commit: 509be41a761f018db2669ccec22fbdf7bca1ed03
[4/6] arm64: dts: qcom: sm8550: correct Iris corners for the MXC rail
      commit: e973ef6fa0f7ed10dd3efefdba1a41d011e463cb
[5/6] arm64: dts: qcom: sm8650: correct Iris corners for the MXC rail
      commit: c87d630e1b02cd0118373c4344be4895cf2def33
[6/6] arm64: dts: qcom: sm8750: correct Iris corners for the MXC rail
      commit: 3d51fdb6d08c867c1a067457a5c5766a6f6fe9b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

