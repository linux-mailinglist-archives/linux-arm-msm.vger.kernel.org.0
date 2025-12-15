Return-Path: <linux-arm-msm+bounces-85287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECCCBFD76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD90301D4E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF92328244;
	Mon, 15 Dec 2025 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5YPUuW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imgyVjQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9933271FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765832033; cv=none; b=JICUocMW6sncw+wLq1rb5j2D/yOD3Gds5X51xMroRgf5sBrm1zSDdgnfIqt//vPYepGE8onlQXrbLiELUuPElVfLnpD/pQDwKcucAS2Hvwn3k5VDV5rLOTrbj6ILO6OSP2hS687WapQaU62hKgBMoCdJlYaJrPAIOAmjJqHnKJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765832033; c=relaxed/simple;
	bh=QKfdTtB9jsJqpAbAZPYl/K+4Ds/KScd3T1DNwwUd2pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StBrgcB3KyYeksauFi/ea/k2yxu89ynoSpkfFEe+H0GnSgwbkCRStpF74PkaVhG8zH2aYlEkE8DR+Bj/b5LCZQLskX7WMHwm4kzBdHK4bo3Y7Rkl63flhlSt1+x/BZgKTBGoMdnlmeuNlCydNqeYS7xWDnk2lXKHtbKOWqwNYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5YPUuW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imgyVjQJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFI0LvO1682285
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/TsyWJzD5iXI53eher+jj91
	fa49Bf82Hz1fklQl6wE=; b=A5YPUuW/HQT5YkbWP0p6vSMTHbU80jsm+XXFj0sX
	NfrRYS5Ocr3MrUB/sSZ1XmsxxhMOhpBk2FN5+xfgPJrGukpdeEbCxoK4XOqU9Kjz
	lqZ5G2/CMHIK+pQ691LBLMMJmg1+cOHDwKQMuKwq9QqYOjK/0fvdx9Hx76nn+pML
	Y05JsCdGvrcJBxD1SX1bbKb0REL7wJeot4ZWDjRTn22Opte2lHUC8V74ayanTgcT
	ChY0XQz1SGqveGjYXa5wRryqfAmLWxqFm/LTCZ7VY8muxgKgNJIaHmbnc5Clkn3a
	YLZXD+VUdN7YVLV5cJRZcrxdS5pBQLJzpIWJljRvhNJbeA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tgdtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:53:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-888825e6423so68145146d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765832031; x=1766436831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/TsyWJzD5iXI53eher+jj91fa49Bf82Hz1fklQl6wE=;
        b=imgyVjQJFFdxEy7dcnhoDBc0Fm/vpRoVG1WnTjk+yqAcOGCl89DtQVfA38cZBuvsEn
         Wxb9UTl5d+DRYps6uibNYjvi6kgH19osJdVMq+7LwcPtKRg7W8EI4uDourtxIIKpycZE
         ydxT0qDavAlRdlBXZte+GmV219iO22LHW3i9MyL8SiLA+lAe9yV6VS5Dwj7WO1mCQbib
         ZiXVLsgzCa42HFz9HSW9JRQE6M7WOP3FzhtD4gAIe19PVAXcz+/7oODFCZohR6DyY9Rq
         ehrcKv0fxRDb7eN1zpc/6na444JBMTmuinSn7KASMtQTGH+l26RtBpu0g+kkA7FOdBlx
         Ec7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765832031; x=1766436831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/TsyWJzD5iXI53eher+jj91fa49Bf82Hz1fklQl6wE=;
        b=Vv0aoFOcLDvJwnLSIKjBXZUsD3wXRYU0kTbxs3OweCgAZiNHSW6z2NVG/Hl0ROOYd0
         zuscaWTncxxb0NWgbA935R7dIUleCC5x5MUeo5TEuHSGyRhgf9rrStkq8wksIDB0UYE/
         ry7peMRc/CuQRaS9LgeLwyRaVdmvJ9qBees9Hin0va4Hxo3lv/jRdVRT0TXqL3A4h6Dm
         F8MdzNL6uq91zTBrhpWsZQTSJQMrih1T383J7qYhJqE/cvTezEH7TP14nKfj5C2SrcpD
         oQEVzADShEalPggTsS5aze8Hk0XUuVZRQb9hnouuvLRMR/HTCtQ4qaBEbbvn3m15Bn9D
         bAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpbBCG09YyhueCXManYEkZWgA0xUqhQpJ0PRItIqddHtvcgINyfIjCP6ls8LjAN+Dgm6wQJf8Oq1yUUdAa@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCW1kyiHdTowMmqK8RWDt6uq2WXR32t/nq5ac+OqxW5SnkQ34
	NBVZ7rRadkkHG25USkqSwUez81NsfeqCxBeIrrFHgVYd9TE8TCyIQQaVqA/xwP1G4Izz77LeVgn
	R0xYYv/+NBOz6RKsX9if3Ec9AiSz5kWYdixbBM6HqsXl3eOm599sT5XkK1+oMdA0+vR88
