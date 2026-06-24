Return-Path: <linux-arm-msm+bounces-114328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wP26GZ/EO2pVcggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:50:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D26BDD65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:50:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VJtoS7QT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B+oMECoG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8C53076B09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACDC128816;
	Wed, 24 Jun 2026 11:47:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015DE223708
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:47:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301639; cv=none; b=gbjLVcKQ91HW9kCKA4yGUsobNs+H8zOYkoZD1CVccjOR17OENJ+u4ItbCyTmYrKQGLGRrDTYpreGABiVu2N3yHFQhV4O6UHJ4hoUhLOiUjH14Pv9F4jMch+1CpKT7dHcyzIJKumqlcSd8e5ZIV7sRe3ZdjU+nVafDxpjj+kTjn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301639; c=relaxed/simple;
	bh=m+D2Ojfh7y2W4IfWhV1bnkOXK2cyeKGPtIt9xTv5Rkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPtFtjBF/N0xGUg2IIlI9LGBdixjpROYl8lE7UPthv9U3vFah3/eG3qw4UVFR7Eqpf8DscR2r0IqF7uhjGfe25LxDUj+vjkBzSLOpWEGTLN4fyRp6Q3dZUGc5TGFbwWf03FhPXE0LOmh+yUqgKIxWqeDO9dOjKCMWAQksiRV9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJtoS7QT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+oMECoG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO2no2845789
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=; b=VJtoS7QTmjlblt5a
	0Vp0WIWI/qwiYPZIkT8JdvhcAj82SgaETXuS+uTALGptiqawWymcm7vX4/H1++7u
	+r8MXBFllLH043xuA4CCu8+G0pNTCHt1anzUN4IVWVgn+lsCVm2jLRT/3z6J8vRK
	bZy8CGYIWmw7gOjTsGYdUC+nno3GQ+KrZovpavtp75s2+Zq6nbd+xBDFawR+QEt0
	5w2TnkAtqrf8ZhkuZDE8AcDAqBIVDTjMw43iw101wbv37VFcogyRse0gDvlrKT5G
	HDnRqEsqd9tFW0zKrIAXAYM4Vf8P8E45g0DDVQYtozN90i74aLR1Knqh+kjOSKLO
	C1rHIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3020-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:47:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5198e72249dso1003371cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782301636; x=1782906436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=;
        b=B+oMECoGog20wv6NwPW2BbK9ofUQd+xOrI2NuehNA9QBUJ3tUwCVMrobDtJPxSZzjz
         xY2pNbiH2UupA3wq8zrYmR9vdIxn6UHVJxcxA2Vqg0YF7gds+mnI2bN5KPk49Zdm3WpR
         rna0ngqVspoqMl2fvXXPWGewkwMPmG+hvi/YtDbU/0eeNehSQWINPz4NpYtrUGhaVkDB
         8f04RmOJdyH+O3ruAB78VxDbGMtUsJLlJToFce1V5yEXWPY0vzp+gwNf1J6dY5l9d3YJ
         /1HLOQT5XinyEZe7So+Xy21AZ5o6MgKGEaOUswskjOSwz9/JfnQ6H3VuUp+QfS67XvZI
         PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301636; x=1782906436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=;
        b=qyQWl9+zP+7M69eVc+WHlm/bjLDvsTEtpTOHYSI7ELl+p1//weO+e2iSKsDble9CxW
         3YvJ+dK/rV3IZCYUTfVwT7gRG+Az6alEvFOziYB5WHC+to+EON/0uiQGrt2Jnn5t0aWP
         MDI4rUBv1Iv3zGf6pQfPh6OXEypNEzyumxjPknOHBPFb6yi4VZeeEGoFuziqFAZPE11q
         /4I6wlNUhHrsz70UdbzI1KRhCq8H3VgJHsvtayGV/aGEiJgrsQIQHrMcl/26/KIFQLuf
         HZsI2e6zT9wBsg2x479D6NmnWcXM4+pcpglMkruustPOINw3mksDMYCs9LOnpkET8nGy
         5nuA==
