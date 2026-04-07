Return-Path: <linux-arm-msm+bounces-102157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOlTOyr41GlszQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D4D3AE5B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A42E30065FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 12:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202523B3C1D;
	Tue,  7 Apr 2026 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcKAzBGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYHZNZCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A13AE199
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564840; cv=none; b=KEpijhlpTvZP1Ukxpq9CfY8+ifQdqhIkG82ae6k/v8O8gHkD1tZpnl15k6q75jYN+PawKkyaZ7ZZteW7O4Wt2u2m5Fosj5a2CZ96uY1Tn3A6BleEjgWv1NApxYknbMX1QutuJEN/cobhS6tzIb69IGcCSWCvVp9+Mg8Xp0fH50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564840; c=relaxed/simple;
	bh=PGfxzkueR3nRx1WShdZvaow/9FylWih2gh4HXYnQKuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saAsXzTIc78cxqZ7/YI4/OHFtzqziLNLy2y54RJ+i+Xh9IDivMwpnfkPsn8rfEEOuGNIr+AczCF2kWmQ3crFwXXm01Tg1kwvowEoJ1sHpuBis0HbFtRCYS37MxYBHpIaGasUU4xCVReM91/6giHtDBqkyJdCLHyqzj+tSYUnF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcKAzBGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYHZNZCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376vP074008704
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 12:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=; b=KcKAzBGuA+uNFqh1
	GUHpbNgWwIoGNOKORSUj3iVxVDVXXJ1XXA0wQapsFX2AcdjsbZra9geP0hmLaSaR
	V3aroWBEhwHEC3qI4zVaKoFXYq1r82xzdaZarJfxey02dAKR4b6SGQbsywjI9VMG
	gM8tBry3lyZODzTzGOaawTz08sAtd7eOr9djkmht6TahjmhNxomg9NooXhBCBqnW
	hmiNhF+rJ5rijbqYzF8Fra8momDu2k5RPfUA76f1y8ZAPLyWACHY7QzpinaTWT8v
	F45rNtozzpa9okshLJqFFLvv4txyuZ32bipbBkoP4lVfBRL7kBWFKSCQUIuwJKBX
	/R7fvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktn09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:27:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d87632952so7760311cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775564832; x=1776169632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=;
        b=PYHZNZCyi6OwmEHQDlvc+RSHEMVCPodRL053WNBQksavqGxMFU1+17e43ngC/l1ZhU
         ZVYiNZuTw2BCWd3sDHizVeADCOAYpR7q/I6QrfXz6Ovcwif+96cVmSFr7w5eQ9eaNTi2
         nYZa2DpweedUXY3AFxX7jwssjZ9gdjeDlg8PiMS6kaDYtGQcXjfLA87UhnFTMicGNlaQ
         uteeVKsgj8BEolK4JVutVkch1To2kgzNBb5TW9gtdffpRDFyJEGQ1w3Mb50Zn8mJ4Qky
         VGrm2S+N3QLW2Ye0qr8xgWUO9iDvJuUBcfQ3jRMwlmq5dSaqrWitR1DY/2xdLegsn3eC
         uh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564832; x=1776169632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=;
        b=HY9YskB2CE9iY0ZeSX6sEWWKjy6+rZTdbsoXcyXLcx68QYU/IY7kAZ0mS6+V2MXCR/
         LWJXRYzI1nxrVlYnD9AwW2uU0KeUpSsyK5n9ZWA20niWEn1ZhfkZh2/V/WesD57aEvEj
         Eg8FENpK2JAHy7xkOYZSCoZi2BRLWeMuiq/7UhXOqA+N+Do8ttzRzz1khDJeeec5cmg1
         i0uswjYifhteAHMcXGx5mTzGO7Xuu6USue7mYZMvc33WP7EC3M8Qn9LhwUyy7ACyDL6u
         eRKaSxZGijM2t19kC7xs7rC7tXDRYHOR4ytj6csHWgOtx86ovx17x60URIFqBDupZ4ek
         ozZg==
X-Forwarded-Encrypted: i=1; AJvYcCWOjTIp1g1PYPO+27jk0PhgRzp1kj9cKd7zbaHDmbLHNMByauP6iSzXV4c2ke4o9sT/qubmOCB1rwzhEdxw@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4g6LbTF8v5AuXQz3GTmHWfIrTuk0rKKiroUifBMBVOZvnN9J
	vkSa27vIHbTmcBvuYEZOE7UrsX1xDDxRP3teGT3r3V6q72Q9bXg8GUe37/GRfbCcs1UkKGWLqtM
	MfnxN2GxbiCKoOCeMg4vB/tzRUXR9trB1bGs1A5r4D8qVzf+mez3Lx2IkRg207mLMHmKI
