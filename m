Return-Path: <linux-arm-msm+bounces-71542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FAB3FBD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E80A3B8632
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9102EFD82;
	Tue,  2 Sep 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvgMUzYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237C2EDD72
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807643; cv=none; b=Kk704GD5qQlxZffw4DH1HZS7JK/W9qcIpsAHI/euU4tFTMSIq+3sU6hYO4abEzYLOFzVnYSTzAm4S/ea2HkBCNEO5vUNafQkruaWEPwXNvnF5yld1i8ICcTO9oZfBwy1OSgwjdGAN1J064Qanu7mxbrdJF16A2w2OPStKheoTQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807643; c=relaxed/simple;
	bh=SH7iW9GAQZcbs1Y11U+SsJVQU2myZgWlogyzSHF5AvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jm4noNNJ77n25UYrg6u5c1QCUwk912PbYALakprPGK5crhEr9399D7lrUm+MOK/Hc0Ci/Z12ZGPKj1PG78SnayqvqegfRAg/84D6gzjOQ/4fl/0HBKjRAjZ+QinSgbZYGxaZIzaxDVjfzxjvqWRUwSSAcVGBaA3ymvYJ0LHVbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvgMUzYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SAF0015364
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lioLz+MVb+lNAwEehrq912Az
	AcaUt5myxr/iYapOUHk=; b=SvgMUzYxGKdZZyKPhp1OwR6qTyNBlKhCOywOuZjT
	m2PHwjCOpXk0RstPf8TVPfcw+I8DnE5FYwJH85mR8yL3WAGkdRdBAt3KZ0J8ff0X
	tu3gOSYtQgcwXmwFu0SrG62EqNz9UlkzJ5jZecOdMJeNr/ilnazVs2rJV9HRUKNc
	LB8eLtxrT77Vj0vnUb6rT7ipr51cDfdEQE0OCdCwt8NgFkYzIHN04CImk7Q0JhZ3
	c4mmP3OOpAp3kmW39ju/kvvuC1l6KKP7R/yxAWLWmKESkC3jLmJ5uMCnJ1xh0VFu
	JWmXuHIlQ/SNQsA9nXpYpIB4dIj81gu7jnnGgI7Sjr3pEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyydp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:07:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e86499748cso1413497685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807640; x=1757412440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lioLz+MVb+lNAwEehrq912AzAcaUt5myxr/iYapOUHk=;
        b=VZOy3pa73Tg+HzGOaPrX5S1bcNIqlf6EUmJAUDVG2EDyuMt2r1Bsj3qQ41IKBMPegA
         8B9jI/lXY99kVbyOP1khEBeGiyL4RtBW7RlWrFuwQWAATBhWkX3v56idvs/ZJ6zw65Db
         hD9EBRqbd/r1F1P1+JPYcoSKDs99rD5apACSm4ISAnnfV0GfAK8I59PuukZtDTifLoBI
         awK4xbl3GI1FM3uFKGC3aDDb2k8SmFe5RfZzMx/qK8lP19oY9nUH3KD7yA/3USZPIYYh
         jhQ7A1KWAKhlfmJqPGv3x5CLH18ZITc8UUNYO53y0iJbIHnzR0XPmduoKKABl9y2YdHK
         TpAg==
X-Forwarded-Encrypted: i=1; AJvYcCWCSpQX4mIwKZfsjoum4nN3pXTHt8tIRl3dOzVFq6j91M6esBA07Nh5E9nhzO8WpRXmPOeEZYgEdTtOh5ed@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHX/B75SRvMpDiF948O+rFgVt9q/LT6sn7OPFefEmcj0XQD0/
	Ah8Bwibk24MtvJT8o1bbmJUGrC+zzYYxsrjh0Lsc5XQyQwGDMDjYZP6A5Ko0984Inv3okm+I0aT
	TVyN9lPru6Zcgl4vC7KLpYEC9hjy5negpXODMM11SYl4F/d6H12vRWhUPWofy01s+R2jg
