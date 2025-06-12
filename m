Return-Path: <linux-arm-msm+bounces-61138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5CAD78A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 19:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E7397AE487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 17:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD56129B790;
	Thu, 12 Jun 2025 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfVLnwJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D323BCED
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748013; cv=none; b=qOcv0igpwvdIEfEzaKJ68nN00DMZB/wkcbrZxTWvNxfnkoG//yiUH2+yJZ7+nxZoUAsinC8kJ+AgdcPEDHZzEkOZJOQra8hM1Nnt2Ayl6OaK76sLFqhiDQl9/sJCQJq3Gyk7DSCceF2dxEmkpAkosttXmgDZatWoiLDmRCveRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748013; c=relaxed/simple;
	bh=TC+OdAXhGoMZG6SvmmASRYnqvkbHKHrlXYVoGxDrKac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II19CtTb0Rpd1QXd9pSqiLI/k2inhdxNQjXpTX8AUzFrcAbnEV49yQXmOFEier6U0FkatLcjCwpXnxpOipT2GK/D+b0DSP++op48Zrxu5bIs9aMtK/IKHH8o++7etDZTn9c3go0OCDnrgugXUy5DJ0VwJGgHF3fCKKb9KOr/kNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfVLnwJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCe1r2023383
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/F9DH13AExJPe3SmFcpjEpcSWprJ1OtQ4zge43iQr0=; b=YfVLnwJ/2cuMQ0xS
	3hRoocw3/7be204I+4jeZ8T88fUBEEBCFCd7wzBRMgMfPsoFc+C77dBvz0hWXldH
	hV9CHTzS23bJI14nggxxgwSHQU8HzIAVWi9VIssfXyszGmvJYRPO9Kcl88AKa5X6
	8mmG7RlmRIppDFy281V6EzPhg1GKqnLJYSQxzoMG+Hnsfz3w8GpvKDgiMWl3xPGc
	Ngbc6m67yTdNzmUsSxM3yHzqQOheRgOsRN5KzogOGbsTB/aQDEoRhRipN7sTijyq
	4+acEeDQs31mf96eNdQILUiP4qJ/2HgRPkmJe9cfogD+OqnRyVfJv6B59SC0isYj
	X0rizQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477y3grs0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:06:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso21902385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748009; x=1750352809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/F9DH13AExJPe3SmFcpjEpcSWprJ1OtQ4zge43iQr0=;
        b=uQTP58vgbtgpI5rqTXuDhMIx3DyJt1FngnYXYz7pU5vDU0k5N6lsUre5l8tAALL0cR
         TZIizyETX5LuRojwEsZQxtmVW/YywZCnwt2JvD5RZXOSpbcm7vPdCS/yts3GI5bRB/PW
         opiDTAMAX2EY3dNFjPecbpik7W27qKihq9GWb6x5RFvkEo1fupf3GWfd7TzHAV6JDDgC
         vyg/QEP90jT6H96wECDjEGEkyX0p2fqL/yogAjjGtAxjOB9V9rSmPAE01vNBjk0R+3mU
         gr57vhlRMXyiNQP4XOiVpjTdI/jNFIntOZnqUWyirlqOdmV1rPSTuvIHwG7DzxalLq0B
         eZNA==
X-Gm-Message-State: AOJu0Yx60F1Y2STCLcnAOVmb7I4/40bYAeqQdqsW6+3u9XvL7UoaIxkk
	6hWF74/Ukt821ZXRrQGt2qmOPplk7vuREHvfgCOo75HyfUnlKeSuI6e4BvTLnZT74MlPx1mCkRs
	Q6bR//I9yfqpNL6LF1qxh4K6dmxNzDQN7dfzNmTklFfssNWyGOAwpZycdN09Fvc7/fhxh
X-Gm-Gg: ASbGncvsvxWG11LEEfs4JGsR9XEvWsDbl6yplLMnUMLDY33jc+OC2oAm1YkoKTeaIQE
	LXiX6/+vCj/vzyo+uonK/tWgRsR/0OX4sl1LV/29fKIe439y1/+/wPdR6075HDKL43agWVXn9Sv
	zqsRgZLy37StMDcgIsqILamAwuueT5svSmZLih9yaec80hUkVL5Tht//LjpkjUoUVfKA/IzMRbg
	iSM22rAyKv+GoGe+zVUWCpr9/pzLXZ6my6r2a7TpCFo3XwYsjYee0BOaD7zN0O6qswMaX6mqNMg
	Ph3/dgFWCyN6SRuUQq3829HGhmB0DjzWp/V09By43W0ZaVTsFYxgmNAhuyXweFhBjHhvjRFWgy+
	rFGQ=
X-Received: by 2002:a05:620a:6008:b0:7d0:99dc:d027 with SMTP id af79cd13be357-7d3bc44b583mr3224485a.6.1749748009048;
        Thu, 12 Jun 2025 10:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENJW6VHvwcvJhbYXcOXbguZrhWncdGYuUMo8aTu0ygAXzgLYZHTyZcyt0MfTt8BprUf2jNDQ==
X-Received: by 2002:a05:620a:6008:b0:7d0:99dc:d027 with SMTP id af79cd13be357-7d3bc44b583mr3222585a.6.1749748008623;
        Thu, 12 Jun 2025 10:06:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb22acesm163057366b.103.2025.06.12.10.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:06:48 -0700 (PDT)
Message-ID: <c29e80b2-4b15-4823-9821-137a9208f632@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 19:06:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-ipq5018-tsens-v13-0-a210f3683240@outlook.com>
 <20250612-ipq5018-tsens-v13-2-a210f3683240@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-ipq5018-tsens-v13-2-a210f3683240@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qAKZOR9Qkrt6LTXOlXgiww3HtLDu51dS
X-Proofpoint-ORIG-GUID: qAKZOR9Qkrt6LTXOlXgiww3HtLDu51dS
X-Authority-Analysis: v=2.4 cv=DPqP4zNb c=1 sm=1 tr=0 ts=684b092a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=p8e7PeVTpa6WA4hJRsUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMCBTYWx0ZWRfX0c6RbyKLehTS
 62ZqoKiYu1h6wVLFdoqV4ZKBNQ7nFOk+xnLPG+wXNutn3MIev4aBHQrZ/ukNpa+bZ4qpNVv9+Wb
 1xx8Ne0dL8hMdug77wa011xGp5vsFT6UdhZK6BE2cJp+CqIX7sfhpd7SgaLVQnz6Ku2gxwKYFvl
 p5/jvIR1egGnKOKr2hHZ1u87pDyMzZNtxFa0vqr70juKPy1bnPmEGwFlrI7cvEyMCZSeNMREirT
 bzsRebSVdjhd5+ujwi4jXTpFbAuapnajwrmwydFP7DWAD985MzB/64XhUHBQ4RjsS+oPCi5ZWK9
 Bd2MoirIvA0HsQ8Tjd9Fg6bVsmsaWo6iAu5Nsg7dQki4QboHhnIX+Tbewx255n/H1xO6e386miE
 6FZ04LPUlURkRSUOKUISVdcyuVwy0M42NLC7KTUWzRs/TjZET2vuIgTXAWiUplO+nZe6JOFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120130

On 6/12/25 8:46 AM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). The critical trip
> temperature is set to 120'C with an action to reboot.
> 
> In addition, adding a cooling device to the CPU thermal zone which uses
> CPU frequency scaling.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

