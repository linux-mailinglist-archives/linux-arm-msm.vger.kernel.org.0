Return-Path: <linux-arm-msm+bounces-99312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMTkGqtSwWkPSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:48:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E62F5371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58D19306E61B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A0F3B38B0;
	Mon, 23 Mar 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzocnG6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053103B38AB;
	Mon, 23 Mar 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276725; cv=none; b=d2NjT6MuaJFjGQj5AIEodGGRkxt3+uDsDPKbjK7ZepqAjS5WqV9fOYnaZ8TgWxIGMAFf2Ow/a2EHXqczP4HFyhzMkijgJao5YAVH8XpHHaRqJzQJtyFpI7OKpu/Q0dlBPDUTfnnRqGiEjXhzTjqlO/7YOHHc9fs2hkoP1tDZiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276725; c=relaxed/simple;
	bh=txT5tUsSGZcpzECjb9kFJ2JZPo2aen79v+/9rb2am/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iY7LJkn8bzbehNzaZOpmYwns6KMyWjYDiykCwAy8ym9UMxY6Lep90C86izwqlSjZgzpHw+JoES8v7ghD48jj/qVaW2AiMCPs8MX6EHAbQ+bkqpWJX0RzQ/XmbOkEg6mLSHNudGafGuegawqTHQsq/M/jBgtoUXIvmnLb11RepZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzocnG6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F84C4AF0C;
	Mon, 23 Mar 2026 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276724;
	bh=txT5tUsSGZcpzECjb9kFJ2JZPo2aen79v+/9rb2am/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzocnG6SNxH5bSSYROAnSk50zyn+YRo0THmggimwxllFNCvb2HaUYwJQ+SToKHnmU
	 jWgR5RbGyDctRaf1uzU8EHWw3NLp+x/5uR9iOT5EklcaeH5c9jp+3qLJlpbgDnG6KY
	 d6tR6Dn/nwhYxF0pLV8wFQOP0OYqMFhvXrN/9DlJg7otCXwp7ficin1THgyLOeD+Yt
	 EzPgrd+q9aHcY83ZYw3p2TZ2mlZpN52LDm+75NYc1m3jtaqjcLH+M9zY4mK33jNe2/
	 JUQ1dp8z4waQf7Eb1AQauHixd7PKQJw1Rdz5Cau2+J2qvNitCkGtuzjTMsga8T+Fp1
	 s2/lqv3fF5Gsw==
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
	20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] arm64: dts: qcom: kaanapali: Add more features
Date: Mon, 23 Mar 2026 09:38:25 -0500
Message-ID: <177427670527.11515.9674788169677314964.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99312-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AB1E62F5371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Feb 2026 23:19:15 -0800, Jingyi Wang wrote:
> Add new features on the Kaanapali Platform including:
> 
> - TSENS and thermal zones
> - CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
> - QUPv3 serial engine
> - ADSP and CDSP with fastrpc and smp2p
> - Audio(enabled on MTP only)
> - Multimedia clock including display/video/camera/gpu
> 
> [...]

Applied, thanks!

[01/10] arm64: dts: qcom: kaanapali: add coresight nodes
        commit: 00cb07c5f10e2b04ed3ebb4652452b3d24f66b1f
[02/10] arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines
        commit: 5f3bd6d54b22eec4eff28dd6c8e1fc7bf0d90d0a
[03/10] arm64: dts: qcom: kaanapali: Add TSENS and thermal zones
        commit: 05f061122c3b7b308a6703fc9004262b2830758c
[04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
        commit: af9ee3d37f8cf5bb1ca5034de2776262bd5dbac6
[05/10] arm64: dts: qcom: kaanapali: Add support for audio
        commit: 4d588259f83e2461b4ef7655f4dbd3ef40c05187
[06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
        commit: 904a7074446b6b3cdbc8be67899722169d38eb7d
[07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP
        commit: 85e0ad5ca2dd961e6a36f5b1d9bb4d1874c98af5
[08/10] arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)
        commit: e52092c0f4ceafde3017eadd63cf0a661fd1e56c
[09/10] arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali
        commit: 505ad2844f7ba0711ec4d6bc49710a0fd1720fb4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

