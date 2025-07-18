Return-Path: <linux-arm-msm+bounces-65717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB721B0AC3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 00:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 535721C2324E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 22:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8FD2248B8;
	Fri, 18 Jul 2025 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzEXe7ov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5522422B
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752878721; cv=none; b=T9lhIe82BzyxYKtXOVmiCKzhf8pgYs0JRlW/EQIDBG6KBj9Uz0CtL7Y6Vv4CzHjHbjVOx7AgKCaXGWfqrPLr6lCQIdfGRWyMxnQsxMkkjXCE6ipNzwNzZ6mNeFq8y7+OxKkiRktiF2DgFOEc/x5FkOO2H6pFJAyhYGuIWkBR3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752878721; c=relaxed/simple;
	bh=NNwCzXoPYMOTPaXJKHL13c21dOfYSIJZIh7sHCpA1i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFoa1sMX4Y1ezjG3FWVpuhpMXIm3q3ST1F0ZzyLfNES/UVz3AqChgzn+vodANrQKNhNu5Fx3lFw5oQOqtCBQuxGykFRwLlT5lJMuymfuMDvmESwkMJ30GW1PQkiqeOPC1OayKGtsB48NQmUUfvzZBvQI/tz44MirDnOT5oGkOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzEXe7ov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGdiFf008525
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8+eKAj/ZD/UM8+YkkMpBzxn
	aUkFdQMdJ+OYNUtinIM=; b=bzEXe7ovXUKg38w86JRFjXP5NLmLXCb4PC6cMEJn
	I6UPqQ88m3n7p1/A1hLs2ukBkq7/sLq4Jd10UX81Gj47IbLJVf7juVZcsMp8D3TG
	F5phU0XdYjBGMT+d/EPYYfLkbb1Cu2Ou7gcAQLwuG+FjQZ5wBHI8+6hm+Wv6EAe7
	+9WM9qT3sBEgwfj7cRmaE0E+FKabrR9ltp52DCuPl+JAYTCrHHpIHkSMecXbKFT+
	Xrz6gxpPjreK1Zx1zwm9pBurtZvoQlyoJdP5A6zEGGQpL1GeNzVqgYHqPAbtLYcD
	M5xYUDpxDx2iQmPf1rjO3yUAu+7xwD/PWc59MUaMS2RxuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbd537-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:45:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2e237fb4eso444382885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878702; x=1753483502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8+eKAj/ZD/UM8+YkkMpBzxnaUkFdQMdJ+OYNUtinIM=;
        b=ndtslYTTrMX06StBIPM4pXn1h4LAaSD4ZSNyKXBAUwgbSaUhXxGzrbPvdOoTe3Fnqf
         d7Ip16du/TO+qq/4ehSKDGVAGpGS1JLFwT+Y8fyeG6ip2GtRpvKZAuFZHgS45O86bbnr
         LD89WcXzUZZnt5a02asF/vI5SbjAcT+LqhEIhjmV49+6KfLeqVW7TUXCWEO0LjKpVtfB
         LWmWvb9paDJlrrB8DNUqGVP6SOWb1L3j4fyXe8pcQTlPj1i9DCC/TAQeViJGs4fGBSQw
         Yc7n1Yut4qta979u/3ZHCv3r/Ul2CmFexn+bFOPANc4M5/N3l2eUnTD0Ank7NuLzrG5L
         bsbw==
X-Forwarded-Encrypted: i=1; AJvYcCX7mxzU5Cle5U8RphJ6BvOUquTcmiD1oYc/cgR5qzMinGp352iUDTuXclJP35YSYZz1lpqQ2/APG7G10web@vger.kernel.org
X-Gm-Message-State: AOJu0YwGupKOmedZ64zzioa9X4S1ELVVePnGsbM4AXJ8o9Hp2WltJ2zB
	r03vN4QuqxIpFgMrrur+aLTiCXbYtTGJZVWXILWcpqDZ07Yo3EGN5bAjxMXhFhRoT8oF7jcD5oW
	H+EVYLM0TzyWeeEuyD7hD5PAWDgmw1dE/ADhXwmSH1P1kMk9qXG+J3cepZhKvHifpkel4pg2vYI
	l5
X-Gm-Gg: ASbGnctIl5cPF7a5sdWodvUOFGLGPe0KSLa/f5kTaZFRcRaDGEJNV7PK0CIUSn7s/lu
	1OQMn0SvBZ4BfkurwO+cV9Ha53A1CXfCphNCto/mrf4vwTk6cPtjvn0skvczpPx9zBft2xh2Lw3
	6gzigiADMc2Lx+v6A+ArYKgCP0JMIzjIsf4GP7d5YsXvEtb2oAO8R5ZgKEZlXFJ85rHpkq1S5e8
	Jx/XsUepxpcm0l5PMAgZ9R26TnnZdRU8rZ1jvroLfwb1VHpa4B41ZY8guC1W95HvIFV1dDesMBr
	mWJpwJkAM4HQO33LVSXKFgjMaQHkgJY9uP/H1ayfMN84xP5M/ZxMncFxdMzWHBlIO0awcibFhkT
	S0DUb01P8jUYnq9ouwND3OIXelDOx2gc/7rnoUnat05komMr+2OLn
