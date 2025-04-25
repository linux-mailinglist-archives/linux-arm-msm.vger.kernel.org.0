Return-Path: <linux-arm-msm+bounces-55719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D19A9D0C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2F1E9C080B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F34721A45D;
	Fri, 25 Apr 2025 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIUkiHkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CB219EB6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606990; cv=none; b=gn3HdO0+cTh/vLP8+oqSE5TzHJt452K9YpU8g1btMqS+LhHmfc5qiLrsvf9by2S1vW58owkPUq4IAp4Clo3Q42GAV68Hf2sp09tjN0Hdhds12xOX62fQeF3p1Jp3TtLZhiYkPXArhqmYTIkPa+4sJQyGv+zwVUeij/FIHxAM/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606990; c=relaxed/simple;
	bh=XpCu0lpFGvPHVRozeGP/n2M1RiPHhHTv8U24FaACpr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHjRrS1devzTrfLXO165ab/wtFq5Vz5Ikjw/01Dz96AGU7DLVyNMiLe0l5tBUJir0W0lZ+W2kobAzVaJ2LxqxpwXRQttcxbKuwTUhr0ZPe6A2DJVA6d59KV9RCTYOFWiS9UXpUrgjR5rP0JJQTFby1HKGXAPIFu3GcQ3inXt7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIUkiHkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJutf000402
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4h/tNh2cj21rvwdHEvX/GLqs
	huQYHrsaHCKgAfdUS+A=; b=cIUkiHkqsNI6WlniISpkNElrAlXvOAMuxzC2ZQHK
	pTcwElswdey/y9ABfVcg9mBIyuVJ68vAQx1SW2z7/a6xhJaLWnkhC1M79dVxjyEl
	UtNWLfBbHxDPv6qm3fwKfIal1w5EcHP69eEHxEihm7INVzMCJVf24+4QfFdBiFJt
	1dXmGd3EGB/v2nkw+AS+cwKDp4fm4X0reTBKQKiKHC+XfY6ZZs8/486ery2VzdVS
	omGC0fCh4QELkzMASdXVc77OUckgDV+IqMX6t7NvvcQYcW0a9lYaosYNxYosZy8T
	lr9vQvgiLimY8d+mmlVyjOOUMbdcKgI8I9ZRZWzsK77GYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hyu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c92425a8b1so428930285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606987; x=1746211787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h/tNh2cj21rvwdHEvX/GLqshuQYHrsaHCKgAfdUS+A=;
        b=PvMej3K54P69i16yAIjyhaIcL6ohNyJguk1ReE5aIbRn8C74MOXf1P/0istdDAO6uG
         hOBFYi0nMTtrIib1JLc/v64AS17bDL+YdDPE7NXBZazLBOp6mVEZ18t8m2puOz8t9uy8
         HYHEMq6jLdC84iIQR62UbgVYmKbW0wXd8yz1PcSFwTqsrBxotZnftxNyjzGQM+/cPeCc
         JNDZ7qTdRXfr3ZWG5vZtF88yvaMByoKOhUS4h1+mPoiPanHV7R/YcLnr4kkqV90SoRdN
         n0I6q+EGA9O/9NmARonRkd1k7uP7W0+JPFRWQfMK+mt2it/7nuPBEwmNVRmml2MjCMuT
         X1YA==
X-Forwarded-Encrypted: i=1; AJvYcCUTbPgX/xRGkMwbRuMD8aoSCcfmyxom9xI5pcyEYYhFq1w8IIJsgW2ZIwyc+lwBqcoTlXOTl2dzprBdo8qn@vger.kernel.org
X-Gm-Message-State: AOJu0YzuDGsq7Kk4nk+mqsu/pdOXEkmM3+RvShlvusbLmv0hT2x4YA9V
	Uah37RgZf8wy/vQJ4FUG0qEQRd5vQzu8r21PuI3pZqffrjmwpjsjCdB6iEo22leu61Mioy8Ip1A
	HOLX825+2r3Bhij620bM2IsCoBYzbhVhiAgYrutXWP0DQMVoYkyVxlyBCFqpt6xIi
X-Gm-Gg: ASbGnctwcuHzjDsIHe8TteLTwyMXUJ1cR7XZ0Qavc75amPZW4jx/6XcZzAYNQYmu2ga
	n9RdL2dB2HE/EM+4dpVoWaBboBTbocDu/ZkPOX1TUfq1PUIlPYVXbB/x+0CgvnNRMFMoAyK94rx
	F8PaEQZI3haCHK0H1+t9KxHp5orj++5KL1HJtEMy/Ap5iu6o2K+uMFblT7d47TLHCdDatT5f21F
	/1B9rRAZ/eRwtwbb59vJP/02kEcjzin4jlTjKpqzr0x5UhOiQVZSeQJ/O0z5EdahfKGy0WkhCuF
	MTkqZum6v51EhvsQguIl/DJFfBqbnIbMFmaZg0e8SIsS+ZG1tefCbBt9CyscL6ZmYD7fLcz7dtI
	=
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114348485a.0.1745606987099;
        Fri, 25 Apr 2025 11:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb84jAC5pDcE39t+A3nMNSNGoV/RYhRqVe7xaNluLMJTysZD8eF9gUUcxUs80J3xjAUHfURQ==
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114346085a.0.1745606986740;
        Fri, 25 Apr 2025 11:49:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d00195f8sm8436461fa.56.2025.04.25.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:44 +0300
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
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Message-ID: <wawy7z4jrvu4t7obcrs4piyscpusaawgj33lqnhu3dth7zp5ue@uz2btydfyi43>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: G2zOm5qb_hGD5mKSBzKotZJSs9yeB3Z-
X-Proofpoint-GUID: G2zOm5qb_hGD5mKSBzKotZJSs9yeB3Z-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX18LfPx6ZG86H i1Zx1pkiwnCCo6INcW8wT8S+8uXZnaqwSBBCmZwlVIW8jdJ94aCeSVzBRFk2mM6NgCukt9TkeB5 HHOHCQir/oynhcMsMbgvGb8EAJRc/AonmuQ+D9oktdRzKrcUb6eREWV+rKC9iSCdiMpCVslqNEU
 w+QCeX6E71KFR6vHij7eXJ5j6dgagwthf2A1er0fc2DUUPyjvQnhqxcF84WIjYXe6R3SIbUsbZl LdKMkqum9F90b8InF91WoS73IAAATNgCaD0n0i6p3mblC3Jlv7uX/GB4ZyVMtvhPT4Cogjcp2OC x+A88XLkEixHGqKgve2UUtD0FXMXoyACPwjjNwPE1ViOdL6tCcEOpmAEdfl+TIGP0zED/pFbja4
 kOlhd/9uOXa1s2XrErggASN6aqsWXoLnnUCr1u6hEdYbEa2RoZHJsThvwYcELOkcKnJAHLto
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bd94c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=644 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:45PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

