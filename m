Return-Path: <linux-arm-msm+bounces-67417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 756EDB186E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296BF623F6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765ED287511;
	Fri,  1 Aug 2025 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov/k89LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7B1C3C14
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754070853; cv=none; b=YW5DvHMTsAgCLn1Hz2d991d/Ckn737ETvgIK2uq0iwutX9wk5rJzzUQ/L/vGgmHwftUaE6ENAYtBY6iTzaVIFZsSl0XQTNSzEcUwqRc6ggZsrW2lDAYncj8qzK25ndJs1DKJMKpe2ykfF3kTxA0xAJR3LqHk8r0mNlHNku+aC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754070853; c=relaxed/simple;
	bh=fAoe6Y6LPeN/HPnLbHqLpj5NHlL21pCUIdALDreDr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBa3kuyZ0HTs3SPSkqgYMfIkIOCQRXC2mjstFiFXzYnVpmyWw6ag1qLL1KKTStk4/IzQVNqdQ+hHQImuC4alfVuyTnL9wPHk3zyOROW+r0JJzAzltBhl4Ewr4n09NtgjigKjl2ES4HyjL+R7giubdpSGGuPDXIXwkbCsgG0+ggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov/k89LR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfKAZ001381
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 17:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7f4+guRHjktBbGeLl9ySxS18aKIvptkhBuK8g5+Jd4=; b=Ov/k89LROPmGZoQe
	SQAxcIV7umVQbtY/pAM0wiLm5Ws6FY8LL08LCLsfmWOaFNxw0nxhRSIURDSWWMjG
	W1ruyLxnfK42G6+kx0h1F5J1vN5GPnrNE+RGHAbnoqOfMysDe9E8ArDEEUvJH2dF
	zl7yaMDDTZXMJYHl1Ssv+yisSLc5N692DEuRlzM3E+mhNgrMRW4fsOtpc/Lsr2EP
	iKsEO6PUHTrXsT5mX3Brf9ceJT4bF5KAVxBypajuD+eFnESllc3sm6PxrIm2L2qM
	6939zY52TGg7bwNIpJ1F0jMWGeRMJuXXBDxOUHn/LbJi3jR+gHKwvodCOuqhJ2GE
	lOHJNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xtc2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 17:54:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab878dfc1aso47996391cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754070850; x=1754675650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7f4+guRHjktBbGeLl9ySxS18aKIvptkhBuK8g5+Jd4=;
        b=fYIU8BVjZG1RV1ppRn9GpDMcsgapbe+Ibio1x9DQrniwuY7cuUsvf8P98Yw6Fw4qBY
         Vm3/vxMwpz6a0YKxLykD+dHdYZJ9P4uBaxmxE5o17Sso/VrGUoV2xchWQP/4tDzjBbZ4
         kzq6srNkCTZJTRPe5dlchbOZVtw8LEiUa/dtYWgnOtyItG6Yr7Y3RXCI/R7qgf4Jt9xn
         hNppZeyGUFJyLFfn/XuBk+tESY137snnyWW7VkpmOLt6jzFX7HTH3mYIxA2k4++QbvFb
         w5jAxpUxv9bLV2NmISAxq9QIXIIpFeCQwWYln77IxBHWUf1bE8e53y80cf8bzZdgtj9I
         doJA==
X-Forwarded-Encrypted: i=1; AJvYcCUyqri4n4zbaWvJyYrHs8FZkqe6l7NsrnAYz4CnhZVfcSInlR2qbUvQJyeHbZUbX8uvFI61qr4qbUA9SQ9g@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBlYnJ91BMjiOv6OTi/VqSyz9JJjfsd09e2g9mRzkzcJftEEs
	/4suNStfnASwIPVXbIvOdCZgflTnPvGcObBp8Kgua9H3i4dqTsdOJRvERlukp4LGqc5OWb+uhDJ
	m+MT3UWYPt4p4pB+qI5s8RkvIxps3V/a0v5cx8V8yWCXNq2uZE9WNuDvwuO0kH7m6bMgd