X-Received: by 2002:a05:620a:1127:b0:7e3:487b:2a74 with SMTP id af79cd13be357-7e34d9d1edemr985985385a.42.1752878701871;
        Fri, 18 Jul 2025 15:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWAAK0ht/7a4kdVpCySbSDtfrai4FYse/ThX0w2qF3gXv3M878f+tua5mo1f2EiYqVCiVm/w==
X-Received: by 2002:a05:620a:1127:b0:7e3:487b:2a74 with SMTP id af79cd13be357-7e34d9d1edemr985982485a.42.1752878701438;
        Fri, 18 Jul 2025 15:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a911b775sm3371171fa.45.2025.07.18.15.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 15:45:00 -0700 (PDT)
Date: Sat, 19 Jul 2025 01:44:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/28] interconnect: qcom: rpmh: make nodes a
 NULL_terminated array
Message-ID: <wi65rrkxd7f6n6nxse3p2bszv3lcko2qtflpbffngupqslcd3s@jvwec7rriqgo>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-3-875fac996ef5@oss.qualcomm.com>
 <859be3e3-be14-411d-b5ef-07bdad91a878@kernel.org>
 <efvyk4ojddr3emsdavex4uqrl476sj5hz3ihd6kditdxd373jm@wu2av4fvqc4h>
 <a2b837f8-eb34-4283-8d7c-17031a7a682b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2b837f8-eb34-4283-8d7c-17031a7a682b@oss.qualcomm.com>
X-Proofpoint-GUID: 3FB52VwNYc3tapQ6fl_ElUOcmzbBtOQI
X-Proofpoint-ORIG-GUID: 3FB52VwNYc3tapQ6fl_ElUOcmzbBtOQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4NyBTYWx0ZWRfX5KCNUj5FYD6a
 9pd594sPAGMhLIfosYcGdwTJ7ugyLLDoTYg5JPvAmf1RD1JJYSjJuMfIi/GczKRosdjzrGZigmM
 bfn8wkr3jZHP42xV5t3WijJQTkhg8Ay9TIVZUtCQtH1fltF1N1u/BStOe69cfHWIg7hzzmFTKl+
 m1vvuMfYhVjWW2XnG9pHP4xvry/OsbAyp4fGjwp9MtspwJ7+qIPrvgS9fCnn1KG/Skks0w35F2t
 IsTImzkSz0pMO4nEYpRdXMHK4WSt2l3WPLuFmwwTq1omRELxpevb2yIjI4fbGZgW0qZ3sJhjSuH
 /h3NXocsd2nWdBVSIZtc36O0zNjRHvIbO7soCLxlZEBCWJtaWlghn39EQXcmm2k3rwH5P9uhFHl
 eyJaYqgAER7avH1T1k+ilFBDPrzVpCDBiVM7dSQwhesbegdcHpA9T46pJWd6kj+vF7jfHXPb
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687ace7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=votViI9Epv9A33Tv9KUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=558
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180187

On Sat, Jul 19, 2025 at 12:17:47AM +0200, Konrad Dybcio wrote:
> On 7/18/25 7:26 PM, Dmitry Baryshkov wrote:
> > On Fri, Jul 18, 2025 at 04:38:02PM +0300, Georgi Djakov wrote:
> >> Hi Dmitry,
> >>
> >> On 7/4/25 7:35 PM, Dmitry Baryshkov wrote:
> >>> Having the .num_nodes as a separate struct field can provoke errors as
> >>> it is easy to omit it or to put an incorrect value into that field. Turn
> >>> .nodes into a NULL-terminated array, removing a need for a separate
> >>> .num_nodes field.
> >>
> >> I am not entirely convinced that an error in the termination is more
> >> unlikely than an error in the num_nodes. Aren't we trading one kind of
> >> error for another? Also if we omit the num_nodes i expect that just the
> >> QoS of a specific path will fail, but if we miss the NULL - worse things
> >> might happen.
> > 
> > Exactly, that's the point. It is easy to miss num_nodes, while omitting
> > NULL will crash the driver. So the error will be noted during
> > development.
> 
> I really don't wanna step on your development, but again, I don't think

No worries :-)

> this is a good solution.. maybe WARN_ON(!desc->num_nodes) would be better?
> Some static checks?

Another option would be to follow RPM path: move links into external
array and use ARRAY_SIZE. It's still error prone, but it is easier to
spot.

But really... For the array of pointers NULL trailer is the most logical
way of specifying the end of it.

> 
> Konrad

-- 
With best wishes
Dmitry

