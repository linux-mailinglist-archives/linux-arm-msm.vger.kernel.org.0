Return-Path: <linux-arm-msm+bounces-76292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDCBC32F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 05:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6193AE03E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A6429BDA3;
	Wed,  8 Oct 2025 03:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6XgONKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8DA295511
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893099; cv=none; b=ln/zqr/04M+i2L4WjzSMqagBawxxEYeWDkUVzVBmh6s/LrSm+VAKofV0DcMPb6DbUXaFurEkog8hNeIss74F69WoxfkDh7llJigewH1mkqzdI1afhruKfM1fZZ3bcAzKxOA74+W4EL2dO1aGspUVZGaMpxc6dZp+Nz+QmIETyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893099; c=relaxed/simple;
	bh=HiXDieK7e7Pyh8O43mqXjGQ34eLmxa3A/CZzcAsnCD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5Bgv/1DviDxtk9Mjog8WaF0FPX5gnwYQst5XVPWPPJTdNS6NOoCGuAMmq0lG9Ifyi/oG4qOeUumr0pgmHtExn9eHUXVQ56tgILZ4B14hUpgw+M5WxBA6Bh+xPbXELlBgISK46nkQ+Joxhnbj9mfbzbuI2+2kwS573gjBNXi5SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6XgONKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803gZJ026448
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 03:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7ZgKtSpSqXDvaETVdzjIPmF
	kUOdgWMnn3nd6TOrku4=; b=R6XgONKF5u9x6niewIFqqZ/7DJeZp4qn5Al4WUeF
	g1H/tGo6JUYj5+IhqWZ/nhuR/PkCFVsuTEvO2+wDqnbDQDivK6o/9StS21c9hMRW
	A9wZP536niWtR3YUlCwMvpMQjW0Dg85q2CnvyVc3rS10HTRZPMvZORfG8gcPZwhY
	FFxH2D6m/+iB11BxCvpfyAo/64XW3indPpuybxc3fJXjp85vC6EI/z6OwZGjF2FS
	ybs/FGi9jaurDi8TmUsWmLVhBvBlmEzyU7yanW3FEt0FmxWdrcWt1CFfYPQ70nGY
	rHcRkPSwK6IVFlsFDo/WaQWwLDAbwJ6C1QXJGpRyDRQ/2w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1s4xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:11:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e5b6f1296so135875016d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893096; x=1760497896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7ZgKtSpSqXDvaETVdzjIPmFkUOdgWMnn3nd6TOrku4=;
        b=IweQgB/W6C3WIRmL7jBVQoTn1EoisXib7BxwczYKNzN4F0g+MeXSu0ncPxTNcG6hda
         jHwWiaF+EPJu8R5xKNtsapIk+/vavcS6i1HisHTDisxAMcNDcKnLA4mcrB1IB4SCtxd1
         iAeAFI7q1Z06XuqVaondQ4LNMZnXefz3LPCtHVTdY9Kc46U2YityZ/uQ+Ng64ObBGNmE
         I3EuoRQ+Uz873K3QXyIV+N/Ht/dF50srT/8Tnl6Dqs026mWXcLhU2eIgPAjx1i0ZxDxP
         YOgDswAYDS35NDlh9D7fuTgAbqVhkEWEQnHkDcFx/b1r+wsIqW5D6mj2KqVs7+K/Qlhq
         QbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKHi2VuuFJR4zYwwL3WuWFGpRO4MVkVYU4rbPdZQrwRQaaXhp/izHBzqW2N99QclQbuoYEelIJ+D3eV6+@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6W27gZkHeWIezAODMh4hFZlThYKzVv0mwCjCvzkYM12UogW7
	0+neDbxaVWxxAosyoArDl6aVkebqJ8zYGSmvGWBtqYV5m5gYP/jNcRooJE0XSgABhzmZdirCq7Y
	4ziI5YkqrCa22nvTqR0fkmtfSx+oe2Q09D87xFKM7xfvtgyK+5X+5vMwZ4j9WF7YYqHLV
