Return-Path: <linux-arm-msm+bounces-13249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D086FDFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC8EF1F217CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C420DC5;
	Mon,  4 Mar 2024 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AUP8fcXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA822EEF;
	Mon,  4 Mar 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545771; cv=none; b=oWuoEZVlB4m+tAmoXUOTY4ttxuN+FsTfFeBy6d4Dq6pKRl9uLJStFj9oap0y0dgrFPqQcMjxhlYBE6lJuDoFhltsoQd4zssUFT+1O+70YWIy5fEKUiabKJQ14pu4nAGh2us9j9hgeuuOl7tuFXajmfGl22/4RQ0vg3HTe9qy+YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545771; c=relaxed/simple;
	bh=LBJw0Rn3EKWsQxgGtPubRI1ahLSpeWzEQ4Hh5e66I0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf0Rqzmx1Yr0PZWT70CsPqmioS4f/aG/ee/VeR7tGYf6dqbvpKT7Wjibdh6KCx0ul2kdRZtgiZ3lXvO/WSU1eao+fpKY1CV1OJCEWalTEJPwoMNHo+ox4PAzzqf1zvluMSxaMBZTQHxhDTuPDMo/7NNSYh+xQc+NkhyLhDfVtns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AUP8fcXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D02C433C7;
	Mon,  4 Mar 2024 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709545770;
	bh=LBJw0Rn3EKWsQxgGtPubRI1ahLSpeWzEQ4Hh5e66I0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUP8fcXmENIAL3/EkVXlXmDdaUwlMi6YlOW+d622By+QsGYYMYJdgu3TUlDH/WO+t
	 ndPgnRE0mDetgLfgIuYjBxnMHEozj85GE/MgjcklxNvR0MBHAVJfOLOrdWZPGzU3nf
	 +Atuitl25Zer0Yg7bCJuSvYJ1dh0fkA72LjiZz8E=
Date: Mon, 4 Mar 2024 10:49:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Message-ID: <2024030414-stark-service-ce78@gregkh>
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>

On Mon, Mar 04, 2024 at 11:26:09AM +0200, Dmitry Baryshkov wrote:
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch 1 added, 2 did not apply to my tree :(

