Return-Path: <linux-arm-msm+bounces-51488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E98A61BA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7497417F241
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE99212B10;
	Fri, 14 Mar 2025 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF2IWeB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD8211A2C;
	Fri, 14 Mar 2025 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982508; cv=none; b=uois+nEsuDkrVj8JGY7ylWPBg4tvNaTQCSbw53mfiaE6jpSNfkQ589GHyYxQkYfhhke6cK56Q7SvFtMtM8QOl1wVMQ5aZ+X7h+c8Ttw6owftzKrPK0/XhKxTd5s13MuYBg2k3613nmURrTsJVO2m0x8fTp0Nj6Fv+sySyfDC/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982508; c=relaxed/simple;
	bh=MiTmkRvoXT7GM0WL3HIQphGiXyMyCVmC8fnxQDy+M0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLOxw2AwxGXUaJk0ggd5UyJPuTQtB3Q8jytR5FPlPQWhKSI5k7WktIDmRFdb4D/TX5ydKGevnbZ8mdZyqpYiIvwWyaPXccIkdbIIq8rLe33uetzSAd+rTkdciFex9se74gnySqF/wSXqgLCAY5vrdKbnRfiQsIMFygsjg586hYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF2IWeB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1697C4CEEC;
	Fri, 14 Mar 2025 20:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982508;
	bh=MiTmkRvoXT7GM0WL3HIQphGiXyMyCVmC8fnxQDy+M0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YF2IWeB4l2v/mSmIflIgDALgcw6DsPL9SLu3a/F9a5to0JdgWpQNKeiBgzQxS9jVp
	 1csysduVhq0MrBC5puIqeiAtF9rrTJdrrT40XD1ETfPJQLCAIseCQzJA5tSgZmTMAf
	 s3c/HKuIs/7zt4VKZ/tV7Kdfk2FPqiRxtSbQ4YngRZp4NJyFL8OnLix5kFuYDJ5C7q
	 Rxcq3McgvRbtJbiZXmG4mwLsiy5IaZUVihbEwrQ+IYWS5mXfeSPVYkCKBgZoRSSCTt
	 EUJVig/jFo/rTIJYRhyGUa4XDY1pfQMdFQ4/q30AK/sbu+neO5qokjowhAIEd3uxEh
	 GPzuFEbjsBjcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinaba Rakshit <quic_arakshit@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Enable TRNG for QCS615 Platform
Date: Fri, 14 Mar 2025 15:01:02 -0500
Message-ID: <174198247881.1604753.9306123311222565541.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
References: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Feb 2025 01:45:53 +0530, Abhinaba Rakshit wrote:
> Add device-tree nodes to enable TRNG for QCS615
> 
> This patch series depends on the below patch series:
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcs615: add TRNG node
      commit: a3daa844ed8104617174bc1ac4554f8b88a9c878

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

