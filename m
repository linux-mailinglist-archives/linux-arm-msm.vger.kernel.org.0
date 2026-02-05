Return-Path: <linux-arm-msm+bounces-91858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDXLFbQ/hGng1wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 07:59:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B62EF2EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 07:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3324C30058CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 06:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBD53563E0;
	Thu,  5 Feb 2026 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBigeP3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwapX/mO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852373559CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274735; cv=none; b=eByc3YqskPwurBBffO0pd5ZEmu1f8gOvHQqtolGj4rz+M+Ec9hnUbKaY6VeHB0+akqH7KDPM05wxwF45KgXpK5u4q65dpSKMcU0uj9p1SJ9STKMAESRnuGnU2y8czRtYhZ9jI5ATHBNpPcNEIdpc0t/RYArR6Daf1/t6ek03zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274735; c=relaxed/simple;
	bh=OsQd4OJxQCGkeIltL4axA1jAp30tN349xP7T+sKbOro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8HfUU+/YYyKgkPnN7eQBdS74CUMC7Ll6S0l40hurL9l37xgk9sNOm4S/AmwnRgvKMxFBALlKqC+4zzrPUNe5sAa7vq/A171PQWTrSE7JtxNVWAmhGuh7Q/t00Oo02eU8MG7Y2imbnjF/dxYw0hguJww11ICWsvTW1d2867EGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBigeP3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwapX/mO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dj2O3237223
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 06:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=; b=TBigeP3zNnx5XnAO
	K1k5XLjiMGNq9AWavQPALj4WrwRru2JuiGbv3mP3YVsiDKkCZnUoCwhrlSa3Kq+z
	/EFl4ftsE76iVVAZiLwpXcn+qzbLuhQBbgJgvatbAYlRsx14Jvv0NYBQvcOQE9aZ
	PUiSWJJ5XCukz5mik8RpPqcL14b2kiN1kldPgOWH0wBskA8k0X0Bq1t4i6MTeDrY
	L4cjT1coVUbiq8Ijlj9e2gJPoDMyupM/LarMwLgjzLVCDJHou2TufjGeyluEi8xU
	42d8hEHJ0ZcH0Tj9EpM+Q5o2qhTZ6cUk3tOCsto2giz6ApE/7OhZDdMGntj8nIUL
	27nS0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51jft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 06:58:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3c36dd2cso610294b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 22:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770274734; x=1770879534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=ZwapX/mOirU5dGAMAz/IUyTvWV6EX0qxNdac/oRxn04toofatPHqvj/eXUBS3XK0PH
         L61jDd4AEqVu5tufsbFa6EsRMTL5genGm05SaT5FOnQBDDOVP8VgFN1qyzSOAvwQfMUv
         /ByeWOxBPF3TP1M6y2EpIlMg9Sfsf29fWKgtX3HG9ETJBwz7gVRkV7swpUz8IAGuRyuF
         +nG9nPVCJeBT5FrM5eADEm8O+ZkvWAM1e2Fxe3oh1gZ6LzLQzd/5T0NIdxvrVwNEyu7m
         EQqPVAmRBitL1dwbbaErVTpVd1JkmGappDpDhWi5J3ohALwnvOBwra4/rFaEH4TSPJNp
         eHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274734; x=1770879534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=LtdbP3WsobVy5bGSi14a9iECRxtM6Qt4ATLUfszGGB7woaNJ5bS8Tesu8dcN9g1YkC
         JEt/aclSm1gkcK4tnsS6HAfs01onFzm8UYmocAY+iLVRGnnn06WOCy/LzOcagJvyU8Qj
         ru44uuc2bJKALwpbZFlV4uFDcAfM6V73k9C1b46WzNWo5A1TsJm6GZ3lJJLTlrJIRSIb
         41RKUPg2pOy/QuZzXEl6VvlfNH8qIKLXvPYnBtfhOqzpdRRMyfxm3hUBtY78N5V/Crg+
         5JiPpprTcizJzF0gQaa3jZ/ElukjIjr9a5W3ZUtJTtGgN7YesmznpEq8+q2pmqppEjqM
         O83A==
