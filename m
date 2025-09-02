Return-Path: <linux-arm-msm+bounces-71539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D2B3FB9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8A43188611C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5792E62D1;
	Tue,  2 Sep 2025 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgnZ0Y/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B4D26A0AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807301; cv=none; b=Qrj5ChD8YAEDPXBSzX1H+dYCUo8H9KoTRrllxPKnK2bFj/sv3e0Mx80bDarpNpAWQhvwrllxvO24z2wD5RtSBtf2+1AuxFXpXZSp6Q22sBcEvhD81qVsGSCjfYG19JUl2WqTWs5coCaDkabMFz5R79UFjkEvaS+lqTXtCSiO5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807301; c=relaxed/simple;
	bh=+JpjsGOPnsruEpgBEzVnmy6AXeU90/5N3+cp1l9aa7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m15wWicKyf535PQ3RzYvXOn04ND57a00/ENBuc+dTPuoJC4Df6flXFVI0gPNOP2TaR6Ck7EgWoBVNXUYh/gwbp2bJBAxEYB0ctcT2xDRwBflw9lRlB3FgpS59zrwE/XX5DU+LJ+XD26SHCkZzQ2OkcHiXYHguvDr4ZBopjU0CmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgnZ0Y/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822T6tA011628
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BwC/nawaLvi9t0RWv3QL/WI5
	Jwj7NSyP50cGH4NSFis=; b=EgnZ0Y/qJrBtOT7pfzw3X0lnweFwVU3o/TrdLXjQ
	jxt9wT4FNSUh+xWLhIkCUvapyU0lLJqblPdXtKh1kS5PXOox7/uPqmn48zvwGCQv
	MhtxsM2BQhmtXCTEY2NDkhU5z9RxqjneuECPSIPT3GRPJ5h75Vc7PElEzeMfIWT5
	pVHuwyWGUwArJjPlKSXp+dDF1icHt9zXVIe2PIpHJSw9Jyt00cgOqBw/SEssFp05
	3LrdfNfKGrEZ7ZZpyl6luQDadY3wEJ7x6jQMaeIqF3y4HJoZKFqnu2XPgNEmgzhr
	ZWyfKSoc9coqt1uEaOKvFTkpFfTMXfqOV7cKNeiNcGKyBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfcsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:01:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b327a79a30so61384001cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807298; x=1757412098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwC/nawaLvi9t0RWv3QL/WI5Jwj7NSyP50cGH4NSFis=;
        b=sOIoxC203iK/koXTVvQ5PHov8Aaac19YgZ8H+n6Cgyv3qQpx4QqqErBOdcrDqlQJGu
         0IBUteNOGN4wlg7rxksS+v3lsbVC69YmyMDXGYakfUsNGYGIwGdfLQOL1NqfHtIayQuN
         OxnrOcehYLRqXXxIb7g6TPyBn5elZ2Krv3Hd+GCmqDWYS8awFbwkVaTrBbqIIiUzC8gC
         LoOT118+NfmLCc6BzCb267qHaWOoxToU/6fhxcKfujOVQKuhzmSdVcjIqjHm3fQHj2rI
         tm1v7Ki12RacNh0gp+pqcZhVtCWjRq9ol5hfrXvBYfDp2RA8TKtIUf3R4vUrcI6BPXY5
         S/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2xtc464e2QB1i/SCU9cz40sWn+64Cu0aMoymasBusmlkKAQ03BUpXhBb2MwmI/4IINjciI3uJu5aDGXrw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gIj+LIRem0uybjx0c6Hw3rMFLMK8vOTbXmSTJRfpSzvENA/U
	lfliS7wlZytxV/QlbancJtRx3vw17sECnr5sl2jiTh7zQWnHVT8ewHJvremIIppXQeMnRhLOhjw
	QVOmfgGwnRkdPG+R9T4M8EigRHwxx9EIvGLkziwvCiviMGdE+9Zi3XvGvSNQv6ckRW+zT
X-Gm-Gg: ASbGncv9Sdu8wZpbn14I+b7HzMEP4A42TK6q2wVAR7AU/O35jQfVHvcuHqRmZCNKqWe
	hRtByFkmAPOVZj6bKLByOcShXMbo2pjBPK00yILZWWyXUrAdY9/MqzTsrSWhwtE8PQMJqj0V89p
	loeAtLSBJOtfY1Cn2AQpBNY+6RtEu3CEeAdXDQwL9G49DazokjesoNkUuEGy9kgcGkerWGKghFM
	q5ATucMwjuWsNXw0C4eU5mPCKCEWYgVKm21+/NBP4BHngDBQhsxczzpjh7k6iqFCeQL2sVXPfTd
	rOmO3msQSJhXaP0UfHbM/CTJLRsiXEYkmwSdR7fUdvSuHaYUj3k9cNFIlcgazMVrdUb15iZzKlR
	ExXPYoIUhHPRDhuZ5cIRbPF+sPl5LNoWjhNxtIOJWioY24yHrjt+e
