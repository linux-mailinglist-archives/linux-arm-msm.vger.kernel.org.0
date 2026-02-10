Return-Path: <linux-arm-msm+bounces-92462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEvkDL7/imnJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:51:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F6119243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01548307C48D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAB6342503;
	Tue, 10 Feb 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+XCIrJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XbZk722+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400932B9B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716960; cv=none; b=tdIqHUhTaGyamCv1ziOuVYervTLgi4tsgI8aW+5V6zHui9N2bLkEZwuENUdzftr8wBlqB+QU+x/QDZDX6vxLWX0ElcmDz1NE91ZnkLXU3ia+bxQ8xtQqzhh49rWoywTyJcXtYlezy85YR1+Rn/9rvP40xhlhSlxgXxdJjgB8OQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716960; c=relaxed/simple;
	bh=VOyKj+x+EF9ytp2h/AeDDqViNOHSWGswmkyGJWPK4xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hy0/sHlIqCF/+AYtFnUxRuXZN0JUWVlJ9E2DnFF9LFZeB5Xje43SP0ogx0abtkmNXlq7cBXXnxyru+NHHNfanvh/NvNM4pYGb4ppXLrEdVIDgLsxKpeqCdRpWM+bC69Y1MAbyjKlQratqWRPOi1A4+EVqc7QszEOCEJv7uwr9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+XCIrJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XbZk722+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A90d8f1231822
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6o6n9g1es6JXwo4ZfXOysqdCRuWXP7Xh3RFhzD83M8=; b=h+XCIrJziNpDpgml
	BxIWl914yIE11YaPabnEHrSf7RCersfHp8SsbBF8iQu2kNMMjFG6pHuCP+9N7Xgh
	9yC2hMhJ2ZzHqKnPVn2zM4LFI0zVT55IgvWFV/jbg45OIIAS5TDAAC9zLneEYzWf
	Z4e8IC08poXzG6Q1xQddPBj4deu/Irpt0+xI5A4hlv7aWxzbzXetxsueyi1Qsoor
	Aa9VQmWB6IdSFlajYDyltTEJmFsoAJaavGtlv2sEGGsQANQp1w75d9vkNSyre4R/
	3wLcHthEHt5BWaG/32OqJKmt63ALjRH0LN7Regq8kszmp0Atze2/QvTCW/iZ5zNo
	0zz/CA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv59b35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52de12a65so94878585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716958; x=1771321758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6o6n9g1es6JXwo4ZfXOysqdCRuWXP7Xh3RFhzD83M8=;
        b=XbZk722+/TMZQrMgJzQkdV/JcHXaTzXbJHnCw96AiAD9lFwuK8+MGBoY84CTxoJIbH
         MmrVIXCVRQVVnoJ1l5F5zWCIu2uAyjjHR6rvyUjnY2jsyamEs7iOXCuKyFKABkvkfPqK
         NmCO/pSdS50jmWjhWAYVKJG1iZt11OjAynVJYSxzbAnsXwZE2lL5pREyi9efu/YEzDyU
         Y4B9V3YJI8wQANypEOmc8aJmL7fY7GQADN94pRyyUkmsviQXApvfPnNyR7ff7d5omjiF
         ndiRM6M+/KHGjQXlN/blrNLiF+vVwX+Zoke4S1irl9lFpnHAVM76g4J2QAggYYs6pPRs
         rOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716958; x=1771321758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6o6n9g1es6JXwo4ZfXOysqdCRuWXP7Xh3RFhzD83M8=;
        b=YeaW6qvcdLtZV6mLlbLpx5GTvLdZAqH46AJwDuDL75VprWyCRG/foCWk08rSLvTSkp
         nir0OJx19I+rW6tmFrk/BDcrIM8Co3hmUbdrqNavevBPltn8iZxO1117AmPfZA/Ypatc
         ai70FV5zJFXiwp0aDlFYniAQvToR6YlVRteD3rWXE57b00IcGGmu1mEqKVP17YGd2hAE
         KJNnqwXMIDrMistV9czc+3kXNkJBmAztEN0y3y7IbTNIGzNOSgA6WbMw7ZSDLE7RfRML
         na8OUIs98d2YZSnPtPWVzoE32dxebgQLNSgCH0eqqBXQTgJtdP0cZf01hdloIvbghJDD
         COTQ==
