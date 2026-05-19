Return-Path: <linux-arm-msm+bounces-108479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOYYKu9JDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:30:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A757DA48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FDA0303DAEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5FE496911;
	Tue, 19 May 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/1vH08o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819C49218A;
	Tue, 19 May 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189928; cv=none; b=Ob+vef6ljqVMXvBpKcopESBDQqt9A8RhYE4Rr4ne7G4QpiQIp4pFI61+bWY+eURraKmoCHVs5Srwyu5MwCDwR43aFTNcYeqBuBXT25Yjb9M38hKkopaDvBPem2+qEd801pM7AGLXblQN+00vE4+mv0pokKIO6XTF3wW4s0KoJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189928; c=relaxed/simple;
	bh=EmqHJcTGfASrppByPNtgHT7+wLU6xgPxfMGzfAsp/v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qObaZTYrNXSFi09mDJSNTlqqt5K8PEuSQdxQaDcdueRhUbL4W8I8ltoZKM68PNsayChgmWS/KwsRGk0PbXh9kdj4V7xwBFpZs+u122rfSlIpquCKMJJNDYiNzrLVzOYnIkN1duVbqjinVI9Iawuw7zBcq8AlOMHzdjQSeNh9iYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/1vH08o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D6DC2BCC6;
	Tue, 19 May 2026 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189928;
	bh=EmqHJcTGfASrppByPNtgHT7+wLU6xgPxfMGzfAsp/v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/1vH08oGe7srABj7rJQon0MMMA/hIpQYg9F2qsl9fvZ6jq0W79JsgbF3/HBTC2M/
	 9p7XOxGUD6txRU4y8KiCAgGMZTc3T/ZI4v4M17VIGRTtmzftZGGLxzOQxN3x6Z615E
	 0T1hgMibmcsGxVeBAFHg4ZufokiI4dbmijuNloMZQgo3YVk97bgVpTZr3ccXOltPFl
	 6wwRxpmGlizdhbQ7B22vZsG5HwFDhVlLVhTdunQ+8WJlptoy4Zk44CYKdXycgOswtg
	 vwRrm4xQcn4grOPF0B08F5tlsY4wBTVylJXICYi3J5UD+DjlWnL2ApA5oRyw8nyP41
	 +mqlbokrxz+Pw==
Date: Tue, 19 May 2026 16:55:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <4byxm3ybi5eqrsqmqi6u4abd37uxliagyolsqs6rtrexut6p5f@uotbli3vh6ja>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
 <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
 <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
 <agq/Hl8qWn6wpbF4@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agq/Hl8qWn6wpbF4@hu-qianyu-lv.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108479-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0C3A757DA48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 12:26:22AM -0700, Qiang Yu wrote:
