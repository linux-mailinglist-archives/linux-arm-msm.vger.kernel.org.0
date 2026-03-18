Return-Path: <linux-arm-msm+bounces-98471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLXMOeGuumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43612BC6E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5AEE304E300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2353D75CF;
	Wed, 18 Mar 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV5+LiwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA56EED8;
	Wed, 18 Mar 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841838; cv=none; b=qfGfqL6XxsCPtnp0VPgioUy7thaiBpO/KAYRqBTqKOIO+NZNK65ZfhLNJatYRBt16Qp0y1Z3K1ukv/2Xp17fjP2x2kKIjq83P+sS9Q+YhtFnH+Enrczxg91P0NoZgV0LecV/fgPgcwrKhfpvAxomxaL6loFNZMI0CcL5LxfQxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841838; c=relaxed/simple;
	bh=j/DzdRtl0SqAwbvFQGfw4TsHXb9vEKaG+BHDsp+58No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JH/UcY2pSij0dTCD/JmKHp8AfRTit0EWUfgCn3roqOeuMUjYOLFkwfavYHkRNm9+qsBVQgOhOx2RWjW0Q0c9MmnApXSYFLHRiP1oK644tzjhiXW4sCniFhIy+owcZMNl29ml2+InSDwmZyX7a4EDheZDYWctf2J6hH71Z1+T1Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV5+LiwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DC6C19421;
	Wed, 18 Mar 2026 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841837;
	bh=j/DzdRtl0SqAwbvFQGfw4TsHXb9vEKaG+BHDsp+58No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WV5+LiwE1Q8JAAITOlwZJ46rVqsOHfonXHy0CRBDG0jz71LfRuwdPopZvzgU7nYm/
	 uo4eSFDzD1aHDtPrcrfF8TQs+cH0lv3QDpDrdfeePlYjV0afY+kyQtjXNbT9wLxC5e
	 z+uhJtoSjHJCsF9phCJWN8hNmqT1UBf7d/TXpt4L7cRPL4cqvZlbf36wEuAHo80BY8
	 ghC5jRX56ZGCejnQ7lCsgQcEIMqSPk+GZ40JapTC5qTQgd6uZ014/J7DFUqZEdJ7u3
	 9sY1oiRiAGLtK1SZjTpB2Wf8UWDK+PrfREedw1pR6FbHVoUL8BdW36DBNJEMg5TdtX
	 PqW8ssYa+MsJg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port
Date: Wed, 18 Mar 2026 08:50:03 -0500
Message-ID: <177384182897.14526.5404552625206784706.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211-zenbook-a14-improvements-v1-1-d970af6e25a3@vinarskis.com>
References: <20260211-zenbook-a14-improvements-v1-1-d970af6e25a3@vinarskis.com>
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
	TAGGED_FROM(0.00)[bounces-98471-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B43612BC6E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Feb 2026 01:16:25 +0100, Aleksandrs Vinarskis wrote:
> Add HDMI port that utilizes qmpphy via Parade PS185HDM DP-HDMI
> bridge.
> 
> Based on commit 34d76723c410 ("arm64: dts: qcom: x1e80100-vivobook-s15:
> add HDMI port")
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port
      commit: 03c5c2cc53df34816974e6fac091549ab231bb75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

