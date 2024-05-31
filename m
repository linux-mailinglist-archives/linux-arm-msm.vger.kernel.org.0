Return-Path: <linux-arm-msm+bounces-21316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D08D6670
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC2A1C22F7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A76A15B96C;
	Fri, 31 May 2024 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2BrrV90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44C158DD5;
	Fri, 31 May 2024 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172022; cv=none; b=nfrXtmEcPpZyvBNcDt81+PUxNQH76TOGCq9UTaw7mU0OSTLcIomkptj7tvq0ovnnpNiKtmUmO0B9DwaFIPZSKwTjnTYHyIIZ0gpoC8gdZaY+58tW2CV4dIN6BkU3vZPLgXBdRDSEXP+vdGLdBrt9C9TP1EtoCzQ760ZgbO1rb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172022; c=relaxed/simple;
	bh=iVoDhwrrC/SzJkVXi0Ce5/HJ/2E1QJjE9cHIKzaXOUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vd/dd72x2J4JogCiTSxB56FFpr8vQI1V/TjuWDOwjp2EsD0QDbLKxPLdZLPWShGMsa1XfHlcH7LbLHTRV9bIwwNanKGTaemA6S9EFnzZeBVNYDHK/djA7jSqN5+G/jcOFvehiRlSFzNtxhKyPnGB1VwRLGXOLyjXM34RX7plgck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2BrrV90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E51C4AF0B;
	Fri, 31 May 2024 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717172021;
	bh=iVoDhwrrC/SzJkVXi0Ce5/HJ/2E1QJjE9cHIKzaXOUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t2BrrV905tm8AyI2D7y4TtAR8pRpk0VVlz2t+T+Jj+w40QHsq+5uMW/UUjEuWNzzS
	 hEbPwQMDTZEqB9I+dudzc4HIDEy3bRhQmh8uLst3ynMSajLQZsLIKQY6QCEy2ibYnd
	 01cW3rTOKEYBiZpYCqceF7aA38ZvKOAwpVwxYXVCUsCyngPD4J/VLtVRZm8wsAuRHO
	 nRZ1Q83u2us4EhEHiVCrf4RdLh6RK0ZZRG3CK1ug8E9XRZhA+FGRM9pO+56xopgzRA
	 D7I7ieDy/tBHBoX6StH+Pzu/rqWduYZc2pvsF3e81WAMgvni6FfmEVZ0Pu0u5lI6mb
	 M2mvQw/75TmSw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240529-topic-x1e_pmic-v1-1-9de0506179eb@linaro.org>
References: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
 <20240529-topic-x1e_pmic-v1-1-9de0506179eb@linaro.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic:
 Document PMC8380 and SMB2360
Message-Id: <171717201922.1184896.17307184400785562663.b4-ty@kernel.org>
Date: Fri, 31 May 2024 17:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Wed, 29 May 2024 13:17:17 +0200, Konrad Dybcio wrote:
> These are just some more PMICs adjacent to X1 SoCs. Document them.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMC8380 and SMB2360
      commit: 8495cbb6de205368d56385961a8bf686c6a3a51c

--
Lee Jones [李琼斯]


