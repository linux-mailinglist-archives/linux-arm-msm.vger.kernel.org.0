Return-Path: <linux-arm-msm+bounces-102150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GNTLi7s1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:36:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F53ADC6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2224300E16A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296F3AE718;
	Tue,  7 Apr 2026 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npziKh9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDztrmqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D573AE1A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561770; cv=none; b=J3a/aYCnoNQ8Ypw94vqWou8koQHFLNX41Bbv1G+sV8pPZM030M7yDUeHAP/tlJh+jmb6h2rtgW1L5yMUAYC123tQDpTTuHDhgzK0M2oOUIevdjdFmngha9mJSNDn26fV5enLzRvSRzqK1Y/zgh4VgHBbTjfF7ff0XN4cdp0KU7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561770; c=relaxed/simple;
	bh=1j7bzSA/i3wGxmd5mbRqQCOd/HBr3xNh0vLp5u6w8FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8qFbdtBNecJLhlg+rwRTpBUp6pSJg/dwvsHZq1kAWS9cOl93s8c/jyBEEAfvm00TaKmCXPQDQponldrhyDXW8iI1NfMGzcyJmiWITnOt4IJXv7iI4nHm3X2McJWoYD6bgsmqo17NOVxnS40wZdWJndwRm/Mv5WTQk/cnEtlO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npziKh9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDztrmqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376RCxW2328024
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=; b=npziKh9IshzOvxRw
	4ac6g+Tl7qNY2JdkQsjtXfEXoIiZIU9IWYE05R8xxQhz2Kbjz84Mah3kwKBYs0Cm
	HgYWJP7/5ESrY7bAM+d9V9BxryDekaVrerw3PI34QxKp8FY8/WWBGteGRcMZlnIf
	MxqTD7jHp3sBmnKZiSN85k2cHuOzq2vThrXxoyIzqi6jKHCpdn0JWRTIDBldO7t/
	qYO/y78bb8ztJxCa8ev/S1QNER/4tVhlotcbCp4kEuW0/oz51/QXONXgtezung1r
	CY62XG8i0l1eya5dFHdgKhYin4xuOw8IltDpsaRDmCL51jc7PspZiNUlyJXhRGIB
	Dk4+kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tgcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:36:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2a1f123fso7370641cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561767; x=1776166567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=;
        b=TDztrmqwtHvC5veDVr8G22ly1Xpk8/bicbf+15BO1C8wwB1pKNSAPkAknmVznN1xVk
         tNgdGMY4WkYezGBshue6kdk19t9QpqU23TqT4oycccZz3AojRxkOjR6eDq+BlhU2aJmf
         mGVtJepg7wa4AimasaO+GdLJM3zSFVmx4K3+t6qNm64BbroJP51z89TyaoZkZjlphU2d
         yhjQrL5hOKnhPZNtFwWs8DP23fTsH6uL+t9sIEQMZSOQBAM4WEcAUdeQoqvs36qNCUO+
         eT0MwD/ns2fbGxtRnfg2kgoj04in0YnEx9EU+a93y3OSnGw7neKQHBIsTCORN9szoGW2
         meRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561767; x=1776166567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=;
        b=HIZ77ZKALBTh0B92bEQK2sonZEe/BP4e03k5IQwR9FPJ4N5VgSh93OXF4DnWOTt7Ci
         ujC5xV/jkkLhmpyIiv08/XJGG847nkX1R68SM2bFQzHy6o3z/X7D4kpMA19Y/4Z1nAUv
         yxaQje2Kcoa2PP0uy12NDNaMLKxntbYSzCyelcru/XStF25yqb0G5PguTCRQKl/6vIO3
         ZsTgfjY6lWTl/jC8/1k65JcDUcGxZARnZ/F20o4/QMzxMCh+llMJCjtkbm9hShVOvujK
         9hcLDgfjysHtCbyKLo0I9Qb3yrWGK723IEst0Mgya1+2q5BfAVHzDD2pBdOI/4a0Ru3V
         3Yig==
