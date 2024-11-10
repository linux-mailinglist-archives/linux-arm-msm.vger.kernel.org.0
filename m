Return-Path: <linux-arm-msm+bounces-37436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D99C3414
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33918281867
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790D213D619;
	Sun, 10 Nov 2024 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrfyHrp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF513BC0D;
	Sun, 10 Nov 2024 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731260553; cv=none; b=s9grsA91cd8PwkObFG/Q160eFGReBrT1C/m5GNkxSbgZR6REYChmU+s4RgrQ+rwXyFv9HfO7aiuzA5rWvYNENjekIdyu6FOOFAWWKPJU5AVh/dFmTXOIqVzG03SsJybIorkdjsvtqnSafFpxz26A5M5+8cboImDQhknZ5fcHAMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731260553; c=relaxed/simple;
	bh=JfEF809RF2m2raDEtEzGq1U+GsMqSQTut2ZS/M2QF+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPTIwwL1lr/waYW0nWQ5pRjD6rF3eR4G5gt5QdhTzzTkVn7d+DDoMVzqSnjQuvHRdWcynBN2r83GKJSCJ6l3zRGkEGXnsZfNzG1M08iotVtxtKMwvoPAwiebSCHC2+F9nX3/D3swBGAsctRFExbgxep84R5TSLzom5NR9EqXVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrfyHrp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD52C4CED8;
	Sun, 10 Nov 2024 17:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731260552;
	bh=JfEF809RF2m2raDEtEzGq1U+GsMqSQTut2ZS/M2QF+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JrfyHrp5LAuKk6/50/vZgkpYPKUHqAEfuRNDtwS1lRSud1QYcDRQxlMfGfgKHqxAx
	 nS+7JbCeL4WuPFzLcunTECIKUo9RU+13cUPODXX1g39Tu0/rx6dfnN3TpAm25XcXih
	 JSR+uK+AVn+PG/bVXLZK1HFz5ejOD867J0F2vAuF37KZL+JTMBQvmBYyu/0oPpqd4h
	 DLXPafola/AqDdVot68+wO8xnAtgFjbP423YbQHPru6rgB30Lg8xXdjdxUbXzng3xu
	 A1+9FOhX2K1FQ96xw9cofV81kvxqCx3u3J2LjB5tVww5mf88NwMPxtCh/iTFv9soCh
	 E1f/qWK4h3lng==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/2] clk: qcom: Add support for GCC on QCS8300
Date: Sun, 10 Nov 2024 11:42:28 -0600
Message-ID: <173126054421.115040.15723309399326949691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Aug 2024 16:57:17 +0530, Imran Shaik wrote:
> This series adds the dt-bindings and driver support for GCC on QCS8300 platform.
> 
> 

Applied, thanks!

[2/2] clk: qcom: Add support for Global Clock Controller on QCS8300
      commit: 95eeb2ffce73feb883156cbb056c75ee33c28648

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

