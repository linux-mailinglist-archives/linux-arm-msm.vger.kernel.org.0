Return-Path: <linux-arm-msm+bounces-78680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F60C0472D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 904764E1138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 06:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA46244692;
	Fri, 24 Oct 2025 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hV/iQ0Ve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F184219A8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286245; cv=none; b=dXUswZR6HtUof6AybxmFboxnKQqljbKTK3ALasiNRKp6gSbTF/UupWo/sZuCKmgoQb94B7jXgTNwQP0s/DzE34iQ/E01YD5P5gSMX2Z7nfnK6DuFMAO8wSEij53EI1adGWPHMviLMW1XX+EVyD5tvqQB5MNJoCJ6kBxxX4JAJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286245; c=relaxed/simple;
	bh=Uflu6VZJJ5Inn7mIJ0KBnxD7bYqrB+u8/dlCHjMtfto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI3C09WAzoBSF2pSabA2dpdxLwnYByDXqAp7q/urchxm3BZqpcmbpZAru/WZM8W8r52TKYoLdyydqrbhaG2r895mTK/Oitj++/RaeEHxl3y5xY95sI9N1LZPkYXhY+XnBH9fAWbKwE4vICnJbFth2nE3l0oCXWXr3uhinQRjbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hV/iQ0Ve; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3Ffnl006904
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iPDyisl44Ds/H4LrsIWE8heq
	Yin0PT0m3dP+JNRSHeI=; b=hV/iQ0VeW4QjxbWm9Z8aa1teHm+fAYtwOBru/D+u
	pN+54kTGbayJ6FViPbZT1uY9Yg33/T5rzquz//sIlwCumVOqXeE/MLjjCBPzwkEE
	eXRezn091PeuNcxYpdQRZaVxzP8wNTo3hWQSJ+U4VHHqJIPxhX0QGQSrf1tRfHCy
	3Pf+9PTcT5v1GPFtQRD7K3gR2uKIxv7crkRiDRzVdVVK3JhbWaRfMVv6WLSuOESV
	D8kZckRAB9VIvxbhuTecApkFcDFv3pkZwZzrfFGoA4qWIpexxWBl6m5f2oYemGJ4
	oWqZcu5Lh/In0a2ifFQfkQIr/r632CmX7xjMJb0Jxc2IhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344b0yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:10:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8adba545aso56262391cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 23:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286242; x=1761891042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPDyisl44Ds/H4LrsIWE8heqYin0PT0m3dP+JNRSHeI=;
        b=bwlOBETJFwafkX6Iy0z6qa/esLvJRs6VdzyJ+YvO4eoPTsS5ptxUtuJRsBdo1oxszT
         dIV/tC6LpTD086nou6svRq2qQ2WGrCymoOCWOTHDzU9UbaTEPE7NI49C3kHCHz45vJ7s
         MmZBEa0hp6fVASZv0yJH1uWbzMtJvALoqatlKNc0agMbfYj5LrvtyRzdhl2KRrrYqbwD
         FaR9PAYydY1AOCQiHSwgff/SQrRtTejgbkePQOXHX011cZKzsT+RzNFC3MKaePGl+oFu
         4Bpf+T/4nV5E+onRDlTq3IPOJBfz/o5c6fIDzL96rVf916cR1ZdbKs9eEP0/qKJ0KPW9
         6s8w==
X-Forwarded-Encrypted: i=1; AJvYcCXm/kbsj64N1rbflMc0PFFZbt6UUZM+abAhlNmZ/JKiVqxP2vnRPT+HDQ08dtMK/BVQxdDjWeSSaZmceacJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAb2/Z4MCfkSm/QrTejv+IhEPFUOaLB23hgM9rT0HvIlwTSPY
	srx2HehY2BOiZyTO9hkyyAaejOIKnnwZwnFH11fb0tdKOPPa8kiBEUwLQXi8bZda+GzBVY+I/py
	XEdR2O+T+IdpScqbfxJEyfZ9FHOSnNlL9Gd3mPcpgID9RFclLgZOmooVvBc12lfEg0vqf
X-Gm-Gg: ASbGncvk0B6S0KhCtj2C5CNYnLFi0JrFz3QUiXIFimnVAZJB7kGk3WC+1IjvecCmsCC
	R4dKVysuIKjEp8FVyi9ax6mRsrgAtlirP08tKXzxGyyDnSSFCXhMKFADJCrtrLLwHrUdcxUeofW
	1DqwoIyThtLGTi3Tym3dvpBFwo1S6PKyqbhoZQRHCg3j8htyyzSG0SqvMsObeUMDHNOPex7ZQhb
	zBxyCdN30J9AQd+5eCYrPrdKoZq0663YaFrl1v4yaJ890o2UgY+kOmmnJbLekoAUkKEy8MGWyCy
	MK7epiG7T6xwSG6UADKkt1hBBXk64nc37WxIq9PbjPm4Gs6s+LnqWimr2Kua/jcDdIc/Q2UMK6R
	zKX6Ld9DS9HHeqMpTG8rkWev/nnarbRFSdwWtZkiViTzeIjj7dtgprlVFUPYs
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4eb947d0b75mr10195151cf.17.1761286242105;
        Thu, 23 Oct 2025 23:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEtR9U1iGlrQGZPr6uA0Clma7yT4910fb9qum1J+IWWzJ2J/Ji+vn8lfUnOE0P2SRWMpyyYA==
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4eb947d0b75mr10194911cf.17.1761286241626;
        Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c120567b1sm320507385a.51.2025.10.23.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:10:29 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
X-Proofpoint-GUID: GYJpwcuH73-2pSe3h_KcO1rkhbHelvHb
X-Proofpoint-ORIG-GUID: GYJpwcuH73-2pSe3h_KcO1rkhbHelvHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX1va70mX7v232
 +D1ReBxJ8L3eolfaValJjeeXI3YKGWgv8twwccm9bHBPHpHwd+SaAJRunk3Budg47r8RoBPbTLt
 SJnhknz15V94kMQqBG19q8ph88tVIBh4oCn7jau5E0ZhKLj0MZ0FawUZ3bDK49G4aiqwCnjsa43
 V2HpNEZQpYrAOm5INoS1nIGo2NkNh6Fw6KyN2Is8H755W7V4DK6vB6ER5oM9JYHNx0kgt29V1yf
 wsgj603XIhKBflJtDF+XRHvd11GMwF84HdFbmm7IPDrx9eyy/LrPmCA+iN7SYFXBgIYjLDzn+Og
 I7nwQ1I40Pg5LuaieVGrlvHQ8y7cKdkIIFUz8X82MB5IlcGolumpsjwW74pEMystMThjPz+T/HY
 unhoQjVybiduQWQTuzA7VJtYnkS0sA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fb1863 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> In the subject: DSI, not DSi
OK will note.

 
> > 
> > Add DSI PHY for Kaanapali.
> 
> Why?

DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

> 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > index 1ca820a500b7..a6e044eed3df 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      enum:
> >        - qcom,dsi-phy-7nm
> >        - qcom,dsi-phy-7nm-8150
> > +      - qcom,kaanapali-dsi-phy-3nm
> >        - qcom,sa8775p-dsi-phy-5nm
> >        - qcom,sar2130p-dsi-phy-5nm
> >        - qcom,sc7280-dsi-phy-7nm
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

