Return-Path: <linux-arm-msm+bounces-74071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C2B8498D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031C41C838F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D959C2D9ECD;
	Thu, 18 Sep 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSJrnu8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603981D416E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198816; cv=none; b=P8kiNnhcZokg7CAgGMm5QjDN+QQm9poAkbxr0/oHLcRWjGUdj0mqG/QL+EMC8FEYz7B6N+TZXKysFQ6kUVC8Ws2N7K1VfBPtdIu+Xl4GfFJfL7CHMIkDWDkzN18VZU6zmzVdFhNnJ2hAgLSo5d375rZswLOUIKjo9HeqAAaIk/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198816; c=relaxed/simple;
	bh=Q+TYOaA3yGG6fFlm2/faOhTd8PZmeKZWyUhQkFUBBVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uItjg31wNMh5cI/qsOYzkH4qfymTDbEFO3qOqQct3CWUbqspy8No/2nCg1Xvyyg6Dchn9l5BKxBN/Ol2JjIJsntM7F1hCy4739P2kg9WGmcshopQOb2y1W86N2FZUHKJMXSJASYTlFSgeni/BNtrTsM4827PTZKjjNqg37vJ1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSJrnu8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I8AjAG007166
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M3+3wD6GXgrzfXYSdL7W2k3T
	eizE+SNTVDS91lGfh6I=; b=pSJrnu8nOjjTAyQndiQ4wgox0QLDzruS7RITwFmE
	OSCYKWvxe3TqIKiMm2WwCV/ZdKDh9f3TtisNUcBr9aS62s6yI/zN4X4zhVZWLA4A
	RjOMy+2J3YB+/8PNb0XCoVi5ieFXC9dS35xdT2qb/j/8jFvTv+ROS7N4RbNSI5CS
	y07+ZE85yWd9pCb4eHJWmsh4bt0fYjG8p3ugBQn5ybofwXZn/s0MU98Xa2jkHMoz
	BK+JKfaJVM8iAU9errQHzV4SPst9CB9fjVudrxASsJ1gBf+bHuxy6zi4/Jg7j8pf
	hydlgJ95bVS530rVLfT7RPvoEePwY2xhJOa5uPoaExPrYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498eberu9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:33:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79089036c59so14906706d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198813; x=1758803613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3+3wD6GXgrzfXYSdL7W2k3TeizE+SNTVDS91lGfh6I=;
        b=FkOMtiaP/Y8FNroNVlzn9fO9IkpTVsbUXnt09soxeojEO8h8UXFDEVy1Kli8UH6V0a
         asn+QRQ1aACdmgucZi1IxDMA99SyfVO63rgjGxpatcmRzGSRMZy3VkmaDl7efz/3pfer
         C1rOK/RHBUro8A+EHrIQHNMS8S152BVTiHpSUimfI7Y1M6Uz9w4cGoO7ud40/y1x59rX
         7h8hqRw5JTuT4ODLpUTgrMkBUIR1SeVUy5N2D0RHb161DE0OOIR+6mk8PCmYIxRxj8HK
         WVxKpOxvihW7GyC90CckKTwIZzW9dLUOcB2YpU9Bfs/ITEWxIzyBrd11jcDAiPcSYFfb
         QHPg==
X-Forwarded-Encrypted: i=1; AJvYcCXZi5xeIDJ1qnX8+ggVfSIyLDiz9VDaefir6kG5cD1xBgMe47XGtV0Q6JkmKjS0rVa8PcjUo++fTuMUXaE8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yA9m9Y8cnrfyim1HSi4NkQLQyAlucEAYiLiBS6N3ulsFM95A
	SvjvM4H5Yu3yjyVZVBxA99X45vmUCJkBNuQ1dLgdgt82ctpCZr+FoJbmcNQ0HtB2HXd9jKfSAVY
	dUo1MPu5HYB3/qZVVLLO2ebSurgMYO8vKoSzT1uxf29pyFc578X8zGthpbOXmpOlrgjeuH8mGWq
	pU
