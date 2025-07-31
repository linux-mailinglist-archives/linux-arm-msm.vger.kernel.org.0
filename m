Return-Path: <linux-arm-msm+bounces-67238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEEB16EA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5278C188F7D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DF12BDC10;
	Thu, 31 Jul 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDQcV5lV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD052BDC05
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954154; cv=none; b=sE+aXERMbEdeElBy7Jz2oZnTefsRRygb7tmgYWs/sIfNG775B7JELRrR82Mo3CIo+1JFlmkMObvGiDZgBIcAdS+KCuRgmg2v2NfwMBetqbsRLKu5uwiPNBOIS7N6A0UbOoxMFJkWskYqOZqZLRGDBHIMQShTabsMpAdZT0q3tCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954154; c=relaxed/simple;
	bh=IHZPKmlLSjGv/zKudIVvIceDqYAgwKFyLeVTCMSAGSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzYuHY71UMVXu51BngDvwv0zYD3Ib0P1ahEeJx/ItvV1Ee8Az6h5rO9bwlyrtvjbsTDwrkgiTksdyeEIQ00EEahVxqY+z6FxNvkwoq9N7uk+z8OEFB/7xp8qk/uMqceaCEwJ+TVPiOYZDvU7gK/yeOq4yrFBhnePDsZBXQvj8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDQcV5lV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fWVf003464
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR8kXmM+AcqdH9Nrt5k/6nLes+0FjxEWYyYuuWpZ7p0=; b=TDQcV5lVxg2CDFDR
	qklycQm2MIS+Tlyl3kfmjDSWsLc+Hfm3d2vfC6mPMIUY9szgBk3Rkf0YgcvG/MDQ
	bkRo5ppsTgZEZmp3kIJb6YAvORTc6FR4YuxXPhfmWjV4WLvXs2cEUwGicvHqNabE
	tF+gz8swVbzoC2X6A3DlMlB8QpqTxZb5vOw3oo46QB10csw+1RFx3BjvAKC/YTB3
	rV+86qZ+vw6Kw5THagFyQ/HD8OTm7T7g7B5I29AzZzdlfqiqkA6iGpBtZ+ZnQ00g
	7eyIa6IztPjxQdjvzfbA32YhJipcc3QpXy3hYmIjPqNs68wo2yRPgxSS1bcIlQlN
	WuA6AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgbm42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:29:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e686981baaso1886185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 02:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954151; x=1754558951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AR8kXmM+AcqdH9Nrt5k/6nLes+0FjxEWYyYuuWpZ7p0=;
        b=AERxt00De3q3Xh1fkdL5GQMViShyZMlwNFuKwv324nAR41JbXJZDsjAGk0H/lrzZVd
         4TSPpIvD+vRcAQ1G/thfq9lVXw66HZsz/MIxBbVx563xFbeBv0dwIarEI1P9H39TjHaI
         3ui8xHpD5a+IGtM5L2Xe6xEGfucfUiXwidp+3X2RFrO61l1E9ZEpRODqV73MhxyhYJNj
         IcQM1/+ECnscbN2su8z/grH7X7CZX27Ba0I3umuBRndwQu025dUs0dpONPWzifLVInvu
         4//3KFhtASya8Wg6zNj4HAdlSBNG1rywhOPCUeOZL8aT5YRI+JtBvfxK5/4s8dXWmjy9
         oLow==
X-Forwarded-Encrypted: i=1; AJvYcCUq6jJ4OiGkFrQI+2uqAD6IfHIRTrjx7tT+241oeds7xeXPi3r7IpRJYfIrbSvN/H7I/M1HOy89Lsu2qiyA@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/9lBs83ecaMMOgDoTwYWLgCsuAM9hhTW+jiQw7f4ehmMTeWU
	/sDVPC0dmkFFtkZ68zmGe4xO2pBcro74Z58Y0F6547wCVoxU4j9k2P/I1kgVeoUCORcLxw7I2iq
	hy0odFqSXXxJ5ggsfSKEB4kfi0XfHS+YbeXgBxMu4t9TIccjx23a6+z63JoFDz/Q74u0q
