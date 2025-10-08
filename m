Return-Path: <linux-arm-msm+bounces-76493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8949FBC66CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 21:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF5D04EC3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 19:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8612C15AF;
	Wed,  8 Oct 2025 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSdS5V7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571A1F9EC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950518; cv=none; b=BUjYcZzL2aRT7yzGRMEBbMviipywQj2m0OGqRx0WwqkhXkprZhtD69lwUBGdLJrMMgRNJTzuyCiRaEoq+ktNLFwtrUE1tIg0yWucJdg66zGPthTsQ6XKVWDV26b5CCD0DZrWMCypfWQ6Bh1CrfUXdc3eJ0BAQlW9LpTBz9E6IGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950518; c=relaxed/simple;
	bh=36H8OByZz4/Y/E0gK6HuNWj3lJs38jOo6haF23jGHnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8GqPMGbJNrqpX1pu4Vo4200TB73s9EI8Pw40H2/TmvDsTfT+28lSKj//GOPMTAJyVjYYYrjUkoX7HSUr23b3gytE3BcB+rS95yx1cdtCRBeGP1aodUFUaqAB26FXLS7r4Nvjg2fNeCiPvjAOo5q7rz6m1ykhMclgGA9cT6Nqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSdS5V7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5vXX021234
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 19:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rw+KzFLht2yFEyIY3QTrtR4U
	azMsrTevmU+uxmGDP9w=; b=PSdS5V7S4B5LBHn/bBi7uCxcLnpqO98yWb2aZxkL
	lHs5i9bU4aIKC039KmHUdulwm0yCEhO4dWty9V8u9aY5N4T/vnWejxXYq64f/OZ7
	S63MguaLUpJpbI968PxkYiryqfI1Z8c6uhPzDa2WjBu9GrRcv0HB9ABQ5qlvLTAN
	la5vrp2lBgE1afSvxkRgwqZXXfwxNDosmbqLLrDPJAzNStM+qH3o4D+S/3f2DZdD
	oQjt3tOvTfi0Yxzq3l9gWBAOkmsA1gINUmpL9RpSm/0e/AJZ+GKQFaMotmfLl8NJ
	/JIn/yFtiD8sY+9NwjFQ6JPr1mQaZuQnKyaCF07D5mLYSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kgb2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:08:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e574e01ed8so4719301cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950515; x=1760555315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw+KzFLht2yFEyIY3QTrtR4UazMsrTevmU+uxmGDP9w=;
        b=kEVsYTfR7p9WH9IW7t5XLGYX59zbKkbtBGOQ1itWQ8TjBVUrKiqHf5vjz1E0ugViPb
         NlC+ci8oJQOqpZ9K/PzABzZ+ThAPV1YWYCebi9CtHBZx18HBR4MHSBUg0MM6mMFqMr4K
         Y9THry1/1P+6bh5S1zF419KB0BsdGyIPZTsjbBhYa+9tZaaF55Yn0ZmyoDHopEcwS1Kp
         w3qrYdqPcFPTcW57gvguFiHN77GLdPMeupJOa8RkHjFns9fTosQx1IfTDrDC7ZbXHuiY
         LUz15Za1+tItZ5b+SLCk4to+0xakMCoaaUynnTVGVfEtoHmbNwUAYZC1IeylUdd6ceWu
         46Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV0YyiUxE9EBM9w5+qYT5sZpxNal1eiAw1i4mq7wkUl1VIsc2gHtrKPTLIwgDPhyW8ZYnCGClRs9fgStJj0@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1lXzo0b2X4OLQpW77nuPn5y1qSXszbbSDAtL9wlJvdnu0vQF
	I0h37lZ6UR05XMW1F9ISi5q0VtyhIxn4KCEgykZHM3+a7Ms5RDvPbtOzV/EkTWRxPPCvzKOd166
	4Xy0JpPldcLEnsZMHp2xdoJ880tQJA0a0eJsafEZu36TGK2m9yNNlKEy0tPJjXWoghiAz
X-Gm-Gg: ASbGnctV9dHoHEtz7PfqVT5KrlFAgtpyaqKEE0u5dJY9cR0GD53kxPEZWPJJEixPj8c
	4xat++7KPliNIFoXA7d3xhTBFUBFHT4hS7Rl0ral3qSi1Q+jhFK9F4wZGSis/0OiUvOMw0iG8RJ
	US2mhSKyXR0C5QcQ1PhD/1ZPvGjkQ6r7+CY33zQLjwjJqK2Y3NVJniJlH4t43FkWDllPP6OEMFp
	+Y4tLcHQUQeF/qS3N/JN00fYKdB6ULbq4zaUcYgDmcSfHjT5Z3BLQ/OSqo0jf2qkVet7KIZJ4k7
	T1dv1BGDVgKvdWyIJPsNPNRMNZgld59Ydc64aOgeQEwOd8UBYSuIyAWQdewenOopv3Gtm6qjG+f
	hsDaZYRHlPp9UpegvMp1gQ8mOUTa1cI5ESGQuz4cX/i05zjXd4Pt8TWDW6Q==
