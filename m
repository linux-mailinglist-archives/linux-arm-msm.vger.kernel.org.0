Return-Path: <linux-arm-msm+bounces-45520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E39FA1629E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 16:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C96164D59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC711DF74B;
	Sun, 19 Jan 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4Pkol1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FE1DF26F
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737300345; cv=none; b=uy6y/rySZKI2aPFbcmLstPrUZSZSt8tHscXNQuahjEmfILw3MhpS7yF+70IxunDN+mH/OelTIvL1nPEYGpH1J25t7Ww4+ZoSQntYcAPQKSV6Hx32tOO0lfY/Nl1d5DgleJdSdG3wtoqBFGx5WY3Ka7s5xJwuVkE3rx58KcmrHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737300345; c=relaxed/simple;
	bh=Cy+qEt2NXA08rztWXxtWOUDQnA+zPs8tkSV/b/YP8cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJOO9OsLXdQSvGzTumrHBr5BqDfSPWvulLQnxG1LNOiVpqD0WavgaRGjXShW0faEsu/BCJ1M0FCF/dUOOTYkU8c6FF77JXgriGd0oFK41ZgYHsPgTu9ranzoQYkueiY2jFLrpx1coE/qZp0nCP6G55l3/WyHEyPmfxmEruEDFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4Pkol1d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165448243fso82858385ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737300342; x=1737905142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Xaz6uw75PCkZ9efkLrpzdDAN7b8HSpOlZoyxfAfNzA=;
        b=d4Pkol1dokuOH1MaNAvFMBMBooHtTRQ9Ysh3eHP43FUrR+2juI4Uk2/KRkKTV/Jkoa
         02qE9NKcRqMGR0F8VMDIXCdW1u7CSwG2pCeDlHsl/sPvzCvYYSLTC5nsaitlpp3GGRhp
         HfwycpvJfp1jigJXKYAA+NtiC5jEW4eVtPn1hVtIKfRvemxqH4lqXPl7R8fKQOdzoUZ2
         UBqdn0P2N4JwYL5mOVCXVBQbY6HdsIASDYtPy4mb/LchFBMnsPDR57xVAUkWJ1mC60BO
         q0/EDPwFg2NzoD4UEXFnlb+jBkpcHcjBH9ZIkrfMA4bDTuWWrzQPZyMQHmZZ13YJZPes
         nhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737300342; x=1737905142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Xaz6uw75PCkZ9efkLrpzdDAN7b8HSpOlZoyxfAfNzA=;
        b=Lf/iIvQJZ6nyEEr7W5dZU9NiciucceW9ecLfj8B8oe/dWVliqHs/zgesygj+dWoPKy
         sWEmgr+N1LHNqKrJWO03YGJEPNijpU6MXEwfD5YSGmq6ZyarPtEWBq8/fU3yTmIRBJ8v
         Lssg+d268SKO7lvEmnhL1KofoU7axV7BmlLTptcx78P5ZBPm8w8Q548oXcUi4amuU8Hv
         0Ae+wZcPVc00yy6f5xIh/fmgWcyF0P+dVMz+iReYusHTn2kvFHdJk4jO+poDo4RwLqH/
         w4HoEQbACQR8j77377xcuPvf8JZsHS8NMtOK0wjJay+T2GISkjWLDYLNWTrd8QRLsl0p
         IOCA==
X-Forwarded-Encrypted: i=1; AJvYcCXlODr48oI4kg11ae6layVuroiX5zoTjM4/5TN0OAX6STloG6VkccFtdWFGmZm8/uU3fUGJwTvyMGZd/lJr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FA71AsANQGK4In9VHSxL4aafRG9xfhqp/uX6Mrb3dPlsPLN3
	1o83wiei2BiKO3GVb+QrPE5dwFN5HHEd9h0+bKfKiFSz4Y0I4OqE4Qb4MyZinQ==
X-Gm-Gg: ASbGncsHhQw9S5Nxr6P7fotK/z2wPvb9jLnv+9nmpULkWNvhdSskxS4/DyKdazodYoE
	M6glFPf1sDLY5AblpTJGZ4UEnmMPhXL21F4ne4vw4xGqmDYdjWAdw8f7H8wJAz2HkWTuJ67hC7i
	Z+ddHY572nstz+4iB/Ug9w2TmaXOze7s5qwAfA6GnQdb46bES01QmrH7js7bl7e/1VMrU2XRXkl
	MFsEM1jx+jnn1VV6zZU0h8wHd3uoEtVSMVt5nKA8GV9GgY9JxQm3e1uL/D+lmFWameVqIO51Lm1
	Y4Rmlw==
X-Google-Smtp-Source: AGHT+IFwl8xnvKB2lpUjrtIYdeNsW1GvDBlcIZmazybTfoK6NpRu6tzeYc5RWcWJiKkCBQ9HdBR63w==
X-Received: by 2002:a05:6a20:2585:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1eb214b22c8mr14523957637.23.1737300341700;
        Sun, 19 Jan 2025 07:25:41 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e37sm5275988b3a.119.2025.01.19.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:25:41 -0800 (PST)
