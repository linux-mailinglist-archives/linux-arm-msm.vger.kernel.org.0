Return-Path: <linux-arm-msm+bounces-107462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AvoGvfMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB14539AC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 334B43046328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D4C3B52EB;
	Wed, 13 May 2026 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcqrNxGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCF3B47FF;
	Wed, 13 May 2026 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699381; cv=none; b=pVkZKBqRwX+iatf06JGqXGJrYqX5f2rH4vjO4aEPUEi9SzU+aRntApb83zt0GUaNo6rRx9YgIv8K2rFUvCDnnL6MK+KUa63BEUIZTJm3ufcMNBRoipY50kEVAJ6dMKlGjTRwyPH+y7J8+KgJ5H8vfOb1IDSSnDU/Ig0q2KoU9F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699381; c=relaxed/simple;
	bh=B52P1bZ2z5CzZy2FhrIEMSN226fOFh0i/6RmSCve6UY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsfBkBHgHOyqCjnAHDBnmB6WQs/TvDTq2VvJlvmnexq0qgKMn55L3R20DjnfHb9jIoGOJC9425v7BuxoisiXERF1hW/uv+ZNOWw9GtRdhYJgu5Gt/p9gi3MiLwH5EDHfWiMhQernhOBg+0m9Fq0i9z5MCqEXIrv5PynjuW272I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcqrNxGI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6F6C2BCC6;
	Wed, 13 May 2026 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699380;
	bh=B52P1bZ2z5CzZy2FhrIEMSN226fOFh0i/6RmSCve6UY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QcqrNxGIgfgw4gPtwXv1LoFSajy5PCddqYZV+GJYwF8TiH45P50KetJLQQ6zsjr0E
	 TVuBhKvfNkDAdg3+x6CfNxoSP30QlK4ABQMYLdbScShZQpLb1xhpLp3iEqSqdK0pnf
	 n8bL/FU9HVL1Jqr70WtTmzl7pWE9K/V/QSHzZPKXOfDr0uidhcvnK6fTnB9NP+s6SZ
	 UoMItOvwcTeTY0RrGIjdnmeCzh7YMyuxTTTxfT9aOBT9tMimU9axHpCFsZvc6uxsPP
	 LOhHnIsvnBm5gpyn7PLql4MTROB9LytxL8sCwzNR/bHBzkOe8AzSjU7Z5ABws9AUoM
	 YHSjZFfIUxohg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
Date: Wed, 13 May 2026 14:09:21 -0500
Message-ID: <177869936443.1496622.2068508194790536289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BB14539AC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107462-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 31 Mar 2026 18:56:46 +0200, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
> parent will cause incorrect DSI1 PHY PLL frequencies to be used making
> the DSI panel non-working, although there is no upstream user of DSI1.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
      commit: f4d7c5875a215cd3989b59d13a9c30cec9f0a33b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

