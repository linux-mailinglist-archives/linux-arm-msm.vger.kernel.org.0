Return-Path: <linux-arm-msm+bounces-113164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4NjAIcrqL2r7IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:06:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FE685F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:06:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NDdBzooF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AgOAaDfT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672A33083005
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A53530D3FC;
	Mon, 15 Jun 2026 12:00:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A737BE63
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524823; cv=none; b=M0nmDXOJH+pzfVyK0QndWcc6lGm2VEHCRDPfSH/la1xHkK1Q0nKPhsTMjnpSTheoPp1pRh7a4ZaEj7Z58ajd2yJfcvW/z0gcpqVlpxSuet1Img7PaM98ElIH3Gp/UCwa78mcXJoNkA5BYGAw8uN8cNNpgsFBVW/dNWp+N6aMwsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524823; c=relaxed/simple;
	bh=hbHKXoyGu4deLtGXCbCgei2HWeyURz72UwBCmZXONcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fggG8S5OTF1jxgXCCDRe44qTYXw7jfLgacXGNwzLBOcQ86j4+JTQC5yeZGa8FXioia1xo4CFDxFtNqnRUGC0c+8bb2UcgESMG2N0PpJP4evrtS6NNSOvSrAkLhw3ShZ+lGYSGEVATGxHv/SxeZfgwyn0FE0cXOIfAoYLc6j92SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDdBzooF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgOAaDfT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApAVO359060
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prn23hBPskgQBU2u3dYrNvgZ1YteGSuHw3+qudSgbvs=; b=NDdBzooFSXiEVoMk
	73w5iu4t0NcqGuYQ70/k0xCKoraA1xBsZzuJ730igJuJLUy8yoiq52BqWrpAMkjj
	jTcz65BzMbuhi3VC28nEDUzcF7RIl1Ng2NhS/aAGgU3dG5HVCt4T9IW+iY8dCqfU
	os0tfEHyiaBO+rWEJxr3UhVu+jNTEKG6ROEjqQTcq8Ej0vxM4AaL8jldf5Fpbwbd
	fngmPsrePZASgM5RqvsngeAtoob61wwq4Nticp02coiWfEKUCzHBOtPKot1woXSJ
	SVBz8+hnPMB7QC5BeGCz4dn8trzq56iRciVqLXdiaHuxGIRCcZNMM/zk3F6wKzsp
	TM0mhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c9137-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so80744385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524820; x=1782129620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prn23hBPskgQBU2u3dYrNvgZ1YteGSuHw3+qudSgbvs=;
        b=AgOAaDfT0ntqFJR/9dc43T8R5JHqcJrag/EotX60jsiYPj8EE+T3I4+JDnXJv1/Hxc
         imBCyRUWX8N8VHHhzucIGpt2ZjCz7f4XqwOIyQnlwovuCwaUT8FfmZS/lxNTpPS9G7Ts
         U9gwm9y9N9Hd1e5CxmEiU1FG0oPFmjFI3icGr5tmKYqqqB8/5e5UmagPgKmIIqFhaar6
         zK/jtOv/nvZFejLGZp+7oIppIaGJi4cJh1KETSVdWU5vsrsRzqS8UMJyox/Hrw1jCgkG
         oICz0rmu9myIRP4heDaXhFr7QI5Xh89Y0ul/uF4sjR9T6ybpW7YzM7RC3VOwkbLkqnys
         gyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524820; x=1782129620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prn23hBPskgQBU2u3dYrNvgZ1YteGSuHw3+qudSgbvs=;
        b=FnPjEJROG7F2MlODzaj61/9wZhB2XZMZMBsAJsJO+AJDzAeR2P9t6HaWpkq/AuXE0u
         F6NeubR5PTNbTzKVYGtCaMGpFkxEVpD5POE2kuQIBjC/7np/4yfX31cQ2RNcTyS/vmLS
         5YIa9ZB4u8VG6J+fZgJB9wz/ejxUW0hpmHVQmZte6OzusT6ybznBWqWxTpb5LBsUA2NN
         f7acGWOUBr7xNf3YIRLBdwSRFRjxybf6gPvYZ4UdzjAF/8ZK8Jcx2F1YHmOBDr2IkXPR
         Y2EPX+qY9789Mlrjiq/fHM+OXxqXyvHOvDqpUNS0wAzNDLOdfmx6EI3cHo7RwHtjnXW4
         gzdA==
