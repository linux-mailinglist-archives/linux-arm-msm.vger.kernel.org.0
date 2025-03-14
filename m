Return-Path: <linux-arm-msm+bounces-51507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC63A61BFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045D816D428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738BB230BD0;
	Fri, 14 Mar 2025 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1Bluy03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0A22DFB0;
	Fri, 14 Mar 2025 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982530; cv=none; b=lx8QUjJgZlC3ziVogPF8WFLPYS89dzALAptonIsPOvAxwXhxYyqVeCJ8EIOcR06rI4oVM/TEQrC92wtuD5UYAVnMHJxWOP55+JKINeJKU1NLq5+ssuip7qXonSokyPtjBCqpz2jE/Uf/WONptbklpXcpcOWcvh6vcY3HXYUE8E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982530; c=relaxed/simple;
	bh=UjDr77VW2TJZoPxwvjVtyztgullyMlmTZhkZe5vBJGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmwBSfyz38l3SdoHykBQFx58M/8Smb9Bzwf5JH72TJClsyXBHwnmjtYMxqVExudijRu4Z73nJtC+LTDajBeJ5PKiVFj2D6eDQFTB5ZohjGmb9yFIpbb4BNLGR39sIPOt7dtXD2x8VbdDxezJN1CIf23yZOXvgsAGucdr+Surt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1Bluy03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A55C4CEF0;
	Fri, 14 Mar 2025 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982529;
	bh=UjDr77VW2TJZoPxwvjVtyztgullyMlmTZhkZe5vBJGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1Bluy03hU5kI5QziHNtDW2pEtI0bezmV6bO5mV71h1R2FgUpCTmra7SNl3JUaF5X
	 KLq9Jyqj2rIdGSnDmreYE+GrbqeraRvrvxRqmqbS/5z+GR18Dd+tGBRVhkB2Mj7v8n
	 e8ktLimzIh1iiLJfuPZdznDnwF99Fn759+CEqNNmkqKh1TheY/7d9Oy3/6Cc3A7dV5
	 mLz7Oriue1NcCi6oUtp0rcMLCeev64B+1pm4M6RI2I4vs41ThiiWBsntl+kIbouGtE
	 DhMmUlV1OTSX3Fk0bk2Eihn/QTZ0j8G2PfKd6N7eFcYVjQ37Nb38g+rMrIK6OaRjy9
	 6yzIjjVwL07Sg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Xilin Wu <wuxilin123@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix CPU7 opp table
Date: Fri, 14 Mar 2025 15:01:21 -0500
Message-ID: <174198247895.1604753.3588230226375910868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308-fix-sm8250-cpufreq-v1-1-8a0226721399@gmail.com>
References: <20250308-fix-sm8250-cpufreq-v1-1-8a0226721399@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Mar 2025 18:27:51 +0800, Xilin Wu wrote:
> There is a typo in cpu7_opp9. Fix it to get rid of the following
> errors.
> 
> [    0.198043] cpu cpu7: Voltage update failed freq=1747200
> [    0.198052] cpu cpu7: failed to update OPP for freq=1747200
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Fix CPU7 opp table
      commit: 28f997b89967afdc0855d8aa7538b251fb44f654

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

