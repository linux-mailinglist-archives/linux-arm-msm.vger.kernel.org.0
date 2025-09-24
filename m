Return-Path: <linux-arm-msm+bounces-74573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0CB995EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DE957AC353
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA1D2DC788;
	Wed, 24 Sep 2025 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBAbfrnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4C2D8DDF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708623; cv=none; b=L8ZPQBLBWY2LeACYJIno8DrRh/9/os8/oqBso1307d+dQIEPmgS8csQJUN1YdmTn1xt9BGNvRiFB8Bno/HcwzbVJjXpP34FhS2iiIoqQ3br0Awo7BO0m5iTekYk/r4Xg+WyXvP2tQqvVepdG1xQ4irPdlng148r826gGrS9HQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708623; c=relaxed/simple;
	bh=LfLQnQz1iqoAKVGoTv2Sh/lnQ6ZI88pIge7XwgLEMFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXzZqx29UigTYy8K07b5avxxmNzio9Gvci9spc9IBrQy7cMlblu/J8y767sgiOuoI+U/lIVNm9WN0lD9N/oX+OWyahQh053iIB1ZXKcyxX17IUgC/48Dmm7H0qPVr/Mn3ZyV2x1jI2VkcKV7fc9rZnTRQat96BxRWdUs5PZmSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBAbfrnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4in6D029044
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoIdzOROHIhVWzo1GAX0DgD5w+s+U15l/MAF+x1560I=; b=WBAbfrndT8Te4p6v
	l2Bk6k/oKlHq9CiJkOMQbqyYXBAByz5m268wZcdafO63LJXRod7OwJnIuK50Ix3p
	RoZKJ1whFLJh//H1s0X62p2kkPhVYUMBzheuDnKgivyELGGUZ6AwKINhCM8aqmij
	FTEG1e9EJ/EaZcqpOdRPkDVwUgy10kn6Qje1eBmX9TXBwVrqkhrMIpAd/Pn3H9t2
	PyfMOukzWuwsJVfat4g3lWWYVNNYw69//qznxgw5ps7CqkFHouTvLZ9b8EN3ugTr
	N0MvCuy2Hv+k9Vbo5pnAugRXi5uBwtnp0tUNv4k91EXQm5C03W/X1cDnBbguU1jy
	8IgMtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnv81x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c39b8cb20fso24348701cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 03:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758708615; x=1759313415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoIdzOROHIhVWzo1GAX0DgD5w+s+U15l/MAF+x1560I=;
        b=OB19u9s+z6XQGWKU7ctBkX16n1w+LESTAd3XXFD4MBqKkRrxJMQiih19Kyc3MAZMr0
         BVmTneDaDYl3iI63GrIfBE/SUp76FfHt9K0kvnf52QNd7D+8aVSeCTXiNBoz7on9WOyJ
         oPKFofv3vNLeueFSowFE0zC+0Ifzv9E2RwEcNOVFZdM1m24EMR/Mx/u7OKlY10rYOMus
         1g2V+pfPnJEGiNokeeuufyhr43/k4vf383IXL8oH2AoLsU+CYzo3oXyjC70uVJi2K35W
         aI3/0s3kKbdwHMPMoMiZCaEuIOACV872ZjgKJIsfq2q966CkxELBW13VfM9s0w8hIpUB
         1u3Q==
X-Gm-Message-State: AOJu0Ywh56gfmd9el0y+VBg+X6G4rYSBRLbPDBl2XLOPrJtAnZtFs/4P
	exKwmSVT1bEFa/2q6wxu112YIq8GylYgyH7b2VL5sC0Q/D3Zxu3L/wrDzSz6iwNT0mqWMLYjict
	jf6tAI9Tq74kMVDuEn6L+zUSPCqIkVUcZH64JrcInWRzrB7lebRlQJkJPlwP2Jl3IDZM3
X-Gm-Gg: ASbGncsxZ0eXmAw8gcZb4zntTIn7r60uueodRmg0R6arOcMj3e8d2PBdpqmOUhFipQB
	6G8d/Qd1dB33AhWjsnrI6xvHyypxXx5QtYSuGsobLbeoMQetcxqXCIM1zK9mIUHrxfwVfAkLDEO
	9427KaAJ6s0HQhD1zgW0Futo39ImSDIbVmbpv39mj5IJ8CTemoWZIqfagKzPJuV5MCSVVd0okKa
	zfTxu2Nw/r7s0QgrjimziWb0A+v61KB/U5M330W3+sW86/MYIosAdXqjPtAA5U1QFhGexk5lFTl
	CSKQwNHNf8Utnms/S+cUIpYN7KsukJNbn7/pbwOspdBysPUGA/UJhjfLiZ+sijdmJuiQ34xSwIZ
	xPTMDxMzYzICTwiBL4EY1/Q==
X-Received: by 2002:ad4:5f0c:0:b0:794:3dd3:a98f with SMTP id 6a1803df08f44-7e6fe4d5873mr46466026d6.1.1758708614506;
        Wed, 24 Sep 2025 03:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEer+yy8B4QW1rxsSNv+lBdFXhQg8TVeqGVwOyikhVt6nHECKjEa80EcAHvybE3COIE+zeLA==
X-Received: by 2002:ad4:5f0c:0:b0:794:3dd3:a98f with SMTP id 6a1803df08f44-7e6fe4d5873mr46465836d6.1.1758708613930;
        Wed, 24 Sep 2025 03:10:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f42d3csm12390185a12.51.2025.09.24.03.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:10:13 -0700 (PDT)
Message-ID: <b17e95af-0fd4-450a-85ce-5e3ba1e9891b@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:10:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: rename qcs8300 to monaco
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <20250923-rename-dts-v1-1-21888b68c781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250923-rename-dts-v1-1-21888b68c781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3c387 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2a2SA1_c7obCbjsyrsMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: McIgPgmINdc1FLX58juI5QZd_TTwm60Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXxgSkFzNxW9Cq
 Eo+3EVkWvcjMYx6kszSa62aEdEUd3mk1CpFfUomHbTEcx1ZIAAXsfKWE3lF3VNE9Esegr0QrS8e
 Tkt092y9DVwbh1fK5xmrrnM9xH1CbXRakrxSOta8l0V0Nmd6/VX6QOmUEEvEu87gDJJNTHVsn13
 WAQm3OicCx8KVf16f1RSABhQAyIn+D6kVAAPCspDlOqpiRIuMdJh1Y2M7rjNOO1hHGa50nJujoX
 9r0Dhq/exy9ThH4mqPi2xO3D6+tBHjoP2rEFdBfmpt5uWK0IrdlF0zZP/YDJk1Ibyur5httE+DC
 RK1T8jXOkkprVoh5Q3o0diNvabometaduHcqxZwgK9fmctof1dozID90wY1bCvR5YgpuUZOrlqB
 xUx2OFfi
X-Proofpoint-GUID: McIgPgmINdc1FLX58juI5QZd_TTwm60Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/23/25 1:01 PM, Dmitry Baryshkov wrote:
> The QCS8300 and QCS8275 are two variants of the same die with no
> difference visible to the Linux kernel, which are collectively named as
> 'monaco'. Rather than trying to using the name, which is not always
> relevant, follow the example of 'lemans' and rename qcs8300.dtsi to
> monaco.dtsi (and qcs8300-pmics.dtsi to monaco-pmics.dtsi).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

