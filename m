Return-Path: <linux-arm-msm+bounces-70455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2DB32238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 20:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDA456284B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062572BEC2E;
	Fri, 22 Aug 2025 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpuGHeU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C72BE029
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886809; cv=none; b=ujTsiz5vixADWS+uBgNUkulTJP1TXX+gvvi2wLGRCe1PMzOsi0+Ec9LTdbJVduZAhH3Btfy6/UFx+QwvcAZ6XFmpdZR+c8cTmBtnykQDeIgcBG/xxytH8kg06QWhjtzs8IOqpN40eCoi8+A8mP9s716Nxa7Ocfrl8cCuTHKEB2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886809; c=relaxed/simple;
	bh=mrp9EhKWJd+GF1xGjXo69QDr3zuHXRhZLJljxro2Nk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxfGDnRzaeixsg2L70u+XBwxvR3k55jyi8Sr9Z0/JKKYv+6ILECoOjX0rzaldhd1A3YMHY1s8cXtQa2fYiQxxje7fBzgJi46pAPi30Rg8EelvxhRIBC+8n0fqZRPETYmmoif6bnKBdAI+2DU3l2nVzodQXjRdDY0OeL2oHTfk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpuGHeU4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHV93U007020
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NxtKtumnK8P7jbCRmulzU2bs
	GNNl6vGrxyGS2XDmajI=; b=IpuGHeU4jrXI4gbTONzrAZjNBA3CK7V8iBxkC60B
	sj5U69qXm/weLcj1eell4vGtNtYrJ/EY1pqfDac2TlDKpUBlsZSEUFqMThAFz3dI
	PB7nAi+FUyA7uegSWpZ03reG70vEsYs+DmT+jHmDdqIm/vb70nQeG04RjGcbldUp
	KDVoeVy7/lUgc1zAd+udtwxFTvlbJLTsJG5nPGBWN36FOH7ln6o7k0coLlCqgf9q
	IgaPem2IJFvGh8FZADYK6QmqEDp1jAn66IT2uIEw0s8Zv7whlF62C9JKbk90oYCr
	ziV1i+Q3PLdv0hbvAZE2tDiMWSsWQ4/RlFd36Do2GuNbYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yr4sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:20:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109912dd8so23676191cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886806; x=1756491606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxtKtumnK8P7jbCRmulzU2bsGNNl6vGrxyGS2XDmajI=;
        b=R12B3YFKd7XSis6lvivlBPsWC+dOf0o6Ea5G9Ga44F2TV/OYOrRnDtynms3TXe1CxE
         6+1iDJDGTEH0kpV16QsWaQ3wDD162+DWOeeFA27CSVag2RPKy4/qZUOffCepWQZARyv9
         j1gaG2JBF+n0wPPL/SZGuFYLQslWFweOvaIXk7wvPejciVKV95xZLGSSMbe6+6us6ygL
         n5AJxc8r2WSbkmH7K+TZvHqVgE1/+x19rn6uJ0Rv4zBUR1uiOYJCqGAaOcxl/meUhLJD
         VUjXhjleIFxOFrsIAHhQyFfryBALxzt1qvTvUzF2R3JnXDH9coijKTRbBEFupvhkCSY/
         lkuA==
X-Forwarded-Encrypted: i=1; AJvYcCXBGQygM3xZWICYNWH7utFHqf1fHnGdyJghWVj/VLKf4bvyUGFadf/nHjsLZhtUVOeAagT2shdiyd5aCoV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Dbj/8xA/aKjp/y4TMaK7KQugZQWO4It6yZ8gC3WrBXROYV2L
	IiED/7wAX/+zctldU/FQKJkcoXSfn1qu9KMoGgV6NTNlAz4LFQaZ0fQFgT3M/+NedadunV+QNok
	2UA8PNFc/SRX8Ls6vQlf9xKg7tZ4UB+JWpeB3XGnSTyZ3JbEBSDB1M7TpN13DxfySsVMyOFt/7M
	sC
