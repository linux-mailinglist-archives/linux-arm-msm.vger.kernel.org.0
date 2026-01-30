Return-Path: <linux-arm-msm+bounces-91286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LwzKzSVfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:25:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA6FBA0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E5F3008D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17685331234;
	Fri, 30 Jan 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeLkMX0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPlzy6Fh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FFF36606D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772071; cv=none; b=BlKtToI1pzZfVbyuWTCGuIvy4ciu7E0zXPFRP5Mkp+zuYl3+LF7ZUAYEJq3oPG6R9bxqzl95Wbj+lH9Vv8mjfD/Wyy14UE2pC96nsL4FlmhJwjOHzUkgTBytAbvH0z1xIHV1F9nYxUS6ACBn62uUhfGkdCPFvuHHcmJ052WxTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772071; c=relaxed/simple;
	bh=8XTGJt0WxjfvBTMsvs1ASjI5pNp+pYhASDar5eWdgi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKtXi+5sMfu0kTSJpB7Sy64JJdQQFcH20eBKaBUCiZffTTPt5M9Mdno0giuurbBfquTxXPPEIteXY3S6fW3EOrO6l0svTexZr/3uA+PiacmrM6sjyC5Az0KJAZK8Ql0QpZNIiFPT941uVG+y9dxDXDflNLFd+/6G2HTd0VhMURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeLkMX0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPlzy6Fh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4c5HX1826540
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=; b=eeLkMX0iElqJMZIv
	JKwPktQIB4bgh2Vu2+TDkrpF5y42WfD2KBx+fXCvECzkxBO4DvfLR3AMrXqNBw2Z
	MEbxZbW9zvBDIXYc7sdEPumuqoQwfLMmx5qssdu14N7bSKqbeBfZ0KPL867hhzcG
	PBR1plwIhUnLt/QBcWnB2gcd7M59r+ItWKcdOTZKHCvllniem9vE9hfQ1ywDuTo/
	kyi8J6ky9mwsJK0cpP7VtPTVCVUbj0W7j/GlViwHTGE6JHAWtUdY6wDggEFkMuXT
	s33CkGpcHpk+M+P7At3DIjbA/jm9g2VgIRz2jj+7GJIWsbDdKbrM2s9da9ZT2ePV
	eJmU+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsms54v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:21:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso48542385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769772067; x=1770376867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=;
        b=NPlzy6FhLtISATgIfeQHls89cJKNS3QTz+jXJnq1e7H5Zvz1IBRu7yTZVeK1yILFpk
         5NERLa+L9grM9zzGXR5ouBAfllpOQXLrsOoHv16Mvyb6VcBPkgx/+wz4BxUR2c2UVdi9
         dEIzCsUGvak2dDPqJc3IHI0Uu950zDEPyIqAOIIhvxeb8MNqJuy3KlW6T3XSZMyNync7
         +JHtGQewHXxbSxmLqX8QuvKlc4OKaPWwRbLMn3gV896+wGau1vQBu/T8QyHM2eg0tlpo
         przznKML9qdH1F5aTKtvg9iklJU1rxdkumdCEp59aogn+OEeZV8EnA/olWZTtzwxkKF/
         Lf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772067; x=1770376867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=;
        b=LivQUFUJGgWUwt7fa/ltn+RYDtKYjKrz+XIUb8DMa7j9x8bOD9zPTaxwB52VwI2SBV
         DRSZtZGEb36irWe7Nu7Z9hweFI77GvqTNlUCJHiFeNg8Im3teNy8fstdYiFEo20aYsEd
         FUe0jf97RZT9SkbTfncdcS4s3FCxkMmZLgZXB+HjNjviT/vA2msrtvlr38dYbuk5kP3C
         2iWeai+eQ4LRhh9bv1pWaT3gALw3U5RtASXcZ+m7xMLuGx3vCxf8d3XKv8uJNmM0A6Oy
         KVFbTq4uVQ4VXboZw4kZXJNdDGKfZOOlkvHoHgpmqa/toSS1WN4u64YPoTeqs0amWRLY
         SODw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvdJgn777hQPKffP0dRC/alnnowuW8FgKHCnPQulE+ZcQ7S0161XjxP/J8vVVNB8eqA8wTiBZdajuFm3F@vger.kernel.org
