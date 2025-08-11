Return-Path: <linux-arm-msm+bounces-68558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC5B214AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0557D626BEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDE12E6115;
	Mon, 11 Aug 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcnfhFMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786D2E610C;
	Mon, 11 Aug 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937684; cv=none; b=ngssqRJUpQGsm3dW5qkPmDAwD7eaNPDYn5g3avrDDHRelGNLheccqsKQ1BaCIMmPSyx1w3178jJdWgxMojTTb5YtPCSoFh3gUYoqxPw6lmNSjrpkYtcJVc3hR4uNPc2avMlwbJv8jQ4z7zy1e+03EMw2X8sUjap0m0M7j8rFjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937684; c=relaxed/simple;
	bh=xJsLln6e4U2tD4m5C9ONpEwYm5z/ITOB5PtDMCf03hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2nG8/DC1vu+V8vKVCQuCQ6koJLsLsTJfYn4Va9xqb0l4y8kM8iGNdS7xw7fC0Epb9VD6cZYlU4bRSBrqZX+GQ3q1NMKZHzfJ3wjjIpiSUe+2wPMgAo2nNSYeXydgCvQEI/3ZTCHoPkXDckzn5Nf1VTJ8p8IMwJvFwhWtTYhCZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcnfhFMB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EC8C4CEED;
	Mon, 11 Aug 2025 18:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937684;
	bh=xJsLln6e4U2tD4m5C9ONpEwYm5z/ITOB5PtDMCf03hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcnfhFMBnihDZJNoVVXqZmP9uRET8Aki6EG7vROyw47ly2iHMLeUqw5i4Xvgt3dgx
	 rZwb5IOfvIb4XTyra4jE3yn6eslw64P7mFocBcql50FWpDh0KMKrCpWgstHUfc0oqR
	 pDYoZs+16aBbSX+22mCuUepTN6971k219zIT+3sqW6Zs5iur+jkoabWGUAnfe8Ykxj
	 TBrXM6O475HH3fKC7S1kJij+mS3oyGo/xbzPIhhfZzT580w/lxlTa0sf4rMysOAizn
	 XvkcGP+pyMKQwF2huvCoiqTk0lMaPaEdPB0riBkaJ3DWUSAbkdq8BpTpgfzhKQK3KP
	 94q8qWIzyrDJg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: preserve assign_mem() error return value
Date: Mon, 11 Aug 2025 13:41:03 -0500
Message-ID: <175493766084.138281.18393095674744557700.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807124451.2623019-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807124451.2623019-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Aug 2025 18:14:51 +0530, Mukesh Ojha wrote:
> When qcom_scm_assign_mem() fails, the error value is currently being
> overwritten after it is logged, resulting in the loss of the original
> error code. Fix this by retaining and returning the original error value
> as intended.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: preserve assign_mem() error return value
      commit: 121fcf3c871181edce0708a49d2397cedd6ad21f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

