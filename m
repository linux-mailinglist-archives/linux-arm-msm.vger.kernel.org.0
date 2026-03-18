Return-Path: <linux-arm-msm+bounces-98515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D83L+O5umlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2B92BD61F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9C983110357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC4F3E0C46;
	Wed, 18 Mar 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7DHrWrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782B3E0252;
	Wed, 18 Mar 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844485; cv=none; b=JCXbKdhb5BlLd9CZvmnah4CDrRCR/o+yiPuTW33flXl/AEapz0Q+aZbDN2wXzvZWl6ZY9xOU8cY6MM2k1QtyYIuRNCkYVrhMxW5UQUyTofUtRrNbHuviiMa8V9+J3QqMlWtC1lOznesnP+gSgIN1gu28378FVGxGdbOR+SIn1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844485; c=relaxed/simple;
	bh=SZB2X0IwAmvPgyQaeo/kGk6U3K+jNovlE7TbT3jN4XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/YpahO4i7+yx5T22KBltYHg40bHkMC0AUfHlXwhU1bDyV0J9DPoohXMBDR9xbSuThnuJ7kkCbA1e3GelcfEck66bCYKMDioASgkMiDfRfp48TGUtBHMaaTdmcnaRYjzikhwAH6jxdhvH65S0oImPWBWQi9xrC/N2Qvzlg59EnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7DHrWrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A0AC19421;
	Wed, 18 Mar 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844485;
	bh=SZB2X0IwAmvPgyQaeo/kGk6U3K+jNovlE7TbT3jN4XQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7DHrWrJegnl9TnJzo0JYtmaj2ZznBUwZDEIc/6Q7yvJSfVCntZ92V+/7OLe+e0/h
	 2gAsuKttH51vfYBLufCINnJ+n2Ng6TbCBIv8u2tmr+gcXsgGDDwWnFpYRRBYwwa26B
	 l1qdWnQl3Sigv6dxoqJdy+iUTeuROHKr/lMsVKvNYRGH6JAAfaL7ZiO37VriJNNjbb
	 P7mjp7kbUbmJU104zxhVm6FThVpL1eit0xRWrvtrgQo5Obrxz7dZnQcKx+X6m0k8DM
	 9ySqr2Jb75LbSowzwEqiXSmNhk3LvLlek4qnPp7gE3ok2gb25neQTplz3aIW+8jjdq
	 saRjavngSFaiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Wed, 18 Mar 2026 09:34:33 -0500
Message-ID: <177384446638.22424.10766358716221088570.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
References: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A2B92BD61F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Feb 2026 23:14:59 -0800, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
      commit: 5b0d45272c542c499b20e0a275a4a02a5befb6c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

