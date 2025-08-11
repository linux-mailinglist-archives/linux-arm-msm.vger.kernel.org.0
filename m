Return-Path: <linux-arm-msm+bounces-68280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7FB20350
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2C83AE3B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DC72DCBFA;
	Mon, 11 Aug 2025 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVlqBo7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86022DCF56;
	Mon, 11 Aug 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904443; cv=none; b=LGbXfNFJXp+s9TAa1peQjlizz5DUneocS2+4vEfYWiTG1AOvu8ybz0dHfShZFGeWZ5zhr4yhGZj/bWJNzVxK/Ek+nEwr8dAOuJPd4YUKeBIhO86il0s8s6BAnkyDkwrStQxDNRoXBYmnE2IIIh2FeYE8L9zpU8nwXm3ku99UGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904443; c=relaxed/simple;
	bh=nYxKt1rZvSS9uUfdxtSyz/NQBRYpnYSweI3wcyJvXAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewsX1TfSxNVpcB65Je1SR/vFvIyXrCI8Mpu6KxZiTsiuThZUq04atOd5ucmLwBf6Bdfs1VZkUQmZS2fGLsZuaA2qjmbBewqA9VRI9vCHMwgD+PRTx1+bkVYpX24pdBNLCDXE9EoFXZUbtCTO4cNgOodQEAbVgGu+AP5StnECsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVlqBo7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F47C4CEF1;
	Mon, 11 Aug 2025 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754904442;
	bh=nYxKt1rZvSS9uUfdxtSyz/NQBRYpnYSweI3wcyJvXAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVlqBo7/xK8IBQljnNKIRqz5UoHE3Oz+MXQ1c89EalL+8PORlU0o4ZGWGhrrbjvei
	 qPf6x2ilwRTgK5kmg/UybHLvu3XeACwPaXxmB6LOhx9LxBY1wP+0cT+l5b9oQrd104
	 e4hhLOTeVjga+cX19wfLRCYnSKjhc6taPwM4njHO7dOSoDNr17yMhjcUEqCOcP++jy
	 h6zxLFFPy6X6t0E13L8u+qyyF4/DZYvG0D3IkifITKKNTF4nsYFysL19mcfKzU5Cfe
	 0A37B12wupzFwdfCPm2/HUnpdnPRNFPkenx45WkF81M8vzO1DStt/fpl91nR3jALJp
	 ZrHMAxtdQSxSQ==
Date: Mon, 11 Aug 2025 14:57:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
Message-ID: <5se3wgpfabzlcidflef5orwtl62jk2dtg4lx47gnqcqn7mya46@i6zir5uny7gi>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
 <40ace3bc-7e5d-417a-b51a-148c5f498992@quicinc.com>
 <2a7bf809-73d9-4cb6-bcc9-3625ef1eb1fa@kernel.org>
 <kayobeddgln5oi3g235ruh7f7adbqr7srim7tmt3iwa3zn33m4@cenneffnuhnv>
 <5a32e933-03b9-4cc3-914c-46bdb2cedce6@kernel.org>
 <54gttzkpxg55vrh5wsvyvteovki377w3yjfejjddpzzrvldwkg@p7sc4knnvla3>
 <4fa9074e-609a-42aa-975a-a6daa7dd6d42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fa9074e-609a-42aa-975a-a6daa7dd6d42@kernel.org>

On Fri, Aug 01, 2025 at 06:09:18PM GMT, Krzysztof Kozlowski wrote:
> On 01/08/2025 17:33, Manivannan Sadhasivam wrote:
> > On Fri, Aug 01, 2025 at 04:20:37PM GMT, Krzysztof Kozlowski wrote:
> >> On 01/08/2025 14:24, Manivannan Sadhasivam wrote:
> >>> On Thu, Jul 31, 2025 at 10:38:56AM GMT, Krzysztof Kozlowski wrote:
> >>>> On 31/07/2025 10:34, Ram Kumar Dwivedi wrote:
> >>>>>
> >>>>>
> >>>>> On 31-Jul-25 12:15 PM, Krzysztof Kozlowski wrote:
> >>>>>> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
> >>>>>>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
> >>>>>>> on the Qualcomm SM8650 platform by updating the device tree node. This
> >>>>>>> includes adding new register regions and specifying the MSI parent
> >>>>>>> required for MCQ operation.
> >>>>>>>
> >>>>>>> MCQ is a modern queuing model for UFS that improves performance and
> >>>>>>> scalability by allowing multiple hardware queues. 
> >>>>>>>
> >>>>>>> Changes:
> >>>>>>> - Add reg entries for mcq_sqd and mcq_vs regions.
> >>>>>>> - Define reg-names for the new regions.
> >>>>>>> - Specify msi-parent for interrupt routing.
> >>>>>>>
> >>>>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >>>>>>> ---
> >>>>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
> >>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>> index e14d3d778b71..5d164fe511ba 100644
> >>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>> @@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
> >>>>>>>  
> >>>>>>>  		ufs_mem_hc: ufshc@1d84000 {
> >>>>>>>  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> >>>>>>> -			reg = <0 0x01d84000 0 0x3000>;
> >>>>>>> +			reg = <0 0x01d84000 0 0x3000>,
> >>>>>>> +			      <0 0x01da5000 0 0x2000>,
> >>>>>>> +			      <0 0x01da4000 0 0x0010>;
> >>>>>>
> >>>>>>
> >>>>>> These are wrong address spaces. Open your datasheet and look there.
> >>>>>>
> >>>>> Hi Krzysztof,
> >>>>>
> >>>>> I’ve reviewed it again, and it is correct and functioning as expected both on our upstream and downstream codebase.
> >>>>> I think it is probably overlooked by you. Can you please double check from your end?
> >>>>>
> >>>>
> >>>> No, it is not overlooked. There is no address space of length 0x10 at
> >>>> 0x01da4000 in qcom doc/datasheet system. Just open the doc and look
> >>>> there by yourself. The size is 0x15000.
> >>>>
> >>>
> >>> The whole UFS MCQ region is indeed of size 0x15000, but the SQD and VS registers
> >>> are at random offsets, not fixed across the SoC revisions. And there are some
> >>> big holes within the whole region for things like ICE and all.
> >>>
> >>> So it makes sense to map only the part of these regions and leave the unused
> >>> ones.
> >> Each item in the reg represents some continuous, dedicated address
> >> space, not individual registers or artificially decided subsection. The
> >> holes in such address space is not a problem, we do it all the time for
> >> all other devices as well.
> >>
> >> You need to use the definition of that address space.
> >>
> > 
> > What if some of the registers in that whole address space is shared with other
> > peripherals such as ICE?
> 
> 
> It will be a different address space. We don't talk about imaginary
> 3rd-party SoC. Qualcomm datasheet lists address spaces in very precise
> way. We were recently fixing all address spaces for remoterpocs based on
> that.
> 
> > 
> > I agree with the fact that artifically creating separate register spaces leads
> > to issues, but here I'm worried about hardcoding the offsets in the driver which
> > can change between SoCs and also the shared address space with ICE.
> 
> Drivers are expected to hard-code offsets and all drivers do it. Look at
> display, sound codecs (both SoC and soundwire devices). Everything
> hard-coded offsets internal to address space.
> 
> What you essentially want is (making it border case) "reg" per register.
> 

I was worried about the ICE overlap, but I got access to the documentation and
verified myself (also with Nitin) that there is no ICE overlap. So yes, we can
map the entire MCQ region and live with the hardcoded offsets.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

