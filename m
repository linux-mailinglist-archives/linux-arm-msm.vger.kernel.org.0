Return-Path: <linux-arm-msm+bounces-68164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA523B1F2ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80ED1C24EC5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D91264F8A;
	Sat,  9 Aug 2025 07:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTgVFaG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142F13B5AE
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754725815; cv=none; b=gGq0l6GsxVBC8leW+Uy2B8OkpFjrhhrGbPx628FQCI1bPCXbtlXCDbmKGpByZ4Qtb3tTTAJ/Hu1sfw1mEuw6F0c1qElq6f78jWQn7eISL8y86iZhZqjgBmUdvde3CdrGM5+jVmtXjRxme53H6lnz1SUZD58CaRonnW+O/GAlZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754725815; c=relaxed/simple;
	bh=tuG6zqQ5L9L0iyhIjN9ZetGHu95N3Cy/2VOf7ioHYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpukpX4bYdchhGbYCT2mO0dy637mVbZB+VFz2hISKWsu7wleQg6W5M/kCaxak7GgvdVI7dQhMjhaubxbcDM9G0XOvclt8su9z9v8gUQCX4goOVdTuiN699rFuz+RPpbCxSBfChjRprEJwbNj/heYY8kNm8RocsWiZ2ojJGCi0To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTgVFaG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793VFRJ002766
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KIv+87WZnmPNL4ThTLyntiJN
	mnPRtbH0PSGM5L0qqYw=; b=nTgVFaG+K+SEp+Vfk+2TVXAI/wDQYdOOXCLlaFpC
	/YgJwFRzTroZB0bxc0qpZK0MpXPcGoG3Ul0bkSwD0ZwgIJsugo80Zlmz47OAwaqn
	m1ndpen2AP1F2BV7MCpk8CqUMfbPiuAbIemyXKoiFKrfXLTQ+wiuceWkiCBVC5rC
	0ovy9bsoFIyaYmCMz3DVPWS/HhCIXPf8Tn15jEaEqNBh8nrIVAiRREoAgA/G1moW
	9aHMTFg4p1IC2ok1LlIgv4hKs20/qXHZsIlPmN2ymfQJGqhk+AtXAMEEFmNJYm8L
	GhScut/QhvrH4FnZLAw0vIxLD4YffTmflAkx3knMAjPIHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgd01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:50:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af2237e4beso70141311cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754725804; x=1755330604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIv+87WZnmPNL4ThTLyntiJNmnPRtbH0PSGM5L0qqYw=;
        b=TGt55GpJZKUg4rOvzPkMPR5i73B8CXqoAKITDCnixWlZ+8FfZO4s/mf5KvXbG4Qbzd
         jb/U9yTOc7c1q8H/rYTYx5qXpEffqcv/Fc6IWkS4W0Z9hHke4ken//Ay4Q93u5CN95XY
         v4oMeVcozyu4/ktPVtI+I2C68sWvl8JK3GguJTUHs1bGRnjWSNXFqIzW0IcRixIzzPtP
         dFNCeQLT7ov3ccB4/dR3OW9jcnR2AA3bJDEZOiM7tE2GAjPr0nG6/E99YfhSk/AvC0FX
         pAaj9u+tZTqFGzQz0XQF7anKku1dAaDcK/uhLMMkZp1SV97eS0ynbbl1WNb9dBlULAwn
         7E1A==
X-Forwarded-Encrypted: i=1; AJvYcCWWF7zQawhmtoNOduWAXkMxbwTEZ0ikG7Q0Cr17RwgZAfjP0k2t3UDyyfKSyvorjvWjqbFABfa01p3FrlA3@vger.kernel.org
X-Gm-Message-State: AOJu0YztWpHX4zaGC5JUxOZx0/HnLJ2UvfmLDfTpXzSD+nNXwK8Qpu+5
	DEoF8sXSFuyrkBjLD++dBdOlqEiS+qNWRWKTA6XVXqbMUchiJp9LcWcpfCGNaKEJs9d5cyEvphe
	oLeioceacImTF8OIwIpI0ihHm6jAE0AMkwkenovUiclJhixBSy5KIs5SPm+lYssdyr/cB
