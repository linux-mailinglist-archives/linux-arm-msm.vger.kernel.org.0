Return-Path: <linux-arm-msm+bounces-26197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B2931712
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5919280EFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED5F18EA9D;
	Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxmSXH+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EE433B3;
	Mon, 15 Jul 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054658; cv=none; b=TxOMIihxT/WLhKp2OvKXIecXUHbGVWqFQD1elTQxhVJ0b/T5jGv0AIV3Uyyf1iZFB9P3DZQi+8I1ioqgXRJKFE5BRQggh5fzRtxFAYok7NEgm+qHcYi/LN7RjAMYRRDWA8/ZWOayyYlxY4Xu0zh4tx7VXPlMWwcMHT+0Epba9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054658; c=relaxed/simple;
	bh=bDu/gsMUOxblkygz27CWDP4pjUaK6tD4q4NKJisnCU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/U7sN387EeZ00mtVnf801ffAMCvCCh/pyzfpSa6416wW2Q0TC4Xg8xownTX7PDU46VFIDDEmuF2H/4qBWxk637+GQzyE45r7pyRWMWQvSHb2uTy1uPTYUTejXKd+S5e8vODYI0vUxTPk12eVOjbqpbxLHYMwDwP48Wd4iR+Vn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxmSXH+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B92DC4AF11;
	Mon, 15 Jul 2024 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054657;
	bh=bDu/gsMUOxblkygz27CWDP4pjUaK6tD4q4NKJisnCU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxmSXH+zy4squAu0JzPS5W1ghlSHLYxHp7FI+bthPU9ywn6jQ4S/AUNAe2vhA0Vut
	 UoPAL+k6L+PloFDx3zGud21Dq88/a6Ln62zOsHv5fExWzQUKiTUdBuC4Viuy46pTcQ
	 ky0gR5RuL0FAyyWgKNXeV1lo+OuS/a/2SKaFTa0EUNFEV1BApIsQdD6N+iRrq6ZEvn
	 1ymgyR0nW9Hd4jf7k53cqRmGwYdcxxhrLzLDxkGrDa10izHl9q53MYAbWtyXjpzD7X
	 +lQa+2ma9e799wEhSy/Rl1j6gV0xMoLBq3Ub8cJkYNZ44q3GdmZ3YqxF4Kuwl1v1XT
	 sHYts4OGv8Ybg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTMw3-000000008NA-2sfX;
	Mon, 15 Jul 2024 16:44:15 +0200
Date: Mon, 15 Jul 2024 16:44:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: disable GPU on x1e80100 by default
Message-ID: <ZpU1vxsYUdVg9VGv@hovoldconsulting.com>
References: <20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org>

On Mon, Jul 15, 2024 at 05:23:58PM +0300, Dmitry Baryshkov wrote:
> The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> file is signed by the OEM keys and might be not available by default,
> disable the GPU node and drop the firmware name from the x1e80100.dtsi
> file. Devices not being fused to use OEM keys can specify generic
> location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.

Please enable the GPU for the CRD as part of this patch (e.g. move the
fw name property there).

Johan

