Return-Path: <linux-arm-msm+bounces-84860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE05CB1BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 03:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E5D3060A42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3FC26E71E;
	Wed, 10 Dec 2025 02:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="cB1C0omI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8F8C1F;
	Wed, 10 Dec 2025 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765334517; cv=pass; b=oe9O6XSfdyNi/QD6OPYel6qmTmulo5jPEtiL1iKj0BK44d3oBkD6+VLWec2P6CrgA0AMTOPNSGE9Dwf9gR4xkCwx/kx8OLB1IKZngrEX+NWvuBeFTZ3aJ+kDwpTNlz45cpN6ryZ+HZ6mfPcX9P74Zro2UXPATKP9puqgIG+YZFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765334517; c=relaxed/simple;
	bh=hZ8pvp6kNLVe6K2JsJTXt0IAqhgo7AtOcTDP28mTUzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7SS9jPD8lNt7zs0b9092cid4YbqEBXu5TTyPTSnnCiNknln/+w7JTCgPlNvUvUBSZn6XW4207cB13tPwrRDKHfHmoqWVqjMrxrfWn2WEILXs0kuPpNmac6pjF8a3qQhQD4+5Nu5ORQvTmlKXFeH8qR8jyIRrCmXofPu7ZaCk9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=cB1C0omI; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1765334500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GPOCJIqR+6YDi0UN3Is6LK5Kwt7piFibOVR9PBGOj7QiklFwAkwy92MnpVbDACDDI/DobJVtaBucXflMw4u50ZgerSNiwtrYezoq3ayHagt7rmbmZFyFTy8CbcGZLd8w9Igw48VaE1mh87IdCx1ywOu6C1/7eF+1cDodAiFm+kE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765334500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CKn7/g8UpxEQoZv4pbVapdyGLwvm12PyezsMJf0IWsA=; 
	b=lpm/Bjytk08HU4CbeupmDzZLFNuMy+I/ojf4kPLcU+YgyOvHBuP4VT/q9UMsnrgcWtsfbxOq2gtkWok5G5Jk7YsjBbbxRlXiZzeCXNCGm9mC6ymIzbI+v7f8yrvyBikCb1zkQovBtOlk2nMULDjql7azmdN2QlDr9cFrszyPq4k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765334500;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Feedback-ID:Message-Id:Reply-To;
	bh=CKn7/g8UpxEQoZv4pbVapdyGLwvm12PyezsMJf0IWsA=;
	b=cB1C0omIVrQhrubbFlgPTYScgIme3vD3BGC3L4cP3EKC5I6Bgln7Tm3QSNDBiQEG
	lcPZTuFhh4V3Wq1D68Ik9GP1O/9MvW40N3TzjEDLjcR3lyG2f6k5uTuC/5T1mfgSnIK
	L5lFFfYyF5d6CYI3HhZ2cSbaHpCim2mQXYeTqqSc=
Received: by mx.zohomail.com with SMTPS id 1765334498407551.7200531943936;
	Tue, 9 Dec 2025 18:41:38 -0800 (PST)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct
 ipa_fw_mem for the driver to load successfully
Date: Wed, 10 Dec 2025 10:41:27 +0800
Message-ID: <3393067.44csPzL39Z@debian-vmware>
In-Reply-To: <vlz4zg6wnxvxz2hqpzinzxztghwxmx2wwkxl4ami42aqvdjkg5@7o4fvadz76cv>
References:
 <20251208031511.3284-1-newwheatzjz@zohomail.com>
 <20251208031511.3284-3-newwheatzjz@zohomail.com>
 <vlz4zg6wnxvxz2hqpzinzxztghwxmx2wwkxl4ami42aqvdjkg5@7o4fvadz76cv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Feedback-ID: rr080112275dc2e79c4c233296be36c59f0000bf71c2fcddf7ad100df2feb3f499433d71f7c7a452cea650cf:zu080112271cae571641a086572e9bd3070000d33e1218b8860d765062af9fd6121e8dfb4190633b7157b237:rf0801122c8525524b3709c9502ba5a6bb0000b40973b64f6a26713a6eb725448fc71309f26804e74aeb7a0ab234d53f2c:ZohoMail
X-ZohoMailClient: External

On Wednesday, 10 December 2025 07:08:41 CST, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 11:15:11AM +0800, Jingzhou Zhu wrote:
> > The ipa driver refuses to load with the old ipa_fw_mem in newer kernels.
> > Shrinking its size to 0x5a000 fixes the problem.
> > 
> > Fixes: aab69794b55d ("arm64: dts: qcom: Add support for Huawei MateBook E 2019")
> > 
> > Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
> 
> There should be no empty lines between tags.
> 

Understood.

> > ---
> >  arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> > index a5f025ae7dbe..f04865381870 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> > @@ -144,12 +144,12 @@ wlan_msa_mem: wlan-msa@8c400000 {
> >  		};
> >  
> >  		ipa_fw_mem: ipa-fw@8df00000 {
> > -			reg = <0 0x8df00000 0 0x100000>;
> > +			reg = <0 0x8df00000 0 0x5a000>;
> >  			no-map;
> >  		};
> >  
> > -		gpu_mem: gpu@97900000 {
> > -			reg = <0 0x97900000 0 0x5000>;
> > +		gpu_mem: gpu@8df5a000 {
> 
> Why are you adjusting gpu_mem?
> 

In sdm845.dtsi, ipa_fw_mem is followed by gpu_mem, so I moved gpu_mem to
0x8df5a000 since the memory was freed after shrinking ipa_fw_mem size.
I'm not sure whether the order matters, but I think it's best to follow
how they are arranged in sdm845.dtsi.

Also, this change didn't seem to cause problems according to my testing.

> > +			reg = <0 0x8df5a000 0 0x5000>;
> >  			no-map;
> >  		};
> >  
> 
> 





