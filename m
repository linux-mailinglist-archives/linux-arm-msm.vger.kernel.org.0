Return-Path: <linux-arm-msm+bounces-71998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B454CB43616
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A003F188F2CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB702C21D4;
	Thu,  4 Sep 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRR9JaMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D72C08D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975244; cv=none; b=Dg8QCtkE5JCETKS8cKnGO/o+V+cuLZzkJAzMiE7GR6ZDWTkSKSO4XE9ZehmvTi5yh4wt+7eWjSAWJLrMSgw2W0x3o08dEce6iNlejh9NEHo5riGXFDAJ0IyvVoMAYG1AfiT6v2F27MX2AkpuGDSSLWLhkGr+hYLU75Zb4Rg07+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975244; c=relaxed/simple;
	bh=NkmDNo8VPDtMikBhpQmfI7PvvoyGiT1t1uBLOq/33TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgZ86FDCOluksEGlCHQTSh6RjIpdfP/7uocOkHKRj919gWkqati6pRrABnnzxP+3sJgA15wyisf9yvlWT1xIste8ytBy4nd8OtKjofZ6sHqetSWOe55zNUmjP+XkEfJ4A+pvTDtCGwL0SepUgPvGOqL5WafuGcZkyyodZ0JWDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRR9JaMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840YXRC005254
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 08:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4P4Vpckc6QJ4OtjBhntsKaQJGflNRN1gBEgtyUv9mg=; b=mRR9JaMuBjiUkIC5
	iZv+AUF4xoQaK0bIgVVycAebuDTEGGDgdDyuqPmDKKLYYJ8B78r4q6ssMhNqnMPV
	2jYEFJPPg3LQ6ssw2So1aaI753Fwx+D/7ViUVzSTtCHOYbVbWn0BhcWDJAutNj+c
	ywOFwv/BkFGyoiTfMa/DtVhilXvtcF+gqkWgO+LpZH29LhsF2pOEc36CHwgozXcE
	tCQ9WDsm1O8u1+8ws28m6SQPQ6JB0qF0YfcmdsKVV+2V83au334aHNgepId9JerW
	af1krn3OwbAcdfftxQcTqpP/44LwfBJmUZW6BCi3oVLqPeMiLIhJiJGEzihdzVhW
	Fg4LUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpsbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:40:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b331150323so1860721cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975240; x=1757580040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4P4Vpckc6QJ4OtjBhntsKaQJGflNRN1gBEgtyUv9mg=;
        b=T2AY6skbtuRIGfOUgtQ7FPrVM1RyTixSnJjbKWLsyzWWN0ndneIYAaDW1DFqGp64XR
         krKc2yUz48epr4Svl/Hw0H0UOY47JGrTiOjRaS3rZxsC7uAtkM/3xoNsDO2CrGr0RIgH
         I4T6xpzbmAl964xcgi0wPBlcPPgs1omKG8FmLdM4En4Nfx3NAx6C8WKSlT0Q+LRNN+LN
         XNZ78EqhaR6P7SVNtrxEHesAYQYh21u+nnNGj5mXIkvP7aoodrjqWlUpuGbnyz8sxuIL
         fX+s/qDzDnGYSBYNCFbn7HJ7CFUP4unFE00Gbp3LfIJAiiK80CS1opZKU0J0doO5zCNg
         dmsg==
X-Forwarded-Encrypted: i=1; AJvYcCW9uUnKu8kyKtz4NLg1lJhoFs+ph+EqwGgmuibmdf+SYYsgsfFhnilXmRLz+2SpQ6Ra4AS3MD58FpyEw4Tm@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNcL66FRS3LpxGNop2MBg3jNiBjFZNxSGxhYXc5ALTm5785tU
	0iK/ONmEJD1B7Un/HzVfLnDbhjpjmNnLfJbM3OCQiWhBc776vniRFahVmJ4S9J1BJyuGKkDEnle
	+N7JgSMJUDQak+XmIMJi/xMLDSADAkvydsXOelDP2bQyR3HwdLpC5avETuldOoimwj5YtSKL0j5
	cI
