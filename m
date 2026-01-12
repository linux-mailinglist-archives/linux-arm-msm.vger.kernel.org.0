Return-Path: <linux-arm-msm+bounces-88444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E6D109A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6385E300C996
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 05:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8338030BB83;
	Mon, 12 Jan 2026 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2pEtPTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hz0ikW9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144C2D8767
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768194035; cv=none; b=Hf/FFKOU/SkS1CGXoc3UMooE6Q82eo3csj8VC+L1xNYwZOOW67yS2Juy8nk5EdYg0wdvQh64DgvcyDiY/7v5tsXeWoccPEnZhu6McHGQaKUEzuzROttxMKttpwXdl610Cu2fFHq6RdX2DcJvnb/GtJm/vkucOF65ctBfpFzljBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768194035; c=relaxed/simple;
	bh=t3r3AXoBkd0/ngre4hd4qcO9ERUUsuB8LeNH5EljkJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szh6DhJpXDt1aA86vbqeKWL9QBZ2F/OBd8PTxDjUcfndRbO3+3xwUk5mgOZfPv8pMr6909Z6FNvB34Ic6lx+hJ7jyaAnnr2I5Z6MRuBe+cd1uQoHd1rs/eXfJoJeSYXU90gzrGL+w5oTou+pc1aWWSzUlzc+BVK3f+GvSgT3wzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2pEtPTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hz0ikW9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNo14T3130406
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cy19z6gu1PtzGgaR/dtvCLM9
	DUS663N/jPuBATe9Cv8=; b=L2pEtPTtaz0chwecRAf8wtTioxHuT+j1Xa90dCCq
	yaMa0k3zwUwFYAhstkya4/XV8lHQHRLJn0JasHsn/YIhg0VAyzdGQ8UMOK+aZm3L
	gkRcdsRCfCyB//CainXn7s83IazM2vyqisQ5WtjwQZMMHk1CbSy3eLV5uwylhEvn
	49NOEdT3LXXCGXRTNPFszNo6XKnRnwzePgpPLrrBosJHqrOmDNCspqMGxbKuG55p
	Vf2CDASXFRdiEeSXiYOx2+ellkElvqWs6vquk374c0rFOlI39StIa2cmxJH3HDr1
	NmnFFg3Dzfa860kTqo6cotk9GdQKTyBKc+8Q7amracL0IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk40rsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:00:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1700633285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 21:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768194032; x=1768798832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy19z6gu1PtzGgaR/dtvCLM9DUS663N/jPuBATe9Cv8=;
        b=hz0ikW9LpFqWih5k93e0AAtj+C/u05pAqKHgu7TGPhM+AE0EfKxsDUNXV5XzObBoSf
         31+DoKkyOLCNd+5ggzB7FTzKfBK6vgQsuEs5mZNWmtwWMwXxDarcqElBQ6UYqkU57UvY
         5sEaMIoLLoanEy3hP+lnbLrGCZJRVV/+CbYE20yPNCcdKhtLOj3he5iCZ0p+d/XIGltk
         7mOx7B1Wdq7vvxWW5ta4rJY7QPvfE8PPDa8brYTSf64mG1SZ3b8uGUTxu3NBmPRCDAKr
         C/gzVWfl/cKnmVkHOJWveeDlno/4HVQV49GmCwzpEfBs/zxLdQpa4r3KhAsyHmz4n97W
         hgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768194032; x=1768798832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cy19z6gu1PtzGgaR/dtvCLM9DUS663N/jPuBATe9Cv8=;
        b=Hz4kIGaXBNS/6MBGmRmznmckQpjLtigiRMJ94vRmEqmEBabSHsH3NHT1zIjgzLHM/L
         dBGge/KHbdn17ExqVRg65NWOo6ur9k5F2OIiq8vag69mYNrKR8h+ol1OyQF94e3NA4FT
         7AVqsEFqEUL+51e7Itj/DXoUXV1x2uaJ4J/NsiJMBPEMbfqTBsdbLDDVlWffCocNR2pw
         eTK8oeCKxqF5VMDPNpBH2u2e+zAblDwr8+FKApEO5Uzy3qXkn99DDd/VYHM9tOvDVuog
         o0Ucew+q1gKRbiqZ6vguj0sVjQAHctuYODFFTTQwMDKttsdFN1GJFT8QK2lQHEmo9cNo
         VvwA==
X-Forwarded-Encrypted: i=1; AJvYcCXS7os5fl3OqYKn6auoMAgvjo22wV3+U8NLO/bHxTGlnRHIihF1CWvl6fjFlQvOV5TVO65oQebgiUQBoM9m@vger.kernel.org
X-Gm-Message-State: AOJu0YzwhXIUc7Dmpv1D6f8tNfOYNiMeeWrDruXmcoZrGUBDQFnsjtcd
	hmvJc8tCtRkDdHyT9bRD57+eNQSOp2bawEfO59s5HGSNs5KzEnIX8WqkbZHTZMsif5aJXwLTZli
	OWAICS8JjU3oyylD39VvIV31Sw+y/lgD5ZdBRxKwVmUeMmIWctWuuCsmXPEjUxHntFMw9