X-Gm-Gg: ASbGncvzjCYsbYVaSTmmod+YCGRvk0PYt2Sj8vZkVY7dsGQ2Pb0dHZGKZtvSNhwAXcz
	KiJkWEWEP79uNfrXMC1lt/c601sawHHyAL9BhDQKhLh4x2+uV43iWxPtdNgkn849zn5YJ3OyZjl
	OW3KoY/TcTllqf5biCbOMgpIu3YGfGTsVmwDXxW+cUUnSlqIzxCX1TRPU2pzpt6HFzUTTmKfnud
	JfwgAY/0fBj88h+JienzS+/g2CTrFCDt4XBkP80rKXu9q8ffN87WMO4vDXvZFcXZ02F93Dwlmy9
	8O1j9GpZrNpBXuRO5pBdCk4DNNIA/QjlLPEyqLo1MVKd886CmzfZfXN8RU59yuwmAtk8XA8S6Pj
	iBEDyt2JdPioCAr5JJ7qhS6o6dd+yLvxwqt03uKLMHk6R6lpGMod+umUdEw==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr28895851cf.23.1759893096252;
        Tue, 07 Oct 2025 20:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkh+CUWhF0CTGgfG3gncI91QsL3S9Zc4aMcT04GYrRnHpO6emXxDg64/ZXWJGcI0TQhlaahA==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr28895511cf.23.1759893095699;
        Tue, 07 Oct 2025 20:11:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d836sm6729700e87.88.2025.10.07.20.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:11:34 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:11:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <ogslvjglnz56lz6nria7py6i4ccp6zvcd4ujpiusrq6xutydsm@xb72os5wk67r>
References: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <85f62a4b-cec8-48a1-a232-7f904371e390@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f62a4b-cec8-48a1-a232-7f904371e390@quicinc.com>
X-Proofpoint-GUID: puRt3s7NN06uOtYKg8qloziNF0lHRRZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX/Cqh5WR1kbXe
 sI11wUA9zCgwQFtb6ECcex1OwGAqK7sLGKkqt4hHuAbOFqungX2NBqX2f0FVboYrP64/VpMQsQD
 sOu6YVGZKC6gWF1xXIyhvwQ4S/0e3hgn49BX2skUvMjNo3QBoOpErZbnFBwLtqSKJ4uXnSj7yEP
 wur+g3PzZ7naL0xVA6j09QSeUL7VmPLveXml1m/9xtGufacZ3p6W1ZDXLsYHV9wFH/zt/G+fcrh
 H6/DfiuXj+Uj0Mw5M3KlstbI8lNziPmHKCAUzbhFc1UlIhKqRX2CZ5itf9KVnJOEKSeCI1l1n/E
 afGIpRxN3bWJa0tHaCS4XT8+Pjk41feUWb+U8GsmZjwmivHaX1QryENfQdwoVzUTLnCZ1sAWNZa
 HgT7JwkNEv3e3n7EzF1SkvN21R4lrA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e5d669 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=C_jdFXG4BxRmYhdSDkEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: puRt3s7NN06uOtYKg8qloziNF0lHRRZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Sat, Jul 05, 2025 at 12:45:10AM +0530, Vikash Garodia wrote:
> 
> On 7/4/2025 1:53 PM, Bryan O'Donoghue wrote:
> > On 03/07/2025 22:23, Dmitry Baryshkov wrote:
> >>> I still give my RB for the series.
> >>>
> >>> To me the only question is should it be applied to sm8550 or to new SoCs
> >>> from now on, sa8775p, x1e and derivatives.
> >> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> >> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> >> once we do that, we will realize that it also changes the ABI for all
> >> SoCs that support either Venus or Iris.
> > 
> > I think a dts change is a non-starter as its an ABI break.
> > 
> > So if ABI break is out and reworking future dts to allow for a new device is
> > out, then some API change is needed to allow the driver to stop the kernel
> > automatically setting up the IOMMUs, create the new device as a platform device
> > not dependent on DT change and have the probe() of the relevant drivers setup
> > their own IOMMU extents based on - probably indexes we have in the driver
> > configuration parameters.
> 
> The concept of sub device is nothing new, it has been there for firmware iommus
> on venus bindings [1] and i am just extending it for non-pixel on iris. So
> instead of complicating the driver, pls relook into the existing solution which
> looks much simpler.

We should not be using sub-devices. They don't describe any actual block
or device in the hardware, as such they are frowned upon by DT bindings
maintainers.

> 
> The proposal to dis-associate from DT would certainly bite us in future when we
> have more and more iommu configurations, lets say "qcom,iommu-vmid" [2], comes
> in for managing secure stream-ids.
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/Documentation/devicetree/bindings/media/qcom,venus-common.yaml#L50
> 
> [2] https://lore.kernel.org/all/20231101071144.16309-2-quic_gkohli@quicinc.com/

-- 
With best wishes
Dmitry

