Return-Path: <linux-arm-msm+bounces-80181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E2C2EE4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6233A90DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C1423F41A;
	Tue,  4 Nov 2025 01:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd57uYT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13B23EAB4;
	Tue,  4 Nov 2025 01:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221290; cv=none; b=NAkPsj//pYsUF2Rgn4FMXzy8Su2/2I87eRYJUnOA91tuDa/j+SesZcUeV6K8fIOFfMNqwsEqS3tZ0yCkiD4GhRVnpjqWtU4XXx/2KLz6VUYFOvS2m1y7ecs13VY/yeNB9bWAYS8w3iex0nwnPAsmP/SXRWKkILOrOOL4cRjZN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221290; c=relaxed/simple;
	bh=uQZpVN4QkBkHC6jV+xJlO6QfMZPtvKIWd5EJJUtgIMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNX/9FZDzJlrp4HgDdTnm4yHriAFeVFtQGPqRiRSr8bEXzh7jk+vrOx0eaUj/3hcLTMin4XYdTWQnnuV501B0CWn+SIUrUvHWsforjzPW9idza9+ZbDFoWq87ydB0aJpDSMIsI6L/O84pNUgob0cDX4IYrMXfgmAS39ZaC8/dUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd57uYT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B82C116C6;
	Tue,  4 Nov 2025 01:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762221290;
	bh=uQZpVN4QkBkHC6jV+xJlO6QfMZPtvKIWd5EJJUtgIMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pd57uYT+38CQtlq5Hi2vXoGDPbN/RGvY0HRvMHMnc1cYIPcgVuGIBKiEnVaLl4ZEl
	 vxdSzZamqybEcCpsuMSuRT7MdjKDis1wyHmSV8FONEmykE4xOdp14nG95fIWYZdHV1
	 Uw4YDYUT8qwJYl1WQUXu2TCVXuTcfdEdqluyTE15LTSkz3qEoS+VBNxdoZZ9a8VCz/
	 7pBQh3d1IQb2/iwOZmefEMWj/3V7qA7Md2vC8BEOctQXqTEjCjaX8vCDTWsJ6ZHDMI
	 U1X81Q1vfGG0Aqt6v+oALXjLfEXm9tL1m8dxhQbhO8RqJu/tvMNdQovLR26yGm3pha
	 cDY4RSliUU28w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] soc: qcom: ice: Add HWKM v1 support for wrapped keys
Date: Mon,  3 Nov 2025 19:58:16 -0600
Message-ID: <176222149538.1132260.9122814994642806453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030161012.3391239-1-neeraj.soni@oss.qualcomm.com>
References: <20251030161012.3391239-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Oct 2025 21:40:12 +0530, Neeraj Soni wrote:
> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
> certain status registers and operating mode (legacy or standard).
> 
> Add support to select HWKM version based on the major and minor revisions.
> Use this HWKM version to select wrapped key size and to configure the bit
> fields in registers for operating modes and hardware status.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: ice: Add HWKM v1 support for wrapped keys
      commit: d92ebadda5e30085e5294935e7c1c35801752cbd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