X-Gm-Message-State: AOJu0YzsaJk6l+hae5+nl2KIJ1gFFp7biSzb76FLfVQu7PAQ8T3x9ioQ
	5qDMr2vcXlFFJLtmVk2IeZGqNsgyQz7gDIyGpxuJJNVXzaCOeWIAmuhVlfWPfKo8BQHo654CkQD
	A4jbsKnuKHNzBbbbVgIyFC0Wo0OXEWRCNai6mKB/pnX3T2qCK8orRhV5o8ljGUr6sGj2I
X-Gm-Gg: AZuq6aJCQ5UzZ6m512PnNcGhiFpjb6mS1DrIsaQ4DWTl8X251OUdiLz1Qu5pC7HwMe2
	K+Bz9ceYGrb7uwE6UVESm4e6mYjrgNWUIqRsWB7AHHLbsgmSMG2tp9JWYzC30ggkaf5XuznZstU
	dsPqQJvuLCUgeHi4MovHiSzBicqeQ/e9qj5W/KrtuD5rHuV+A3lY+eqkEe+/WxIHyI3BjVogLFC
	OPEVNEfY+PxqVOh3jvLTEiQ934ugiuT2gK47cQgu9r+/RNGUSgEND3DHOfT0URSgAy7M6p+ulVr
	60lvAW4RFTKKEXFYWfIJ4Oqlod8GW4S2dhK0AxCv9pnv5v7bfN/NYETAw7UORARV427pxf8UZUd
	9TXNSmf28B7oBcUgdYj92xCju2ZK8vCD7uYUB/m8Yl+QFfg==
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281568b3a.10.1770274734034;
        Wed, 04 Feb 2026 22:58:54 -0800 (PST)
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281523b3a.10.1770274733498;
        Wed, 04 Feb 2026 22:58:53 -0800 (PST)
Received: from [10.204.101.146] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163865sm5163450b3a.9.2026.02.04.22.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 22:58:52 -0800 (PST)
Message-ID: <3209b0f8-618b-8de1-95f3-e1bc533ba933@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 12:28:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sm8250: sort out Iris power
 domains
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
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69843fae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: YsXqJC9QNu4G6PV47IBDonmfaH2dYviG
X-Proofpoint-GUID: YsXqJC9QNu4G6PV47IBDonmfaH2dYviG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA0OCBTYWx0ZWRfX0dpicAEyseFF
 sZstVjgkWAGhNs4vRPGuFoTqWv2ESuguYR49LogfUCgbfqKXdtvAtZS/CiuYgH2gbpMxU/dtO46
 4arXCF8GQopjiP9k1vR1UsG6i23wNOEh4bGqNR8KxmiquPwfM9zU4BVqszdT2AYJ/6bF3oYpuTx
 As1B7WxUCTWVR5/NJyQ2/v/3V22jn34LtzbuKxyo8SvICSjsJywYBKrnP/IVlW8Y1OArfe/zmDk
 6qEnbqg7x+DxyszY3k+9/DVxg3H+EsXkHdCZpyC8TewRRaLYUv21tAHnWKxQzp6KcNP2AlGO/AG
 ts7nFGHOBMqAaAU0JdrgfA8oW/okUmv1dAFA57ZjUd/At2jv51r5aHnYH80yl4VWybIUx5b2OLQ
 D8E3ZHp6MVITFF8x5jsWRVF1JwQEISLgaAwXmkyU0HksB+Go/h+ndKA9OvC434Cq2gde+RFKeg7
 hb5/SQQ/hdGXeHOS1nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91858-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6B62EF2EF
X-Rspamd-Action: no action



On 2/4/2026 6:29 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..d8be5c1add1b 100644
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
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