X-Gm-Message-State: AOJu0YyQOtM04Ox1sSs6lIw4HBq4Ur0zZNCF2uLWAbE5tMuGBbOwHuCJ
	6yFDLe0I8ErQW0xBkv/sP1kyipur64jUQYXAPD99XWglCfWth4civ6DaqopeUfSW3T3GM4lxjrh
	xzuM+l+OwUnaFIr8DF7daSD0q1185xnAOhVjUllb2BhUOYSKQJmX1EKJH3TOSve9RnOmv
X-Gm-Gg: AZuq6aLzDWq6GPx6JbiW59i94q0RJB94fuqrTwVbA5qtCezID/Zlz3qM1i5uuf5FL7s
	ccATUrfOGgklpwHIY3bJozJvozIdaPuAix9I9fJNmQB3/PDcWz/d++8a3AiLCVZXea9+DhJAGep
	WhAA6/sgZEq5PEYTX1tJiynuFT4sbiylgk+dTSt6T9mdhnwJLEOp6dQl4hNvHvugmoVTPVtckPB
	zQWPqbFF9A0ihVAQhegism5JHSx+AYqh5yy7yjEiqRH0xGR40w1zSXxlMX1P4sqe6D4jo2dYozx
	YNyM7EQ3Jj6lB5QhkymJOWbDeVfnkbBqb4V7E7Ga9O3CNH75KzX/4QoQJZ0ITt8kMpHpC2RSpiO
	//MhxBk76WqZk6TJdw2DyJRHkPM/Qnog42/fzt6ybPYokOGAacXr0tvBHjjCq5BLNjsY=
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr274269485a.9.1769772067208;
        Fri, 30 Jan 2026 03:21:07 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr274267185a.9.1769772066697;
        Fri, 30 Jan 2026 03:21:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8df8465cb5sm137854166b.40.2026.01.30.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:21:06 -0800 (PST)
Message-ID: <7e61575a-3e0f-491d-ae22-89ab8bb21c91@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
 <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
 <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MiBTYWx0ZWRfX9F6vN8iqZy56
 fK/pvY3sohcFUjXl/vkIDPLxq0vK+IlW4W7X0K5/HcHd4HcVmjoeas2Fvpp3KT/JLmoSyrUSKH3
 qwzxK128JM4UgJrGWUsh6tzC6xBu3Nh0O5ZXg+GixPfUBlHOXWt0ZnO0IgZHMHAb2cBRWzk0r2E
 dM3HT9MvuxIkXcT9CCTPwV7kEn8KNEMd9+IkaF/LzTxKJsekRSuWOp3RvULztDUApufSv1eutaX
 3Nh4oruqj1pxiyYbGnsKjbMZ1ChKYHTGnSlT/n+KcbXVIxBuQoSCL7fum+xO+7suXUSyVA1Jedi
 1Dva2H2FhSyyz7PQhXsCbt9l1pcZo2LFhTjK/gBt1pjyT3NSpomjY6iHBBb1an+0lm/g7DNUIiN
 H1Pxg12RUXItLrkabzpdxbBZunBeiSxSon228lxQULyOtCnG3fqGEIsr3bgnX812NgJIQweoJ+z
 3Ea8lKZy+mTcjLDkdQw==
X-Proofpoint-GUID: 2OO1MiGMvoHzvrZ6Q_ro0g3cHm4HZh8_
X-Proofpoint-ORIG-GUID: 2OO1MiGMvoHzvrZ6Q_ro0g3cHm4HZh8_
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c9424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91286-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EA6FBA0CE
X-Rspamd-Action: no action

On 1/29/26 6:27 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/28/2026 5:58 PM, Konrad Dybcio wrote:
>> On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
>>> Add pme_turn_off() support and use DWC common suspend resume methods
>>> for device D3cold entry & exit. If the device is not kept in D3cold
>>> use existing methods like keeping icc votes, opp votes etc.. intact.
>>>
>>> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
>>> in the controller.
>>>
>>> Remove suspended flag from qcom_pcie structure as it is no longer needed.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +        /*
>>> +         * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>>> +         * Because on some platforms, DBI access can happen very late during the
>>> +         * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>>> +         * error.
>>> +         */
>> I think someone internally once tracked down what that access was
> As per last debug which I have done few years back we see access coming IRQ driver to mask the interrupts
> as part of disabling non boot CPU's.
>> Can we fix that instead?
> The only proper fix is to keep device in D3cold which this patch is doing. if some client drivers like NVMe
> doesn't want to go D3cold we need to honor it, but Mani is working on it to allow NVMe drivers to go to D3cold.

That doesn't sound right - if there's an unclocked access, we should
either ensure that the PCIe controller is online for that write, or skip
the write if it's not possible for $reasons

Konrad