X-Gm-Message-State: AOJu0YwV0gvV/QtLIYBtNylw+xEq2TvEbvC2kKsAwaGsNvb1MBRBAoPE
	QmQMUf0/nfpDKEYx8bLcOdC+uC0OOdLMNqFmyC0OZxAQ1BdlYV423X6bULHpdFwH8WneYj1lyRO
	Mldif2t9x6WVf6fDLw3ovgKnRWfK3MM+r0VzBcQohYVBGbBQdbWHn6ZVIJ6nU5412Se73
X-Gm-Gg: AZuq6aKUrr7y08LFFNZ9NWrcAAgjhfOUg6NufgGKTYDiVQcRB4XBgRbJcjxoMrKewYo
	kOYWCP6aSeJ9mBmpDHl1IQP8QWfv0AiRp1QIj5kS6jrGUeKyBQldqCKIx8wffjLbhx4eh48S1BD
	bmhyKKRJPVc1oPFrubeB8i1JjfNDfm+OA8uGEhspxYsCATMbQuIqp3lZApuak+6EdtAYfZolKU8
	Nf4RL5Wa4UeNoQv3k29Ts9qEMzGW+oH8uzMqkoH4YLZQOgk8a88bg+WF0w7NQGjFmMIs0e1nx2o
	GHzZvKy3cG/EkMw9dz6Nn7Ca2jk1rhTatK5c2/UygYQXVcI1kKD1714OAG4CeKLrypV9oxJdmPf
	FA5c6fcX5el0TalJZRJCpxFRdI6E0dENy2gZwKglZ9pSseqF9xgb1AYehzyJevcZ4KGNFBpbDlm
	E5MoY=
X-Received: by 2002:a05:620a:1a20:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb1fed996bmr111451385a.3.1770716958019;
        Tue, 10 Feb 2026 01:49:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb1fed996bmr111450885a.3.1770716957634;
        Tue, 10 Feb 2026 01:49:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a6d09sm499807366b.25.2026.02.10.01.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:49:17 -0800 (PST)
Message-ID: <fca576de-6454-446b-9470-ff71fddbc7fd@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] power: supply: qcom_battmgr: Add support for
 Glymur and Kaanapali
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-6-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209204915.1983997-6-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfXxKWz6dRF4WYn
 kg9oSq9OOMRHvNQeuxCdFU61NBuoWAeOAIYnBCLIOtDidl+2kjE9iKhTZYb/cwpUcnsu9cAE48g
 SXl6aiUjz1yYaj1BG0k02ndH6sTAqCStCJA3Qc5+rwvpNhAzEYUS5Aozr/t3eUJVnuCTksBN0LZ
 FpVZATwaySAoc7BQAjDFQmdej7o6Bd9AtMURlFmX6OPLdm4zITqO5zsopU6OBvJ3WZcdZDLhgIN
 iESvYPvgCvTDkSE1qgWleqpC/tyi8uiW6bHG5p1nRA2AYSNjdtLm01jM6A/mE1MCYMBbplFf+/D
 uqdXvLHA5xgOExAasjdZVTCGca6nIhws9uAwbKZHtZ4hGHmypYcMwOMpbNSJs+J4GKEOI+Aw91j
 4qjOVgryfVQhfRVvVu05rg92PeDvmZhfG0kEhHw9eKQ3kg7VOVCaVUdpZjWEADFMuZoDVRPKQUP
 0Y0BYsKmJFNo0wrul2Q==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698aff1e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kEueVoIVdGDzn9jpcCgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wPQPEOUfGKYQfRNOvR5oyr4li8JhlzAv
X-Proofpoint-GUID: wPQPEOUfGKYQfRNOvR5oyr4li8JhlzAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92462-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 828F6119243
X-Rspamd-Action: no action

On 2/9/26 9:49 PM, Anjelique Melendez wrote:
> Glymur is a compute platform which has the same power supply properties
> as X1E80100 and Kaanapali is a mobile platform which has the same power
> supply properties as SM8550. Add support for the Glymur and Kaanapali
> compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

