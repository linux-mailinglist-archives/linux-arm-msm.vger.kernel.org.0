Return-Path: <linux-arm-msm+bounces-84126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CFC9D0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 22:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC02F345902
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F572FA0C7;
	Tue,  2 Dec 2025 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apIq6Eu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B572F7477;
	Tue,  2 Dec 2025 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764710302; cv=none; b=FlxZlv8bt/Wnw6eKnxmAvX+EO25LkXTK9j+bjgX/4bWqcBiLEGp5lok+5QuDA7fPSq5zyRh05TtXJZ0Z30eX7gLS80eWqwXQRxaDH+qvDYC6jK+REb+H2Ki5RMzIihNrYOOq7+TlFqAWdT9U51WUej4QHSAIcsdGKeEgYNnlAAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764710302; c=relaxed/simple;
	bh=YFM2cxZcv2UyDIZhiZRaswSKfa8FG/AGYGWGXKFy6pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVTh/tUMVIvTHoRNCkEW8yNR2T1FZ07TLFniDYh1ydSs4IBqJUeSsPwYPsNqRNdNLybRJpNqVPfTqC0LoUZrPgA7FB4heFlOn05TD9KNSFL9zay87Q0cnqIl0wOHTV8PUqSKRKyD52sbR0euPq6Zhb+9JGNA5gW2/UXTWZnx4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apIq6Eu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D861C4CEF1;
	Tue,  2 Dec 2025 21:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764710301;
	bh=YFM2cxZcv2UyDIZhiZRaswSKfa8FG/AGYGWGXKFy6pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apIq6Eu7/dumtpy2aPu6aD5lBwFl+8n96QeTLrw8E4aatlhNzq+O+9KDSmN0iP3K3
	 aDtw0mAt4SOx4ZK+fRs9y3t8eR1U7h8YAqEZRzsNANDl7PzUo9cPLG2c8JXU7UIpGR
	 tffhj0DXe8z6T7AZGq12F6HKVKeejqOIBSH0sxv4HqvFCvw2hyHdU3eZZBWc/FXeiA
	 3Hxi1GXNwydaThZyDl52KkzFn0W5xMfSJGBDoitaOfasx7byqF61RPs6O4VHr7eI2X
	 DzjtydqTwevQ3+FGHg4Rw6HvAafJ6kS6Y5mYS0AtEQ7jMWn/RC2hYfj1E4VryXAtIQ
	 aHAEwylapr/Sw==
Date: Tue, 2 Dec 2025 15:24:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>

On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
> 
> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
> > On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
> > > On 21/11/2025 11:37, Mukesh Ojha wrote:
> > > > > Sorry.
> > > > > 
> > > > > Did we actually come up with a cogent reason to omit the video firmware
> > > > > loading here ?
> > > > > 
> > > > > AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> > > > > getting video stuff done and storing up trouble.
> > > > > 
> > > > > What exactly is the blockage - is it something you want help with ?
> > > > I replied to you here[1] and given my reason..till something concluded on
> > > > "multi-cell IOMMU[2]", I can not add video and block what is working
> > > > already.
> > > > 
> > > > [1]
> > > > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
> > > > hyd.qualcomm.com/
> > > 
> > > Why though ?
> > > 
> > > You are mixing together the issue of multiple SIDs and the original loading
> > > of firmware which could easily reuse the venus method of
> > > 
> > > &iris {
> > > 	video-firmware {
> > > 		iommus = <&apss_smmu hex>;
> > > 	};
> > > };
> > 
> > I completely understand what you are saying, and it would be very easy
> > for me to do that if it gets accepted. However, I doubt that the people
> > who raised this concern would agree with the approach.
> > 
> > I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
> > banks separately. I’ll leave this to @Vikas to answer.
> 
> Not exactly as a separate sub-node, but i do like the idea of introducing a
> simple iommu property, something like this, which Stephan proposed earlier
> in the discussion [1]
> 
> firmware-iommus = <&apps_smmu ...>;
> 
> I understand that we are doing the iommu-map thing, but a property
> exclusively for firmware like above look much simpler to me.
> 

"We know we need to find a generic solution to this very problem, but
while we work on that let's add this quick hack to the ABI"?

> Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back video
> in this series. Please share your thoughts on this.
> 

Please let's keep these concerns separate, so that we don't hold this
series up further. Even if we choose to go by the subnode approach, in
the same time frame, it's better to discuss it separately.

Regards,
Bjorn

> Regards,
> Vikash
> 
> [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
> 
> > 
> > Also, I do not want the video PIL discussion to be part of this series, as it could
> > unnecessarily give the impression that this series depends on it.
> > 
> > > 
> > > That binding got dropped because it was unused in Iris.
> > > 
> > > https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
> > > 
> > > I still fail to see why we are waiting for multi-cell IOMMU to land, when it
> > > is expected to and what the VPU enablement story is upstream in the
> > > meantime.
> > > 
> > > Blocked it seems.
> > 
> > No, it is ongoing, there will be next version coming.
> > 
> > > 
> > > ---
> > > bod
> > 
> 