X-Gm-Gg: ASbGncsgp+qupwrxqsOigju3OHN7fIKdahmcEbImtEKGgMyRneCK0suohJ/7iX6pj85
	QyseXaXgmkaV5LcwZEeJeYgY21HrXlSVdTQQTbX/ckxn8KrgidXQfOCtGg55IyG1WBSCdp+IYL1
	yP5GhfLcCb18tbIxDYDKShPP1HF+tPBI1kI44eRmPxlSRXfIwh32zeexKgBB4WD0fB0JKQ0Wffv
	vaOUhIpTsor/mE7wHxsrO3ZVVmHAPHRTfwrY4F+LcT+3bj0ad7WqLlqPIruOMCNMYRZSS/f+dXS
	kR5NqIPi+18tYe8D1zu2OEUARrKrOWJ7j7CJFLe+re4xtByFD1P/P87JCC0AKzgRfV5BIsF+JOV
	UCXt8qYaIXF6tkxxH+u70IpHIsWn3j0fO592dusHfO7w0cpfUfSsU
X-Received: by 2002:ac8:5755:0:b0:4ae:f502:d62e with SMTP id d75a77b69052e-4af10d19299mr10950481cf.50.1754070849508;
        Fri, 01 Aug 2025 10:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3kthbEbHtl8fTjc7vGgklihIbJVuQF5n8TQ1Xt9JTa+3yTNpRoKu//yUU3XhxhYkcsc/6cQ==
X-Received: by 2002:ac8:5755:0:b0:4ae:f502:d62e with SMTP id d75a77b69052e-4af10d19299mr10950041cf.50.1754070849010;
        Fri, 01 Aug 2025 10:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cb7fd2sm666886e87.179.2025.08.01.10.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:54:08 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:54:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <myk2qvna427nmfz37p7xniafueu2akpmqzq2y7qmqnzsmggwks@fctmeqkgdkrc>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <pbvyog477v32s4lu72z52dhsond5yud5w3nxmcouvr6ljlndlh@ws46dncy35c6>
 <b4a3f568-f41f-4141-b421-8b158973f810@oss.qualcomm.com>
 <cawg456ucsvssm2ngbcjvpprxke7s3sfqf4fzoj5dtfj2flnzw@2e3h5ojgn4s5>
 <391b8214-37f2-460d-94d0-3bd0daa00066@oss.qualcomm.com>
 <mlbutlxudl5i32zrqegxiefaa2sbkntriwdftn7hxo4khidtf2@oiljtmtktovu>
 <31b03c1b-513a-4eae-9233-568aab12e0c8@oss.qualcomm.com>
 <afd9e24f-b432-494c-8ea6-dbfe4c51e048@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd9e24f-b432-494c-8ea6-dbfe4c51e048@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688cff43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=ugY2ukpke_LRrYEqQncA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: DC4BaMDIlMgMncJHrYUGwTDfV2BfCDMe
X-Proofpoint-GUID: DC4BaMDIlMgMncJHrYUGwTDfV2BfCDMe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX2odU9FJFProh
 1i+WUpmIYg7AzDw9Bq+9ES5XkUVIA0ecnKN2g7RNy/JfwllOBM9KpjYilExth/YXjoISIVzxrnA
 FNStx4eT/6nzS9y/XZ++F8++adTTCsDoIOl8+c9pvHGQCmv5P+BNlM43sHAuoMcvDaPZvQfBuu7
 5HseX8P8jP9VeRJtA6d0rrM108j+JRAQghYFRAeR7IhGaGABmtPsRKxh/h04zQDh8PUCijbTxsP
 li5As6D86MuNS2KEo2TVAQjVfq7Pg74Av+bpeNN0AnLf4t7Hxss9LLFsweChYmVmS6MH4epJOVF
 kmpXQuB4rCGFjDejxcA8X06L0uVsvlP93wJuWvR7GL8TeP1PbJMOvkN/TJGtHW+0UQULXIaSGKw
 nBdWFOdtQcjQcE3dy2or6AFTdplOxdWIIqo2djBB4k3bgDf44y1z6OCVjGwrjrRrDkiStxSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138

