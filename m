Return-Path: <linux-arm-msm+bounces-84823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F40CB16BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BBB2300EA3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF022FC877;
	Tue,  9 Dec 2025 23:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/zN2Ju3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ke1wxh1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6A188713
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765322351; cv=none; b=RXCewyJ+mQmgM2qooj44jAlsCyqzWkgomqSvKqVhXhzwVYfmjY4P09ec1lbgy0XEFLbpMDuI8J7YpSARffA/NH0VGb0IuAykAG2DjIyCocU0o86dCl+cuykHRPlwisafMOKoRT3KK0IHP0iXdBtgoh+RNyzifvXXkdBWWi9Da5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765322351; c=relaxed/simple;
	bh=P7BlIgI78j0Ft2abSXd/pLj+t/fgR1148HKMHDHHEGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqrhDDHiUOEjoVyjGRFa4pFW7SvhHwXUb0BXzMhAFgnf65+1ZpwvliEXtLNquD6SW6Ul9kIy+zK4F9FyrIc0H0yXZfFrJyf5RAapRwj2eWW//8IFztl2T158KgmqGK3ACzz5wGmScFadhf8OwDAxIgzWqaH2dPoaIsAKp/SLrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/zN2Ju3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ke1wxh1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9NIfAS718159
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=33eYtDWErrEVXrhkyt6CXsRk
	TooydK0b0le8aFIwTeA=; b=M/zN2Ju3ZBgk6SyXrtEzrWmXwByUObX6Q4GpRgK0
	O/tO/cQ23/uNjtBdufHgqy7cKVf3pqHULolbFnC/wiwYwmWcX9JFyTFtcXCikAys
	Pg9eM0UKSpwGVfBPSc43Q7n4Xcb+Z87YIOFe3LPs1HUeOfGFYSG6H+KyllD1+kjR
	UHxZ1YKy69gWObYjaHDLeOxm/HjSaq2Vr+uZv9g9Ift7LeCVz2eJyslC/tA0nLQT
	aqIKwhbtmwQ9jW1in0vtoq+S2HzmSM7W5HS3ua6cp6b0rTKc8/3tqTQEBhgEk0y7
	QLM/9uMBgfULAz3zFFBhk/MafIt01k25Jp29P2CkWrZfhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk5295t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:19:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso1344405985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765322348; x=1765927148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33eYtDWErrEVXrhkyt6CXsRkTooydK0b0le8aFIwTeA=;
        b=ke1wxh1bidzsg1ixtZNPBR27GwD+XyamKRWBNpTwNYTs3bcXYO+yBcE4stG7xZl8eo
         7N2yfWc8mUvE9R7lb0TzyAWEmiosvTqPcN4IrKqDHzMHEBPakZDl4TLyM9tCOfOiNQws
         ahbMclw7zyPjG49fa7W7NnHsWBjt957mNCY6H1x4WW3tuHkhq6wI9WPUBOfScll8qCTK
         ebgOgKS14hUT2iitFjGmIaebRPSEDMsfC6O0cbJXWhzPF0ROHGOSD47HDs/NQqUSftjX
         bZdXmZd2MWCjlYYyuMkZVup78fqNNs8kWCA0XBZvQJXR9+Anx/J89pJq9UwUSTJ0wC+o
         cUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765322348; x=1765927148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33eYtDWErrEVXrhkyt6CXsRkTooydK0b0le8aFIwTeA=;
        b=E/09O9q64mC3/a3a4yu1UFKxjGUUfME6iPayXZr4N29ZePgx452N0wkLZY3P6MDE+M
         iF+yq1cYNqsUdYV9Vxa1QYRi/sZXuzTlbb3CGP8jSC9fjxSipIEW+78JhoIv/S/+iyR+
         3jC1I6yxLvgRJnFlf3RGpO4mtTAIX9VPEYEHwFCZ2q0oCOq8RaIPkJW+ba9wjLqKWqvx
         7VuYWQyKRDg4YM6ukMKX73LtiyfRh0mngJBXA+9LYhj0hMFhMzCXk3VXAHV0hpsgFOe5
         xBmTwAXrC09/K/wgL/fWgUnPsDcmUHWeb3jVjzbFvrnHKA8n+pE8SxleCoZnPzlzJFa3
         rKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIyvGjYRLSJEmj6aGuZYgPsnvlNDuFq/oQqf7SVGNTIQmOrQP2974mCNgHKEJ0BEfx9AHLaGonVG/oFWHt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjm/xbpi7YpZutNjsu95cKd/D5QkeFhZLoDyHFN+eI30w2SAw2
	yEWYdLXao9oU9WWjQAhphy6KmgBVuFevejRxvDIGuuJiJmwmeuCIa91H9zTzUgPB8Vt/Pl8k9Ik
	AJOj3Bh2T+SC1InglqokKr/d0EiuSexysuCyHhJCrEfsyVfrkEWxzaQiexAccsH6LVGn8sOTXw5
	+d
