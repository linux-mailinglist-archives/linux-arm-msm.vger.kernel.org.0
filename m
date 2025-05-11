Return-Path: <linux-arm-msm+bounces-57562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A1AB2C29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13856177A12
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3945A267AF6;
	Sun, 11 May 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amqeST72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C2267AEB;
	Sun, 11 May 2025 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004535; cv=none; b=hdSwHuwq56Vp4yIZOvbmSmW9zZphaMJR6LLAzOrzpZ4eEFtuWLxJii1ngpMQdLeDC6crJ4m8lb8mFFKV+Q62hkwHHfqf4i0gBJ6G6nffErqtG1EGD9jqNmcEe3H9fw7OtRqDn9pss5Cic2QppIGIv3Ouj9sbkYJWtCDa6aYqN88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004535; c=relaxed/simple;
	bh=SNS21+PJ238QZ9dX9iVkXUrsWs8/oQPJS3YT3GKefl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eq2OnX7QPK653WH5JB8mY9Fqt2ggtiZ1fmPPOoWV40bUV2WFSC5XMKM3Ns+tfbbtMyfw+mqLqMOuUoDiCeSyYd9Tz6y4vc7nXV8uwbRBn2WyPAE9gS6HVPqNc3ZIhD0AjhW0DnEdjPsGe+fgRUt5fsU7nTUai0mzh5qbCCH9mK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amqeST72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC5FC4CEED;
	Sun, 11 May 2025 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004534;
	bh=SNS21+PJ238QZ9dX9iVkXUrsWs8/oQPJS3YT3GKefl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=amqeST72WAbMroEd0tDws/VxHDPOfcSOzUEFFo+Jr2/nruACQ06+aRu3/3O1dHBhR
	 yWtHJGJZJm3Y5kL1CQY6xymhvkZV4S8BLrKBsaS1bh8rfG3BL1qoQy7YAic6mLU0jO
	 XbK4kDBLc1V4rn0zgfZPgPwtwtsfiRSruMRjfpjAD7lsnsoxPYQW9HxFB5sknWYRTi
	 d3FDw79f6MWYQFhASHSaOnGtUIIQPss1i5ZYLtg1uBANBwSb3ESbtTkmMdhYKYsK1T
	 emqjCXMQMd79X1GJpIq1Pw0O1g7BrdrxvgWeC5F+wkPMIEnjjI6Lzu9h0KKKksn1D+
	 L7pe0IN4/Q0tg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: add the pcie smmu node
Date: Sun, 11 May 2025 18:01:43 -0500
Message-ID: <174700447991.10930.13899637542901637717.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
References: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 11:51:02 +0530, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: add the pcie smmu node
      commit: 061402552e98a55b419a5045ba366dd51cfb24f1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

