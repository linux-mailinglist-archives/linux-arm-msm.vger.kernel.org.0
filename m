Return-Path: <linux-arm-msm+bounces-50868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187F9A5A2F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 19:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A3B175736
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 18:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74118235BFB;
	Mon, 10 Mar 2025 18:32:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564141C3F34;
	Mon, 10 Mar 2025 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741631568; cv=none; b=AKPRibJVcb0bL/W01bhSL5x5F4M7kAVnlABh9TEAblCeIbRGb18zDFgoBVyGwsQKLtnbd0MfwGgai3ZueSHaGOt7bMa0+SXv1cKjOsEPtWkxboFz9NunxG8cNnqB6go6LOaB2d2Yn99Aj9SjvC8raVIgIqES+AuTPrqncrJNmyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741631568; c=relaxed/simple;
	bh=s/ZQ6EifacNynfBxBr6NWti/KF5ZbcQSOJ8VpvesRTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOV5xMvAkUNS5b/dW+Lf9tucb9Wd0rK7XUynbJftyVz1WGRyb1GBG82phNdbctQyJRgLsBUZ06GY1u3uv5MRa9hJ6497cjOIUWhYztBSdk7Y055ANVVQWy2S/BI6uJ/SECGEbVH6Yh1v1YaPJRzCJG8y8bjba8sd8SjphLIhW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A01C4CEEC;
	Mon, 10 Mar 2025 18:32:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo cores
Date: Mon, 10 Mar 2025 18:32:42 +0000
Message-Id: <174163155801.3207598.4827401624809854495.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 19 Dec 2024 13:11:08 -0800, Douglas Anderson wrote:
> This series breaks off of my series that reworked Spectre BHB
> mitigations. Originally I needed Qualcomm Kryo IDs because I was
> adding "guesses" about their Spectre BHB mitigations. Now that the
> Spectre BHB series no longer has guesses I don't need them there, but
> these two patches still seem worth it to land on their own.
> 
> I've still called this series "v3" because the first patch was part of
> the v1 and v2 of the previous series.
> 
> [...]

Applied to arm64 (for-next/cputype-kryo), thanks!

[1/2] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
      https://git.kernel.org/arm64/c/401c3333bb23
[2/2] arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
      https://git.kernel.org/arm64/c/53a52a0ec768

-- 
Catalin