Date: Sun, 19 Jan 2025 20:55:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250119152534.d6berucbb2wbbi3z@thinkpad>
References: <20250115175918.2isv2at337cfgvjd@thinkpad>
 <20250115181340.GA539092@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115181340.GA539092@bhelgaas>

On Wed, Jan 15, 2025 at 12:13:40PM -0600, Bjorn Helgaas wrote:
> On Wed, Jan 15, 2025 at 11:29:18PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Jan 15, 2025 at 11:42:10AM -0600, Bjorn Helgaas wrote:
> > > On Wed, Jan 15, 2025 at 04:24:31PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Jan 06, 2025 at 05:07:05PM -0600, Bjorn Helgaas wrote:
> > > > > On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > > > > > > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > > > > > > for each controller instance. Hence, add a node to represent the bridge.
> > > > > > > > 
> > > > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > > > > > > >  1 file changed, 30 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > index 39bd8f0eba1e..fe5485256b22 100644
> > > > > > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > > > > > > >  			dma-coherent;
> > > > > > > >  
> > > > > > > >  			status = "disabled";
> > > > > > > > +
> > > > > > > > +			pcie@0 {
> > > > > > > > +				device_type = "pci";
> > > > > > > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > > > > +				bus-range = <0x01 0xff>;
> > > > > > > 
> > > > > > > Hi Mani, most or all of the patches in this series add this
> > > > > > > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > > > > > > secondary/subordinate bus numbers should be programmable.
> > > > > > 
> > > > > > Right. It is not a functional dependency.
> > > > > > 
> > > > > > > If that's the case, I don't think we need to include "bus-range" in DT
> > > > > > > for them, do we?
> > > > > > 
> > > > > > We mostly include it to silence the below bindings check for the
> > > > > > endpoint device node:
> > > > > > 
> > > > > > Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> > > > > > 
> > > > > > DTC check is happy if the 'bus-range' property is absent in the
> > > > > > bridge node. But while validating the endpoint node (if defined), it
> > > > > > currently relies on the parent 'bus-range' property to verify the
> > > > > > bus number provided in the endpoint 'reg' property.
> > > > > > 
> > > > > > I don't know else the check can verify the correctness of the
> > > > > > endpoint bus number. So deferring to Rob here.
> > > > > 
> > > > > I should know more about how this works in DT, but I don't.
> > > > > 
> > > > > I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
> > > > > sm8250: Add PCIe bridge node") added this (subsequently renamed to
> > > > > "pcieport0"):
> > > > > 
> > > > >   +			pcie@0 {
> > > > >   +				device_type = "pci";
> > > > >   +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > >   +				bus-range = <0x01 0xff>;
> > > > > 
> > > > > which is used at places like
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:
> > > > > 
> > > > >   &pcieport0 {
> > > > > 	  wifi@0 {
> > > > > 		  compatible = "pci17cb,1101";
> > > > > 		  reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > 
> > > > > Based on
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
> > > > > (which is written for Root Ports and Switch Ports, but presumably
> > > > > applies to endpoints like wifi as well), "reg" contains the device's
> > > > > bus/device/function:
> > > > > 
> > > > >   - reg:
> > > > >      Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
> > > > >      document, it is a five-cell address encoded as (phys.hi phys.mid
> > > > >      phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
> > > > >      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> > > > > 
> > > > > So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.
> > > > > 
> > > > > I don't know the reason for requiring the BDF there, but the venerable
> > > > > https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
> > > > > 4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
> > > > > entry must be the config space address (bus/device/function).
> > > > > 
> > > > > I suppose maybe the BDF is needed to associate the properties with the
> > > > > correct device, and if the OS were to reprogram the bridge secondary
> > > > > bus number, it would have to remember the original value to preserve
> > > > > this association.  I don't think Linux *does* remember that, but it
> > > > > also generally leaves the bridge bus numbers alone.
> > > > 
> > > > Device drivers need to parse the properties defined in the device DT
> > > > node. And the only way to identify the node is by using its 'reg'
> > > > property which has the BDF identifier. This is common to other
> > > > busses where the device address is encoded in the 'reg' property.
> > > 
> > > Does this assume there is some firmware to configure these bridges
> > > before Linux boots?
> > 
> > No.
> > 
> > >  If bridges are completely unconfigured after
> > > power-on, their secondary and subordinate bus numbers will be zero, so
> > > a bus-range property for the bridge can only be an assumption about
> > > what Linux will do.
> > 
> > Secondary bus number for sure is not an assumption as it depends on
> > the hardware topology which linux would know from DT. But
> > subordinate number could be considered as an assumption.
> 
> If there's no firmware and the secondary bus number is 0 when Linux
> enumerates the bridge, does Linux know how to get the bus-range from
> DT and program the bridge's secondary bus?
> 

Linux doesn't seem to make use of the secondary bus number from DT node of a
bridge, but there is no guarantee that other OSes making use of DT won't do.

> And does Linux know how to update the subordinate bus number in the
> case where several Root Ports specify 0xff in bus-range?
> 

Same answer as above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

