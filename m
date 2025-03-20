Return-Path: <linux-arm-msm+bounces-52102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7837A6AB8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 17:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6325D4842E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 16:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CE42222AC;
	Thu, 20 Mar 2025 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfN9oUvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85A221F33
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742489802; cv=none; b=QpVvdFVdk+DUl/oNC2wNumw7vwe4ILibzxlsZn2KNsdv2zHrNGrkxsWIiVsYEFO4sV1OMiOStkOXqGG0ljcfv/QEiTLTcoLrkb3msLcaz+4SQqX6aV+HJZM5w91tQyEyLvYqQUnq0guA57UJfNpkpwhr+RX+Av4b6zdVV6b/Kxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742489802; c=relaxed/simple;
	bh=q+IeQ8/ESh5rf+qzsf+KECfiCFZQenJ76BHXW6oyuk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXg4UrVfYgD3wty8osiu3SeK7XPYSApp2ccyTgZTOYC2vYzWU6tslz+zGDNRxwXrvZBTU0gOBQcxCVVOwt7gsrgBeDYOPakzXSgbtNASybdMIsoXxZQgab+piqkG/BrPHsQujKVRsCbypLUpY/D/g7FfD8zj+ZuqRQtcf6+l1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfN9oUvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA57CC4CEDD;
	Thu, 20 Mar 2025 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742489801;
	bh=q+IeQ8/ESh5rf+qzsf+KECfiCFZQenJ76BHXW6oyuk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfN9oUvMuCbSejQdSZ8tHkyue9mySPL+JPDxJNFyATnpwpkD31gWUfZQ5XkRX45HH
	 gJd+0WYbErcyhIVvSdpS/r3d5m6r7Bps6jep6RY9dE+ypP3BHSekh2H5dS3Qn4KKeD
	 uve3FVFeQNVdoIBsA8GOyvz8+pThvrf5RtGKAWFZdYr6BYV6oFyuWhULd/tw6baWbK
	 r4nIsQFij5gulOdTpWdBcfxwVeBBeW3Gcygsiw6UNSTe7VShTOj0+7vol9uk6UDPWO
	 d0h4YsWfzN1Q5NbVntFR9j26QshcDgoT2KOd1nvRimAsGRpLzsL+3jckwBOWu6FhA8
	 EJ2FbRJqal54Q==
Date: Thu, 20 Mar 2025 11:56:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luca Weiss <luca@lucaweiss.eu>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Danila Tikhonov <danila@jiaxyga.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Nikita Travkin <nikita@trvn.ru>, 
	Praveenkumar I <quic_ipkumar@quicinc.com>, Tingguo Cheng <quic_tingguoc@quicinc.com>, 
	Cheng Jiang <quic_chejiang@quicinc.com>, Janaki Ramaiah Thota <quic_janathot@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Mark Kettenis <kettenis@openbsd.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Rakesh Kota <quic_kotarake@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
Message-ID: <i7x76sr4njtoijtte453b7bhubiirpot3hzck7j6umyjhmay5h@ui77ajauxmzc>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>

On Wed, Mar 19, 2025 at 10:10:31PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
> >
> > Krzysztof Kozlowski (17):
> >       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
> > sa8775p: add QCrypto nodes"
> >       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
> > qcs8300: add QCrypto nodes"
> >       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
> > qcom,ath12k-calibration-variant
> >       arm64: dts: qcom: msm8998: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sc7180: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sdm845: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm6115: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qcm6490: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
> > qcom,calibration-variant
> 
> This seeems to remove the properties that the drivers expect
> even in 6.14-rc7, so the branch is currently broken and I'll
> skip it for 6.15. Let's see how we should handle this properly
> in the next cycle, since it's too late now to fix it.
> 

Sorry about that. I didn't spot the comment(s) that these patches
shouldn't be merged until v6.16.

I think for this case it's okay not to provide more forwards
compatibility than a single release, so picking them up then should be
fine.

Regards,
Bjorn

