Return-Path: <linux-arm-msm+bounces-91107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCjPGs7vemkHAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:27:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0831ABE95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5B7300DF5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898812DA75B;
	Thu, 29 Jan 2026 05:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAmmDBgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFpRZcob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241D2D9EEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664459; cv=none; b=mYrjJNMSyl8nLYMunha954DchUnJvrOe+FCVe/N0Q8DPLYP2K95vZOGFqhSzlq18F8rDlnVfaQ6v7oLByQdqKD5hgVOLW8ZZS1AJwqPoECkdh6FiaUVPJy1Ak2Fp/i3RISAI20JV12bGXGKk1+0Xjj0DbhugOOEYonbbPm0XETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664459; c=relaxed/simple;
	bh=iStT7iBgxnm5qqn9kLoLhSDoutuiN+yQT4k+LPPi+OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxnR20iOEjlBuQftU/2zZ/RjBdUvl9okj3ALw5b+GbAcI6uQvEN6fkkhdO9hdXMKGAYWsmsxAVCgF5PuY2TnM0Gl0HYsAjDrznd1/vjnDu+qlQzs3qx4bz1SuiRLmVzuo6cD5ENrrChiT8Gi2c74nOwIFXDygXrYXEcvM2bVY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAmmDBgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFpRZcob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2okhb2663840
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=; b=HAmmDBgI8ArT+IuO
	BcB/YaPxwK6kJpmQbg+LvkQc2j8Z7Z+1ajsOGke1kIaQyyZieD3pSumS7WumuilH
	Wd3J+3abuBi/e1DI1NVJCJWtU7WyrVZ4hftIbOcGBQpQfpxf6PjFK1rOcAcZbCUB
	gk/NzhZSJKnqpDzAr6EilEIop70cp+l/2suPLl7NNXI9UvWfUizBUFplnWWV6BOm
	azsqqbes+wjXbqFjt5uwLz8GpYPqpSU7rMdzitWICaDL51KT44nkEirt9/UcEKk6
	K42yMAm6QALZvY5XGMTR/XHPjrRThGVCRc4SKfkgIdugG00HxGEI2UaB2Im73ol7
	LQ2gtA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphghx6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:27:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a77040ede0so7049575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664456; x=1770269256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=;
        b=AFpRZcobVeajnJXp8IpklI+4nHuB6m65+72qtuJ1hxLdssi2OSVSuxtv9G/ArM46rZ
         OFXlQDsbPbl7mKMjitUvxSmyK2RLjD8XSN0mg30p8TSRX0biRpyW/4/RpSlDsonu0Sit
         ivEedWKYjUxdkqtCfHbAcc1cVHZA4Er7bj771IJfq4ijK6rLUuycMpJVr5GK/hGKaLf+
         u9GTkmbTq64y5wauc2ue2msrKWSj5eS41aiikagdG/OBo73dK4ktGZ2tfjJgvbIafUhm
         bHQAuErQXUNJO+KVQ28QrM2YZStVczZYpdiffpOyaUFH/tcreW+EaMNtIa/ir01EOH8o
         jC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664456; x=1770269256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=;
        b=IIrc94nYuxhsgEwP5nWLwzeWdvQK2MUYjDvaBDng/FkSc2jkm5RPFZmmTBEmlx31TV
         6HTj6xvgnjow9pThufgcP9/MTb/W0JxP1g4b2qEpFJyOYnnW8FeLwjvCn3VKHrK5io6N
         R9VVXAe1Jf641vIXFc6LaHH6S71J5gjPLRRLg7Z5DphI0bnXMeX9quN2uwMAmMUhqC50
         hWxLXFH5exOKecLJKLZLFOvENVNWYQHyLIbnGX+Vbz6WlLMPGynR/VbpL/LldJ7aMPkt
         UpNANCBetujAOqhDPLJhzgY7fS1rssty28f+h8+p+5ivGheWTWEDnU3gUbi6tEWwrmmr
         AEew==
X-Forwarded-Encrypted: i=1; AJvYcCVb6oTfzYHKwbtAykxAtQDjzZSIZJQ/M0Eh7yBnJ5+yKB3fnzOc3udZCWpAAVA5NaET4V562jdp4+vPcoFx@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnEIf3iR9QfnLMVWzUtO0zF+dUdMjtxYRudpOOxGEZWSyHHWT
	puDcerkqQiVv469rHUoA1pexzhwWDCyRSjKt70VjdkwARAo2E5KgS+Ue57UxKz6vAmEC+9Apimg
	sp+hXRXyqPcyl/zYlneEN3w1v7mOHh8q+T7RXA9T2ecAmjKRSx+E6UAcEIT/ppM6rMPum
