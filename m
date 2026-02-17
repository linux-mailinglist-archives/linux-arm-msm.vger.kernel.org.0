Return-Path: <linux-arm-msm+bounces-93181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOk1IIJolGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:09:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EAB14C680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E8F6300D4F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62311360759;
	Tue, 17 Feb 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dybNB+Ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOKRIHVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B335FF62
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333755; cv=none; b=G2ebYMZQC4Hes8XZTyOwJ/tuT/BwbJZk/og+5Obrac9I4jlHL7nAVXHVb7KUr7oldgSkyAtWZ07o9t5AKRbfL9+LPl107VQXyegXR/Py3crfXd9nJP6cskXwiZ5r2KFZun0+5+f3Q6sJwfJrcwOU/b6spyrBh7VcEX9TAKcpUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333755; c=relaxed/simple;
	bh=08/3OoJXMaNcdEliZZW5uDgDHXHc6I9x7HTVt6Q4+tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e42P+Gv/Yx4LmHG84KrvA/X2A10ACntpEJgaMTntOG0huyehYEVdBD7aZsvj8OZLlxlgBevR4QzslqIsIMByGXL+8nXmqeDILNKvM7rXUREyWPTQKFCYNN0yiOGLZEOHvKKXOr+LTZ+yGktMvvNNwyRHb46Wpl+BYP9mBAjT6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dybNB+Ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOKRIHVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H93uCk1601139
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifylqg/fOmpo0N2XrSn2luRh1AIgqY3MN7R1u/QkYd0=; b=dybNB+IbtgzBOO1s
	5Ya+F27i4OYAhp00K5Nedr2c1YK6zn4RDOMh2HYVCMvKoCPIc1kVHtYFj2AithNB
	djKxZ36SQnZ/GAt863XAz/2t5WJBaETfSdfd7+dKTZpddSOuli7g0CBpvt0a/ejD
	/bBWPzAqwSiWtQU+7byN+qViBbf26rgFJP8rZLa/07PrvCfpJ0kPaJjEVqZvdUbr
	DTA3QBDrh3FdsSlr/uHlpeMzfcvmePnBfB4koG5AVrgCJQMOhQb9a7Cr3PFMnVoh
	DT91N87XyUEwrFadIBvh9lv5jzSawKrmlTpIJhEegajfTDbFOi+5RV9kPsvTzymD
	2HaXbA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmabq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:09:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3545b891dd1so18493421a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333747; x=1771938547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifylqg/fOmpo0N2XrSn2luRh1AIgqY3MN7R1u/QkYd0=;
        b=TOKRIHVgZptTuinGdQWrmypgW3t4hSYJc04fhn6Er32fmUGLfCEYNQYDK4J1qLpNi+
         GeqNtNPvbzOrQ0igIVbGB/v4lf993zNMVsgxLjMasNi3mmLhuohLV11odQtqVGSQCNtz
         RVvmk5WLeF+z8Iy+FXc3BUGlgvnQYR52ReGOGvy0gR+WQS2MosmmDTs0uhaZGNhrnk8P
         iFGgDUrcWkhasVuUnDhbUcfV6Bae+v/BPIjy5DVYpse7fze+Tj4ijez8mOQTX1ANYWiP
         kLqPqDi70G/RHAcU8Avr7C0FEvneLuIXJ0ZePT7CKMco67AIKb1Nvwomt+sArO/EswBG
         6BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333747; x=1771938547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifylqg/fOmpo0N2XrSn2luRh1AIgqY3MN7R1u/QkYd0=;
        b=MTWlfRXSMrrszMVc5P2UwgDumV4DZyIxZ7KrzZHMbj9S6gFEjw0Et14fawMW64QE5J
         CCDf2shhzBlhvMloUAsXlOq9ZHYbkCy9pOp/dk6G0L5SXgMXRragIrs94tQXcxNCHInb
         QW89JGWvgUobnMtPFnyElEmlqBPAw2CwXo/SgvtLjC9SlkYBnSPJDQ3KdhfOsTejsYjb
         XBA3N0jNbxp/E5REw0vCryCpCvPIr/31QE8lnwq0w6xLA8NvtLBmFtxmQmBhAsY4EwFD
         h+zQVWPx6FqTbVCFWgiE8O6hvYVJ0AnQWNaqDthQJPj7h300rAV8J+uszsfK+su3G354
         DJzA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ibGkFE4LcKU1T9NkgnRcG/FYE3Ewe2Y4FBmEIMmciC/tbWbVY9ilbn5B7AIwO1mVh2VY5d7JVPBEsGaF@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPytEMunpvg/GHvI9OhfGj4xOFzy++CURju7VxPgIS894Nc/l
	iPrYox6VrHdzSrfHGcFA7pKGMACFVO/60iz1gjDgkdPozRCQP70wlyA6iE/C9kl7FgxVhMgQuNf
	s+a6SWUoAbvgw7U9UXALsP38NgLalq5ygoBOOjW1N1WYeejOT0emKBt2C1VxsI9hAE8rR
