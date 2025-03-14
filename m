Return-Path: <linux-arm-msm+bounces-51464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BFA619B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 19:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153253BBCFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14208204582;
	Fri, 14 Mar 2025 18:42:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB943169;
	Fri, 14 Mar 2025 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741977769; cv=none; b=onOP48xb9DFwTP0gdiLNkis+DxpKH+SKIk6nujL+ZgAg3lEbDw6n9hxS/ls4Ap3Pr5qw+qwhvc1f1evB45aJufo86rzdv75nV0UeuIkkv7hXObpTmFy0H8qBzYtoAK9KfYjfLzvFNb2AvHX8XtZhBMaCj2AUWT6J46706HFzJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741977769; c=relaxed/simple;
	bh=hk9CCr3sOTtD0kIUmhrmm0S170xFggZnujxU0PbujIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlIfWrC4barvvMQI7fWosFyGLGtJmgoApaANxI7Yi1mAtCf/SWDE+f/lxNMHoWY/fYIeZ5tG0IAIOSGF/w8+ulU8W06xlpaxImoxAX29jGcp7FwJqpazF5kT/wYfyV/GX3sAbc6KGfadLCZDFKO6PkEHEFh4T0/dXx36v75urFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2259FC4CEE3;
	Fri, 14 Mar 2025 18:42:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Fri, 14 Mar 2025 18:42:42 +0000
Message-Id: <174197748983.735859.13306599472795958808.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 07 Jan 2025 12:05:57 -0800, Douglas Anderson wrote:
> Recently I realized that a device with some Qualcomm Kryo 4xx cores
> reported in `lscpu` that it was _not_ vulnerable to Spectre BHB. This
> seemed unlikely to me.
> 
> I wrote up a patch series to attempt (with a lot of guesswork) to add
> Qualcomm cores to the tables governing how the Spectre BHB mitigation
> worked.
> 
> [...]

Applied to arm64 (for-next/spectre-bhb-assume-vulnerable), thanks!

As per Will's suggestion at the end of last year:

https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck/

Doug has reworked the code to assume vulnerable by default. James did
suggest some splitting of patch 2 but given that Doug doesn't have time
for a respin I decided to queue the patches. If anyone has a strong
opinion, please let me know (and reworking the series is welcomed).

[1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
      https://git.kernel.org/arm64/c/ed1ce841245d
[2/5] arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
      https://git.kernel.org/arm64/c/e403e8538359
[3/5] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
      https://git.kernel.org/arm64/c/0c9fc6e652cd
[4/5] arm64: cputype: Add MIDR_CORTEX_A76AE
      https://git.kernel.org/arm64/c/a9b5bd81b294
[5/5] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
      https://git.kernel.org/arm64/c/a5951389e58d

-- 
Catalin


