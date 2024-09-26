Return-Path: <linux-arm-msm+bounces-32529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707FD986B64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 05:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5CE2819B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 03:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC7B85947;
	Thu, 26 Sep 2024 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gpWpe23P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807C1D5ADF;
	Thu, 26 Sep 2024 03:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727321640; cv=none; b=BgOsuFSkTuw5DVNyO3GV2cVCLSQAYMWkr3Fj4ArKoDSdzGJNbnsxcl3V+YLwCLyPsJdKfkYhzlM6cd7EIMyU4+MZCKTgJhqEU/1QNFPFdkkHeCd7qkKdBgY7gw2zW1RBS4pXgLwVJS3whWyIGm1esRhCIKbxTXL/63CINe2vz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727321640; c=relaxed/simple;
	bh=d2igtFLYOGy/YznIYiKbWnIF6Q1R9qoxOMgsSesCvYc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVxtmuuIGrh6ovGehACUASH6fp07WSAD2h6H3kF8qdLKkie19lTGCNLboF3bZ2tP0b9DTjM1DM9XvkrY9OMgXQ4vXJiqlm+kA9mTQyL1aA5R8nPLfnixAUD4qG3rp7PZxkhTjF3qOcMGfCZdh/SGRQTcps7yK6myfrDQbzfRGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gpWpe23P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5KDC021434;
	Thu, 26 Sep 2024 03:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2RtsE1iexB0GkdiFUfI7LQ0
	cbO3blW6rOMDgDc6R0M=; b=gpWpe23PM1+0RZvbq0EET/aMUNBAZ/q4JrMTy026
	sYyNKE307jaOk1aLWKEQ51O8ZndzJ+GS0QTrUeVsd5Uz3/0ZBwkv1DyzLFtOD/rm
	nv30Xlz+0XE9sNbMTbNU3uqZbWr2VcDCToAYVf7rmZUkyCqMNKxcukkAkbZlJu5J
	Y1TrgpX+Zswn2Wxx/m2ltfTqiCAGNMm5YmSjyLN1w2cceN2o0wsYvVoucgdoVH8l
	A2nYu7rr7tgMW25WftqjTLQZYhMea8mJa4S4Tqj3w0u6yzGkc7AWQ20M4qvUgdfp
	Q7X8w7sDoVJZlHMTHzNmaloe47GTKe6upIh259kqnHtM4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqaknrfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:33:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q3XoI6009888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:33:50 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 20:33:50 -0700
Date: Wed, 25 Sep 2024 20:33:49 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark
	<robdclark@gmail.com>,
        Peter de Kraker <peterdekraker@umito.nl>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
Message-ID: <ZvTWHZC2n+QkKWhq@hu-bjorande-lv.qualcomm.com>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com>
 <effqouni7fmzpag6g6e2t6uq4tltjiufynjhym3rmrpylezydt@ipqglqizisqr>
 <CAMcHhXp=nw8XXNFdw+a7+qcMbJVvkqzBcgZo0fombokBj2tD2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMcHhXp=nw8XXNFdw+a7+qcMbJVvkqzBcgZo0fombokBj2tD2Q@mail.gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8YCIipDKTUvN2FeEsVEfDWl10x65VgyT
X-Proofpoint-GUID: 8YCIipDKTUvN2FeEsVEfDWl10x65VgyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260020

On Wed, Sep 25, 2024 at 12:05:22PM +0200, Aleksandrs Vinarskis wrote:
> On Wed, 25 Sept 2024 at 00:15, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Sat, Sep 21, 2024 at 06:33:33PM GMT, Aleksandrs Vinarskis wrote:
> > > Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
> >
> > Very nice.
> >
> > >
> > > Working:
> > > * Touchpad
> > > * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> >
> > Hitting scroll lock/unlock on a USB keyboard once fixes this issue for
> > me as well. Looking forward to your WIP patch.
> 
> Thanks for your review.
> Just submitted the series [3].
> 

Thank you.

