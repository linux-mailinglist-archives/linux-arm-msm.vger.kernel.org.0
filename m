Return-Path: <linux-arm-msm+bounces-23497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4F911A5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5FD1F22005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDE412C46F;
	Fri, 21 Jun 2024 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbzoZuTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221D63A;
	Fri, 21 Jun 2024 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947761; cv=none; b=lI4CXu2xvgF0UPfy/XZXSSR8e79MVEAc6vV+JuJaaT+a8MZSxb6Q2FlbjGtV2iHoDFMQOL3SQUUweBWhfS89VtKZaRoOyjtvR69Qy0lkLFnmZF56flP7HebqtXwWwgkNJFnBFuIY+g1IgRIQSN6CvjNnHFS+ZWcTZFZ6BrKWWb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947761; c=relaxed/simple;
	bh=QjmxWRJZUIUfwMxmk0zGTkg+d0XCMnt3cBBK3lXH05M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjpbILg59+rlR1gZ0IJLsJ9UBIiLpgSDDTLno17nstl8PebAKbgYF+8Slp0siShN0dwAXOLhu2l25CwSBrSKG5D4pvF6MUTco4a9nnDHLGLNlYb3qieaAkFg6TtBeOiaomEdVTgVZjEJ9oATR1DeA+RSBAHMsH5I/mHEXHBqv+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbzoZuTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36923C2BBFC;
	Fri, 21 Jun 2024 05:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718947761;
	bh=QjmxWRJZUIUfwMxmk0zGTkg+d0XCMnt3cBBK3lXH05M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AbzoZuTNohYOJhrILmd4nL50tBzN+8Y5M4Zqciwu57tEHewyi6k642lzp4WTF5lp6
	 X8c2Llu6freeBYgBFUgNnRsBLgKDuRnelr4Bk+VC2suJmT8hi8DoEcrBTJFYozU2eX
	 ej5N6/cyvXBag5nwq8/i2olSB0UPd6VgfsCrxxEoGU+K5XNHrqBQeFc0fxtno18GrV
	 gBN1qCMiLXGKZZP9jQjDO/8sIdX7Cctq+NZYYyFpF+hNvlAz2kScco2Ky8E6WOFeXG
	 12E0/8HpED7sdZafVOtrNsWwODS0mwWoHNJl5u6p7q4AIDhH2cUdKO3pPLIw5pGT+X
	 OVfyFN3KVCi4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jun Nie <jun.nie@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
Date: Fri, 21 Jun 2024 00:29:15 -0500
Message-ID: <171894775429.6672.4139305245535140845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com> <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Apr 2024 11:43:16 +0100, Connor Abbott wrote:
> This will used by drm/msm to initialize GPU registers that Qualcomm's
> firmware doesn't make writeable to the kernel.
> 
> 

Applied, thanks!

[2/6] firmware: qcom_scm: Add gpu_init_regs call
      commit: 158ed777e330e9bf6bd592daaf1e860d965ec8b5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

