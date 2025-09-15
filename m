Return-Path: <linux-arm-msm+bounces-73612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA7B58289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 18:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1781A21241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919FA27FD68;
	Mon, 15 Sep 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhGW/2bn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661B27A903
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954935; cv=none; b=GqcO80bwSwfXjfYfs0ZUx4To+m21E6Jj2t5ZWGepXamMSN+W56lx2b6vfvlSWHf3r5j/ljMCG5613aObk2a5/4wfSjeV+4SD2ZbQZnQHbfTeMD346Dv5dm/6ni0IUw4ipfREixd7ztD0CXqtSYVJQEyX0ZWWSRwmqcwm2erzQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954935; c=relaxed/simple;
	bh=MBI1Pgkv5l9x8jWA6EGrPKnGTLF3QMSBlu5WNzLqQTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxiqzU5h7JcF/IicS96gI0Tih+olxWHzUXGcItTa/dh9ceKyrN9sArqlI3XIVwXWGNbT0ozZ622mhOgIGRFSX9CzaBtW1/Cus8qkxhonq1VQp4AgHnyZXbIJM6ghhmDOdTFEKmKB/R5yE1f9EzCW89bL1Gdholp/WaYHTgjun7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhGW/2bn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDck3q008257
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSy413Uoi4jbvjsJYcaYFgzu
	g9PD3l/kNya0fvntQm8=; b=IhGW/2bnx1+GEWJ1Yri5iu6asXH9Ly+jI7brBn50
	G7EjHqr2jfh9n2SkSIO01Id+zMZ49G7/Mk5e1Lf6K3wwMNTG4jWPbkVQ42lHyy72
	l01lHWlrRxyfzrxBftS5y0YoV5s+DDh7rVQf5jegxLdIe6C97fauG7aeXThLgxfc
	7Kb/luQL6RpDyUUrwOGU5u0Iy5aUYNdjIBZEGSJBy176ZgMk1bXtpFJkM5clN9Zx
	WQMyULxRwwJ5KrbAena7XeZLOZfiFx7bSkd8LL+zUsVJBxMGcNa9iOdjPJuRR9Y4
	TeNkXYbIlsJeDxaqhwuHVmfD5TM/PEdI7Pctkla8TSPIiQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpvnfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726a649957dso94920806d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954932; x=1758559732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSy413Uoi4jbvjsJYcaYFgzug9PD3l/kNya0fvntQm8=;
        b=QNs+/djo9R+MEHt63ClGo0jk1hxn+kX2g9kNNehnQssWWwZe745atIhlxTQwF8NQ0y
         FF769nX4FE1Dm5qVKDn3qyC+xkuBmzWIX17Yr3tPZmlmXmTziCfbJx4iyoEJvh18jBqM
         7fQkQN4BUkikTPe80dEvYHQ87HFRf0gCckqecTkm8EBnWz28CDDGEAAK7/e6nY5exi8W
         R0fzNmn5JjODzOJIRLnXPdtkomhELK2wwcCGkPnpWGmXCdK3HJuzddAzOPd0O3xxgBHe
         8H3fEP+GAcVHguP5GmSQVyTaGAz3Ibr4jJhc2g2pzK1kIUL3yKTju9VJsogO30sL03cF
         qpNw==
X-Forwarded-Encrypted: i=1; AJvYcCXYuqKxXtG43oo+N6tfVZMrwgeifipBDIikq8Bo0ocUE553lBJ7jmWgLDivZ6vLgbw1vy7Ad1F4dsWqjknL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lK3L33pdY/uaLN02/mKFCvsFylKyq5oUKpyUDlg1v7SK8xfx
	N5p7vrFptts2P5aou+PathLgPYvY0hpuiDaaDj3EM/CFyZNUBEUlyA3ZsStwmN8WTn5dF3ZPuaZ
	RG07Z50ACfQsdTnXOCAQT2bKn6RNqIXE1qludsOGtJNtxpw1tCQe+o6T89AodMUor59cJ
