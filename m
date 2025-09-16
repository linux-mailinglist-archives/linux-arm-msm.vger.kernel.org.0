Return-Path: <linux-arm-msm+bounces-73693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E49B59493
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356423A6E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FE22877D7;
	Tue, 16 Sep 2025 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWrnFyFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549711A9FB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020481; cv=none; b=th3JSe6M07/drrldP87W2wimvLRMHdYHwnjOX5/w3EudKjgipkhMxZ+ex/Q2liKZLbbfqfFNACcEQA2JEa4Pt+SZInMl0wXqRExJinjTUw9/IA+UdEvdyX0OumHyI5B4qxILj6baoC1xfA2vmZRvOeK3htSGSvtlFjY3rQlZLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020481; c=relaxed/simple;
	bh=NCB9zn+1OoC3HfwDpn00j2J+X9Iiwehic5Jfs6gBc6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRr0DbkNKK2KHZ5lF4VhkCT/18UBczC1hZCYNSGiYajvYh3ms/RJ/9EY3aN/RjQvUlO/hKX1eqQtjuneWJ9l3S036Q6rbVBqxF6q3yyGa5hxwyi4AM1aOfjrjIxqlzFs4Jb7hyK63o9EgcyShJufEFNXqbLRqPMoEQbkIxrn+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWrnFyFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA9mqe003583
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kVUremSztL9SXw9vrpclbs+f
	CQ2ClcMRdwOTbzI7vMQ=; b=hWrnFyFJvxm6g+Lift+rgcEvVLmDxPebCs81lC9V
	M1SQ2Du/4aHvWlV+iYY6FitiLKOefbQSXdy3nQ4KgUkZX1zgfKNn/5CymZVnHPQf
	/ZDFCruMcP1nakG0b3973jNJKnLj6vH0culupLgKoSXM37wK3mhSwRXU6tnzDrpe
	j08KJUyTXA0vp9yPWyA9+RSsuEWQAFIcdaAsJJCSWhdwUV9+5lSa8DWKelV4kcfU
	bymx4QqGW8+HCmDYZKDZx6nbM7GxcrX56+JMfUqSgjria5FX/lMhCo9b5rgAo/Cb
	Xz82PeTIxro8i9Ac+C90NeyZ26Ep+Fti4W4/GGeu/Dzz5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8vnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:01:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b78fb75a97so33400521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020478; x=1758625278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVUremSztL9SXw9vrpclbs+fCQ2ClcMRdwOTbzI7vMQ=;
        b=PcnAckk6Pr+4Eohz2xyPPU+AcitVtODZF/fZXALLvVDco5Gt5KI8vRYQ7LGnJiumLr
         04T0An8Ntvvc1xnLKWwd6rdIDRRkbi8Iv9zZw4UJ2nFGlBev6B+Swsbd45vMagCUndsF
         Cgs7/a/lOvxq5s2NGf3PdSxKwOnuh5kaQKAb9WEwpkvQUZ0FUX/jdRPEmwqHwuu/XX0M
         v3dkWlSg4CFQ40qD9VoDX3yWkMN0tqhoWZywb4KseYiN1qciMQXEpnHzASLeOjbZnx4P
         wuDY6spAz1lJG39C/sB+OqDaXkfCmxqUAoDAOZJvHck8rQiIE2klD1j3qmkaxjuft74n
         Q9iw==
X-Forwarded-Encrypted: i=1; AJvYcCUyWJP2CEiVml3QbSHeJaDNdBTp48waRrRC3tB4uAPYEnjkHYnJaWm7VZ5fXa1huu68Qik+cWMc5Xe+DSCx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3h2DV9i6imeN7CTx47039yKrs/RTcUZdB70rLiIYuJFfnh51+
	qjUrQfaDnOcYwL3FN9DWOVNPOvgIsoX/+wZEhqpn9oaKOtLqNX0vEA5LtuISaHPlroh7iCtVux/
	lzAGB8HwAXdMbeME2E3gdlA9cwWhesTpCZSHHYP0Qj7oCZk3pPRMtfzVRxuGnjwtJBTH8
X-Gm-Gg: ASbGncsINHDaCqHabo40NYevi9I0lXPLXA258+ZSAHOOglr6XAFeFGsbcYEHdu957u1
	0J6gzIbscDYLUQCgMwLOydBUvOVR1OqfQn17Hs6/SdYg0RJMfPOcx1JA7Fq23JWiD87L3hxc8aR
	Rez6IQZEgCg+t9lhT8xdw0ZdAJCox8oXbuk30agj2gb3AQenPGiNx8gEIaFK8R8AAnHgRe3KkKb
	7GLJVsW47AdHxjoG8b9Whh6m7EX+qQwty167p6cdspvelBG5cMkVMYi2M69p2Iyv20hQ0O6WkVY
	j4QZkuhKQJELD3+sIwKLCyxRCAN5ARTJvONQx/C1WraiLiDofJyJXYa5qeRaIn8uY2IA/KlbmKx
	y3Kwbo9/THUmP/O5XxIveX6LU/EkkSLDWp0nysNYHIte3x2JFlcmc
X-Received: by 2002:ac8:58d6:0:b0:4b7:9313:a35f with SMTP id d75a77b69052e-4b79313a964mr132544301cf.2.1758020478170;
        Tue, 16 Sep 2025 04:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLAF3UeE0KRBiIqMl1GqNbWZHZDnQRL51kIuIAuObbsA7nu8iKYJBvUfO43iyEhrcGCg745Q==
X-Received: by 2002:ac8:58d6:0:b0:4b7:9313:a35f with SMTP id d75a77b69052e-4b79313a964mr132543501cf.2.1758020477568;
        Tue, 16 Sep 2025 04:01:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cc6sm4391757e87.66.2025.09.16.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:01:16 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/10] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Message-ID: <uega7zdkprvk3ediiu4lykiukf7iz2wgk56c3pdloqrpzddt2c@yc37f6payhca>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-7-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-7-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: laeY9qMYgZjgGPBa1KBhakRW3FwBBDWR
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c9437f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yPPeNZB_paKBOZgJB6kA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXyCdGHelbau8f
 dcAmiFWx/DTVdQNXsGPlzaCAIgedaepJ5mDiJB+M0WN6S4uXSk6UkMLa4ljkTsuPM+SfIcKRxhc
 rfyuPlsi9FOFlzq36L2ETRINx/tfTMNf0mlixfUnz2NAfQ/ugAXmEJwAfSbruIIX3MA/nx4VHZg
 B7/d2EwWBD+ptGK7XEqW/1nZBe01ayjsSIdmfaX34zNqWlYXeXwTqf401ZWTW67Pphka2GuRF46
 MFE7CAbk1bxeQoc2C+AKkegNx3OSfNT1zoh/LGc85hXtFuS/Wh8Ak5nhtsk2Dt0JGM0MUwb+SFt
 +wei6RgRbwyD0iEU7oICg3DFsOUpZHdSw/vCPAn1eHKFkwtl2D6a7rswce2eDksx22e2Ox4mrUY
 M+PqfI/N
X-Proofpoint-GUID: laeY9qMYgZjgGPBa1KBhakRW3FwBBDWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Tue, Sep 16, 2025 at 04:16:55PM +0530, Wasim Nazir wrote:
> From: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
> Enable the Iris video codec accelerator on the Lemans EVK board
> and reference the appropriate firmware required for its operation.
> This allows hardware-accelerated video encoding and decoding using
> the Iris codec engine.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