X-Gm-Message-State: AOJu0YwC5DRwDZnzsR3T+F9FDAWh5Rz1PF05sTPYjPITtjWGNpI0E5yN
	RP+Bkn8Q17PhxFQp3vDy9kU2feXLBsNOI9ybu1JXO53oUFuDYUL8udUqZqavZq1YGozKaxDDK06
	Nb4NcW8JAoknm19fvfi7YU31PI5boa3lbqlCa1+FnhjrBBQ6OSKZVJ7qYl7IWasHwNu9Y
X-Gm-Gg: AfdE7clzeMhZSq4aLFPqlcA3Gf0/An0pRHhIalC0YT7/HyUO+1mITqzcHJifTz9tL0P
	lECWkzhYX9fSPLZsND8twG2ktNejQc5Q29YmMpRuGJvQ/7/LULFKL4tC2cvNTZQ9oCSgYQxZSPB
	5MB7stbYjSUC8KrorR618YFVfVoNQ+YIQCbE6iFzkFKlo8ego0y7QcTwwrI8eR5c/F7ltdNdVJu
	dBNq4SYTSSLPrsiEuLvyiUoCHkPJa5+beM01dmPnWEgnDbaSEDPZfCtsRl9zHi4qSDDaK22L1ft
	/bU7NHGzrra8mLEUBFLdUCLAEpUwZjuujiBDPga4qHUI5MyeSCdL4f6Sekx68zFr/2WNXEJql9u
	LubTFxokP3ZgbVyJmbBv3LACx13773m5Fk5M=
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr88876681cf.7.1782301636088;
        Wed, 24 Jun 2026 04:47:16 -0700 (PDT)
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr88876511cf.7.1782301635696;
        Wed, 24 Jun 2026 04:47:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd44d0sm977210a12.29.2026.06.24.04.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:47:14 -0700 (PDT)
Message-ID: <7fbaa271-1eb2-43e5-bdf3-ff35dec3bd40@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:47:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region
 field
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX3FpCVtxXUISz
 GWk7H0ieJvFuhApthPvu66PFy5T1RuxJgBLGmNPFz6Y/g/FOVPLKkg3RJk1QGk3Bfe6OO/uk95I
 pw5CH9Mf39S2zNqwzQUYwjSsgl7CbfY=
X-Proofpoint-ORIG-GUID: L2ogIxZYiHc3FSMxcMlTajDSepafyzY2
X-Proofpoint-GUID: L2ogIxZYiHc3FSMxcMlTajDSepafyzY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX+XA5B7OVKokQ
 Zd+4Qvsd61tjXfqL6pmeXDcbQjsCSIqzkYiNOwIZH7XIl/DbP3NOxBmYLCelJEroUQedQxWDwCi
 vIeDTgYIZNGuCimRYVUNUNoNoeTS7FN9EmsHdLFZnBWO+2aSs4B/C2/0raGNGg8kCbW1hNf4J1m
 i3ZM0TmGRDwL5qUPpTCA9krhend+EFjIicxVC5D2oDLddGpqnsfx3zMQP7wWCZMzFVqYoI8SJK4
 8IWOxvq+gUmHOcw4+euEW9WFfDGzLkATuTdORJT6c2TsoHtTd3k0PpcigzHKpLqGRO/jiKhYTxr
 Xn119SZ3urD1jmPHZ3Wgx1M8tlS/4NFCucffrQsVNUsJ+43ZZiwDsF8bod1MOJduxfC6FYBRjR3
 GcMN87mT9jGejX2/Bc+26JgzWHxOsPqxP7QDFYj4Cy8EXRlq4a4TluSSjVTh5PMnOIiQfi/Zj5c
 2xMwlPHc+8xMURyno5w==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bc3c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l34an3bRNhP6mDLsExEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B24D26BDD65

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> dtb_mem_region is no longer referenced after the ioremap was moved
> to respective places where mapping is required. Remove it from
> struct qcom_pas.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

I'dve squashed it into the previous patch but it's ok

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