X-Gm-Gg: ASbGncvI3T4wl/rCxymDzWaSbwj1athVm9uQBM0n1X6CGv6xEV4Lc/b8rP+1BtVUizH
	FTZ+infLhF7ZU//dPIh7dABQ1h4HFednoFAjoRvQICEQ0AvSXuo1qnbvYOCdvYF0uVZgFbbRxRS
	toR+z8A/xIejs1wxtIcHZH0OAWnd6Eg53xkwnGCLsf7/VFdBPt1TV8heeWeTbItBg77Qkt4t/Um
	dnffvu5q9cqr8cYX56ADokXHG1GwEBoiw5LRxqiTeBiEbx24bPU56JtCOjphZyQL3g/CMKmhuqo
	Rx7DO3xmOgj4p+S5c0Lc2PVCvVDwm7iDhgnTKtHNu7AAbdanefCXPixFcEO4Zm7EreGjFaLP+4h
	kXcIfjDpetIFx8NKAB3UHsPuOOdkWJQLMVs2gt9PQ5GlPoGNBPbHu
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id 6a1803df08f44-70fa99552edmr115899296d6.26.1756807640267;
        Tue, 02 Sep 2025 03:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdoQnMA6U5z0bGZ7Wuiih/B4hBhoB6kk4Yipx1tsvtcSQs2cJZx7DcWOnC6cpn/6Cs6Hvdw==
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id 6a1803df08f44-70fa99552edmr115898976d6.26.1756807639672;
        Tue, 02 Sep 2025 03:07:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c50317sm3922901fa.2.2025.09.02.03.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:07:18 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:07:17 +0300
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
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <37ax7uhzopemvmz5fgtayzz3hmnxmfcbyjhwgfgkdglynuo5oj@fud24vsqodnj>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
 <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
 <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
X-Proofpoint-GUID: GzTr3L_6Bd3OpBbaIOmywt1qVgB1SLYg
X-Proofpoint-ORIG-GUID: GzTr3L_6Bd3OpBbaIOmywt1qVgB1SLYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX2GQnUh2W4XDz
 eRLEIrpYSwGRQ2OtQONZRDnixEH6AirCtjRbREZ7nSPbELXAUH9PRPxVwPAHIC8I3fiTTo6Wavm
 ZuFBAJNA2yqQOWy0GXZBIpjmDzgnyC3Lg+fEt+GaGW+jYi9r3GXVvSEI6pQRDuk5P3H+o1Xg+Mr
 jCDF8ZTwzd+KM07xt/oamDy8ez8Bf79g5HmVNKmP3l3GF4f10pTTj+xRGrpQz3JI4oJEpPnxUPY
 m23VBxtLL/LQK2JE6+f00CT6sclk0GBAFHx8OsznMxeaCIOBxt8g5QcbjoGPHo6ecwaatqZOS8j
 HQJMHyJtMKW7NbmMSZ+iecFbGA4Oy+xGdCz+wa0esdMnHPqs1sBIUY7M+R6XQ+oq82FIk8MSYU4
 chQz9Bg3
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6c1d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1RLsJLrTPffC7TqSMS0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Tue, Sep 02, 2025 at 08:07:22AM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 06:04, Dmitry Baryshkov wrote:
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> @@ -2249,7 +2249,7 @@ opp-560000000 {
> >>>  			};
> >>>  
> >>>  			mdss_dp: displayport-controller@ae90000 {
> >>> -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> >>> +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> >>
> >> No, that's breaking all the users.
> > 
> > WHy though? Both old and new lines are using fallbacks to bind the
> > driver to the device.
> 
> Kernel has sc7180 fallback, but what if other DTS user does not and that
> other user was relying on sm8350 fallback compatible? That other user
> won't have sm6350 dedicated handling as well.

Oh, a user which has SM8350 support, wants to support SM6350, but
doesn't support SC7180 DP? How hypothetical should be our users?

> 
> That breaking of users I meant.
> 
> With the kernel it should work, assuming SC7180-dp was introduced
> similar time as 8350-dp.

SC7180 DP was introduced several years ahead of SM8350, if my memory
doesn't deceive me.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

