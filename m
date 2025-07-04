Return-Path: <linux-arm-msm+bounces-63767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B705EAF9998
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 196584A81F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D81F5821;
	Fri,  4 Jul 2025 17:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7ukLfzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B211922ED
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649692; cv=none; b=M3g18A0yjEdqxlbNErXbB/jvIdLtnoaCm7zn5UK6Gf9KSxbbvf99S6MEMwnWBzgr1BnlEeS6kyrCxnzCjRcgK+gxDKv6DWdSoZfgyTjpikPgctZVi0DNI/6BpUq8kb/icf7e6Yeqv9vKDLrnP5GLmFe5yweTTedjMs3F3N7D2nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649692; c=relaxed/simple;
	bh=Q0uBPIsCwgQkS2rC47v+2moqu0wd8x5l/Azb8wYoj4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv+GjnKcC5Mdyv9TOnx2jGlkp/AV/O+5SfwVeZlyPgkw6t69vx3yZbm3qZp2v78/NUUfYG0tzAq0ZBjsr8kjiyz343dJ2wNsyWy1Pnxg03O39pMae+Cg/5Y8lIz6cPq7eeh8eyPK/5my/+Lzwvkbvm4Uv7oYwU482RwrCgnvZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7ukLfzE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B6RCg020401
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 17:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DYd1Y/aOqrQmhXBusd+shb/Z
	pX/EE96WqbgSK3mRMUQ=; b=H7ukLfzEoG0pXiV5Q1DEnsuRB4aJ+wt8FqnWDcJu
	huGLhlMNlWi8HWvbovEsWZDplRGs/MCp1gGcy+Ev5wqKwzQXtnmT5AKjGY7v42k/
	HT9T/udHQWYW649HtPaSKRKaaURhlaUUO3GfOMZQ4qEuwcurYPHM4z3Ts1+re746
	43mvxnXr4doxv/0z+m3JArYiBu6bt9a29SWWm3LICfAfEnJpiENt5fjMYCVi92G1
	M5T2KwKeBcY2tVRkgtFcUaBJGd61nYebtr9W/zHHHR9lSRnApOZuB8mtR7uh/5KE
	ATk0rq8KqkgzoNP9KsAqldhjwsPnB5MlskJkMD/f7dUIrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8vqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 17:21:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so170866885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 10:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649682; x=1752254482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYd1Y/aOqrQmhXBusd+shb/ZpX/EE96WqbgSK3mRMUQ=;
        b=VApIvqo3Xw0LHN9lvuhAiFJxIkYb035eVtF9Vol8zujNBrmCZNsfNNfjVknlMi5Qim
         eGkXr+tpQUepJZifA5uHVJqLNUUGOp575mkyBGE0cZ80UG85f1dR40pisLnWNfnr1pNN
         E/A/PxkgqatlHwVZQpaZpB76EXEJxyyvYBleroyIzjg8V8SuHOViWPQNPKVy1b/WkB4A
         wmSgSloRVjNd02TaWlLRe+2IPcRggLrr3ru90GQ7GAHkkf/W7fYptb7Rbj5MLIhGHQPg
         koR8awrH1/kg8ceHDNuH03dgnUYNUyXGXJK0LDZzEF20OKNFKECWpytszy5dPWdQ4cry
         tTQg==
X-Forwarded-Encrypted: i=1; AJvYcCWampZt4QcHnrbMHGNc/jfghZm3lu14D7bTzQBefbUyiGNi1l+6thWiK+7b/PzOO2m68NSTRfNtNy0XRgca@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWWoQxY+0cMJ5GwKVwf8tkCX2TGMRhTSIhX6nffSREY77cRUq
	Mh+xh1qtmKBbT0qO6MimG+TysergHKzC3eW5JHgtPrZrQQvYLflF1oQUTLnGkA6diIHg3MyTh+Q
	TqDesf8ke+stbuAv9Rgl7y30enqCPfCHH0EdC4LLXHKWCB0kQ+zTYcgw8o+HLB5OEJKI6
X-Gm-Gg: ASbGncsWa/XM+ef4bzNysjs2JODvGhTLoqTlJoUU4l/EHKmM0glBQttA382je35YlrT
	sjx+IkYODPX7vzGkhcXHmubbSew+qpI8/NI9Cr2y6RnB8I0BBuUZJ9ro0jMtxeQBNzbf+mFOlXW
	m2SkAKrOf9y/EJkbHm+lxCb13q0z5bVOtbYEzxfmZ+57KPnAJE52rhxFqdw+x2yyBKvzFK5pDyv
	ojOo9orHn3INd8uRWyL70iFuQQWI1OxYQ3bL9R0gkNfdxjQzzMb3spOX248/LUgmT7x645XWWIr
	+ZSGc4nmY5jaawKDo6GZmywfQLz5OlumAThm4yLOprFD22PHcXjiLBLU/lc/G6YQThHLDi6ohOS
	8JqW7N7HnucyIsG82k4KgGXdobRnRBa2PcFU=
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340762485a.58.1751649682243;
        Fri, 04 Jul 2025 10:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpSHb1K1F6j7rtF41U6JYdzqqPCY5hlVllAFAv6HMtb8MQE1920mSMFj6b/sYXv0mfka0yuw==
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340757685a.58.1751649681648;
        Fri, 04 Jul 2025 10:21:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384952e9sm301641e87.103.2025.07.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:21:20 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <s5fknuvs6w2bgyr65y7ajiyfk2ph5un6vofcxpcz4js6wcybbl@ab5vz4frdigi>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
 <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzMSBTYWx0ZWRfX0dhIVKl/8ZC9
 xmRvUmtwQlTDKPfuLWbrd7cPrqQu52pq60TaX33gJfh54gTix8OIuLAGqcsxRQxYv+D0uimu3YX
 KQ3h8xn75xGnhkP9RB4wNqQeC9qN5ERFRLK+W0NMAnWIMxvBai3f4i2m8tJMe+jUFHi9n3pH9mQ
 sUh+wpGp2N2S8Wj0zL0GFtX166v+GlB2DU+2GiJH5gdy8lnu9SoOIGQFrLPdcmXYcrTyHp1o0aS
 YSFT+StIWILZtZJYKRyHS6vIZY5pDufJOO894YbNPEo0yMRZ3B2J593TeQDgpnGLTb9r4ZeTxN6
 ABk8apq5+9GI9KohwUn6/bsDzgc6cj2FqRlnsDyPN/w08sLZ5DvJ3PJk9QQZEql7QwcRDWU2hdY
 5O7p9wFCU7Uk13JutgO2wBDTYFRTUDrX9huTX4p0/SefL7OhytyckRV6mO9Bjtcm0j72I7bC
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=68680d93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0A9y-nFg0dDz6qeF-BMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fhZmaopWZ7e2OYITBoz-nBrCnxEHEszf
X-Proofpoint-GUID: fhZmaopWZ7e2OYITBoz-nBrCnxEHEszf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040131

On Wed, Jul 02, 2025 at 02:34:21PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 192 +++++++++++++++++++++++++++++++++++----
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 175 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

