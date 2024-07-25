Return-Path: <linux-arm-msm+bounces-27050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85493C0FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5CBE1F21CC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22233199248;
	Thu, 25 Jul 2024 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="it4rmRzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8A199246;
	Thu, 25 Jul 2024 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907501; cv=none; b=awiLlNjuf/UXh8dAh4/zkO+VY9nfkufgllse15VAqOpX+CZ+Xm8zq0pDPz+muycY40N5Bw2fcrCOX39atQQhlcHLxGJd66HyNbrnqYAqTw3A+4/ZFQfSPA2i0WsYrmoPYrEWbf67mOT6M8m18kAq6MMztmZZMCHBebcRqlkyOUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907501; c=relaxed/simple;
	bh=7wHlbhi+IiMiFP1N52Rwh/1rNs4dwlG0tTnn/bTsy3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qi7VXcWLdRh10t1yCeSp4FGm5Q0V5rtK/JF85I5W2yMA3279ud3sSLJyGuAVIAt4UzCoNhIHxjwYqmPWsDeHm/8r1ZH79Kq9Lwp6F6i4TTyTYkFfv9qxqr71Z7O6BnNTa61/XbLduc/oty8RSaTOqimGYEhtigOBOuocbIQkcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=it4rmRzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81649C116B1;
	Thu, 25 Jul 2024 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721907500;
	bh=7wHlbhi+IiMiFP1N52Rwh/1rNs4dwlG0tTnn/bTsy3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=it4rmRzCz/XI+smsydwg83+7cfGnswRq92gHVf7zaVJZK1wkKqdA6A0aJrH/F0tP3
	 Mn+Vx3WW6MZnUx1R8/Zfa4LF+MN6xP73BhLcGoRx46f1JLMehrtml+/gLblQ9SMJ4G
	 AXiPjhP7NTnwxOvGk0sctuCHwHKt4Bq+qKAEIgnIVNrVMX7DsEkCtRrpq9Yu1TWHVN
	 rjaUwwppyGWCpXimA6YOgdrRz3DE7xCOCjQP5jmpgNlT7tIafYZ2EBYUfnusmnIVbF
	 V2TxzrWV8Ye+7gtJxBdYcNnfWiWMWwx0WiRQVs8hFafFMxxq3ahbyVwGkSUqFOKKK8
	 meMsrtxpzziDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sWwnd-000000000It-46JD;
	Thu, 25 Jul 2024 13:38:22 +0200
Date: Thu, 25 Jul 2024 13:38:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: enable qseecom on Lenovo Yoga C630
Message-ID: <ZqI5LdjXMRmUesvP@hovoldconsulting.com>
References: <20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org>

On Thu, Jul 25, 2024 at 02:27:39PM +0300, Dmitry Baryshkov wrote:
> qseecom driver end uefi vars access works on the Lenovo Yoga C630.

Really? Wasn't it the yoga where you could not write variables (you can
try but they don't persist after a reboot)? Perhaps I'm confusing it
with another machine.

Johan

