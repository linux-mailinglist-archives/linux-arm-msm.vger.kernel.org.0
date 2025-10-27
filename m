Return-Path: <linux-arm-msm+bounces-78937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E2C0E53E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219F9460697
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13B330BF6C;
	Mon, 27 Oct 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2Ce4FQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C734F30597B;
	Mon, 27 Oct 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573995; cv=none; b=rhXiiNFN8IUL6CyHFk7Mld7Scr8opWd2HU78xNHM3khL9/R90H4poZTHOUnx6V5GrryQO0yfCY/AeXAlAuhG0HS4bzGfWFHGiSfnM1qEniJPNntjaTI2EyLQC6okuow1N+PCOMjWJSKbGJ+h+1JrqByNSLFVWz7bkIKXZyxfGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573995; c=relaxed/simple;
	bh=98wbWZyDui1F5hGBDzta88pUK1UigSw7SOXWD8VHwWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AL/G1+Rpp+o70vofF0yrDGFuHhyZK+mgCwUjKKSu2Z4ymzKsF1rG2WlZSG8eJsl+RJ+y6CxNTjNOsN6gXOv+XFgZmTHJvYPgTYFm+yqYFnRuPRJM42eQSv745uW5QOlnUrC00OC2fF8c6W0+XZvhZhAJyE7R1gEizCBeTGwp9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2Ce4FQ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAF4C16AAE;
	Mon, 27 Oct 2025 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573995;
	bh=98wbWZyDui1F5hGBDzta88pUK1UigSw7SOXWD8VHwWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2Ce4FQ+wLSz+ANRvW24KCMLfoBs71fymktuHoZUIHFp4C4O2w7U1N7ZyN3sp3npv
	 DdWG+V3oHllD1D/+Z4+WOQtzwgNRUD86T63h5p/wcjpkCgKqIMT6E9oaGLBimyS1g4
	 pPr8iOkoyN+FYSLYpUkIxvx2dPTqCLcTHrQinhBv18bhUx4E1SfgM80dy5AhXRPRep
	 +SShPIE1csDHKmxZO7+0QP63ZxVGKTBUxMmyyxdYOb8P3lxU7tP8mnccbm3ppqJbCb
	 KbB3aXrY2ien+Ym7tGPnDHv35oLW+WxxhBP93QYPcceU5W8OUcpH3+GKX+0RL+YZ40
	 oOG0p1Q/GIpig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
Date: Mon, 27 Oct 2025 09:09:10 -0500
Message-ID: <176157405471.8818.10866788040746807490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019115630.2222720-1-krishna.kurapati@oss.qualcomm.com>
References: <20251019115630.2222720-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Oct 2025 17:26:30 +0530, Krishna Kurapati wrote:
> With W=1, the following error comes up:
> 
> Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> This could be since the controller is only HS capable and only one port
> node is added.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
      commit: 0dab10c38282e6ef87ef88efb99d4106cce7ed33

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

