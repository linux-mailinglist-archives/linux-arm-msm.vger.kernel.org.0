Return-Path: <linux-arm-msm+bounces-33603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D9995586
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 19:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D07F81F261E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 17:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5301F9AB1;
	Tue,  8 Oct 2024 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeEYOdwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0E1E0DBA;
	Tue,  8 Oct 2024 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408119; cv=none; b=Q6/MH7vBJTRuAvGvsdJHxZwSTiPJokGNXVLtPx2XSM/SarDu+W1XZGpaE8C/8Zso/B9txjr3J8g7s6kUZOEHxWR8zvI3cghjgO9dEJELNQOi3c53BzWU3S1DuBu2X4+boz0AdKqVxR+rXzoUgiTRuI2jX+UyEWHNXZ6z55wIrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408119; c=relaxed/simple;
	bh=T2+x3jEbCUUSL+aqv1JUhpfnMXF+dGwXVHJ+/cQ97+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KKuQsOucTYRwaP+A0XNPqWoPJmfRPYQAQuKkzOLTdGlhtJTBVvnv9x5DhYEwqsZShCO/EQ9e7/O89ys6dKaI84Z6gvnRggx4BqYi76L9bFaf3wbP/wOLpGXn+0a+972XSfaodZa8ndLXw+JgKwtDyEprkz63lbhnaW5bli8wFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeEYOdwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775B2C4CEC7;
	Tue,  8 Oct 2024 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728408119;
	bh=T2+x3jEbCUUSL+aqv1JUhpfnMXF+dGwXVHJ+/cQ97+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YeEYOdwD8Du51xGZoc7O0jJNH/JJrjmzYlPuU6QVm3XESqQd9QylKtT/uZDwXk4T+
	 O+PRTYncHOLBl3hSOqEx1wHfnRtB9InrvWNuWa85OdP9jkONmNeaziAs6ZQXiL1AMl
	 tdY83Tc8h/aI6WtK4rHrZO/qPSUIzInJWOjBxb7odqgIgl88phXug1nTu45LKiiAyq
	 5kmutnD8Ahfc77l+KvAtdZ4hw4sV2raIUWOBJL/uBv3b55dahFL5KDi/euhDMpen8W
	 5EvOacMWn1nFUtkdnHXxuYob4EICFj+Hq0zAdkk9gWhBEGIoopnBejkRfhsWfPMAs+
	 RpeJnVx/FAFSw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 lijuang <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com>
References: <20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add
 compatible for qcs615
Message-Id: <172840811718.327876.15012780213607308917.b4-ty@kernel.org>
Date: Tue, 08 Oct 2024 18:21:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 20 Sep 2024 15:26:05 +0800, lijuang wrote:
> Document the qcom,qcs615-tcsr compatible.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Add compatible for qcs615
      commit: 556be13a9b36a15b5e164f0f3e59e885d14d9476

--
Lee Jones [李琼斯]


