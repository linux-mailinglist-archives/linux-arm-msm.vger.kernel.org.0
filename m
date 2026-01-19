Return-Path: <linux-arm-msm+bounces-89643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE9D3A847
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 838713002894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F411735A929;
	Mon, 19 Jan 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJjdVkzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kh7g4VVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502835A94E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824921; cv=none; b=am+g8RvDNCQajFJ2BTGHlzmjHbk0JGqTHAYr+0gY/nrqiz8VIJ1wGYE7XPiHYvtVfqzEv2zzfrqaxlwh/T7v9cUpzj1Wx4jukrEDCwQr4trlfV6RFAbiGgfX1MYBpOvUIL6o9xFoBnKOaOftRKWT0sKzuGLadhoMdC3mynDcFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824921; c=relaxed/simple;
	bh=HkdPCCSHrlCBEf6K0eRLEeE5DxaLMw+XUXxKwdvl79U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgvwrWb4GnZzesZuvyMUmdfEwPsVZeEMHbZXH+OXMYqGc5CF1LFTcRu50mIifKvp+FU0H7R1/kg0w5LRam9YLb9zSc9E/386GGGfpbD8MGC+VWZzfHr0gCWkEfVh3TlXBdgXvJAIF5Vnb7gEiRjq2TEXOe3YFpgNty40iMy2pGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJjdVkzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kh7g4VVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90ojE228217
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c5pE1RlHEeT/iyjqk/IGza3C
	aPTZcIOlCDbIoUUgpQA=; b=gJjdVkztOHaaqLyq872u8Ov8rIXL1CPBe3uJ/3IR
	IWnKR+uMOUdc/HPFtKpPefKVicOLNcNlIfIJROtDrmS9ET1eBFx6muHibwsGlWek
	h5KarwW75g725fcFVgF3EK+3VN4jLSMFIvXxQKTA5clfbKJzgNA+DGlWHRMxdl+T
	OLN2G9Srj3pPva73Ab9wCXxisMMu2JeNUA9EeKhACnfTWX5kp0wvYVp8mUrM6Rdb
	X8h46V3GV4ISoJT2Qvz6BlqijWEaUBz/29VbtEVZNaRSDhYFtel4YwCX5N0T6ugI
	lf1liDOmq5b0j9g8WJ9yQVZT/8QEqRLwYYZKgnn2QF8COQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8vnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:15:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88051c72070so103691106d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768824919; x=1769429719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5pE1RlHEeT/iyjqk/IGza3CaPTZcIOlCDbIoUUgpQA=;
        b=Kh7g4VVWs7TK5AO4tt2vGj3wpL3aq245ZTUndOXwBydYspICN1+tzxw8zGb+S7w9Mx
         AkH+oW52FP0gFuAfF+q43IXk6C9mqYqaKvIbmpZPFsoK4GDNDYhe4qWh7Mdz5F4KXOPk
         a02SL6qZRYgW7sOm3L0FHa6cMByvBEwXKTGoVBUd/xq5nbB9B9ihsRHPqv4Cdys3lkua
         o9KoUAf8wpbE3B+ekFNIMf9YcjAJokGT95rAh/uWQF0TmGsKuyBZDbxVh9IOWBMeU+hU
         RybkeWJoCDZ61QIO0uqCrCZwBKSXsu6+lO/CiHC0QRYlKkjGNoIocONr2HmEgaunstkA
         xkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824919; x=1769429719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5pE1RlHEeT/iyjqk/IGza3CaPTZcIOlCDbIoUUgpQA=;
        b=GHtwwrDXTR7IY2HEknN5CWf74CEerBvV+qcdxEL/T2HwufbMLvZmRbkDvaFo/NqxLv
         zPrlisDs4Kjt1M4pKvjLhQNC17dWDnpbwmUfmFUhKVnJr/cdurKiKPNHorg+y3a5cr8B
         U8dPIqlt9sLqdT8YpUGNYF/l1QotybpsIbIfLw9pw4G8bHcoJKzXZReLUZkQjuDstxLZ
         8KWyTJMJJQ0u7GkX0yIZyosNdb1vzevucB9XuPV8Im5Ie+qaT2Nk6vh4TPz54bJ2vPxz
         kSnt+h6s9oHxqvKfq8osj/GNJeYZwn5R5cGqk7sSNHD8FwVk5oxn4TVc1Xgt7wwikkov
         fG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7JuBTVjswJunQBj/G7Y/+1LgDMh2DXshlnY8dJYeomgbd4WcVo/A2IbgX7s1YMomglYayZ4U7c3Erzsxx@vger.kernel.org