X-Gm-Message-State: AOJu0YzGnfDKDbklE5ARKUNGwvRQ9RAY+ztrcad1FOAxOx1ldYzEHO5K
	zM0OXbnjQ4khECYhl+P5iGe36clIQ3WqtYpgq1Lye5STWFtVOYrIjQ5y0cS3KmmmFx4s0+vN2dL
	mQzANBgDmxs5QNQ4rQTHzSLQ4+vd9ZVSE0WUUwaLYFLUd4dGcUZ6QnvIX9uHVyEGcwI2R
X-Gm-Gg: Acq92OGGXmtIh3fcQYZSObGId3E6zptDLI5i29WITFDKih5mpiil+Y65uJuRu2tlrmx
	MO5/Bgh3tvlb8V6df9pnDTmR6x7MIT7dgUmnBLXgpnlm3kBg9oA8moIwH7lJ2qyemoaFT9DJZgw
	KlTu38stzjY0mMs88YFmFBubzAgKXUEt160MduWBj6YlbE+m6IzuBL/+oEkgl+ghOVgDTUCTwej
	W2N8qmNTqEWsdkAmY8HFZZ+WcSymg0V3Nr6OA1JR3gXImm8Fqz313eIlp2jKuiKMaCnXfNQrGxK
	fps6VLURXunxeGRDNgVdYDi7F8qzoJY1phFPXsHtXPFX40PoXjdyia4gRyeTcE4RZrruaw6XMxq
	WvZmEpDHXSVlVSkboUjflZ4W5gHtnec3aNnrFekoHAKN6+w==
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1315144385a.7.1781524819739;
        Mon, 15 Jun 2026 05:00:19 -0700 (PDT)
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1315131985a.7.1781524818939;
        Mon, 15 Jun 2026 05:00:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794aeba0sm3578668a12.29.2026.06.15.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:00:18 -0700 (PDT)
Message-ID: <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
 <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX0nyd+wd/sMIn
 Efn7GZ8A0lgDBA9o3dR0pMa3j7mJ316zBdtJYFgOs8VxtaEKFDAc4S6N33yceI1UqAl/67lNl39
 b9q19CeTiDuI0wG8iFF080ajpsserzBz7lI2nnfygXbOf6bqAYOdJxvLAKX04+LMJ0LK65dEnqI
 XiB7IMyMqYLnS91gnCr47P5IIuD3YQc6lMI2KIg/T/q21mTRSSfn5LhKx6GwVj4GqjSz2+9jjUu
 e0eg2Ss6tXUDGOQTWbMGnxp2QQ73VvQ4YBkn9HS3ht6I9jffNzJx6Vzhb48oW9LoGdz5F1JJ0QI
 f+8O/lj5+7GojEvVBWzxtNK+bBZ7WxFYVGOgUWHvOL3QXU9JcvJJ9Q112HB8saQJ11CZQ3vrRyi
 9FR3bZceZXbNOJUWekxgPIeUJL9ZWL3ROAIG1VhkbDZeSVyvsSIkswuVnuQVvsbKFhi1nHQlJ+3
 ADEOK4qt5/xHSi1xP3Q==
X-Proofpoint-ORIG-GUID: gH-q4ieAg7hgi9kRyiOalhEk6fSMV2FB
X-Proofpoint-GUID: gH-q4ieAg7hgi9kRyiOalhEk6fSMV2FB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX1BHV3bsf8Wot
 r2UKrOs9+5KQiPIrMVSauCK+AbI0aRuXa5xclKZFyEs1reonZR5FDtQMcY9BESHEmeSyQC5Zwat
 vSi8aUq6utYIQ2HZlfzxTM9zeadH1QM=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fe954 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lRU_OWu7LYBVTaocH2QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113164-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27FE685F87

On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
> 
> 
> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>> entries, causing incorrect bounds checking and preventing firmware
>>> loading on those targets.
>>>
>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>> limit and ensure correct handling of configuration RAM regions across
>>> GENI-based SE blocks.
>>>
>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> ---
>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>> index cd1779b6a91a..d0810960f3da 100644
>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>  /*Magic numbers*/
>>>  #define SE_MAGIC_NUM			0x57464553
>>>  
>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>
>> Is there any SoC where this could overflow the register space
>> (you say "certain Qualcomm SoCs")?
> 
> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
> entries, so the previous limit could overflow.

What I'm asking is whether the size of the RAM on any of the SoCs
is less than 455 (the previous limit)

Konrad

