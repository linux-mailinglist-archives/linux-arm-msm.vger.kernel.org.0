Return-Path: <linux-arm-msm+bounces-98493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL0gGdixumlGawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:08:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 042882BCA71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0DD32306DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11E13E5585;
	Wed, 18 Mar 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h++i6eyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926E3E5580;
	Wed, 18 Mar 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841872; cv=none; b=m1CJg3EKGH8rFGNHVAYrRZ5xXHlGglKBCCmUTXTYaYVgb5lCHOCbnBSHadyXdEbqPlVK+ZyjZCQfpXymUkk6MhwbE01drWTkAcH6Ngj3qaPXdeZwkS+W8pWdXW3kWkduJgAV0DKjBvmKDBIZKDGzXHsykraeZ8A5o/W4ouaB/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841872; c=relaxed/simple;
	bh=Makl28CzyddmJ2Fz83zmAFkDH1u7t/n2nLAkyMj3J9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTqiO9t4TL9NBm3f3UZZzBg+giZCPzympIxZPssg1116GxRmI4IiE/WsNu1jJbyjIoJeK6/reI2L4m6zd/ymgH/KAysnpmgu8NjAzbO9wHlpBanJ6vusZ0/b8huTeZ69qOsG9uXeU7vmQS2RTOGbaOwCdsS+SsYabWiAXNaXqRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h++i6eyj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4467C19421;
	Wed, 18 Mar 2026 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841872;
	bh=Makl28CzyddmJ2Fz83zmAFkDH1u7t/n2nLAkyMj3J9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h++i6eyjifZF6rFKpmhnnNVDiep3EVeGpd+f7fFhXHSG/c1t4ARsCjku5VS9Y9u1e
	 47Jxw4BmZVXhIHpbo49VYvPOySUpNJNaAGDakWmi6zKLFQ2sBWTzVv7MtU+xDt8o+3
	 CK+FCui9XhBq5kiJJ1aSAKmkApUqk2rMVr2iGd/J5dGFmCFK2JrH63eQ6393POVX9L
	 FVaGmwiR3SU+H0wvQlaIFzj7EpFTpM+XHxQ1zD5MzOcoxiYhg7cj6tjYYkMqC1loar
	 qP8esKLy0YfBIayJR2Ai9oH3OCgyEFcLa8poz5nRa3ZrpK1C4mFVGL4JqVABMp00pY
	 yB30PCO8zO3lQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: sumit.garg@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 0/4] Enable IPQ9574 RDP433 eMMC variant
Date: Wed, 18 Mar 2026 08:50:24 -0500
Message-ID: <177384182886.14526.5113474742446132626.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98493-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 042882BCA71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 05 Feb 2026 14:29:32 +0530, Varadarajan Narayanan wrote:
> RDP433 can have NAND or eMMC based on a board level rework. Since the
> same GPIOS are used for both the interfaces, only one of them can be
> used. Add a new DTS file to disable NAND and enable eMMC.
> 
> v5: Cleanup the enable/disable of NAND/eMMC between the common and
>     board specific DT files.
>     Add regulator info
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: ipq9574: Add details for eMMC
      commit: 53f5d2d61a1c824e2b5117637248afe986abf2f2
[2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
      commit: fc1fd9d52a88f1efabe9c2e34fa78245cfc6380b
[3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c2 and AL02-c7 eMMC variant
      commit: 26c980a7d322439076e59205d9eb9f94d300418a
[4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
      commit: f69b0d8d51ec020990ff9fd9b476f4be2a711a71

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

