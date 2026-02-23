Return-Path: <linux-arm-msm+bounces-93798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOAmNAaynGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:01:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2517CA44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B975031746BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A85376BFB;
	Mon, 23 Feb 2026 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djbbaBDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203CD37646E;
	Mon, 23 Feb 2026 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876590; cv=none; b=Qx6PlT9mRdI6XnmHLIXJFK7PPmYBjzEYH4acKXhdm7WPV6+StLgUqSaRqbOAydRpzyq255IeWC6O3yJI3vx/GjiyNCF/STXvkm3jNwh+sxdmFpdgcDiskzW8jWVOmhOuvSIbGia/s0/b/0En37vk8Teg82V9/wKaFL2ygJQAMR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876590; c=relaxed/simple;
	bh=o8zbKVCB44Mp8Qvf/+6+Iov0dLoZ/Ylm+Gf/u/DqLe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjrA3KkCOYHnH5E3fFJyjjAK4dfWv01GC3MAs+nhcKQXAP39YcAmz2nZOqr5R6VcttyEfl8IPQkmYfOYluCgFRMXAAKZNIQQZz7RlK94ObM2QcDUPaspYbXeX0+ZcnGM0DjtBvo3u6lrJrOscubhP3L2jNS1Ue8lIyNJhOSReHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djbbaBDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649E2C2BC9E;
	Mon, 23 Feb 2026 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876590;
	bh=o8zbKVCB44Mp8Qvf/+6+Iov0dLoZ/Ylm+Gf/u/DqLe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djbbaBDvQCT4dWbkFeWe3y90spPTGvp9dRrk0GHnCPhY0BtZLurmIBFcXXFWpewIB
	 4w48h+ox9KOvrL7WLKLjDParxd6dfJGMMRA4XAFI6Y5DjQzQVoQVa839Ma3rJ7ELf5
	 vTTEBd0VS95dJIz6mDNFG6oUQO/s/KF1zw3EkBXzB2bejnGI/TQ1GxUlzmwAPLefLL
	 bzW6HEhgvuQ0V9gdA1DtXfnKn9VS8BpxD2YBI1D5+EL7fJaCSHgMGlPFth2xFiHTwb
	 8lJ+E+ftyLa8udSMBvC8ir4ECs+aECMBcfaMe2OmmfiaZxSow2BFGL6Q+gi0lL7z/y
	 VQ6oTdTuyAtmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rajendra.nayak@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and Glymur CRD dts
Date: Mon, 23 Feb 2026 13:56:10 -0600
Message-ID: <177187657304.166046.16689907944315673624.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93798-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url]
X-Rspamd-Queue-Id: 61C2517CA44
X-Rspamd-Action: no action


On Fri, 19 Dec 2025 20:16:53 +0530, Pankaj Patil wrote:
> Introduce dt-bindings and initial device tree support for Glymur,
> Qualcomm's next-generation compute SoC and it's associated
> Compute Reference Device (CRD) platform.
> 
> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Document Glymur SoC and board
      commit: 4ed5f35359db5fac587d4fb9f7f61c1c6f0729d7
[3/4] arm64: dts: qcom: Introduce Glymur base dtsi
      commit: 41b6e8db400ccba9fc373ac3f0c9ebfd3a22c810
[4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board support
      commit: 9314c6ecace1a49aa40f75f72278e14d2feb2cd2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

