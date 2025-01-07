Return-Path: <linux-arm-msm+bounces-44180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F46A046A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31FF3A230B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE161F7569;
	Tue,  7 Jan 2025 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0aG7XWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B061F709F;
	Tue,  7 Jan 2025 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267954; cv=none; b=eByksVFPwL9IxaDCuy6nfXmcfu7uPupgorxh3tmmOdkT1+AjzOvTdslh7zWWEQKTxJ75f1E4OOBasnek7JhUJLqwfmzUyFlZCO5qJpiKKlODFK07vuW7hYCZtmKHV1/AY3WYrqpAufETB6fxU/j61qar2Ym8ASwEEsfaKgPLd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267954; c=relaxed/simple;
	bh=G1jyKWXF87HE8s7o11LwIQTqPB+pRsslNyK6knFlQH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gggrPobSqWuUtEgmWkdY5e7k2hGQoDfUzR1TLO5mVxSvFNFvuuv073HAoZFt4Q+GRcIQGDxhZZZWl+yubD0lVwCdd+7v7mZn093REAndcIgJRDr9sc6IxenA8EMDXjZaa9l4Vj6V0g+b1QdMewa0HrgCIQd8/Vs6GeMxRIeqb24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0aG7XWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A712C4CEDD;
	Tue,  7 Jan 2025 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267953;
	bh=G1jyKWXF87HE8s7o11LwIQTqPB+pRsslNyK6knFlQH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0aG7XWatmaryDQbr7GkRK9r3Gq7mlMDufQptnQeuRu/RbborDpW5kfvxVict+sSl
	 TKsFf3YCAPq7b0V9yTHgI1jwuBtn4pzJh/AwfWEBim3Q5AOPW/w+xte5qZ7/ltgD9d
	 xpYMMuaG0YsLsjqR0n7CoBOfOrgm4QJMZOvJFXIElGUaxcjQa8GR8hqFNrOrdv8qfk
	 AGYBBJZndPpsESe1vuSouv6He4rKk9fNW/ZgiJJhiVNocszfyfFSgx2Ajld0vvXiZI
	 HJQ842GBUNBrz9jdNOANwVxqwNRg4Xo0JBpikmVFB5TFQFX2lK0x5FnRpiZkXIFTHW
	 +PEHIZdxhormA==
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Add CPU capacity and DPC properties
Date: Tue,  7 Jan 2025 10:38:44 -0600
Message-ID: <173626793410.69400.12072758705675236468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211-add_cpu_capacity_and_dpc_properties-v1-1-03aaee023a77@quicinc.com>
References: <20241211-add_cpu_capacity_and_dpc_properties-v1-1-03aaee023a77@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Dec 2024 17:35:46 +0800, Lijuan Gao wrote:
> Add "capacity-dmips-mhz" and "dynamic-power-coefficient" to the QCS615 SoC.
> They are used to build the energy model, which in turn is used by EAS to
> take placement decisions.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: Add CPU capacity and DPC properties
      commit: 82db707eb97d96f6460730a65be9cb2f9b3a4959

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

