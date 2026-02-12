Return-Path: <linux-arm-msm+bounces-92687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IEHALvAjWlt6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:59:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057112D390
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 989693055E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362D735028E;
	Thu, 12 Feb 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA9l3ett";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkgeVTEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9834E75A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897571; cv=none; b=o3MbWeJiyeRb2J+Jq2WNZhpP8yjOPoC5NBVFMXBkfg1y6wcOAMvTlP/uHPzjocLnhs70U+HkB8HTYreIkeafQy3Wl/j8yKj4Tw23iWBMHVS49MWmEWOXWStHfftmNq/PJQXTg3kgjeIgftbMhU4zcmyYsMJlP04aRvRPGNP7ofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897571; c=relaxed/simple;
	bh=CWebD0+N2o43KdRxLZm5fwLFbcAmtgFlsKb4dIUNqPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxbkUxtGhygC3t2sGJ+ICGp8pI1hjFEsolPLsz1PlhOcv8qKQPLAbiP/dPU+LFHVjbTew67e0KvRy1q0YiGnvX0ZYqHfvjQ/FaeLlcWL7TjQfLbctzUxqEWmM2vh6p6j1jOouGNZlxDbUv/0O5OrJN3UYJ1l+ebf6ud/gdWpcJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA9l3ett; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkgeVTEL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIMTM657819
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvbUd+MPwyByBxAMzW0j/eiTFckQOxdPgHsmUjNyVSU=; b=iA9l3ettflYd2XeQ
	puj3dNk/PdC+sQAnrgeVJzp27HSWDQFLCy9vTLImwU3SA1wXjC9LltfpBj+E1o3m
	0b17GS2CKEbUJxarp+1rgRE/kZK51a/yWsjE5MwEU5POp0ETyEeD7wk2V9FVh7vK
	DAN5frjewPUIA3ObAWarlHhL35gu6BHGBBrSdP2M0hPOL3nsCTe2+3/JrUmdTY1a
	RxxkuQWPuLJ35P/JLSU594mzFbyxnyddyPm8MG9LlhXBbunXlZ/RLcjlP+e/8igE
	MqXrCng57ttU3atNV23ib+Lu4HqU7aa1BIbBl/EtYFjPOLc+tvaNrtHYBPLciIoz
	a7UkBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09g957-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:59:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c709a3a56dso400272185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770897568; x=1771502368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvbUd+MPwyByBxAMzW0j/eiTFckQOxdPgHsmUjNyVSU=;
        b=VkgeVTELHOvazz38OqaHhsmeR5NRHff+pL3d5ozXokiPEV2KwR8lcqYGNr6O36PG8u
         qb11mRLfgplZv/94z3jkzk46AYR5AW8SQhJekqF1SchG/8vMEkRbKB8WL1O8/y9Mw2NS
         cypBCu5c058OXAfU9V9eDPEnVKUJj11qdlQWXeDhrzvpUkoT5ceNANpbrIZj+MdVOqgK
         S0F2HH5gPDy9f2hXjy6rz2lhMd/UKHp97MTV1oQT5Ea4rfyZCV35jCRhVWJh1c7NbPGy
         /u0qx94XEXkLAEE3BVeZyVWlrjHKb5bNObHA1eNf8XVN922/Nor7MkmmSwl6XyxlMJkw
         v4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897568; x=1771502368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvbUd+MPwyByBxAMzW0j/eiTFckQOxdPgHsmUjNyVSU=;
        b=W0ojf/Pn6Xow2O1c5ZwCMq+oTfXEzU0UfeWIgXiv+nbroBaCN28zVrlh2R29QZbEAg
         CrbS+kxD4IFlwp9zhRQd5Xq/dXT2vrLQcsCnjs73zrOUbB+g1loyEgk5Cxq1MZOX8a+K
         YPBeYpZYRUeudiHdMFeE/rCjnHuQKp+Ksm1084k2RuJPwNy/RUQR4ddvDHoOrCOYIgba
         Z1eeuwpIHqcIK88PPFH2pKh0YOtrKXAnFA8PcH966ZRgAPwzsKg+stW2u420JnbrqCfN
         BdnRanCFK7IYUcidNbecmHTV1vZGDxvc9B+qD3mEOHvY/hVzNLZZ76ZK8sCM4CRloYy5
         4YDA==
