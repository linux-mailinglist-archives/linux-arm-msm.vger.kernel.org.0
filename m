Return-Path: <linux-arm-msm+bounces-60145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BEACC782
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 15:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7A8818944D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 13:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A03A22D9ED;
	Tue,  3 Jun 2025 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQMBemuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6D130A73
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956678; cv=none; b=jC0zsGGa/fZT0UhfRfv+I/Qo25xUw/5j/JKEpXfzblMsmaOvG5v+ueh3+HgmH6ewXjeaI0bYnSKuD5J5czBeNVSUUsKKPDMbhS4i5aZKIs2PseCVpcUNDoa53JNzKyYoxsxvZz8plGLPHIbrBDb4GvKjG9otx1AsCCDFXZZ+fSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956678; c=relaxed/simple;
	bh=6iBvI7K6Ap7MSOEGbalH5RS+2DAx3UXzxMrsuLUjNuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3Z8SiKkFAMv3Xn2yqVjrOvqpRahCzmtK9yBTbjYLEDwyWX2nhbu4ByvgQCnZCnIvIdx8YeZePmRJHqOnkPWv8BxXxhpTX8M2hNmZ3S3K85AQGmUj0rtrRuFeFN36VQbRIOwtuwtizYR4SFC7ddwT49eALFgtHwZQsf1a7y3gp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQMBemuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JI3x004261
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 13:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JXGMMgDR2GMRgvSQcH/bx3rG
	d4l8acpfk7Qd16JoTBg=; b=BQMBemuQF4dBmNLN6f4xYX27LftVRJZ4ntFZVPvT
	FbR2s6NAnc8ID8m0sOJ5xURsYPiBILlb9WHsjdzq3coeOQp/SLA5Lprd3bVXteeD
	1fYThUZZzomTy2IgV9mCX41/02ggPVuj87Bqn0QapEhA3SDoX/Pl+UDVjgWCIvI/
	D9nAyj03JwQLf6olY1tNuu7RtGbLZgL0LUbM87RNsWDo3U9IVrdyqiLp7hREtFnh
	0fh+zL4Z2F5NOkWSH5+XPm9ECZq3vEte8cYtKXEUOCXMF1usrkX3VT2R5vqfCJJ/
	hHuvmNB+sYBaLDdcSyfcU0b4RkT74D1xF7OaeM/b2G1JiQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rtp32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 13:17:54 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72ecb622e02so1542513a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956673; x=1749561473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXGMMgDR2GMRgvSQcH/bx3rGd4l8acpfk7Qd16JoTBg=;
        b=et4rf4pzVqY8ePGQCzcS00+vCPT6z+jm57p/Y5bCJTTiBqepN3v6M3JaQtj3ahtkpx
         MjrFR82HoU9Yr8H18wWBaoCCRGa4KQC2dPfa4ejfDu5pj+9kewrmmYR8ikIsco9VOFP8
         jmQtZWYxjQN80A6bV8Y745bQYX+AFby9vVRrAEm0DJ7a1B3aI285fqWMJvfi/1di2bB2
         2Wiy9lcfoH1Vo3ActCq2a3x02cIOrM/kL42ufnspq7IOtj9nld1YbDATHEbm/fW6jWo4
         p6F2yFAxyq5+v5t5nWal3hYVKjDl84Tw2wYdGC+1AJQ2cUZZ1h2gOhahE0eAf1gfocUX
         SK7w==
X-Forwarded-Encrypted: i=1; AJvYcCXLMeWPYLiyf4T2p43F1s1kw8Ecvc9SSpB8/apKRzn3OpD5Ytb9h2nH5MU1olNCWi5bnzlkkzouiLrdIHGi@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/+7y3Sms8pPE00+Smqs7djD6hN6U4YPTJlETD8RTQ7eDoyb6
	Lvq7sBZWCO4sdFKY/t/NbUKDULKZ3n/YzYGaEtybgHwTJuRIAXX9Q31uj0Wc/X6g6AhuuK8/ibl
	qMYoEHqtTQXs9paTkxJ1052qR1Voa88Naj4AsB04xKCB0uc2XG31KI2nn2YnvpoYX20jK