> >
> > > * eDP, with brightness control
> > > * NVME
> > > * USB Type-C ports in USB2/USB3 (one orientation)
> > > * WiFi
> > > * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> > > * Lid switch
> > > * Sleep/suspend, nothing visibly broken on resume
> > >
> > > Not working:
> > > * Speakers (WIP, pin guessing, x4 WSA8845)
> > > * Microphones (WIP, pin guessing)
> > > * Fingerprint Reader (WIP, USB MP with ptn3222)
> > > * USB as DP/USB3 (WIP, PS8830 based)
> > > * Camera
> > > * Battery Info
> >
> > Adding the ADSP firmware gave me both battery status and info, but
> > perhaps you're hitting the previously reported issue in pmic_glink?
> >
> 
> Could you please share a bug report for the mentioned issue?
> 

I'm referring to https://lore.kernel.org/all/ZsbomSG6DXTfYxXZ@hovoldconsulting.com/
although I'm not sure where it was first reported.

Chris Lew has been debugging this and the problem relates to intent
allocation in the underlying GLINK driver. We're discussing how to fix
this.

Hoping to conclude the discussion within the coming days.

> Were you running with [2] patch reverted or not?

I applied your patches on next-20240924, no other changes.

> Without reverting it, I cannot boot Ubuntu at all - it is spamming
> qcom_battmngr errors and holding services back.
> With patch reverted I do not get any battery related info, which I
> guess makes sense.  I tried applying [1], however it did help.
> 

I think we want [1], but with a better argumentation. It's however
unrelated to the problem you're seeing.

> There are a few pmic_glink related errors in dmesg, so perhaps its related.
> 

I do have a few messages about "unknown notification", but it works
fine. I expect this is just luck...

> > >
> > > Should be working, but cannot be tested due to lack of hw:
> > > * Higher res OLED, higher res IPS panels
> >
> > I tried closing the lid and opening it again (which I believe is what
> > was reported to not work on the other devices), and that seems to work
> > fine.
> >
> > > * Touchscreen
> >
> > See below
> >
> > >
> > [..]
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > [..]
> > > +&i2c8 {
> > > +     clock-frequency = <400000>;
> > > +
> > > +     status = "okay";
> > > +
> > > +     touchscreen@0 {
> > > +             compatible = "hid-over-i2c";
> > > +             reg = <0x0>;
> >
> > Make this 0x10 (and update the unit address accordingly) and we have
> > touchscreen.
> 
> Awesome, thanks for testing. Will add it.
> Do you have an OLED variant, or high-res IPS? Will update description
> when respinning to include it.

I have the OLED screen.

> 
> Thinking about it, perhaps depending on the OLED/IPS variant they have
> different touchscreen models with different addresses? I find it weird
> that the address was 0 as per ACPI.
> 

The 0 is indeed weird, I don't know what's up with that.

I'd suggest that we start with 0x10 and then change things from there if
necessary.

Regards,
Bjorn

> > > +
> > > +             hid-descr-addr = <0x1>;
> > > +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             pinctrl-0 = <&ts0_default>;
> > > +             pinctrl-names = "default";
> > > +     };
> > > +};
> > [..]
> > > +&mdss_dp3 {
> > > +     compatible = "qcom,x1e80100-dp";
> >
> > This isn't needed, right?
> 
> Indeed. Will fix it.
> 
> >
> > [..]
> > > +&uart21 {
> >
> > This fails to probe, because we don't have an alias for it, which in
> > turn prevents sync_state on interconnects...
> >
> 
> Indeed. Will fix it.
> 
> Thanks,
> Alex
> 
> [1] https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/
> [2] https://lore.kernel.org/all/20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org/
> [3] https://lore.kernel.org/all/20240925100303.9112-1-alex.vinarskis@gmail.com/
> 
> 
> > > +     compatible = "qcom,geni-debug-uart";
> > > +     status = "okay";
> > > +};
> > > +
> >
> > Regards,
> > Bjorn

