Return-Path: <linux-arm-msm+bounces-62848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF7AEBD3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658F61C62F30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A05B2EA152;
	Fri, 27 Jun 2025 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSO9h00m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26992E11AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041516; cv=none; b=ZXHxTZzqGxFYDH/2oT+dgEv/jP88al6JcltJItcZMGFafhT0r2JbuOg8ysyB1sltIUAIfdKZzspcO4bjL/U6t4LquPk7ckiele6gwQ+02LH0N44Bf3wswJ0a/WFHoTtG91WFOj5e+5FWGHuFg2fBT/Z7pQd721vyWQXj4T+ZTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041516; c=relaxed/simple;
	bh=C4i+82VCqawXzba10UfgLVMnLpSjEvh/T1+KBY4EWZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IopGeMkTKUBk0pr9BEodht2tFlz6KudYzt5O4/QWBf0oHiRZNPcFlvpn29f23nEgH29Yr0Y8jRLzgDUCZ4/S0JgFJHhugAtqo50PmkRA0ky+LbcnFZ9N0I6UNNfav/9czqzUuGE5UjFlcBN+zx2AoIIHe4zryEMkiDPj28d9qpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSO9h00m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCOq06007917
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=; b=WSO9h00muASik1PG
	hgjJUhe/Z5R9kzOcFzfY0VkTeXu//fkoP+y+ArJjBq8XqZGBmWanNftm6dETR3WK
	lwsl4p0ShctmgOsBSaRDTYA8yHarihKHhgjcEPLJCnKBirw39trtgV2nq1Kbaf51
	VekktYj86D8jrAcpKE5f+6Nj3sPc87YAR7pzC0Y0t4kQxSbpUXkOILS2WI8ocyQT
	LHWfJC2OxUlSyDUq8kNQHOWPmTMkHlfor2tCPzTO5+OOiT8kk8wFWCiQzwIP/FgX
	4kgAd7OTfUr5gXUH3kUZm2vddnj6PIVdbr/p04B8/LiMWbtl+2hlR6lpfC2Iv64L
	P45v3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqwtfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:25:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso45091385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 09:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041512; x=1751646312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=;
        b=FcMiWN5OWs52BSbR838UxDS03dQCPwJGm7reIqpn4731OTV9yYbhplQymjZ4hsfkip
         f1aPKh7nH6w97OJHZeRhdwpTsofion+whHdtbsLA2EDzuQdXDoLct1+Usr2c6KoWx1HO
         zN50i/IB3FI9wTEA5Qdva3G/EfDqBI5g2zQor4ruIe7ssfsJJbzz+sE/oXKlwWKxp7FT
         FKbRu299Yw4xXNnzdVv0Mav266TAQj2dk/HrKgBS3Cf2B97CMhsSqc+F6uoBUG7Gn9xS
         2IkmLwugtQreUFEh4XZ9eF1zr3VDNXxo7J0q/JBsNDtPHKxoNOwlioo+1uqLrDbvpGU4
         yhmg==
X-Gm-Message-State: AOJu0Yxvm5wef0GsgzEzHXuep1SHnPRnQNCFBJLHhOzl+/i/0bfx1dwQ
	E1W/Z18irZWyErObI3sV/TLmgrTNFhR3a9haptPlbo+VbOVhbRCDPCwMMa7qPb17gkNb1ldMZK/
	uSBFLP02VLOp6VZLAd++JCVGLz0KtML4V8U22Ey2isHj/eUbsAcxsEkVVYPysL8Zow+iP
X-Gm-Gg: ASbGncukLMoZ8uUqULAmuMVBusW4uRsu/dchzFDma8JAL8646tRtREvNMqhn12XZbw/
	ZpOO5Ku/ZmR6xTZUAPJckpMKMCY/07nWE5QVWla9O4bVyPQ6cSrJlmOQqHurnhTSE3CeGm12BRe
	ssA0heYHo4dQ3cmQ7MjzwuapB7IWErdNPEEjbd8QY6RO5ICimj6BKLtjOXmu6H+UtVS5d3upwln
	iaH7gA35RH17bAPASyFaU8M1iKqdn48XPQ/OCLxXhDwkvufFEZ0os4kgWGhM70XDZcC7WjhkjEg
	CSotMT/Gs45txNeHKlkqygOzz+Tz4Vp0ZFotNI4XMTrA9rcXxJF3auqKKRxXyB+yZ8kMMbtXBjX
	cNWo=
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186172985a.7.1751041512178;
        Fri, 27 Jun 2025 09:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF07xy/DeRmmmedPMJULYDxGN/26ma8lCZYySazHvEfgzdLyxgZdrRzYmMNDCeah7SlE5mBqA==
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186170585a.7.1751041511671;
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bdafsm148417266b.143.2025.06.27.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Message-ID: <cee7bd5b-2c7e-4abc-8810-4c650207b4e7@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: Add NSS clock controller driver for
 IPQ5424
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5ZtmAGwxuxPuVTinEITQrayul2_wg68Q
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685ec5e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bcbUkqnWQ8Yi_cfyv-MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5ZtmAGwxuxPuVTinEITQrayul2_wg68Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX096MQW/Mmgns
 pvCkJIJqrOBAAy+muM3/93V4N0VsRCOcf6q+mDcn58RkOnj8RFPS9hc5bTbkNJ1b4RRZVqB6j9q
 ES2N0H/FCvTlDoGi9J8ExYww2WI1FKdLBcZ8muBODj7IyA5kuODX73gYbeVOC8N3sub78skALqt
 OagkXflTUWChkTySyZ03qvgbqCFGQQTcWxrWObfXXsPMpclQ34G0rPzVTg5Q6REA82Nqp/7HSDS
 MtkEgNYwH6aSeG6+O9efL3JTeC/eDvo2sgytgccfY7aFB6s4Oj9byU58PYfF3H2fOpjp7NmvYi+
 aDInwRFg488p+SWnkwqaYappHOtNq6WLLuIsWO2iQnxjB2Zmqtmsb2JQA5db8xd1lp//09VcgUK
 QjlIUXzTXy5I5+j16jNO82DcuAkAcqYDZDnqG8wm69i2/CegaJwZgw0qB5t21dNriPadcy+L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=717 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270133

On 6/27/25 2:09 PM, Luo Jie wrote:
> NSS (Network Subsystem) clock controller provides the clocks and resets
> to the networking hardware blocks of the IPQ5424 SoC.
> 
> The icc-clk framework is used to enable NoC related clocks to create
> paths so that the networking blocks can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

