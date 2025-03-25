Return-Path: <linux-arm-msm+bounces-52489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BEA70CA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 23:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5C0189FAF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 22:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8B0269D1A;
	Tue, 25 Mar 2025 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egAyl6g+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF1269D04;
	Tue, 25 Mar 2025 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742940636; cv=none; b=baAFS2pH745+H9IZv74GtcmtgET4IIG2MqDVI1lpoyDsNzGHMDcqOND8idqFZEigjHBwrtOuyf0Qc6C83M8hrV38qAW36ZmgE/ioqI9t9KoUZ8qkvoqMzDutzJsImgu0zfSbrYkiznMYxYhw8v7cUJwQWZXtJwboSo3RN1F3594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742940636; c=relaxed/simple;
	bh=cTquolJn+rUh2RRuwDkxwlWODcI2LbtYrc6pA6KyL3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBsOChrAw3uoIWYAN75+hTUbV+9OkFHtV6AV0fukQrTzNQLROYZ18HoAa5SkRz4Q3099/NsdcTiRmCd7VEQrA5ve/mpX4rdGvZFslVxWTeJ9p72z13rP/6+aVGHqcVuVx5BvFypkfjuGYutKSv8wUWsT25q6s+r8ePnyCd7iQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egAyl6g+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E415C4CEE4;
	Tue, 25 Mar 2025 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742940636;
	bh=cTquolJn+rUh2RRuwDkxwlWODcI2LbtYrc6pA6KyL3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egAyl6g+iVGFzIBxy/6KPAEBc337m16BX37IGGjA9YtzkJcfDkBGaXUQB7e/W++fN
	 GFjtLBvBkTsC/xkKm0hxxUA6i7BDN4NsGhkJQRq5BysJ5C0/gbzFk5EiB2TiajQzH1
	 UXK56JTAeyPzRSL7Q1qvfOA0hPKvtumQxcqlXIcp+pJBVVgwjJNBsiEU+QNIBgJCjT
	 IDa03BQbxpC0xQiqqVfh2Wlrl5Bl1NB9GgctLBHQyF/bwT3HHUd/ZF6kqeP6PWN4ry
	 /Q0/KgMvoVSdwb3IGTOsMHHl3Gd5xmcp43/jG+OlH6eiNAoW0hbw3FW5yw+6xqMwQb
	 yuOag9KE32bmg==
Date: Tue, 25 Mar 2025 17:10:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
Message-ID: <5k45tcntn2bhxqt35quzfm2dsq6eug3hgqdcrta25oy47zuqja@4jclvspwob5x>
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
 <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
 <db0bbc62-ecf2-4f72-a0c9-462fbaadebc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db0bbc62-ecf2-4f72-a0c9-462fbaadebc4@oss.qualcomm.com>

On Tue, Mar 25, 2025 at 05:31:28PM +0100, Konrad Dybcio wrote:
> On 3/25/25 4:01 PM, Prashanth K wrote:
> > 
> > 
> > On 25-03-25 08:11 pm, Konrad Dybcio wrote:
> >> On 3/25/25 1:30 PM, Prashanth K wrote:
> >>> During device mode initialization on certain QC targets, before the
> >>> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
> >>> register write fails. As a result, GEVTADDR registers are still 0x0.
> >>> Upon setting runstop bit, DWC3 controller attempts to write the new
> >>> events to address 0x0, causing an SMMU fault and system crash. More
> >>> info about the crash at [1].
> >>>
> >>> This was initially observed on SM8450 and later reported on few
> >>> other targets as well. As suggested by Qualcomm HW team, clearing
> >>> the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
> >>> write failures. Address this by setting the snps,dis_u3_susphy_quirk
> >>> to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
> >>> on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
> >>> and hasn't exhibited any side effects.
> >>>
> >>> [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
> >>>
> >>> Prashanth K (3):
> >>>   arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
> >>>   arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
> >>>   arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
> >>>
> >>> Pratham Pratap (2):
> >>>   arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
> >>>   arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
> >>
> >> Are there more targets affected, from the list of the ones currently
> >> supported upstream?
> >>
> >> Konrad
> > 
> > My initial plan was to add it for all the QC platforms, but wasn't
> > confident enough about it. Because we have seen the issue only on these
> > targets and hence tested only on these.
> 
> Okay, let's proceed with these and in the meantime please query internally
> whether it could be applicable to others too
> 

But if it applies to all qcom targets, wouldn't it make more sense to
add the property in the qcom glue driver?

Regards,
Bjorn

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

