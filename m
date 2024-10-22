Return-Path: <linux-arm-msm+bounces-35329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA679A9883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB691C21E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E241B14831D;
	Tue, 22 Oct 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFPjyQ7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7A1311A7;
	Tue, 22 Oct 2024 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575155; cv=none; b=lsuwLrRtM6Y22N4BtP/SGJTuo16K17FiknQ2SsXt/wX1O/nowSPIgld2K2JM6ggx7RlYEQAC+6d2QCXij5tk+MSg9hqTMehD9oSbJSvsYgOBItvUD3ziXjRh6Csve6W97okxqXooGWtJmAS0MteQZMJSURm5kBMn4kYYuuPR0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575155; c=relaxed/simple;
	bh=B9keYMouUTRP6Cr9AkKbSL9SmgGvWcUNob9kTza48ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=toplSPA/2ufbIZdABfCuSpWB0NAvbaYtY+xpUp+P14rO0holsUK+JdO2f0T8SV1k8usoPdrRfPT7AjR+2udfmgz4ATRY7sFnAqeC8bpz6v3AO3HfrQCmtkPOvPm8p0CNiNkJSvDhVimOXbA+y9bw7aSPDHElNiykIeBx/+eV1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFPjyQ7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E547CC4CEC3;
	Tue, 22 Oct 2024 05:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575154;
	bh=B9keYMouUTRP6Cr9AkKbSL9SmgGvWcUNob9kTza48ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jFPjyQ7gq5bIHNZ2mb4BO8mUkNktSs2Y3hN24MkOGlBxpwdDov5bGDcw6ox01I8cC
	 YlyH3hXto/nRPYg16vEfUzSmeUZ6NrUTkvYKO1+oBNxIbMY8o5AQW30f5skGDg88ed
	 4tvj5r9L7KmAO/tfcUqmZPPThMh3pNe/pBxE9wJlziw0emxY7tFpkaLv7ICupgjLdG
	 b+bg4qdB5FgqMlRV+syN9PnuzyeAifI2IZ2piOxKR6d3qrlp6677OnOB0zMh/UiM5l
	 tTIfcbqcIxoxNlXNx/vUZZSdQP2KAHzXNuM0Fe09BulnkXPvlyEVS7xrsnyDeU43C3
	 6cAGZ6RP7XMgA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
In-Reply-To: <20240903-topic-qmp_typo-v1-1-781e81799992@quicinc.com>
References: <20240903-topic-qmp_typo-v1-1-781e81799992@quicinc.com>
Subject: Re: [PATCH] phy: qcom: qmp: Fix lecacy-legacy typo
Message-Id: <172957515183.488852.18123973313954304086.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 03 Sep 2024 13:13:10 +0200, Konrad Dybcio wrote:
> Introduced in Commit b3982f2144e1 ("phy: qcom-qmp-combo: restructure
> PHY creation"). No functional changes.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp: Fix lecacy-legacy typo
      commit: 32f4a76b8e7cedec9f9aedbfc43626536bba8350

Best regards,
-- 
~Vinod



