Return-Path: <linux-arm-msm+bounces-75183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7CBA1388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578DC1C206A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B74654F81;
	Thu, 25 Sep 2025 19:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvuE8/OA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112231C591
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829117; cv=none; b=MSNiZy9cToROV0iUE05bk9sopzSLy4kt2x+x5QO3kXTy3KV20HAaD7zp5yj2OX809eVoIiEpowS2X2E5QQJVdNU7laYV0F84nW6+oBou7iU09UTfPqaPdF43g051YvZM+mOrZEZFzIaldGWE2q2QF1tVVmNWcTNReWZknYRg0A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829117; c=relaxed/simple;
	bh=Gw6Lv3ZZKaXOQeZbLrbNQm+hOUdCDO6KkbPO+UpMV5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjLv+OkemtUe83CiTXIHtB2q2n55Cf/KoQBmBVYphf5jVMtJu9bXKuCIF8wq7W/qushQ+71vikjCb3LImw9d1JkfeZ0SXIk9brHcA3mVFjv0fF2iHbW8o/um0JmARQ1L6wnhl/toEurBQJknnq3ZlagrIKlPh64yhP2gaqoWTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvuE8/OA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIRFom028176
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bZUq7CDDhSmRig6Cx1+uuI0h
	ZxZQyPvmkPpUPwn89LI=; b=hvuE8/OA9JOtidnSZORgmM4jRfOo0ad879Xb3RcY
	zZNSPMCMe6rakDVd5GejDyqQkMpgLCXGuXyvY0unf3jIYXzJ1EmcaHlSRTzbnu0C
	vzs8RNBfko8oABinO0BO4XDA66kR5mSBAMamPgUzSSM1OhkIPdX0SWcHe53CLyHB
	+iM5t13u0UxlAJ+Bija4wtiusCNwyJu0kSFx1E1PZqppWA/vb0ClbcBuQ+tLYJkd
	x3KE1cBxnr+LTknelBmR8eNLu1omZftXldv6vWcYxHBC4dsgmlbW9Yv6f64egU6Y
	F06oUNvaKZ5mX0UChewg6OTUxZsq1UC4uyGyaTDaz6+0HQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u05jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8544316ef6aso516635985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829113; x=1759433913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZUq7CDDhSmRig6Cx1+uuI0hZxZQyPvmkPpUPwn89LI=;
        b=ie2OU1Odz8qcvWkZcpsxBcpE6fq4C89EYOKbqrJFgdLu/KMZMTS7RIWOaTBTYNFy3w
         GwcG5IWDjf0HAxUSVpSFprpAwUpW8lZaZq/CQDLGmWdxRM4ddnPMClKxevo2aKzEfGr1
         iqtQPZghdq4F5JUMuwuJj5h2vj8CQwXIu6Z+IHI1pA1T3WuS/LDsZp0sRI/6kOAIR3wt
         vG9guahT0KsOJuCoEn4CXGZXThYGEceO+57vn/SU/F9e170WDsK1GijJJvyQfEK5ttoF
         AgDxkviUbUZJuirrMdrCO5IRd2sVAkK0Aq+L5MF2im9fNHioZdNWwGMG1wZlws11d23V
         29ug==
X-Forwarded-Encrypted: i=1; AJvYcCWjyQmhD+yAueUO/+qf4/i1mbhYqQEBJkdq+rVMm30dcrqRuQD6E7E2alOb/FypCh7GA6YCqXDbmaMFneRK@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQY/tVy0/zTbCrVUUIDK1ZIO3WswXXkL4vPLahSdJyusfNTSW
	WWFXAGl+PR4g6pj134cTBDVmszfSFr8vJTmJ5f2q5ZsbjEb6d6KQFaVs0YZJdl44gdDL0ujmItC
	n72VgqMSYSA/rBcOHdisjAbwXdY4S+pIrs9uoNQ1qMyPIzg5Z46hynePgVVBqPKzcUUHp
X-Gm-Gg: ASbGncuR/qtxauF6xi1sh0NzlQxY10QzbuNIpkyi9MjeX5CSKPj6MZ92jb+6oJdMdoQ
	exl7l5Luvo9RoMQjDYNes8mmr2NmRhV7rtKyMTS6u2jzfjCsh6UBd/G2ineNI+oLmnqbr5GRJ/1
	uHznzjETpKllG1zZnlTXpmFXIINCLlJYJy6yytDK36yzyjEwSQ4G5JxXa4pLGvIILvZRqqgzKNR
	XO59TsXQK/rjKOFrBBCXJ9MtQOTwvw9C4x1eXMfuIQij0Crk78K+LWU2h1bPd195G5C/guDfwF0
	GZW7Uk+q/L6RZSYgYc5642110HIRgUr5PN6Ty+P2mDN95zFWdk29+AHJFVvXcCHjaToLgCNPzsj
	VRKGvIYz/mDYxs5o7mdk1ixZr1gUqfuTJIVXSNRm/etR/1mikBSfe
