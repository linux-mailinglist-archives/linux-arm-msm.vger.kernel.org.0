Return-Path: <linux-arm-msm+bounces-76839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2FBCF805
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 17:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6790E4E0459
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 15:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F097227A12C;
	Sat, 11 Oct 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bX0M0XzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF41624C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760198288; cv=none; b=Nlm4uqYoLQoEdWLpUFRtLXVh3JUyw0odY3+dZoT1wM9UxqDNffKcZZPXE/sBTZnhTdQS10N023sTeXH3HXoDKC6XAonhV80gF6M5d/j/GpA1z4ZZCCVKs5UAALhp8w6MW3qrP2y5iwC0gJxA3sb5V/ewZwPppGnUyyDavbBguVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760198288; c=relaxed/simple;
	bh=QrFNimHkmBUitC0NhobSk0gO8m8J2JE3xLAa/9ZchMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naEvX42UDDfxmOUItowi4H94mGvUuZ1hFFCFPsJ5kgH5LKni7FtqpvRGiOEsJEnPiXV6Q/mKl1c/m1S1kVqF3j25lU1B3fv/zEgnzufFF37TqMn18WA+iRyo1ALOoHScPRO7hrzNnH4xM/0f9pt01Mmj3Ye3AhbWWAdbEBHS6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bX0M0XzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3T6vM008363
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cM/ZSWfIMQPPzbu9K7XPKBar
	oba+VrIv+X2/BKJAmw4=; b=bX0M0XzY2Z+sf3v64/PypxcJ6qR8iw+sIsProsBN
	6iTtfACpMfsALyEIAkiBBK2hPeDaFtCpGOreEkQgv9uJ856YE16+GxsUzVjMIDlL
	SwXRQH32NxfWbKZsA5kEqm8tyTQe+HcArfvVs3Q7SVG9+tJblFJ/0yqviw2VXO61
	i0oB+3VdZX4TAAr9F7IBa/Z01XWQa1z4okDqSuAN2n74FYShAjkho7m9M+9CRZVF
	rPBxd13j/G533vK4+W2FP4eguadai1WRCLGHXyDKAmroq0lDnEGc7ENsD/q0rTSh
	TIjCjpk69OOELXTL8trkrcZu4WCTNU8l4fE/nQHa0+Im3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfby0vr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 15:58:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-887c8b564ffso335311085a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 08:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760198280; x=1760803080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM/ZSWfIMQPPzbu9K7XPKBaroba+VrIv+X2/BKJAmw4=;
        b=ki2Lg+7ZcTyKfACeU7O+ZeVmU6QHYc6xo6R4B2ECXt18A/a4YdRMSsb4H0hG88q1S6
         oMhdDKYFsL/jO165FDoUZCbH8P4vKSsnqegxYW82V4BBw7qyWyy5Au37oC4gNMV5tie0
         3+PhTrfASugxxuCDyneACe1TTaERHZjFG++dNhrU6qx4dYCtL13zY5SwfUmf6lEEJejf
         pfmWIP+76j8Auvge+dJ30uiDKO9zDn5ARsLMQ5hFCAjfsKt5gaUuAPdH79Fi5Oaucwzo
         KSnCvignzSrGmvkRET0VTUhzzPwMCb3eClCMNEAOr0sRi9P0Xnh9qtqUBiBK/m599dKl
         xfDw==
X-Forwarded-Encrypted: i=1; AJvYcCV2wqPPcu48tgDSlFGoLqKACL6Ze3rvfLvMYPPAJVH5AOfuOsC64RBESkStH67XXRGv9VKZjWlPE5/0u243@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUN4sRxXGaNhNGQ7zGjsyiy/b5eqmoInBVmZBWXdUwA6a7xjA
	L3eSQ6hR7f+D+xFg0CSJ5GbtyHPUYi8aR2v1myiSwOhKsR3uM6ShOfaz8E4/WnYXJRaka1euJo/
	4iDhNsAVhhAY5FCPohi3zybomJvXZrVg82BGfHOtb+0HXEm5W0x0dGC+nj7M9L+3YeBut
X-Gm-Gg: ASbGnctNkiRvSOwnJOWlfjwl+tdVQaGV0j5H9jw6RjaAB0tDyNaLB0LoTciaTtMDK9T
	fukCIHkUcyAq7zRYSM/VUSuB7qz+VEfI+1Lpon9vZH1+XO6bPTtiQMNTUxhRfv4kuKi0+FLkkQH
	UiTbrD+hNeIo/I+dLNkTX11RCQuxsyrzhzWONZFJGOL6WHXOdn55mrgXOl7QYYSs5L/u7mQGZGV
	7Z3nhDDAXjxTofHYAgrBFVZ5sjf6DvjEX3Fgdn2+CsJqLzLt8wS3epKCWNX3fBuXH6MripR6GfH
	fUflTzUtX0GZf6uZ5EGsZkjDiDWsoA6cy6DqRiVXjz8GAdX3AvghmcPYvptSPm38u2VLLGlE81Y
	masMfXTuNTF24G/ZU9DRsjLyjyJgJZAGRuPHQGrD/gau6RFdR+s/r