X-Gm-Gg: ASbGncvLiVvXSWnFb19Hinm7ZjPhy3vALQTLxgn97JiXUSdFCzFsLsaCOzhZ0sptzI+
	Cuta990ErvpTkrek/i+haGRNIcVbxTihNiQ/cUpXCHy80yEZ7eJAxHJbg5Lgu1Vcr5RFZqy6xvV
	mL255f/2aXoONYP6zLeAnuBq4OEpuVqgW8bB8TCZKgySlTk4bEt+fk36KaxbihXLbRMtIFB12V3
	eAOYiDCRGzqa857K5zBdpTLOwVPk0WIDkcpDlmRk4p6juRj0pBQ8SObkRY0sfDpO1H6UPCjPN+Z
	HBToJ+dO1cNqO9uVGa5P77sVLIMG/i/ZEVsxiXApFVXHUkJE88TcYVZec1Atdy/GNfrbZTYFNPk
	=
X-Received: by 2002:a05:6830:6484:b0:72a:449e:2b69 with SMTP id 46e09a7af769-736ecef9188mr9330702a34.28.1748956673460;
        Tue, 03 Jun 2025 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJzNn7xzYSZpmDzRz5bR4WkPRFG/MM1S0QGnUE/tMoDRu36FwucQVvMhTGP/O7jMEzHNHQUQ==
X-Received: by 2002:a05:6830:6484:b0:72a:449e:2b69 with SMTP id 46e09a7af769-736ecef9188mr9330676a34.28.1748956673048;
        Tue, 03 Jun 2025 06:17:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d105sm1905969e87.209.2025.06.03.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:17:52 -0700 (PDT)
Date: Tue, 3 Jun 2025 16:17:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <fhzdhzxdwcoiuhx2eogpshwt5cxagjkrygrefqikmfbx3cfcov@awmhgrvurnfi>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
 <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
 <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
 <75dde9a2-3c0d-481b-bc73-089ba89a77e0@linaro.org>
 <71196aad-6d80-4356-bbe5-3070f6b74bfe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71196aad-6d80-4356-bbe5-3070f6b74bfe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xysRdrD4BBsBkf30bb6ggLzeakHvJYKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDExNSBTYWx0ZWRfXwl2dhtuhBltp
 ztEQv319fFUk0yPvpn11fz3Jgu0WY7WD1nnMi/HT0IBQzBc28kDQfz+FrJeenzraarPBEOkQaWR
 8fIGcoYMOAEJOvh41eGbBSc+MhccV8cxT7iAWQIgNQYhHEgt6jQvFO+R4/+bhAefLEQEivhpHVL
 MFrd4sxgQ/FabfRlA/ldRg2WSp61XzYgeBSLWuuPh2dAo5WZl0UkowxVBvdx4aXfvL7V8G0wVxt
 RqXP+ovtFZn/50ZNbSy5MbjBj5EU5XuWhcWDsZPNT4tuae6nIfuCXABpHVm7dokr3XBGqlpSaSa
 ScbWcRUbWRkihI86h4w8GtStUYMJRChFfkD2keKI2ZmjRh8RpcmnprnP3zC3VgvaEuKMG3LIeRf
 tM5qW/y77MxujBbFDTXbSDFRelBTm9ZHPGX2W8Q+13I4dDOh70prD2WuHjkiMRpIEUOSM3Dn
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683ef602 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=G_5p7y9kmCDjZpQMCqIA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: xysRdrD4BBsBkf30bb6ggLzeakHvJYKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030115

