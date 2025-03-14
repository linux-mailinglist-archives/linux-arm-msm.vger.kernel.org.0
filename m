Return-Path: <linux-arm-msm+bounces-51470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03883A61B55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0406519C062B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC08205AB1;
	Fri, 14 Mar 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTEKHzLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAE205AA1;
	Fri, 14 Mar 2025 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982488; cv=none; b=khh4m+I//eqid8WgzF2Fs0oM1aZXYd7dSTBweeoBZDdhX4gr4MSAYWm8fECT7jwt217XSDDOpQpfCFqJfMZK7syPxCRLy13Gr3LwnPp7YtNeC7x/ibFHW8+7C6iiL1wOSrttF/samsHY1T/d9EOMKj7cOydManD3glGbsSboaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982488; c=relaxed/simple;
	bh=wGOWOvoLXWHYgFTckSDmRuZ0qM5Q1ixwYdqgaTDs9I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNcirYrSJBtv/HWCsDss1nvmWTizQv6KNEW6MFwj2SiY35dUm9jdb6dq/BhlSTavFUy0bNfjAnT2D1I3qBYd+2qbR+/DDOWw82wTQd4XUA2wtkM9LGzlvDxxs2DcxTCyuFE4Cfzs2hiCicmyzSedSapkHKFmFOJ3abe1MiR7bDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTEKHzLK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7F8C4CEE3;
	Fri, 14 Mar 2025 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982487;
	bh=wGOWOvoLXWHYgFTckSDmRuZ0qM5Q1ixwYdqgaTDs9I4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTEKHzLK/+YWQUgcRIAdW9sNyH4eP27RRGxKqVUaMaV7CNHC0asUGmBGzrwoPFi50
	 Moj8q99Fc4ea0HGrfRlN3GRBui9SbwhtTEUL5m9yp5GoXW9cC7xd+3xIUvqjX2Wcgl
	 5qH9JfdzOgyJqRHP9JeLYHvCsyRyn6xMiayBNiqlnGtaBhbHGC8ZrKf71nuWNX0lSq
	 Xopwgge3gN61m3qL/TDbXz97mGixaekI+kQ8z4smR2DGO0nOf7+cqpIqfSn1dn9qka
	 bter85gSk0EquDYZZTYuO99Sf9ooagPVnC9YT5+fRUTVUktEdqsT/4/j3gUZ1DoGEf
	 iDQQWXmK/Ai6A==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SDM630/636
Date: Fri, 14 Mar 2025 15:00:44 -0500
Message-ID: <174198247874.1604753.3783987991393111151.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217050251.298163-1-alexeymin@postmarketos.org>
References: <20250217050251.298163-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Feb 2025 08:02:50 +0300, Alexey Minnekhanov wrote:
> Add missing compatibles and pdm_domain_data for SDM630 and SDM636.
> 
> Unlike their older brother (SDM660) these two cut down SoCs lack CDSP.
> Other protection domains are the same as the ones for SDM660.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for SDM630/636
      commit: d4471b988582db2689692c81a577ce0421b60256

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

