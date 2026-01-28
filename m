Return-Path: <linux-arm-msm+bounces-91013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPRNBfMAemn31QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF2A13A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DE8D300A4E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9649A34E770;
	Wed, 28 Jan 2026 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoe/GZK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCnLFu/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0834DB52
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603312; cv=none; b=hafrUjBcTGH3k+w3g75Z5akTdOg8NzRllIqE4K58+j2KE/tdbweSWm7o1Uzv+AssjYlnLEK9kPCb9SFIKVurv673OQL3FfJ0wROotJ+NugdSNKVrJlnLN5Qn8nm7joFUiViAQs2OB3zmXE3pKl/99ybG1m80VmPjjfa5JVm7oBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603312; c=relaxed/simple;
	bh=ZUX9XnVeoQciorqnBH2esQT3/fsNfcIkrEvDlXEi4gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8FL3PV+Zfmvz7YNd9Zb7QZL09H817tTPaCBE43UpKnxEIacqiOGs+Kwo8vu9plYu5mwm34KxaIW1kLM/M0D45vXtomem1K2rRlcgvBAkC2xM604FI2qpGSZpbGS4FkVMiMMzgXuys52msVlAX5W61rKYZAHA+YBxDicqmU1kH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoe/GZK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCnLFu/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927Ia3920920
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=; b=aoe/GZK3vTUzRy/w
	MoHBh8zCcW3mXfkwfyhi/TU9963Zu9VzJ27aTykGkNqRPURJ7+Mj+G70TYN3Kfqp
	qvCdottrWm3epCbfL9lhgC70jAvXY419vKb07waHP+Hpsod2FueJeF0vLwdB+E/F
	mnwc5w+NScWcERrq3VLamDsv20gfaNjcUndJ93W8JS0qGOLCjEWx2+X2EGSFCQgy
	6fvk1t95Q6aWj4OrHf/Z/bp+rHDpPqNIWEQIe3qzJlXWOGjwSrO0nxOaegpJ27NE
	9GjQESAS0mQUAvInGR0BOUVrQuDUXp6GYrk4dC/fGtenEeuqufzHaBWemYku5qpP
	ZBy5aQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211batb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:28:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so221874285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603309; x=1770208109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=;
        b=WCnLFu/grKePGikvmYWCJj0ZcclfDum6nAGBC2sJBoBxyCXlMKao3XDkt37IhwkPu0
         54jYAn2KvXBNFY80RHngOO18OBWAfx9yBUIiJkgrniFJ1aOlRdvvXCT0BU05gNy2V+//
         72tjKMpUDxP0IgWp6VseztjUQFfe0vA8vs9p32h15fcR0jhdN/MQNTzIKlLb2dzcsqLW
         9x+esD2dBLWZ41jZ/1kGjIhvdD9GJLHlg0n7zem6p+2XY+wxde6jcVDLrRdodsObk+rs
         Ccg/Gu3PvFIFd6FxsdM0s17AuwOP09NPxuf4BNwuXb2btKv3ogZjBma4JpP3j20TFDOJ
         MzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603309; x=1770208109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=;
        b=G/7CxUmbZegzOcXxJwTplInckeRWIou5+LxnzRdS7L8UGrUOlub0nSNlgYN6hxga8z
         vvOLM5ajera6R1bwRTYoQ6zWmkk9o+fIL/nhjsIrAbcv3NXzBqr3FlWUx6RjWmKzit7l
         R8fHzF/U8lRAUD+C8iaVziXMkELHVC4CKbLu7VvDfdeyB+j9sKBSnQMmYWlQRvav1Whd
         F0NgxiTUHdEzU7+AatBhnUfwhjRGwdnuwFgv8zlSN5uRQLQcnxl6wO/39GfZGBqoEpML
         znCguqlg3xgyOyy3ML3kV44pj0tq3ttoomm13ZJMywy6kGUAu1fcgGeettcgtCkoGoTV
         SCWw==
