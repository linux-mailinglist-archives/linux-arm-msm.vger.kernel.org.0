Return-Path: <linux-arm-msm+bounces-26002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20B92F014
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 22:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7C92836CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 20:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A9314F121;
	Thu, 11 Jul 2024 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP4iRO7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2EA12E1CA;
	Thu, 11 Jul 2024 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720728236; cv=none; b=ig1LLWlSS46y+OQPVB7JZB+jzSHdW5/4qBRELbWuXo2LGTLki5V3q/3wTzGlC8I79ohDaYYjc5D/MKZ6KRZ+QPgR75wChTGtSAN+4AP2aNklzPXlIy+tfCAlbunzRU8JJyWLPNPZU7ZDj8PckP2xDVMvKerApOSFauGpkLrWI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720728236; c=relaxed/simple;
	bh=MydOLmn4tsc58jf8mTfT8rJyt1fE6WW3Aq9AAAEZl2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWSNlS569Tu0FYWLDNMNRQGJZdNAP6nKo5DZM2t7YP69me8CWJbw42W98KQW3wAqeUSrZ5hWNkjlfBeOCJe39Nd7plGO9+XYW5OWwRbXQhDhaCRu5EFGprevEgDvlbsqJEHyge9ZETXfiJr4CQ2Z7NNRTKl47DHGORL02NysOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP4iRO7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2143C116B1;
	Thu, 11 Jul 2024 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720728236;
	bh=MydOLmn4tsc58jf8mTfT8rJyt1fE6WW3Aq9AAAEZl2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP4iRO7DI8ej5/jS7utl7rgggWNrTey+CR14BQ4luX8o90XEkEdFFcHe1aOerXyxS
	 6kdWR2fxDdvmER8g+QNZHZcffxbSH2bVW8lgXvVQwBm41SrYlswEdAWMRbv7q2QlS1
	 1j63usIMpld4T8YqOa4KzvsV8wFbBeBMUKlSmTnODLbJ9yAXTlqpg9YjYdGL/jKj7m
	 uRsVWbCrovYIBnktPDDuPgLeAh5qWAojN8fTA+yl4HSJASPglUDh3gMdWh8bohoy42
	 xsIanflSye/FxkiceKajZsZ1wilnKNA9C71quwlOM4KA/Bky5HxSum8k3fss0Fm1Or
	 I+ZieGL80dNfQ==
Date: Thu, 11 Jul 2024 14:03:54 -0600
From: Rob Herring <robh@kernel.org>
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for QCS9100
Message-ID: <20240711200354.GA2482879-robh@kernel.org>
References: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
 <20240710162745.GA3212156-robh@kernel.org>
 <3b8684f0-c89d-1a76-6bc5-93ced59dc51c@quicinc.com>
 <51302de0-5e4c-4e2a-85a0-e22549baa13c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51302de0-5e4c-4e2a-85a0-e22549baa13c@quicinc.com>

On Thu, Jul 11, 2024 at 06:05:57PM +0800, Aiqun Yu (Maria) wrote:
> 
> 
> On 7/11/2024 12:45 AM, Trilok Soni wrote:
> > On 7/10/2024 9:27 AM, Rob Herring wrote:
> >> On Tue, Jul 09, 2024 at 08:46:19PM +0800, Tengfei Fan wrote:
> >>> Document the compatible string for USB phy found in Qualcomm QCS9100
> >>> SoC.
> >>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> >>> platform use non-SCMI resource. In the future, the SA8775p platform will
> >>> move to use SCMI resources and it will have new sa8775p-related device
> >>> tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
> >>> non-SCMI based USB phy.
> >>>
> >>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>> ---
> >>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> >>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> >>> While the QCS9100 platform is still in the early design stage, the
> >>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> >>> mounts the QCS9100 SoC instead of the SA8775p SoC.
> >>>
> >>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> >>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> >>> The QCS9100 device tree patches will be pushed after all the device tree
> >>> bindings and device driver patches are reviewed.
> >>
> >> I'm not convinced this is not just pointless churn. Aren't we going to 
> >> end up with 2 compatible strings for everything? SCMI should just change 
> >> the providers, but otherwise the consumers are the same. I suppose if 
> >> clocks are abstracted into power-domains (an abuse IMO) then the 
> >> bindings change.
> >>
> >> Why do we need to support both SCMI and not-SCMI for the same chip?
> > 
> > IOT SKU of this SOC is using the non-SCMI solution and Auto SKU
> > of this SOC is using the SCMI based solution due to additional
> > safety requirements. 
> 
> More add-on information, IOT SKU which have qcs9100 soc mounted will
> have firmware releases which support non-scmi solution.
> And AUTO SKU which mounted with SA8775p will have different firmware
> releases which support SCMI solution.

Yes, I understand the difference. My question is why should upstream 
support that? Normally, I wouldn't notice or care, but the churn of 
renaming everything makes me notice. Why do the maintainers need to 
review all these extra changes because QCom couldn't figure out their 
plans?

So after you duplicate all the compatible strings, what's next? Changing 
all the SA8775p bindings which is an ABI break? Presumably, some 
bindings may not change at all? In that case, you don't need any rename.
I have no visibility into what's coming next, so please educate me.

The minimal amount of changes here is you are stuck with the existing 
identifiers for the non-SCMI SKU. Then you can add a "new SoC" for the 
SCMI SKU. You might not like the names now, but you picked them and are 
kind of stuck with them.

Rob

