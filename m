Return-Path: <linux-arm-msm+bounces-61637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E66ADDDEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B348189DE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FAF2F0C77;
	Tue, 17 Jun 2025 21:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbN2gW3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DD2F0C71;
	Tue, 17 Jun 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195859; cv=none; b=mEBIrHpBkZ1eFhUFEGJRpoRJnTnWu6iGsLL1ng3H3ryvYgJScPEP8tgUf0PYLW3oGS5n87V8TbUCeFE/QRW+4/FqR55zm2ozi4+uOJ6g7VQ4QUWwr/B9qCtcK6DK4FNA17+4sWQWNs0cl0xBY12qF6FkYgDL7j9BmIUCzMvh48Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195859; c=relaxed/simple;
	bh=jHdC4o2x701CqYn41NTfAgv4Bg5F0CUblj5bzB4MTUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X76j62MDVv5Cs48WIYTm9oR/DDx8X1K2y6U5BDHMEWEvKE6rN3zmYYqJjxhnNWWDpRD/yXCxpOlioY8jrw8x6xocc8JTn7sbCwvOjHyiPbKRdzB/qhc+53fSUmdY7tn/nW16PVP5aZsRuxAW3lrBFgTQD/4IT5NZfF2Op6nyiPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbN2gW3c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F44FC4CEE3;
	Tue, 17 Jun 2025 21:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195858;
	bh=jHdC4o2x701CqYn41NTfAgv4Bg5F0CUblj5bzB4MTUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbN2gW3cb2Cu9KwIKPPsnRTswSS9wAfczCCqBPPbf2CXGAj/z4U4ij9UVb4HfycqO
	 BFLXDoHLiIvcRzxQLq7fVOAQUv91OsIOKgYyXpisu/ivlt8D7PWDtYwOgP94TmYvdY
	 7Vua6KyuijrF/X8G85LFrPBuSB37oXQ2EyQPclOUVYWz16Il6yJ+esphoNYq3ombbO
	 ggrI+aAoHISDnBtZRh4ruwsxVgL2+T5pOyx8LDUvJSIUwiV13HrPkAtEZhXql+k8CT
	 OTXMt/Wge4uiocgAWX5K9XdQb1gSj0FO81TS8BSkrtIX2V0KfS7girFho4y2XhgWWi
	 Wnt7GA0im7YPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Correct the ready and handover interrupt number for sa8775p remoteproc
Date: Tue, 17 Jun 2025 16:30:51 -0500
Message-ID: <175019584842.714789.10402543367587353173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Jun 2025 10:39:31 +0800, Lijuan Gao wrote:
> The Ready and Handover interrupt numbers for sa8775p are incorrect. The
> correct interrupt numbers are as follows. So they need to be corrected.
> 
> Fatal interrupt - 0
> Ready interrupt - 1
> Handover interrupt - 2
> Stop acknowledge interrupt - 3
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the interrupt number
      commit: f6588dea0ab2873760b87b3ffbd02316e7826ee0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

