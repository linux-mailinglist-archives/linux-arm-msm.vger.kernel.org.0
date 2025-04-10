Return-Path: <linux-arm-msm+bounces-53920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A55A84EF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 23:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FBBD189CC22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448301C5D63;
	Thu, 10 Apr 2025 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YshyldiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D66EB79
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319040; cv=none; b=Rudyq5QN/UY1vpiswli/HKlBEV2CHFLHl5+RpiNos6gWzLsR8YdjFOduVIdhMtHGZlhOKtWDpVXcp0+WDq+cO5Z2is7SfFnozPSWwWb2yIea7yZRgQBI7Hc+c/ZklHEABbBI+Z2THClP5YQyS+P1tglaUCuC1qay98BJBBhfhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319040; c=relaxed/simple;
	bh=QoUVJFsNeuh95zTi/O5wdw6e/E8iudtugl66XQGn5b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlIPfwihRXXFeFDdc6zYYBTBQ+mc9Bgpe7NLAhqp+Sh5EdLqILeAVIUCVlhwdu5LHAJOlEQ9jMx17fjt71r0Nb9dvStlOZ2AIIJnyMmP1InICYzsHIlFr2ow0kuW8J8CiK2xLlnxTp2Gd1pZgiUQvTx+d/F0vNEkUyCf/irUl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YshyldiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG1CtX029741
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4PZG3czDhFSdADnm0Z9EfhPy
	BHdHfF+GDYfVvDTzIXw=; b=YshyldiHcl+PPp8ca54Y0DD8n9VRO584cA/CUZfX
	/99e0wuHrqqtMFvMayc8rKmNBh6MQrAWMlFJQrOZh+wbR8Eg7ADkjPzjNy+pMSB8
	cSNFeVbp2dDu6dPQDm/Z91r3HNXwD+EQn+69s2e+FK9baZlO5CKmMVCVUDAlz8g0
	SDPgvMUoVauzLANSg0F8c5zB2KNHcVbY1y5nHtW8X8QAUkXcTtz9c3JnwIYKjcUr
	YN+w7MGxBvHFVNm3fB5KSyKTbeZ7PzMNpYw8+8JglmIPtKy7eyOQKHh7KAirIuGe
	AjPfc9U+70sYYbQi/36lXdwkbwRYedQ9sVyMhdT87vwT8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twburbfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:03:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff55so312098885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 14:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744319037; x=1744923837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PZG3czDhFSdADnm0Z9EfhPyBHdHfF+GDYfVvDTzIXw=;
        b=uiPSTl9nVqHPT4XO512pV5odgEXdAfP5d1dAnNLp1Lrb9SqNaS60GlGQo8zd3Lvhz5
         nPEDnfKHgYtBCmZ+5LJkCuXoXCPTNRkmdWi60S9gnd0qTsyY3fnRSrCx79YaAW9mD+u4
         4SJZXGOPKkGDsYQvgeZ7c6miSVHZBz1drPFedAH5xiHH65LcM9/GNviOLSmt9mdjOS7X
         Mr02xwGgYkh70x2vIE7iVHGdmMMz0blUHrI6Dg31J214h5cL2Wh4Vf5NFZkEVsTRsAFa
         DrlJ18tCFqKvTk0QWZrQVXtQnOvjAvCorYmq/tK6o7Vf8QQKfhQMRI04pQqnUcfaujlr
         JR3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXpXqmeOhwauyUW2gn5+OW6KHixDoOc7cg9bNNsuKeMFUXwLxAuKkcx2J2/I6mgp9plHqVHRHJtYYiQX0G@vger.kernel.org
X-Gm-Message-State: AOJu0YznjiMsaw2QYa+dQXjIl8r6XX4QxokETF4lBgBMYPpF5kZ4BKGn
	WscrqzL40E3PVLJHaU/DavyES3XfUxEVkYVg9iZ8cbMUNkF2b3qNDRiz7iwaz0Y7KgfYY0uYBpI
	nqQTMXfhDDB5va6M8zv0ktewvXvkadZKU9IacBKFSNX5JW77WPwUGtubpFnrjiznI
X-Gm-Gg: ASbGncthpS8Ih7Ol1ZLT/TRG0kvyW926CX8uXcZSjuhXGmNpmjX0Sr1IGRNVucMO7B9
	/EeHqGc1f4dhgB+jEX9VG7Pp4NJL1pfPmi/Khaq4Fmlx/PZgkvqXHu2RCfJAG4rMCe9uEPbURFT
	uTuXxBK5a7PhQJ4BmPmu5vLLJSZHJZ4ARg3DTbLNrgAyHiMJgKgZFeBYdxyKdltmy1B+FlhG3AE
	Jj+xc4eh4fI4IRc/N56pns7MR1BCJh2kETe6R1BpeZRjNyoHqbtCnuuxX1sPSzb2kL5VeXft8m2
	SwMsxl3BqCr93KDQutpeklArzq68nsAgeZOxXzqvHgtpafmDFYWMgXLpW0dbBiPM5JAX53KyBWk
	=
X-Received: by 2002:a05:620a:f0c:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c7af1064ebmr73471285a.4.1744319036885;
        Thu, 10 Apr 2025 14:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO1wKQDlbQ7ifQZsqEebxHEm2hbfL0ld051Xsysl4MCxJWn+bSlyt7LbmSbua2RPWskhGlDg==
X-Received: by 2002:a05:620a:f0c:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c7af1064ebmr73467285a.4.1744319036483;
        Thu, 10 Apr 2025 14:03:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5110besm247883e87.207.2025.04.10.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:03:55 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:03:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 4/5 RESEND] thermal: qcom-spmi-temp-alarm: add support
 for GEN2 rev 2 PMIC peripherals
Message-ID: <iek3zdab4ntupvx5hg25mbyrcpkfwbetknbbxmlxcxu53fse5o@5oj2v6djxuw4>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: lvVBCDr_9Lq8k_FrRQg6Zegh5aPPvc4T
X-Proofpoint-ORIG-GUID: lvVBCDr_9Lq8k_FrRQg6Zegh5aPPvc4T
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8323e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pSTwrD_UtAVMu4Epr4YA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:07PM -0700, Anjelique Melendez wrote:
> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
> revision 2.  This revision utilizes individual temp DAC registers
> to set the threshold temperature for over-temperature stages 1,
> 2, and 3 instead of a single register to specify a set of
> thresholds.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

