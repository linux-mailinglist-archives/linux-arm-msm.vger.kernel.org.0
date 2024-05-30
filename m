Return-Path: <linux-arm-msm+bounces-21046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0798D441A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 05:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B4F2866DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 03:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F7A58217;
	Thu, 30 May 2024 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7C5eH2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B557C84;
	Thu, 30 May 2024 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039625; cv=none; b=mxEdvK7vukE3/m4epyaYnImL0ID1LsB37hAtmUHL1/jjyIJootmrS9Jm4DNExNtzDVVgjS1L37cGl1/FszCD+Oe6eJglpDiK2QJc+mn3P7fOMk3Bg4AEVOsng7jCQZkYJHFSMAdWbkP+wXblMYiJ7mD3pT8+C2RqGP7lWkv6jEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039625; c=relaxed/simple;
	bh=jwZ9oYkRKxfEFDSryJlaynVtgPo9BfVTP5ig1cXKAKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJRr01MHALdj9RM9IlVY6ZhkBsN5ZrNQ0pld8Djr6Y3fjPCzkuTYDq9PylJrK/IjDwxYVywGiDVd7pdkmFdiWRI6qhWHz62ate0aFxhbjibEpqR7m6htNpK4QJcpwTJm1RURXhWizQ0xNd9uwLeC0Y+vCjITeEMfmsapR4la3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7C5eH2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41C5C2BD10;
	Thu, 30 May 2024 03:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717039625;
	bh=jwZ9oYkRKxfEFDSryJlaynVtgPo9BfVTP5ig1cXKAKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G7C5eH2xdLCas19dKMQZh4hSTaszc46dx/ndCxUMlpz20zLeVVEnz4UGUCCvhDEXo
	 pS0kIWFkruyX+cALsTrvV3fZ0XMNgVg0qa6qem/jJJhFH+qHCk0uhJPMuy62aVTQls
	 F+c7VGiV222pH5S4oULUYFqCtBBB8YRCK8dJCPXRdGd2pj6Ly4MK1Ss+paxV01bclF
	 LaKZwXjvhIqn9tSep1m+s6BS1mwbtc6UYrcZLkFAIUTU4ts/AwaRGMabj8oMCHgNvn
	 CDIeuVdlfnNtj1q5t8tJdC0NLcDnk6CEzlgr+hSBW1pxLaQG7/pqqYc11pQQAiCVTg
	 F16HMDCTf4RXA==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: (subset) [PATCH 0/3] arm64: qcom: SA8775p: Add llcc support
Date: Wed, 29 May 2024 22:27:00 -0500
Message-ID: <171703961686.615222.7092607304287257293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
References: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 May 2024 18:15:31 +0800, Tengfei Fan wrote:
> The SA8775p platform has LLCC as the system cache controller. It
> includes 6 LLCC instances and 1 broadcast interface.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
      commit: 809c20b1ffc80200bfcbbeceb0d946a3e0eed3a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

