Return-Path: <linux-arm-msm+bounces-93269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIbpCPmklWn4SwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:39:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AF155F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AF1A30166D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BC630DD3F;
	Wed, 18 Feb 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIpcpKtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOMHMakg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462C530DD1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414764; cv=none; b=VcxelcCpoN6p9KSZlls7FASfGHUGoLNfXqe249fhe7Zh4AnOxMZeLAameMXdd6cd7K/ytohnKvR2sQhvSiFQHC2LhMmquQpAnlktvEJxl2DWk/yGHpGE/IK2OT/v6XhPyOiNk5Wr/3CIOMGS06mr8VQFGQWi2NHZLT0PxH4pU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414764; c=relaxed/simple;
	bh=FMdxVUC0R0jadThg3kkIYRMnfauWR9cEQM0ddy7MYIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jx6mduVcaHJMEMjwTLowBJQfesxoXNnoJ1h3gYfrhhwILjsQCuPs9XrzQOuZysEP5CR0gUcldAJ0C6QU06HE77W70ez8xZoVh4syjSiPnXtMZ/TSqQu3g0YUSbcaKuE3P8yIOutiJOCmLCaJGNTQluSe2CXqnQPUrvF0axvIq6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIpcpKtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOMHMakg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5PSQt4026837
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppdqtJT3CiJXkezhUY3eB7UumNbDs0BXpqi0rJyn9YM=; b=gIpcpKtRlocQGhfB
	8cNWhZ3i6Vdemt5LbFRVGiyKuvWz5ZuNlouqqozJK1nK8iIBB/Zm1Wu5FVi4vRSy
	Kw9cjBtGzni8YLJ09qBNFqnpVgxkbSf7uSeE5XTexSNoNYgfuQ7t2r0tjl1XzeIM
	/rA85ITlK6JZgTmQOzVy1KX1P+/kKrcHFxlqnGbxQbiSM4TE4E4szS/rDrEdqWiH
	w6c7ODeXrx+kkqlIkmPDDQwbdcUsV0BiUyZ+A6VSkR9SYRF+vOvc9CveBFHpkCwk
	oJABwdcYkZ2OepJh043liyOT6sv0x8Q5GXGOIme4+9bVFKVJdXyiPcopE08ngVkW
	Q6qo8A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c0wa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:39:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8249cbbf769so2372950b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771414761; x=1772019561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppdqtJT3CiJXkezhUY3eB7UumNbDs0BXpqi0rJyn9YM=;
        b=TOMHMakg7i+rPwaVOltwJr+Sarhv1JGRudROURfoXR8sJqlXni/BqaoMrVEx0zP/Me
         82xE/znzzqpvwQQL3SLiT4inPkE+uq+hvy0wV5E/6oVn0jGeRKY1iOMpXJoI8mCrfOT0
         pDcDfMIXlxYiY0NUp5X0FyTpMYRMtdhQF5IpDcZo92HIVE5O7fr5vC/VKGczAVOrBKxl
         aRqbSziNsMxI6gSBOZnUg+MQMiuX8ZO76FVkrrckzvqcdrg2PbTj0wyNzh5MU3BhUqwk
         Wo9txClsluxiog1I76OfjCDzIWnB/4havpWy0azBO9UFOBkzB1FGsup8e8oHXndQDQzy
         0K/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414761; x=1772019561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppdqtJT3CiJXkezhUY3eB7UumNbDs0BXpqi0rJyn9YM=;
        b=tOtIwy6CQXFYD77UHxooQeFMjIZScANSCHl04I+nQV8y85kQDzOpJTaa3mq8nSAlPc
         OK/YZ3GvRLsShw7e+sinsj8GV39jLyXbj8U6N8w0CVCse7LdvUFDYJ2eSukkIq9W0s9l
         mAslO4FOdzQ7ezy7HYDAFx+mDP32wNb3dm0Im/vDorYJ46D8St3m7y7fhq10y5YtDrbo
         1Boln1kzflMgMLfyLTSB+otosiE60IOg7VeMnr4Rrvqe6RbGxNpWKLJUB8BUPOinioHB
         TOdotlnKKxc+yMT7CUwTIEDiCKJyL0DgqXKwbwjGo6top9gmGIhUzZzaG/EZLonVdi3v
         4pmw==
X-Forwarded-Encrypted: i=1; AJvYcCU0r2oafSM8NCvRLbq9hAaKPe3b8aZgTgZsKaKj0+rkBH3bDNL7bv+lOC2CGhinNO5+NsGhYZiWTiFS2wmU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlap40/dKecf2duvYx6VzSzh/KS1KGF8jttxR1kJEEyE6B3SYS
	IUKUed+fxQ332cAFMRh5eeWngG9A3FhpPhvOmvSmEkPcf9qMJ47rRk5Cs2oy1yJthH47HIKkG1y
	hG54krX83B43hTiqBw41nHQsLQ1208S3vrqLBjipHfLLsrfDPrmymol/rTEmguQT9yCz/nmExw5
	t7
X-Gm-Gg: AZuq6aJbcXxEtSMRbV0ndMTQRoJ1232HHxd25VoxwihtAdVD31P6qqXJRRCIlhsVel0
	2J3SAGQy3g5pIW6JosqINA9uOhF8qbI0NwXGFq3ct5sVlKnYLtc4mRSW4Ep9oQpUlsA5311Vtb7
	lJYbWAK6olihjcBr6MdWAnDMUvXvvn9ZbXSnxHSTxnuaM7dxqnOOYYG9sdIgpcehI1tzqAUvD9M
	7mDc9Qz+WHILQQr6DvHNO8RNwxxkqI5MxgxI0W1+5OlcP+A7pseSmJgSCH2Mb5YzeH/kxIYrDxC
	mIfEfRFLWkLAqed4H5sMR4l9THa+Tm6+M0htc4PGCDhURj8Jninep9lXFnon6YeoQoHJUUCgK3K
	Vn8V6DcnQSojWJowv9ArvyK3QbjndDoDN+X0P+eGJ6tPHbjm4