X-Gm-Gg: ASbGncvGHX3tcN30pEKHIhBFdqkNP2vhJZffyS0h5uJC9oYqfFnb7QTemLpcF84WAJZ
	a6Hs7J5kvx4dunHCgCWvKmHPOPaq7bUiLtmnbxvZuBgFj4d6jijPEnvgNs4tCHFm6X9dvutRpN5
	lCVeB6BDDPqIMzuB7T01xpLXKKDINWVe/ajpN+uLF8tyk4b+upMbWBi0PqCqQuqGNzITJKLv1r9
	Cj0JpsxyZM+0MNGF8XAeFAcscdI+MrjPvHME3nqoHAPr+zJhRgVpItqgNJhydUX/93PbVaOvPsr
	rt3HIUMhQZkh7BTMKuOaGaltRB+L+/4k7Zf4hjPiO+8Y3O0NKVzM7Ammmiuhaff568BXhqEalPS
	3Wq4oYhy+iMn+2qBsDuACsztQKH9djqcum09snpW0EYonWK6lOSc0
X-Received: by 2002:ac8:5a51:0:b0:4af:202e:8089 with SMTP id d75a77b69052e-4b0a08148a0mr125899401cf.20.1754725803038;
        Sat, 09 Aug 2025 00:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxI+gjavNM6ggie69vmxassR2R0tQvO+7zh1RHMuETVx53XdjkoGj5x4yo5p2INqhj3jTguA==
X-Received: by 2002:ac8:5a51:0:b0:4af:202e:8089 with SMTP id d75a77b69052e-4b0a08148a0mr125898621cf.20.1754725801027;
        Sat, 09 Aug 2025 00:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca334asm3273607e87.131.2025.08.09.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:50:00 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent
 data paths
Message-ID: <7bptwqmqimkuixgo3zvwfafktx7sj6a5xzfcedip6vuudhwmqt@ey7cs7x2ucxr>
References: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-topic-7180_qmpphy_ports-v1-1-718d7c52921a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6896fdb5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=hE8mw8KEZpgZAZYcw0gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: t2WEPnqwpMvKYWjWC5Biy4wT9c-EzsSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8i/2uTdssvgt
 Lx6URLPXwjVkb8dFAVyB/vTrmkUe3jvdNjpWK7bCGiz8EB5X8ZKIDjozdcXef6n6fPw5t/ZBFWR
 MU2EROHB18UklKRXpEdQrVoLW7e5gvp6eS87M2WuuTSi1DkI4B3zOi58sdSpJ0i9JaQREu5NJ++
 zwACB+DRE51q6XbGjlm3YlZkidnNCkZgVUfqhbKF94ExZHNtLHVSTm9WWu2L12bNN096DDkNOfm
 xT8vouFkNsvNGcFCcdxlKV86Cd5iO7Q7ek5+Ij3ej4MMj22SJ/bN9E7a5Qia4qqNPxbw4hbIVMW
 49QjF0J2+xQMV0WTH0zXwUlGEoYBMUB7Qbbq0FGXmDy5D6X7vFCMAWxpxpvk/Hr+TZTiFYqcaao
 uymfnNj+
X-Proofpoint-GUID: t2WEPnqwpMvKYWjWC5Biy4wT9c-EzsSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Fri, Aug 08, 2025 at 11:20:45AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Define ports {} for the DWC controller & the QMPPHY and connect them
> together for the SS lanes.
> 
> Leave the DP endpoint unconnected for now, as both Aspire 1 and the
> Chromebooks (unmerged, see [1]) seem to have a non-trivial topology.

If I remember correctly, on SC7180 the DP is still routed through USB+DP
combo PHY rather than having a separate output. I'd let Nikita to
comment though.

For the patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Take the creative liberty to add a newline before its ports' subnodes
> though.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20240210070934.2549994-23-swboyd@chromium.org/
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/175462129176.394940.16810637795278334342.robh@kernel.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 48 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

-- 
With best wishes
Dmitry

