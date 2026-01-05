Return-Path: <linux-arm-msm+bounces-87471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19BCF420C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37D5F3039AED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EF63314AB;
	Mon,  5 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEJz46gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1869A288C25;
	Mon,  5 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622088; cv=none; b=utFuZqACAqRUaHLhZbDM93wfZxAfta8DBar6XvYfQfSjXWh1Cvw/kp/V8ONhaax2AZNCUPBRotlDAGG6/Vb2vObZy5wjQMBnhdyEDRvBHc7HreX1abbJ2YB9OSo9bge/MsCPOyELz8fIcWiT6G4yCrrFeRGkIKVq9JVGuBrRaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622088; c=relaxed/simple;
	bh=XSddrkZ1CdHCkdLJv/GVNPL+EjDuWpH5SJGqeLOR/9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8Km0RMn68Ru47AsGC1WIRwOX/wm9tNndw9bnP1xcX0vBzKH4v/K7pAR9CWoZT1wf3/J08o722cXKtdBT8t1nlnzIBn98vHqp5H8SMwCjVgfcUvyrL2lHKZrFWMVhQU8Q8n6EHIDFTt64IIhFkSBPltP8lvzwT1Uj42/DAhPeEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEJz46gO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DFCC2BC9E;
	Mon,  5 Jan 2026 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622087;
	bh=XSddrkZ1CdHCkdLJv/GVNPL+EjDuWpH5SJGqeLOR/9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEJz46gOxBt81ilMGHkGwNDqNcVtsq1hF7INltvXszJk1uYqWG/QgJ64ejtd9nXd0
	 KokdMMwAD728Qb29uc0hWBn4nD/uDXkj+BcN/LIfmUniuXxaX7TAus0EetiGStGYlQ
	 YUqL/ZGFo0SVv51mNlLDPc81Mj0YbsZrt7Qey7YtIZmED1E+mu7dnOZlJEGcHSLErt
	 n8wfmcdrw03cKx67Dye9tHMzxzkOq99ESMnVMBB07BanEpDWGRoewE+ZaQIDZuoYXU
	 q8DbJuq+Xt5MYVVgZNW3ypjP/qA8KXwSlSLnpAwCu6yj4S9hrhmwsGhRcKegQBqeKv
	 mNzYQ874WaVcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
Date: Mon,  5 Jan 2026 08:07:19 -0600
Message-ID: <176762206383.2923194.4293149972330719499.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Dec 2025 17:15:58 +0530, Gaurav Kohli wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
      commit: 0f15cbbf315c12a9c1004196d5beed8cce9dcf6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

