Return-Path: <linux-arm-msm+bounces-59180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C22AC1EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660381BC02E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9A418FDBE;
	Fri, 23 May 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZY4mB1KC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CF62E403
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989249; cv=none; b=d5F9TWuA2yEl80t5ElP8gQSuk2exnolSdazcWKIezpNJtAMSRoZoWISoQsKBnmsQJr4ml+vSR5CPmFxbduGm8APIrVQG26bCuAbPRWdrUsKy3j6TNc0IRsOkOwNRbHIxm0Rnf5BP+ff/hZgjlt46pxy1jpfVxQdFxg2OEHMXMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989249; c=relaxed/simple;
	bh=qrZgN2t3hFaQUBD/KDeC1VkY9t0XErbjd5eB8HFqE4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHExM4TAfzkm4wKM5j9m4z74OzK5fLHPDWWjEawKGT+cF2PBeziDp7ERRL7kjv3m2TUraSajP/UTFnLhqPEYZ3ylkeuNIjfttdLS4/3rtYSN1Nzaof5O4iDTM8zkyrW2MIlik5nw0ZWodB6Wm3p5zwst/wU4X2oOa3QYyC4rD0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZY4mB1KC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N4Nv3L000716
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=98TnTQGT3YQ6JZb18ur1Uyf7
	Hl6Rm+Rw5D0BB53ZaUU=; b=ZY4mB1KCZUGf9WlbpX6ebiSjIqy/K7zZuZzm8RHO
	Hxpor98Jc62QPVchy1hG70joVeZhoU+GUQLYKjmXDUbJhAX8zWfNYkTBAudDX0uN
	IYoyDb5ivIuOtlVWcoO5huf4AAZVmjnqC3c4JKcnFG+mHCf0Z+EnDIf4zoK2zBU3
	nyqhgt6lziqO0CpcNUEYTuWYE7EmjXcqW1YjRJUTsxznEbpI43hKUQFVvPPGkCyH
	Po93tXXBvFiilr8oqyH94Bp9tTaOmyDQnexgZtMa45rrUvOkwxda/PtalvrvDcml
	K7kJtTCavg/tNod7NWMg/u+xN16paz6kmGXUk49AhNwEwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tqp2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:34:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so1608174185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 01:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989246; x=1748594046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98TnTQGT3YQ6JZb18ur1Uyf7Hl6Rm+Rw5D0BB53ZaUU=;
        b=Jkl9lcoM0FErr0MtqIKgER3QI+6C3JK7LiEkcQdl1bhjULndceaR2khqRXujNysbp5
         q28gSEt+cvIV0F1F8Jz1KtcJ7U/TlUK57z7Ix8xFaNkiPw5vr4nyPts0Qy96lR+lRIlX
         5IyY8kkLIA2KB3ffgUPVunIeMxtaH/l2JAkGEVvTmtZHFjXWs8oRL6XcYImxbwFrOpID
         cdSo7vITHkVPssT3CLviJ389gsnjbfe6Kxv28pOc3pilvupHwxpm6Yg8uTsdW61T/y26
         akJYoFa/s0bDBFQQar/FgusGA0rqOARoPvUz4dgotGifw7AFNC/7zDxBBUo4kD/mua7L
         xoSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmoFAOkMdaSPkqotkpC8MMlhmL+Gu2+IZXhcN+eo+Gi0gZren8W628k51sJofFu8eQuykzFUz0WOz/l+f1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44vkJs27b21ixGpFl+wKbamyJ6L8zOT3arjYw9H/A52yCfeGz
	9FkgMj4CKyTTmJubRJ3WMW0Ci4vRkh6VGCy1Uo2iAHgFvsm8eFxXn5teg/tGEPlPbm2YWilUbkw
	i7X3/NuNlOIjDw1HDU+5Kwlx4Dt3LqhyOc0PmHXtb+LoCNk2te0Iuho4MDPlguBb8HMDm
X-Gm-Gg: ASbGnctZzNQ+rbNxv1mI6f4+t748v0MUJJYO8ehP6gIKjlquKo/sn8qOWTZKzt3nceM
	UArgvDPX/UD62t+w5LRPUqg2aorTYBOe5VbveCSm4wY7a8FA3VY6o2mIK9eM4xCLNiWYSg1ri1M
	p+z2rFAjp2zFIt7zeOiuchvPYvX1EU3mW2QP+1wHDm0HqayDlF8iRVJu5oJvaMz5R67hTmZQ8Fk
	PcJ2zmMzqngBnN7s86M8stOWiq7kYADeoi12g4LKtStRKuW3sSqiHjIcLzdly/QZM7N6gwW/52A
	p/NTJOo+XfrP98ZwDDINGM5kYcn6FUybUq3Fa2nkBxGMMG6Q2eE89uDIornAyyc+3rq+mik20vw
	=
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3375464585a.0.1747989246167;
        Fri, 23 May 2025 01:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGkJDi12WZRBVitXUDlGpAUqxYMF3TznuI38s1jPuj8NZShfppobBgqghwXbxCkkMYxXT4Ig==
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3375462885a.0.1747989245824;
        Fri, 23 May 2025 01:34:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5520da5716fsm815731e87.19.2025.05.23.01.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:34:04 -0700 (PDT)
Date: Fri, 23 May 2025 11:34:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <usk7l2y3o7vutmokh3dlc3fwtmxy3oxljaskymzd6rokt5bsyy@3ftinq5xwet4>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=683032ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: NCanD2OB9A6lujYAdHoXM0fNg4SgtSdw
X-Proofpoint-GUID: NCanD2OB9A6lujYAdHoXM0fNg4SgtSdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX31SLw1MN3nAC
 QCLMaAtLbRRVv0jEpSIg53NqMTLr7zbmBHoQuEuFL9mDxYL5R5larzIw/Zi/iAWs7QU5F/QHVkt
 SXo+LAlG7yBSViYBhtMECUg1Z69g1Nd548wl5xPrG42S6HLv4RPhI2fhyFi2daozzf4Mv5W78Ad
 0niSDMawNZmaaW5AHx12NKodydIiAPjKzNesrUwLz++WqXA92pPGZ8MF/E5a2ZTh7mnRKWq3jkW
 BTEBkoFSbY9m7kKInd7Gaunn0VexdPRiX4rEOdDLQFodz6+FxQU9qsUup+7O/0a/B/Yqal+Ftuf
 lFao5DIB7pQdSL0gV5E0+IMfgPpFrQ6OXq+fGQpP0P1ljEM8E3c0yoPcuW0izfSeXzih/nzLzx7
 Tb6ffAPK5VNRJP48w0W6TMGqP4rtZlcFRuHEj2w+6xX7Kjp1gXGn5EAcTElmq2c587Afzkrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=837 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230077

On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> The members of QMI header have to be swapped on big endian platforms. Use
> __le16 types instead of u16 ones.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
>  drivers/soc/qcom/qmi_interface.c | 6 +++---
>  include/linux/soc/qcom/qmi.h     | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")
Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

