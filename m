Return-Path: <linux-arm-msm+bounces-90078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHZcGSxBcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:12:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C35DDAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24024807BB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10CB3BFE41;
	Wed, 21 Jan 2026 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cX1GuQ6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878238A9AB;
	Wed, 21 Jan 2026 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025372; cv=none; b=qYet6nHq5FSrpA9rSpyLfMDj6URX1Bg9D/fMEoHqd7s8DtffqQxp1GDh2HmX7tp4KVEluVgm8lCNXld/DxCHUTTE6MsXONx6tb+rKONKwv9SdwarzEsvZ851+Mee6AGRIyBLzPEwH75QbrfD2IlXfabtODX44NSLTHrl3HwtYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025372; c=relaxed/simple;
	bh=KRuQ5pNsRsyb6ku5DqaFz+TODnZO/V4iVGcayYbM/Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvIi6pbJhWoBvg4y2x44JeSTo8rxF6W6QOofBVXXaJyDUtch70Bm2hr49Oo49m9415O+Lfn5pXcdqI5XxRFVny2vEzRrItHGTJm1CsRGRwPRNxiD1L5lugkrv+jGWnGezU8Mmks95z1Y98uD8ixU5lLbgKT5Fw55Ucnzt1nOzME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cX1GuQ6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F02FC16AAE;
	Wed, 21 Jan 2026 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025372;
	bh=KRuQ5pNsRsyb6ku5DqaFz+TODnZO/V4iVGcayYbM/Cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cX1GuQ6MePm+8zs+7Dfc/i09+ZZMItUNvuWzlz7sILdsGJOovHrsV0FS+IleKAmA4
	 q/Cz7iq5RrLNsmCOqesznG67j4j5xh45HiMAZlnyx19rucsbjbX8oV/Q7mWI0/x8L7
	 emdQHeJyyNTIt8o38/U3YUP8K/pmx2AZCL7HWkX9nUCmCjPKzL49P2ixUJbGGU9/xM
	 pvlBvwqTn7sSZprzE3baiXiWOOKvsNS0DdaCijhwwZFkjyp9rOsjetPjnGkbpP8gpy
	 7S2fRioZx1oR2k5fWscBtAFJuFzVytvvGdf4Aa/rQohzIJKkmZgUoC5nLFv7JT5yvu
	 VZ46WFvY04SAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Ekansh Gupta <quic_ekangupt@quicinc.com>
Subject: Re: [RFT PATCH v3 0/2] Adsp fastrpc support for sm8750
Date: Wed, 21 Jan 2026 13:56:02 -0600
Message-ID: <176902536623.1171053.13192258652095595279.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90078-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 080C35DDAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 09 Dec 2025 07:37:58 +0000, Alexey Klimov wrote:
> Please test these changes therefore RFT tag. The fastrpc testing
> application under linux doesn't work for me but I was told there
> is a setup available somewhere in Qualcomm where this can be tested
> (perhaps android?).
> 
> Changes from prev version:
> - split patches into two: one adds mem node, second one
>   adds fasrpc nodes.
> - updated commit description.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8750: add memory node for adsp fastrpc
      commit: 0bcf9ca23a873e5208a32a7e8b908a6002babc8f
[2/2] arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes
      commit: be9d54c35312479ed92c85aec3cd43153513210d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

