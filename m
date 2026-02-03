Return-Path: <linux-arm-msm+bounces-91629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBAdK9W6gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:07:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AED6926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9F2C3021F51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5BB395DB7;
	Tue,  3 Feb 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nN4n160/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRyIGOJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EC63B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109650; cv=none; b=FZHP/Xy+ll4rlrUeO1VdRobfTKcc/c9xe+R1zGQZHRuIkAp39qxXeZH2BuTvI5FvQDmfBa2BhIXcSxVXcAZ63UDgaT/jxdm04JB9WaJdtSTH+evDe2w2o14nv1frbDBu2u2lf7NMAsViicm1VjXQWwfg2o41VXXuGiEpYUd5+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109650; c=relaxed/simple;
	bh=r7zBYTBwI/33M4f7vzrEMy0LPJOX7EFtuoJ8V6TwbTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sksOgLbLEGFR12OLnqs0qF4C+nPqaUDvu7D3QCahDyCmAN5BZO/2rpkOo05ayzTnXdWQ9LyPjfW0g4Cf6wdPWkNGSoA+obb3qeoZS7Jjlsn3AcVETI0NhWIUWq7OQ4QdhhN2NeMZWskC1QqqTMQcxjdzn/E4NzHADMOl/8tcMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nN4n160/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRyIGOJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136REaS278058
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=; b=nN4n160/dKBL0mzT
	LZOmEfDBC9mI5s+KCqHbYy7k9Ud8OGnovFfAeQVQuoofwILVToCBFkb6Bw1kcnpG
	mLwNq0bbvtTs1hEjRd84gmWsj0wzOKOTzW+qT23b5+1cBYlxW+zk8M/7xKC2SNDt
	1naPjJFy2R/6cyHe9/JzmciMLdH/3ktuRmOBqRhvZUHXDg4oIr/Xe+E1tmZphRnn
	bLRN1ssjO4LJR5LPkX7rf8PTH9+CPwULLU1bvyMC9lN/bU7WNEfv252eJlEX8IFp
	tmSE2iXvAGa0oQnXup9Mnd8ZP6zPH07u9BOkXXIBwkajlFQC8Ka1uJ2mug3xZv4/
	9p3MOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3a089-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:07:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8f8c81d02so28063615ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109648; x=1770714448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=BRyIGOJxODAr1Qds28i2KJ8BNZVL3s57bGDf1AEkcloQxweMcTYWgNL0/gnpUt2pYj
         5uP7Vkf4Q/Nl+QGuVniUx3GPtvvyaEzguYNR1hNu0moUA48D0tnL1QN+sE7eeFc3iDJ1
         MpdYshADh7rtRlTGRe75nQpmGCkGKBxJ/Nn3hxsYchNpoVA5IlMnXeMXOUE5yAzjZkrZ
         0DM2hDzmr5EB0QquvKJI2sxYO5JDudqPMhiT2vzaaHFrO2jagPB0d+6swRStKFzAuxzp
         v3UmkrZ0rn0ZRbAHnX4IA29s3log6fvhMNSFhlmMSuK26ppG+PFx5BW++Ah/SR1LT4nT
         0kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109648; x=1770714448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=DyhDHvq62FWfAIN1+tIa0mYFgXVNbaITyU8thsWl5y/imfAQQ3VSHe3bOoa01gEx7u
         o/yrZHpOr75FHod+WUEBn/bG/2vp3ln9GNv1PJ15b4AVOWKzFjzkp/i4D4AHOmu40Iqk
         KF6IetSWm2YzirRnriwhsCZxVKjivEt64/jAznNtG/kr8CEu1tm2T1sdMMdRVsEIKdMq
         K5Fs75MD9fkmJS8Hjp3ZDwkTYYPz4lsL2BUydQ5VDaCWMMduXvmrUpnIZTKE+At/Nqhm
         pv2i6ZXQQRUtORMdp3Qhp9QZERJvbk0/MAQQR61VKTz+kBLABqXJC9DfNbOyBPvnk6KW
         qtYg==