X-Received: by 2002:a05:622a:cf:b0:4b3:479d:85de with SMTP id d75a77b69052e-4b3479d8a44mr19164051cf.70.1756807297731;
        Tue, 02 Sep 2025 03:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIzhdTdKaG+HoZjO6SOOOHS8+U94QR+yYF63Rf6q/hpnZhrkWYy2UVMLS/EJe5SAHyG+zmqg==
X-Received: by 2002:a05:622a:cf:b0:4b3:479d:85de with SMTP id d75a77b69052e-4b3479d8a44mr19161411cf.70.1756807295614;
        Tue, 02 Sep 2025 03:01:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56082790204sm565117e87.77.2025.09.02.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:01:34 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:01:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <ysj4ndb4twcvmlxb3marh2vktxxsup5l6ioljdgzlod46uimh2@pkgta6r3ydqx>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
 <20250901-arboreal-gay-wolf-bcaaec@kuoka>
 <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
 <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6c082 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZVPz9Q7mt2jYMwHyQ58A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uJZbOfsGB2Ap9R5YcWxJVkrBp1EKeljI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX4++zJPYhtIbL
 MKNLvGybIGH7o1X+jHnV5LIFNOaWZY6J1oPVqIJ8YCnrenBSdpO0+5Lz5KGPEryIi08os+Xagyj
 Sd0MJxvqr9yEFcDQfo+hI5sSqhBv6VPyxn+Rolvu2r6LOVw6g2/TBhNz2Pit3XW4jSNjvh2y3s3
 OUIXrRSWisDOUao0Wwigjdzh3QM1uNVfQg9ISQppDSMq8aYsFlxsLuxc+Q5GtDEgL/HShwJJ056
 4qZRgqXnQm4qfaW6sk7VeWj/BmvTpv+kPj1ASJLzC9014B5sVqjLxnMAfhINHI2KLEg2V5OaI+j
 Htyz4Zx0IcmNCl/hPw9getnusQ+YCsoGlzKfzYyp0mBS+qTs84+YIRbdUYkKqiBPd/H+0T1vyWV
 eCegweOF
X-Proofpoint-ORIG-GUID: uJZbOfsGB2Ap9R5YcWxJVkrBp1EKeljI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Tue, Sep 02, 2025 at 08:04:54AM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 06:03, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 05:45:49AM +0200, Krzysztof Kozlowski wrote:
> >> On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
> >>> The SM6350 doesn't have MST support, as such it is not compatible with
> >>> the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
> >>> (which belongs to the same generation and also doesn't have MST
> >>> support).
> >>>
> >>> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
> >>>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> @@ -31,13 +31,25 @@ properties:
> >>>            - qcom,sm8650-dp
> >>>        - items:
> >>>            - enum:
> >>> -              - qcom,sar2130p-dp
> >>>                - qcom,sm6350-dp
> >>> +          - const: qcom,sc7180-dp
> >>> +
> >>> +      # deprecated entry for compatibility with old DT
> >>> +      - items:
> >>> +          - enum:
> >>> +              - qcom,sm6350-dp
> >>> +          - const: qcom,sm8350-dp
> >>> +        deprecated: true
> >>
> >> If it is only about bindings then there is little benefit in keeping
> >> this, just drop this case.  However you cannot drop it from DTS, so this
> >> is a bit pointless.
> > 
> > Our plan is:
> > - land updated DT bindings, describing MST clocks on MST-enabled
> >   platforms,
> > - land updated DTS, adding MST clocks where applicable,
> 
> This part breaks all out-of-tree users of DTS.

User of which one? SM6350 or all DTS?

It extends the ABI, so no, it shouldn't. We add regions and clocks,
existing users can use the previously defined feature set.

Anyway, is it about adding more explicit note to the cover letter and/or
commit message or would you have any other proposal on how to handle the
issue?

> 
> > - land driver changes, keeping legacy support for non-MST DTs on
> >   MST-enabled SoCs
> > 
> >>
> >> Lack of MST support is not informative enough to claim it is not
> >> compatible with 8350. For example if it was working fine via fallback,
> >> then that statement is simply not correct.
> >>
> >> And it HAD to work fine, because there is nothing binding to
> >> qcom,sm6350-dp.
> > 
> > It is working fine since currently we don't have MST support on the
> > driver side (nor do we describe MST clocks in DT). It's true that the
> > driver will have to handle non-MST DT for SM8350. However I definitely
> > don't want to describe both cases in the bindings. SM6350 is not going
> > to be compatible with the MST-enabled SM8350 schema.
> 
> The question is rather: is SM6350 going to be compatible (working) with
> MST-enabled drivers.

If somebody implements e.g. U-Boot DP MST support after we land DP MST
bindings, I would not guarantee that. SM8350 will already have second
stream clock.

-- 
With best wishes
Dmitry

