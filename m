Return-Path: <linux-arm-msm+bounces-83810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96045C93596
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD9F64E15AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 01:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA47419D081;
	Sat, 29 Nov 2025 01:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjVJwJwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaXsas5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439615B135
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764378931; cv=none; b=RAV0wYDO+sLt855y6g/apUEsJu0m4D40+EEPloIFxEAizpojLuKe+O0vst66mfBVSJIdeA9g+QmDjsUG1ZCufnkjuYRRkH6rS2gP5y7sWtvCn05hZ9gp4wFLB3NgaGDgSg2BcXORP78Vivct4LY75P6QQUSSNyCeCxjWEK8r/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764378931; c=relaxed/simple;
	bh=y9gqKIMs5NCRJ/ByHpgzoPAFxDlT6eQpDzeeuFgOFlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhzURgR/j+lLdLPxh4kEVECFyc54PlejGuK2HH9jkvG7jEOCQvVLEC5Fx55gPq29v9sEUlD+6KKPS3WUikQPPV3Tqi8FG1KgpjpIXshgh3UcDtLNCZHojfWlRL9FRcAtkw3Db9PlMLjc+sBeLScqHTm4Jx+9Vbv6o0fjTdihd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjVJwJwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaXsas5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASLf86N1394798
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=povCCUHvVvudmv1VHDTJtEKF
	5pdkowtc8DNl7M/HVAM=; b=EjVJwJwlw8AkYuc9u/fNrQEhp5nKf3dTwz72R3bZ
	ijysdFaGTPMYqhFXLbNvoXAE4BqoCFgrJwnWug13ABpRLc0DzjCSxd0r4dMfcl9Y
	//YpuO9vZ/0oCVDhaNegAPjiLCOJDA8o5U17QiYBm9GvSZkl/rdh29fIUDcYNgXY
	DaHsZQWHnC4Pmi0sIchoOFmGojDPXnWkwtsPhyRVyYMw9N7BzmUxg6866+eR1O8/
	b0NYOJA2HdMJoxGrR0euoEkqiij5Ay582js8nrsDm43jED7GHypCiTwbUs8br9eY
	K0KxOLu7Uy1MTldZxcmrUrd6VbdR+/LbtS9JWFSNt8F1pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm9y6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:15:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24a25cff5so405514685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764378928; x=1764983728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=povCCUHvVvudmv1VHDTJtEKF5pdkowtc8DNl7M/HVAM=;
        b=UaXsas5+CXB/asYumf0kntZ1huY+Bra9a2w8rGKBMduAqbFfS82QtU/LWm87cpyZmj
         phaFxijIQKTXj7yml7HE3ZQthBf0cywebcgVB7KKp65OjwGCFjME3dLJjdAl6JN+nUdj
         a6o8wSd8ZwP66BxNbFuuEIsvkArqSM/Mzf4cV40qvairlFHPeHi7vFhsU/MKCu6cl31m
         3g1Ayquwhe154PufkM3hbQ9GBb5fErrH0zMo5A91giOIC9EhmZwln5mFpHPUyx8vvOkz
         +raXm47GDr1NCaq2dNrRh7qMNUP0oHWlNiywzxsgcFXx8ppOj+3BSe7GWnvq1TfaxWag
         brvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764378928; x=1764983728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=povCCUHvVvudmv1VHDTJtEKF5pdkowtc8DNl7M/HVAM=;
        b=CM1IlKZeEV5kbKxnmCwRlpDDjPGnEHUk8KkW8iriEHdxMoO7OcJYF/yEdTqgdbVj+0
         ToehJgsCFWXfHPBWr/mWttq4czPPiBOcwEtSOJFkQ/g4Y58IWZ4DBP4V2Uw++BP+LIB/
         8QAUy5rO/75YM3w8mV1rpbPzh0Fc2Lzwmj/IQt2ab4ekLwrGg/2MItHJWU1EkRK7iB3e
         eTeccrOZ5Tubz/7dNul5DA+ArpgE8zX1ersBgasKbLmKjb+ZWqbWjXzIOAj7/s6XwCEX
         U1zDTomVq/WK7fWe+modvKcBE6Irs5DL3tcufz4gz6CULvIope68gpStvzwO7xkbeibk
         B0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVMHfi4jfRnn7cBhMJqt/MKJ+3/+aqF/3XO+eewOQgkAZV11BhEQIiy3FJV8XKLho/rdZp7oztakP6J7mui@vger.kernel.org
X-Gm-Message-State: AOJu0YwS71n21Ukz0rBpPXmmCcOvPCzEUMeEEdzwN5fh/YBQpt1y7JIY
	OGiWSRpPI7d5XLJB7zNn5VCr674Ajxq2kOrOgrhVyaXUDzXCpiLBUlleTjGQWM7uVjC61qE8Rv0
	IPk6RKbDo2LQwuAoGlSHQysyV1MnrE77m4lOY7vIPVPXUYYy4uUHheOmOhJl2ff5/PcGWA8yub9
	0Ij4WoIQ==
