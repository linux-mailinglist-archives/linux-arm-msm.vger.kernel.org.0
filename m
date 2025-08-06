Return-Path: <linux-arm-msm+bounces-67944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8BB1CADA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42E894E37A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DD929CB53;
	Wed,  6 Aug 2025 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDkZLSEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5811BCA07;
	Wed,  6 Aug 2025 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501575; cv=none; b=ZxVE61mJBSsM04nnSTosNG2lhynAGugSJPM35UOirPayBzhPbMxSgNi8f1PP+eYcJaggu7jbARTVhfMMoHLEdU2Pq4NwcgmUlI7nae7WfVmJKXMF4HFap3t/nULdAWaPIjDg6TPR+kwrT+oYt1YeB56KXOfqaETWlCs4FOjQp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501575; c=relaxed/simple;
	bh=Y29pIpqPF8VltcQhCn+r7xOf14Rp5KsHELKwCrx6YII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKxI3X3kfsCJy7Mxk6Jb1LRZmU4KJkEpKbG6QeOVkTARhoatfnXcXxVdz3zWtWIUa/WKpf6CNXzP3L8PHm3+6+WjNgKnDsGg80uq4ORh7SZda6WvYRZQidNbHtHWU+KUebGNWzRWz8iv95QlKdlt8lXKQ1LjaaCzxI3LGZQHZgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDkZLSEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E52C4CEED;
	Wed,  6 Aug 2025 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754501574;
	bh=Y29pIpqPF8VltcQhCn+r7xOf14Rp5KsHELKwCrx6YII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDkZLSEwcrXlEaafRxG87PSI2U7JAsQqavW+0Rx9wE8lrz6lL15aiSIdkM54bJbPw
	 jX/0uGXxA2UV6TS6QZYFVTlLDCd9JAysJdRDOXnIOqixx0sC/VNXmI7fxRl1iV3jPP
	 fyZUdecQiXzNoFd9TSgYA+ArzUhfBPk1CuArWF0SSJnGctBSrSOoindn9AqXhILrzQ
	 C+U9n8VtfD69RDx0UEB2H6M/2l4nyeoj3TfHUrLTqHpuBM7ispK9PxWI0VsuZGoo+L
	 7zdiTj2Z8QPtkxY3Tjygse97TEVPmPBW3cRZuTpcM5jWryxDw2QqzvNzAc+gLnIf97
	 JDUoZ1kTGxgrA==
Date: Wed, 6 Aug 2025 23:02:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vivek.Pernamitta@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v2 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
Message-ID: <4dzypnirht6dkghyku3myuiayd5pd6v5cuprnd5owke3eclwll@vw6rzm5kcjci>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
 <f80d4e32-0f28-4a90-9db4-05c95e260658@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f80d4e32-0f28-4a90-9db4-05c95e260658@oss.qualcomm.com>

On Thu, Jul 10, 2025 at 02:46:51PM GMT, Konrad Dybcio wrote:
> On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> > From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > 
> > In mhi_sync_power_up() host waits for device to enter in to mission mode
> > but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
> > out for wait_event_timeout() as MHI is in error state and if MHI is tear
> > downed sys err cant't be serviced and mhi can't be recovered.
> > 
> > If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
> > and queues the next state transition for device to bring in to Mission
> > mode, so mhi_sync_power_up() needs to wait for device to enter in to
> > mission mode.
> 
> This is very difficult to read, please rephrase the commit message
> 

+1

- Mani

-- 
மணிவண்ணன் சதாசிவம்