X-Forwarded-Encrypted: i=1; AJvYcCWpmBXUZ8pzXRKdvCEdxXlEdEX2lRwbG7hkUVw/Je6hEwaEHds7RxsDkDvTixjKndfsyuVCt+13I8oxNNKu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvBuiVKwVg86Wk4O5nU3d78QuZmxcmyTq2ELDmDZL8pB6VHCw
	oo51ArkduzITdh/nNQjEZ9d9VLWkE0SPFPSbmpv8lb5Oe4tPvTuj6wdtJT7IF0l8rXaRl94AdFV
	2G1mW1G4M7w8cGBcnVqj8bd9uUgJLQ9zMuCAeSBpf1jRNVGOVTLvzU0ZiR6tvSotLjztj
X-Gm-Gg: AeBDiesHA8ScDildvAHW8A0vQyLmmmYV4siEb8roZgUucZtGt1V4hGubMJjAZLJn9iO
	b9sECP7P3wXlV8ZINAuyTm4LRTogUmZOOYsAcLzoooQDGKM/E18xqydqr6Ep7LPpKznPWoEdYl2
	W1/3+WqD1k98+efWdDTwhat3ekr4FlrLkYNbQCmY/G1zbRbfHliukdUX98QCjNZkT711RRNE1Uc
	sj1+T9fy4+Gcw+p34b18BSpwMuHSzCG4czv/U47Yb9puovldXO6Jwt9ILF7Z2NeKMj/YvXhP6Zj
	Q9Xp+Gtf8mdMpW7SaOKniBOIXHVdHOI40E1KduQ7Kui1nlQ7+NYDsUYN0ZX+gsbttFRqldR4Y6D
	EoyTitqGGVA6wNHTlC2CAmB/sJFb7TF/+JvrJr0dl4t0ig8v2Yv7yjp7mchLgE1WuX41DnFbLEk
	Vj21M=
X-Received: by 2002:a05:622a:1883:b0:50b:2972:4bec with SMTP id d75a77b69052e-50d62b57f2bmr191597071cf.3.1775561767233;
        Tue, 07 Apr 2026 04:36:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1883:b0:50b:2972:4bec with SMTP id d75a77b69052e-50d62b57f2bmr191596721cf.3.1775561766706;
        Tue, 07 Apr 2026 04:36:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d0287b5sm547504666b.56.2026.04.07.04.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:36:05 -0700 (PDT)
Message-ID: <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
 <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
 <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfX7cJsrhztk2oF
 wmvJgMcwQndfTHnpZyVikvPyO8m1pUWeKbX7w67HTHFMat6cMAQwcc/Val87BRMM4L84XVmQkM2
 lbWFpTLZob0Visj3Gl2dHNIPyVQCB6/SG3lvlAJ2tntjPfGOnENchwiqJgI9myk8BgQGRd/+9yH
 vYl4jsMhRfRHOF2RSlbXyttdaRsd1Ic5PriH0nH93hZe2uGUr5aWDR2e9zHER+aX9Dpip7DlBP/
 /Oi2Mk0l5l2c2JUQEmwDiCuc1nbniyVbExj01gfE+TEjvkNPZuxmSdrBLOBTFycDWXGkriCyn5/
 IIbNOzVH5t5hactJg28JUK9HQZCAS2FpEXYwF8g7Jioj73iQYuGL0f6Jv3wi9wiDPuzB82VUJvr
 cXmapMazusMIfjtcvpxOb7bfBbpQTuEj5nTbwqaWUnbT1bLFrfmZTizT81p78CVccH0+AhpxgSy
 y7wAJ1RvKPy71/oIJdg==
X-Proofpoint-ORIG-GUID: NWvQXpgKgk9FO801p37g6VvRZKPwFtQ8
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4ec28 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NWvQXpgKgk9FO801p37g6VvRZKPwFtQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 326F53ADC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>> integrating with the DWC core suspend/resume helpers.
>>>
>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>> into the DWC host operations so the controller follows the standard
>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>
>>> When the device is suspended into D3cold, fully tear down interconnect
>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>> by keeping the required interconnect and OPP votes.
>>>
>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>> dw_pcie::suspended state, which now drives both the power-management
>>> flow and the interconnect/OPP handling.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>>           ret = icc_disable(pcie->icc_cpu);
>>>           if (ret)
>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>             if (pcie->use_pm_opp)
>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>> Does calling .suspend not drop the vote by itself?
> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.

Hm, I would imagine the power vote goes down.. is that the ICC vote
that's still hanging if we don't do this?

Konrad

