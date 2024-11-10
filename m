Return-Path: <linux-arm-msm+bounces-37435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D99C3410
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0383FB21384
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EDB83CC7;
	Sun, 10 Nov 2024 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+hRPrHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3C11CA0;
	Sun, 10 Nov 2024 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731260551; cv=none; b=dJiO+5VwOW3s0T2AdK+1BWwmgfjxKEEGMJpSTNCbDIcTkq/R/ApIyjw1GNZ3Ak0pCJErzECPdq/2hY+GBebj5GVP9ef/4++db7P1PVOzp+zSxIQykWQ9ZDyRYKo+LU7ge2OofWVoWgTql5JdkXFFLvemCdPnn5IKi4FgGeWAf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731260551; c=relaxed/simple;
	bh=a+Yzz8UCbtk8eEmeOw1rIDJBMKGTpkx1OkymYSdKWaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+EyurKH30wxrYlerwValtmW11q2t8lgUuxjIPtd2DyDyzb4Q1uSbkfVCy1EX9mFusD8JYBEeagBZOXsZHtKhA+UuI3gUC1cziXr9XxGXmC7G42MXBTnHN9cb/R5oPZzxcHj+TiTi0MowJH2KmQU0TE8PNvTj4ndjEJGNb5Yp54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+hRPrHU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94537C4CECD;
	Sun, 10 Nov 2024 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731260551;
	bh=a+Yzz8UCbtk8eEmeOw1rIDJBMKGTpkx1OkymYSdKWaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+hRPrHU6FTYzK3xoH1cJTD5iwq+4HJEriMt0yR7t4XqtOi+IbxqB1n5IcCeBAigM
	 anjFpMbEyuLS52NnwWnW5muHl9bIQW8hGjyS0YFqnNXbiO9Qm3GVfLpY/F7Jh+JF6c
	 syeQL/wmJWAyn+EmFSR2jyGsF1dpZ3jrP3ihPT0fRb6iHgp7zIxboqbWvDohvRzc5Z
	 PaOvO4evOUR9B8rz5PpU1PISXia5GcdUEKCm7qblWfp7xe+bgDpxriNN9VMsnbLI6l
	 B9D13Fhw5ygIk4Gb92u698j47P/8XXeuyAvQ1UtR/c0YvVhHJGAbb+DZPyNsIRRTFm
	 AMJpIQDP8cdXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable the gpu
Date: Sun, 10 Nov 2024 11:42:27 -0600
Message-ID: <173126054421.115040.135821795025229401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110-qcom-asus-gpu-v2-1-5f774b17ced8@hotmail.com>
References: <20241110-qcom-asus-gpu-v2-1-5f774b17ced8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 10 Nov 2024 18:25:57 +0100, Maud Spierings wrote:
> Enable the gpu on the snapdragon powered asus vivobook s15
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-vivobook-s15: Enable the gpu
      commit: 798515297c19d2b5b006049a3e75f57322ffe9d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

