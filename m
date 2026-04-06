Return-Path: <linux-arm-msm+bounces-101935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHJmDgV402nPiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9403A2716
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C074300AC14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4453A318EDC;
	Mon,  6 Apr 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RslgA9wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHpdcH0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D824503B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466498; cv=none; b=Ztnc6yxBnu1BzfEvSN3LjcdlCTuHYfZpHHYvRjwDK0XzTjCT1dLWNQ1BRqbALdu9CnGwHCa2t/SdDrJwHX85XqfywgqgKCI3ZkAcnSROouRmzT0QePaGg8LMnEdxoPcxpIFxAynRGY+Cn84TxodXuY+/ywP9IfSIQnOPsVUdoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466498; c=relaxed/simple;
	bh=MfwoD0EbgFH+fWluI16EkhQqg1s08M2hAVKyQnPEwBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWAQaecOhJGWJb3x69xpbmW0y7fXA3UrXOKLMrzlo1zjskLLEK5RhfPBNCV+macV49tuYH+ZX/WULilHhWbR/7+35GRyazSds8IvEYO3QFGNDyUNIktCGh5Uv/3nOvAIXixvzWKCtnqzhAVungGYVRpbWcxtGUQ5gXVU8wsgknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RslgA9wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHpdcH0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6369253p1757610
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=; b=RslgA9wtaqqpgfBD
	SWVyAGQKq//A+uk52OWqGRpVV2pSemhkJuNEBXY27f0GoW9MqxRqytr+iQEPm6RT
	6kdlb52mcK1fMsT1Skma6YCAQ6ecUaz8kbW3W4cA8qb3lGiJcloGuDmPFc6Smsbi
	2xOJ5dwkzR8EvBeyDyVmP7EEWpTmarFOd2CYjzi9+dwAXv7Bx94aVxnGfvCJLzLA
	CUelAqpk2+j4Kv+7WQ8jBEPW3FESPyBuqyADu6KkZnN7zDLW97WpUCasnKqz7jc0
	6tUuoDyOJwsYJbRUrH1xtLC7Wj2LVdrN3mgtZ2w84ZwiHyID0yVLmgP/JE8S6n6G
	1GEfTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8cje2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:08:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242b9359aso35910515ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775466496; x=1776071296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=;
        b=eHpdcH0jlFmIIub6Pd07hTA+3dzBThUNaLSfoaE4rEc20Sju46WwxGXk8Ht2yLEGlI
         Obn+saHeEyjQ/RpjuA9nhIL4MoekJlXA8biggaJ0TYd11AqgGPwiL7/z1PW2wAAsvgrd
         8jgDirJHsO2uxDeEpNVDZi2yB5O1znn1GCBMrzE7UIfJOYQLhl6go2qO/iNCS0MskSaJ
         ahXC+Lo1DvP4SNE7ApETpxCF6WWhEBIDl+talghxJN3ady05E7dM6L3qWSKvcqaqumbY
         Jvuw6KRiVJvu1hReJA740ZyVgY0d2KgAktysuEs1+I7KnLTTtgIu9Df8ww/uW7BLyLan
         Pnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466496; x=1776071296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=;
        b=HX8KaXwGfRvx/HqRbAtz6MP58CqwgbulroT7qyGq1UO1KFaQgplsPD6D0NMyIdHAev
         i4O3vqjssF8hiKl1SvU0eUJ8WKfJJjv+dc3UNiaJssK/7azE8q8u+2yVVCVnwyEcooFN
         BzwXQ/4t+UOZkT2Lbe1U+tCtFsOcvAZlV6Wkj8nL4t/bY77aiFNQ3iJd2CVrwjZ+VFJ1
         9PPC0t8CsO5U7FwazJXjYQL9HjNE1YjTudw0vO1CNTV6GCn7tg//GDLtqwpycHOXwZdk
         qPHGreBaDO+mUq/ccQanF3yLvGUtc3bGOEmo6FK7UHsm9ak8/C8t48MJ6h4mh7BIRVtE
         TCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvaeNshayte6ILpfvSW4F3jvfjnsJHiyBDwkUkKxGthEh9UcppmWakoPL0f2CJlnQ+JF3Diny/ZoWNaIMD@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIQeDZebO2CeZqQvDY2jhXmbYAdwj23zF4hp7lAQWR+IaI26w
	c9LXbcn1Ei5SGg1w63KQHAiVbvk/I9X8UWXjhCx/flM8g4J/6jh/SCNDIHyzoI8XuCgPicL5JbI
	lL14VKmZ0iB+hsJtvkuhlHiFdVQwLWoU+Z/Xsevm4MMYyHZ4Bf3YG5fp5q4gIY0iJt1SA
