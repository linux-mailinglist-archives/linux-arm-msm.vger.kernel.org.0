Return-Path: <linux-arm-msm+bounces-90569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIoRMIdxd2m8gAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:52:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE44891B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AAAE3008D3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C058C33A717;
	Mon, 26 Jan 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4jILN2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNdy9MKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ACB3385AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435186; cv=none; b=pMNa5P4lEcizzr1wDVMFydN+40F/q7LDgaq1E+muAtgvrqzuLQu4lf+Ok3umzKDZt7Nk7TMujqxi5PZ/a3NY9fzpZAk2T0GBdDDF55A6n1b0kosjmD1LoAqPB2X0O7ppe0V7uNpT1ZkIAlfK0FN242qJn8hmexeCvabs+7d/RCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435186; c=relaxed/simple;
	bh=6EREMNv1opHIcIxjaOEoYf0X53+PhEvDqpzUjkHFi+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPnjhYDACQIxtCAzaqa0HHdlGKS8Y87OTkPM6WDQsX3YQbW6U/eW9Bmjd5Hk5yUXfnt1JKbrlVK2gnEjNlJeACWDEPKtnyL75vUDXyXl75p8rdD/17Z8CZtbLFEk2Gmr4dU7nfE+buTVjHVjFSlNoEJJu9eVfRL7qh9BSKPOZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4jILN2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNdy9MKc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8mSIo3914455
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kobAhMBzqJz0vGRgZ19XxODBG95USOh1CXbogLVLR8c=; b=I4jILN2TmV9fAj3F
	CDWOpncd069mSDedkyAmA30b9RvLFUd2qEHR5pcglcWGEUVZEfq4ZtGqyvfWVIzt
	ZjwPVuLJMnUTYoUvHpTsXB8hBxcH8vBkjWs3kT+bevxn8GOqAoQ4LxD3ynmuXPJO
	CS3qqm8/IMYriDgFYbVOVgKTYYe9p4v6K4AN//wke7WSqpXNPdLOgdpaSZf/2th9
	j85/Sk+l24SWEC5RTosi92DrBMG6zPJcNSUry3k+biMKLGEJx9BZ08p2sO+/IhG3
	tILfOLuXZAlhMUsGHIZQ3/9FmZAFQ2iw2m5ubVarSmg+R4yg9rVGFMyZiPvNaEr4
	KB/x1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24mmvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:46:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b48c08deso134740685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769435184; x=1770039984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kobAhMBzqJz0vGRgZ19XxODBG95USOh1CXbogLVLR8c=;
        b=MNdy9MKchjCyjVQOrc/1ZoZXWDJDJSGYXYLwKaDkVCVKcYEhWMAjke6vQJyxlF9908
         oPI26EtCkNzmi481bQefEhuXIw2V2EuIYrQ8GxOhoHbaKtX1qEZDI7t+bN5Oogzzknne
         Ig8Ao4oGhgeUGjZLQBEqsV39jDHJA5a+9Ot07a2MSPnzGVjLCz43SNlvhvli5svR1iKS
         /wngfhnMIUsykzN6NblFypPIgbpcLs4795vqtw4lOC3RltUitBxccfjwraUlxROK4ehi
         RlEIGioQZ25010cfm8XpX9a5i9KcyEA2KNPoSnFkImA64CbCmXgeYXG43bhcE5Hj5kuz
         Um5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435184; x=1770039984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kobAhMBzqJz0vGRgZ19XxODBG95USOh1CXbogLVLR8c=;
        b=WXEkmVMiyfcCycPkUA3yp8MEp3/j56dPoNpXTfxk/9Q0M91fboRgHHYZwGM5/8KcnJ
         GDu2CI+GuJp9DO5EKzzLdAsqq9ZBrANkrW40qbpj9ix2k4gWrti3A9J24fS1npqPoX6I
         5amK7DgrP3WRFdKdsQpagjOZcDc8G02Bm/QHF7MJLwYOFkB0jiXrJm6CgnA0xACKUXYL
         0Ka9qFcsH0m2Qd85QMfAbdOfBNC8FoCGQbYheS6AVL3bFLAfwLqKr3wIMUhoctx4ROp2
         V72RFLBMduvjM2AXr4+34AKwc2Cqw6alYhw3phm7oZIgZ+1ic16zAQZiB8kql5JJ61bL
         I+4A==
