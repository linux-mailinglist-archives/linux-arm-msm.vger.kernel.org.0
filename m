Return-Path: <linux-arm-msm+bounces-74439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216EB918F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700292A3182
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46861A314E;
	Mon, 22 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNaNZVod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3319E97B;
	Mon, 22 Sep 2025 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549630; cv=none; b=gDc0mdKspMAdZvkIyY74q3yYc5x61FDc5RGvoAnse+AKWqUjaV52yFz3rpKm3YFstfxU4Y01wlubGfMSBYeXoxrHQAsMTHM0eN2Ztuu+Y1EFBwbGOceCqBszMjrhGqSj/+17VDowJdTaVv8N82rflbUFzzeEpxDHoqBMT3ugGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549630; c=relaxed/simple;
	bh=9+X8lOiOtYMbUbFdpAmI3p+yU7sWK/FSC3XDXhVkqzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Taw/RgPLycYdVTB3FFy9Q4U7dv3bqyUAJOcvf/4llEQwBgoUI9w2xlkdXbhjFcCYWX0+uy1OHdhZ6j6pD+wht4pUm1Ri/ua2MunfYRUZl3Lhz/LSPyQQpIQlg7wxU9icsqh7vLGIdgXLg4UqXEWV4dyziuWP3ybMKjLqkHhNbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNaNZVod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710A9C113D0;
	Mon, 22 Sep 2025 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758549628;
	bh=9+X8lOiOtYMbUbFdpAmI3p+yU7sWK/FSC3XDXhVkqzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dNaNZVodysfX1Axn+pXuGlkBpDyAa21j3nHRs24l5efSBBUSgEG2bg4aR18zxnzZQ
	 gA15wFNwSLUp9OVPsEO3dqfQ2AjAqopr/hx5PJqWWYhBnXur4718I+vamM4sR5jYXm
	 L3le/utpvozKsjYXKA5wOf8buQXY5klXU6teTXX7QHc6q2RCaIk/ydazsJ6TBKAv4D
	 JNjBzA3gYse1h5PAIBm4vLxIKqEOUBu9aolyhuOPjmnuXDlSwU51Y0AK4oVDvtoEa3
	 u5wkmEQ1Rwe5XJrxcKHuhlZ06q1jAt9NlJRETiQISOtEpvyr1/4MscxtMy/x2s/awW
	 hW+cv5D91yMeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974
Date: Mon, 22 Sep 2025 09:00:21 -0500
Message-ID: <175854961646.817693.9374579634970777125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
References: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Jul 2025 17:47:08 +0300, Dmitry Baryshkov wrote:
> On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
> MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
> specified as the firmware image.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974
      commit: 581e3dea0ece4b59cf714c9dfe195a178d3ae13b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