On Tue, Jun 03, 2025 at 01:03:11PM +0200, Konrad Dybcio wrote:
> On 6/2/25 10:55 AM, Neil Armstrong wrote:
> > On 28/05/2025 18:56, Konrad Dybcio wrote:
> >> On 5/28/25 1:22 PM, Dmitry Baryshkov wrote:
> >>> On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
> >>>> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
> >>>>>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
> >>>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
> >>>>>>>> mux events depending on the mode and the svid when in Altmode setup.
> >>>>>>>>
> >>>>>>>> The DisplayPort phy should be left enabled if is still powered on
> >>>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >>>>>>>> PHY is not powered off.
> >>>>>>>
> >>>>>>> This series doesn't seem to solve the USB side of a problem. When the
> >>>>>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
> >>>>>>> clock, so it needs to be switched to the USB-2 mode.
> >>>>>>
> >>>>>> I didn't find issues with that on X13s.. Not sure if it's related, but
> >>>>>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
> >>>>>> the USB thumb drive twice for the first time (only in that sequence)
> >>>>>
> >>>>> Might be.
> >>>>>
> >>>>>> But there's nothing interesting in dmesg and the phy seems to be
> >>>>>> programmed with the same values on both the initial and the subsequent
> >>>>>> working plug-in
> >>>>>
> >>>>> Please try using a DP dongle with USB 2 passthrough (there are some).
> >>>>> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
> >>>>> devices. Would you be able to see the USB device on a bus?
> >>>>
> >>>> I only have a dongle with both display and usb that does 2ln dp
> >>>> (I tested 4ln dp on a type-c display that I don't think has a hub)
> >>>>
> >>>> USB3 - yes, USB2 - no (but it works after a replug)
> >>>>
> >>>> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
> >>>> at runtime?
> >>>
> >>> I think so.
> >>
> >> So after quite some time playing with that, I noticed that the USB2
> >> device was never actually kicked off the bus.. and works totally fine
> >> after connecting the display output (2ln DP)
> >>
> >> I was looking at dmesg, checking for discovery/disconnect messages,
> >> but the device was simply never disconnected (which makes sense given
> >> repurposing USB3 TX/RX lanes doesn't affect the D+/D- of USB2)
> >>
> >> I also read some docs and learnt that what we call
> >> qcom,select-utmi-as-pipe-clk is suppossed to be a debug feature
> >> and is unnecessary to set on USB2.0-only controllers
> >>
> >> The USB controller programming guide though doesn't talk about DP,
> >> but I'd expect that we may need to set that override for 4lnDP+USB2
> >> use cases (which I don't have a dongle for)
> > 
> > Yeah basically we need to:
> > 1) power-off the USB3 PHY
> > 2) switch to UTMI clock
> > 
> > In the following states:
> > - USB safe mode (USB2 lanes may still be connected)
> > - 4lanes DP mode
> > - DP-only mode
> > 
> > But for this, the dwc3 should also get USB-C events with an addition mode-switch property.
> > The flatten DWC3 node now allows that !
> 
> Yeah, I got even more confirmation this is intended..
> 
> I hacked up something that boils down to:
> 
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 7977860932b1..e5a0a8ec624d 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -464,6 +464,11 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
>  		break;
>  	}
>  
> +	if (dwc->mode_fn)
> +		dwc->mode_fn(dwc, mode);
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7334de85ad10..ea56f5087ecb 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> +static void mode_fn(struct dwc3 *dwc, enum usb_role role)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	if (dwc->usb3_generic_phy[0])
> +		dwc3_qcom_select_utmi_clk(qcom, role == USB_ROLE_NONE);

This part is a hack for devices with no USB-2 passthrough, isn't it?

>  }
> 
> 
> It was easy to tap into because there's already mode switch handling..
> But obviously it's a hack - should I register a typec_mux in there?

I think so, we should listen to mode changes, instead of host/device
changes.

> Should it go to dwc3-common or dwc3-qcom?

I'd say, dwc3-qcom. Not all dwc3 controllers are USB 3 capable, not
talking about the USB-C.

> 
> Konrad

-- 
With best wishes
Dmitry