X-Received: by 2002:a05:6a00:368f:b0:823:7c4:d81d with SMTP id d2e1a72fcca58-825274749bfmr1844226b3a.6.1771414761105;
        Wed, 18 Feb 2026 03:39:21 -0800 (PST)
X-Received: by 2002:a05:6a00:368f:b0:823:7c4:d81d with SMTP id d2e1a72fcca58-825274749bfmr1844197b3a.6.1771414760601;
        Wed, 18 Feb 2026 03:39:20 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb25e9sm16895776b3a.56.2026.02.18.03.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:39:20 -0800 (PST)
Message-ID: <0637e27c-cadd-45e7-9c43-cc510c431f2d@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 17:09:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] Bluetooth: qca: add QCC2072 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, janaki.thota@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-3-vivek.sahu@oss.qualcomm.com>
 <mt4vrzmq7caqddwtz7nc3tn33zxh7uupoxfmk5pfqobhuex43f@se64qz7qvuh6>
 <19d3cced-f630-4a6b-853e-3798487fd769@oss.qualcomm.com>
 <20260217-mighty-organic-oxpecker-2ed848@quoll>
 <cdbef8d2-df96-4a41-98eb-3acc747a0aaf@oss.qualcomm.com>
 <3v3iz5cxsbaoevcfkk7itutdepfuagxoemixgfhewdevmju2ut@rcg3zuyg4gzn>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <3v3iz5cxsbaoevcfkk7itutdepfuagxoemixgfhewdevmju2ut@rcg3zuyg4gzn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Ak4MHMzF454dwBDPtMsGfGDw8e1OG8z
X-Proofpoint-ORIG-GUID: 3Ak4MHMzF454dwBDPtMsGfGDw8e1OG8z
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995a4ea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ZkFF6JlifP4NxvfhLXQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMyBTYWx0ZWRfXzS2SRPbVC100
 6WdxHhTMMWNu4OBHYzNrVfa29JVzz+knSwpu5qYz0O7mqP5OjmgVQM701tx22TxFpHr0EWk9dSf
 GFthGVhD4/qzSkCIV42rRXJWYcxbK+5dJ/aH10J5a63zhA5lafXWSPyyoOSuz6/XHV173A5k3R6
 xLaZeysl8d+MIA2Q4vYf+pRlmLwr4BiDUFaWbI+VqACZt/RrQ8WAa9KwQbU3WdDbf7GC2ix2AO4
 dBRvSO+Ck4i0XAGbwAGwux0uXMLjCemzVzJmBNbT2gAq2vfLR8ol2Hvgoa322CtLKebUhoeBAIQ
 4ESsTEjA3dejdg1UIgLia1yB5a/VkL70zYb5YRPARwwZQypLTTkkqCAa4SxA3shUsmZX0T3ho2y
 3ecqXBsnq4N+3McjIZvqgMfhyCyex5wgyyEJlTe+AKMZILvJLyWvDO3vLfJtQOBSdDNCifi5qdl
 wsMDpe55mOhEILLOa3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93269-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C13AF155F1B
X-Rspamd-Action: no action



On 2/17/2026 6:31 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 06:21:19PM +0530, Vivek Sahu wrote:
>>
>>
>> On 2/17/2026 1:23 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Feb 17, 2026 at 01:17:29PM +0530, Vivek Sahu wrote:
>>>>>> +		case QCA_QCC2072:
>>>>>> +			snprintf(config.fwname, sizeof(config.fwname),
>>>>>> +				 "qca/ornnv%02x.bin", rom_ver);
>>>>>> +			break;
>>>>>>     		case QCA_WCN3950:
>>>>>>     			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
>>>>>>     				variant = "t";
>>>>>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>>>>>> index 8f3c1b1c77b3..a175ac31e7b2 100644
>>>>>> --- a/drivers/bluetooth/btqca.h
>>>>>> +++ b/drivers/bluetooth/btqca.h
>>>>>> @@ -158,6 +158,7 @@ enum qca_btsoc_type {
>>>>>>     	QCA_WCN6750,
>>>>>>     	QCA_WCN6855,
>>>>>>     	QCA_WCN7850,
>>>>>> +	QCA_QCC2072,
>>>>>
>>>>> Why not keep it sorted?
>>>>>
>>>> As mentioned in the cover letter "qca_btsoc_type" enum in
>>>> drivers/bluetooth/btqca.h contains all the soc type which need to be enabled
>>>> for BT enablement on the target device. There are few places where logic of
>>>> framing packets transferring between SoC  and Host depends on the which
>>>> generation of the chip it is, refer api "qca_read_soc_version". So It is not
>>>> sorted in btqca.h file.
>>>
>>> Neither in previous patch comments nor here you respond to actual
>>> comment. You just write something completely irrelevant.
>>>
>>> I don't think any of this should be considered if you are not
>>> responding to actual comments.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> There is high impact on the existing design if i make this enum sorted. We
> 
> What kind of "high impact"?
> 
We identified a better way of handling it. I'll move it to the correct 
place.
>> are considering your comments regarding sorting for next commit not for this
>> commit. Can we have approval for this commit if all other changes looks
>> fine.
> 
> 
> No.
> 


