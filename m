Return-Path: <linux-arm-msm+bounces-79274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB515C16B2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 20:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8C11C22BCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 19:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C211934F491;
	Tue, 28 Oct 2025 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0SdCCTU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCbFO326"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354BC3321CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681517; cv=none; b=g3Y4KbvKyfGoEhIXCBhSPkGESK9YJjrBunFDt/QMw0U1ahgeObJjFGvJLRXkhEtweLGYPw+OuWLuxZL5tFCvlbKjf5OsELVm10026eKJgxqzJPw9IlpbRu0sz/PKTYQCadoqarpHaShh3cVhezrh9w9ABBe/6zes2I9PHUa6/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681517; c=relaxed/simple;
	bh=GLSINUkccScePhTQCHGJIDiXL+ge2JT2Ltk3bZlFwU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXPIxbMzfDUObZWudKHxo5IlBsXKR0nKZSD91GuggQADL99GcWq3T+F2rO4hXqJdRXTsNOBl3CrPhpOrzRuFNdmpsMenz8aODGHXwSvAA3JTHYS4bWtPhI8kkL0jDytjxCH/H7Eqe003b00H9BD5RbZAv7rFsMpVn/qeZ8QkFd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0SdCCTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCbFO326; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlN3a2502828
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HC9tpIvHIz6+9K+gz/rNc72E
	qizD+nH+1zUVfnpz0Z0=; b=V0SdCCTU36+HZCsh/6WlYGSSvqGWix3hPXJpsYgr
	+qawP9qJ9Supln5gGBRWA4Eq7MvchO+uciBGQdlAf2u2TDo9yLEj28P9S8RJ7o5Q
	QuOCnNoZs+UxolxPzd3t1KMRAhCIomS4h7aYLzjDyTAfMRpBWZqh5N/YKofNSmAx
	rN6vcGwe+VKVRQbzwaqNHZ4zSF+G0mbNn8pJ20Ju+mVsHeKtXhvKhH44SIHXu27r
	HYs0gyWsrOAX6EDsrJRkMG2rXoVY/oEQ1vaY5O2X7dl/yA3+RmD4Xg1bJWdQ0v3n
	EIbVzb1oY1hko52mTM55HuMHBHQekZ6Zdb9zTU1ubANTTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g0sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:58:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eb9bcc1105so8467791cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681514; x=1762286314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
        b=GCbFO326vbtF0TaRN1Xq1gL9DvZ6xaUagbFjxNiWBaD16vPBdNlMfW2M9ljILXwKIC
         3lhU6P2emC3l+nYPNWUhzcLjgLOiilKO/8fSSN68GEqD62VdNWK68m7HH4oXFRbwjWRS
         EHKqRDMj0QaTbCYLpWBpLFsEiH2b7CQdSklSk7tq7/xt0Ey7I4PFX6LvBltsdZ1F7CA+
         ribkzFWSThNfhoQhu4W7BohbRUDtg/AmOUiMDHt1NSts5t2blFjuTvMUX2ZE7or8Uyo/
         5W2bbAOtQd3tbpVOuiIUkrOaPwQdX6Ko5H8XZk8xoP+76t91688TY8xVNfcME1oLBDlL
         BKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681514; x=1762286314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
        b=H/4mbfKKe4QBgPHgIE5Bjm6oR3FRNH6xsD/wHt/L6Sg8kiTd5TiABK1NByJrh6cCzJ
         96d2A0ryqR81xWVsKN23XQWiUEPizODFxeMz9yrMQQV9Ft1W/9V4FqQCiu+9ZnipgGJf
         FfRtnZ/mW+ZTrL+hgzysdB7DIjtTZwzDVRazGhvinkstQJzYmfgPKNFRVmgo82+E4nxP
         aMM8BRtL1KjzxPxhCYRQ2hVwseTSPBE14l4bG+8FHwhaHdoVZ+CVd+l6xESZYXBWljrs
         JO4JFc5hCRGqKKjnBuqGDH4g9FYsYcqHRut9hUwz5V/fTH9X9kCty9qJoelLOmDBX44a
         OX9A==
