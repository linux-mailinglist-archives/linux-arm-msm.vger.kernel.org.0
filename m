Return-Path: <linux-arm-msm+bounces-28670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C2953AAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64C81C225A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 19:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B5D81AC1;
	Thu, 15 Aug 2024 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOHdiyBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000CA7E110;
	Thu, 15 Aug 2024 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749081; cv=none; b=vCNn5o29MlW4W8KSVBkwhJU9YwAcjYz2/7OxEtj7skDnUjQ+np6idIZI4T37lGM87ejO81/PuT/b2mgRWiLbsfjBFK2fEXCzIfEIqBLhHeMFJVnn22ntQLPcOo5isZBIpfzVpy/c08gekmh/qByKjKTb/p5S+O38v2Sg+XmVsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749081; c=relaxed/simple;
	bh=92vX60iqYAh7PcbjNcrQqaG2doDOIb7T48bvLsUa0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INAJn1OKe7pkRLm111PvrMcQqMoxPvFWhBj1rYYBMNrIvnmEH9v9xl+x9Yci0oAO+plYI667+Q6mbmGUWGM72MIE7g/NAi3cB13k2bstiOe+qcmqTmZDPMFbD/YKW26XieSlkJS+wBhvSH/98mXCX7O5ikeq6QqaGHYaSyLt5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOHdiyBt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96149C4AF0D;
	Thu, 15 Aug 2024 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723749080;
	bh=92vX60iqYAh7PcbjNcrQqaG2doDOIb7T48bvLsUa0es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOHdiyBtBjL78lF+LspGrJO+g4uj5hXlvI5A0Ik7hOfQgYvKq4s1ruTipCavK/2fg
	 hMXF7H+BejJi9sNQkqyZqi6PNspk/hjzNAwNiTbn4pektqsGKsRr0bNp67H6xnDoTN
	 Ybnyqv6LdCB+EmHn1M137f8eqclJL0oQqpV0PSyNyx3iuugEOQeEqNbFBgdJQDdE6+
	 2dXAEP92JuC6O8mDJJZ+kEmjyKsIxtoep+A+KevKJorlfBCZC6P+Syo5shZM/JSJ5b
	 4Y4svYibD4q8NR5Qz3//toPVVJ3Zi2HP1aUdc4jWK8UDDYYa7w+gH8S7qWo8YSpwbQ
	 SYQk4Ps22ZbIA==
From: Bjorn Andersson <andersson@kernel.org>
To: mathieu.poirier@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	manivannan.sadhasivam@linaro.org,
	Naina Mehta <quic_nainmeht@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/5] Add MPSS remoteproc support for SDX75
Date: Thu, 15 Aug 2024 12:15:32 -0700
Message-ID: <172374932841.1370237.8680270462656640056.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jul 2024 12:19:19 +0530, Naina Mehta wrote:
> Add modem support to SDX75 using the PAS remoteproc driver.
> Also, add qlink_logging memory region and split MPSS DSM
> region into 2 separate regions.
> 
> These patches were co-authored by Rohit Agarwal while at
> Qualcomm.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
      commit: 888583bd3543da10c4bcb90c78825168fa8e7b90
[2/5] remoteproc: qcom: pas: Add SDX75 remoteproc support
      commit: 76064d8f4cd608e18cef74e810a934ce6da81b4c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