X-Received: by 2002:ac8:758e:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e6f396e281mr159605301cf.3.1760198279627;
        Sat, 11 Oct 2025 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKBCQ8VLuqm+YCoAg6hZ6hNnnm6OhLtm7zHiupmtWpKVZOf1M08JlLk7WABuseyTLvzmjuiA==
X-Received: by 2002:ac8:758e:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e6f396e281mr159605001cf.3.1760198279171;
        Sat, 11 Oct 2025 08:57:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563bf6sm2022640e87.71.2025.10.11.08.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 08:57:58 -0700 (PDT)
Date: Sat, 11 Oct 2025 18:57:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <a75ndv2mzwy3niihi3o2ux7lrkue7h5avj2vcxgqhs3hasunfg@cosy2knsveey>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
 <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
 <aOiw75D0RhDNLZLQ@hu-qianyu-lv.qualcomm.com>
 <ilr7iaasabiwynzdu4ca6bhcyu5ubznc4yw4chfa3hkqsxjauw@2y6smgstv624>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ilr7iaasabiwynzdu4ca6bhcyu5ubznc4yw4chfa3hkqsxjauw@2y6smgstv624>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3pmDWBcDrgyF
 lZlI0PJ/aFzrosWEaiT/ycOlBNdFrlBe/T4JVQBSXUb2h8nW+E0dfKSyvfxDCmTmo7s4KOJLRlU
 cfpDxHymqtZxU6FWNgG/Rt7xr6ul5HBfR/ap4r4led/PMPEn3gXcxiPV9bmX4vmSniB1WLopPvJ
 ZK9nlhBOr84OIlgyVHJ6sN0/yTStRw9aXUFAx/RPNx6vSKgXXZMnNiHyFLD48JxDOfvXODr9MbC
 s1ZAzuHxV5F6zOYP6xyUj/OxJhsSqs47JUVD+ztruo1HeBfXuTIHIW6IibDFr7Xm0gEEk7VEu76
 oA3Y1JmaUjnjwbjzvE1vId++ImR0xYlX4L4UW9U5l+LrqCs5tExBGH/WUXrKxMFasbqkOHd4FZv
 jEiUyKckmpCM771fLc5HBhS4F/AcYw==
X-Proofpoint-GUID: QfAZbxplpNZI5_6z1PycIhVt17fZB4m4
X-Proofpoint-ORIG-GUID: QfAZbxplpNZI5_6z1PycIhVt17fZB4m4
X-Authority-Analysis: v=2.4 cv=A+Bh/qWG c=1 sm=1 tr=0 ts=68ea7e88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gVcGzzVyn95359E6DnkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Sat, Oct 11, 2025 at 02:43:14PM +0300, Abel Vesa wrote:
> On 25-10-10 00:08:31, Qiang Yu wrote:
> > On Wed, Oct 08, 2025 at 04:36:59PM +0300, Abel Vesa wrote:
> > > On 25-09-25 12:02:27, Pankaj Patil wrote:
> > > > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > > 
> > > > Describe PCIe5 controller and PHY. Also add required system resources like
> > > > regulators, clocks, interrupts and registers configuration for PCIe5.
> > > > 
> > > > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 207 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> > > > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
> > > >  				 <0>,
> > > >  				 <0>,
> > > >  				 <0>,
> > > > -				 <0>;
> > > > +				 <&pcie5_phy>;
> > > >  			#clock-cells = <1>;
> > > >  			#reset-cells = <1>;
> > > >  			#power-domain-cells = <1>;
> > > > @@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
> > > >  			#interconnect-cells = <2>;
> > > >  		};
> > > >  
> > > > +		pcie5: pci@1b40000 {
> > > > +			device_type = "pci";
> > > > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > > 
> > > The first compatible is definitely "qcom,pcie-glymur".
> > 
> > According to Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > the preferred order is qcom,socname-ipblock.
> 
> Fair enough.
> 
> Now I wonder what happened when we added the one for x1e80100.

Our PCIe hosts mostly follow the legacy approach and nobody wanted to
change it up to now.

-- 
With best wishes
Dmitry

