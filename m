Return-Path: <linux-arm-msm+bounces-67802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62985B1B8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 18:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E69F18A55C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04645291C3E;
	Tue,  5 Aug 2025 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fChGc0hi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B61F4C99;
	Tue,  5 Aug 2025 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412931; cv=none; b=kaKATAXzu1UuXgUusb7yfQGHB0ZKBXtOu0b6zbURzRVrEwhMrhKjnVTouMgkmldgr3o5MsY47sKx+TQb81IA9pgopgOBrlomYskcfi3Sm+DiPaw8Y6UFvMUqBu3GT8kYHM0wU4FC7+/0PI7c1J8I2y5JZx9rAdNWxzKIuimaEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412931; c=relaxed/simple;
	bh=iFb6L5QBtgK6Jtecx2G+pkHMUbVEo5K2fnQW/Pldmvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di6Ci2dZRo1xuIGwspc+8V+044YOmRjcY179tFPOTyfeZLYFZbgSy8u+Ecks+ZOKQtmAfNTHyWel1EQhQIDP9UF3Ocv61AIFq9fGK2MrqPaymGtvEdwVKfTKreT8zhu8vwBB7hV2YfTrBYf5U3VhSqVpoDGT5NH9xAnaZXVEWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fChGc0hi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C544C4CEF0;
	Tue,  5 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754412931;
	bh=iFb6L5QBtgK6Jtecx2G+pkHMUbVEo5K2fnQW/Pldmvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fChGc0hiZ3jA+d0ue2T8eXZMrfcIaBUFCeiiG/89AKxJOBRUMPIc8pBVJ7VeS3VHy
	 ZeadXuAkhRa6njrAfYaSODZ2GkKjktdw/OjPdt+4gk6nhZWk63pgpSl3NsrxmiD+ZU
	 nX1t5Q/GOYpxv1Cq5egYtxxu1l2cde1DaoP87/gPY3jEZDAcyd6+YFzZIwxMlTi/Zz
	 6KhUlbsXdQb/9KaDBVoB2GmTF9Q2nnOZvkEAQYO9EeiPwoFlxJlWOLciY3ZR5o470L
	 alTgOApPNXlcy4kmZv5/Y6Nn32Kh5ME41K7YpmKJjwOeraRzQzH48f3x86f3s5cyTr
	 Qa02Bo/WdS3FA==
Date: Tue, 5 Aug 2025 22:25:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Message-ID: <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
 <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>

On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> > On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
> >> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> >>>
> >>>
> >>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> >>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
> >>>>>> support automotive use cases that require limiting the maximum Tx/Rx HS
> >>>>>> gear and rate due to hardware constraints.
> >>>>>
> >>>>> What hardware constraints? This needs to be clearly documented.
> >>>>>
> >>>>
> >>>> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
> >>>> but keep on responding to other comments. This won't help you to get this series
> >>>> merged in any form.
> >>>>
> >>>> Please address *all* review comments before posting next iteration.
> >>>
> >>> Hi Mani,
> >>>
> >>> Apologies for the delay in responding. 
> >>> I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 
> >>>
> >>> To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.
> >>>
> >>
> >> That's vague and does not justify the property. You need to document
> >> instead hardware capabilities or characteristic. Or explain why they
> >> cannot. With such form I will object to your next patch.
> >>
> > 
> > I had an offline chat with Ram and got clarified on what these properties are.
> > The problem here is not with the SoC, but with the board design. On some Qcom
> > customer designs, both the UFS controller in the SoC and the UFS device are
> > capable of operating at higher gears (say G5). But due to board constraints like
> > poor thermal dissipation, routing loss, the board cannot efficiently operate at
> > the higher speeds.
> > 
> > So the customers wanted a way to limit the gear speed (say G3) and rate
> > (say Mode-A) on the specific board DTS.
> 
> I'm not necessarily saying no, but have you explored sysfs for this?
> 
> I suppose it may be too late (if the driver would e.g. init the UFS
> at max gear/rate at probe time, it could cause havoc as it tries to
> load the userland)..
> 

If the driver tries to run with unsupported max gear speed/mode, it will just
crash with the error spit.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

