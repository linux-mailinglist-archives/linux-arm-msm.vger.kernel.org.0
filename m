Return-Path: <linux-arm-msm+bounces-93902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLtbHVxGnWmoOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:34:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2158182756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB1BD302FE9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334E429AB05;
	Tue, 24 Feb 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd7ybnzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsiqVz9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081DB2DECA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771914842; cv=none; b=I4FSnGqkycqWN8W3E+4fY4iqmJDMNsM2zjwf3HtyJ1SYJVn/3rtilhdEXYVIwTRB/u6PR9vb3h8yzGO4yzHTzygLYinFcjD84eRvPoX6/g2VLlRVB8SdWcImQRExbTmTTSLmvLg2Nlj2QDUV6DAuO6xme93A47VhpvoVuH0MdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771914842; c=relaxed/simple;
	bh=u5UlcmiHpgtttzIokC294u/zRDRF/DiVNXigM7PU8J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zsc3dPXrg21jD2KXtBXde1MWg2+D7m3cxLtuRmwL91d7Yh2SbodSEl30yxXvbpTYdO0C/gMWu1O8a5UsPqpYasQyLiiDnZBGUphfEsJllpGbkKp1wXDFAF0KPAy/F9OJe7B8sp7X3EKSMFWj+V7bumlhjhlENXyr39lhDpNMnyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd7ybnzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsiqVz9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LQ9C1250586
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtTg/lV2FQCNn2M866BO2tOb0k1oag4iQrelD4iYo00=; b=Gd7ybnzYqP5cBSmW
	ZJ88NHQyir385Wyu+zz1vecdNaYYmJvoFaM4nWa94SMaSltmQ+4bnqFJgdb+ATWk
	tlQvK+gFXDvwglKFi3q2p6XGLSmcnJyXgxeaodE4HyrVBo/P1WYCm5RsmvuYH6C6
	71XZpw/QvgRO8i33geZQy2bdSjt01qkUyeaVmMDYhd0sE1lOQ/mhMEQ3gRqAe1yP
	pz6IuTscu3G/o2nMavW9sni3+fnZlUpUz5a67CNMelfukOhZFGPk7M6ujsa39mDH
	2gr+mG0gm61G3jxaJk13RqMwbtqe7nBOTzODeUhXQOda0dqBl0pXTQuyI3K3FXpF
	6F7TKw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568euu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:34:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35449510446so5177654a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771914839; x=1772519639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtTg/lV2FQCNn2M866BO2tOb0k1oag4iQrelD4iYo00=;
        b=WsiqVz9bAz0kWDLDONvBeVqQ+NQHEisPWIcA3OR7+5rqkaJzXLONqHSG9je0ksvmHc
         soZB7KFhNw5nWhCLv8os/HabUuQ489V4p7NBMbfrz3WsaYfRZ9ZAfpL+4UbqMbd/Y510
         AxE56MwJkwQ0gZ6NmusKQchifl3BrwLJvWirXCG+cjXZ9EQNhLx8EV4J+chYJfe15kTe
         vOfpobH5A72enbMZRyOpihSuVDXMJFkLE0rUhaahyEIID9ffgydcCLaAczSCYNtPttgs
         AE6yKP++19Ashqcwu3Y10Fro0X7A6auTnhXZTuW+8+79uYGnWlW/jYJExZFBTOo8ZlZF
         TEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771914839; x=1772519639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtTg/lV2FQCNn2M866BO2tOb0k1oag4iQrelD4iYo00=;
        b=FXmpyCsRFyl1toS7mA3WAed0GweV+yFTm2b3S94M9zgkkOLo+SD+K1Lb/7Gt/Vj8aC
         uP/c7EzfYZScZDpV7BPm19BBmICap6FUnDWz6XnEZ9uL2rJnaM/qNLnxmHZpVcKDuk+h
         XxDNdvWvt4m5VB3Iky/wg0cyHChBlL1aejPkEhaoSJ1ZctpQKOhzv6soF+nn4Hs3qP8i
         1E2Xps7Zb1yzViVp3tgNua+TrOZglg1GY1w0ELg5nvTm+zP/KyhrXI5UEYuQzY1YyZsY
         arhjRI5O3qDZO9+Cd/4eDCPkeTfesuX74udlYeA3DAVfJ43zze/T9fCUXoDkNxcfTpJo
         ZV9w==