X-Gm-Gg: AeBDiesVwKKKgIaGBwqy+D5Hu3GtKyRnXi7Bx2b9qFZYagcfCXmiQMo6/ZFU0JQx8Xh
	mQrM9fC+G1KX06e8WMnXCbc7z/xYc7RbqAHDfIoDdFb99U0ESYqXAsZGGAHfM73hvUb7rh3xcGt
	FdNJRvZkDULocYpUbqPcVCGW+6IcjyS7+FEkfQ0+BzXqCDqyircHhROpJnSxuqnqpd+BfaMwxk0
	0ZdDdfTQO7vjR8YjfFbLL2leCNv6KiubIKccyMQttIVwVqIrcR9cV710lw7B3+lHPsHJSwVkBLD
	mpedhbrDVYiF64uRzvOAuA8ABLICqSBrD68mrkWZpmQdnBbeHn+k0CfV7gh/HaqrtEPvH3y/ALI
	H73fqxdOpRfHhUutGLHFupmWgk4ZlmRWbnCQvpvDpOSo7ZmhYe1hJcw==
X-Received: by 2002:a17:903:3b8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b28164cfebmr127253785ad.8.1775466495646;
        Mon, 06 Apr 2026 02:08:15 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b28164cfebmr127253395ad.8.1775466495178;
        Mon, 06 Apr 2026 02:08:15 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm140897505ad.53.2026.04.06.02.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:08:14 -0700 (PDT)
Message-ID: <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:38:07 +0530
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f0AVMXk4nXt8zwLzQRjmz4gO9N5hTPwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4OCBTYWx0ZWRfX8CV/bWPltCTj
 Yqq1Tj03cfI1ELHLu2LgS+ImS/dfK/vi1ucBMK/lW6IU09AYlb6VIyUeIT7zMy8+6VU7CKIU9z5
 NqyJQPoDUnoahuuMxm5/PVuetpjWq3Z1R6VQFNuo/vtatRQqrfQAfB2T8Rx4vDqMST3gP5pwFUU
 ZNXensH4SvFH7QyR9eZHU9aSBDRs05Mphbhw3+QYvZcueau//Qj1kskPh6WG6MhtmM069qNzb/z
 NhZf1yR6+xKtcRiHlJzw7fL/f0MgivyXzRxK/BEsw2MDl9rwBWjX5PqhM290Mljj43X8Yyq2Qub
 RmYATSFP18cOQVXsTmPJTf2HFT+ou6DlMo4jrCu6eqbWw1DQT4lDLufgcAKiDBryHoFh0lb6bcS
 z1fzKci241ORLqpXkatDDIYmlyxcPG2enm2lx76kIk5qFvzWXVN9xy2WfntnMKP0DudScbGTwHt
 wRYPg6OlSNQPRDK4YXQ==
X-Proofpoint-GUID: f0AVMXk4nXt8zwLzQRjmz4gO9N5hTPwa
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d37800 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TnsRN4puekgCtVQ3KW0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E9403A2716
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>> integrating with the DWC core suspend/resume helpers.
>>
>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>> into the DWC host operations so the controller follows the standard
>> PME_TurnOff-based power-down sequence before entering D3cold.
>>
>> When the device is suspended into D3cold, fully tear down interconnect
>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>> by keeping the required interconnect and OPP votes.
>>
>> Drop the qcom_pcie::suspended flag and rely on the existing
>> dw_pcie::suspended state, which now drives both the power-management
>> flow and the interconnect/OPP handling.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>>   		ret = icc_disable(pcie->icc_cpu);
>>   		if (ret)
>>   			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>   
>>   		if (pcie->use_pm_opp)
>>   			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> Does calling .suspend not drop the vote by itself?
No, unlike genpd framework for power domains, opp votes will not removed 
as part of suspend.

- Krishna Chaitanya.
> [...]
>
>> @@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
> Similarly, I'd expect that .resume restores it (and you didn't do it manually)
>
> Konrad


