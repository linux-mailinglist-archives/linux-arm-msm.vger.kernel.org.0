Return-Path: <linux-arm-msm+bounces-45935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0462A1A1DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496053A6666
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E820D4EA;
	Thu, 23 Jan 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdpID4bn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51991C5F09
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628247; cv=none; b=Sf87GI6datBkgtygpVEMm/mrJA98qOvotEtqQ6K0NRpracG7evrWUyg1tNZk2HxWh39/cSZc0y6UkdGulM3q3XGaKwD1p0CB2W3k7XJ9F1QXCOeIFUe+I8hMiEkdNO3dZQBQGS6ggQwFEwLsaiaUs3AMmfdP6opWRPxwIn9cooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628247; c=relaxed/simple;
	bh=6rKV3PcZtXlHKOVd32oah18KZC8GPjoFT5AzrNVjpIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXxF622AD9f1blgAVEJdeMPAuWH0etg6burOwldnJY2lwrluxBKGNk7/DeqgkCz2cfUMuHMpauZeRHOH7j2wbE730Y9Zeiml6Ib6DnE7Cp8WYTUHwMgH9v3yqtJzztV2mOz/IMRgFAT/aLwaKDZSzexIkgG50U4LNnHPCgKQSQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UdpID4bn; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401be44b58so877186e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737628243; x=1738233043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8O+bJPlNFpKuqIgdKZqcspHg5tjYnBrqsml1l3HWJY=;
        b=UdpID4bnNMeI19PoIEKvuic0KPC0G7IUhuqNqGnqLfv1vFrcetpCVi/UlraB2ul7sX
         rpNracoiPD7oh2gLZORCHbeCovCS5D1+9LBnkhgEweIKJax5+NqQ/RbBESVseh7xSiIX
         hDxzadFpXqUmp5fUddVbUlU2yWxPzt/Eh01AEoOnUI7lQKszwplT1NExbDt2O9fYQ7fW
         C+wb62/uvVzkM5cBTo8ImtI3lYz9OygsoJPCNcStE6Ocmdu9238Aigu5J/C0cYHf42gl
         X32SGB103xZq/hPJAb6l/W1zUMieBx8m+98g25urU5i+ttDB/XZSVgV1LhA9GQeyFplr
         WXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628243; x=1738233043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8O+bJPlNFpKuqIgdKZqcspHg5tjYnBrqsml1l3HWJY=;
        b=ZXDo459v2/FNZF1hboetryvFn7+2ujwyAJV71HQHjxmWlFnRiXL7ZO2P3Wo0XBu6Ee
         fhEjMRMyiAYky/O3nFfz7/6E7tHu3I3DvmV0FK/3d8Qwit/UpKgv0TNJVS015gDe4zcs
         hato0yvZzej6x3yG+0vVZN3gS4jovUyVLJtRS2CeM711AVHXjfYbZsBjAqKyF56Xziui
         D8lw3A/N+HR/2v7uF5ibiYO2jiiZ8WIbZ0WjzLWaEvioedWGyveNLMf+37WRBT9tj5rX
         lE0vXTymx4lMAs8aU+J5zsXkOcbdT7HxeRP6cEVP0zC5wOM6n1lnSW0DC3AQ6DH4XqB3
         m6dg==
X-Forwarded-Encrypted: i=1; AJvYcCW1E2m7Q/n8adHIxBL89R+KFWY9tV9VPZ0skbyIpgQfK407ajesUNTEfarlVc7UvdgxMMP9+UFwUouLUI4k@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKeoas+Op1MBqZaA1stwNrPwvn+/TuKnD6hmoGuDQNL4NHZCS
	WEcfnGCdP7GrL2EvrZFrtqUZRqpyYbH/BoHSLbXxLA6RrCnk7ltiwExYvK2CSbw=
X-Gm-Gg: ASbGncsFFIFqRYpUdIpvAI2Mg/nN3Fo8bpJIIrQbQXUqke/didedow15deKSWgxJYAp
	t+7rjuzCqHP/38lNAkwnycP2GH3IROoj/RKiMItjJAhv7mpBQ0qDGdJrwfVMtOlnr0Hjt5YPLiM
	AU83n8M7jbNcJO4PjA6WJvI2f/kpTThWNEUOkWGW3cPxtNG6PevbgNosq5K8Vpbr6RP6O1npR3O
	puxXozmQHI+6XIA7M7vGM0treg93KsBFne6M1ufUNalUmRVO7V75GZLa96jnFs9Z1O4bLVl88YF
	sxcCW5ce2/9oS4xyatuHtNogSPbANOzJ6FGBX//M9+Wwt7RSGypXfHn/MenG
X-Google-Smtp-Source: AGHT+IHvq3r6Yz3TOREChEBuV6ZIxwygr1w0JTfPLiglajOzu91arAOivh6KObFTX8n+8tfYVyunZw==
X-Received: by 2002:ac2:4c24:0:b0:540:5253:6af2 with SMTP id 2adb3069b0e04-5439c22148amr7318787e87.12.1737628242798;
        Thu, 23 Jan 2025 02:30:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07437sm2599629e87.25.2025.01.23.02.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:30:41 -0800 (PST)
Date: Thu, 23 Jan 2025 12:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, 
	kernel@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove cdsp
 compute-cb@10
Message-ID: <htuqivpnro2pgglfrkutjeks2u3sv4arlgy657dlmaddaeaqvo@5vuvvujfnhks>
References: <cover.1737615222.git.quic_lxu5@quicinc.com>
 <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>
 <a89e32d6-a88c-4f08-9d2a-93d9b75f3047@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89e32d6-a88c-4f08-9d2a-93d9b75f3047@oss.qualcomm.com>

On Thu, Jan 23, 2025 at 05:36:40PM +0800, Jie Gan wrote:
> 
> 
> On 1/23/2025 5:19 PM, Ling Xu wrote:
> > Need to remove the context bank compute-cb@10 because secure cdsp
> > uses the s2-only stream.
> You need a line below just before your commit message if you are not the
> original author.
> From: From Author <from@author.example.org>

And Git will handle that automatically if the commit has proper Author metadata.

> 
> > 
> > Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> > Cc: stable@kernel.org
> > Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
> > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > index 0aa27db21f3d..81b2fba94841 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -4585,14 +4585,6 @@ compute-cb@9 {
> >   						dma-coherent;
> >   					};
> > -					compute-cb@10 {
> > -						compatible = "qcom,fastrpc-compute-cb";
> > -						reg = <10>;
> > -						iommus = <&apps_smmu 0x214a 0x04a0>,
> > -							 <&apps_smmu 0x218a 0x0400>;
> > -						dma-coherent;
> > -					};
> > -
> >   					compute-cb@11 {
> >   						compatible = "qcom,fastrpc-compute-cb";
> >   						reg = <11>;
> 
> 
> Thanks,
> Jie

-- 
With best wishes
Dmitry

