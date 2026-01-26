Return-Path: <linux-arm-msm+bounces-90501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD+XG3Q7d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:01:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F6865A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71C893014771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5551832E727;
	Mon, 26 Jan 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTWOiv6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhJCOs5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C119C566
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421663; cv=none; b=IAJktTixZVug/QZAurjYEtSKvHugafqvv1Y0ubey4p8esIXItOM/FG4g2+dQpkCq9TrEb50StQZaEjLI5cwYBewFr2kVGDf0AtRxxsNyAxLqAOdirtO01CcDjCSVYp8HZmk4GJLDbr3m+xDegfPiiLb/f+3jDNPM3HzBYNZywfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421663; c=relaxed/simple;
	bh=4INoMT12qCpUTzQTBUPlvSvYHfUKbJXNy1mYhl0sSuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+hzYVBc0+1m7IZDVu8BmXmOjfc5nvryNwX2jLi4FYR3v4QdwCNRo2R+uBShtCDg+AsGI7qvL3NAkufNQaIujTmdsL5cP7dEWWFivnVyIAglt6aHjTmQXq9iygDKcTeZ++aQgcHnmqNu3y5IdykX0zUPZRHaH77bB2hUdY5cytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTWOiv6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhJCOs5d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9TnnW1782798
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMXl0QzKP9j0LJ98mSsU1E0C2JaD5zFoamcYF6chags=; b=lTWOiv6azH5Ji2ue
	GDtKJ4MJLRRJz9+io1/sHDcke1/OUj8lcpoJDu/pGkYbPTuyIimqKjswHY+okO4t
	lbQ0j6Vb0jD/3RdQiz75lFLtCPSAJFlo8hKFeh8ffgrgLImFu7cYr1QbeJLDVp1I
	N9Y2GBOafWPWQSFIH+hmx8DvYW365kWqqWoQkif30l0FplJAzJxbj79DlpOG/GWV
	cuNJrYKLnihlHE8xfZl9aunEpnjGLGabXjD68bHhnzi6O1rTBg3T7maTVi5a0jD+
	C3ZTD6T7CGPVLFEZ4OOJbJpmKRZuxSgdFH3PoZvaQQNH0mLy85nhkvHJQsGwJ4yf
	4oR4KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q439t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:01:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52de12a65so87397085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421660; x=1770026460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMXl0QzKP9j0LJ98mSsU1E0C2JaD5zFoamcYF6chags=;
        b=QhJCOs5d9Dc5/NJda2WrlZfZtPiKjBQyAeD7o+RGL/6ArNHr4Z2pxUv19ME5F5qJ0U
         utEZNG5OtSdTv3cDmyafIK4ABnjrHVvvl30cOKrXr4Mf1sYvu1JZGJZImZFGUUtrWPDG
         cdcJ0Spp+e3SWWt4TqiTYlkqO2zILhS3xqLyG/Cot2DV/ANsB+I4Z81gGyj+UdMAmu0N
         GVI5uhHyOlKQuUgY5zDqAh0XBnm+Js7z1yg/t1VJqj3dCtBcP7NJdVIsDq/0TWhs+qv0
         VO4ROmNFb8LxGyl9vO2mrfQayfxhR5ZP9ZjDsjHDrvnn1dHAdC+qvUn22S2kx/v7Zfs9
         sZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421660; x=1770026460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMXl0QzKP9j0LJ98mSsU1E0C2JaD5zFoamcYF6chags=;
        b=VvvjBzC21TOKf21hsFHcZCnqHal/gkuQ3jNqGFXQd6h70uSzolr1yVEehUHpz+y+dS
         5CRfOrMmIw/XTXeFlU16nHKQjoZqKH2lascnmzUAa6HY372PMqVtK9SZySxz213agYaM
         o8cvmpyVISQjZQXqsjak3rXuJEIx1CHxDJlwF7j3gD3GoA87/WWiYdmClcYHw5sNXeFV
         QpXuMyIlp5Sme9/aMEDMq7zd/F/Zw4bC0JGMW99PDTyK1DX7KQZPqm7EMXP4DsAF7mtF
         ViwKbkeHyUU9Fx6BpmJs7N3IVCO7FPus9IJ3KyQVC8TKqsljBJx+R6NysToN8FvVNLsN
         q9nA==