X-Gm-Gg: ASbGncuPIl7Q4lr3XVaMA8kZ4ZpfhCN5Ik49pu5/czFGoRXPQxq1slH/SgoW+5CS/y4
	PImP1l5DSVf9z+l36i0YqDAtO4f5DzOKVdy0apVn3683VZ7cHUSr0SqZlswkyaCZoEu7vqbGJvg
	4hceImnuOnsb24GIMzEjulICUE0+in1JhpfVdy56UZWUPDbhMEYidD/vICcHvrElxm2T5eX4a4W
	tgLXrTCcxgJI2PcxJ8YVHPPOjo7WajBauM3snmYgtqDp1Ph/qcENQHp2CX4hwD1I8nbmqp9fCMF
	JgZfLZtWS3vQiHrkdQno7KzEgK57XeuR695hx5kFLvN5KPZ4EmSODryk6BLRJqcHElDdBsSM8tz
	mnfThLxHM624RMoWYIcBZWQ==
X-Received: by 2002:a05:622a:349:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b30e9a9735mr176386811cf.11.1756975240513;
        Thu, 04 Sep 2025 01:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3LGMrSU/BytfgHKLmHyXhzao5cramuAbvzO2C5SkqEfzxhB2VBfo0CX0aTEn069I0+lokrA==
X-Received: by 2002:a05:622a:349:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b30e9a9735mr176386541cf.11.1756975239917;
        Thu, 04 Sep 2025 01:40:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0431832a98sm886966366b.80.2025.09.04.01.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:40:39 -0700 (PDT)
Message-ID: <34d9e8eb-e0f4-47e9-a731-fe50e932fea1@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add missing TCSR refclk to the
 DP PHYs
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-3-d88c1b0cdc1b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-phy-qcom-edp-add-missing-refclk-v2-3-d88c1b0cdc1b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b95089 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=LkxnY9FmGKG3Lg6D2dsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: z76vHESmZ2MXdOX1N_tsCimAEH6-CQw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX18OrH4DaVzOg
 LMWQBzV+Ozc0j8faJ6WfMjQOL9TXTil+rBVeBw60fWJ5eIQer7eGlJXlM2oqcZfjkd14q/6Jdky
 1218k52RQTARCf7Gl5k+gAgqz3oldimvAR5edYRNxNcRZZt6VyYYzD6eMqHocgK85O2MNbDzI7M
 aFs15oPeQGfPOmIbbFFn5k+A7VyScMsQMi/D7xDV3KPLV2t1QJPhzQgxAISi2GoFHrw85n4iGyK
 myEOx9BX0OIyBIEGPauWtISosAuuMvdZvWhKsmu3dASdL85O5zWuo00TqRLfJId7D/ll9josgqL
 5/rOW9S491AO0yuZrTiW1Dl9HCnOd5NUO424tYh+VzkasZQkbxYCbG557BD+PKSacLXHkpXJHF2
 BIbmP/Iy
X-Proofpoint-ORIG-GUID: z76vHESmZ2MXdOX1N_tsCimAEH6-CQw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/3/25 2:37 PM, Abel Vesa wrote:
> The DP PHYs on X1E80100 need the refclk which is provided
> by the TCSR CC. So add it to the PHYs.
> 
> Cc: stable@vger.kernel.org # v6.9

You want to backport this to 6.9, but you also want to backport
the driver patch to 6.10, "meh"

I'm not sure it makes sense to backport functionally, as this would
only exhibit issues if:

a) the UEFI did no work to enable the refclk
or:
b) unused cleanup would happen

but the board would not survive booting with b) in v6.9, at least
it wouldn't have display  - see Commit b60521eff227 ("clk: qcom:
gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK")

and a) is not something we'd hit on any of the upstream-supported
targets

Konrad