X-Gm-Gg: ASbGncsj0AdDU+F+lPeY1w1Uquwxme4EVPuZJe747Dnjkm3ZWbDt4mXQAigRU8e11tT
	VM8JAttP5xugwlVsnATg+LSG5/Nes/6JPq7SI+ZeuEu6RXeYIzZdF6oGxrueE8daXekwp9WZ929
	eDGdyD3YPIGdIg4UeMoQFLHHsPbY+UkJHN0lHoSIexLaKr/N2539Soo3W2dh7qv+Di+4IaTAfig
	kXzUyHaP09UBlzDLAWRTk+rFZdrBQvoI/L/UG0IbTkjmoCgZIo5rzpt0DNfg7bgLHm5Xk+HirZ+
	Invw4BBQxbeB90E03lLXtXzKZ7uYLPKPityBg5AvvPQIAVM1wg2gFlzxmFI5TW0PglLrCxXeAze
	KIMVhl2xDFDfByqCn/QUgUABNcUw8uJOgPP73iV4Hrfk07x4lwmc3ZbkPryCmqfx1CVGVeDz9p3
	pMC3J/8Pe6KOh1eUbfdd2VOok=
X-Received: by 2002:a05:622a:4d0a:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4f1b1a0a12fmr6821221cf.35.1765322348499;
        Tue, 09 Dec 2025 15:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz/HvWIDVVxjbHP2UzZinCSPKvsMUeE9RGETWdtMLYmXGOBSsrf3hH3HNvZYoC6/2bLvvQnA==
X-Received: by 2002:a05:622a:4d0a:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4f1b1a0a12fmr6820891cf.35.1765322348080;
        Tue, 09 Dec 2025 15:19:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e4afsm5639304e87.95.2025.12.09.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:19:07 -0800 (PST)
Date: Wed, 10 Dec 2025 01:19:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        vkoul@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 8/9] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <4f3og44prqjjxsiy5lwnxam3ikqylvmk3m2ofsxoa5byczhs56@3uvxjtobddxf>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
 <20251209-linux-next-12825-v8-8-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-linux-next-12825-v8-8-42133596bda0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: S1uX7cJnbQy2gIlUvlf-4hXPOeuefA6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MyBTYWx0ZWRfX6SdXTQZGjOUF
 uj+lf8lxLxc7ptB6sIZp2Hiv607Kuwu5luUn3YvMtL+xOIYWlmRJlqUz5be6il1Ai8V4vwLOt5Z
 cfBuGj7+UNYhMbGu5Dt34eElRRTbYogaorKjISXJFrEHtkaKJDZQeQaBWcZtOFN2jMVB4Qi2p0R
 quRTEXX2tg6bLtvv7DzID/K+rifVz7W6/zEHlN14Q8m3ADJT9DxDifYEv4X+ik9iVuNUlWn5I0g
 Du86zieh82DoFv8MB7wl2FhUjCMzqwf/QDt3eskrqCPh3bRxXm2FYNaljSYRBeTTCsejU3mjF78
 aywBlAGpdfqmweu/CvbevddxtEkGBF8wOsZ6JwJzWIyPBfpqt3TX+zZd5oG+J6u2nu1ltRtwfAJ
 Pq912lODq3JYZvOsaCnUSigPpUEiyA==
X-Proofpoint-GUID: S1uX7cJnbQy2gIlUvlf-4hXPOeuefA6-
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938ae6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gzIeawRUdsEZb0YUvHYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090183

On Tue, Dec 09, 2025 at 03:09:44PM -0800, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 285 +++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
>  .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
>  7 files changed, 1212 insertions(+)
> 

Does this work without DP tables?

-- 
With best wishes
Dmitry

