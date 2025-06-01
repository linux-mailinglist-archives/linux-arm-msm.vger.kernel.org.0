Return-Path: <linux-arm-msm+bounces-59969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F3AC9E0B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 09:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C731894F77
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 07:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D2F19F111;
	Sun,  1 Jun 2025 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZSRj9UD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739A219DF66
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763803; cv=none; b=dzZw8edT8isFIqQ192slfVq1kWV5x7DaRxoIjxmjN5kMcoJXIb1Fr7iRIV3uY39SNfeTWpaueaDqZP9TZIvcOvzUpu1xKwk8hkubYAPcoJ7Zq0CS/6NC3lRYJTHxSM7rLxUopwOq1pURfdn4M7fcW0C6IfdzA6BTv41A3J6d28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763803; c=relaxed/simple;
	bh=mQxRcLWFsI0msDgbtMHDKTZbj0McOnFsJJhj0vNZtVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttV57L4phA6dGdwv4dkGccu0NWLuz4HOmSY2zKExI0dIlkSBaFzVqUPZ/xDzctwX1wogiGVXlG1HIHGVFfY35n0JtbTzky2TMdfvgWSyR2u0KndwR60acRLg6XbvjI0GH3NocL4ziJNumrl/xnl+CgOFFDsSiH9cPUQ5c+td2T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZSRj9UD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515j2vM001025
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Jun 2025 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcI7oHOMxiNKOugRygvTxu0Z
	3ZaYdDHVHJGQHCgJsCw=; b=hZSRj9UDC00Rs4QKHpAOvgD32g9FXWVnzpC1TXzZ
	usegtq9RiibsytOUtB8SMsgu5cbu+Xx8rsUopkLOnKXcogKEgyYLbkaCL9NOiWbl
	h88Ea89R3aexH0ZQSP75dSgKHe5UFRT/Mm4+LUaL7efkGJNU7l2CxOIdKudDy8/G
	zIW9/2yaqH6VRuu4eQCEkQB/c7FuwZpeGIubEqXrM8w5j2ZMwRxGSWwG+I5Dkg6I
	nNnlr8DCiDaHwOdQH3SKZTf5vYSdruv4oRrHKWH71HA9GbfMLuWY8Mkj3EJBzxVV
	z2+HGH1qpwQX78TOo6RU6pQJ10QVZX741UNXKvN08GOdvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkwa29j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 07:43:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so543154885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 00:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763800; x=1749368600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcI7oHOMxiNKOugRygvTxu0Z3ZaYdDHVHJGQHCgJsCw=;
        b=Wd8ayXg1y8dGHx9fJ/0liGaT1/3Mc/yyP4r/6n9dxYkblhZ3ZNhUwnbzG5YCdiw56U
         lSH5w6nRdbRGGa12ax9T4AGFL8+h1/1feV0fV9hJXIGjqOFGtvdSqu6ltQn74/ScHhz9
         nnMt+lnRLf7+BocA0RM6U5bK8l+bPyokjv3uyYmp7WM55ZD3QB3nbD7ypApIWsZbckt0
         dbFNzyjfAh+poHAnOXO+Q17j3jy9o7LAvthLJTh7fq1V41djQjKKKHCXLOTNwQ6TP510
         nWXXvEujAGCfYo/DoiLAy+n80n7PuVlHBORJHxAkYlG4xLWtoBWdcyGENGIZQypV8Sot
         DWaA==
X-Forwarded-Encrypted: i=1; AJvYcCWCbPeQ8Q8C/hwbNTk2rGHFoRi/S+SWIWdWIO0JzHRFC1FFhqizm/l3jXucvcMZwMx0NxF56GL5xOPPVvIy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69vUV2Ab6gH1gt0X3DrD9DrmBWQmOuc3HaIvoRpyQ/ldntN2W
	6gPx9XwFb+EKpxAsgkaelzjDuUhkR8IcZRjGfFBRoEVYvEoonKLMKXk98orZABBoJU243XOdmoh
	q+HMimSNbSls1mW5jQSpQkSCdMuGOgS7FeDD7ZNqG/1zzkE0ecbeoUO15myVcJmXUTvqP
X-Gm-Gg: ASbGncthnhzlhHzOY6+XfrC+7TJOGLaTGG8NZyVOR2d7PF8M9n9DWrHXF9Nv/Ozk2W2
	F8quvBWtRSnM6KFLWJrECusxKMlH4bBoOxlKkpWKbYiPx5o21hk7N4ryAdszoVLTFuchTcPTdq8
	GCUU5Rt6LP4QXTyps4tvXYmRb/VbnaT0njilnhAZKaZno4snhhUaVKL9fQ8BbyI+4o6QuFhxN38
	aF7Tad1SWQMZWkgp/18q3hGK03CjuhkRQcjdIk0eJ5AEcEl68MVgO9c9Y6ogPDEqkmvOA3n4hh7
	H52hvuEsrAKzuLE96bkyMxVD6WYdTQvALxf0uF7CdnEkHpHPOanfuySImaWfXskVTg/2PydcR1E
	=
X-Received: by 2002:a05:620a:2444:b0:7d0:9c9a:e627 with SMTP id af79cd13be357-7d0a1fa317emr1251713585a.14.1748763800319;
        Sun, 01 Jun 2025 00:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYIM22xzEbjvo1mRrhKzL7+WUAL8hLkRRUmKaSO0zlkJGvV5i70ghveevJFktn7zC7JAmJA==
X-Received: by 2002:a05:620a:2444:b0:7d0:9c9a:e627 with SMTP id af79cd13be357-7d0a1fa317emr1251711885a.14.1748763799982;
        Sun, 01 Jun 2025 00:43:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791ce7dsm1211805e87.181.2025.06.01.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:43:19 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:43:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8916: Add Venus OPP table
Message-ID: <ijmplzz3eqaloartncj73vyhchkgtjmysqghc56yemsqdjlnob@54xybknmunuy>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-1-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-1-54c6c417839f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683c0499 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vRhd2Jqrq_vIC-t0m_S3fA-tdvFK8W8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX0WwUEPRjkFmz
 /woB8Yk8lzMYPL8h7sEJqd5NlpHMS/jAn9VSvpbiymtRONvs5XL8UIajPp1zrtTap0NpFbcytvT
 111gort1fLiYCnjhohuC4V99pzrbHF4hA6QYhSMaN8Cj1zWTKEqpkXwNq3HQB/TX8VgTm+SAaKN
 uEKyTNzWZ2n6F8dhGUQGR6S4LSZICEKWXpStdTSq54hyyz+wLl2JpJ/tf1h+l1PLIAhS/rUXm8g
 aeLWWv/+JxjwkdBIzGX7XjraJzij5Xv+bMPZ2/4fI0ktmOnlfntuuNoOufxCebximX8vQlA8u69
 iYpLAtk92GRzAs0fTLy07ZEQpRmfewGU3Ibkhh4ds0v5061SOnDklH+omWTU9yPQvuRuL0naVyB
 87ZRi3dJlJpabsDiXlX7YCqXqhOfKbSyMTnw/o0Iyxe8JYvVs7YmaG7n0J9nhlrDEnFLzAha
X-Proofpoint-ORIG-GUID: vRhd2Jqrq_vIC-t0m_S3fA-tdvFK8W8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=811 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:19PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

