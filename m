Return-Path: <linux-arm-msm+bounces-115620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2WViJKnfRGrR2QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:36:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D306EBA4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gp7+nsgm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B3+aF9+j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0378300D97E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F5F3F54AA;
	Wed,  1 Jul 2026 09:36:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7933F2118
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898573; cv=none; b=TKAHHa52TmBgsctbXFm8D3IAAUR99zX+NFqnNlTHu0coeIR18TKFxMg5TqHWX7hkEKCEybVr5+4nxAIgSdOo7zZ2WnR9DYHFCPEZRlM9nBIFGD5R/fx906fPOITCO+AXKoV4hbpxl2KhimrBePhE+b/c2yX7WE8X2Y5Lt/8hIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898573; c=relaxed/simple;
	bh=mVZqFnycurtuDznERqwMW8/MXoyewmD/ojvJPP6GatU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvdiWpokxOJ/rRD+/aOCfD4XlfXSwlX1VOjbgFz14UwFE+bn495GHEjDTskFxQlLQBf5b99fgIhbZjp16xbGK3hExXQsW2Hd01SUeAGH5h941ONMAud1Gd5XDjQiwlYHh4GQY2ZtPkbUh+GFtvjQ1J9YMjrnpzGm3iKJixUsFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp7+nsgm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3+aF9+j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GEgx497009
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=; b=gp7+nsgmQufQaOUI
	nEYVxB6u8cO17HNLSUbSYugVt+MuNogkKXR/FJhr7kUvSIqX2RF7j4qYDwfKJAPj
	/SIOi3lemw6p4XqFdply/9H7TSWmq+VWGNPM3Olwvhe8jAxHATiNo0ekErjHT5Ym
	S5XTi76DOkP0NiYZjwO+u7TLgCp6LetbwjoWLBuJt6th9fGQ+oio5mnOyqNi6Ggi
	jOhG3ijsfXY69vQ6FIQHrJBBVomdNG4ISR7qUe9A5jRNfta5sXKUAw4GINA9NdD+
	/Jmu4cJW9f+kxttHx5FjkNz5cmpjg7HDSDP4EXPyV2OWEJVw2rOwYhSTPQUHiHJf
	Zpx2mA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbdvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:36:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so798541cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782898571; x=1783503371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=;
        b=B3+aF9+jnPsBY0IfWZ6Z0PtJ4LpRk89M5q6xOLnXQZDFo8tK3UIkrh+5SsYp2c7nu3
         8UvSd9630nSGOWf8+dDGcJfW4z3mp+ifHAYNi7E5wnr0jBmUcjvkM9fj1DNQ9wf72fue
         alB/W1Yj1Lh0OiVVwqPjpyKFHhKNDHEU3Y+CKeDC47Qj3qu86UfkPw9Et/1WOAx7Y45C
         AoEscuZuH67IbyUNKDlhqJ0iw/9T0riKKQt7U2xdX/9+4nnJKHpSBdfioIrvfTrrF1pQ
         iMLgl5GBOwGenWaRYMzKX+SyUx2/q7o78R25BS/YmvxV5Zp/zaG3AJU79905Qrm+fXTe
         GaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898571; x=1783503371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3Bghfts1KMXiRIbApQGUhol7516KKzKEK47Hv6j33w=;
        b=Wrfqpq+0ZajDA910E1D8TSlNo2/q0CPjKe3cLNxx8yCaFzsUlRwIrN6c4hKoNBuGrf
         QHR+D6TaFxL/NCthVYxlyicGvMP2hAnrTqff6+Gb+viAEDBiFgAo0T6Gh3gMFa6x4jQZ
         M7ffUkFCSjeCyVULjHKuzprutlKCvqE/t0VXc64OAsfvIIQmPTXwy3K4xXhuApgzzrBt
         mn9AH8kjJ55yiajuCJERj+tjVG+teeRhG7TeFw84lMokiVBYsoAHw1tDQWcI9QJJIxOD
         q8XPF/2wFH2eWCPbWiULtpGXpXgsem4XgVSSEnK6uidSYCFZWSazm/cnw++AbBrgWC1T
         nEWA==
X-Forwarded-Encrypted: i=1; AFNElJ+1K+MJAuCDJALJgR0r6C4aLabfLbqu6tNZEhSqMQ1WBjXfCylLjKQb9NBkaG77Pm2b+rAoEV0FwuHVDi/c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1odF7OJfQ85cx/9Dte3LjznGYhRpWGizy+rKuTE8vn+A8+Mn
	UYWcmK/Uyyj3HmboLvZ9oumzwdQq82QdHm6v0yg0KBlcXt0bXlbrtqgdYoCz3ukGFoMbgVbp/AP
	F3mWZmTDSf1xgKCTSVesVtl8aM3UYDhxXzdT9MyXQuTLL2EDHLqvV8otRa9DOgMjOU0Dm
