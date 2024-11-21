Return-Path: <linux-arm-msm+bounces-38673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152A9D4DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 14:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC36281EB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 13:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E617B1D89E5;
	Thu, 21 Nov 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DntPCbB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7C1D89E3;
	Thu, 21 Nov 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732195836; cv=none; b=Pi3TXrJWWPIlEnzk/jCgcKKrmF679jwSYpFl2u74N0VpAH/2LpAxX6LLY27hB4IgBU+7vebBshIm0fmPMPh7KNEKjvmjz9GnK0TMneTkliuipRNBbyzDbs5dqgdpiHwBvlfWFnmUxczYgzwS0yrVT8G9DQM+/WK4cyvpVr5vX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732195836; c=relaxed/simple;
	bh=ASgXHVNuV9rj2VXsDVEXv70EB7Y5fnU8w3EOoPXXK30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRmdkjbMs/OxfloLMbne21Uch6FKl5I+a3fO742F2es0GsKe5/9MPliQteQcBv6p9ttI+EGxcIuiL1U+e220elz2xJ/P3ndwkDA5IdVjwUemgJKTHK3KUNwOqr1MDUPQ0BufNZrsttbpwU0nKgrScjEWf7JGLgDAp+qvsJhsJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DntPCbB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D2EC4CECC;
	Thu, 21 Nov 2024 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732195835;
	bh=ASgXHVNuV9rj2VXsDVEXv70EB7Y5fnU8w3EOoPXXK30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DntPCbB6E0le/iKyoX/744ERaY6tkAuSukHl3qFZyuZyBVJvGFTqqIO0GZ1s37VCg
	 tKi39aE84OJMuJeOF/U/S7l69XWKA5FwRlVKGss4AK8TcVtLi2iSKoqqtU+6HjNZqb
	 iQ7fYiqBwCOqoNKVqoKzZLYDa0ogxPPaQOIjgC+E=
Date: Thu, 21 Nov 2024 14:30:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <2024112120-sandal-reach-2e09@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>

On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> On 11/18/2024 7:32 PM, Greg KH wrote:
> > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >> +		/*
> >> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >> +		 * domain_id in debugfs filename to create unique file name
> >> +		 */
> >> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >> +			cur_comm, current->pid, fl->tgid, domain_id);
> >> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> > Why are you saving the debugfs file?  What do you need to do with it
> > that you can't just delete the whole directory, or look up the name
> > again in the future when removing it?
> fl structure is specific to a process using fastrpc driver. The reason to save
> this debugfs file is to delete is when the process releases fastrpc device.
> If the file is not deleted, it might flood multiple files in debugfs directory.
> 
> As part of this change, only the file that is getting created by a process is
> getting removed when process is releasing device and I don't think we
> can clean up the whole directory at this point.
> 
> Do you suggest that looking up the name is a better approach that saving
> the file?

Yes.

> >> +}
> >> +
> >> +struct dentry *fastrpc_create_debugfs_dir(const char *name)
> >> +{
> >> +	return debugfs_create_dir(name, NULL);
> > At the root of debugfs?  Why is this function even needed?
> creating a dir named "fastrpc_adsp", "fastrpc_cdsp" etc. to create debugfs
> file for the processes using adsp, cdsp etc.

Then just call debugfs_create_dir() you do not need a wrapper function
for this.

thanks,

greg k-h