X-Gm-Gg: AY/fxX5MNbjLB9FFlMcaHgLzaqcezm6PtmPQBSRZqixu1JnumoheFRhx2CW/KpEBTnS
	qSh2xHMjM18uaMLBMFGiEqNDmx2cG8Z1eHVQS58vD5WqEqS+TinLfUsOEkbfSHQ7ZdhuEx7KyAB
	kTvUvhD+tI0j+ioiX1VO1QA2h+/pjdkNowSsLt080mlc7yUFAwvizdLSbQi9oMy6UWMetwbPCQF
	zhQcLDJJzENJnQ7UNtyigw1kfwwmY+c+WMq4WuKE7NHHwQA3xPRavX3Tf05t0cPgK+1RAlXfsRa
	USDWPWmx8KxXZd7syieAQ1TbOuRmKwaTNR2FRxHrZMFNVVAxT0fFtIAiGgRLPLT7T4xHl4L2TfB
	RmrREUFwcrlSL8bxvzPfWL6d0ufe/qQx2IzV1ZLsL/8NEoLRhXAdpIpFb5SoRjKwnlJ16DVMdVK
	5szrVbhq2w4K7FEbv3usvOcmk=
X-Received: by 2002:a05:620a:d86:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c389426b89mr2197974185a.90.1768194032026;
        Sun, 11 Jan 2026 21:00:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES4T+bcp+TdOYNVx5YOKEqtPQzqoanBejmY0l/1xyHT3qiehWElvYSMRXqTv5QYszLVZ+xgA==
X-Received: by 2002:a05:620a:d86:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c389426b89mr2197971085a.90.1768194031536;
        Sun, 11 Jan 2026 21:00:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7868955fsm2831961e87.2.2026.01.11.21.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:00:29 -0800 (PST)
Date: Mon, 12 Jan 2026 07:00:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
 <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
 <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
X-Proofpoint-GUID: CwsTJCsfYVPccG9y4nKgxIUBRBZB9Fkp
X-Proofpoint-ORIG-GUID: CwsTJCsfYVPccG9y4nKgxIUBRBZB9Fkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAzOSBTYWx0ZWRfXzeni1hE+En9p
 MstZ6q+9vA29erHsY4JXH1omjVjlARbTe+N9lYIAvXvuUQsJuPMpHx4mGfsUpg/0aaD8Zks62Wu
 9qxfZKUlj2oX5zeQaPwfy6FDsym5I4+adKUhWTwNY/5XU+pUqwo/7WpGLveW+FND0GWVNWP6jXZ
 zZ3TN1q4pZkkBgXjp58GJ2Cfn2GzT8w1aU0iHCxi4zx1A4eTXjM8MMCT01qImD7iDT4zmb3T83F
 DCVBO89+nlb2w63/XjB3qnOyqJWLGdiTwV1Zoa9D7rlp6NQrwcWIJiiyRov1c4EK8lRsuKrtInd
 02EtnzCKPVrdja3BxwRYa9K9jstE/90cFQGcRFn4IsBH694TrB6wjMlByaA1Qs19UqfAdqyt60T
 9GZPi/VyjSG6eo5vLeFvxd+GyF8u4HMLVGSc9c3+jIE9TaXjpIk6p+7aldIj5GpN4JlTxmutWGQ
 Sm5BPxHYosocJ0nN0dw==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=69647ff0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WRrWcEVuY01nxyfF4fsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120039

On Mon, Jan 12, 2026 at 11:12:09AM +0800, Yijie Yang wrote:
> 
> 
> On 1/9/2026 7:29 PM, Konrad Dybcio wrote:
> > On 1/9/26 8:59 AM, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Purwa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > 
> > [...]
> > 
> > > -	backlight: backlight {
> > > -		compatible = "pwm-backlight";
> > > -		pwms = <&pmk8550_pwm 0 5000000>;
> > > -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > > -		power-supply = <&vreg_edp_bl>;
> > > -
> > > -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > > -		pinctrl-names = "default";
> > > -	};
> > 
> > Is the backlight infra different on the Purwa IoT EVK?
> 
> As you can see, this Purwa file was copied from the latest
> hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa.
> Therefore, I need to retain only the functions that work correctly and keep
> them aligned with the nodes from my initial version. The deleted nodes will
> be updated later by the respective authors from different technical areas.

Please, only delete nodes which are not present on the Purwa IoT EVK.

> 
> > 
> > > -
> > >   	wcd938x: audio-codec {
> > >   		compatible = "qcom,wcd9385-codec";
> > > @@ -60,32 +50,6 @@ chosen {
> > >   		stdout-path = "serial0:115200n8";
> > >   	};
> > > -	connector3 {
> > > -		compatible = "usb-a-connector";
> > > -		label = "USB-3-Type-A";
> > > -		power-role = "source";
> > > -
> > > -		vbus-supply = <&regulator_usb3_vbus>;
> > > -
> > > -		port {
> > > -			connector_3_in: endpoint {
> > > -			};
> > > -		};
> > > -	};
> > > -
> > > -	connector6 {
> > > -		compatible = "usb-a-connector";
> > > -		label = "USB-6-Type-A";
> > > -		power-role = "source";
> > > -
> > > -		vbus-supply = <&regulator_usb6_vbus>;
> > > -
> > > -		port {
> > > -			connector_4_in: endpoint {
> > > -			};
> > > -		};
> > > -	};
> > 
> > Are there no Type-A ports?
> 
> ditto

?

> 
> > > @@ -920,23 +886,6 @@ &mdss_dp3_phy {
> > >   	status = "okay";
> > >   };
> > > -&pcie4_port0 {
> > > -	wifi@0 {
> > > -		compatible = "pci17cb,1107";
> > > -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > -
> > > -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > > -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > > -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > > -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > > -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > > -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > > -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > > -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > > -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > > -	};
> > > -};
> > 
> > Is the Wi-Fi solution different?
> 
> ditto

NAK

-- 
With best wishes
Dmitry

