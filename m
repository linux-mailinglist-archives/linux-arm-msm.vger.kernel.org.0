Return-Path: <linux-arm-msm+bounces-90333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DsQOLRbc2l3vAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:29:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DE75018
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA8B304B9E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C4B33A713;
	Fri, 23 Jan 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVhjCX1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqD0UyT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E42417FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167756; cv=none; b=vEoRYp+gC7vLPkIi8F7qXmVdVzG2VzCBP6FLOQ/uoXZTFn+HFjeOh8FEPWQ+ZKLva+CufDGxpkrcXStDpO6qLdTGz4Y/V4RL2j2UHka7WCw7f2xKxb1o+WMhm9P7PPdmcev+niJV6RqmSFuxhtyPm7z9rRgTCM0fzt6hFRmVpes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167756; c=relaxed/simple;
	bh=01kki8s7KXMW5FP0K0DImg52CvLMZEngYu212aarTRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqxzCH/kGzmFGDJAZTlyHfDIsZqQdUnxGboFtjjPKEZpu4+0XDlrURO/vDgiemnGfj4yK8Co+QyuwfXIqY24n0jv9vWYVdfcc/0aWRH5IDqd90ScSXZTVB70IaDGYzTA4KaUsTWsQt3mVRP5oo+Ru1AGuAq10DZs7jYyMrxJo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVhjCX1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqD0UyT4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N69lM52910302
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFeduZfRAmiiVhTJMw6F88oPXhrCr2swxdvQiqYVebo=; b=HVhjCX1AzdG5aRdH
	Npz5opDdq1YU6ypYftY9fLUs6vncEp/sD+TN6JKLBk52eKlE0vI0FiOpcXV2e5I9
	izbyepnJI1jV4l6NVzH/MKVTS4XGhfgeCB7lUYj1lSzuzWh2mgOcWpaGwqacpauM
	TULUJXnWnATHo15xYBbkbZa5XlPyjPpSkIK12blIuy/vnPq4p3le7zg7qXEICLAv
	nVifX+n6chLCGs+ozM3iLh7QdnU3B14AXDzZvfTMVtgd3lMuxCqATstoH3MaDk8y
	ndobtp0d48nt0xeoRA6KWc0yjsL+SooZgUFHgjZKRLqsD/Qwm/G+vq0UNJ7lsJ8B
	OWodow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1tft9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:29:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so45132285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769167747; x=1769772547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFeduZfRAmiiVhTJMw6F88oPXhrCr2swxdvQiqYVebo=;
        b=hqD0UyT4REI+A/01d33wjJ9/BcFZMuB6yeSwKfr548TsDtWhHSKbwl5dkkmUR582oN
         VPZnOMF0/MBvVDtFm0YntTxeFnRlUjLGTt2BoplUT9I0GO4a3QWKMPdmvKe6T6wrDjB6
         ujiIxLll52LHVAMRqXzW3QnwdZXogReqpQkLCJmQn/p8qacU5/X5KoASE4FUA2KLxqTM
         1oQSMiHTjxtBYE2hvz1akFI0qEp6Zo0KCy91zzX5PTdfi/4GPIGvuwG8UvGyoxvdXGhg
         f8JjVqeHb0jfeY1IiO3xWOk9+C0eiSrvyCjiVuGriVDT4uineo+h5ZoWF74pUNTImlcL
         5PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769167747; x=1769772547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFeduZfRAmiiVhTJMw6F88oPXhrCr2swxdvQiqYVebo=;
        b=J6BPIvW2OERmOvdqMCMq61wECwwNxPhR6S87H2co/VLWPp0wKG0UuI3vIa6fUq0y7d
         Vl0J/q30INhR/2AzONqwJtPSYTn5JRKFOdqkfdN/XrLWj6dAPVvsTgAZZA53DWSv+05R
         C1AVFoup5FHgE84vtPWohUC8rxnOtcfbLv/Dl+07THO+wNSQ6v52eqQU+vY7eXDdn2S0
         jiZzN8/bIkg8E9RnWb7GBBs9aHYFcS9yhF1vPEkkSSQuX+JX6aLr9a+3hw3z1scTsnR3
         7oUspygc5K0UdsBLnIwJw0wdJc5xweLc6iSgdOzrib6CbUTGueFgNlP6neQ7QwOHRfct
         2PJA==
