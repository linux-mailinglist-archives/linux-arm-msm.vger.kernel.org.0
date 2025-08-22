Return-Path: <linux-arm-msm+bounces-70285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC9B3129C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6191117F01D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92262D7DC3;
	Fri, 22 Aug 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCzM9VZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876E1A2396;
	Fri, 22 Aug 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853746; cv=none; b=XQ1r/xTwSYZNQtC/YwDWvsrfsO4jDClKtds1V6X5FQkM64jzUZ400Wwdbfqodrtvzs70DBpPTtWxDUXGIwsYeKAMDnsLDDRiFy4q0rQtXzUgqfVxhTEtT1IWYxNySeNAWrVxcXxfmk/9wnIFXOGIm3pO1lKDU46kuwN7LTxniiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853746; c=relaxed/simple;
	bh=IucueJiAAL234neKXbYq4LXBNtBd6wlQCkm5MsY8TOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDtRhDLVqGbes1mAY32YOcaQIGbPdnrjQ4PF7KIydrjuP/Py8AJfM/kpUvAVt7B64vfUIOejwRSbFrbvXVLSIboPMQB8/bueC/7+f5hc1whQCVpbXREhO81U/jhZPsc4rdIX1zcUJg0WXCam4CPaLni+zL0vyKX72a7NH+xfFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCzM9VZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD76C4CEF1;
	Fri, 22 Aug 2025 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755853746;
	bh=IucueJiAAL234neKXbYq4LXBNtBd6wlQCkm5MsY8TOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCzM9VZoYglS2Mwi+fdR9iEqLsjPo6TjIBXD04Jkgt5RsZnWVRq+I+Lg/eZk7cOop
	 ePx4AC4x3THPYaSa+RwaER4X4axQWHUqRCEJrthsBuH80y8g5yZenuJ/hHvHKwYYS6
	 bDLMPUH42Iz9FZduxzKz45wm92qT0WKUeKkGPVeTYUR9hUkMzWtNbIfI4K0Cz+HXLM
	 RBmNFXxh6fMHYPlDRGONHXAdcltS23KY/zQNjvWM9fF6pqMvsEphShE5bPDdPWk3yP
	 EHEj0Hls7UqmlPs6IapHTBQ5yXmW1REe2Tl0qBBHQyJzMZ3OK0fPfZ52t7qYcrkoaD
	 y1UUflV8nk+Ww==
Date: Fri, 22 Aug 2025 14:38:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 2/5] ufs: ufs-qcom: Refactor MCQ register dump logic
Message-ID: <3dp7gqh3lflz3y6vj4ya4lv35llmttte7oilsptei2m3yp6efm@h3wncsrgxztv>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-3-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821112403.12078-3-quic_rdwivedi@quicinc.com>

On Thu, Aug 21, 2025 at 04:54:00PM GMT, Ram Kumar Dwivedi wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Refactor MCQ register dump to align with the new resource mapping.
> As part of refactor, below changes are done:
> 
> - Update ufs_qcom_dump_regs() function signature to accept direct
>   base address instead of resource ID enum
> - Modify ufs_qcom_dump_mcq_hci_regs() to use hba->mcq_base and
>   calculated addresses from MCQ operation info
> - Replace enum ufshcd_res with direct memory-mapped I/O addresses
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Missing your s-o-b tag. Please spare some time to check these rudimentary rules
before submitting.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

