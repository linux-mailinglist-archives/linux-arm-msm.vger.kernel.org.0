Return-Path: <linux-arm-msm+bounces-100031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDLLFETDxGku3QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:25:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A431032F5D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F49D300C34F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9990E38F949;
	Thu, 26 Mar 2026 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqpRI4/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2XDBc09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1100327BFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502682; cv=none; b=KOkeDRY6VZKHVtUxJ/fyjoDG90BydZhGwdC1WA5mv6tj3vAkM+h6Dcc6stUbsBxc5/QdJe0Zj4QldmBB+ULJwCkZh+EHs3Fm5S0FNjoygxvLkNmYt+15VBXg0DxxnBufbM3RVdaYuXXITN96guaKUTlWSYd3UDT04mDltMtN52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502682; c=relaxed/simple;
	bh=OqJuFXqPfGGwofAAq/knlS+h8ypVV1lcV7YK9G6pq1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTcj2XNx+Vq1glmIvTNH2o9WpG7Rbe1X1caety2gQJ47RQuXmEV/jivlrjj6gbTfYLtRSzY40yQLqhnqmWRHMZu/uoXX4PTwmqtXb9Z1xl5Qk9BxZHsOP29860LXx52qWXHIdoJD8e0pxSFSLOtIN5GkFG3YBX/DmShQtvhJ+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqpRI4/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2XDBc09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q1RX2E779761
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=; b=EqpRI4/IVt60ZISB
	0eDKghnA7tWVvkoLisxyC4iGadBG1ekcHvZdKX8KCpvq0vtYR3Z1mOr02jyxT6ir
	kmsWgNSEFRwppTHZHls858jQjY/n0DH48EWic/BofpYiYfi9NdR0iVJ5cJysqqok
	acX0mmoAsh34ImvKWuI3vINPve5YdUqvnOtjM3IJq646KsH6jsX7FqMUX6s5D+Bb
	AlJxaIudHGGPB6Q60+GNlWBu5kZ8ZHw/HVjxTdvtHqj/B328KNU2gv7fnIMt2IDY
	ZHeCfqmHuhK0mzT2rIUSPh0mUWi3FLE7rLA0bD6dc8Hb9C3T5nv93n+w3xVDT6ND
	qY87kQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp3tan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:24:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so1177522a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774502679; x=1775107479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=;
        b=c2XDBc093KQtL0h7+2JC23chNNUFsI7Welc6WGZVAZamM1mfpbR1FRLXC4TjAsQUwL
         7TGu6iZMwXas/R775+zQsmjh5ktSBJBiB6IcuAbtI4xNdrENnPqdjV+pqHBQ/9yKPthV
         MfmNgURq7OXv2DVfUfinBxucYjMwytkcy/T1SKvmmVRDpLzMUG8RmThh//GGGB9VVpR1
         S2IU0HdRvwnGH/EMxhfg/RxmNg79S+Koi2/XsIaNpujVi0fCnxaI5SCQzCdFgSBUIulu
         zbCyKHflRhR6BpbzYsEyGdJv+CpQI99G5KG0izxFvKDTax4yG3xGBNx03ohdMkHIPA/L
         qDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502679; x=1775107479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koMK+EyFax8GLI8T4AzmlfCF0gVcYom9obN2iGral2E=;
        b=P+W0CzkF54Ao/Otq1v/WArUZY+bGg7VlCinGnpAbqAAs765vMj+4oJlNlkWVIzQOC7
         nn4kTIsHG4W0tTZ4rhiq2oWNPN7B4Tx5O4AxruZTJ0jh8WCI7bq5vAWKq30rP3ECShc7
         9jwbNvMNU7BmbgXnS3QPEhK8xwVmUZSECFnqU8ZZfbDuMkkk61JSrfLvNckcgJwdU2js
         Y1QVXC92zwkNzaqZ0AcJApsRLk/paQNapYpC+6vqz3DsmtgiM41FlDziFzb6hbfyYeiR
         aZ357neAAtWgoTyDKnnOrBDCYoWlQ6T26dqo7XyoDPZ6OlwjHV5avl61PNtHg0T8rjRV
         y4+g==
X-Gm-Message-State: AOJu0YxqQw41symoPZXqP98tmFfmxPmQtwBH0ckN+1EAyqCuM/v/diP4
	WmPvU2Sj3p3lmNEnDjcTtFkEbnbjOVF585uZH99CTSVqWRrS0sgs90Y2h/qI3yiogcykrPr02tb
	tU6owstbA5beqSPrLi3ZXw7aYUhSxvzc+R6tscxw7hCtRkxZnpbK/AeagieUOB5j4n3y0