X-Gm-Gg: ASbGncuDxJ0ZU8wwG15YLMLE4FgPM+hfz3Z3nYXdr+k7VUFtt2jjnaHF80+Y0knCJhx
	rWk84NdFRmIRFe4kiLebDQK1bzBzrtA36rg+INEw4UW8RWmHXzr1zzN0q/k27w8Ohk4GySxZBEc
	5pQBDo+WLlXZzp4K0P8Ay3n7QAze8LTGJB+AUO95avjsv3kXwCcsRz3AU3WsOVfMqT3Eix+MmCI
	e+t/JDrazNNRPW0C5fi5AmSqgAAA74H0PA2C4GHBWb78EN0eGbJATU9DJ1/qMFbsEGy1M/ncVUS
	bODBO4mPuLgE9gTFN6nAF4v1oJCnRLGAkBBLKzpJkSiUphJQjazlMQp4hsieJC6y9ra13M4BszK
	R99iYqk3NaQthMGHQ/PR8AcDgjBNv6FSS9gXqzmJFmnThQydI8tKnNsiPdY3jYF+GN4wP6B2gsC
	w1Kk6gSZiXGLutA/BFVpYBdz0=
X-Received: by 2002:a05:620a:1a8f:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b33d4cf925mr3728856085a.43.1764378927950;
        Fri, 28 Nov 2025 17:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlw82UBIj5O+kKPOMBnEozzsNfSI0NL2DqpgGaQJy/TUIMykdieWr6mLDGikzABdDfPvr+eg==
X-Received: by 2002:a05:620a:1a8f:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b33d4cf925mr3728848785a.43.1764378927377;
        Fri, 28 Nov 2025 17:15:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b0565sm1578279e87.32.2025.11.28.17.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:15:26 -0800 (PST)
Date: Sat, 29 Nov 2025 03:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Message-ID: <hw63nhhm4n5fngmrhy2pktztxq32ix4n2be5dycowglekee2rm@js3jyst2i5oz>
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
 <20251126-slpi-v1-1-c101d08beaf2@gmail.com>
 <jxlq4fbtl5rkiyyaivoelynw5hjpb3xtg4klcyocyzbs6ncpqa@rhqcwbehisjv>
 <2c7fc579-6d46-4821-9059-4ccce589ffdb@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c7fc579-6d46-4821-9059-4ccce589ffdb@ixit.cz>
X-Proofpoint-ORIG-GUID: _e32NfXrfiRkSE24kt6n6N2KVPJXqaXb
X-Proofpoint-GUID: _e32NfXrfiRkSE24kt6n6N2KVPJXqaXb
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=692a4931 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=6fcVbKO1MKpXv_-_8oMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwNyBTYWx0ZWRfX33BX0A6WGbAs
 8P/AESgjk26z1WzgPvtbnDtQ2UOTrM8H25rw/aJkPcPsZNayKoMG+OMzM5WiJ4/y/Ks/78yW6lv
 R9Hwo9bY3SY5gX8oK0qnjL4lJ2TU2uo9eebBbvF6PdgVTQkU8RtbCYapAiKuJKFpeNk6TOYotOG
 Qcqxm9EtEXrbywAP39e+rK+78xssZuFa+K6vmwgKH46tHX2ztvKRr+LtGi2ha1QOEUsxQmGyfTT
 EIVAahiLCu1GRZ9c+EibUNk/KldJC2I7yvDX7NDcSfkPtZvuaD/gHAfA81bgbHw+aSRDXcKTpNP
 OB1tmL3Izx99iV12Ultk5nZmUKq8BCUgZhSI546p+qMUZCX7mQzjuHKN6rdrbMMhJLzEUDB0MY2
 dULe82CqRqiM0eRMBhhY8BQTKMAbAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290007

On Wed, Nov 26, 2025 at 03:59:48PM +0100, David Heidelberg wrote:
> On 26/11/2025 15:41, Dmitry Baryshkov wrote:
> > On Wed, Nov 26, 2025 at 09:08:35PM +0900, Robert Eckelmann via B4 Relay wrote:
> > > From: Robert Eckelmann <longnoserob@gmail.com>
> > > 
> > > Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> > > 
> > > Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > > index 785006a15e97..0fb1d7e724c4 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> > > @@ -425,6 +425,12 @@ &sdhc_2 {
> > >   	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> > >   };
> > > +&slpi_pas {
> > > +	firmware-name = "qcom/sdm845/beryllium/slpi.mbn";
> > 
> > qcom/sdm845/Xiaomi/beryllium/slpi.mbn
> 
> Could be this change done for all the firmware files at once but later?
> 
> Currently all the firmwares using this legacy path.

I'd rather see the patch fixing firmware paths first and then the patch
adding SLPI with the correct path from the day 0 (I feel sorry for
causing pain to PmOS maintainers). Of course both patches can come as a
part of the same series.

> 
> David
> 
> [...]

-- 
With best wishes
Dmitry

