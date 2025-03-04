Return-Path: <linux-arm-msm+bounces-50098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDDA4D240
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C021894A66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02C643AB7;
	Tue,  4 Mar 2025 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk3z+T8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA07BA38;
	Tue,  4 Mar 2025 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741060836; cv=none; b=umYk2bvyTlQvc6opghpkaJ0gGnquO/HjNvgxKlW1pQhNPuQrE5+vwGftiXO1Ss97c7z1Px4tRGWcTvhirUesXrcmYjyhbd4ziu8On0FkdBXuxU0tU+I0MXbXbm+VAWXRNR4DlsDyxlbfFQ8oldPBVU7N1gMz1cnnPdB89J1CCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741060836; c=relaxed/simple;
	bh=rluc3zmydmEHsLOo2Qguez2nWvDhxgsY2UdhSAVwpzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMHIA0Wn2dZxYmZrumSKylPzxXpPLVVvnVc/fiTtBclN6gFKUl9v1mHpE2KjCKL3sepZ23yGoZDV38E5faHJnzWlylUlzVRYayVVk3Hx4fpnjirWK3vRbddJEbH2qcT70OU9mzXdSoxU9PEGZgJ27H5ji0CgkCKl/d0GPdYoaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk3z+T8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8E3C4CEE7;
	Tue,  4 Mar 2025 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741060836;
	bh=rluc3zmydmEHsLOo2Qguez2nWvDhxgsY2UdhSAVwpzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk3z+T8yvyOaj+R/LtvqXDbqa7zbie17wD5yujeksze1szQsYTmaXVquDenXGfBND
	 y9E9qjAdS2aZcUtEfShjHohpclIvxGE46dDTOKWnXyVnKSzBHI9bUidGcdZmDmQCry
	 z+DpUnfL5W/CWacU+Q9RjD350kjy3TiAk3AcMuMvC3uZzXP4Ui3Pv2NDNajG9xURxh
	 VXl6qaobRvspKgo4pWpHUNNzhXARV5Bgb+LijAu9gc/+SQC8J1mwF91SASby3X2HxZ
	 9iVJjsX1lnfjLFAOl5f/U4zVNUtKPdDNJslOrCm1wQAtheG5WeknEsRwSQSQ/bYOac
	 S7mLTVGZZW8mw==
Date: Mon, 3 Mar 2025 22:00:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stone Zhang <quic_stonez@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <5cxrfaa46scajod6cgaq4lrjokb2xv6yi3cta4fqfelepqi2vl@fr56uqm3xv23>
References: <20250227065439.1407230-1-quic_stonez@quicinc.com>
 <20250227065439.1407230-3-quic_stonez@quicinc.com>
 <6wr6slqdigcrhda3aldy3iggwdhpqcb7xp54jszxksr3sli2td@h6sxf5qth27c>
 <34b4859e-16c4-4661-a545-669643a9b34c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b4859e-16c4-4661-a545-669643a9b34c@quicinc.com>

On Tue, Mar 04, 2025 at 10:30:15AM +0800, Stone Zhang wrote:
> 
> 
> On 2/27/2025 11:15 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 27, 2025 at 02:54:39PM +0800, Stone Zhang wrote:
> > > Enable WLAN on qcs8300-ride by adding a node for the PMU module
> > > of the WCN6855 and assigning its LDO power outputs to the existing
> > > WiFi module.
> > > 
> > > Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 100 ++++++++++++++++++++++
> > >   1 file changed, 100 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > index 3e246fbc5759..e9304420c93e 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > @@ -22,6 +22,80 @@ aliases {
> > >   	chosen {
> > >   		stdout-path = "serial0:115200n8";
> > >   	};
> > > +
> > > +	vreg_conn_1p8: vreg-conn-1p8 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vreg_conn_1p8";
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +		startup-delay-us = <4000>;
> > > +		enable-active-high;
> > > +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> > > +	};
> > > +
> > > +	vreg_conn_pa: vreg-conn-pa {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vreg_conn_pa";
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +		startup-delay-us = <4000>;
> > > +		enable-active-high;
> > > +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> > > +	};
> > > +
> > > +	wcn6855-pmu {
> > > +		compatible = "qcom,wcn6855-pmu";
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&wlan_en_state>;
> > > +
> > > +		vddaon-supply = <&vreg_conn_pa>;
> > > +		vddpmu-supply = <&vreg_conn_1p8>;
> > 
> > This is very incomplete. Compare it to sa8775p-ride.dtsi.
> It will be completed according to the supply voltage defined in the power
> sequence driver.

The Devicetree binding, not the Linux device driver, is what defines
what should go into the Devicetree source. That way the binding forms a
contract between the dtb file and any operating system reading that dtb
file.

If you ran the required "make qcom/qcs8300-ride.dtb CHECK_DTBS=1 W=1"
(short for "make dtbs_check W=1") you would have noticed that your patch
introduces the following errors:

      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: pinctrl@f100000: wlan-en-state: 'oneOf' conditional failed, one must be fixed:
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddio-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddrfa0p95-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddrfa1p3-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddrfa1p9-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddpcie1p3-supply' is a required property
      +arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: wcn6855-pmu: 'vddpcie1p9-supply' is a required property

There should be 0 new errors for me to merge the patch.

Regards,
Bjorn

