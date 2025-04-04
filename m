Return-Path: <linux-arm-msm+bounces-53239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C66A7BCEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 14:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B856C7A8AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08611E0083;
	Fri,  4 Apr 2025 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3geZInS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0BF2E62B6;
	Fri,  4 Apr 2025 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770987; cv=none; b=ukWdgZGHpZMx5C7aM0kuKWci3gZSQuVajTuiG7WO5/hwnUKEsKA2TJBhdmspOXY3AGREnhzD0As6btPVZgm6Vj0BjQNBh3Tul/z9Va56Wcpeu/Y36reopZVkSjAgn0afEJWFy4l7Ucni5AV7yFf4A5vlzo2H4saqKKVaiWUn6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770987; c=relaxed/simple;
	bh=EeLqqJ6DT2lADn0IeVVIkvThc5qK5gAKvLEOpACZaDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=modN30GIsT04m8wwV0xzLS1hkONw/bIzWNfXLdP6SzfRj2XKqWxdi0W3WVdh7iaqhhXMhzAwg3wCoh8nSl8eT1PEkZ40wv1SVAmhdpcpO4w4vdnq0HhsOcvk4D2v3swtMzSfIoRUt+7HJCEd3q1n092gi6bxwCbA17bdOJ2Wl2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3geZInS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A78C4CEE9;
	Fri,  4 Apr 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770986;
	bh=EeLqqJ6DT2lADn0IeVVIkvThc5qK5gAKvLEOpACZaDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a3geZInSexjWvt5mjvpsTem3QIeTOEQvGxa+rSJfzwcDwtvuL344224B7EhMp+BtR
	 3ZM7U366kVPL42fwYQK024Jk6NGAflVpPbDmR7At66URbC2mRYr9lhBZ7pvUrT2Gdz
	 kZbxFqyFWBLghgBqFmvoxPxljT9Yb0FLPKZIubJLubouFP4xwcAWpl9FeeXY5Z3uTS
	 5tkHwNywh5MZkTnvlFDXZdyar0lWUcZBQCkXEukZZGPaWuPf0t/+eVNB5sMQHJNO63
	 YNCW2C+3V5I8ZrW01L2ZyT9sJx8Qy0OCMaT3aNT2t/8vuUmCIf9YKtWTelFo0/xBMg
	 1LKCHzuYpmXSQ==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Message-Id: <174377098243.316090.8544403801957208673.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 13:49:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 18 Mar 2025 15:21:58 +0200, Dmitry Baryshkov wrote:
> Add compat string for Qualcomm MultiMedia SubSystem System FPB.
> 
> 

Applied, thanks!

[05/10] dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
        commit: 8a5d347da6ab0208ca348c91d598070bf763fcab

--
Lee Jones [李琼斯]


