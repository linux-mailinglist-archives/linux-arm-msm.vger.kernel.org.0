Return-Path: <linux-arm-msm+bounces-73696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81004B594BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1192F32092B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D10450FE;
	Tue, 16 Sep 2025 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHpmyw7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906A2C2357
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020697; cv=none; b=nA9XdWaBzi8d1w6wg0e5Zs2uVSYyesK6QUmqJPLCbLzwF6O2fQVUKPQZT9qq4ugBM728IfNrMQJnnG9W/cqoJwXC2XCoOJp5NHdUjGYp5QdT8dqy+x0qJX+KZhdNtIoZ1hqWUSqOYyGJmG9Ai+GAExPBQW6iSk2szLQqa1diII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020697; c=relaxed/simple;
	bh=D9UWu/gQQnHQlPKCWZF2A1LL9fmwajVXhNbGOBRnvzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAQC22uayGPl2d7weEcGr6/4G5bbbCZAejsGVJv3JLCF5SFGBr6lqxiqdd8BmrKxkWyswvggKo0yMAYXgGogcBNxERAddahbRYGZjJRx98F+iMEuCtkrtSfEIYY7tJYxsTuvBxX9uq82IMVQ2ZnbvpLalS2adbu0xnzZrHpa9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHpmyw7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABuJ6020444
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vHCjYO0ES8GnURwdE9zoXLkg
	FqQQm+yrdu6ceYSTxV8=; b=YHpmyw7uP+fQICIKPP2QgKGCtFMWWngEdt0Y0dMh
	jy+QS7CJufQf3pEjaDXXuS/akKu9a8pmN9kcqA6R/EzpUxMipGfCw/9nAx5PziT3
	u3DmD5lILEi5fFxWEAptm2w14BuW+wdQaCYXXwBdQUM1KdW2I421OwEWfPImGNil
	cnRtMbheWSDT2O+ZtuhbDcEBBVfDameA33pEmGXUFiGDQm+v02L0Z6HmyLkyWDvZ
	CK1YdmDnKe4fbGUD171ZahB42E0sOQ3IFRpGL3H67tJVFd/CIspFXdmFXB0k+Sdd
	jUwsaFBY07KF+78PROo06ejhu4lGzQ9OXiDC7DA4yczbgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm4de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:04:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so62371921cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020694; x=1758625494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHCjYO0ES8GnURwdE9zoXLkgFqQQm+yrdu6ceYSTxV8=;
        b=pGNGnOv16DBJZK/hzOpfWLNVOY3wwyMxVFUwRL6Y+IdByex5+JdK0yvXkHze/Gif0w
         x6k42RO+OSfpQA45kNQgx9bC3a61ELyOFbbcdWHJNoNKnhaD0XQsQOT0DVDnZm/J4mNo
         BLmkGa8KMtpYX8uEP3LOoBfu4IBxUmzK5QuQRP34YYm6jj47X/VVzNWDZNzNuJFhe9Ll
         nL18SVkaZGTMHVSrJKUT6Vf4HU+zRmjmfXbboawzo/k3FB/ADpUkl1TqS4b1Y/GDqVB0
         6tK6d41vuBuVFpTNih3yQqp+zY6DORcJQlZYsVHcJMcDin4sCFgXa9lYSnXL03CBl8i9
         DKDA==
X-Forwarded-Encrypted: i=1; AJvYcCX5MuRr8FRli1YhVtV5QokX/FWivqQk995MX/6zV7ShB1uzcB9hHLm6oELI3uS4I4SpHRUwi01xHowxKaCc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx62sGsWogCTeoEUwsLehcNxxlkBjJwbvTaMni29tmt8hnojk1
	Qnyd1Wcw0XgntVj0Q9cqP9ILiv0hltgyAyi8IAgKBNn/RkRd84e6Qg4NfTHRBX4dHuQizXK6J5L
	O+b+B1LLf5oR6FZ29HwrSzRF+kyXZxAkPgDoDg3unKKD8udj2CdyPlr+3/oxgjuBesfZd
X-Gm-Gg: ASbGnctVEgYigGbYUICezrnKempg+Bwq0bJFY24+KwpZFpfrKxfG62emM3wA8Y7jD9D
	l/y4XSrDfOXuABFC2WujtXzNboB3r9Pv6kzFRi/+uIFTZEUj6P2BVGcfDIaYazTOc1j+aCPY5G6
	iytU7UGDrQgpO/AXWfqnjAE+sTXqBT8ArxKdkCD3PaHXml3tWbp49yqElPQKMdENmiOAXthSgiz
	eGR+KSaE/vWrjZG3zJ7GZn2eHuQNCoWfxXLgk5gyIw3vFp+JsjA6cYhEhRmSPdliX2nHV/tEeQx
	EJJcekUmTafqr9C9WRKOGPSpQzPqOhju8/SfBoo3Eu1aKr4lGz28ZKhLPtpyi2jKCXLQihk9ctw
	suLf16tPXiuMOV+K9gDujJPvDvBrO/jSTCARNtDrlJU8QCoaC3Wrl
