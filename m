Return-Path: <linux-arm-msm+bounces-119207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bpwgAaNgV2rUKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:27:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CC75CFAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:27:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ow1Ak6lr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=An4nmNJa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E172312A9FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FF743F4BE;
	Wed, 15 Jul 2026 10:22:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151EE43E49E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:22:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110926; cv=none; b=HsM4bsAx9YXQ/xPHi8nkzSVHfVikblMN3hxXMPgxoD0eL/eo0gdw++NG09Pn5knqt2EcyfeX+Xbrg9jp5C3TU934cdzJrGSp9TihXU4uku/B9H37RRgzlsOUDWJHRzZQtKgCHFfxUJ8yifqAYnSbBx675/UU6KSiJ1uiuVwLkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110926; c=relaxed/simple;
	bh=0N+jGFTzK1YOcGgJRM76zTpaojaay+dWSq85ymGWrVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAICfy/2UvRl1Q/5fmjTUgFP5EeNHTUemVTqMjU20ba+zYu06qcwBjZd6xF5ThqK+JaYtrfTZ1XHJjWMqI4VZ6LT7ATrwwkz08L/W9dW6dorJvw5wNokgfYrsYJWtRu/w9WvG0qVbbGnFwDtXc1jdYIuyV541Nagstl9Z3NKbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow1Ak6lr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=An4nmNJa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9f1e62503755
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=; b=Ow1Ak6lr+iTkl8b2
	tidekL58xk5IwySbg7KOX4mCSdF8Zg/37teb6huhQ19HaJqAgzpx6e3bryiQS9wl
	A8BEDS+fO55Tnf5T7ucqKfBpe04V6KLU2yfujSwwIxxqJcXe2nNdTc24e6ASsK0Y
	wDSgx02z9239be66v0yGArqtHG9HPkNbyNyt3Pwbuf5EvZ9cyBch8LqpVeN7mJH9
	KM5Ymw7whofuqxqJsOBHgpZXHJYWq9nCNJTqrfn2ffGGEQTiHVpL+Ul+v0eW25fr
	sDTnub7FmnaiRLWGDX5Uvt00aMKnCkNhfBYHATu2hXRXjozARPBxJs+9CAleMMdS
	NyUQ1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk329pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:22:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f2747d334dso13377366d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110923; x=1784715723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=;
        b=An4nmNJawaLEfMZsQzdQeQVnazua7ULVFLXSdkq74qe8tT0qmizPUB0htfDVPZbyQW
         jRMoIv+RXNTf1BZ/koqFNsIXsrDZMZ6RnZO2OOlYLKoRltvOZTEp/Za5q/YsEeFUWosh
         gfvO95IHNzhgzRP3vkPzTQGw+Vde3tbWZjmDxrb9q2sXCH3y5MgjpZtQ3CIvdJKpJfeo
         ZM2tFeA7Cm1KJ+HXECPj5306iEXZZuiNiUNXb21N3r3+KvaakcAsm3nWOFwXg+ok+HuZ
         OYqohYethAL0fhMC4WnMgc0NjFEueEzWbp1ciNQ0AE2f2tDzP98+9/Ky+T0NAAMvkIkz
         gD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110923; x=1784715723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=;
        b=FmTSsZzV5n60NBwp7VH0qL5WZTtBs7RcmFqn4O9WA/mLSWE0iF3JHK473fm3A0W/xs
         aFRsC7QlmeWw+2GUXoabzrX2vWrw2yCwaFbkZnlmji8Z4nK58551e4rkuE6ZW6iCsyp9
         kqwbArIE/6HgPJszfGydr66XiRUDBrB5fRLWkzRMZEHvfN+w5Ju93b5JRFYv2KUjQPN1
         BX7YP6jvtrqYJ+fuITqcq3GCuKS8t4nBE+shzQSghWNcafEGy4Mc1GGLNnvCOVZ6wMht
         AOkhmnh9g8oLEu8nXZ+Go9xbUXjWPqF0bfmAKl1xNYMbKSszfiHvh9MJtyLK4q89qr0k
         oDsA==
