Return-Path: <linux-arm-msm+bounces-71533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D5B3FB1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A6B81A88693
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD442E7BD0;
	Tue,  2 Sep 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="df44LpFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036127B34B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806544; cv=none; b=ETqCRANFY08LVAPr/Cti5ns71InUh/KKrAc7WiCoHRiz0OtD0CpX4IAElXA0Kp3TkuNhzjOrVsM1ZJq4YDbIxkjOyEnOcY5x3kOclRKWV4LswLuMam5dx7LMsNrVPNdl7sNVaKKWFP7QgwWGxIJV6eAuc4x4KjFlEpF3gadRm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806544; c=relaxed/simple;
	bh=IMgn8iEReuyiC85UpkcU0ob1gLtKwdzA4NluiAoThVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaMF08rXREdr/45kWF9KZ9K6/BfpYX7GkjJ3mMYHhHmytgmcfEtZHeWSsKDtV0hf4VV03RaYFextLmgdAgH9LnRvnoKyGpy4zxxY6oSBrrHUes91IqTuZljqSw/hT7gfz0U8QDbVAKSIn3c8sThtZ4lO0OQeRSu5LI++Ou5m+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=df44LpFW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5rm017641
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ef0edgZ/9neE8uhkiRDCZwng
	z4JTifOPA35MBTbIahA=; b=df44LpFWVR9fhHJ3FYUk3VZt9dD565gwO6w1Z10M
	GT/4EpKZfqfGDw+OssvwXIkml8BcKYZyikE3SMc6MKbhyrPHt6a5+e4Hp4dHcIjk
	e16YpjM0zcW7dztmy7qn3FRPq/aZdb3hSFXQqsEG5TyDdNn/1snsMGq9Y126lL/E
	3MXgqj5B53IfeE55sklNjY590QFtVb8mwJr2cVr0HcDxkhwxWWmePKGcvpdn/dvR
	Dbgu+oFWKD5kVLZ2DiwYK0HgMV4WD0YNyIaoiaiZ0pxCsucbIxKYxHvymUKbsNSz
	E5ETn3eaY5YNEizL1m9Tu/eqB6364D+vljm/vUo3+4vOmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8y5jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:49:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b339e7d107so24695561cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806540; x=1757411340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef0edgZ/9neE8uhkiRDCZwngz4JTifOPA35MBTbIahA=;
        b=wy3Td3DFin3vhK/RcX2pOIcOpQ9r+drgk3Rw3POWrvojI8FnvIG5qspZ5G5Rk01rT4
         QCuZC9BsALDAY4Wvsb02Jj5y5WmVsnj+dijwqQTo/STJjvhgXqnuQ/L8RMmuM7UOmQzO
         qDwsxYaBGiGhCa9BUbs22XcE1mXZcJ4EIPLp9xBocW+VzRfiIa3nZVnBUO4w1UiQ+xx4
         ocCw/bOsE6eRGQrJTnmJjQuNWRTxbAOUG8vATkENKsAcuk5Wk38PTTfh7DqYhk93mOzG
         fpswyck3w57WTs/afAsgdTrgpOqB3L0IjPZFZ7H6zHBOMrTDfJwvBblq8qHEYViQ+4K5
         KVIw==
X-Forwarded-Encrypted: i=1; AJvYcCXdi34WLhY7E6PU+2YrS9i9Dy0fpZRc65xzKA7lJHUqN/dHhWl4rykQPjuA9bc+ToiZj2sqD6R+MwnMV6EK@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpiZthJSpgGUJArwDmcgIL36s/pm/NZCfdZYcbr3W3ICjtvjB
	joXUllTOmXMoOLkNYicVFlXMJwk44D0JY1uzrUJBnxklLJjELCyaXidQYswi8TZzMkfsGeTnbAU
	bpNzLNaNc1PGkaHwqm1aCVMIVhn1kvhliIFrPYYNl5XtYNthSSWe1PoAVlvRmKXRkQGvP
