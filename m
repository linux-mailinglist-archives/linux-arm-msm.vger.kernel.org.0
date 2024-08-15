Return-Path: <linux-arm-msm+bounces-28669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51714953AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE97283508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 19:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203B97710F;
	Thu, 15 Aug 2024 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGgMfrlE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEC5644E;
	Thu, 15 Aug 2024 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749080; cv=none; b=XFQHA+9Q/CgBF1KQj/6nmEos91c0TKbCKTP+47P3ZHqpi4DovlttCoEQZNO8PvnX8lbqsb6cNFcTv453ssjqIeiiYZU5kOEz1vtt0GC4qHSxIrtX+sqIJw+GX+ksgq6UBXSbVNl8TuPDK/86myYSVaaDzmV3xhqVC9YSvwwsNp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749080; c=relaxed/simple;
	bh=ftamXaAZqJ/z5Ku33xTqxr2h+dFFbkRdhF/bKzRT2/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8RPbPMn2rpllXQHi+SlphZ5+molT0D3MdCK6GuKpK+Y/IenPFJOTJKUfCH554dnXtZ1Gd7sSBMR4Qxb9xPVlP/BTd6GN5TPgXrnBnqJj/UNyF8Js5zQ3l6hV+xJTAhTmYkrSBNBqVGredWywSjWi4YdjbKsncy8U0X6QVgAU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGgMfrlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D924DC4AF09;
	Thu, 15 Aug 2024 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723749079;
	bh=ftamXaAZqJ/z5Ku33xTqxr2h+dFFbkRdhF/bKzRT2/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGgMfrlEuo7Xux1unmJiWmVQTnSOcGDXahAd2BhLjChqRNjAFdlqjgyIq00Y6Vz2G
	 nH+kuPJNBk2JOysWieztstngslD5G8quWyC8F2CKc2mY1xoab+imvOQ3nLvq7Wzlhk
	 KLDlGih6Ly0IW7KoWtQKac9rgXT+nb/c1tx5sVlgJ8gwah+dQK/oHBNvgOBpVBWq7N
	 R4Vz9CITgyydtXiWVw9nOXb5aTUMpClYJBi2macZxCvfu4Hk4Im8kEFgsKd5UYqwYy
	 WorQBDYDwFbTuwiM55BGCrbZfD6ioAGz3OaRvKMz3+BpLhjTDyP2Y5ZEtLHOrVcsOT
	 1gpfE8waUh75g==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: sa8775p: enable remoteprocs - ADSP, CDSP and GPDSP
Date: Thu, 15 Aug 2024 12:15:31 -0700
Message-ID: <172374932843.1370237.187138601087557561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Aug 2024 19:08:01 +0200, Bartosz Golaszewski wrote:
> Add DT bindings, relevant DT defines, DTS nodes and driver changes
> required to enable the remoteprocs on sa8775p.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Applied, thanks!

[3/6] remoteproc: qcom_q6v5_pas: Add support for SA8775p ADSP, CDSP and GPDSP
      commit: 9091225ba28c0106d3cd041c7abf5551a94bb524

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

