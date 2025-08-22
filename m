Return-Path: <linux-arm-msm+bounces-70360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0FB3157E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE9DC1892EC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58D2F3C27;
	Fri, 22 Aug 2025 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gt/OZnn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291922E1F11
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858865; cv=none; b=YMNogwztfr06k4LoQJpopq2OoRpQV6xzlCk5kxYCRHVODqq6PmXANKO7p0ocRBdicaZJc85iNw5bDlBhseWk5gnck1qAbBftdfvxkva//Ihn0slN8wFoNi28NgXpZlYSVbf1Qb4u9kw8QTXx17jfBQEpUnQtToK+jRU7Z0E2qM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858865; c=relaxed/simple;
	bh=AkSmYbPS0TQneMUEfmypvRL+CMZ8nBmCU0oEbBSh2HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1HBrcN6C8j/6vwWB0jm9U3GM5/JFNcmXI9hAhF98V8XD2L+mUkqmMxCjDEe7mDKPY+666X2Qk28IzK8olPR18TA5SFOyowbPfqPCR+Fs7dRLvI5tUEQjQaOp1e9YtSzLMR8suqYutovKraoH9OP+m7QwKNoKt9cb4snnJyWApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gt/OZnn/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Uh57006837
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FCN29/vu9A8ZXeY7sbANGhL8
	9+mqcLMKMMaamyrrvVE=; b=gt/OZnn/0rBmO1nh/YzOEqEAqD+OdbivSHQjcNbg
	fXxRGhJ6kz421MT4w3aJZOSc4sU1S9Ij4AA52jYAXkHJlp0p+Mbm6XIqBIfESINZ
	wztcp9eUlKvRb4wBoAl5wR/KLFXf1y8j1JzT0zym3dNIZVI7SMAwsH9ISwai6Lwg
	0IetRzTPGmq9TgoslbFMYQ5rWmkwZ24MyyYVHyuUQf+YojVeu5ZOSuOVyjOm9SRb
	lD6MUqM0T8BE+MR2kjIRtOdTs2VnaBeyZwG8hPcHo/tT/kERftofHKa2oWJiKVi1
	uYyQ9FUElk3KZZCHXPLuIkgNn4m+J9s4X1FbQEERhnzwlw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drt0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:34:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bc103bso46715331cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858862; x=1756463662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCN29/vu9A8ZXeY7sbANGhL89+mqcLMKMMaamyrrvVE=;
        b=rraoim05RDGCi+myg1EYyP6PUZQlGb3DJx7ANJtkIRLtfL+BNZd/xwlVT9KTQd63Xr
         RlVsf7Zuq7sNwd1dTD5I59+Bqf0krzsg2hCt5UdRG6rgLQzUB4QmTGLypJIIvSIhrNwL
         8MR6P8kqTabm/qGBDaWmXAXvaQGFFOm9XHNIUwzNXsMMQn0xcKfrM4SedXXuqsIQrlD1
         GPc4g22r3o2ZmwG8y5lvI53M1yh4pP+4Q9E2oZ1OwUu0M7w1Z5eVFU4Qb3AamebnXRgt
         0ZHmC0UKQAk7kuGmwWt+5flqutnxIzMpVUuO97AosARyt8HOVbjBywX8q6lynXhWy2ai
         B0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ17mFy47zMllw+KMMUCSMQ1oHOrsXfHdGnfSxfOC2FWqVIDBLHZ5UpI1iNpiO4GOkm0Iyg1jKwZnm/mWG@vger.kernel.org
X-Gm-Message-State: AOJu0YwUF0bm8STdb5g8gqg2Z9a6icQyPXK8ob/q6cwHqoEQLbOV6Ezp
	PQCuywhYjBnvbPa2OlERU0zAi3EUsIwSsVWUEFJXst4PYBvWJTdY1+tb1Uj9NynAxhyD2OgBl2v
	4osUWN9pz5EFeLAiycY3RUpUUwg1IBkTKePU9dHtYzc3rXcnZlftESSgXDHdr3rfvYv5y
X-Gm-Gg: ASbGncsGttEa+n99CxDO5JcTJ92kp2TWmchImSrnQck6EzXTuDCkRNvS4ViuEo2Qb42
	+kgZ724gebWx1+0j9LCBlGnYf+HZw6Axzj49eaDKEkubPLLV6revhzQnqt33oeQfptD+1Tma5GF
	Lm/IIu6ESY8y+VA6UcPVTqogjzXN/J0SuIYW/drI0F6ybEfjfBNsFSwWKZut/uQb2Tdyj0PcoK/
	L36HxYSC6PfDGAHbIWwi85UZ5kNa03A8XDpaSI8zbaQLMSpGMO56rcv8gRjLotEbjvIhcaa5okO
	IFrXRSZ03Q9M18DPBNWo3KUdr6pyNomq/3zIoGF8aQcLrjyw6uiiG0Qb4IqPxuTYgAKEdsjY81Q
	87EJyVaaFpRRChuc2RuX5IKOqHFDFmzNk6h8cmaY5HV/FN+JnG86X