X-Received: by 2002:a05:622a:1a86:b0:4b5:ee26:5371 with SMTP id d75a77b69052e-4da48a98618mr59982681cf.26.1758829113246;
        Thu, 25 Sep 2025 12:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEScP8g2QLcbwROLLnoam3rSDhjtQbKS1uSD/NVSg/54p4XWIFVNkB6GUFvdkeQo6tU0VNN0A==
X-Received: by 2002:a05:622a:1a86:b0:4b5:ee26:5371 with SMTP id d75a77b69052e-4da48a98618mr59982101cf.26.1758829112481;
        Thu, 25 Sep 2025 12:38:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99d5sm1059076e87.40.2025.09.25.12.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:38:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 22:38:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ja2o83NUFsklf9u8flMHnX5_SWTY7hNp
X-Proofpoint-GUID: Ja2o83NUFsklf9u8flMHnX5_SWTY7hNp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0+OyZ+tYxHz4
 KvKHlOHZApLPJcqY/C1KR5QVFbzU0b+lomUKfYAJ9NBSWE+VQu7+N6lbrvduJuVCY0HH9DIQgT0
 RUMr/rhx7XxzRcPGx7v9W0kigJFxExMq6L/TbCCgWKfporw6ansjzC3MIBDEL0OW6JqbX/5dd7p
 Buiww85Qp6hTk7gY/D7ajiJ+J8gU2viEj8FgdW87vAeXus6fwBWpGzXwQ8S0NCQiwy8ouTP3mIM
 k1T1tEUsi9fep9wrSN1o/c13EZUvmscRmZF+C7BZp0ZTd6lYSwAC1noC3u5BLcSCJA35bZSAncY
 3T2ME+e93jUSsHy3nV62gL95xpwg9RXVQsvLCyyi7h3O/cmhR06HGWbUSZFBliudxMzUPUGTLQt
 insKydqSCq7l6LqpMoLEG61L0dYj6w==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d59a3a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=wIq4btY2Nqnwc6W55twA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
> 
> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> >> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> >> compared to previous generation, iris3x, it has,
> >> - separate power domains for stream and pixel processing hardware blocks
> >>   (bse and vpp).
> >> - additional power domain for apv codec.
> >> - power domains for individual pipes (VPPx).
> >> - different clocks and reset lines.
> >>
> >> There are variants of this hardware, where only a single VPP pipe would
> >> be functional (VPP0), and APV may not be present. In such case, the
> >> hardware can be enabled without those 2 related power doamins, and
> >> corresponding clocks. This explains the min entries for power domains
> >> and clocks.
> >> Iommus include all the different stream-ids which can be possibly
> >> generated by vpu4 video hardware in both secure and non secure
> >> execution mode.
> >>
> >> This patch depends on following patches
> >> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> >> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> >>
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> ---
> >>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
> >>  1 file changed, 236 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> >> @@ -0,0 +1,236 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm kaanapali iris video encode and decode accelerators
> >> +
> >> +maintainers:
> >> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> +
> >> +description:
> >> +  The iris video processing unit is a video encode and decode accelerator
> >> +  present on Qualcomm platforms.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,kaanapali-iris
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  power-domains:
> >> +    minItems: 5
> >> +    maxItems: 7
> > 
> > You are sending bindings for a single device on a single platform. How
> > comes that it has min != max?
> 
> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
> we do not have min interface, then for those variants, we have to either have
> separate bindings or add if/else conditions(?). Introducing min now can make it
> easily usable for upcoming vpu4 variants.

No, it makes it harder to follow the changes. This platform has
this-and-that requirements. Then you add another platform and it's clear
that the changes are for that platform. Now you have mixed two different
patches into a single one.

> 
> > 
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: venus
> >> +      - const: vcodec0
> >> +      - const: vpp0
> >> +      - const: vpp1
> >> +      - const: apv
> >> +      - const: mxc
> >> +      - const: mmcx
> >> +
> >> +  clocks:
> >> +    minItems: 8
> >> +    maxItems: 10
> > 
> > And here.
> 
> Same case here.
> > 
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: iface
> >> +      - const: core
> >> +      - const: vcodec0_core
> >> +      - const: iface1
> >> +      - const: core_freerun
> >> +      - const: vcodec0_core_freerun
> >> +      - const: vcodec_bse
> >> +      - const: vcodec_vpp0
> >> +      - const: vcodec_vpp1
> >> +      - const: vcodec_apv
> >> +
> > 

-- 
With best wishes
Dmitry