X-Forwarded-Encrypted: i=1; AJvYcCUhV8cxUzvVoTjWGq5qZJOYmQLT6XamJ1KRQ0BOx8hv4vRFmy/8WC8Vnkfu8ZOQsSyB89GXstyA3QW3YJ2h@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBuodiZ0eMIe3UTj6mOxTShaBfM4t240ExZc1ypohB3Vn7iTN
	EcZp3tFVkCYFSpeGkTPXSK+YzKstGGNolD524azDKn7mGu8k+xPDrszwe6gUiGRlvqPX+G99WEi
	5NwgsDC5HYV13qKKMH9rlROCLxeUjxor95EYFJGhhkGLWjFQjblyhcBY7WoR8HfGnSZ/+
X-Gm-Gg: ASbGncv5/NGBTrvl1aDp3PdkgEdnEZkoWGYoT5GLlv1SSt23crQmNdwn0KE5eylThLH
	JbwEPEWrfQf+E3AssVR6zwrAcTjQ4KKwRoYL5tCetkVD7qgVSQ3UG82p35ZwYJLtEvJ7ZfLEBle
	CIM+0vpzZP2koKMcynMDQrZQK/HR51SsL1CIvsgktJ8vnxnr6mgocVoGvulbe0gvKNZmCd8AWXj
	n7QDmAYMUAjwNBXqbllz33Ywu99A/Itp5CC/qaNcjRG9V7moyDpUmc/B/JfYxPMdmGghw7wat/W
	Qzmpi1kHj5oXLQ8lkyfvqS9YSF866ZSEd6TuxpGVvCGk5RZODmgkiJWbleAs+2n+VGbBARCM4xb
	neOfC0s5+WKSQ9CaSMAB5wqrIjxJw/qQ71TxKSzMZIeYqm+/O7onpjledwbEg+k6rn79HnupQT6
	Hog4IZk2v9hKI5
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id d75a77b69052e-4ed089a8095mr48571401cf.13.1761681514421;
        Tue, 28 Oct 2025 12:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaMmcLeIcEWm2PB1CZcpPJ3nfsaaOwDHDWrSPxIXsesjcRBn28xpDk5g3XqlOxBTccXdasMQ==
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id d75a77b69052e-4ed089a8095mr48571071cf.13.1761681513956;
        Tue, 28 Oct 2025 12:58:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-593097eb2d4sm1632173e87.66.2025.10.28.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 12:58:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:58:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <hzmwjn6xmb3kqvbvhhvycoskor4avtuuaubda5m3vmouten7z7@bvo53uektqln>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901206b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pr-hqIQVVoteFAb5gkcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _SW4cgAUAQg0_vPNChSSd4pFQRwbYwjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX+Wpab1za/RmP
 hqYHTJoBlvjeE1mwSJLfETRuxrB6egp8NgpSi3Rh1q9pyhts31io3C8OQ16+A9WmQaYgAGk4s3i
 R/CgBmwOWVu3Aq4rgzugOsNSYsioEbC1b83Nr9HHwrNVUJZpS1x6i5YXgtxNBKWOctAoIT/BLaP
 +yvcUTBajNyppcxTVDkmliX/R9+aK4dqKCNf57F4HIO9pHmjPMq5tDgljDCzMarDPlOX6KxITbC
 ZOlQCKYFRjYm5JcVSwEVXLRzeR88YRzJVMHx0hMrobpTdenQ/gaT1rJN5PHq88zKAmAiAByIO0a
 5+Zbr88Vxiie6me4Aoa71i0Sbga7BePA4As8iqA7lCrtLyKr5AfIKee9jTZB2puSq/tmcChd/ud
 2X5IQu5euldgiyBi/LBhvDtMnKLyBQ==
X-Proofpoint-GUID: _SW4cgAUAQg0_vPNChSSd4pFQRwbYwjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168

On Mon, Oct 27, 2025 at 01:54:43PM -0500, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
> > From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > 
> > SM6150 uses the same DisplayPort controller as SM8150, which is already
> > compatible with SM8350. Add the SM6150-specific compatible string and
> > update the binding example accordingly.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > @@ -51,6 +51,16 @@ patternProperties:
> >        compatible:
> >          const: qcom,sm6150-dpu
> >  
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm6150-dp
> > +          - const: qcom,sm8150-dp
> 
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?

sm6150-dp is the same as sm8150-dp. sm8150-dp is compatible with
sm8350-dp, but it's not the same version.

> 
> Regards,
> Bjorn
> 
> > +          - const: qcom,sm8350-dp
> > +
> >    "^dsi@[0-9a-f]+$":
> >      type: object
> >      additionalProperties: true
> > 
> > -- 
> > 2.34.1
> > 
> > 

-- 
With best wishes
Dmitry