X-Gm-Message-State: AOJu0YyjLcSRjuFEg5y0myTYT0G5luxIpOsKa5YlUsASilPoDnPM5d+y
	rV21yvq9l+xzhKAaQx0s/os0OBTPs2BFTRwW8NIm2vX+RheYR0LldhBVC1lFQJXDxKYMlFVdrA/
	1Df2jarGvflvicxJKw6m0J+gvgeE4BYOKydWbCmmBqa8B40U+Y8ic9NfR3EO6lej1vQhy
X-Gm-Gg: AZuq6aLl+/mNSw8+U1iodlbZTd4kV1f1aoZ28fQ2r3W+2DSrS70IXGuDtRfum9R/dfS
	zfy2Gud0/RtFmSy8Ke9cPYH1HjBVrugOYP3ZT5SIp2t0p3jVFQvXvJSTRQVjRwh1chYBxFa2Wrt
	bln6oVZwbvq5Gvm0SYuDPGaSUnkIGcz9WcNqThSPlTvLEGD21naiNpOF3iW0wssTWGXN50sK9oE
	EP5UDHebRtLJ+EB9SlaMfwO7JyB1SjIGXdH5CRF0cK4D538eQe/eYHc9DQnYozEu4i4dXlp/ktx
	N+sZ7r31to1PkiDXbYpwwGTYfKJyeIJqfm+JRuWr8GIoEv11xpeZAYtfPdUpd5Xs4mix5Npwsok
	DjeTDAIvQXN7DYbSEwc+hGoYMKu3wLU2kITi2mjaCIhAZoQOzPM9GtuWbhUnAZbLl09s=
X-Received: by 2002:a05:620a:7082:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6e2e4d104mr228354085a.9.1769167747120;
        Fri, 23 Jan 2026 03:29:07 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6e2e4d104mr228351985a.9.1769167746648;
        Fri, 23 Jan 2026 03:29:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b886048e808sm68540266b.9.2026.01.23.03.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:29:06 -0800 (PST)
Message-ID: <2bc58f2f-5879-45bc-a169-fd6771faa21c@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:29:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zoSSP0LdT8iC_OVO1ylwBVniFVUUGqJA
X-Proofpoint-ORIG-GUID: zoSSP0LdT8iC_OVO1ylwBVniFVUUGqJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5MiBTYWx0ZWRfX1zj8PPI5B7OK
 vHLTo9AXQqHPW4KgxzBd1CueTiCI3dLmC7mQ6d0t7TOZ6M8IlgPTZANzspes2NTKa8wYUBysx+U
 v+Nd3rLR+64jVY+r+q+KFSw59hYR5Tgzj0uanWLYI1ARtCyuOWgQDvq1Tjj3CmCbRXC6o8Wot5a
 +0Yz6RDdDwaHChY5mSWPy2X0UsUy9/4nyWiAXJrJOkH9euGGxXaafndWqv3R2CU0WjUcOzxlOd/
 +zLL/izqbfeTMreiJIcSPz6PlE+P3lUTXSGROToYrMaNN6RyE73LcHkICcx0ZWp/sXq3lYc6tvY
 HfNqpnwZ3yjRMCb5WJnQsl+J6eTf4xL74cua5nCsZJLgp/jEkc1loDcz66mTKA7A7hHYbPdCu8d
 PezEZfOTeZAinf1jESgVlIwURCqmNEZrn5HPkIqCLWhQrwJ65yyBIDuJ7P56mArjVzhe/43C9/1
 6kQm2Hm2Qf8kP7SJYwg==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69735b83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1xOKmRq5WjHV0F6GIOwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90333-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 416DE75018
X-Rspamd-Action: no action

On 1/23/26 11:35 AM, Mukesh Ojha wrote:
> All the Monaco IOT variants boards are using Gunyah hypervisor which
> means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Monaco IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * Monaco specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&iris {
> +	status = "disabled";
> +};
> +
> +&remoteproc_gpdsp {
> +	iommus = <&apps_smmu 0x28a0 0x0>;
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x2000 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x19c0 0x0400>;
> +};

The iommus values look OK

Please sort the label references

Konrad