X-Gm-Message-State: AOJu0YwcVdfuCy0RSwyzrhCUYsBc0Dv4c8XfiGF/2OK/01SKjO+y3qdP
	CaGj+X+eUSWLX+vLgIaxm5bmwTbqOhxcXCAu7y8fimU3YIxz37eoqxPfpdFuXeM3nceGvfvabxo
	bCWAidTFCOFMC9voucPRtFFhbr/YPOJJMXEcDKVMOowEiCwq7r37u1xsUdHEJRcARckh1
X-Gm-Gg: AfdE7cmt4oTWFPFVFcPdwv9/T5e/yjSv5TRteshaeHTX/SU56h90ChtkBAXMn8Z+amX
	Qvdz10eEQXAH9gACjfoofNnHT31YGeZVPnAeylu6cCA0JRoaOjwa0tza09iYrKX7RWLtBi3dh5x
	ZOY94ivhj9ZfWnOEFVts2y0MxgGHlU8LykqJZnJU+bRBQOnxEL0BiBwYhG5CqysTto+gaR9RV6U
	13tL4hfg3ktEwALDAxO6mp3ztv5tqYSaij3JW6/1Xk7ghxBbazYlYuEIAiBZ3B63j9MxCed79jn
	QdrXdUlHbdCdtT4blR0gpW9j0HZlSywV+a91aq9oOKxsNcjfJjQRaOVMynaMAlvCjdg7T5dDphj
	hh311383tDWpwq0pZXWjxFQCWLLrbL5QbwJU=
X-Received: by 2002:a05:622a:1391:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51cbf05e114mr135257441cf.2.1784110923159;
        Wed, 15 Jul 2026 03:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1391:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51cbf05e114mr135257111cf.2.1784110922634;
        Wed, 15 Jul 2026 03:22:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm2758647a12.25.2026.07.15.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:22:00 -0700 (PDT)
Message-ID: <06584428-0f0f-4ac0-826f-69c1e8af4bb8@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:21:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a575f4b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIVGqzqqGd92ZoTDXmYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: SJhOaG_mMo0KBc-DNruyMAuRN5vADnep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX2MW3SLg592O6
 Dsr+voSKFEU2+lb+mSElge+/QYrOa5pn7XQ5mcGveE7cay3HaehPub0L4XtWLIxiDM+zU1ci3gA
 /tJr626gr7bRf/bA3trt9/gsvaThm5481J+zxGR51HsnOZ7i1MkM3iOXEkOqIvpJkpUoNLN8MEu
 kCJ+7KFG7PruRjL4fbIpUfAhAR7CzY1yiZ6pqXeNDNidpUwGip5WLCJ/DpesQgA5SY+W0sPEKS9
 cpD/IBuYUBS0n5O6fvvb9AbOASym+Ig0VEGH1ZZnLpZI5y+smAxuH+uRxz9w/Nd6CnHKUDOLq4Q
 cNqIhezeo7gkFbdGdEc7oxMd8gSY16mv5YQqUZ+9AVukNI6dgCBDRA7qONu+yx60kGW2tb5Yhe8
 Ige2xCj/PrbxU/KmomPbCFWLaMQaYuq2RRx6AIwedfPETjRf0Q5bo9TIgA5oDeufwKiy9Zw0/aF
 Ew/EOohJEG3gjMKC9sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXxZ7w5xfKrM4e
 FKvOG/MH8/7Ej1k22I8CWT4wifCXJ740uDPKZYY+2VMBgFfG29pXrTtV29SisBfziiPku+0Mn2i
 EoN1d/zcx/n504Tddnl6ELnfuW827oo=
X-Proofpoint-GUID: SJhOaG_mMo0KBc-DNruyMAuRN5vADnep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119207-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 534CC75CFAE

On 7/14/26 6:29 AM, Kathiravan Thirumoorthy wrote:
> IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
> and the remaining instances are dual lane. Add support for the same.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