> On Mon, May 18, 2026 at 09:00:33AM +0200, Krzysztof Kozlowski wrote:
> > On 18/05/2026 05:50, Qiang Yu wrote:
> > > On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
> > >> On 17/05/2026 07:39, Qiang Yu wrote:
> > >>> On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> > >>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> > >>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > >>>>> required by clkref clocks.
> > >>>>>
> > >>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > >>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > >>>>> differ. Document them here for qcom,glymur-tcsr.
> > >>>>>
> > >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > >>>>> ---
> > >>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> > >>>>>  1 file changed, 57 insertions(+)
> > >>>>>
> > >>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > >>>>> index 1ccdf4b0f5dd..57921cb63230 100644
> > >>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > >>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > >>>>> @@ -51,6 +51,63 @@ properties:
> > >>>>>    '#reset-cells':
> > >>>>>      const: 1
> > >>>>>  
> > >>>>> +  vdda-refgen-0p9-supply: true
> > >>>>> +  vdda-refgen-1p2-supply: true
> > >>>>> +  vdda-qrefrx0-0p9-supply: true
> > >>>>> +  vdda-qrefrx1-0p9-supply: true
> > >>>>> +  vdda-qrefrx2-0p9-supply: true
> > >>>>> +  vdda-qrefrx4-0p9-supply: true
> > >>>>> +  vdda-qrefrx5-0p9-supply: true
> > >>>>> +  vdda-qreftx0-0p9-supply: true
> > >>>>> +  vdda-qreftx0-1p2-supply: true
> > >>>>> +  vdda-qreftx1-0p9-supply: true
> > >>>>> +  vdda-qrefrpt0-0p9-supply: true
> > >>>>> +  vdda-qrefrpt1-0p9-supply: true
> > >>>>> +  vdda-qrefrpt2-0p9-supply: true
> > >>>>> +  vdda-qrefrpt3-0p9-supply: true
> > >>>>> +  vdda-qrefrpt4-0p9-supply: true
> > >>>>
> > >>>> Either I do not understand your previous explanation:
> > >>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> > >>>>
> > >>>> or this is still wrong. There is no TCSR here, so this proves nothing.
> > >>>> If TCSR is TX0, then you do not have five of them...
> > >>>>
> > >>>> My previous comment stay - you are not describing the actual hardware
> > >>>> here.
> > >>>>
> > >>> The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
> > >>> as the QREF block, and each component is controlled by the tcsr_clkref_en
> > >>> registers.
> > >>
> > >> Still no clue what this -> relation is. Again, describe the hardware.
> > >>
> > >>>
> > >>> If a PHY receives its reference clock from QREF, it will have a clkref_en
> > >>> register. However, this register may be located in different regions
> > >>> depending on the target. On glymur it resides in TCSR, so I added these
> > >>> LDOs QREF required in tcsr yaml.
> > >> Registers are not described as supplies.
> > > 
> > > I'm not descirbing register as supply.
> > > 
> > >     tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
> > >        |             |           |        |           |
> > >        |             |           |        |           |
> > > CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
> > >        |             |           |        |           |
> > >        |             |           |        |           |
> > >        ---------------------------------------------------tcsr_clkref_en
> > > 
> > > These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
> > > register, and they require power supplies.
> > 
> > So I told you more than once - none of these are supplies to the TCSR.
> > You clearly misunderstand what a supply is.
> >
> 
> The TCSR binding here describes the tcsr_clkref_en clock gate, not the
> TCSR register block itself. The clock gate controls whether the reference
> clock is forwarded through the QREF chain to the PHY.
> 
> The QREF components (TX/RPT/RX) sit between the clock gate and the PHY.
> They require LDO supplies to operate, and those supplies must be enabled
> before the clock gate is asserted and disabled after it is deasserted.
> This enable/disable sequencing is the responsibility of the clock gate
> driver, not the PHY driver.
> 
> Since the supplies are managed as part of the clock gate operation, they
> are modeled as properties of the clock gate node. The node happens to live
> in TCSR on glymur, but the supplies describe what the clock gate needs to
> do its job, not what TCSR itself needs.
> 

Just to add a bit more context:

The QREF block supplies the reference clock to the PHY IPs. But the digital
logic (register interface) to control this QREF block lives inside TCSR in some
SoCs like Glymur. But AFAIK, the analog QREF circuitry is not inside TCSR, but
somewhere near to PHYs.

Also, QREF needs its own LDOs to operate and supply reference clocks to PHYs.
Initially, we tried to add these QREF supplies to PHY node itself. But that was
pushed back by Johan [1]. His argument was that since these LDOs power QREFs,
not the PHY IPs, these supplies should not be added to the PHY nodes. And since
we do not have a dedicated QREF DT node due to the fact that the QREF registers
gets moved between various IPs based on the available space in the RTL. (It used
to live in GCC, but now it is in TCSR and in the future it could be in some
other IPs. Unfortunately, we cannot control this design)

So he suggested to add these supplies to TCSR node which acts as a control
interface to QREF, even though it is not an accurate hw representation either.

And this patchset is based on that feedback only.

But your argument is also valid that these supplies are not supplying the TCSR
block in hw, but just the QREF analog circuitry living close to PHY.

We are open to suggestions here as we do not know what is the accurate hardware
description for these supplies/QREF.

- Mani

[1] https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/

-- 
மணிவண்ணன் சதாசிவம்

