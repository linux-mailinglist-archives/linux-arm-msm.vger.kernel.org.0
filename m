Return-Path: <linux-arm-msm+bounces-34614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4C9A0E46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23140B25552
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A09920FAA4;
	Wed, 16 Oct 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMSakHCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA720FA90;
	Wed, 16 Oct 2024 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092739; cv=none; b=u76ZIRRuNklIxsNbiRggu8bF/218vwV1JpGciH+Eetg3RLu5KytKhCRvrTc9kNEn1npsfcA94P+o+0JJAsmUaPuwy0ugtNuaeYq56iaiEJYSm6wrR6TtBcVAI8Dr4/1VJb4dAH9J7Cp0cqj6iVeSuHM8bQAZFVixVTQutTe9C+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092739; c=relaxed/simple;
	bh=Uz+vexdB3bCraMMvY84wqLiE6vo2h7Fkz6gqKPHdPN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPWRxgQ42UC5k9SgTKF/9LopfXeRhdK/fhFhRhXCCT77HYmLTBDQtFKVQuk2q5qPACXLW6lkhcKkebV+5YJp1voAj7bZjfOlo53YYbPqVMcjy9mlyTZa9rh8u05HcH7uIwzE4za32/L6I3F4dcNHy7MaoXDPB/q1s+BBKOCTO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMSakHCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DBAC4CECF;
	Wed, 16 Oct 2024 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092738;
	bh=Uz+vexdB3bCraMMvY84wqLiE6vo2h7Fkz6gqKPHdPN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SMSakHCORdXbEw1zkhhBuSlGIjXBbrhIVJ2cWh2pv+NJuxwj+3ER44NXIiZCJ7H8s
	 HNXKM3HMoJHvMAhw7JVWRkrmH5UhqabUukeAsBWcPn/CdmGdbMWKdg+UdGf2fKU0Z/
	 mYYvh4qD8r/w9OGHLsu52YA0MzLWJQqXqjXnctmH3arbd4fK0omZEIKkwCVE839LYI
	 KhKmba66LfHDGkYPud1rHG2HmrkB2PG+Nu1Qnmus77wCQQFpTUsnB/lIsyvJwZn6vQ
	 rFm6Ezqc4md+6xP4cZPaxugq/pTiSgxluESCDtltHmm631DZW/WoViEkIqNlNhtFo6
	 kGrGq2uRTdV/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/3] arm64: dts: qcom: extend the register range for ICE on several platforms
Date: Wed, 16 Oct 2024 10:32:13 -0500
Message-ID: <172909273720.703216.10127799661551767994.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241007-wrapped-keys-dts-v8-0-05ee041f2fc1@linaro.org>
References: <20241007-wrapped-keys-dts-v8-0-05ee041f2fc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Oct 2024 12:02:54 +0200, Bartosz Golaszewski wrote:
> The following changes extend the register range for ICE IPs on sm8550,
> sm8650 and sa8775p to cover their actual size.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8650: extend the register range for UFS ICE
      commit: 88dfd0b5a199c6ce4350104bddb40f3ba488e342
[2/3] arm64: dts: qcom: sm8550: extend the register range for UFS ICE
      commit: 5a25ef30a84c121fd6ccde39e7e8e41e6e315365
[3/3] arm64: dts: qcom: sa8775p: extend the register range for UFS ICE
      commit: dcf8ef1c8d3046cdbbbe44802a303a94b5bdadcc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