X-Gm-Gg: AZuq6aJRtkyX8oBTnBTNTTN887E7RWXxlBlw0aKsHmNfycCUtEqyLKQHZzdx5tBh/2E
	tCH2cUrAFg3HUUR4SUXFh41cVryagxRo4PHiCEOtdBGEVw9mDCyE7uVEAlM98l6XIcn/81EupNT
	nYQD+BEi/ym7xDB2JV5ARXg8GYBIoz9cc1RgrSNMQ/lzKhxyBbveoemZNPld4MqcmSNO+AxYxMP
	Xqz+zoRpkPDz1H2FU3tzzf3rxV7eSDDi2c9jOJ04o/EGzQ9dpRq8wSEfBRUI2FQ9ZSH/ZOt3RU+
	EVnIOUevec058/fsgKigA8/ZKaWgAoG3AvYR2dnswPS6TxHYW2jV3gOk5d4n33q6CcQAgyM+/Hf
	xgUObC+TiFMO5bvUC4AqqJMK88LtlEeBxC/eFoy9Jw01goGN07ZV/2Q==
X-Received: by 2002:a05:6a21:b98:b0:38f:df47:87a0 with SMTP id adf61e73a8af0-3946733d9b8mr13246197637.61.1771333746647;
        Tue, 17 Feb 2026 05:09:06 -0800 (PST)
X-Received: by 2002:a05:6a21:b98:b0:38f:df47:87a0 with SMTP id adf61e73a8af0-3946733d9b8mr13246155637.61.1771333746130;
        Tue, 17 Feb 2026 05:09:06 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332e0d1sm9782405a12.31.2026.02.17.05.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:09:05 -0800 (PST)
Message-ID: <1c3c36b9-7367-462f-8280-16477d3ad20d@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 18:38:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
To: Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
 <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
 <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <78ffd1ce-5408-4bf5-a782-0c4ca14017b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gHilB7FsHkRK5xbWoYY2errP8E2cezWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX66HLuDTJHtWo
 P34mSu7Zd/zo643fLIAff7IOSz42pB+/Nog1s7bTeZwTz5kGW0PpZzfXy5mZUzag0r1Ay7t74AX
 I8mD0TgpAh95nAaSAPzdV1MLn4BJ/QlJ84h31J1ZG1xJR6Yl+arrcAvI1+mXnrPrrdfSKETmCRb
 IS0S7MJD1Epjwvr/MrBcX7WVuFSi8Uz+cKFawdMFbto/KgjsRbba5Z8QAObyD2Onbn+Xx9n26Zm
 umYEn4i9YXQCFHNakDeAem/p+ibUgx1fnME7zjAzKdNP6VkwHS8HxvLV1MeahnbtJuzC0gLZKa8
 omsFz/RauxJsBtnzVNlqcpQmrJ8PHWTxQumoPchK0QJFVGIKoXh6saogHUeczJtFqsqGMoqFlWo
 9YHwPHi2Ln43FglJd+YcrR5I/gy9pfbdpiLmjxI3eDkhkf3W0/dWjEWKdA9Pm4vFMF/XSgVZNJH
 hGJI+HoKS0qHji4duaQ==
X-Proofpoint-ORIG-GUID: gHilB7FsHkRK5xbWoYY2errP8E2cezWm
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69946873 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pTTk568K-quJkV0nBCAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93181-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27EAB14C680
X-Rspamd-Action: no action


On 1/27/2026 7:50 PM, Robin Murphy wrote:
> On 2026-01-27 11:45 am, Dmitry Baryshkov wrote:
>> On Mon, Jan 26, 2026 at 05:55:46PM +0530, Vikash Garodia wrote:
>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>
>>> When multiple mappings are present for an input id, linux matches just
>>> the first one. There is a usecase[1] where all the mappings are to be
>>> maintained in parallel for an iommu-map entry of a same input id.
>>
>> This contradicts the IOMMU idealogy (at least as far as I understood it
>> fom the maintainers): the device (driver) doesn't control which IOMMUs
>> are getting used. Instead _all_ defined entries should get used. For
>> iommu-map it means that if the map defines several entries for a single
>> function, then all entries should always get mapped.
> 
> Indeed there is no concept of "multi-map" - if a single input ID 
> represents more than one thing then that notion of "input ID" is 
> fundamentally wrong. A single *device* may have multiple IDs, as in the 
> case of PCI bridge aliasing, but in that case there are multiple things 
> to map.

Let me take examples of kaanapali and sm8550 and describe the vpu stream 
id generation part,

kaanapali:
iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
             <0x100 &apps_smmu 0x1a20 0x0 0x1>,
             ....

sm8550:
iommus = <&apps_smmu 0x1940 0>,
	 <&apps_smmu 0x1947 0>;

In kaanapali, 0x1940 and 0x1a20 are the *resultant* stream-IDs. The 
resultant stream-id is generated based on
c-SID --> generated by vpu hardware, controlled by video firmware 
programming.
Topo ID --> port id, port at which vpu is connected to NOC, decided by 
vpu hardware.
TBU - smmu translation buffer unit, decided at soc design time.

Now if we take 0x1940 and 0x1a20, c-SID is same i.e 0. Within VPU, we 
have video engine (vcodec) and processor, both have different TOPO ID in 
kaanapali, whereas in sm8550, both have same TOPO ID. So vcodec and 
processor may (sm8550) or may not (kaanapali) have same stream-id.

There are some buffers, like internal buffers, are accessed by both, 
which then need both the stream-ids to be mapped into single context bank.

If you see sm8550, the requirement for both those hardware to access 
internal buffer is still there, since they have same c-SID, same topo id 
and tbu id, they have same stream id (0x1940)

Regards,
Vikash
> 
> Thanks,
> Robin.


