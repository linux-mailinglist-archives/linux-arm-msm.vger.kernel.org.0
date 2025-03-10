Return-Path: <linux-arm-msm+bounces-50775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47452A58C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8554016A3C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 07:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF58E1CAA89;
	Mon, 10 Mar 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ij88EF5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74721CAA70;
	Mon, 10 Mar 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741590929; cv=none; b=k8nI70JUN07n6cDVcSN/2XqYjvtbAD7TixhjI39wiVNLtq8mYfElNkZkZjgm2gfW8NUjTI5JfegA1eKWKEziZvllaoUrfwrf+aidfpU77dYxt6LKF6/nRhvNTBkfL4DFQffD8MWuWIECLUZ0yJ8O6C8m55+Q0Q78BtijUEHOMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741590929; c=relaxed/simple;
	bh=gFnHB2SIZMW1uSMUca45r2RzoCogViTde2yZGSQuqLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CincbYb1Odi51WB49p9LYwrg+pJw4YmzocrVct7Ev1AawcnSLSMVtHQ2+bOBh6XfVsTk9GFtHRgoEk2Be+NHNhKubqtjQZBBW1Wh3HGxXvDft4naUaDc7fxlvAg5nxrha0oUkbklVzETi/M5Kn6vJmfkQBn/sRwhfnp79Y65bHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij88EF5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD83C4CEED;
	Mon, 10 Mar 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741590929;
	bh=gFnHB2SIZMW1uSMUca45r2RzoCogViTde2yZGSQuqLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ij88EF5R72C3F+9cFoXWHdVZq2x2+W/f+rn4Pn/I0LNvZbHVd+s8qpu4/ovfVXDNa
	 cyg05y5KxMMpOLEkCSXo8t91RTM35OpK9I0t9mJTyTCMAVCDZ2611g0v9DMr5fmtUu
	 VGG2LfI7DzS4HlQIMlGSECnVr0QmsM4GTFBcOu2FJleAMDxkt8C3sm0KUfv0AP2wnu
	 CAhV8Zu/mMp0DYmeqJDWCrrfyBALULQBQN6v5rv/ss4BRtY4oHcBDofqGlVkKmVLaU
	 tvvitlIIWvaLkxE28fo8RLJ7ri36gwGqWIVuNCF4Nduh63fW3W82nMhqspS2idnpqK
	 yXq3s5fiKGISw==
Date: Mon, 10 Mar 2025 12:45:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <Z86RjQOSfWOGWeoj@vaman>
References: <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
 <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
 <Z2sOl9ltv0ug4d82@vaman>
 <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
 <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
 <CAA8EJpr48k_tHKk-uVpAH7TMcp0-V97x6ztdFrbv0Go0a6kD2g@mail.gmail.com>
 <Z683g5yuSu1Pi0pM@vaman>
 <163cab94-3271-44ed-a211-300087f4bd83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163cab94-3271-44ed-a211-300087f4bd83@oss.qualcomm.com>

On 06-03-25, 18:53, Krishna Kurapati wrote:
> 
> 
> On 2/14/2025 6:00 PM, Vinod Koul wrote:
> > On 23-01-25, 09:23, Dmitry Baryshkov wrote:
> > > On Thu, 23 Jan 2025 at 09:00, Krishna Kurapati
> > > <krishna.kurapati@oss.qualcomm.com> wrote:
> > 
> > > > > As mentioned in the cover letter, the bindings of phy have been merged
> > > > > from v1.
> > > > 
> > > > Hi Vinod,
> > > > 
> > > >    Can you help in taking in the patch-3. As mentioned in previous mail,
> > > > the bindings are merged and present in linux-next.
> > 
> > Can you pls post it after rebasing
> > 
> 
> Hi Vinod,
> 
>  I see the patch-3 is applying cleanly on top of latest linux next. Do you
> suggest sending a rebase or v3 is fine ?

Please rebase on phy/next and resend

-- 
~Vinod