On Fri, Aug 01, 2025 at 12:39:09PM +0200, Konrad Dybcio wrote:
> On 8/1/25 3:48 AM, Yijie Yang wrote:
> > 
> > 
> > On 2025-08-01 04:22, Dmitry Baryshkov wrote:
> >> On Thu, Jul 31, 2025 at 04:45:33PM +0800, Yijie Yang wrote:
> >>>
> >>>
> >>> On 2025-07-31 02:42, Dmitry Baryshkov wrote:
> >>>> On Wed, Jul 30, 2025 at 02:28:25PM +0800, Yijie Yang wrote:
> >>>>>
> >>>>>
> >>>>> On 2025-07-29 18:37, Dmitry Baryshkov wrote:
> >>>>>> On Tue, Jul 29, 2025 at 09:32:00AM +0800, Yijie Yang wrote:
> >>>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> >>>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> >>>>>>> embedded system capable of booting to UART.
> >>>>>>>
> >>>>>>> This change enables and overlays the following peripherals on the carrier
> >>>>>>> board:
> >>>>>>> - UART
> >>>>>>> - On-board regulators
> >>>>>>> - USB Type-C mux
> >>>>>>> - Pinctrl
> >>>>>>> - Embedded USB (EUSB) repeaters
> >>>>>>> - NVMe
> >>>>>>> - pmic-glink
> >>>>>>> - USB DisplayPorts
> >>>>>>>
> >>>>
> >>>>
> >>>>>>> +    vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> >>>>>>
> >>>>>> Hmm, so there are regulators for the retimer, but they are not used.
> >>>>>> Could you please point out, why?
> >>>>>
> >>>>> According to the schematic, there is a regulator and a retimer (PS8830).
> >>>>> However, as mentioned above, the retimer is not connected to USB 0 and is
> >>>>> therefore not used in the EVK. As a result, the regulator is left unused in
> >>>>> this context.
> >>>>
> >>>> What is connected to the retimer then?
> >>>
> >>> All data lines are broken, except for some power lines.
> >>
> >> Ok. please add a comment. If the retimer is connected to I2C bus, please
> >> define it too.
> > 
> > It’s not connected to I2C. I will add a comment here.
> > 
> >>
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>>> +        compatible = "regulator-fixed";
> >>>>>>> +
> >>>>
> >>>> [...]
> >>>>
> >>>>>>> +
> >>>>>>> +    usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
> >>>>>>> +        mode-pins {
> >>>>>>> +            pins = "gpio166";
> >>>>>>> +            function = "gpio";
> >>>>>>> +            bias-disable;
> >>>>>>> +            drive-strength = <2>;
> >>>>>>> +            output-high;
> >>>>>>
> >>>>>> What does this pin do? It's not recommended to set GPIO values through
> >>>>>> pinctrl.
> >>>>>
> >>>>> It is used to switch data lines between USB Type-C orientation detection and
> >>>>> DisplayPort AUX channels.
> >>>>
> >>>> I don't think I follow it here. Which data lines? Type-C orientation
> >>>> detection uses CC1 / CC2, DP AUX use SBU lines.
> >>>
> >>> I made a mistake here — this pin switches between two data sources: one is
> >>> DP AUX, and the other is a GPIO pair configured with the function
> >>> usb0_sbrx/usb0_sbtx. Both data sources originate from the SoC and are routed
> >>> to the USB0_SBU1 and USB0_SBU2 lines of the USB Type-C connector.
> >>
> >> So, it's some USB4 stuff. Ideally it should be described via the
> >> gpio-sbu-mux, but I don't think we can do that for now. I'd let Bjorn,
> >> Konrad or Abel comment on this.
> > 
> > Sure.
> 
> There is no DT representation of USB4 hardware at the moment, feel
> free to pretend it doesn't exist for now.
> 
> If we wanted to be hyper-correct, the way USB(3) is plugged into the
> bigger picture isn't quite pristine either, but that's a story for
> another day - need some puzzle pieces to come together first

Ack. Then the current description is fine.

-- 
With best wishes
Dmitry