X-Received: by 2002:ac8:5701:0:b0:4b0:8ab3:2c7f with SMTP id d75a77b69052e-4b2aaa05e76mr25339481cf.11.1755858862201;
        Fri, 22 Aug 2025 03:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPnOrDbKicPm/yuh68OGc5jaYkOPRZ2c1JmpVxuzfF/z2tQgKp4Rzhw5PzXzW4Jrhl8KQDlQ==
X-Received: by 2002:ac8:5701:0:b0:4b0:8ab3:2c7f with SMTP id d75a77b69052e-4b2aaa05e76mr25339071cf.11.1755858861488;
        Fri, 22 Aug 2025 03:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef43448csm3436848e87.147.2025.08.22.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:34:20 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:34:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
 <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX96JhJ9IK5R0i
 3t1G4qyljUvB+/AwphXi7OLOTqyyu8NnzI76/EYYaUIv+VjVt57fdcTIIAFkoDb/rcjNRR+3qzm
 WI5aEM41Ya1zDTYPOngLqvZkGZTyV3pbKwDENniJvptNRL7xxf3Blso4CTKUAOfyJzTlpTV/o0L
 mVU1Oq5jFeDLNq4N/N8eV53hw8PpOfrhoEH/SHMz37VwNJzffZ7iRNtFoT87QbRtSMzdWCDQuFL
 9HwQI+m3BqDNKnj1RaaV8xrnQUnP95IVVOhsa/a5PvGSw2hmlOvVJ9Ygwx1v+xTPdhJDPa7eB+h
 ZGW/0dhPMhQ1S9A65qt61d2Ia6hBCCQBsQxTyBOtXhGBs7qNrEDRQ95MfJOdWbQGGGGtlVjKBBc
 g7YVqEONZ1GvKTRVFRxgeyPTTy7p1A==
X-Proofpoint-ORIG-GUID: KE4p-0XbSywN823hPlnQbFmC40DgM9x_
X-Proofpoint-GUID: KE4p-0XbSywN823hPlnQbFmC40DgM9x_
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a847af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mnVnZ1ScStkaolgTZ_IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:06:58AM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/21 18:28, Dmitry Baryshkov wrote:
> > On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > > 
> > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > with same base offset as SM8650. It requires new compatible string
> > > because QCS8300 controller supports 4 MST streams. And 4 MST streams
> > > support will be enabled as part of MST feature support. Currently, using
> > > SM8650 data structure to enable SST on QCS8300 in the driver.
> > 
> > Bindings describe the hardware. There is no point in discussing the
> > driver here.
> > 
> Thanks for point it.. "The Qualcomm QCS8300 platform comes with one
> DisplayPort controller that supports 4 MST streams", do you think this
> description will more appropriate?, only discusses the DP controller, not
> referencing the driver or SM8650..

Yes

> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >     compatible:
> > >       oneOf:
> > >         - enum:
> > > +          - qcom,qcs8300-dp
> > >             - qcom,sa8775p-dp
> > >             - qcom,sc7180-dp
> > >             - qcom,sc7280-dp
> > > @@ -179,6 +180,7 @@ allOf:
> > >             compatible:
> > >               contains:
> > >                 enum:
> > > +                - qcom,qcs8300-dp
> > >                   - qcom,sa8775p-dp
> > >                   - qcom,x1e80100-dp
> > >         then:
> > > @@ -217,8 +219,9 @@ allOf:
> > >             compatible:
> > >               contains:
> > >                 enum:
> > > -                # some of SA8775P DP controllers support 4 streams MST,
> > > +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
> > >                   # others just 2 streams MST
> > 
> > QCS8300 has only one DP. As such, it doesn't belong to this clause.
> > 
> Emm,thanks, i got this point. So here need add another clause only work for
> QCS8300(one DP controller with 4 streams), and i put codes before
> "# Default to 2 streams MST", is this the correct place?
> 
> -          # Default to 2 streams MST
> -          properties:
> -            clocks:
> -              minItems: 6
> -              maxItems: 6
> +          if:
> +            properties:
> +              compatible:
> +                contains:
> +                  enum:
> +                    # QCS8300 only have one DP controllers support 4

typo, controller.

> streams
> +                    # MST, no second DP controller.
> +                    -qcom,qcs8300-dp

Missing whitespace, drop the "second DP controller" phrase.

> +          then:
> +            properties:
> +              clocks:
> +                minItems: 8
> +                maxItems: 8
> +          else:
> +            # Default to 2 streams MST
> +            properties:
> +              clocks:
> +                minItems: 6
> +                maxItems: 6
> > > +                - qcom,qcs8300-dp
> > >                   - qcom,sa8775p-dp
> > >         then:
> > >           properties:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