X-Gm-Gg: ATEYQzzXzfjKSqyG5Rq1Cv4vJm+YNqrqZP098ZPKH/FiS69IQTWvYBmGnQF+exIRfcH
	d+QaX8jTs2WvtB5/6gRY2ETSYL7tFwx914yR5AYf8Sk2D0l+EuDLvgDsnsir3pa2RaniBifYmgL
	Oflm36elUUGx8QKW1/+CWfyw/kJOuw5wSbuZiJJ5aVbgS144fI2tyvTb8ik1Wqk27H8DWXYqolY
	PykI7J50O18dTdxI3ua1EZlTNk9bpGPpm7wLt3BDhylOSA6c79Kr4TwoAP6AgJ1aWQPljW66kis
	BZHun4juRGqe6sDzYwh/fVloNyLepCu+kdNJ9hfHhheArCiTWUDdCoEKEvBIE8HLVIc57AGrJQp
	k4cjQgAqsTeeYQlkf2h0IUxbF0vJ66LUbnxTUOMt/HIuTd9EcNKkX804U04VOFBQDyS+7dlQC6u
	VoPzba/TxgMsgCpp9c6u1YCrF1hHoTiuyeRg==
X-Received: by 2002:a17:90a:e705:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35c0dc87b4bmr6035792a91.9.1774502678722;
        Wed, 25 Mar 2026 22:24:38 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35c0dc87b4bmr6035767a91.9.1774502678251;
        Wed, 25 Mar 2026 22:24:38 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm413373a91.6.2026.03.25.22.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:24:37 -0700 (PDT)
Message-ID: <be9b9bfb-700c-4317-9e53-8961cde96df2@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:54:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Randy Dunlap <rdunlap@infradead.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-2-a8e888d09f0f@oss.qualcomm.com>
 <3077792d-8ca2-4096-b198-68bad573d31f@infradead.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <3077792d-8ca2-4096-b198-68bad573d31f@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P4zUXdj5QAx-7oSQKSlug6-hPwYtODVD
X-Proofpoint-GUID: P4zUXdj5QAx-7oSQKSlug6-hPwYtODVD
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4c317 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E2FcRaxJAAAA:8 a=pGLkceISAAAA:8
 a=aS5FRo1k3opD1aJJ2lAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzOCBTYWx0ZWRfXyN9WvkV9JD2e
 FhK9BER5Fdo+1vfxlArYYwvvvZUN4LnMPW++xShbMmSyjoBwKDdMMjurjuhhnr4/dAF7/Gm12M8
 JDj8SRvUo5cxMkDK6cz5V0fgp5AhEMb2fCqymn5irs/CupZhgSFmKC12tAwKqLTAfjVpytH9Q35
 M+XXeDV1LT5AIxQ0TGKOBPebPvbhZp6qOU8u0mtJNc2+jDpuGRoS9ExOUtHOPZjaHNWJzjqYw+8
 G8D25NL6L0RPzlr11aIFLr25GSEShQNmf+aq0vh1aGqWivkFt9lIhvBXg/BCZ3POv8cwfndB1FO
 7xfzJShbiSDYHBtmLAzpjmqWbkoTSueayCALJMikeQ6ExVTbVNdIpQjdoOv6LNVVRNuP4r0Bkph
 QYZgGSZlRiD8b7KLRtTsTTkU/zxV6T+bRk+vPnIoUqMifJ+iRYStV3KtvTmtv0qTy6rARHYEZHm
 h7VUlvffPhDvMrebjWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260038
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100031-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quantenna.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A431032F5D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 3:07 AM, Randy Dunlap wrote:
> 
> 
> On 3/25/26 4:39 AM, Anvesh Jain P wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 30ca84404976..bcd7b0729ab7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22001,6 +22001,14 @@ S:	Supported
>>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
>>  F:	drivers/net/wireless/ath/wcn36xx/
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
> 
> Please keep the entries in the MAINTAINERS file in alphabetical order.
>

Thanks for the review!

I wondered about this a bit but saw a lot of instances where the names
weren't in ascending order. That said, will fix it in the next re-spin.

>>  QUANTENNA QTNFMAC WIRELESS DRIVER
>>  M:	Igor Mitsyanko <imitsyanko@quantenna.com>
>>  R:	Sergey Matyukevich <geomatsi@gmail.com>
> 

-- 
Best Regards,
Anvesh