X-Gm-Message-State: AOJu0YzGX+HqLHuAZWp3qjn8aprl9Vm6icTPIzJgwm22jRCEkDt5ZY4P
	WZK6DjtFsUVTuQIXW6qKGRrpmGn/KSqZRczjyVdSY7jUWwZFGwVeTgQSWLNwK9MOu0TY7NlnmhE
	M7XyADzdVT8LLwEPWQJeSHokG/QJ/dW2Yda94N64a2JMfmCuotn9WL6a+aupcdYYQZ1/r
X-Gm-Gg: AY/fxX6Eif3LJXBAfFEUZD5YaaOPDcgLtt+/kFVbbnIrs9hgJNykY0XmQ4lwkNPXRKr
	CXbM6/oBLVy4BcEhpKNm60hQ7kEHH49i7shfB4BjTV/F1Qvrer21jP8bQTcTO6vaCJ6i3iZODaO
	SBe11WPtJhZ5+tnSmqKGNy+s/newtvPe9BfdPokEHly5wOSBVrjoN2X3weIbh2pZVVqI+5N/GL9
	GmikfNRbWEE4saTh6jDcGfTYtfGkQcX78VPIpHyjln0cmhbtxwEsFegSXjnYaD8GcSgunv+wEls
	rmF2VM3p7+Wq0SC3kKn3iZRSfu8WJiiEUPl7kmnRuMtH3UOWDL3fAdHcbWVi/s6K5f6UzW15zBo
	/X3mXeW6Tfhl1/j7+LwCw1Pl9jWXsxzHQ30g1BzroyUjuqOsp/tLgc6WyOO91OSYkZzKuPmdmv8
	UCsFrL/Dr4pvWcvlPaKJ7svlc=
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr1415542485a.61.1768824918891;
        Mon, 19 Jan 2026 04:15:18 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr1415536985a.61.1768824918326;
        Mon, 19 Jan 2026 04:15:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f86157sm31705851fa.36.2026.01.19.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:15:17 -0800 (PST)
Date: Mon, 19 Jan 2026 14:15:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Message-ID: <x2scqtrj6sfvlotkossqlxokubuoeuycssxkkqm7ncuei46c4s@hplpveln4vqj>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
X-Proofpoint-ORIG-GUID: 6Y1jiV5NPwoLoLLPmhs91jmZFxawFkTz
X-Proofpoint-GUID: 6Y1jiV5NPwoLoLLPmhs91jmZFxawFkTz
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e2057 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=kVCuoV9HowMxSFpO-lAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMSBTYWx0ZWRfX025eLnYVf3/w
 c6FL2jnnW+wuWF5UYZiZiF/ZIYB5MbnFuxgGM9IIADJh9iMrdw9p0iqvxH/cHz3geHYoH30b/7/
 pnkEiKQvj/6w3xf/9TPqLNxldyDWh5FxmWM22Sms3K9fGx7O39zUvOtWNabLL3VS6AK5bEM7MQn
 cZQ9Ui786tUVmaW35jsIt81PeLfP22vTCCs1ZNvlxXasFMk2JRXINHc5VecbhZz07OIF/IHjFVJ
 NVUuF9UnREOgDnlf2j1MDR/FUzffCvTj2pPInwJ75UIeTG+HQ3eT/G4nFd+Z3ZkK6468ng7oilt
 YGPraeZ5cyS54JbzPiaK7mDispAtoLLQb3rXRhujxM/3dj+6RT1KRjycsc1jsEiDFSQY/uZdcrT
 Jvk8PDEEBp9uTUNCJAeOfRwg1rXPGnsT9vn8Xlb6yUUSeWN9rCDpfDhz7FEJLpzMco3R8kuvhSv
 kiRxgsfCoggMQJaGQHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190101

On Mon, Jan 19, 2026 at 12:58:53PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Enable the bluetooth interface on the uart6
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

