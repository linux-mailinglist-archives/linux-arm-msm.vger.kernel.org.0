Return-Path: <linux-arm-msm+bounces-44178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9CA046A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEF487A065E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE611F7094;
	Tue,  7 Jan 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2JAeWyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C41F708E;
	Tue,  7 Jan 2025 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267952; cv=none; b=g9lOc4CE1bJzjxz+bbFDIXFq1MO05qAJZvLTYahh05effHYoakxY8ztECPYLF9uDA8eS1eI4kBgvc4fB18SAJjxxWjOzobm0esTHyoGf9Ni3JVFhDaKrpHjVuMYg4fhvSxhOhf6ElVfBMFg/0ULSMXom6ZxaQ2nMmDW4oH953ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267952; c=relaxed/simple;
	bh=y/sM2kqUgtsijC3Koh9oQ57/CxOs0ssgzG/p4N32+oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYvwG3Fzw2w7W6/AkI/qebfeWl7BRc8ETJa5V18yp56DVAAQpUA77ChEwxqnYVAuz9Uz66FQOk8IZrhGEwAAstKqULtJNq6VUffRQ68jBOReCHa6WgdYKp6FjR9godNFtOvh3wMTVfErXpZMIuUr8FtANofE7MKQN7FN+XCuRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2JAeWyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1674C4CED6;
	Tue,  7 Jan 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267951;
	bh=y/sM2kqUgtsijC3Koh9oQ57/CxOs0ssgzG/p4N32+oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2JAeWyV5zmTk9dO9ADh4OmxKamJEkBi+7jy/RipuLpQq828JVWqbPhwsLqV2iMcl
	 QKsbEJ89vhrVDgKcTD1Ca1ZYa/xj3JYNCLsG3+HEGtTCsEhyl9RRKOA+93bnpIgiMt
	 ac/0emnr/69gerxZ8ejiKKgrgwAs/FTCNKh8PN8/SheMS4IKsvOUa8kjAqdPUPZ/z4
	 ORSF6YKzjEZjdHpSIkIaLvkfB3RiD7hBQ1ysOup2ibZ1KGATbyRixbmJnk+bTlcqmr
	 lH6m6zL5hQYRtsK1yf3/lQ/6WvZaqFnr+QTDwqatG32eMoK7Dt3f4mQ3Y5Emn45L6i
	 PhOnptEmmXnqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH RESEND v5] arm64: dts: qcom: Add coresight nodes for x1e80100
Date: Tue,  7 Jan 2025 10:38:42 -0600
Message-ID: <173626793415.69400.5057552126306253652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241205054904.535465-1-quic_jiegan@quicinc.com>
References: <20241205054904.535465-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Dec 2024 13:49:03 +0800, Jie Gan wrote:
> Add following coresight components for x1e80100 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add coresight nodes for x1e80100
      commit: d7cfd75ba0d3ee70f546d5c402f9cce02280b0d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

