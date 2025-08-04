Return-Path: <linux-arm-msm+bounces-67627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A31B19AE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE801893652
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 04:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34DB22333B;
	Mon,  4 Aug 2025 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyIkqGCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B75521ADCB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 04:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754283159; cv=none; b=eMGagyPMVPpGmdgTA34mjSbDj+MT42H/yXEe2jW4DdxE1oDZe/XqxZnx8ZAV7mx8zLl4ZSjCXdL1Uypy9mMV/iVcUQh58G4XePNei8xzux0m2tGMGAJ3fxaDtAy7GDTIOk4+XfOW1uzqSpIQgf2ELrImHTNcr7ttbDmAudH2vi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754283159; c=relaxed/simple;
	bh=oGcikZ2tsdRcRFlePTbF8Tgaj9GtqgJormDqIrjkTkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgXzNRLlF3YGnCZS0AlYN9xAPztqwdSqpdkQurYtBNdYcLHFKH7tHE9anWhxNrs4r+/Ucj+yHMcnx58eTSTYBXbmFZHxwNeplQxWy1KXW79iTYdcYISmWlIfrf1/tjYdXLPtCwQpzFYaqw03p2bNjom236mzZMjWPLBZHS6LkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyIkqGCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NTHO7021948
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 04:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/cFrwLq3HQhmTSQxSXVw+WLa
	sVwzOCkOdDsAcXyYKYs=; b=dyIkqGCfdNKl6Us3ZqdLv900sBhQcbcZuKh3IpRB
	rp+GprCgw/PDncnzSI5o5u36Bd6Z4QlQlQDzaJlpXOInn1//ZY8MbDwuILRqGP7p
	xoUNT0po7g//5y7GL4+9vAD24pGMLBjeLq7RZVzbTaVaB2IithipY5ytodYPClC4
	dNUA7PkVaqoCvIW0ONhx9pL+00tl3h6v7izoJNKJpbJUKvcsDqBYp/ipOeViRqZN
	es5qUBMkj/VNPb/iOZd+sj0zhbDAeC168B35co6yR3Zi183lHCoAFSPvVHT8NcF6
	pdpCNo+qn5vdQC7vhjhsyaCOAP9EdM7ekV/EwiIrfWHlaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke1jw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 04:52:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e69c14e992so258568685a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 21:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754283154; x=1754887954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cFrwLq3HQhmTSQxSXVw+WLasVwzOCkOdDsAcXyYKYs=;
        b=vQhuKUpoz5vbjwhSPebzPdJUT3d4rJwrM2txWAtffmQg/QahvfnOtogzNZ+Ug9dWKn
         jCGM3SOUoEKgjJslE30R7mLkQhtOSXSy6XtNr/6ytsl9UFPaByLOoRjkEI0pwzLm/i1V
         pgEsyzWDBzi0GLrS8icc3znYVHH7ITl7iAH9mI9eZgziPUp9Z29Y+TmkDkyYprQlXXc+
         a3LXXZcGbOfXgCj/aZQZrnWSJRK5OYNQYO/J2M0pb+W4SrHK1uLRXwDqlf+/CBnuT3IH
         UH2bn+VUsrrG2m/XyoKsak8BPRJue9S9xwjJeVZffKNFB2L5OaBst6iDl5BlslaRuY+0
         7rfg==
X-Forwarded-Encrypted: i=1; AJvYcCV2j1Wb+dR5rnpvHeLoKRnrnPmLjUTiVALBNmHet3uOJOsNPmApCEnx2rNK6GRovNd+8BrUfFFfk2bfX0C5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSquiikiexOhpknpKC+lAU2UO1FcLuuNqefKNugnez8GwbgoN
	41GZtR2zogtgcvfu6PeWKljmwa6uOkB41ZTZ+4fRPhtU7H2+MBdGl3CFyI7//Jz82OmJcj5+mHa
	wgQKIIs/adCOSW6lgwRQDhQJ0N7yAzXDKi+YmX6J/aLxmo1NhXiIhbqzAGzgHsXkbSLM5
