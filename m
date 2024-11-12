Return-Path: <linux-arm-msm+bounces-37700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2959C63F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA23C1F23442
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE0821B436;
	Tue, 12 Nov 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt3sFz3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154D21B424;
	Tue, 12 Nov 2024 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449014; cv=none; b=oqzpZNpx/An3xDqEHdMUccL+ZDVaqeZnaFv2t0w2aeG8/yzUXjYyQpwEV36Z3ohQ/9r7MTztl2QnqxGPkqfQP36mxoj2p0GB2EVKf5cZYQqKP9bRJMj/A/oYoJhogBXM4LAcIufirEnhz49bqjTcVePGTih6fkni1fwt3LpW0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449014; c=relaxed/simple;
	bh=VoyiItH2WzLyLZQuXSJwnl9oyXEH+P6ej+K6mLzRhBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syK79vz3umGRnDjg7ZyOcLgVxsI3CXrAYER+wxLHsHwhx5Da/gEx4f6aWr7v1FGfv3N7HlHa++e9TqUoTV67Ov9ez6E1VGn2oZa9cNB2nYMS/LGXYO8YY9wINsHtBPVcbljflpP/dtlXtX5pMQSMF9Qn1csz/608l1cxUmE84Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt3sFz3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF3CC4CEDD;
	Tue, 12 Nov 2024 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731449013;
	bh=VoyiItH2WzLyLZQuXSJwnl9oyXEH+P6ej+K6mLzRhBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dt3sFz3P3Oc+XSmVHStBAHRgT/T/d4sV/0hlPA83AF1uWI3ifhghOFcCuKhxFmuDN
	 oLdxG8sMbllOJ+qi1NG7Iszi4pEV637bK50DTkk9Xnuw3DjxZvwMZsU0qfYX6i+G5H
	 Jm3BWRF361XUccp04psTF76b6u1F1B8+iJVj2rDg8q7rcOUT0Pw7aKQqzzsIcX9yC8
	 WfywI8FRWfmD4NNQq/Sva7D/hw1e0UOe+L+ybP83pebzxnNGDNYlbjvxRlew8/+xUo
	 4rUylMxVc8WOflLloPBhsbXctDHzBzN7UcryAVRJ1E5vhEPQ7Z46hXBQzkitfjKBy3
	 yGgPBebCdw4Ww==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add missing elements to the SoC list
Date: Tue, 12 Nov 2024 16:03:26 -0600
Message-ID: <173144900028.331728.332393464841439368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029-qcom-missing-socs-v1-1-c5bf587b0afc@gmail.com>
References: <20241029-qcom-missing-socs-v1-1-c5bf587b0afc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Oct 2024 18:35:25 +0100, Gabor Juhos wrote:
> There are multiple compatible strings defined in the json schema
> for SoCs which are not included in the SoC elements list. Extend
> the list with those items for completeness.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: add missing elements to the SoC list
      commit: 64d2571a3751b83cde7f4843fb2a69b8c19e168b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

