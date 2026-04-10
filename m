Return-Path: <linux-arm-msm+bounces-102675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AGpCXLY2GlYjQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:01:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A33D5EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA5B3080C04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEBE3A784E;
	Fri, 10 Apr 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI2wsrZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0Q8CKmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35754397E9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818447; cv=none; b=Kr1WV0oJiIr13Yqz644tB+Zoraw6/uDm6X/XCmBrOYt8+kFUIGbyeDF0w63RlNvZVCUZLZMU+f6bnep8Mtk/GCrESLsGEM+9zjUWmwRcddnd+8Q3Occ87dzmoTQvDquJ7Z6fbnCj22uB+mo+Mt/kxF47pF+tGtU9Adpv4M4ZURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818447; c=relaxed/simple;
	bh=g4vDsx7AAeCpkibFY7xmrW+P9uLh9E8MtiKJ9h0jWFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oULWc3wRXa90fKCdZnGGDjb+PvzrfM1HfPp0nzDWefnh5PGkuCt/9YBCvkVrEIknfsgyDc0T4u7T1+pul+ujo/U7/G6yyYON9IkUX2cmgNBE+GEFCNGsHo3CdQgoAmw88mSFw1/ntpiBCk0lhxP3Udv7qnSD+0V1BjGIr+ZkaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI2wsrZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0Q8CKmV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A71viP1729917
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=; b=PI2wsrZmhb06nJHk
	ixSERcwKR7VoHMq5XbS22tdm5yrkvWrvRSPtYIMxPsG98HNSKGig5N5SneTqiD4V
	O0tFxjI5cs5otUqvx+3fQNoPKfQMVjW5lgtMdKOnOAMjbeeUq/6CTuMOEAgA7/tx
	juB2fczNkQmTtmp5/1CHgCofb0wPHHDx79kBtAvxiuG+7fHuSgw7G0QQvN7QOZ1N
	Dgq11cyBaL4AH7nwJYluA7o37LmeN0/TtuDFWSSO6GHbmGjAR+2EV9VgsXREdsDT
	erE9nrZloYPURlGNGm/epf29KKRifpnWq7FwZcO2ibA3WGO6ufIL21IwFOxtWa5r
	z0++/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxkwq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:53:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1382051a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775818439; x=1776423239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=;
        b=T0Q8CKmVv/SpNxwj2Z3Edv/WlsXgGhELz1+WyVDJRtCMBlvbSvmMtG0B6WXnX0hzja
         fQHz1x1SVB1MHqFJsEgFsG8FR6WmPgDeYClMptyQgB1AVrcFgfnvrRV1wtksOhSsWiTM
         0Lww59K7Xss7k6qlXUa2DKgVF0Iib9Fgk3+VEC8l3w8eL1k/dK+RMsURHWSGCz7bi/L8
         okuxYwI64l1BJOaSX49vC51ihxf0kb3qVEErqTNhAWHAJZhQCuNp3e4p9kQmdtpIsg9M
         9BeZAYfuru5q901YqHOaKZrbaxkzpN1h8SGKV1tzHBNnZtmisPlhD2KS1bqIQES7KD+m
         xuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818439; x=1776423239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=;
        b=pACElCDdvygC9rfM1M3bSchska3J8syzk0cWXbXYu1oU0wfEv9KZROZxZwyEMjhOVO
         /sAR8LB6XOdDPsayNhRRrbyPE4mNIXlLsPkiu5Q268To1wJ+HIODC5fEzQGZoxS8hYeP
         ZEv0zfvlVocsL7q4bKW75YjRApOcGnk8MlrowO6YBtYTmBJeFOQhaGyjUy8KqxV86BWR
         nHA0LXYHD9yJfpLpQn6SElfkLfmGaWmxMPRMX+vvr4UMkEWxb0hDWUuU9as26RVsgdsn
         3pQG7k28WYWPWpM2Z6GwViPDnBwh07yUs6KUuwgtcUq8J0tNG2UmXD7KO3ciA9r/9qNJ
         gsng==