X-Forwarded-Encrypted: i=1; AJvYcCV4t0dCTsIP/4Dx5wy6z43GdThqIFh8BYoD3momHIZT7hLJQG7dZaArR+L5HwFr7IoPj0FvsYGcwbvLj2rJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2CrmmBF66rpAhX2d0O8xrbwBApuSF49rFGBb//3ARXPw0ETNS
	GHmtK/dvTHW9q2e6S63bukbRo8ddcC2QNs3i1d8ziDfVv5vxVJabj7LMD70jg0O69Yie5VGl3DI
	jwxGsyh+sSM+KAhD+rOJ9liKhuYDamhpqbX48BOwOLx4R3+94YwN30dfmcybQeMcZhaiz
X-Gm-Gg: AZuq6aJdB/G97zzLyYS8imZeaiDkM8Atun0pKDPJGiAEo3Jv08wfvTmxlMzRrK7dr2c
	Hr6JfuD1mYYM6RdnH7HkZfJN5Wgo0qWhKHjbWGqknsGT8Rf/kw4p99/CW5bryLUjHbCZC/ZJmpF
	OtfuJj7v6GbDE4xSa/knoybz3VPny5FT5gCFj0GE4j4Y2UWghu0xC6sV4hU7hFUUOFZrpoytDcY
	vsgzVbMGCIM7tr7ow1tEQ07XmGMzUjPt+7jUEj6ZlfxnW+0qyCz8EVfOc1qPkfIczkq+WkFlnnK
	nPg7OY9QR4Wx4+PqTLwpeltVXDyLOC+CBNfYPkf2Z2pJFkNRCVN/Rg7uRPWIYQR2ze3KxHsoYBo
	mXugDwot/eCSb9P19Phio1zF0hAPJlzV3ToDyoVqSpsouzzmUv8TP6bOsPlvMfmxjS1Q=
X-Received: by 2002:a05:620a:3187:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6f95ce24amr404469985a.5.1769435183888;
        Mon, 26 Jan 2026 05:46:23 -0800 (PST)
X-Received: by 2002:a05:620a:3187:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6f95ce24amr404466585a.5.1769435183361;
        Mon, 26 Jan 2026 05:46:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8af1252f7bsm445383366b.5.2026.01.26.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 05:46:22 -0800 (PST)
Message-ID: <5227ff03-3008-48d4-a22b-f9a9b1d9bec4@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 14:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
 <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNyBTYWx0ZWRfX2L4mFDnr4+a2
 vryVRZmFUUEYQyHJTM167yCzpGQfgQhuX83o/D1GILAJWHA+FKvaL53YSjGGV0tlHDpU68Rr/MF
 58LTKwAUaJ4aKvaXGRmf91GpAsU5JkumiF4j8TK2qLQoFKameg9Og2Ktv7J7fIx3Q/fNFuOaxC1
 525H868iGf86qKH7tUfYB3r3d5pfJT01eeLbF4mxi0P47qhp7mhQ8gDjBaIxjpJr8Rw+v7fBh2E
 eG4CEKZQGugxl0sum7PNYpqP0XFusGFxdbfBkjRr7MF7RY52/8RxU132zH8yYT37CaEjpdOpKK7
 Fdtgh95f3frZIZzaOhlGZETr0sq8PtewcqEoxNKptNsAZd9RQ0kLGMNUjXn716oFJO4CWMbfPp3
 jRcoji0TEfGUgDR3yO2shsdU/JsMTlGeyk4tj1JQXEtEwvGS+QtX7xq6aVAYqQ4dgX1nNBKPjxM
 GLqWE26nsVenyIAIA+Q==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69777030 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=phboRNP_TpV1PgqQbn4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VeHtfx_qAettDfoPMnRyag5n4QTiMBLX
X-Proofpoint-ORIG-GUID: VeHtfx_qAettDfoPMnRyag5n4QTiMBLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90569-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AE44891B2
X-Rspamd-Action: no action

On 1/26/26 2:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 10:45:03AM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The binding for this clock controller requires that clock-names are
>> present. They're not really used by the kernel driver, but they're
>> marked as required, so someone might have assumed it's done on purpose
>> (where in reality we try to stay away from that since index-based
>> references are faster, take up less space and are already widely used)
>> and referenced it in drivers for another OS.
>>
>> Hence, do the least painful thing and add the missing entries.
> 
> One (me included) would assume that the presense of clock-names imples
> that the clocks are fetched according to those names and become very
> surprised if they are not. As such I'd suggest fixing the bindings instead.

The reason why I chose otherwise is in the commit message

Let's try to review bindings better next time

Konrad

