Return-Path: <linux-arm-msm+bounces-99311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI5dEcdnwWliSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:18:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 910522F7DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57CD03161217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBAF3B3888;
	Mon, 23 Mar 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqhE3rT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7493B3880;
	Mon, 23 Mar 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276722; cv=none; b=ZMcn5AvJkPOZHH2FqvnCfHh8uBqSIU/cCrlgmcEsGUahxnqFyOi7kfhvK7dsvHkUnFovU8nQiFHkY1gUzHIjLR/4RUh0yRYWHc9tAdaoxS1pNFcl4CXEb9yleW3g3UDOZfnUj23g3uGy0sIp35NcEcxWuNblTta7VxjcYdyvcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276722; c=relaxed/simple;
	bh=gxfPLso+wf89CMq29ry26h6Fu8oblPqNah4mDG/Vks0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hChcndbJBYX5h3JTrMbuMPBt/BcAxUnLGewS88Rk/Z6DMhhkvLBPSEbhkSidfPrCLleyKOj3qNKIxSk+oM3JFZRkW2luparphvdbglvwmiRKPf9NiPQVzio2TILGh1mNliinA5+dWTAzjbz2yKcPMGM/PS3YHqmLwB/QrE6qH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqhE3rT5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D7BC4CEF7;
	Mon, 23 Mar 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276722;
	bh=gxfPLso+wf89CMq29ry26h6Fu8oblPqNah4mDG/Vks0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqhE3rT5picMnfdQe1ufFQrr11fqjeKE79fm3NtrwW52ClWzVvqnfwC4dWJmQmyW9
	 uXpcCRpd01xxv52vRTvgTl7NYS0NQAGK23Y+Kp7/TikjuNrEwb4e5PB+GTLDUwsp5a
	 DIpexO5EEQfwXcrunoDHrhKgjgtCfxF56LwuAUKN6jad8+YdyKpALBDOwIzQIHHiK9
	 YmZRbKkJx8ky8vPNsdGVPfG1pK7h3saleK7cg+vAQ5br1ImhvxAqi8RB8lDiDsGmVa
	 SKEYjDNEwzp6ZcPrMo2M2zacHulj5W07Y0V0L9tkIc0qr0HEW4wtTmyYUFGSJ+M9+Y
	 jpQpFOdEFUIiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: kaanapali: Add PMIC dependent features
Date: Mon, 23 Mar 2026 09:38:24 -0500
Message-ID: <177427670530.11515.15866642216934679119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99311-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 910522F7DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 22 Mar 2026 23:19:40 -0700, Jingyi Wang wrote:
> Add PMIC dependent features on the Kaanapali Platform including:
> - spmi-pmic-arb device
> - various PMICs along with temp-alarm and GPIO nodes
> - Volume Keys, RGB LEDs and flash LEDs
> - bluetooth WCN785x and Wi-Fi (enabled on MTP only)
> - Display (enabled on MTP only)
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
      commit: 8914cc8ab0b3dbfef56100aa3bd49c7137d6feb7
[2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      commit: d5b236e796c4c6922259b801a58831f8f568d31a
[3/6] arm64: dts: qcom: kaanapali-qrd: Add PMIC support
      commit: 141ae09ec1200b548a15e11fc771cbf937d01d36
[4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi
      commit: 27139dce7291f9ad233c00a72780db318b5b6de8
[5/6] arm64: dts: qcom: kaanapali: add display hardware devices
      commit: 52096f3d3f6caf88686b8cf17911225495cbe5d2
[6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices
      commit: a1a975530cab22b06c8ee2994c64b36eba193220

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