X-Gm-Gg: ASbGnctEKCk5+w3TTgiidkrmFRlskj9wUZqkykMQqmDtGXjOBN6NIucrGgoc+w6NeFi
	bCQo0wjAgVOFL5PILWdexCyVfGa2Q2E8ztrGnMYx72J6ZyOEjm+I9qgdsBCT0hJtUalthMbqyye
	mXFKpFjU3VygBwwBpse3UHdVSn8Ulcx24QMtyfNMuO9Ht9WUweypK0XK7tKAlDTCBclPc/eff3T
	ZVjeV20QHHtJKFOiKQL+tfIiseY/BwjL+Kge3UumbT06k8SLDZGcg1/K2c87+uofLBDc3FeIutH
	5zI48JQTVaAiJDzw8h5gAJEL1e0qgN2NS+8kgnZbK/34XmEuVfAVnrZIPauKsrfIPGr7c3LAvxq
	UIXdjEdHIXtLkrYSfPe8ohFEEVxIkWgw6La0RWz2ulTXYVkKmjD5m
X-Received: by 2002:ad4:4eab:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-767c215b586mr196847986d6.31.1757954931693;
        Mon, 15 Sep 2025 09:48:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+cHbHprOXKl+GeOOLclQsZjcLydXUkO2rJ7c4SXlnRtTiEMz91VXMShb8HABaBZvJdzKOaQ==
X-Received: by 2002:ad4:4eab:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-767c215b586mr196847346d6.31.1757954930938;
        Mon, 15 Sep 2025 09:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1bf1a45csm29339611fa.60.2025.09.15.09.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:48:50 -0700 (PDT)
Date: Mon, 15 Sep 2025 19:48:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8939: Add missing MDSS reset
Message-ID: <dvm5l5vbbden6pbihpetlyrtcr5v7uuigroiiqzlhyk2jtdpkn@pkjoluu6hana>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-2-a5c705df0c45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8916-resets-v1-2-a5c705df0c45@linaro.org>
X-Proofpoint-GUID: iui-OJciZUe1_aCrqXNP58BukQ5pZJEf
X-Proofpoint-ORIG-GUID: iui-OJciZUe1_aCrqXNP58BukQ5pZJEf
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c84375 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M_eXORl3-W3UjsCHqzwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfXy6HR4BEXqjhQ
 9QA3WaBSeXNU02MAwzfeg9E+rOLrmbl8YCCEbWr1bOqS0hZ/tJThJ518qFSirRiNcovEFqJ5EUF
 MeFS7dsThdi9m2WNz8vKyPPChCTko8f2pCM7KvIkWMUKbCrzVlvhrpnXB2y8TRrnHjRMbTrvtxn
 m2PEPKcmbZv5jVwlHsjH/9adiTH3wAV5mux36kQ0JfPtUEJL/kJIc+SlLwX7feP1/xi1vt8D2NU
 8oTTFA3LlZjxQhjm0vU3UETc/O8eIrY5D9PmAXfAvk8+tz92A24MC+P/3+MGgANuD7kbyi760Q+
 FoD51t/9Ek4Cp/aYWCcDIGLbGsDOfAZmFII7BLvJHmj/qxsXIboFzISOKugDRWYlIRYT8OVYOT9
 dreltTZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Mon, Sep 15, 2025 at 03:28:31PM +0200, Stephan Gerhold wrote:
> On most MSM8939 devices, the bootloader already initializes the display to
> show the boot splash screen. In this situation, MDSS is already configured
> and left running when starting Linux. To avoid side effects from the
> bootloader configuration, the MDSS reset can be specified in the device
> tree to start again with a clean hardware state.
> 
> The reset for MDSS is currently missing in msm8939.dtsi, which causes
> errors when the MDSS driver tries to re-initialize the registers:
> 
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  ...
> 
> It turns out that we have always indirectly worked around this by building
> the MDSS driver as a module. Before v6.17, the power domain was temporarily
> turned off until the module was loaded, long enough to clear the register
> contents. In v6.17, power domains are not turned off during boot until
> sync_state() happens, so this is no longer working. Even before v6.17 this
> resulted in broken behavior, but notably only when the MDSS driver was
> built-in instead of a module.
> 
> Cc: stable@vger.kernel.org
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

