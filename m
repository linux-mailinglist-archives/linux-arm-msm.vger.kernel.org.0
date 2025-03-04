Return-Path: <linux-arm-msm+bounces-50239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B8A4E8C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2288421031
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8152D64FE;
	Tue,  4 Mar 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7SO+h8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804F2D64F6;
	Tue,  4 Mar 2025 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107628; cv=none; b=KNX1zauf1oKwJVdBGiaSFRBjoGkaCYexLrJ6yYh850JL7KxFdfX0CHUGB2gGtb0jzpi6kgCGShuqFprR/wloWovgJqn1r9PL9RtvNp7Z7lwsKPrU9703rUsZYLJ59QK9fxhcWlGIluUD8KMlq4gcrIk9MUnaQ2rD/jUP5Q7d/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107628; c=relaxed/simple;
	bh=Bec0KE1MvXRuhrsHc986g+W4GhcFfKMnDoUrb9hc+wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSOPMTZqDRFqpN8nPyGB2O3QDPxttPDt87Px5w07ky2kqE+rBjt1JZ62EjgrVYt+F2PNHIYGuKk0S21uUj5lVgyMw5mzp+9ynL7XwaAeOGaGJdMuUl8gpl2jAbbNQcNwgwVxXVJBb8OrwGBMaRauxKUff+BbMi8oRYX6lcuR61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7SO+h8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DCEC4CEEB;
	Tue,  4 Mar 2025 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107627;
	bh=Bec0KE1MvXRuhrsHc986g+W4GhcFfKMnDoUrb9hc+wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7SO+h8CTpbVa4eLj15IUvRQOwOpZyQttNCYZ+St3usGwAbTNG1u51WY49cmTPD/5
	 jXa4moGzDxVmD81GBG6WCYiWj76P+X1JYpUGu8K3SvnODVJguj78qnV2kikmsm5jQ9
	 4XnSQMGGGkgzTkPFi0rOq/q4vZO8qwNtPAJjdSl+azgch10nR+F1Yj3woqglEVanB5
	 n2iRPpJRMTHtLib7zF7VgKvrvFaMKov4i8v4U1zwwk+wqovulZqGVes3GlqmOiEivK
	 rnfSR9dQgOln6cQyhn7lAmUcpDHQnWYu3o4LEPky2PoZc2PwhXdA5HlfHgpYQZuoGg
	 0Ka/iimN9CwmQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Add Command DB support
Date: Tue,  4 Mar 2025 11:00:14 -0600
Message-ID: <174110761300.741733.18062731915221005046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221-add_command_db_support-v1-1-d60acbf913aa@quicinc.com>
References: <20250221-add_command_db_support-v1-1-d60acbf913aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 15:39:57 +0800, Lijuan Gao wrote:
> Command DB is a database in the shared memory of QCOM SoCs, that
> provides a mapping between resource key and the resource address for a
> system resource managed by a remote processor. The data is stored in a
> shared memory region and is loaded by the remote processor. Therefore,
> enabling Command DB ensures that those resources function properly.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: Add Command DB support
      commit: 83934b5d6b1a9664867beb4e822a6f9fa1fac687

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