X-Gm-Gg: AZuq6aIKzbBA5k4mZuwFcREo3z0Spmvz8RkyeBQet4ptAymhF4FFgI8HF2ap4a98a55
	cfbSaCpQlbmyf4sjPKLaXzx0vu/rZZYCNfz3GlvV9Nsynw5sRGozzdKEq3H9LyrUyWEBMUvOTqf
	l6zQ+KLD2PiOd3Fhf0dGv2WBERt2IAIzyp7Vgk11CgzBd5XsQZGddMnflvl+mvfJ+0TuO/RWSOj
	9SNa7I/wpqDeojIHJO09OAFkTxcP7u5CbqE1Hv/PySojn1wd4Y2oAekDSlF6k7jo5Sz7lq6iF0t
	BiER6sCsHbF6F/iHFKfk5kjbAXBkL+tCXW/WD0oBbJK6Y2eHWa6OGYMads1ww7EsEFNLIeK1xqI
	Gg90qBb1HhGwnc51y2TvYiC4uQqEPr8ffniK67huZMw==
X-Received: by 2002:a17:902:ea09:b0:2a7:683c:afd3 with SMTP id d9443c01a7336-2a870d4cd85mr71591805ad.16.1769664456035;
        Wed, 28 Jan 2026 21:27:36 -0800 (PST)
X-Received: by 2002:a17:902:ea09:b0:2a7:683c:afd3 with SMTP id d9443c01a7336-2a870d4cd85mr71591645ad.16.1769664455580;
        Wed, 28 Jan 2026 21:27:35 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f6c7csm39838935ad.98.2026.01.28.21.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:27:35 -0800 (PST)
Message-ID: <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:57:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MAI_X3DORxR_-4eLSq5UbgJA5l0hjjgo
X-Proofpoint-GUID: MAI_X3DORxR_-4eLSq5UbgJA5l0hjjgo
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aefc9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TnsRN4puekgCtVQ3KW0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfX+cWyYJZvNsVw
 RhtPKe3Xp56bwqi5z4A4Iw8xRn+nV5xYR2PL1dg26kaouH5AYGkM7RhFTujTlm7IdPdHwI1lWea
 3zJ272YLtaP6S1jY0WpLQBgfnpJyU2DQoorUMvcoXDSXcABjnOB0zo/96XP3goATe9vHW1I0AgT
 D91/XvsQDExXb6gS7naA2/ejEcLdudY5HRms+6kUtGgQNy5PVDS//ipYZCB5WSm7CjAbly+7Bgl
 3KXj0IRZOvEgavM/cCoU/wsr9gWncS7s/4ngssBTEeWC6CDEcN2WgexkXAfMBne3cHvFWNETGCq
 DLnGXZvKN7ZsOHjhPEP+bG2dAHPRzVy+26d5PlFIr8PMiQ+OYdtjmlIP9iPH58e+FEInLejIFkE
 uJYZRjukS4QFtzqfeJtdD0OMIE4neKvsEicw3u9g0Irr73Cr1Ivese+ooDVmziysWusCrE7vD4J
 3frjNjQbBe4LGUfXNIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: E0831ABE95
X-Rspamd-Action: no action



On 1/28/2026 5:58 PM, Konrad Dybcio wrote:
> On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
>> Add pme_turn_off() support and use DWC common suspend resume methods
>> for device D3cold entry & exit. If the device is not kept in D3cold
>> use existing methods like keeping icc votes, opp votes etc.. intact.
>>
>> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
>> in the controller.
>>
>> Remove suspended flag from qcom_pcie structure as it is no longer needed.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>> +		/*
>> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>> +		 * Because on some platforms, DBI access can happen very late during the
>> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>> +		 * error.
>> +		 */
> I think someone internally once tracked down what that access was
As per last debug which I have done few years back we see access coming 
IRQ driver to mask the interrupts
as part of disabling non boot CPU's.
> Can we fix that instead?
The only proper fix is to keep device in D3cold which this patch is 
doing. if some client drivers like NVMe
doesn't want to go D3cold we need to honor it, but Mani is working on it 
to allow NVMe drivers to go to D3cold.

- Krishna Chaitanya.
>
> Konrad