X-Gm-Gg: ASbGncv6DdbZrKCHDnCy9i9iOgbYPG6x1I6cWC9orKBelxZpciBI13uR1TnDsuI5/OZ
	ko6UryQTWZq496kW9ZSdXhJtiF6V3hbxzoGF34vN9uVVUmMozLtFdvrHYk2Cgd/6Cc9ZCAV8aMZ
	81DZi9O8S7b40WeHW6lhQaF2BmhAS2zhroD/BU/VjzfnER/GwjlAquhEKLknZW3LFeJHZ3JPg8z
	SDF23PEZwsHEQ9JPRkggvirH2ils0alWrAtprHa1HZ500UnBXO0iZSTTk3Ph1yF/7ib/hBg4ckw
	C56ae+tgonTyqv/x/cKtPgqIXF2sMkRcng1qxEzx3//3vnrOFlKVUUNSciGpM45mhC3m2fZs4rz
	0e1nqMUbuJu9Dt3KlsK/Q9Fg9JEpkoZM/bEKRKXj/uGPaYKhg8ANO
X-Received: by 2002:ac8:5f4c:0:b0:4b3:1c48:e9ea with SMTP id d75a77b69052e-4b31d8445e4mr81606621cf.5.1756806540181;
        Tue, 02 Sep 2025 02:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZKU4HE2HJogDoRI/mFySjKfrG/0weGrNzkeug/yUx/r/706E/wXqTZfTWe6WraRHbzYq5gg==
X-Received: by 2002:ac8:5f4c:0:b0:4b3:1c48:e9ea with SMTP id d75a77b69052e-4b31d8445e4mr81606321cf.5.1756806539674;
        Tue, 02 Sep 2025 02:48:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5075c85sm3350441fa.50.2025.09.02.02.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:48:58 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:48:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <tvdbil5fhgntj6wx235ihum6dxy673ekdlpmv2qath5r2o7f3l@jynol3ns7uxb>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <20250902-speedy-overjoyed-dove-edf2ee@kuoka>
 <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
 <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
X-Proofpoint-GUID: 1V_MWARUNGI9m137-_FWhiM99ynAVocW
X-Proofpoint-ORIG-GUID: 1V_MWARUNGI9m137-_FWhiM99ynAVocW
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6bd8d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lf_M6NTgIIccHnlT_YMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX3n8ijS8i6eD9
 PGdUxiKEo19ll3A0R1SXKxuVSQZYT0zRY9uEaCaxY3mQCUBrodteWQRtPiwrEcYjjX9/pUaaFKF
 PaQxnRkm25sJMWyKvGawiT11U0CiYLb7ni9xVVtEv24Sa/6wZskorBcogcoSfYD6BzlzUx4N4r3
 D0DHrXvt45ioV8jfVfOM3emTqoQasoUkxZ9Q30dmYN/BAVGetstfDQLtTu9LDazObkG9jFPNE2W
 AKERZcitoWgysmUIxcNZrZQhe9BGgQZNUCxrEb3WJnIwdXMEOe5GoqHDRFxqRxPZjcVpXnuYgYt
 5OBPN2J7RZbvFqQdggbS3/HFnTLxximnnC/EnXzyobKn31yU4hjQHvg7YSTFAmOA3Dl8ZCuwtUi
 9nWqxZkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Tue, Sep 02, 2025 at 03:42:55PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/2/2025 2:41 PM, Krzysztof Kozlowski wrote:
> > On 02/09/2025 08:38, Krzysztof Kozlowski wrote:
> > > On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              # QCS8300 only has one DP controller that supports 4
> > > > +              # streams MST.
> > > > +              - qcom,qcs8300-dp
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          minItems: 9
> > > > +          maxItems: 9
> > > > +        clocks:
> > > > +          minItems: 8
> > > > +          maxItems: 8
> > > 
> > > Clocks have only five items, reg has 5. At least in my next from few
> > > days ago.
> > > 
> > > Nothing explains any patchset dependencies, so this makes reviewing more
> > > difficult than it should be.
> > OK, I found the dependency in cover letter (I was looking at wrong cover
> > letter), but the dependency does not have relevant clock changes, so
> > this is still wrong.
> > 
> Hi, https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com/
> dp-controller.yaml descriptions for regs and clks have been added. Compare
> with SA8775P, QCS8300 don't have DP1 controller which supports 2 streams
> MST, so its minItems and maxItems clocks is 8. > I suggest to slow down with
> this patchset. It's v10 already with
> > simultaneous other changes and two (!!!) dependencies.
> > Sorry for that, will wait until the dependencies become stable before
> updating the patch.> I don't know how I am supposed to review this.

Please fix you email client. This is garbled. It mixes your text and
Krzysztof's on the same line.

> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