X-Forwarded-Encrypted: i=1; AJvYcCUm02lktbt+HICmW5fra6n8v2K2oSsEkwc/MhNVSRMeJhehUkWwipRW46NlHbMCB17i+CmwNNTOadU/khKa@vger.kernel.org
X-Gm-Message-State: AOJu0YyK67+vqo7/Ul3VbYYtZzx2RQcMouofsMBnxBdgE4C+PaqXcWPO
	ckwZrwXgvSxmyP1m/QC12ZG9R6VIMz/yrOh5VILfvxhYgcdTX1HGDg3A3V9VoHwq5JTTfdX1b8g
	OxMQTk+02zwDF2nx+AZ4jn777GYNr1JR+6tzRQ0LIJ5VwLvpqA7b9GjdDZdpj+jwsF24P
X-Gm-Gg: AZuq6aIcqb6r3x+1aHzLCLQ0TKIo3GM2Assaqla6jMHzrlA7ALIcK2cFaIVK+bJCOGj
	wyz5w55sDusrrj2cVT7GFQOVWA+8FoEcyOjzxnf+0m5qE4fP8Pb72wENAaPWZXavBpc5vaI1SWR
	HRjSbC6lB8uvfmdaqKpX1ecx4N3rqFAoYy684a3x826ii89jFkjDNukb2mX+4o5GkPKx22JNC41
	hSbrqV0n9KkvyeMOzCIaCX8GpRbqcbMhla5yAnOLVootHqDHb1Ubnnp32j8IdPeQcoFeZdfLDmw
	hzbTYbqbaeLR5ePHBJSfgjnVGHkaUddYSTOI95WhugZjkRUcm2m6Oti54Xz7pPHee6I7KQCVycC
	mjzEljZ4UeRShjH3CO2IRD6H56/32v6XShL9nq5a9xaET2E31f/JwIrBz0jC4uEsCwvs=
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c6f967f625mr317963785a.11.1769421659781;
        Mon, 26 Jan 2026 02:00:59 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c6f967f625mr317960585a.11.1769421659378;
        Mon, 26 Jan 2026 02:00:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7baf62sm613558566b.64.2026.01.26.02.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:00:58 -0800 (PST)
Message-ID: <7127f32a-0db5-4f30-b1b4-cf72fc117fd3@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:00:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eEdYkteHiVb7ySPq3iiEAlhtl_zhweCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NSBTYWx0ZWRfX+c2YrRovVNPv
 prb6C+aD5lxro+a/5K/x6hptOqt1/2GMEX9kJONIuw8EI85E3qgmh2DXXvce5Yr6MlOYArCjDMK
 gEehT2VPj8MHvGr7k0EAthHN4mndP2pOJ4UWYriqU910yAic4AaAKTAtbVCpAjAWEPaNHeBmhLR
 E96LRabuun8iadN41Z4FUvIF1Va0107fijyrvIMRFv9VeMMaT+e9NO7eV7lkrRqvE8ftUxUrTCf
 7pGqkBFxud2UWoYo7goqXJfOEDE1HFzWc1jO9zZsg3hpCrNuIlTIlr2Y4v4b4d5IS2FwpsSRWbB
 pX+o51Tp6CQg1O+s1OX/ExV3C+kWFd9+AJJwwYIh2oitpEH74jxGGlWl2jqv/vjMIOemNPYBkqL
 1X6KBFBxVJokyUtoqseakABCxMZMveY6Ldc08h8vjRo9QHzW+iMM/iTgzmZAYBZW2E0RE4qovhE
 YJniHN2DNNBascE6NjA==
X-Proofpoint-ORIG-GUID: eEdYkteHiVb7ySPq3iiEAlhtl_zhweCT
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=69773b5c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=I1pO_mbCalW5hTs4aOcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90501-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 193F6865A1
X-Rspamd-Action: no action

On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> SC8280XP having just 2.
> 
> Document Iris2 cores found on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped dts video-encoder/video-decoder ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [db: dropped status, dropped extra LLCC interconnect]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +description: |
> +  The Venus Iris2 IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8280xp-venus
> +      - qcom,sm8350-venus

FYI the hardware is actually named "Iris" starting with 8150/8180

Konrad

