Return-Path: <linux-arm-msm+bounces-114740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rYoKI2+GQGojgAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:26:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5B6D2F5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M4PxfH3U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F87C30136B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 02:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945DC1D432D;
	Sun, 28 Jun 2026 02:26:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8774542AA9;
	Sun, 28 Jun 2026 02:26:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782613612; cv=none; b=o5h755n7jo3qjd5KoyzxYcWV3FFJap1ab9CsXauuyW5a9qed8VHpQCIB8dCNVBkpGxFUWOeoRHVSZcBN/AZHxglzcI/RMRuI6JRRiv0QTqrCfTYyb6KSPw+5KMBIUYP0Yzx7UULn0B7snFn6q1k67ShHtk6TKHY1VNRV4H1zUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782613612; c=relaxed/simple;
	bh=ztC2JTeT6dv4bPzVgMF8fAM/ewMsTn4zq5Q5dj+1clo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrvM5nWVQW7pkiBbbo/0yGPVaBsYPQ4bZi1B3LpljprorIKTfiJoe9WLELfXQM9qfRf1sKxRISHXqcbPNoxP+fwaPd8GIvYy3lIF3yoaVIkGER8/5Y5KD5PjauNOAJE+Igv8t321IizeXYrVXxhYO8/Ehe//m4czOJExWsxBOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4PxfH3U; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F551F000E9;
	Sun, 28 Jun 2026 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782613611;
	bh=6olVr5WfLuKTTyUnFTwflcEbFuAJRbj3kyYQ5x53YhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4PxfH3Uy0dfjKxhh1SIEtkLTIXh2DAJ0HLiDwdnXx/35T9J5I0lnxkD80TQY+lJ+
	 6fYPYsknT3BFiOGvejxhR2YK7fR1stKQK/GvbDV7Kd0Bpw0xfAATygdNpnV/nk9UO7
	 zcK0uGq3Akdq5qmPHSmLDoquw572E8hKW+xMxw4WUBSExH7vF6NHDXJigkPJwOlOzs
	 uzyHNIqBZE8QWf3L4qhqTz8XbWOogWeDrFiWyryK9crk25uyFZXw49VoAbOVWfp2qJ
	 235CnqxJetL8/7wRvz6MpsWdJElffEgiHzdlN4S5TcFN05/Y5VvVl2x6sjUiNy0oVl
	 /13Hg7OmNZhbQ==
Date: Sat, 27 Jun 2026 21:26:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
Message-ID: <akCFlxiGT-vHNM-x@baldur>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
 <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114740-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5D5B6D2F5A

On Fri, Jun 26, 2026 at 11:50:40PM +0300, Dmitry Baryshkov wrote:
> On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> > From: Mahadevan P <mahap@qti.qualcomm.com>
> > 
> > The connection between the QMP Combo PHY and the DisplayPort controller
> > is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> > drop the per-board overrides.
> > 
> > Also remove the redundant remote-endpoint cross-links and
> > orientation-switch property from qcs6490-rb3gen2 and
> > qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.
> 
> Separate commit.
> 
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
> >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
> >  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
> >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
> >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
> >  7 files changed, 1 insertion(+), 24 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index 96ac3656ab5a..0acc6917d7aa 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -5704,6 +5704,7 @@ dp_in: endpoint {
> >  					port@1 {
> >  						reg = <1>;
> >  						mdss_dp_out: endpoint {
> > +							data-lanes = <0 1>;
> 
> This is not true. The SoC has 4 lanes going from the DP controller to
> the QMP PHY.
> 

Does this property really denote the number of lanes and mapping the
internal pipe between DP TX and PHY? Doesn't it tell how the external
mapping looks like?

Regards,
Bjorn

> >  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> >  						};
> >  					};
> 
> -- 
> With best wishes
> Dmitry