X-Gm-Message-State: AOJu0YwZS44pGRav8Fo/vNNtFpjSHAFqQOMW7dK4nTY7+StEPvFHVRa3
	L7SJ1GFVJsxgv5NB/j1v0YMJVYFaVYAkw64k/f4s1D3/SyktfYVnN4L+xdFIJ7UIflMy97+LcRQ
	4V6G9DmHwprGT2zOQkcXwuFDv0ugdY7J4IwZO+V6ZOmAIZeRHaZ21v7mbmY1F7+B+kbyH
X-Gm-Gg: AeBDievY3+Mndo1Vh73Jlsop9FMY7kFsMXD6osFYyUgNBfvbWuM1N6kEkdIiHIwhM6m
	jBeGHPgX1zMIXt/8L8j38BqxuMKO7ZK6Y4sRFa+l+ySjlXzUIcwy2mG3/KH0PxWOUPtfjt5J1rf
	mIhLHCZ38LZo/5Af1M6Xe0qHI6+W4TSXWT2EOyDIRPxDsH3CAr35bR+Ytuz65GoBkCT5B7fJg1s
	plsMQrM24Ta2lkldQoVU7Bk0lSUD0tkO2uK9u87KTYMuRmm8Gylz5WyWalhSkcidc+G4S3QbQdL
	WkQGzxdUEt4IgZ0ehra6ajAeyi+TjXMt6T9gTse2t5oWcoVG8F2tKLPVmXtJ+GcrPsgpw5w/0FE
	3pEWAVdhI19nwf5hJ2HjajxKpBbWoHjOpduJPVRdVQCtfeFlmuBvf
X-Received: by 2002:a05:6a20:432b:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-39fe3ce5e7fmr3214218637.15.1775818439095;
        Fri, 10 Apr 2026 03:53:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-39fe3ce5e7fmr3214178637.15.1775818438564;
        Fri, 10 Apr 2026 03:53:58 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc8d9sm2160706a12.12.2026.04.10.03.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:53:58 -0700 (PDT)
Message-ID: <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:23:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1KEsKyg6BDfmr9aYCddWiCiiaV9zpFvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMSBTYWx0ZWRfX2DwpXyJpAmXB
 MunfvM1CGphldcDis49DbuDIQGyDi76X/bD2lzbfFQRXkpADp9WKije1bdKdpEXoFXCOt7/6eev
 aCI7pPx+iYnlT/70Ln4Pzgz5X/7FkTkBuaGy4kI/Nnw4LZuoq8pSYqCp/KCMgS7OX8m7tZ+IUM1
 u9HaP09/isEDTqVOmnr5rAQX1/tS9NrRU0wczmqq1x8R5DEeyZ6a1yqFkEv56jOmPWRm8c3Wxgu
 yIe4Ei+8G1AGx3uJjMineqBE1fPaYaFOfdi3KsoV6lozN2CECbjzpdvfzyncX+PYTIa+FmU5LgA
 4YhMgztidxXZ85609gpx4rJcekua7m4aVtUJICSdl7GMC4fA2IJtkz89Mey3bQ+rEljEXgYUN7I
 dNU2hoCL4Lp6JLPXK+60xHEnQEn0S2SgMZenGkUBUmyl5gn/XwwoMPesR3T5hYo1tns4BnpXcDf
 NDkfMLUq8f9SEUOGJbg==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8d6c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 1KEsKyg6BDfmr9aYCddWiCiiaV9zpFvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102675-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C5A33D5EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index c899a17026fd2a10ebc528a816629c88ee3bde5d..b0aa1970d42a3bb0b9d371e0e6cd09b8cd164dbe 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd SC7280_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;
> +
> +			ice_mmc_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-150000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_nom>;

As per hardware spec, 300MHz is supported by SVS_L1.

-- 
Regards
Kuldeep