X-Gm-Gg: AeBDievrPgRTywMSaxcR9k8XxFv5K5Y7Dtpb9K0U9xcj6QztlSFdm7z67NxaU10kDPV
	OAYLQAbrXuG3kTQhdwrL9RxppyYkC0se3FLV6SHRSY3t15bm0FKPfUeGv4svRwTB94Vwti29td+
	I4o8ZA74buZctNeCab9+fQR3Bm/BZ2IdDNo3b2f2891r62EUm+8mzR+ARk8D6AwAI2p/dXRkQ0w
	hpwYjBzJsJWZtMLMctMFdgS1eb/0ov+v3R3T93lsHRGtJFlcHU1mis/cLIk9ngNLK1WvljpYA6S
	kcptLNfdiD0JEwx2T0pJeS/fFkczjQyjAg7qJP+nWewGauE4XhT4WX8037x7oCQO0ZwBhZAchWS
	cBmgjepcGhZ6tjM9H84UgFS2vJ+02fuYX1mG08KcauBtckXoS/xoHxLvwZchlcDwXOoym/nXiFI
	B4kCc=
X-Received: by 2002:a05:622a:15d3:b0:501:4767:a6f with SMTP id d75a77b69052e-50d62c47a06mr180545781cf.3.1775564831688;
        Tue, 07 Apr 2026 05:27:11 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:501:4767:a6f with SMTP id d75a77b69052e-50d62c47a06mr180545411cf.3.1775564831264;
        Tue, 07 Apr 2026 05:27:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm547473366b.48.2026.04.07.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:27:10 -0700 (PDT)
Message-ID: <7223c10f-6298-472f-97df-8753b8935598@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:27:07 +0200
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
 <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
 <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4f820 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZCbfbMl1FPzj5El2ZOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4nMzbCNz5Kz1fdTeHtOhn_7LIL0bMHO7
X-Proofpoint-GUID: 4nMzbCNz5Kz1fdTeHtOhn_7LIL0bMHO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExNiBTYWx0ZWRfXxpySavJOX7dT
 rbzOxrz+LZgYtcARpOgHnqyeQiAnc1umwRh2+1YCMZD1YyU3xOLsrtfw7fjF0CzMyl83kVXVYvy
 aOUcJh/yJBNugAZKbryzWwxTBYby5kMspnNy4Hi4L1+FlsV3YadRLRWM9E87ONKqopoWSmz2J49
 4/8S42ea32zpehioGiXt4ndDrBkqhp1uHgWWR87eQNXNzgSvRH/NZcGkHuht9VPt7G06Xyio7Zv
 d1VvkjuNHNpOl/xWVwTQ3cVhfKr/lwODXwXDOftk8oCzcsc0CoV7mn4P7KQHENxsfiwi9/AFh6U
 WGK1rfavyEP5KgMiLimq5vBLKPVsRkDApbp1EsnFtwgUJpZu5TWMpNTd/yWztFMqeOvhwUfzlSa
 dxIwGIO9Ff39bJt04HHNQbC8bwbnbsqPO0LScf7EmNLHobLOIJ5qv8F0nZFq1lOqut60G9yNAUO
 3S73e3U+aJ3IPzvU5Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102157-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90D4D3AE5B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 1:37 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/7/2026 5:06 PM, Konrad Dybcio wrote:
>> On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
>>>
>>> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>>>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>>>> integrating with the DWC core suspend/resume helpers.
>>>>>
>>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>>> into the DWC host operations so the controller follows the standard
>>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>>
>>>>> When the device is suspended into D3cold, fully tear down interconnect
>>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>>> by keeping the required interconnect and OPP votes.
>>>>>
>>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>>> dw_pcie::suspended state, which now drives both the power-management
>>>>> flow and the interconnect/OPP handling.
>>>>>
>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>> ---
>>>> [...]
>>>>
>>>>>           ret = icc_disable(pcie->icc_cpu);
>>>>>           if (ret)
>>>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>>>             if (pcie->use_pm_opp)
>>>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>>>> Does calling .suspend not drop the vote by itself?
>>> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.
>> Hm, I would imagine the power vote goes down.. is that the ICC vote
>> that's still hanging if we don't do this?
> yes, ICC votes are still present

OK, thanks for confirming

Konrad

