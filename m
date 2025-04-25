Return-Path: <linux-arm-msm+bounces-55722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE9A9D0CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136C34E225E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED3521B1AB;
	Fri, 25 Apr 2025 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq9WDn60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EB21A42C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607038; cv=none; b=ag39jeC/UFajXBaHFAhpDF+5pwBuTK01L99T0hjtgU8JE0spZSLbSWvTl0mpjWQn39G793pjW1pIHkTJzmYTSdwV8Ielos0JMjv1Sg2cPX0jhCSTl210CebQiruFpkXrNJ2sneVGAXZUZrB4ivBC7HzwDb8ltzXCjXD04DUR1gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607038; c=relaxed/simple;
	bh=3OkEVS8dQnFFnUr+eA5TheSMiK17eLIXgacYWk/jb5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+VOGANFbpS56SiAK7q7CV2R8+sCWGEMGNRWzPMghrmk3mHSGKOYwE3//nJlaOK4FvNMdTah/YAw2qFJmB7hgQPOnmwuAryL6rLE109HyGBcjU+7xPIw/yhA03ge2NJI92Va3/kNBBMHgU6lsgWgldtrX5Qqax17oajtuFUHmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq9WDn60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqO9012789
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVs8UbElJTYQ1nFLiPUapXZz
	eHRhnrnlXO1oTNnLdFQ=; b=Uq9WDn60D8vC2re+Jz3OWodm5VpCrxaAoqsjmniP
	QmDfk4L5PXItrf+1Kw88H0R7CzrVrrd+Ou7W0HNmvLs8+867R4YRg0q59o6n2md3
	pmGBMMW/SMNtGmzOUBZwcgSCmPzVBByTJLssyCSVSZVu+gY8qg26PeO0fz/wLx4D
	5oWsDPm5L+VO86//bsnxuJnT4hSjRViL9cjKxjlDLc5Do4kRBbjgBuRpZaB58cpf
	F/kF5qDtw0L2/RTDdOHMaJyS/stkMoLP90iPDlP/sLBQpJOFkYEunZQWMm4Su0OL
	YuU8uBAt/0d9dafb0ZuXtXKcQfS2tVqmrY+ivtJZJt/oQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t2rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c579d37eeeso383221885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607023; x=1746211823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVs8UbElJTYQ1nFLiPUapXZzeHRhnrnlXO1oTNnLdFQ=;
        b=Y61q50hlg3tcx5tIB/VAvV3xP1OHY2UfyW24ZA1OGqSaqqD0i6BNdEAzc4eCM2iYyX
         eKI0hLuyQhY+czWHY9+rWgcT5MG57Nlek9fxMfZ8q4FAFtEjZ2/L80xxpIYW7+fAZ6Yg
         yLXVukvD0b0tM3d4Vk/Ay2h0kvskTgUdkC0DLC6vS9RDVtwlAHBpsyfTCdIuXlcWMlsC
         1ITvqxLHBeZ0u7YwnZlqjnbUk6FubS9YVszUItZLrRmF7T2Bjc0HV6niMtJQ/vFrZVGw
         882bHMV77L8RiojkGqhf0eHmIzaXkEBD+PT3u6fMKssY1Fey7tfIWqKJ1C0RIR0qDx6n
         Si1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmSNl4f5hzeIzClPzjGHorzahBegCL1ZumAC7fj/Gyzv8BFbqnYgwJ5Noue2XzYktWlZG9wNcYabF5jANi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+Fq7A6esSGpCOr2qqhf4m9CmcmGDhz3hl8ZTklv7Qz2226zR
	UsjbdwVX26xKPB8kZzQf1CIvTZX0RzuknMg0zKg7REvzCGRTvryDet4CePwlokgknHI+evVvYw/
	YwfX29EwcUZ8sqwt8lGaGqJZHttTyHI+VlBHESOl4sNpne4bpjODRNSJbS5ZxQZF1
X-Gm-Gg: ASbGncuJKCAYWLemhPDZ4yL353jQrGdpmqkBhaspnL89fYz+rxEZ9f4Osg9DxyaRSry
	SMQnuMLsSDc5q/saNRpASzG6jox5U53rBkI+7tu7pBywR6NJdbNvAjBwac2n8EEJNKZgZMilENO
	nZNKxAPQa10BdCe/9Hz1F274A4RM2GBDkC1Vvdzn+TlJYxo1lZHZfyD98QoARYtCKoWoFLePrLV
	0d4JiwUqIH5JeGJnTwVKiDGOjMRqMrOUBeCq9HbMuVKDzCAaeQu/oJMkECLb28XE9iDoBixl6g2
	OisK3UBr5syMXniWT9XH/LRHwFdTNwHWKmmsdwDeJ9kmlRBgFt1TUCbi4VQLmzKdbA/SDFWVuc0
	=
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93990985a.2.1745607023591;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT03n8z7SHkwDaulevemaec2yJrdYdctRXzxhbdw9an2R0OP0F6xKCFqghpdGVE/met9dTSA==
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93987585a.2.1745607023267;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca842esm688372e87.164.2025.04.25.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:50:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for
 reg
Message-ID: <yyeijwvwva7hwehpcyvy7empyfxmzfqei7i27eow2rx73mh5n7@kzwkymdlou6p>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: tgUxkScN53nOzwK5s3hWMBOwFdfr_fB-
X-Proofpoint-ORIG-GUID: tgUxkScN53nOzwK5s3hWMBOwFdfr_fB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX5zridEBBk7uF ktmpaXOyfPPtv4d0JdVTFQeXEOTyFLFkkbkZi37w/az+vP+uVm3dWpp7pWkYwreYbDjfW0GX27+ /pLROqxwnlQvvarGeBzzs2PxZ2Cnl8VPMYLPWdU5NHOb0GRoNMO4RjAxRko8OcF++lGZtt0suMG
 CB2jMQ1Kl+xEmzeG/XXHtPfbyT4NgZeXsUIYJVcaPCy4kTRGdJPAx1TlDhNE4noHM5sp4HK/8ZH ZeyJA5zX7CIeh0+GmXh2NDdtrkaAvKLb5KXBv5kThfB/v+3/ZNedlDFGnH7i8pc7Ozc8/GB+3Ze VsAMRcCU+kYxU+TjUWGGGmFqHPB6g+1bJqvF/7RUPa2vVCcwDl2vcn4UfRn1Pm+sc3ybcPAzfnw
 7m5hu2bpHWbK8NJW4vVV1ye46jDhKeaFibsKdtu6cy3b93sRIP48CvkGfcmKJsLjt+hrXaEh
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bd97b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=526 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:48PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