X-Received: by 2002:a05:622a:4206:b0:4dd:e207:fce with SMTP id d75a77b69052e-4e6ead64a22mr57960131cf.70.1759950514841;
        Wed, 08 Oct 2025 12:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9dfHI26F6tmDQPEhiuoqrcfAbe3ngcx7SImkYRwO78fn/4c/EYGv3VDRX+xMY9m3o8N3kCw==
X-Received: by 2002:a05:622a:4206:b0:4dd:e207:fce with SMTP id d75a77b69052e-4e6ead64a22mr57959571cf.70.1759950514231;
        Wed, 08 Oct 2025 12:08:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fdbc4sm22092051fa.17.2025.10.08.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:08:33 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:08:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8750: Add PCIe PHY and
 controller node
Message-ID: <qref5ooh6pl2sznf7iifrbric7hsap63ffbytkizdyrzt6mtqz@q5r27ho2sbq3>
References: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
 <20250826-pakala-v3-2-721627bd5bb0@oss.qualcomm.com>
 <aN22lamy86iesAJj@hu-bjorande-lv.qualcomm.com>
 <4d586f0f-c336-4bf6-81cb-c7c7b07fb3c5@oss.qualcomm.com>
 <73e72e48-bc8e-4f92-b486-43a5f1f4afb0@oss.qualcomm.com>
 <8f2e0631-6c59-4298-b36e-060708970ced@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f2e0631-6c59-4298-b36e-060708970ced@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e6b6b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8Rp3m3j2afKyq596a-UA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9aVPKTq3av9FHbYKQOylBxENqwkQQW21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3NjcgmAoC01h
 gzjnC7+tt/nWyIR//NYdtTycVdb1MEtJ/72/eGcYMyyWcMqnJtXG3mODrFGQPwgCJxaCbCIyCp8
 BenuUuLJPCBHqL/++SqCnIwPyivkKmPqLG1AsRfyayvs7C3axNiKdry8KDA8LZ0QMXzEnBSQmlJ
 XYFQrrts3MTqbcxxfcCd74nxMne/P0evTylYRSBJDKVQ3H9mOG9sj3FddMp0xFER+6EFZXgvJm5
 cblqu4khcuP4HBbRfnZHLHqY3oFI/yEOIa9X92rQiEpKwV8Ea9UL9/453YMQWgjn0/Rb838VE61
 ADu5mbjighXCi6S5Yjhg8/TpawQgll3MyS4+416dTDpvpqDkdYhLggsFbA/e7d5xhGuEfcqMjy0
 eCjq+GJi8jzQpOVXI8hn12dFEhOcSg==
X-Proofpoint-ORIG-GUID: 9aVPKTq3av9FHbYKQOylBxENqwkQQW21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 11:11:43AM +0200, Konrad Dybcio wrote:
> On 10/8/25 10:00 AM, Konrad Dybcio wrote:
> > On 10/8/25 6:41 AM, Krishna Chaitanya Chundru wrote:
> >>
> >>
> >> On 10/2/2025 5:07 AM, Bjorn Andersson wrote:
> >>> On Tue, Aug 26, 2025 at 04:32:54PM +0530, Krishna Chaitanya Chundru wrote:
> >>>> Add PCIe controller and PHY nodes which supports data rates of 8GT/s
> >>>> and x2 lane.
> >>>>
> >>>
> >>> I tried to boot the upstream kernel (next-20250925 defconfig) on my
> >>> Pakala MTP with latest LA1.0 META and unless I disable &pcie0 the device
> >>> is crashing during boot as PCIe is being probed.
> >>>
> >>> Is this a known problem? Is there any workaround/changes in flight that
> >>> I'm missing?
> >>>
> >> Hi Bjorn,
> >>
> >> we need this fix for the PCIe to work properly. Please try it once.
> >> https://lore.kernel.org/all/20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com/
> > 
> > This surely shouldn't cause/fix any issues, no?
> 
> Apparently this is a real fix, because sm8750.dtsi defines the PCIe
> PHY under a port node, while the MTP DT assigns perst-gpios to the RC
> node, which the legacy binding ("everything under the RC node") parsing
> code can't cope with (please mention that in the commit message, Krishna)
> 
> And I couldn't come up with a way to describe "either both are required
> if any is present under the RC node or none are allowed" in yaml

What about:

oneOf:
  - required:
     - foo
     - bar
  - properties:
     foo: false
     bar: false

-- 
With best wishes
Dmitry

