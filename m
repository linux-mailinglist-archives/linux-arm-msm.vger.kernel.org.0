Return-Path: <linux-arm-msm+bounces-44173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D79A0468C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACD61663EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD331F37AB;
	Tue,  7 Jan 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="celvou5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290B1F238F;
	Tue,  7 Jan 2025 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267942; cv=none; b=huAuXXk7PKFO+2BwxmubML6cFwon/pwNk4pxgnZFmRJzj6DfvsHQ6cx4vJDZxuwENrqxwP87efUEBsZuVN7MKiCOpNA29o3ubs+IlTY5Nq0Ui7DVV6Om9prOn7PuEiPOE/+QEbvoy/Bwkk7ZP1bSal3fLlOMe8ki2lc6/fAPCOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267942; c=relaxed/simple;
	bh=yP/gueg/VmZ0yLta+A038LfRUdiYlhk7mxBEmujB3VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQBXC2saO4bBJu+rImPZwL8Xlt03Jhdnn8lHFRsCetZJKLDyvzSa4AGcRYdgQxSWqka7d7rYAfDyngKafi9CPwIb7hfmOkSAJSgfFwOzdCpM3fZoWCm3haTmVTYiEUG4rniRF9vB5z+yLiQ01RR4QskREYe/tYUPRMxCEVA1HI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=celvou5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A762CC4CEE3;
	Tue,  7 Jan 2025 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267941;
	bh=yP/gueg/VmZ0yLta+A038LfRUdiYlhk7mxBEmujB3VM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=celvou5hp5wXvw9Y/85MAyeT6Aqyguv9iNwR0YbmIOsSCb9wSImyvUmzoa+dqvf/Z
	 OerusR7DM6b9B8tlv/f6qeZl1NQDzQtcMp/XJUgt+kOZatxsIx87BM0zDtLnPWulNO
	 rb6glFIldrTFjWXgVb7XOJ+YFVcpdF/QFzgarLdaTRnOuI2qGQ9MtWcmXf/aA8GVQq
	 Cii9yRM8Sm9j06/pRyMtAxaPhI3ihiVB7zETHzO1dXxUj/wR8gJs0Ht2zA2TzF40j5
	 WBsVgUtdw/Ck/roh+G+VWlayncK21V9r7leYsWwbnYeqBE9FtHZe1TJXK/g3QfQAD0
	 beGQQ/1ohK4PA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes
Date: Tue,  7 Jan 2025 10:38:37 -0600
Message-ID: <173626793408.69400.16488122726120186422.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212-topic-8280_rproc_reg-v1-1-bd1c696e91b0@oss.qualcomm.com>
References: <20241212-topic-8280_rproc_reg-v1-1-bd1c696e91b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Dec 2024 23:19:37 +0100, Konrad Dybcio wrote:
> Make sure the remoteproc reg ranges reflect the entire register space
> they refer to.
> 
> Since they're unused by the driver, there's no functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes
      commit: 7ec7e327286182c65d0b5b81dff498d620fe9e8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

