Return-Path: <linux-arm-msm+bounces-34594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8089A0C96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED751F22EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D20918BB84;
	Wed, 16 Oct 2024 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RW157QD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59069D2B;
	Wed, 16 Oct 2024 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088930; cv=none; b=m+W6Kf1XtnUAR+8rHLvEaLjPGGmJFUm+/mDB+k8CZypdA2PnzkiQbHdq7GNmgOid6ith88mjziaNJXlL71HsyRoH26p9icGY+MuyTsgHf/VQMceoZTS2GMt+iatGwJXD0kZHpQUbbrmtjXxN9ML2CuWMWa2jAbJJmuZn0jwHXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088930; c=relaxed/simple;
	bh=vjNjPzCeNoqJhqtCDl/b4mBQCaX7+Bu5HjiZkp4Zpso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVKPyl+l8NUTAnOgt5BmiudCqldU1N48bSmbLjckqAzav4pZIj58+pBRNal3zEMUmKQR/A5pFabHSy3xMoJqLYAos3sa9Y16LH2e80uD0Ij2yk6Gy67iXm97CXuhqIstanzbHRiO2ssN8O0E9I88ZKgBQLDeWFBRicJWdyLkn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RW157QD9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA22CC4CEC5;
	Wed, 16 Oct 2024 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729088929;
	bh=vjNjPzCeNoqJhqtCDl/b4mBQCaX7+Bu5HjiZkp4Zpso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RW157QD9iX704qiEqy6z6S00l51aPv3qbUNImb5xY07+yeiPGmwWo4KD6UcG8Yxek
	 IZ8AIgDYNyhArtlvoDKf/IQ5lHhDJabUOhybiGvb/6va4eyz1JYwWHu1bjV85nNCjH
	 IlfoeBVe8r9I7ySDS9/nZ+X9coUIQHQCxWGkgKr2wl4tf5proqobC+lOFNi1gKZCR2
	 VqnTyeJJujd3zkPtXqBPA35pLpgjzFn+GP2wSKI9Vtctlpe9QGT/zdA96WVOx8UMiO
	 3wHNRfblKkqNYK9Nu1ZBrJ5W0Ve+rWZLqmys8puccEkmcBoGdchouHvj5+nFFPo2+X
	 yQvDuslpTqPGQ==
Date: Wed, 16 Oct 2024 09:28:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting
Message-ID: <6wej7mt2z4e4w57niowrjmpuhzfxjxj72cyihmefzr4h6g4qkm@a54gnsfjpxwh>
References: <20241016100511.2890983-1-quic_kotarake@quicinc.com>
 <2tunyupop2w7brm6adkdsrytvxbr4g3ixpbmuuqljedeaehze5@se3qsbf6tb6t>
 <e7443137-925a-4fa9-916a-7481585ad4c6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7443137-925a-4fa9-916a-7481585ad4c6@quicinc.com>

On Wed, Oct 16, 2024 at 05:00:43PM GMT, Rakesh Kota wrote:
> 
> 
> On 10/16/2024 3:54 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 16, 2024 at 03:35:11PM +0530, Rakesh Kota wrote:
> > > The UFS driver expects to be able to set load (and by extension, mode)
> > > on its supply regulators. Add the necessary properties to make that
> > > possible.
> > > 
> > > Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> > > ---
> > > Changes V3:
> > >   - Somehow after fixing the compilation in last patch, i have missed to
> > >     do git  --amend the change. apology for that, in this change i have
> > >     fixed that compilation issue.
> > 
> > What actually was changed? The --amend doesn't describe changes. Nor
> > does "fixed that compilation issue".
> > 
> Added missing semicolon (;) after regulator-allow-set-load prop for ldo9
> regulator.
> > >   - Link V2 : https://lore.kernel.org/all/20241015132049.2037500-1-quic_kotarake@quicinc.com/
> > 
> > Where are changes between v1 and v2?
> > 
> i will add changes history in V4 patch.

It's perfectly fine (preferred even) to just answer with the requested
information here, and then if you need to make changes to the patch and
do send v4 you make sure to include it there.

> > Where is the tag that was given to you for the v2?
> > 
> sorry, i missed adding the Reviewed-by tag and i will add it in V4 patch.

Same here, if you just reply with Dmitry's reviewd-by and a comment that
you missed it, it will help me know that the patch has been reviewed and
the tools will pick it up.

Regards,
Bjorn

> > > ---
> > >   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > index 5f3d4807ac43..bfb1cdc238cc 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > @@ -258,6 +258,8 @@ vreg_l6b_1p2: ldo6 {
> > >   			regulator-name = "vreg_l6b_1p2";
> > >   			regulator-min-microvolt = <1140000>;
> > >   			regulator-max-microvolt = <1260000>;
> > > +			regulator-allow-set-load;
> > > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> > >   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > >   		};
> > > @@ -265,6 +267,8 @@ vreg_l7b_2p952: ldo7 {
> > >   			regulator-name = "vreg_l7b_2p952";
> > >   			regulator-min-microvolt = <2400000>;
> > >   			regulator-max-microvolt = <3544000>;
> > > +			regulator-allow-set-load;
> > > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> > >   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > >   		};
> > > @@ -279,6 +283,8 @@ vreg_l9b_1p2: ldo9 {
> > >   			regulator-name = "vreg_l9b_1p2";
> > >   			regulator-min-microvolt = <1200000>;
> > >   			regulator-max-microvolt = <1304000>;
> > > +			regulator-allow-set-load;
> > > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> > >   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > >   		};
> > > @@ -467,6 +473,8 @@ vreg_l10c_0p88: ldo10 {
> > >   			regulator-name = "vreg_l10c_0p88";
> > >   			regulator-min-microvolt = <720000>;
> > >   			regulator-max-microvolt = <1050000>;
> > > +			regulator-allow-set-load;
> > > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> > >   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > >   		};
> > > -- 
> > > 2.34.1
> > > 
> > 

