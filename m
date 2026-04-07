Return-Path: <linux-arm-msm+bounces-102151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GChKKoDs1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:37:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 100893ADC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CBA1300A8FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7213AE199;
	Tue,  7 Apr 2026 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW6JDQ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhqTFnPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E53221F1F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561853; cv=none; b=RaSKfBlpai3h+wdmxzN+KyZ9mcWTeIiaJ/MmA4ek5ys1p5EW0KyGNsFGNYHQtcAOIVgrqkTM11dwfR8UGM9DcUgM5NsWSka/XDRdJtmTFXojaf4M9ozw1dOViFQxCL/Oworyx2HJ8N0QdeBCiVEmjagGZJeXH/WiMTJyy5ZDai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561853; c=relaxed/simple;
	bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hS0rAHIc0a4o5BsA7pVGeRT/UlrvAIQDvWIQ4C59SFOeCxTuXZUa6Tl+pk9bGwvOD8qb45xmCkqcKMSaWAxTFCpyKJXJzTRYcDMMeG7I4S7JSfta8KAK0NnPTudtWRQ8FX21T2VWh6NOORGbjZ5H+Kye9SibFvZHHkc/SR1sILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW6JDQ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhqTFnPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gUWP492494
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=; b=hW6JDQ8CE4xQnYxT
	qqy31TKUnwhwrXoLkAMm2bSXgIXhPPvHRnBnx6oKcvUpBDB2uCOQQWAeZvAubsDM
	JdGEeDzz142dCXAoL3xA8QxIigULTLuKpiNHlfOC4QmLIcmfqcbOXg858MdVXJ2h
	6GUmGqTKki6pAg77R1kfVZXG6KNDwMRxGRtJ3p3XWBvZT/fYL2uq0Ilk3g+Q5ah8
	NbQ6XwvSDH6CvqPfLv3VVs5iurC6wdxOoyLL9aaAr+a6Cl6qN5GZHaSkJyLWl++/
	ibBtv2UrvXvWpGAUh7SjTLPcDE/cbT5WUEOwZazQooXJf94hKYsRCfioBaJ6cfEn
	vFC31A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tf9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:37:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23af7d7e8so138125105ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561851; x=1776166651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=;
        b=HhqTFnPCWS6glRxCVXObmpKDYF4L+BnAya8056tfEbgOtbui/pTI+ky/2YCCGJIG4H
         R4CCpntfi4tbLY8/WCOwriL+m6IlAfyhkZUKqMAitADpwaFmV5S4VvZvB+mUS5mErrhh
         fTB4ZbmkRg5Xdwt+f4JlV02ruHK7dgIltjiR9KPYQS86Vw/KqlWPVDt/bgnNVCKFNVyP
         SlDe3dq/FteiS9fApQvED28Qzesbw6bhFMJEMzAmRA8o29UoSrexjRvnZbEfllhsTCTG
         mCiaAaXrWgwKpbGxjnfCo5CU/TpSGJH3axrKuOh2TY8XwD5re9SmQJhTiknqan+ptXCX
         kFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561851; x=1776166651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=;
        b=JQiE5eI4elaQdCJGovDf5GvFHO5FB/zFeoN4vJiY4mUBKFcCn7aDN7Kcyn0ex3NxE9
         WXFLKn0vb+Ia/+wrCaiq5U+Ggpf+ZcekH6EzwAqHTXUoxbVXZMeFj4QUhl3g+juByjiW
         yp4EJZJlrn5EELy5PN+QHDs9HU2zbXiR3ymkA958wUP1BAZYUFuXqmcCGemmD9e2eIRy
         XhqnOkVCdetpeJIhtKuuObH5cHtWFj7sl78VSoXOSjScPFzlyL5M4TdZQeZ4nMHwlHZO
         bGKBV+zGYuo3zv29d4MWo+Qz/k62G8pZ4IwaBvuRsoaI2aRuOomVajzFPoAbOASzfyOI
         pE5A==