X-Gm-Gg: ASbGnctfILKNdkTZ65GPj7S4Ybi0w95D1zty8+ahlVhbgCCd0vdagiNsuDW/6+QzkGJ
	n26/hAmRkDtihCz45wA0UHQ2PUBo0JqA+xpN+rTO5FQt7GfRL8XUqlGD1shjfMKIu3/M1e47EfX
	HSzX8b83FppuUYk3t12o1OraWLNU1bXi6kwxMwRlSu7L0AQvMxLGUsCrvKnLSmTK0K77qhYrSNm
	4+j4mpLCZuv0HDlRYxeViSsU3qYRzB+q3aoh0kDAyVFhoqlBD/t4gMgikB4Oxk0CxS/9zp779WD
	9vzpAPX1JbtJLtx9CIYQbMV9pfMtcd2aRtuT3JIoQBy92UM5zoIKKsVfoxKnB32RhKJcDLQZbmM
	jZr7NoDJnaYVJUaPgJJeM1c1hnlg7igehjjhqU72P0vlRhX37Kg6+
X-Received: by 2002:ad4:5c4e:0:b0:714:19c0:623 with SMTP id 6a1803df08f44-78ecc631871mr50029406d6.11.1758198812783;
        Thu, 18 Sep 2025 05:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIEjbSnHVYCZgAfmK5LUEyL4h7bWS7oPOvfXkKCrkyyHF5jc0atUb1w/yRFTyA7FhWBYoGAQ==
X-Received: by 2002:ad4:5c4e:0:b0:714:19c0:623 with SMTP id 6a1803df08f44-78ecc631871mr50029056d6.11.1758198812174;
        Thu, 18 Sep 2025 05:33:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a21b6sm621589e87.78.2025.09.18.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 05:33:31 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:33:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Message-ID: <k2ksad74xlhxmgr2xjikp6xmumk4e56dq7qkef4exugaszseen@qttpkitxaurz>
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
 <a3fkaue7vbh36gtvofkuucop23spupytjwtsuh4yq6k2rznf4o@fyfw6mi6lqol>
 <c94f8c86-625a-4c88-be9b-b29ddb28aec1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c94f8c86-625a-4c88-be9b-b29ddb28aec1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7P4RHuB-Kd_8v-BZB99k2nFHxzohmKHM
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cbfc1e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nCZ2oXYPcN36r-49cCkA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 7P4RHuB-Kd_8v-BZB99k2nFHxzohmKHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX0GmR0pfgVqax
 JwwIZcfu1qXJB2RXivAyyP1HFimLNfhtgysh2Te/N/t6pEoQFy1Lehnhd55sornMhnh2L7rs5Pi
 HiTL9BXk05Ob2NXLW2/CQIYYSBPGvEk9m5PrxmhTuK/X9P/e56SUyhhuG5FvE+CUGjPSET0EEm6
 827G0hgGHbszItaYmzonWW22ohca2EWtXHpuoZfEiGP9+X+RSEyf5ee611CageNwZrWRK3SQehJ
 gcSaLacsoN2TARNDIEH5GKwSNL70bMmZRUYMl7PEYw6lJceWwWw9y78pDyjq2Q2FO1s4W8D1NK4
 QRiIg8RRchSw5EBLIpioZaGy0d3lMO4zIdSfsZ5q2ys3ICFGVVoeNIWT6AdoGpCgqQ1GR8ChSHb
 s353Q3UH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On Thu, Sep 18, 2025 at 10:09:20AM +0200, Konrad Dybcio wrote:
> On 9/18/25 2:42 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 17, 2025 at 06:35:33PM +0200, Loic Poulain wrote:
> >> The PM8008 device is a dedicated camera PMIC integrating all the necessary
> >> camera power management features.
> > 
> > 
> > According to qcom_socinfo it's not present on my RB1 board. Are you sure
> > that it's a part of the main board and not of the mezzanine?
> 
> I don't think socinfo is going to be aware of I2C PMICs
> 
> (except maybe cases where they're the PMIC_A/B.. and critical
> for operation, like on certain IPQ SKUs)

Fair. I checked, on X13s PM8008 isn't present in socinfo.

And I checked the schematics, PM8008 is present in the Core Kit.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