X-Gm-Message-State: AOJu0YwsVeSD7IWm1L+jMY3tb1V4Pjcon2sxKWfnYGJSWlwC0nQUwQ4Z
	aUrdrjr65BCTwiphSCj0mTueDdqMVksXnUfTlGLrHf6veEyw6X4jmoDPYOaEUPtakj6fRozJ6/S
	Q5+6iTylzJXWT7qlou+kfaD9Sq/bHCVf7WwLnhoe3NNHXbnY9DN3yoq3GdQcLhI7VW1uXvjC8hH
	FY
X-Gm-Gg: ATEYQzwhV7YIHYdz7LHz4ptOlndhs+iEKyaLZwh0lc4sQSgWAmJqPRUM5ZbaBUdLd1X
	Qm2uLO/RYXbuBdKQr48Uxgeq3Zxv41lHOmi72k24WnOpTxg06dhrE1FqXFmpqCj0/paujq6Oiu7
	QwQSOm5Pg7cF+JZqW64xhFE5sOsCVeC5glDsYbb7Pu+8JzREbwSVN0o6v3haCt0J/eWcTP7rdbG
	lh6q82clWD2MpFojS9qutk8uhJjdZtBFvL8n7Yk3WdnkusAk8Qew+61bWMnRUYd9klicJ22jh4r
	2yaqsRiFYdzqS2nmIUr/NtFTD2LChzuzBJ1LBolYgcuvikPZbAUTOCyx1S3G+dxeHIzAKGtHAI/
	RZZ2tWAZVQ+Cjt717mTexqraMFVmPBMlr4K87+deErZo1IPWTfQPgyB0=
X-Received: by 2002:a17:90b:2cc5:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-358ae7c5003mr9638934a91.4.1771914838535;
        Mon, 23 Feb 2026 22:33:58 -0800 (PST)
X-Received: by 2002:a17:90b:2cc5:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-358ae7c5003mr9638923a91.4.1771914838099;
        Mon, 23 Feb 2026 22:33:58 -0800 (PST)
Received: from [10.218.18.194] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358df5d089asm488789a91.14.2026.02.23.22.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 22:33:57 -0800 (PST)
Message-ID: <40eb66b5-7f3d-4df5-b6db-719168d85b72@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:03:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <3c06c3cd-cc10-4e2c-9001-9e0a4174d489@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <3c06c3cd-cc10-4e2c-9001-9e0a4174d489@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oRNEQKfv_UrSeUQ_19RarqJ3GzB8D0PZ
X-Proofpoint-ORIG-GUID: oRNEQKfv_UrSeUQ_19RarqJ3GzB8D0PZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NCBTYWx0ZWRfXxUQWP3qo5A1M
 A+52I/hbqvmBcGKlNUz1jKSC8zDQNDBWvHzqNkRntQjwx0YLvuoYZd6wSKRv1/Bc8jUF4HKhXHt
 TFiwJ8A9pQUxgc4NYtYz7a8d6l4QLGcGqopMecGOg+5/kt1JKdGC0VEIzWbSLNLpqn4AYwBfhl0
 UA1HIKtK2mGG420hXTUSN7kj2+3ARloauvnc4DGlkx2PfSGuwKwtfMfr+81WP1cApOLl9VuZ7EH
 SnebRrXzP9a76vzijrmiY8w239oZvFud9DEDz7crc7exFd55hXviFo9osXBl6KsqKt0YhNQOIzJ
 IU6k8Vf8mlaInfemZ05rmzlfW6hs1ZQGU7DbKBlS7myDrnGjSLO5vUQpMLEbL1qwHwTEzDuULY4
 P6DwV9JQSdb2ikQExRhtmEQpI2i4mEV5rEybfSaxMxWUIW9b2jrS+y9iEVahJORlb3sL80/2yMv
 HztIDyVS15de9+2a4yQ==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d4658 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-kCUtytw42OpCi1CPN4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93902-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2158182756
X-Rspamd-Action: no action


On 2/12/2026 5:18 PM, Konrad Dybcio wrote:
> On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
>> Add nodes for the two additional TC9563 PCIe switches present on the
>> QCOM RB3Gen2 Industrial Mezzanine platform.
>>
>> One of the TC9563 is connected directly to the PCIe0 root-port while
>> the second TC9563 switch is connected in cascade fashion to another
>> already available TC9563 switch on PCIe1 via the former's downstream
>> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
> 	^ +Mani is that PCIe terminology, or is that a Toshiba-ism?
The PCIe Spec actually uses the DSP terminology
under r6.2 sec 7.9.29: Streamlined Virtual Channel
Extended Capability (SVC)

"If the SVC Extended Capability structure is implemented in a
USP containing one or more Switch USP Functions, it must be
implemented in all associated Switch DSP Functions"

Sushrut
>
> Konrad