X-Gm-Gg: AfdE7cl8R0vPpx8pcf8xWTak3Rpv2pKwyGOQe/sYIDWmUNTUIjI17Cy0ktgnoc71s0+
	GpdgSbpSsV1ZheSD3KGpOwsdOhIA3mI7jq5PpIeRZPV96/OH3/kbh80jhrhzc1REEpFvbnubzcY
	S07Pya3KSZvdT9sSRd9Tib4mbdtVRRJNQ2HXxjrL3sqZ3nXtEzkUdDvWprPkCnHYaBeurrbCHyC
	Fc7MSOmoKLMKttCecUd/xrdrhvaoIY3NImXE7NzU8kWVcZxE0dPP99mng76y3hsv1ARMm5ryoEm
	UUylgOYeSgr9wulGrQCoqGqjqRak4b3nT1fN43JfqFs1ZgIAcwkMmL7m51YtQ53F6E2g2j+cBa+
	2KaCqBHvRza2EWW0+oBimqN3Jm2T9sSb3Prc=
X-Received: by 2002:a05:620a:3195:b0:92e:6071:7cc4 with SMTP id af79cd13be357-92e782ab5demr67629685a.4.1782898570689;
        Wed, 01 Jul 2026 02:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:92e:6071:7cc4 with SMTP id af79cd13be357-92e782ab5demr67627985a.4.1782898570107;
        Wed, 01 Jul 2026 02:36:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb71sm243963466b.39.2026.07.01.02.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:36:09 -0700 (PDT)
Message-ID: <09de0dd0-343a-40bf-a8ce-f28c3624e6eb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 11:36:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX75B7ZShs/5nH
 2a0GfaLOOzIX5sYmrK0xzKRjCJrf6Z+R8g7Sc8mPssiSdPFh9BdM+csWrvaD7WXZRDqPsg6lWIc
 3QrUks00YhCsGX5aPOBDXKAJUM+fOi0=
X-Proofpoint-GUID: pw067rvVmz18GvlWRWJmQrvvRRE-BxsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfXw3vpUJ2v3AyM
 3gazRjHGOHepZV46oIVu69k4tk/NLvZwFsuZjgtsr7ewFSMqsQ6KD+0JjxdaETBvnE9IZgqBmMk
 peKo1TJiByavj0wNlAaGZyIgRUn/+1W3DizcgfSK0KcxmKPeYvcyBSTefRc2CT45KgI+udQkUR8
 qz63Qg0vP9EN/EKJSCXFjqh1rpwPOCZND6RfqPk1NcSff3nY29SJsGJgZWXC9j2eneSOX05URmN
 uhw0dWmhQFDEhpHyUPvMFUpWlErQeXS1IVlUdap0DFBtYQvzxUEiefYBPworOS+A2UumSy57Ooi
 APpRwM4FiMgPpwSdd3qpgVZbXmsWZLmQYrXtlagQwCl9BTSOD5ZDJ0ixXxyWkY72J9X+N86WQC8
 MS/BcJugdBW69iBXiI1qpdB0LFVKyfoSCvBAUJLG74LXyqCwmsSxol/pZ+c1MNX5+9bz+z+iJtH
 zfP/6+7yxMBObhC0H0Q==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44df8b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OoMFzGetkEUzUeWJbX4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pw067rvVmz18GvlWRWJmQrvvRRE-BxsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9D306EBA4E

On 7/1/26 10:46 AM, Varadarajan Narayanan wrote:
> IPQ5210 SoCs expose CPU frequency limits through an eFuse speed bin, and
> the valid CPU OPPs depend on the SoC variant.
> 
> Add IPQ5210 support to the Qualcomm NVMEM cpufreq driver so the supported
> OPPs can be selected at runtime using the eFuse value and the opp-
> supported-hw OPP property. Also block the generic cpufreq-dt platform
> device for IPQ5210 so the NVMEM-based driver is used.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index ff1204c666b1..284eece9e230 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -200,6 +200,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "ti,am62l3", },
>  	{ .compatible = "ti,am62p5", },
>  
> +	{ .compatible = "qcom,ipq5210", },
>  	{ .compatible = "qcom,ipq5332", },
>  	{ .compatible = "qcom,ipq5424", },
>  	{ .compatible = "qcom,ipq6018", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index e6d28d162442..b2aeda7c564a 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -200,6 +200,13 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>  	case QCOM_ID_IPQ9574:
>  		drv->versions = 1 << (unsigned int)(*speedbin);
>  		break;
> +	case QCOM_ID_IPQ5200:
> +	case QCOM_ID_IPQ5210:
> +	case QCOM_ID_QCF2200:
> +	case QCOM_ID_QCF3200:
> +	case QCOM_ID_QCF3210:
> +		drv->versions = (*speedbin != 0xcd) ? BIT(0) : BIT(1);

nit: checking for == is easier to read

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


