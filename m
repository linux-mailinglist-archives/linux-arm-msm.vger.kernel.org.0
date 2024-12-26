Return-Path: <linux-arm-msm+bounces-43401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0909FCCDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D831625DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3901DE2B7;
	Thu, 26 Dec 2024 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvVujwop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F31DE2AE;
	Thu, 26 Dec 2024 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237656; cv=none; b=kD2gwuMzKsahfkr/VfZippkasFSs/yzCC9McBKFcU1t2gbmidmcfcn7qo2Fy3FzsOtBem8hNwSOpIeMngs8rfTkC7QBfl9ktynWF3blafZv3b1KYKGHzQGM29x5zodzoFgCO7VjGI/4beqPIAzYrLCABQDHWSoO6e0xF6Kda99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237656; c=relaxed/simple;
	bh=BkjWGRy41uhA7BGXGYHhHXQHmFpaU8jcUyKDAXurHYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bo24/fQums7HNksXavhtnhLn0yZpDzjaB0zdK9UuxZQd56DYbO7aixAOn7S7prumzOFGPyL4VZgBu3FyebmqPo5dYYvkxyLxfQLbNYdO/VcTM/2KYb6z6eUG4fsIkHCgs8g2iwP0bL42mfRMrWB4Ic9X3nCr3leFWEy0sRYt+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvVujwop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E06C4CEDD;
	Thu, 26 Dec 2024 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237656;
	bh=BkjWGRy41uhA7BGXGYHhHXQHmFpaU8jcUyKDAXurHYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvVujwopoz7JLIrdxPOw5ryUzvDXtZItr/tEsDRzOUvBd064++o/OAzTA1LHAyICm
	 ixbRu0UA6lmpz72leblYAvJT8RKQGcU0QhKmiBqS6EDrOS4u6oV+6aOZWMHlJcTib5
	 YyCRyzHQZIgM3Jd+U0/Ik7y29IhUnFbM66YUzIj79rS3vhR8dU1hu2xTH3pvxqFAWi
	 WNOoa1s8apFAJfOvW9/hA+HPDbZxF+05znhcDcg8C4U0txa66JPlSSHINxYQdy43xf
	 OPFsWLwddDuBxoUzSZWA+IB6YwSKrFV2O85w9SFUOJX/WX+sSPSPpp8cOQylGVKjch
	 6OLoeVG1rCc0A==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rakesh Kota <quic_kotarake@quicinc.com>
Cc: quic_kamalw@quicinc.com,
	quic_jprakash@quicinc.com
Subject: Re: [PATCH V4] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
Date: Thu, 26 Dec 2024 12:26:54 -0600
Message-ID: <173523761383.1412574.5801199484916126019.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241017122858.3664474-1-quic_kotarake@quicinc.com>
References: <20241017122858.3664474-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Oct 2024 17:58:58 +0530, Rakesh Kota wrote:
> The UFS driver expects to be able to set load (and by extension, mode)
> on its supply regulators. Add the necessary properties to make that
> possible.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
      commit: abc0c29f5e49f9190b2bb987cd894b5be9cb7469

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