X-Gm-Message-State: AOJu0YxLXmtHDpsJc+IbtXwApSdCZ7iVwvgCtvJiYcv+Px92Z2MmYkVs
	y82EfffzaGu28Mx8JrnNdphk7EdQGHf5dOabBO7DZbjvRaYSs1t2u5jx7HGOwvvUCfKMERbsWhh
	fVKFHOwyYfvrEumcYfexjjumGCC9eAJjonw+Rndj+NLYgxwJQF8kNoSo7LpoMTzs8YI5Y
X-Gm-Gg: AZuq6aKwgLMVoCKI+wGz38ezttZE3bt4szTiENRIW0kksM2tw6yUm2BDqxUjl4QGK99
	klZ5ahzrPJLyimuCzaauJvd9mRFsO8cSfgDTDSFvxnTKtdEAxBzEVV9F06Jj73ZZAB7I0y3tPl6
	zOvz7Xtt4jVwghi123Z6PVvjWmq5ZisDBRQwgApqwwY1y/W8uxec1IhfYG61sS1eeoMqTg5cLJp
	SeHsOWOiEp/epvEMV1qPAjltzgRAuZtnKD7po37UgAsIbJa76Y2pfc0fNwZJim43tWGKnX1RQhd
	4kZvRNQypQ2E0B2HmTVCF19hORnvn8/4onumOSoza13QX5j15GgACE9DQ4lnGEZyQmaUaSar7QA
	B9uIgJKMRHEsp9Y+T2hvzZX91x3tvFmdAdQEnTC+oKTLA
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95175045ad.15.1770109648068;
        Tue, 03 Feb 2026 01:07:28 -0800 (PST)
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95174665ad.15.1770109647553;
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414071sm160847725ad.29.2026.02.03.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Message-ID: <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981bad0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 4-z5shjEKPaRbRwOlCIC6bIqiV7bqVr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfX5EqLbt+m2Sm9
 4OoIcrc0pMjdxMv1k8DK2R2YEXbTIMDNDPFwl5k0VwGdniFx5fxxBRW31R3914sXlZzh7pi1mpw
 WEN1nWaphAs9YmIbHAXZVxEQ3usCAHmTkMSg4NvLn0VU/wXEufaK/Rn5ca8iYdcq5qh3B7rpn0K
 b5ASBaS/3KH952jaaJourE4/Nchyf0+E0U8aHXlDUb2oxElSPvF7s3+hIZRZz/8gpDX3u/nxCzw
 ctihXMlu4lYopp1pQm8oieYAgYBQlgJh3n4xtEzXk1mxPG/xz3BXq4NAVw+1dxiNjDVkBVxcsy2
 7cSIvmLVzP/YbW8hRuBOzQc0T3/HCQ2EO/LaBPC+fzcAmQlvDO+QLS6wSaEDbKbIXSLSKGqfR+E
 yMPsDdg2keCj1hEfdd4oWiXpzoXHV9QrZ5smN+s+AZMRFlIEeq0Tty7g6mZtqEv2lIl6zEOsJm6
 wkN7rMNbv6uERTCqaWw==
X-Proofpoint-GUID: 4-z5shjEKPaRbRwOlCIC6bIqiV7bqVr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91629-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 503AED6926
X-Rspamd-Action: no action



On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..531470506809 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc MVS0C_GDSC>,
>  					<&videocc MVS0_GDSC>,
> -					<&rpmhpd RPMHPD_MX>;
> -			power-domain-names = "venus", "vcodec0", "mx";
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";
>  			operating-points-v2 = <&venus_opp_table>;
>  
>  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> @@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX for PLL to get voted to 720000000.

> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX

> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, SVS can only go upto 1066.

> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, which can go upto 1500.

Thanks,
Dikshita
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
> 

