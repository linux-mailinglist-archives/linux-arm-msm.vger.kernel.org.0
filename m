Return-Path: <linux-arm-msm+bounces-92430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HbpEb7limnvOgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:01:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3911819D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF47E301A388
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE5E33B96B;
	Tue, 10 Feb 2026 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRJWNApf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0C30F7E9;
	Tue, 10 Feb 2026 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770710451; cv=none; b=QPxk9w+UEOpBVBBARxrEz1EwIo0HQ/1tPprBPgGTOu2Fn+sFp6A5pI3g4OrLzpSINkT/dGGGH0guYy8mdpo+gE+gpyEsFUwpun2ZtXQcvBwvoVvtUTzrs5aQvedq9+t4TCTTNzUK6IHdBznax5vDZ8xGuU9E+zVDWZQfTjRcY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770710451; c=relaxed/simple;
	bh=BQ7YlUN7nsR3RFqXgEN25MMYzjMLZjggpM2czFucdqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDx1zJus3X99ezn0RDJA5i7t3zrtzETvwkjeSHCkD7fe/RnTpjTq8C0A4HQOTrA5wSrhWeJUxO4L+YVJBrHt9GIjJrtRqWO6+fSA7llPsCzzh2LDxqb/WeWuk9iAVNq1Cm55FnzW3drNDd9sfaA+5MD6ieSyx07I8wJfL2hM0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRJWNApf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8860C116C6;
	Tue, 10 Feb 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770710451;
	bh=BQ7YlUN7nsR3RFqXgEN25MMYzjMLZjggpM2czFucdqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRJWNApfHrcEU7PG/4drYnopFLAli093yUHtGB0AGnLHQjYkKpKj6L1CiGKFCDvJ5
	 AgII0mO7VNDKZWR+kyc8yPNf/BxcUxxOCtBATTexT3soyAIILSwHMzWWntss7q7q2Q
	 gYHyDIamDj25g6I3etMSx1ElwcGQX0G2GTdnIa2000iQgleF9yI+LXPK9e6/0VqiWC
	 1T/ibwENw69v4N7XRM7n5b2x8uVWgSzfYXNhzTRPc+WPBWFPIis7RVluUNmZ0C7Opt
	 cbIYqJ5ByFKl2QtkSaDIsr8X6nFZ7Wqmw6us+i6fKU96uWkxMkT+TUXUlVfS4515oA
	 5q6uq/IoTZRpA==
Date: Tue, 10 Feb 2026 13:30:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [[PATCH]] arm64: dts: qcom: hamoa: Enable cpufreq cooling devices
Message-ID: <2zsmrw4qg2alcwsdjzl3x7rew324c7lgt35pa4ewla3swkrre3@botpuhebbsmo>
References: <20260128053208.3240189-1-gaurav.kohli@oss.qualcomm.com>
 <iq2cirb4axawir4a7yjm5okf32ptzwdrvovji7tp2hdzmui7qg@pidosokrykgi>
 <4454b03d-9e1d-42a9-a8e6-177e3848a366@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4454b03d-9e1d-42a9-a8e6-177e3848a366@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92430-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0E3911819D
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:13:44AM +0530, Gaurav Kohli wrote:
> 
> 
> On 2/3/2026 11:21 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jan 28, 2026 at 11:02:08AM +0530, Gaurav Kohli wrote:
> > > Add cooling-cells property to the CPU nodes to support cpufreq
> > > cooling devices.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > 
> > FYI: I submitted the similar version back in October:
> > https://lore.kernel.org/linux-arm-msm/20251015065703.9422-1-mani@kernel.org/
> > 
> 
> Hi Mani,
> 
> thanks for sharing this link. Could you please respin your patch. So that it
> can get merged? we need this cpufreq support enabled.
> 

Done: https://lore.kernel.org/linux-arm-msm/20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com

- Mani

> > - Mani
> > 
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index db65c392e618..799e405a9f87 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -75,6 +75,7 @@ cpu0: cpu@0 {
> > >   			next-level-cache = <&l2_0>;
> > >   			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   			l2_0: l2-cache {
> > >   				compatible = "cache";
> > > @@ -91,6 +92,7 @@ cpu1: cpu@100 {
> > >   			next-level-cache = <&l2_0>;
> > >   			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu2: cpu@200 {
> > > @@ -101,6 +103,7 @@ cpu2: cpu@200 {
> > >   			next-level-cache = <&l2_0>;
> > >   			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu3: cpu@300 {
> > > @@ -111,6 +114,7 @@ cpu3: cpu@300 {
> > >   			next-level-cache = <&l2_0>;
> > >   			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu4: cpu@10000 {
> > > @@ -121,6 +125,7 @@ cpu4: cpu@10000 {
> > >   			next-level-cache = <&l2_1>;
> > >   			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   			l2_1: l2-cache {
> > >   				compatible = "cache";
> > > @@ -137,6 +142,7 @@ cpu5: cpu@10100 {
> > >   			next-level-cache = <&l2_1>;
> > >   			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu6: cpu@10200 {
> > > @@ -147,6 +153,7 @@ cpu6: cpu@10200 {
> > >   			next-level-cache = <&l2_1>;
> > >   			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu7: cpu@10300 {
> > > @@ -157,6 +164,7 @@ cpu7: cpu@10300 {
> > >   			next-level-cache = <&l2_1>;
> > >   			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu8: cpu@20000 {
> > > @@ -167,6 +175,7 @@ cpu8: cpu@20000 {
> > >   			next-level-cache = <&l2_2>;
> > >   			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   			l2_2: l2-cache {
> > >   				compatible = "cache";
> > > @@ -183,6 +192,7 @@ cpu9: cpu@20100 {
> > >   			next-level-cache = <&l2_2>;
> > >   			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu10: cpu@20200 {
> > > @@ -193,6 +203,7 @@ cpu10: cpu@20200 {
> > >   			next-level-cache = <&l2_2>;
> > >   			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu11: cpu@20300 {
> > > @@ -203,6 +214,7 @@ cpu11: cpu@20300 {
> > >   			next-level-cache = <&l2_2>;
> > >   			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
> > >   			power-domain-names = "psci", "perf";
> > > +			#cooling-cells = <2>;
> > >   		};
> > >   		cpu-map {
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்

