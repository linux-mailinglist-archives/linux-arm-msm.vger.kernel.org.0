Return-Path: <linux-arm-msm+bounces-30165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D5965938
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED9DBB24AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768BB166F24;
	Fri, 30 Aug 2024 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHNyda4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F016166F19;
	Fri, 30 Aug 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004600; cv=none; b=gRcZERYieaTld7Km2cBcyrkNcyAaFTLyn5CJFoopDxgZ+yVPoKXgrOVyoleyklOVy2MGPtPej901heSe7hwx4CoR6+5MdwNoftgZ1CcREVEiWBxn6/WB0Zcq+97ETyqjXfHIpa6C+RV++gKiXGyzzij24N7d7BrkK0T4fkE3vhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004600; c=relaxed/simple;
	bh=U4aM1hyfgmnABktPEoPihbWuQKzIRjJ4DLsY+FoG9kk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ecr2D8YstqIwa79twhvBWMMRVmI/vsO9SBt+noCGdBnNp21ueRzhQG9R1WG6Kgo/8RPAO1J7il2JRTs6x65qFCDzP0LEVq8pDT1Hh4zlYU46eX+1nPtutVYIVf2qiHXwJSa+VSwKF2vjFruag/r2j7e5guGsrurP2e71Xo8iMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHNyda4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB802C4CEC4;
	Fri, 30 Aug 2024 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725004599;
	bh=U4aM1hyfgmnABktPEoPihbWuQKzIRjJ4DLsY+FoG9kk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BHNyda4a4tXvWZKGZlA8yJUWmu70dsUndKIaLh96aenGuqGPnckueP1Ub5kvBuL4w
	 fpmko32NXF1xhcWW/0NEUHcFmZYbByWIxsmb+UO70ybKgA3ib4IFy0zCoejPBOGW9d
	 ZJX1EaCk6Ei44FTLOXfejeshHuhf/khjj5HnQk972QYy0z+WiJUQisI6ohghsZxUx/
	 Kt79lBRshF9LcqTYGkINQcrCbS/rD8//hyfiRPDltkfEg/+1fdWpIZA1OMXoQXTUE4
	 9ozyVc4tZqXtHyTCMcr99ExZLXukOAlFUNUDmPK5KXLQtDwI3UcEaJpBei9/8oT1x3
	 Kd8y3y6Onm79g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, krzk@kernel.org, jic23@kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826092734.2899562-3-ruanjinjie@huawei.com>
References: <20240826092734.2899562-1-ruanjinjie@huawei.com>
 <20240826092734.2899562-3-ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next RESEND 2/2] mfd: qcom-spmi-pmic: Use
 for_each_child_of_node_scoped()
Message-Id: <172500459843.69285.53949628511366991.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 08:56:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 26 Aug 2024 17:27:34 +0800, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> 

Applied, thanks!

[2/2] mfd: qcom-spmi-pmic: Use for_each_child_of_node_scoped()
      commit: 12d219610d11d2c0917961680ca5fee369b500db

--
Lee Jones [李琼斯]


