Return-Path: <linux-arm-msm+bounces-73286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA8B54897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455D43AB142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D59C28AB16;
	Fri, 12 Sep 2025 10:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D91A83F9;
	Fri, 12 Sep 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671322; cv=none; b=SWG/5pimt7KQlyKrvNhSqGdd6nDUMRD3JK2Ryu+FE73yfhg1XFswHRMfWtcnWBvaUXnjCj/bMIS9XBhCxhOmgyWGZ6i+5P1f0qAziVmcP/SZyFMKXJajyMYWxGyYqt9Er+J0jhTiupW+mJFtzxaGejNfzvJuSgSW8BBJxgbfEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671322; c=relaxed/simple;
	bh=4niIPuTIZuVkg7maz85SEQmzt/Rp0LX7kum9m8Q7cT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l9b/Cya/9FbvGLAIX1F6p19fILtivHaAwBZbGA+KH9oh8N+EpKhoH2zqXSn/3gz8LVIO2/G68LWs+V2jqBh1u4br31SR0pTv6AO6aVf0Fisd2yIeHxNXBHqY7YQXMigFcgkHj/EMk2ojz6IYYfGtw1FlsvsJGrEf7I5KX0jcjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B9BC4CEF4;
	Fri, 12 Sep 2025 10:01:58 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <20250912-b4-uevent_vdev_next-20250911-v2-1-89440407bf7e@quicinc.com>
References: <20250912-b4-uevent_vdev_next-20250911-v2-1-89440407bf7e@quicinc.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add uevent support in MHI driver
Message-Id: <175767131849.17338.9848616263930655388.b4-ty@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 15:31:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 12 Sep 2025 10:29:16 +0530, Vivek.Pernamitta@quicinc.com wrote:
> Notify the MHI device's Execution Environment (EE) state via uevent,
> enabling applications to receive real-time updates and take appropriate
> actions based on the current state of MHI.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: Add uevent support in MHI driver
      commit: f7fda4b0bd9ca6be97658bd187ac49c6cdcc0010

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