X-Received: by 2002:ac8:7d8a:0:b0:4b7:b010:9398 with SMTP id d75a77b69052e-4b7b0109485mr48756911cf.66.1758020694437;
        Tue, 16 Sep 2025 04:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6CFcjOUHfVB3qDL3/3Dgy6gktvnzjviqaP5HM0+Zp284gX+z2P0MiYsdiK9Z9DwpAJOTgfw==
X-Received: by 2002:ac8:7d8a:0:b0:4b7:b010:9398 with SMTP id d75a77b69052e-4b7b0109485mr48756191cf.66.1758020693781;
        Tue, 16 Sep 2025 04:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-573c8330eb9sm1927373e87.60.2025.09.16.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:04:52 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:04:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yingying Tang <quic_yintang@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Shuai Zhang <shuaz@qti.qualcomm.com>
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <umnolmlh63rgtoj4e6aubaupr3o44gxcufzele6wkxlosukskz@d5kuxk3pfkfu>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
 <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
 <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
X-Proofpoint-ORIG-GUID: wQAXyusdX6LxLM6Rhtj2C-1Fkir5noJ9
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c94457 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=JLD08uh4RoC6iUDgxfoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wQAXyusdX6LxLM6Rhtj2C-1Fkir5noJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfXwGWpDQazCut2
 q5SR2/fN52QoRWJoLMDTYtTruqMCtYXLDer66XWtDAOI9mY68c9Uv3ofCI7IYA8erBdaMHTvYCc
 zA+gdNq1YJ/v9K4+Asm819uxNzy4gDwQdYB9g+7zKj0nwg1Mbp6Ush0zpHKlrFh/UEDrqH5EjbF
 efobfsoaTH/On7jxk+qPv2m/y0ZDQkG6brh1idIIIA9Mr41NtP4Dry1We0AlT1ZUqg/vtAi8C5o
 mV9s6UssckVe5S9m4D/V9BVnLSk/yWE6VSUp8dw0skQrg8ivv2d9tbfFb3suyLsEcSEsMaDhLIC
 qc63Av/i/BO04k0NDjoGtFBHWBuUcMtlebDQFQ2PdrtD2DvZTJFwvM/bDguq5wJcWdvpztq0M/q
 1RkyuW02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On Tue, Sep 16, 2025 at 06:29:08PM +0800, Yingying Tang wrote:
> 
> 
> On 9/16/2025 6:14 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
> >>
> >>
> >> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
> >>> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
> >>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> >>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> >>>> embedded system capable of booting to UART.
> >>>>
> >>>> Make the following peripherals on the carrier board enabled:
> >>>> - UART
> >>>> - On-board regulators
> >>>> - USB Type-C mux
> >>>> - Pinctrl
> >>>> - Embedded USB (EUSB) repeaters
> >>>> - NVMe
> >>>> - pmic-glink
> >>>> - USB DisplayPorts
> >>>> - Bluetooth
> >>>> - WLAN
> >>>> - Audio
> >>>>
> >>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> >>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> >>>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
> >>>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> >>>
> >>> This looks like you should have Co-developed-by: tags together with
> >>> their Signed-off-by: tags.
> >>>
> >>>>
> >>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
> >>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
> >>>>  2 files changed, 1222 insertions(+)
> >>>>
> >>>> +
> >>>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> >>>> +		compatible = "regulator-fixed";
> >>>> +
> >>>> +		regulator-name = "VREG_WCN_3P3";
> >>>> +		regulator-min-microvolt = <3300000>;
> >>>> +		regulator-max-microvolt = <3300000>;
> >>>> +
> >>>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> >>>> +		enable-active-high;
> >>>> +
> >>>> +		pinctrl-0 = <&wcn_sw_en>;
> >>>> +		pinctrl-names = "default";
> >>>> +
> >>>
> >>> regulator-boot-on?
> >>
> >> It shoulde be regulator-always-on
> > 
> > Why it's not boot-on and always-on?
> > 
> As I described before, connectivity power is voted by UEFI in boot phase.So PCIe link between connetivity card and RC4 is established once RC4 is on.
> If we set this node as "regulator-boot-on", connectivity power will be down first then up. That cause PCIe link down and the link can't be trained again unless you reboot board.
> So we can't set it to "regulator-boot-on"

I've asked about it being boot-on + always-on. Any issues with that? I
doubt that it will cause a spike on the regulator.

> >>>
> >>>> +		regulator-always-on;
> >>>> +	};
> >>>> +
> >>
> > 
> 

-- 
With best wishes
Dmitry

