Return-Path: <linux-arm-msm+bounces-75619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CCBAE68B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B12194436A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455202857C7;
	Tue, 30 Sep 2025 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e17CAAdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCB1BBBE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259623; cv=none; b=sHFV8fkk2d5X1AWs427Aa0+Y4EfDWlBV3RMS4n1Snej19GM67JoPBjVH/+7wp3KfKGn2S/FkaBddcnmJKToneIg/lsB6Gr0QBhmXkgzfPxPWlCqH6/4shLycRLpZxzmZ4sHhgbecHkKl9Zvsqwr4B8YhQ9ioCLbFB+m4lsPmdX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259623; c=relaxed/simple;
	bh=w4MMi2h8A5GX9+b9Jfk6wj8TawNywWGn759hh7b6Yuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVchAoxogq02n+ElfCZu8dTl+X3RZY7sB/iyRCnYVqdor++xUiqGnnPljBu2icgwuwO6Vk2/eTnWETexwEX/aBY61Wsj6vZ0JEmZwXBQeoXFPZFKBRxYW0U0bIHg3mg9+aqA5ha19pDp3MgV6AuJ0Gcvtiy/wKxbO7fOB6PtP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e17CAAdP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC2kuw014790
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xSV9Cq1e9SR7LQlW44w+/ize
	/XOY0Num8chSiEvfZ7I=; b=e17CAAdPmEViiiRfz9DjP7RWN8bu7dQFSMUkU5At
	rqFHUetkJCwyTtYhVlMAyzfNjmQ+COIt0RzoX1LbuOQBVm616mGtDPTsEOZo/cHa
	rn3O33q//t2dUqleoTN1Yn2BSKwsu/2dzUTc2LVbD3uaTn58OpB4+sG+Rx3zfI6y
	IW2gAyQAQUta8xwKOG+Bwe9eUxSESA0SNMNA4iTS7i1lgsxOJY17i0u5tDWGqi2X
	4PDWUEcdJhCZ6m85DefF7S97zf/ylZogMYoJE3EyqePdM8mmw5zhX8Y6d6/8Fk77
	+7XnWiNhdFwJyrC6x98xfWrZbmMt/z/M9skQTSZBAX8ybw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr26ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:13:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de2c597a6eso151324801cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259619; x=1759864419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSV9Cq1e9SR7LQlW44w+/ize/XOY0Num8chSiEvfZ7I=;
        b=IsosbGbhX5vdpqRo1QiGClbWGuGGw563i5Wd7raRdf0E6dbAQT/4IzO2z1XS3hXL9B
         onrXFtdp+yrrYe0ld8De/VoWbSBAaNSmJcycTs2N785E/db8noewnTolr6HqdMnP0DnN
         Vy9A3kZnDHBEeXDKz0c75XFWL6rmv2AD4nUOutY/DFokOTweNG31X7KNbf/C7ohZkwTl
         WX3/eyscXew+v04lCEm8j6/oxRoFC384CmYmb3J8va7xuKmA33RGFVGZOvahlGELgdbJ
         r4CamkomM5S7b8Xly86IVjyK+S19/ZsRf78G1MXoBoGuWQEe55L3zkJOx+5Aoubl6O55
         Ct8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmdmkld72XsLsPfzGVR6ByZVCX2/pSHGDKWBwnYxhQ+3PLYFOMekvsj8dV07qkTjbQCHM0PMWZS+M/tsyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxeMJ4vnASNwTz70dkLavv0QMblMyh1iYK8eme0NsdC/F9uQwYE
	IALTcrEw1PkfQdda+0p7xdFXW31lu1UuuH9a/6JfBwXrhxzW83lqd6w3D8XcNBB3VEzapp68t7B
	rNhPnSPKCUiHmqARKunNGYT65duxMM5tGJa18x4FP/Wu6IYSaYh5KLi6YDNpRB92NLtQ8
X-Gm-Gg: ASbGncv7Kulfh2A1+LzgqJX7qqWaeQhHKHVLyDzOXNIzrQoYmbi13fYZ9DNukC3SxdB
	qTi+KF7ENX5ZHrpkEb884Pp633dNd+fLaBbmtoflyMbefbzN2a7T9HF8za25lOBNjQ1FsY563tv
	dGCZiShVZbLi/vqhda8Usu2tgoXdjlf2QOFX/pkLBywXlv6pZBW4SBs1dYkcry6rwa3Ia5ny8+Z
	c+o0koXdtaLxeH+wXCSLPUXhv10I1RVp94ME0EVehbtGFTc9e0toZ0QfRUY2PRj5ZzFlmIeqn/N
	ViiPocWEOXhME0pKVRewby1+T5hvVr6f54wVDAMN7TF2u2FDJ6UXXzS+FF+lkB/mydzwo8dA2vh
	jOOPVge6tHGG/jUatuGzAQf6+75qQGdwfGGSbgGf9klKNv1x4OzztKUQNLw==
X-Received: by 2002:ac8:59cf:0:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4e41bd7a0edmr10557621cf.4.1759259619577;
        Tue, 30 Sep 2025 12:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWLFpkh8hsbF0BWjWEBKzr7EQDGz46NeB9GyBzVRvHn8dRxUQboxhAGEfSv3X96BGi8K3Eww==
X-Received: by 2002:ac8:59cf:0:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4e41bd7a0edmr10557091cf.4.1759259619073;
        Tue, 30 Sep 2025 12:13:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583134312c7sm5264888e87.8.2025.09.30.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:13:38 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:13:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <xxvexvdedkzbvhhoh6tubqkbrtxjskhgjockawa22onzwqusp5@iggjnospkryv>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Proofpoint-GUID: 4PAOVY4fZ7u0BoZFTx7OWwb191eGB2aZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX1Xd504DxjwTk
 C5ip7OLD3fu8h+5aP8H6NC7JWkvDenSwQq38saEamlab3SE3HDfJJ2YxcZRsPS09kA3QS+fI+Ba
 0774Ao1yBreTv6IoNnIxL8RPqIOuK6zQfQjuVQOH1hXzfADd5xpwwAsATisotl7BFC1YAsZHTuQ
 o0FWsHe8bsx37eTe/8Be6wbm+ywLJXzU3tS3zNUDiDkHclq42AdDNEMeurVBkTZLf++hpGS1ZGq
 qppAjq3MlzRWn4yjnr4vSW4wJRbScZw2Kmn11ZCOd5wcOAva68f9lcpX7JPorPE7sYJI/HmRhcP
 Nblhuwpwg72/96+uJBD6Y0gn+7G57J2TmmtoHe5Pm97gPeV4tuq9hQktE5Ef/bu+lNfDVm7bPU+
 spayLTRdUbu5fDrH96MpQG/vdeaWjg==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc2be5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=0GIP9b1rOs9S8cRHSfUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4PAOVY4fZ7u0BoZFTx7OWwb191eGB2aZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

(Just for the sake of keeping it here too): your current patch allows
using mode-switch and retimer-switch for the fsl,imx95-usb-phy device,
which it should not (because it can only be an orientation-switch).
Likewise our Combo QMP PHYs should only be orientation and/or mux, but
not retimer. I am not sure how to solve it without actually allowing
properties to reference nodes from another schema.


-- 
With best wishes
Dmitry

