Return-Path: <linux-arm-msm+bounces-30331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53D966F07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A79A284EA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2013AA3E;
	Sat, 31 Aug 2024 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6SYfbkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746913A879;
	Sat, 31 Aug 2024 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074335; cv=none; b=mh//C82/8AMqKBk5fit4rlEowcLDec/I32UyBGPpFQvJJXL/9aw57B7L+gv6NW5BEj/nCnNktR9m8dPgKfuU9bwKM4uSCnm/jwOLqfpULSl4C1PqA7cjtBKyc3zzr908KaNEed377WVXsk0/eN1WIClbh84bUEjYUbLIQkF+C60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074335; c=relaxed/simple;
	bh=60PbYa+oI13EfnqfL1AUpKq+Th2buRR1Z5BMJvF4jRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZ4Jhiojt8tohS6EJ1AfXvsDo2+nfRRmzhXKRUGEUOfl1VXMLhVeNSMXE+jNs6sgv4IxtWjYNTVwYlF+5F3nAD2WA5NQqY2GJYsjfeBMbKBq9L2wBRkFm4O0bdaxUVNBtSzgdNz459AxVC5oZxFtIuih9HQFsWskfrIq69s6qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6SYfbkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB2C4AF09;
	Sat, 31 Aug 2024 03:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074334;
	bh=60PbYa+oI13EfnqfL1AUpKq+Th2buRR1Z5BMJvF4jRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m6SYfbkWfNPexzIlSQ4MGj0YPthMAJ4OMjYYnHEmyfByHjghUo32QnV5HBUSl26TV
	 cfOCB5oTJd55nk1HbHNn4PeY5vHTt/GtXhpzAEjJHutqf0FvZQO6ugMkSAEz5EHC0C
	 MCdXTvGxU9FPoMIUu1/tcbqb/mCWP21OkMxYlEpqZA//guKiVmwFsqF2ZZMvOsjYfI
	 U7+jNWskxdWTzoLOcGrPqmXizrq/PSL0w9WW57QT3pB+OnVJub5mlmJ/Cacbe2nOCw
	 usQmqnf74t8ee1xJPO+l1LwYi2Bn+ODVc2+nqUD+17VQmIxCzF4ZKgLUeRP7PkQwEe
	 8uCdfrubsnocQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()
Date: Fri, 30 Aug 2024 22:18:37 -0500
Message-ID: <172507431835.12792.13483541380565226946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>
References: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 22:23:04 +0300, Dan Carpenter wrote:
> If the __qcuefi pointer is not set, then in the original code, we would
> hold onto the lock.  That means that if we tried to set it later, then
> it would cause a deadlock.  Drop the lock on the error path.  That's
> what all the callers are expecting.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()
      commit: db213b0cfe3268d8b1d382b3bcc999c687a2567f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