X-Forwarded-Encrypted: i=1; AJvYcCWuL5U9GNqYfUZVBZMEOf8Q5v3YcUgQbAcKHXV+rbY7qOC6YokKbkfssIyoLLQ22wngC82arJPJar+UCXRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/9tedaPGQ5xJaZo3GkwY/bwSjd6NbQsMDknwmlTJMEcpScI1
	m0bFV0/8dfTsGZOX6xPTtmIO0CYVRlY++ylUkvl0W5dOSwPJq5brXpFFIr52yi9aZL47dpySJHn
	1g7OREZ7953qe7CGx+vIFBoWVn+SxqitcpaWJetS/gehjL5YQISVfiK70FtATahWUoX2V
X-Gm-Gg: AeBDievd2lhybpOaEg8/KZejFmYbryHgE2JUVSEyOdObc5biBG0M5EnUw1BZ30bUF2N
	b/NJUughr+ybzXk2JOdqniTCx7n4RRSEoNhUAjf0RQmPFYxClMta2i52hvCgbaRTDDVd9uJlYs7
	9FXJvYgb6pPGgJlMCy9ZrmHbhjVidRpjvrsQWoFnAXyHRhCRhNCpC/sGKIOx6FkqIZRW1EypALl
	JWBjP2+PQNR1cHREdrA2dC2r+e7nTEBgXJaZ0Xxf61AbZ67bCO9vpYNDPcQFWQAak/OqVmzoMZq
	j5PQOV2uzR+hvCWICQKeIpzByh0JcQBo8M/bLSxrNeQRxrZ09n/b1aVt554saRIePGmdZ6+6Hro
	KgwoPLAHbIzd1eruz9MeBGTIeMJsS2nWAV9Z3q2zDhJyuPmCFMo5ufQ==
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr176408835ad.1.1775561851212;
        Tue, 07 Apr 2026 04:37:31 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr176408545ad.1.1775561850792;
        Tue, 07 Apr 2026 04:37:30 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2af067a59sm22227085ad.10.2026.04.07.04.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:37:30 -0700 (PDT)
Message-ID: <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 17:07:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: amyggtgJHfu4UAMMguy5EfkonHQFvWu1
X-Proofpoint-ORIG-GUID: amyggtgJHfu4UAMMguy5EfkonHQFvWu1
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4ec7c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MaFP3Q4kykvwS0bM9pgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfX/cOkPUj8xTG6
 Y6taLC08QGjVwi4FvDp0At5W1TJvKjLBw563onhml6w+PwWmYo0dCR0EMoC8HJPwoz++syF+f+F
 sJFPs9gUP9OvP4gJQw892Qt8DyX+BcGbljxY2dGFJ4X9HyHGGsInxeRblpUHuffVmS8drCggIe0
 ycgwpdyX4MCBvsRU+PoZlN/tDPmzi205aNbbkvvCe7AIp1kychvr2gTReRvPwWPqKUKUQEOoYnA
 2qVx/UTb0WItKEUe6QEphn/pn72Op9Wazi6ZanHWeG7L31Wto6NMS+YB6Pu1Kw2w4LbH+Cd74fR
 YXKSNR3lEznxeZdHMlJT+gESaIuDUb48s6fYbl9CMZdcJLvvuB57D1vr4StdRpGIoDMcnWDJak5
 msBhhxz1LRzr0h/Z3fPBTfEoO1W52CI/vk4W2H5pqe3eWd3aDaAz/Pzkkapp4sl98TToWFB0i24
 IdmCbkk2PgjS60WueMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102151-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 100893ADC9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 5:06 PM, Konrad Dybcio wrote:
> On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
>>
>> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>>> integrating with the DWC core suspend/resume helpers.
>>>>
>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>> into the DWC host operations so the controller follows the standard
>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>
>>>> When the device is suspended into D3cold, fully tear down interconnect
>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>> by keeping the required interconnect and OPP votes.
>>>>
>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>> dw_pcie::suspended state, which now drives both the power-management
>>>> flow and the interconnect/OPP handling.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>>           ret = icc_disable(pcie->icc_cpu);
>>>>           if (ret)
>>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>>             if (pcie->use_pm_opp)
>>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>>> Does calling .suspend not drop the vote by itself?
>> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.
> Hm, I would imagine the power vote goes down.. is that the ICC vote
> that's still hanging if we don't do this?
yes, ICC votes are still present

- Krishna Chaitanya.
> Konrad


