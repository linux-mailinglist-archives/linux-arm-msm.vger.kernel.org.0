Return-Path: <linux-arm-msm+bounces-99491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ONZCe/vwWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:59:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23132300CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EF653024EE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490FC3815D0;
	Tue, 24 Mar 2026 01:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxnhvEYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241CE3806BA;
	Tue, 24 Mar 2026 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317391; cv=none; b=c73jzTQ468sF5/gUIaq3sCoMPJLYYnOGfPQ2jqqFbkSaz9RyJ7J74kBP5lnbNlhGppzRUiXka9TcvEf23hHwaFN2diEkYAI/bc0tQ7G5K1NO6J9JWemA3Oj5Lp2/qv1YV9ARL007CzQ10PTeWux198YuMioUBQAa9UIeUTFoQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317391; c=relaxed/simple;
	bh=PmVVhk/+NOta3DVqJbMAdD/e+AV9cq3HtKGafBuDGag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXRIr3OTeGsRnTuZUFid2i9sn9dl3JedpAQ+rCbGLFzTTAa14FQG9vjHP7WUVXdg41MeqYPp1PpiHZWR97bPaoYTKWgY1Wiz1DEALkfOKcQa9KyQ7NDdSsUWIRs6npG3ZCMRgXUJO/FY1DUap5mj4G0DEwZbjPbQyxbM5VtratQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxnhvEYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB00DC2BCB0;
	Tue, 24 Mar 2026 01:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317390;
	bh=PmVVhk/+NOta3DVqJbMAdD/e+AV9cq3HtKGafBuDGag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cxnhvEYOwD03NuoX4nE0F1VDLL7EdhETZC+p0DKXy1FL90oNPLCWi7CyxlIJsOXkV
	 GzPF4iSo9SXtcpkHkhh06nIIVQZ5/32poB1FHurQRcGAJxKPGeUV73zvQ9QSmaMua+
	 Sey+eNcXtDCEvfSMSvIwa6a8sWq9a4B7QaAB+M+8jIs/YS93ZfW+243IL8iqhpnuSn
	 dkDY8hUMnKv6hQBJkSfKvnCkydmayO+mggyvkV0oOX7AHI3Z371xjjpPBNgTFukoj7
	 IcPra426O8nFWFyuMJlYK2xadMn5PcX/Je/OKfvBx6TwNHn0lAGLoUJ1PITu3HtPL8
	 zSiNdCfAvIk5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	prahlad.valluru@oss.qualcomm.com,
	Prahlad Valluru <vvalluru@qti.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Enable lt8713sx bridge with displayport for monaco-evk
Date: Mon, 23 Mar 2026 20:56:20 -0500
Message-ID: <177431737471.23057.14337923927861988535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
References: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99491-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23132300CEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 00:38:18 +0530, Vishnu Saini wrote:
> This series enables lt8713sx bridge and displayport on Qualcomm
> monaco-evk platform.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: monaco-evk: add lt8713sx bridge with displayport
      commit: fbe9b798a54a2fefb9345cf546ad74c24577337a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