X-Gm-Gg: ASbGncuMIpXjJr4DyZuvZqUt0IplpMDrdeZI4aGt4ZAgPQQ1KHpStS75QgH/SlI213L
	mZko5IRuc+T2QDf8vX4etm28BLoZ3P4KwIxewguV8m1a5Su0fm0VvBxsZdOBhvwMa/9iKpJ2Nnc
	81d3c62t1o3xBZPBkJQIk67HU+RhGYJE2kedUM4GP3GoqdwENTw0nfkVlk5xwSQYFLuOcsgPlO3
	4W0aKDvAy5FW+vHfyZeVY2myD2uJ/o3gl6vpbpeCLdPoGX/XSESFryTEWHdCrjetN9S+MydnKtB
	C3IG2LimupSEqNNJW6/XB2bWr+ivw2O1tRRuz0Lplhg1AdxtgfSaigyKFk5r8mM9DDiu0F4X0zT
	tS8eusGDlcKdCwDo2xHoOgcxCSwlAu1U3LtRbTFKJeq3DkWBN/fPy
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b2aaa6e774mr45148141cf.28.1755886806016;
        Fri, 22 Aug 2025 11:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoFNCLWAF2tAYF5UUONq++OfHCr9UeqtIPtGxLe6haKB6Cwu0mLgt3aWR5hszae30Z3Zz6DQ==
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b2aaa6e774mr45147641cf.28.1755886805361;
        Fri, 22 Aug 2025 11:20:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e2373acsm665231fa.18.2025.08.22.11.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:20:03 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:20:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <vbzqtpsjkxd5qhth4k2exo2dsnfmfn5km5i5z74wun7jc5j7nb@n7dqdw3t235v>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <20250822142230.GA3591699-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142230.GA3591699-robh@kernel.org>
X-Proofpoint-GUID: gkBAQOYjKLmE6nftZOw2KNLXnSuWjQex
X-Proofpoint-ORIG-GUID: gkBAQOYjKLmE6nftZOw2KNLXnSuWjQex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXxigMXy6VSMHc
 Pe7eVRx/Ztqel/Bzp88oTcSygXFpmdlmTTNPBnHLrG0zErSuBd6yxeqTOPHmeVafjZr25722Q/q
 yh/qGwpZGn4RvISurPNHQ43mXqMp2+J5vhn1XIMAksH0Zt3E2sxJIAzsH6FYZsGq5wjww3HkAgD
 LwMTLyDkz7gF8Onqqy0XjHyNsH7cXOMrnByIm06Fjo9JAsrxrfXvIbnD4eA8YhfwY1iC5ODMFNQ
 g8pXxDCD9DcoNOXpkcA1BRfNgaGdbc3jxHuonCKVYg+5ff2kpejesJu6BwNFIhZ1/068CS/zemx
 rfpfMRETzxMVzzKIDT3LjLOBeDZj7GShW4SxIjFRmLngNWbAz5e4mzy+3lzyk3IaJLM9y0jn6K7
 IWbCxNJM
X-Authority-Analysis: v=2.4 cv=TpzmhCXh c=1 sm=1 tr=0 ts=68a8b4d7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FkOoeBMDyMZldznMw-cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160

On Fri, Aug 22, 2025 at 09:22:30AM -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> > Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> > on QCS615 Platform. This PHY supports both USB3 and DP functionality
> > over USB-C, with PHY mode switching capability. It does not support
> > combo mode.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml

> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: phy_phy
> 
> phy_phy?

Yes, see other Qualcomm USB PHYs. And unfortunately we can not use just
'phy' here. Once this lands I plan to push corresponding changes for
several other USBC PHYs (described in qcom,msm8998-qmp-usb3-phy.yaml)
and those will have both "phy" and "phy_phy" resets.

> 
> > +      - const: dp_phy
> > +

-- 
With best wishes
Dmitry

