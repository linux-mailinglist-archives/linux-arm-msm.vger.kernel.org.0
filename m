Return-Path: <linux-arm-msm+bounces-40600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D626E9E5CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C090283098
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D708224AFC;
	Thu,  5 Dec 2024 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AolqaUjO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C4618BC1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419186; cv=none; b=mE12v5X5GNgag9V0pw7Jj0Re0DkVoEq9Y59i4ga+mIkwMtgMdzBggZUg7AfkSpB3l5cyD4HUuqlBxj4K7eXuCFjlaIA6pt2P2VGsXz78pGYrk104U93gEmGU/bJwTLFXGHhylWh+Lss3+DRKc3R7XcR4a57ZrIzoFtFcAjXHtwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419186; c=relaxed/simple;
	bh=lYUjWc6zjIdoVN44M09qv+uz55wgl/dR+Cu8fHg5GZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6uWWJHezYYhf/EZdqhn41CCQ7q4H2bIkkU7emGiWciOtdm5I01FxQ1ZastkgaiAnPU6zXNH+ekJQA96LpY8xS4V27wUZ0dc05xcuB8QHoWhSmdtXxGfRlj/73X9xSrjqjIsGL+QDeO8o82GpuANRceWfMaBhN0FTkgVN3UOI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AolqaUjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FlDI2032114
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lm5ndeOU9990FRIjr0qyFHytkSEpGFifKLWwIXMxeEE=; b=AolqaUjOIngK9iOV
	pWktVOg09Db03+kC4HTTv7tj36rXe+nTAdZHethGlEQZEPYleAaszL9/dmvjq0sg
	Gf1CP9QNu2izii7tf4K2e3ggJxwQ8UJwjw36r1JEqgFFKtUQLt/WYwIjLO39sYKJ
	3cULLaqhGFtoE7OYfLSlggiOOmijVpBvbkwekn2cudLwJDxBa/3s5EiUOlAuVbMR
	ZAsDbrZy8o3+JBDPJiJS3LzrW08s2+PwtkLsA10HTLpYSHpFvKD07aQnu1YrP2hw
	5yVs48nom/boGOT1zTEeCWhS7AnPxBpUt8pagPe0K2+4xx1rpu7ajaHs22ObAW1F
	B2q/JA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fay95v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:19:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46699075dd4so2946951cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419183; x=1734023983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm5ndeOU9990FRIjr0qyFHytkSEpGFifKLWwIXMxeEE=;
        b=nOE/PXoNSSLqnYzMkETh6QFAuXCAekpBxqRuCWdIx9b7N4hWT9U0iqm7Br0o9J4yi5
         /nJHiQBANeTXJXd8hd4KukMki84X/WrPs8iqCXdrHgbIYPLfKnC4MoFkMOE7RgzT/C+R
         DuwXQSi93CIveT9ZSeFbSRNGN2telrsdsSDR6x97iGeJPZz4SMu6qyZ9LvZDOJkkeRm6
         8c2Me8MbgY/qmRjj6PMN/WE/88ZlaN1Ja6MeNL3WyoT+wvUv02G1zawXzScFuOMf1fX7
         vwx/+o7ZRtJUjCfxOlzrd5hdNpiYS9dvNUef/OxgI4KzO/rvfw3d7TSfbEgfnhQVee59
         f2og==
X-Forwarded-Encrypted: i=1; AJvYcCU7mcZW89AUAhH2Iy8m3ZRh0pZPkeYmWQI4Yr6tO3bsbFWhDYFAYPAUFN0mTh9ghk4JOeADuoZky9i5K92/@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrEAIVLeAlv7zKdPmviOFmSPwApe0YEe6lShLwg4o6pG8bjIc
	btXsiTw3R+4R6Zjj8pWMUpajYrR5/wIBnTfS3Sm2ePr2glpBz/1dl4jhv9ch7PvP6ENNR+PImk/
	gga0/Wqkgc7oeicIUQEbOgvhPGOQ3eCtMrNZYG2L924mEBmRsczSlOfsfo6E7hoT/
X-Gm-Gg: ASbGncufCx38ZsdQSJtgTueozzNKCwOVZEaTC4tNNQOOabUk8modtNOBkrmA/Qetr1r
	BrElqSi7VytMdGf9XqfRUkFy8LKKcrJiSITKLko0sxsghFDRbIRtbpvgsbZwDQ9aBkTSj4puhCq
	PWaaT/biN4D6rLVcng+QLWFxRqBPK9SxSKeEd3HiO7VJ/UdcMsTq4O+A0EpqxGKuPx0XNg671Cx
	rUjYpEiLlL4h62RjLQMn9pNTsiJDKpGojOKQDesdRPMzLZjkAG2AUUm0omUCxovJuc+JyjjOZ4L
	Hi0EnjC11Sbxwhxe1uVAY0qelm30NcQ=
X-Received: by 2002:a05:622a:1811:b0:466:8e17:cd1f with SMTP id d75a77b69052e-4670c071462mr65629451cf.3.1733419183512;
        Thu, 05 Dec 2024 09:19:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaJmOBmk5E91zDvi4GqqziQOrLODRZopwm1Xkdm3u7K10bviytIQBZzrpav1hnIkMXbYrY2A==
X-Received: by 2002:a05:622a:1811:b0:466:8e17:cd1f with SMTP id d75a77b69052e-4670c071462mr65629191cf.3.1733419183166;
        Thu, 05 Dec 2024 09:19:43 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e048asm118968866b.175.2024.12.05.09.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:19:42 -0800 (PST)
Message-ID: <02e2640a-22ce-4586-bff1-7f4eaa20cd7e@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/8] arm64: dts: qcom: ipq9574: Remove eMMC node
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
 <20241120091507.1404368-9-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120091507.1404368-9-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NMWaSw720NoS_GLjon4oT4a7lqqe0Bk2
X-Proofpoint-GUID: NMWaSw720NoS_GLjon4oT4a7lqqe0Bk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=718
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126

On 20.11.2024 10:15 AM, Md Sadre Alam wrote:
> Remove eMMC node for rdp433, since rdp433
> default boot mode is norplusnand
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