X-Gm-Message-State: AOJu0YwC1gbJw5rbZtFkYGn/doi1909dW4jOnj3kBitNj17x/f3kEuJ0
	zCoDc219NdVDf7ia1foARiyTb9Y8LNqIeDcuPWvsSsreKJO8w3xcANLFJblFXd75DCgZ2HVbclQ
	XIoxH06GfsnzfR+GIzrXaQ+i0F+RrbMW6/Jov1s8M/+l4MKkwpoAZK8cEnGwixlgslc1y
X-Gm-Gg: AZuq6aI1TPhGtjRqvZKdJg30q9PQVq8sCl99CIA+IJHn6beZePO2Pxf87NSgZDSIN2H
	Moq2kcm83sM+NNFPTKNc8msPIOEQg8/anMP+pw8Zz7fM0eP54Q++QWLJv6/6FeHFPZxdMYS+exm
	8dT7HTNO2p3vcRqIqMlumUwAGs1hhhUHWgttjTfhWJ8aBBNzsT4klSTYjYC1mYsHVCkMBhPWx/5
	GTyGkIupLWCHFXg2vb46UTW/7EwHxiopMzoq4KDU45uyhoNj3QkH3VrsYaPyudVaOF+58dh981q
	VbVKy+MjqcGUOh5nOR0rd7xtOMHjPQwLBFc42neY3sH6S2Q9WLH+8LZq1ubqPZyI7Z/dZ0RudlG
	30c7dnl4tn1aU+LqH9dENXmws8/lkqHAk//uvX1iMYDMAx/+NdjubjlRuqbHOfwzaEmZMXIGdGR
	YPgqU=
X-Received: by 2002:a05:620a:31a4:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb33167808mr219626885a.9.1770897568018;
        Thu, 12 Feb 2026 03:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb33167808mr219625385a.9.1770897567618;
        Thu, 12 Feb 2026 03:59:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38caasm1601501a12.17.2026.02.12.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:59:25 -0800 (PST)
Message-ID: <2c2a4e27-fea6-46f5-8d8f-b5869e8dc54b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:59:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with DDR,
 LLCC & L3 bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OSBTYWx0ZWRfX9hCJTjuvWaf0
 FgIp3Wy4XGdJ8qhDY+i9Hi2asAd/fQtMWE+ohtMLylvPop0AnKsm1oRROXK01XLC6TM9I9jwoT8
 O26ziaM4eVi9d6LUYezoUF/9g5TdDLXNHA7y6h9YyUNfnRPivkwmbiHa/2HDT9VXpx5kmrCHPJc
 SwB4Ys+EEHZTywgvPcJkBc1qBgqLM1avWlhyjYadf36Z5SHgv0oIks/hha6/suNXQHose9imoRt
 9/CcPjCfU4GsdkukiMVcPfTa8hpWLizENLQ8LQnzsIrH3iMO18B0g0XMwhK6lFsb+6cGZdKx99b
 h/Trr+zxQLRxfKRTRRXQo1ru5VcOdv3J39sd22qc9K0x+segGGGKiCcno4sFe/q5DOqsX47coSj
 LJ68LMxKi5j8wTm32+At1Z1bLM1dVLDYlPF96wwnhJzBx1wSsIHmtlSquywQLnQrZtza6QFHJri
 etxsj2acVrIAyg0zM/A==
X-Proofpoint-GUID: C6IcYHA_uLRomzMq7GmHwTUR-qsPlShE
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698dc0a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ze5Wrr8Eh6wvvEUSacsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: C6IcYHA_uLRomzMq7GmHwTUR-qsPlShE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92687-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9057112D390
X-Rspamd-Action: no action

On 2/8/26 2:28 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> The OPP tables were built using the downstream memlat ddr, llcc & l3
> tables for each cluster types with the actual EPSS cpufreq LUT tables
> from running a QCS8550 device.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-307200000 {
> +			opp-hz = /bits/ 64 <307200000>;
> +			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;

I think that entries below the first in that memlat table should use the lowest
frequency (i.e. if (freq > tbl_entry.min_freq) { vote_for(tbl_entry.bw) }), etc.

You can retrieve the list of supported frequencies through debugfs if you apply
patch1 from my my in-flight patchset:

https://lore.kernel.org/linux-arm-msm/20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com/

via /sys/kernel/debug/qcom_smem/dram_frequencies

Konrad