X-Gm-Gg: AY/fxX6lbYtxxPyspudV38hYqFbn9x3BPu2dQncsPkFEjXvT5e3BAhAVlw5hIN+DBgP
	rjhI+NDtrVid2VlUbNM2y2kkOisOT+dSvf18ZhUHsxJmaWM1XOiOFKT99umSRx6jYapRvS2ISGJ
	f1CewORxfSx3BS4sUUNAvsZDA9j3h8c+nO03ECxRk7yhzGUdrLhzC23gCzYyJdfzzg5aBXlN1eB
	sAp83pILIYzM6OJfol1yWS4zIlMe5WzviCWdFIw+J/IHlXlHPw4qNwmMYVEJNNqhx8YiR0HQD/H
	L4/SgdC4N+lQ9yt0WeildBDRdKyCYF4zJmhN2kIke4T9OMiIRC6L8rpnGDlZJVH6ANq6ncTw6c+
	s1/wHsaZ8//fVPy6fhx1ydcycdy9FDSsamZzirv0P0D1HXKQiw1W+hQDrCL9mlJ/4vs/SJBplA8
	tQo+CMFN89OBtfFl0SUNx+pf0=
X-Received: by 2002:a05:622a:180b:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4f1d04a5965mr142206751cf.15.1765832030678;
        Mon, 15 Dec 2025 12:53:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUNA4qOYmANAfvN6yXIfWAwa4vMNCBaoGyJr5ijB7DJd+cJVTwWlugyRk84pW6j9Q4YgQ5tw==
X-Received: by 2002:a05:622a:180b:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4f1d04a5965mr142206561cf.15.1765832030259;
        Mon, 15 Dec 2025 12:53:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a743sm139507e87.41.2025.12.15.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:53:49 -0800 (PST)
Date: Mon, 15 Dec 2025 22:53:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-el2: Add the APSS watchdog
Message-ID: <wqhgxpijztpnsxhmh7ed4xmrn3bypvyflcry2t5pawbyoca4dd@pn5gh7gh27pe>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
 <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
X-Proofpoint-GUID: XAGBc9Za0PFPLfsaHA_TATgEB89c0ARD
X-Proofpoint-ORIG-GUID: XAGBc9Za0PFPLfsaHA_TATgEB89c0ARD
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=6940755f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SdC5Sa7j1MJPWwsnmbEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfX4vixpmIluMfu
 36/9peaw6xwf5/CXZvhJ9e+kJv5BPU23OSN3mhpTDhtTaKjfdq4vxx+xGgCT8+obBCfBIfMHEMD
 Mcls//eVrzoW4y57ptT1ACpzMnr6hRp/YCGIlGrJiOd/ZxPF1+Psl0ZRKggBD81RgbF8OveW4MN
 PbFOl/UYzmvvJRdFuRoBoqs4HKRDzTRXytAB+fD2NeVny98eBq+uEXlGWzPRu/fUV+tZ0iMhbt/
 IBZIqZH824iXHS2WJ2nWdEQWjTGsd498GUHbf2vRAVGclpJQR7JBg3GA+fXQx1nX8xQfhikcT/a
 j3Kl2Zm9jpE1+nWpRSaqeGQlNzoMJJFYbKFu9G0l4QeeAZPDHmEJC4hGoqC3a318PaeOLQjvS8q
 2WSZ0ZN824gTBK03bOVgq1LmFNYhMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150180

On Sun, Dec 14, 2025 at 10:49:59PM +0200, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node in the EL2
> overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

