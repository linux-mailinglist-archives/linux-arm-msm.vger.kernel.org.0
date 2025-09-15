Return-Path: <linux-arm-msm+bounces-73528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBCB57576
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728C217DAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658902F4A18;
	Mon, 15 Sep 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJGWvMVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF42777F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930593; cv=none; b=pQqK9XURP6mST7NvFGxbCGsyEuWeSA2Zj/zJaPBwQvQW3m6giJ4wKsLJVy2xX3U2Yrk1RLwB9WydxkZV+98rrUluOU2lxJVjGGDpIQwh+ZZJ/25TO30FD2GnU28euoF6AHEKlrHfy8EvoI76gKJU6D7NogbaOcLEqtco/8VzHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930593; c=relaxed/simple;
	bh=Iw9O6JFABdPImwFcOVaVdVzFNCl9y3X10Z2HGZWgFms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppBy8ChwvWR7S5mrHmPFPKREX4dou5zDLZhBaJOAJIFxahB+w6MWAop39n3oIAi4uCFIyJns20D1FhVXrl/D8qNiDv1ehO5aiiJDZlOt+64508aJ9PfFNGsm/xWKOsoOxM0JaWhQ7EESKsBjkW668mJFaFhn+AccVgTYVf3x60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJGWvMVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G5H2018382
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=; b=MJGWvMVHbgq0zK09
	OJ59VyRCwAkg6z9Y2Z98viKfYf3Aqds+STSfibyZnNaYQWThswgGz+TFMVzyxJHM
	dBvM3QQ50SITB6Vh2CzOsORsyOObN4kDWJYhKtzUPxI8xlXhmcxtIOOa59jKdHuL
	CMi3gNAZLkH72urj5E9BT2aFRZz4CRS7eORsfMCH891HQVQtB8S2kRFbi4lN1vMB
	tOApXXnhh+oDfW5gZNcrHkA05txE8Paqk0dZTkLgKcvNd/bFByZvu/H1TTsXWevI
	D00jWAbr4FAtWPvXUwnKIpAG5ezmvpMB000Q299aevibP7qbxjsxniRhLot0MOhx
	zojXwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u54edq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:03:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso3770491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930590; x=1758535390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=;
        b=DyAZ+7YWWVAPvI/AzcINp06O8ub89cgi+VtSsR9LvM7ylU+UcBh1IL/CGU+uJm84FI
         Q2mZQRs04t7x/EjDTUmfh/L751il/2ZFrWbzNO7ulb1jICp9ZKfdwf1NyfbU8y0AbURK
         4+K8k5Qmd5MvhJqmESKWwvUuPSYQIHDuEyLJJD5YaoIiyGYn44HBh4p5qJdhKNhoFaZZ
         XiEpsGthDQTmIM8PnRpFI+7eLYyJaMgjg3ZMx6lh4BYs8nhs6bAstE2GnlSosRBuTC/p
         MoGQHUqSVjQsQpaakrQLNjbeJ2RhVaUWLhmNjb6lXDKm+QW4pstUXO0WlZkPW1PQNedi
         2OeA==
X-Forwarded-Encrypted: i=1; AJvYcCWz2wAxN5hE6qiUol/+deDwtrAo4OPp49N3DHaaXyRmZKevZQ4G6qEYQ8bbvJ11cyaEsE46ync4wc0Imiu0@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTh5/eRZVEAdPE+MWYR5UT8oCigD8Y8lx0PhjfMLKsQgYZtmX
	H2rduTlDmgBa4tmGiur6+Yj+DiUqbCG+8hh1WzYXUEfskKIHODYq1Pm5xPnCt6DVJaW+eB3ODJ4
	Wy9AvySGUy71wFBme6CfQzY7IZbxc9hDEOYMkHpxmzOunqyOwG+tr/eNnoKhvOOgr10Ad
X-Gm-Gg: ASbGncsVmAeDznQ5YF53TRDyFxFEGRbu20KYK7ImdORwtbSj8hm7AS8Qhb10j5stznq
	IHgGTFu4irZFYjFidFalbBLzqpd5/Fqnl1P4WPbEtSR52WSDWCAMcabjnw2lvaFnNl0rrfoErT2
	fw4fqeCzg52bHrHuvErnlE1Z9vkuj92e729zMcOySX8CIVCDj5Wb7R5jtzRwJHr6oYLYL3zGsog
	AmwVCu8y0MjoB02Ut3td+i0FFJOPANdWQDrDRIWP0k9yFtIJ/kmDG+FzMmI3jGTXhvSW68TY3Hy
	DRd4Ph4EjWKUyZfErr5xGy/eGYzD4EDjEQ3anmig97HBjYwvNhskicNum8qVYIDRib8vEHYH6Cx
	viR/8swA2Kq3xLIyw++CYXBNLG2tbbb2smQW7CjdU6z6AT5k/2oN/
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id d75a77b69052e-4b79ae87162mr50917351cf.37.1757930589640;
        Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfpvRgAhMNhUxIeD9tNbprQD/TrxHXCB7JaEsEcvWEvuJOODOSQVkWTR5TtGrU2694pjoctw==
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id d75a77b69052e-4b79ae87162mr50916841cf.37.1757930589119;
        Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571459c1482sm2723638e87.0.2025.09.15.03.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:03:08 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:03:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
 <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
X-Proofpoint-GUID: pXBER0GbuokiqMTDwkPNQXDGcJgJy1-x
X-Proofpoint-ORIG-GUID: pXBER0GbuokiqMTDwkPNQXDGcJgJy1-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX1GEI/F+r1sdt
 OVEISSAQHSP4AlcylFBUJ1I0y5fI1lO5dMtBNMuVR69MXc5REk9jZFybAYsy2D7cGjhUQmsDso1
 Z7sN3YXVITHNqKve/ITuzasOpt1h3vOT2CDU0MBnLwmThpPjGl3kmt97WxevBpqjhj/fX6dPJkZ
 QcP2H5XWe3j7Gos+zWUdtUc2EgNnJWbqxDqMtPsesnxiSjYYd3zOlOmphBeO0ZTqcf+7FNSXrV/
 DLrK/obSUE/nKCjb0guTzsvK75C9+jiAjEeEaflc60mZtqyDaDEZReY8tFfMEzTi+nRu4jzjtZK
 CuhcCsSt3ljPljLJyB4K9QGXJums7xKOQkpiIW0CnrY8ZX88+zwOoOtlTKjMEBdEv8TanzgE42R
 F0keEQtF
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c7e45f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=RKHcw_4USbZLBnuPHksA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Mon, Sep 15, 2025 at 02:26:12PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> >> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >>>> potential issues if SM8350 support evolves in the future.
> >>> The controller is exactly the same as the one present on SM8150. HBR3 is
> >>> a property of the PHY.
> >>
> >> Ok, will update commit msg.
> > Please red my response again. What does it says to you wrt bindings?
> >
> 
> Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
> previously familiar with how fallback compatibility is defined in the
> bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
> fine to drop the driver patch ([2/2])?

Yes

> 
> Here’s the updated commit message for [1/2], does it match your expectation?
> 'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
> compatible to sm8350-dp for consistency with existing bindings and to ensure
> correct matching and future clarity.'

I'd prefer if we have "qcom,sm6150-dp", "qcom-sm8150-dp",
"qcom-sm8350-dp".

-- 
With best wishes
Dmitry