X-Gm-Gg: ASbGncsx0xVFnwAW/kfU+VlnskIRH8NjYw6150slZnH6xQWOFIzSBcJU8sAT07FBb8w
	4MM6hlgErERSgtU+WyDwMogD6b+eKVEPUKEUV9svDePV9/9BqgKKusEpQhtZlgFEwz+SVN6lbjd
	7oC4PnCyOcCOsdjqw8UHa0eG/vZJ/qWWVGNESLpNeKFyoWHASzJ3VxM2FOq6+rR5Hmou2iijn8w
	A9EasJ5/SaDrayGroWGrjQBnXBmgIyrXTn+a0QI8HkiKiamY7j5jA62WBHqJQAN/KyBgoDdBnSC
	Msuv0IOIImZrJKuwlobK9+zLXnUTHMgjaA2tudIDPJudZwRIidmLO4b7qP4wpL62t+yGtBX50tB
	LpD7HuM2UWTpAgip5dqKSZOLYm/Wa3tbCb6LvACC+wUNhT6CU1N4j
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id af79cd13be357-7e6963a7457mr933658985a.50.1754283153785;
        Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfTWsXHPhBqobpYEbz/9bATgsYAMJPvLrtT34rSptfkECCIJS6a5FJfM+Zfa+aRLsRdRtKw==
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id af79cd13be357-7e6963a7457mr933655785a.50.1754283153198;
        Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898c164sm1468453e87.23.2025.08.03.21.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 21:52:31 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:52:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <gkcy5rmtodvkgcyzv5mylq4fnlampwichvywcej7ncrbn35jni@ewvcda4o2s2l>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
 <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
X-Proofpoint-ORIG-GUID: hG5JcI0VAnm7L0Z3CorjQsSLV-G82G0x
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=68903c93 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=Ynuxa8Nitr_4Jzo9iNAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMyBTYWx0ZWRfXy16cQYCd0THy
 T+VLBs7D7Bxu3ccpKMyy/T4877k1EvAupcVNeQxIlh7lSxqaidNHqDW9bwUzIunE2mMUap4tPx9
 mRDewEnI77H1MN9cMY6TSGew9HvfrfbXL4/u11/IATC8vK9QBNY76oaJcfy2P7chi6WQuHOmUb6
 4qQd9e38CqKu4Jq5BxOxKo721KPyHjbQJnv9I3xbLTwl+i5c7o8MpQ7/HtqpLq+EiorloqJoMRw
 rORbG6hYCGc/dcKGrsarx39QTP3nA9JYJlQ09pia4pR9T1W/yaJW7NgE2MwQU3cyvoyX6BfDNdx
 bJn3WzVM8ZxZMzXIGn5eWtIRukhSWKOp2TsCkFoghyPk8m40jT5b18cHOd37U0xXIHT6lb+FSrO
 5NfGE+Wbu7oItze0E2XmrgbutPDk2e4ly+urUa+CyoKVRA1vRfDq4NybAWSGYGVgL3TnC3WE
X-Proofpoint-GUID: hG5JcI0VAnm7L0Z3CorjQsSLV-G82G0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040023

On Mon, Aug 04, 2025 at 12:31:31PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/2 17:56, Dmitry Baryshkov wrote:
> > On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
> > > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
> > >   1 file changed, 284 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > @@ -0,0 +1,284 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
> > > +
> > > +maintainers:
> > > +  - Yongxing Mou <quic_yongmou@quicinc.com>
> > > +
> > > +description:
> > > +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> > > +  DPU display controller, DP interfaces and EDP etc.
> > > +
> > > +$ref: /schemas/display/msm/mdss-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcs8300-mdss
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Display AHB
> > > +      - description: Display hf AXI
> > > +      - description: Display core
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  interconnects:
> > > +    maxItems: 3
> > > +
> > > +  interconnect-names:
> > > +    maxItems: 3
> > > +
> > > +patternProperties:
> > > +  "^display-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dpu
> > > +          - const: qcom,sa8775p-dpu
> > 
> > Use contains: instead of listing both of them
> > 
> Got it, thanks~ here we want to fallback qcs8300 to sa8775p.
> Should we update it to :
> +        contains:
> +          enum:
> +            - qcom,qcs8300-dpu
> +            - qcom,sa8775p-dpu
> 
>  above method can be validated using dt_binding_check.


_instead_ of listing both of them

So:

  contains:
    const: qcom,qcs8300-dpu

> > > +
> > > +  "^displayport-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dp
> > > +
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-edp-phy
> > > +          - const: qcom,sa8775p-edp-phy
> > 
> > Use contains: instead of listing both of them
> > 
> Same as above
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +unevaluatedProperties: false
> > > +
> > 
> 

-- 
With best wishes
Dmitry

