Return-Path: <linux-arm-msm+bounces-58896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED56ABF589
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 223B317DB22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41982270566;
	Wed, 21 May 2025 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcpFgHnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED126A0EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832867; cv=none; b=nu5m31sXw6tMGTyYrVx1u/0wiMqDDQRmpRauyeG5yoT+M+bd1Uk+JWQI4qdAMLiBhzWnREqQLol4sah/YhRCU/XKy5Scbps0MpLfQzcMGjCiS7eWj5afN/J+q96mteM+w6DQHaVXp3iA12ClvfgFvAj+VZW1u5/t/A75q1wiOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832867; c=relaxed/simple;
	bh=2h5eOk+PaQWfro9Vv3yg0j/RpaNifxflPxmCSX2uz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb7K7dpFfo/BalnrcLkKxsuXzxMnyL2QagostrGz1N8S9WEy7q3v6jj7v/A69k0RQ3E/kxP2hjbtOGHXkBNBaIlIJykyo6zOfH+NRjQxRAYJqtLAwgPQTn4Z51K57b4aJbTmAbu2zBHvXCspHUlFX6EaVj/ww/Fgl0HPoreFrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcpFgHnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XKYr020965
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYODI0ZMM8S9a1zlWL7NJhRC
	dLxf6RZlwDt4Yz1bkk0=; b=GcpFgHnxSiB98S20oARs8LRm/+kkzMFsOSSpDBnK
	U2ROZCnZ4LVNA3UhTSEEPJ5Ub0IWVwIw3wIHP64Wg1m38TKR8qg8DsNFW7fovOR5
	nJaOtktTUfo0Rd3RyPoyIvJFEXsKVlWS7/kCVsG0//qXujtM0tjAMQn64bbz77jm
	mJrn33Fer5+/pafL1VnGjZIr+LMRGOJb/z+NdlwDyU3XZyPq2nz2N3LDEPWS1yol
	YA1dLPLVsw+AZzjrJQHbcWkiVHGOm2MFQJrO0P7OZNJd/mIVb7r9WY1OfQ8MqFwf
	q4fjHzMrMrKSE1G062aMCqSRbK9PEnRfvR5R5WXd9JKvuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf033fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:07:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-310a0668968so497392a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832864; x=1748437664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYODI0ZMM8S9a1zlWL7NJhRCdLxf6RZlwDt4Yz1bkk0=;
        b=gaKgf8h+1yQ4F3lyMCGCB1DlAOIX2wdEVJIziLwo8kIgwZLHP0NvDZZSk65vo9UL8A
         Ao2axAlkOmjNvDiUlLVsJNAgPMo/t9LwAQSfC4KFaz2V0QITZBV5sXwrPM2JI+afEtyH
         nfDrCasWqNYdevPJEpgvTI3+7ar5Y4I/al/0odA/SoB9RiL9HP/55dh6RkmvRq148paH
         bDDSPONzuWj0yKP+2g+RS2W3Y5Etu8Vcq2Yk1Sa5kDeF3KR0qcR41x5XOM7Ltvwi24Ev
         vgVkkBDCvPj1Ua3NkmPJ/S24MQ10gP+xUNKueCE7HP20o/K4bj0IB9OXDwEhV1xa9AXE
         9Cfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmQVr3BlSATlF23o+czAsIFrkaJrXE23TbMFLkAYXwxtnAVDlVnc67OsMyRG2dMnUHsIrGpBJEdZAGcCms@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1zW4p8AbxyXtOTvfXxs76WvjfeC0Q9pBWGIGB8tXiVgSpP5B
	uEmqSwq56lWQ9ane1slZh7jwm+3Q1dmSvMBOI8vxdYw28vL52nRHjA8e/8oTzg34BXbtI3pjsDy
	TFRSuv+7CnGELO8K27OHK80oxZRraWsQTi+1VKM5/TGjO9SeXD1Uc/80hQA0X5yisbbfz
X-Gm-Gg: ASbGncvN4CXIlOISXP6AEASj4DkV64z4YOu5WjA7LIzLNPQiQ+8LOisxi02bFTgs9lB
	MbqA0BkqfaEcFKLHxgssiVFOoGhnP6aVQcIdtG95X6xB27ld/X7ibWrNAjv7WmGOg3cqdoxo3f/
	pZONmbpvyJJISQyK73mh0GcGtrPrpkqbz/KrPVWNyrPtsMtnLtZ/gcE91qZr50Ma7SxHkNb6b0M
	IflBoDP1mmE2yeQfNei2+aY5Qzm/tdRsgLw3Sg3roCADO0oWwudYEfXnH5oeM3pVJKgW4g5kJHS
	5iPyw5nmljtwsylVnsgMSKR2KRmOK3xE03ArM2c+nhcjYIRLsH1ytW9c8AHGbi4vwH3vOVlO1/k
	=
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974553a91.8.1747832864065;
        Wed, 21 May 2025 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQTcM0DEewfI33gItZD9j1h0bGLelB3UY4zmdB1KWV9XM4V5233w4DxRV0kJm45wKsrFEaSg==
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974498a91.8.1747832863677;
        Wed, 21 May 2025 06:07:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c19csm2813012e87.170.2025.05.21.06.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:07:40 -0700 (PDT)
Date: Wed, 21 May 2025 16:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <osxdr3czofrurub4c4tmqv5vciv7ub3gm3vxygqee6uizjmmq6@mju4r54hpk6j>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
X-Proofpoint-GUID: WyS9I2suLza8sspVGWwf2jcp6xAWRFEB
X-Proofpoint-ORIG-GUID: WyS9I2suLza8sspVGWwf2jcp6xAWRFEB
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682dd020 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=D6KgBE5joMCqelrfVo0A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNyBTYWx0ZWRfX82/tcolbmT8u
 DkF6qTmQ7N1WzMindYstJgXA5HfVay9Cmb63139ckdHexaz5sx3usPaCQ4TX6DR0TkPEAyobPRU
 DA5knRjjr79MsO8R2a3I5Zaip3Ah1nJoX1L8S7P2DIkoTfXWiIXvGTOIsDpmzcIfclh2VeRzL08
 T0vFrM7eenwjEczKY1twnMX9Z6XMOver3pTVzGZwqO2EABWkyrGRYHcINRBzT4Q+vQ+pcifAlmO
 cEwGxdZ+OI9Fwv2vnC9aQesJYRvd4mWbImxDFjaLuvXRTt6S0slMGD4dhikoY/xiDeGK1iw1y8C
 aU8e+0wQNcxONBDxlzVaydlEUx49Jk1RR9dnm1JUej9e/0dnVyxj6qFRChJ6VSeGsooB393RFKN
 QlMhIxMjPA4biZ1CLaqu1Ca/TBporIfTw7paQUCNpmD1AtyiHCFeOyEiB7Ugb77AkdAxFFJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=832 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210127

On Wed, May 21, 2025 at 09:32:00AM +0800, Wenmeng Liu wrote:
> 
> 
> On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
> > Hello Wenmeng,
> > 
> > On 5/20/25 11:56, Wenmeng Liu wrote:
> > > This change enables camera driver for QCS615 ADP AIR board.
> > 
> > what is the rationale of enabling CAMSS on the board without giving any
> > description of any sensors connected to the SoC?
> > 
> 
> Hi Vladimir,
> 
> We can perform validation through the CSID TPG(Test Pattern Generator), so I
> enabled CAMSS.

Are there any _actual_ cameras being a part of the RIDE platform? 

-- 
With best wishes
Dmitry