X-Gm-Gg: ASbGncuOQN+jxJhAAQdwjDAt9d/klyGDLi73HYdNDaNP5hMU9473QpAYSAXUUzxUJss
	s1nPS3aiacIEppXkg4KB1gy8lr8/wHidVUvQ/TY/9nTzjTKPtuLTzfmioTpRXkQZ0mj3+Et6sBG
	EqmTsp8InBamV1QblamDs1tw6rO71BPXMNdGSQ3XDhlDkMXQ0tS4EHZoeCE6HLk6edsmtTV/VtB
	K8OreVnB9i0q68vNfTWgvNOBx6ERE7hiAzXkOiLNlIqQQRis5CSYohzVR344WEiluXD56FLXQeh
	0OfVryhRAH6Y4lLV0DzKHi2zl7Yefu8qd+jUTJZobIyGYdm5YD+doptRbRVtBdh0ph7I+BrUnoT
	b+a1yDdEgNSAYj1I4sg==
X-Received: by 2002:a05:620a:7017:b0:7df:d668:22ff with SMTP id af79cd13be357-7e66ef8c17bmr402827985a.4.1753954150708;
        Thu, 31 Jul 2025 02:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5EIEHBxAx/av6/EVl2n7Bd7mjdXoZdNNVoslRFzMEMPHOc15syfWHOkCpZhXmfqN651UxUA==
X-Received: by 2002:a05:620a:7017:b0:7df:d668:22ff with SMTP id af79cd13be357-7e66ef8c17bmr402826085a.4.1753954150222;
        Thu, 31 Jul 2025 02:29:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0771c7sm79029166b.26.2025.07.31.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:29:09 -0700 (PDT)
Message-ID: <17f19573-d304-4f45-8611-b62a032f33cf@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-2-df24896cbb26@quicinc.com>
 <ff6eee04-d191-4dfb-82e5-7e3a6c896025@oss.qualcomm.com>
 <d11496a2-5a43-4b6b-9a8a-d8e05a89587a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d11496a2-5a43-4b6b-9a8a-d8e05a89587a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688b3768 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=1f7UYZhOQBCSuS8GvGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ezm2glloGzQL8xR88Az0kekMxOqqSqDh
X-Proofpoint-GUID: Ezm2glloGzQL8xR88Az0kekMxOqqSqDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2NCBTYWx0ZWRfX3pcRiNqVoQBC
 u6hcaE82cA10awHj7ZyupOxvNI93/JN1TVNqea93Q5+Z5PPuywwwAWKL5w22CVEpKFZEv3e8y8w
 EqeLVRVcbwEtd9PTMzLPC8R4TLiuLKkkE3r9kWfdCgNmRqT+o5IB48T+mE+8jA1VmiOYR+RRJVX
 S/wnvGpMuFQXjQ1Cb1dADj6gJ77/IM4jf3Q6f4xRajrPsv/XrOV+p2o0tpIlmNX5iDNq1XjIaxu
 I4+7pU32BqN5RaEKB22/dYJHZGOKjFYFZiqJcH1wix+qAvaQwtUFRVyNlMBxjrEgImtIu6KYVvH
 abkrbYnJ9UqSBGkRMz00QKZjKCjdqx+H/Sx3LO4Y5fhvdljIvjQXJoW3XXaUTH9/FyL3I7RC6ER
 33tC/RLIr9o6prww/Bq6qrtzwGRMojpR0mxGow52N/aoWZqEltWqVof8eqD7ImEVfBZkQBfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310064

On 7/30/25 6:10 PM, Akhil P Oommen wrote:
> On 7/30/2025 7:07 PM, Konrad Dybcio wrote:
>> On 7/2/25 11:13 AM, Taniya Das wrote:
>>> Add support for video, camera, display and gpu clock controller nodes
>>> for QCS615 platform.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>
>> Bjorn mentioned offline that these controllers should
>> probably have power-domains attached to them (perhaps bar
>> GPU_CC, that's under discussion..)
> 
> QCS615 has an rgmu which doesn't manage gpucc. So this is a different
> case from the other discussion. Are we talking about scaling mx and cx
> rail while setting clk rate? Downstream clk driver does that on behalf
> of the clients. I suppose you are not talking about that here.

This is also relevant, as pmdomain states are propagated up the
tree, e.g. if we have:

usb@foobar {
	...
	power-domains = <&gcc USB30_GDSC>;
};

when someone calls dev_pm_opp_set_level() (or something equivalent like
dev_pm_opp_set_rate() with required-opps defined in the table), it
will set the performance state of the GDSC (which is a NOP for the GDSC
itself), but if we have this hunk:

gcc@feedbeef {
	...
	power-domains = <&rpmhpd RPMHPD_CX>;
};

RPMHPD_CX will be declared as a parent of all GCC GDSCs and its state
will be altered too. See:

drivers/pmdomain/core.c : _genpd_set_performance_state()


TLDR: clients are responsible for ensuring vdd_levels are set

Konrad