X-Forwarded-Encrypted: i=1; AJvYcCUsCjwQosW++9nhuKK1FYplUBPZiZYoveEbaCwnFzmizIOT4G5Ksq7uHHISYurHoPwzrMjDoGlOK+6MM2Ke@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KlcoxfKL3ZFEN79TDsCDdFPqQBdJfYWeVdh4G8V8Azqs+tgH
	bPPqJnZDsldmZCHEpiFIMmspQmy9tQ5S35BS5H08GGMpmQ27RIGRcBc2rekxLyD7qQ3/rDeMVTv
	cbYpNl7BtplLmQeOGXLD9TUuCP9t8RIvbHN/7LthzdzlORiCOfkx5Ia29/b1tIysp5ibG
X-Gm-Gg: AZuq6aLq1V2i/4oXYJ+d4fzyZqXskXTa/vP64YM53fKFL0FZOYpAoSOeejDrvrQOPsc
	dsUDAlskoZda7FAQDlJxH0msd/vxvEihiz2bQe+v6E50YAxLH34D2pIjPgZXWcaNd3TbDsHMyln
	RWqHt0GRwQyVZLtvkCfv86D01VAEx75j5dWegmh5FdS/LwQ6eyeHfg3OUORvCDkOzMHY9X2O7Qh
	/iz2lv7lVSlwBHtK23Yap2qkGPJRP2k2ytBMLcw0aD1dHgznIr6WEE04dhxbdTYKIf+fIP2czW0
	LZXBlcPolrTqSsQILNQL9Z+lsPVT185N2llaDquMxGfygPZo/CIcR4IYFi/MPmGA0h9Qnrp1k/S
	9a2xUjtQLc4Y0dHmHYIQVTMrN0lX+qD92b7fEi10/VYKiF9e04LAU2GCzhVKY47NtRMo=
X-Received: by 2002:a05:620a:46a0:b0:896:ead2:a657 with SMTP id af79cd13be357-8c71ab1cc92mr355085a.0.1769603309687;
        Wed, 28 Jan 2026 04:28:29 -0800 (PST)
X-Received: by 2002:a05:620a:46a0:b0:896:ead2:a657 with SMTP id af79cd13be357-8c71ab1cc92mr353085a.0.1769603309287;
        Wed, 28 Jan 2026 04:28:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dcb4b1186sm60595566b.39.2026.01.28.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:28:28 -0800 (PST)
Message-ID: <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:28:26 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMiBTYWx0ZWRfX9r9M2lECDu8f
 xts7C+nFXTJzoYrjoxv95Z6Z9T86g+dUse2kVVNPu+R9wTP8MhHUFEp2yafLo4BKFi2gs1Hdtiw
 yjKb7lB29LIIIuXMkF8csyYU0NxbAYhQgMS4OROuMyDH/kUNfuPB3sEOmd+70CYR6csR6dlD7mx
 rISwwrJbbCY11XO4EWY0lI+P4RcuQbZvRy9FRB1Exm/UaZOY3HdJdbJIc9bHtPdTPX10zHoGipH
 tIdXkt/yzx0iG3GHxeW6gGJgDc3rXKMu3aun4/DJrAWrtR1lqjZRLcAXzxJ1hgfTaZK+zFq4mLe
 Q0dgJbGpemjIntPVOOp8p2NlhjrTiZFP1J8sTjyc7bjh6uwbnrdVXmQ70PkrYsXisibYb2IdmOL
 u3Tntr0toJudgS3yBJVgaxWjd+aBWhVsxeyaYIqVK685RAmj7A3mUFnKoE5bQwHEJHMndohgL2M
 3qq3CulQ6sGwRnoZSwQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=697a00ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gkRObvzxmN_HJK3DEhcA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qbH9oURXUWb7b0A43TWQ96LePhQ9eTnR
X-Proofpoint-ORIG-GUID: qbH9oURXUWb7b0A43TWQ96LePhQ9eTnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91013-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BBF2A13A0
X-Rspamd-Action: no action

On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
> Add pme_turn_off() support and use DWC common suspend resume methods
> for device D3cold entry & exit. If the device is not kept in D3cold
> use existing methods like keeping icc votes, opp votes etc.. intact.
> 
> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
> in the controller.
> 
> Remove suspended flag from qcom_pcie structure as it is no longer needed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +		/*
> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> +		 * Because on some platforms, DBI access can happen very late during the
> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> +		 * error.
> +		 */

I think someone internally once tracked down what that access was

Can we fix that instead?

Konrad

