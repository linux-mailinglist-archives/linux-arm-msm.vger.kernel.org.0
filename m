Return-Path: <linux-arm-msm+bounces-113564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RCsC755Mmon0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:41:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D969898D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:41:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hj6tap4s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GI93GyPY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113564-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113564-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF5A33082298
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0347276E;
	Wed, 17 Jun 2026 10:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8681B46AF05
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692592; cv=none; b=Pnsohr6KcRMOaxaNb2U0SrqqUcPFt4i0cm+06hVh2HEvdnjwRFGusLFWjxByRuBijhGU9+L3Ob7e0eZwEyTeLq/r04MgGgYFkT3CRPszCti0q0Z5eaHb0gb0jD8+4BhF1+CZmfeHuabpQ3taSigg8KF+cfiL2SoweE+3u0YI+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692592; c=relaxed/simple;
	bh=KnTuYeZRW8y7/0KsX+KsMVHS3o+Iun6XoHfPR8REoOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfVZnWexROwqrKXOmIEP0mXRK/wBwFi0XSwGHjJtWKCP65uaV5cE1BIWWD7cU6R5ffizZPXhrTXgm4goUJeYrb3APd7f0buZQnF5/SI/aerMM4OZeTetbsBvT6chwpNnS5UKm4B4choNbDfAylHzvygF4265dBM6ZqVauogVFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj6tap4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GI93GyPY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V1lw2025877
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=; b=hj6tap4s3U9IembA
	xIXPtrZdvMZX7kJdB5YSJ0FamtjXDYBiuc7wNYMJ3pSh8ylAH/d/G0NTYga78MDZ
	+6ay6cKH2B2/7yXbtmdjNniHP4TWL5AFyEtSL40QySt6PFnBy9zHkmRGc1yaz+00
	vrwA3Z8pebvzFTYcZi5tKD6tdrLCmXlyMdC+Y2481yar3jRrzoyD8J+BKNM0fLCc
	6oHbJ+9KUtYAYnXWT56pQC8NLYppgMs2UvWBd55YGrFKAI7iNrIGRkEhSea4JCpw
	2n7NRV4XK3vmuQwZblO+pKrTjC0EpJtY2t6Y1g2VRSEBOg0+/vZj6ebfnQNslC4p
	QcLSpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees2p1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ac43d27so14423731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692587; x=1782297387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=;
        b=GI93GyPYk5GDsqOe0+aFhGqyVh98Hklu+oxiWs0ylec7ihPVbMvsfq08Y8WxLauwDo
         7uHXhoC9DRhxx+QuVhiR2F52RTDZtzcbkshYCGci3sxRzvqxHU7oWlWgmq8ocD6l+NoW
         8FSTw97u2cGQnDECESTyaLr/ixMWg8LSboa82gGZA2yixIrgdqIXzpEZuRjKo3/v9IpG
         TwYzRSI89MW7yPXnaf15MiCj1s3iAc1Mc+H1Bovi7El5TyiSsSK4aJJ+Jti18Ph3RCtY
         MMewqlm8MohCGKudtVBeZg1xvviZPwadbFwPjbPqIMNSAHhMEqiuCDHoQ92murEWI0ih
         8sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692587; x=1782297387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=;
        b=dcjesWz4Vs6iI2L/mhZ5li/em69w3OJajVDkKe16nIHCkKRsW4kFI8YkSpawopgj5m
         UOdHL7K0c9+3Ehbzmp0GlROLPU+EIVBxSZY5iEq1byCMxiIan4+F/KG4JVnUqjltxDaW
         WWiOScFjnQvbPnyCDakNtcr6bJp4adWc+mmyDOMglDE6WlP2YFjQ7/XR6DGYsz3Hf2k8
         CgGv0J4MxzKERE3aS27S5VIPfwgML+nPr70bojMMPWTBVbHyjReGzQTGapfbMozKVt3X
         z4JSte+oQguX4TagLsB11SJq55G9FASI3EJffwiIxLolArGK/wscgoJcB0/ouHOkMR0h
         sPQA==
X-Gm-Message-State: AOJu0YxumN0cMdzLypUZOJ6J9f3tYjH5dwnlI5YM1EEF2sVZ2g1c06zo
	B2LDE4olD9W9pfIvkE/QsSPkt9Ii78wqamdrV3D6JzPf+xSD0lYS8T3IgcGJ95CqPtgqO/KKlGg
	5/zLHGw1uMTOpMRaN3YND/xjDWDAzpReeOZ7qSeIguTrb5Uf1IHRH6ji+nt+Oxp1m/yx9
X-Gm-Gg: Acq92OGT2yBn/XEn8mYx6cfK+WGyU0qlsguX4RK4Y5znz7P7Hn2tS60Z4oOJdYMT0ce
	B+V5EtVfvsEeqIp7gX2E6hcGCackLQIBaACaNqWdQn2TLLdgp0oeEROpOFtzqL9wNQXU4MYau76
	/XnbXc/plZPqasjMi3Cpvgozwa18PjeYfQlRjrkFBZsqjW8I23MdN6hNf+0SdMkOhBDppnmBiXt
	6cqJblbSA8jQ5HIMSCFSxo/sqFbi9EPHWKkrH0wV43/vmJVS7S5kLLI3ijb2+mzwUHZHhKy2ZLE
	TdIdUUOCrURGBRqRwp2HZGiyXA5piYrUHxhgEpQiQkgsFmi7odeL2Zx6pN6SQRmhVSUFYaz1aVg
	zvSQAO6BNeoA5QkuTkLfSv5eILO6SY6GcTtM=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr252973085a.7.1781692587557;
        Wed, 17 Jun 2026 03:36:27 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr252971685a.7.1781692587168;
        Wed, 17 Jun 2026 03:36:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm773989466b.22.2026.06.17.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:36:26 -0700 (PDT)
Message-ID: <ff72dd25-926b-4a51-99ad-4535f6025dcc@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:36:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] interconnect: qcom: add MSM8x60 NoC driver
To: Herman van Hazendonk <github.com@herrie.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
 <20260606-submit-interconnect-msm8660-v3-2-f9da0158cdf8@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260606-submit-interconnect-msm8660-v3-2-f9da0158cdf8@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 93MImvvEjcXnJj1KI943d5lgi8zo50yM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX+HOERKJSCEwQ
 9ecPeHWKn4km66jsgUSzkr+JogF+eXNPHanHpgMAnrByLjWhu7ChLgqcYLxPZttBAZ4alfmbhHE
 CeNL93W5D6YLvU5d9RolDRGTPx3CZVlJsWxzizck90y+Vy5Y8QQHScASIC4WpT5cgwxntQGlBT+
 I0e5WVnomrKGznTUi6TYUtdM2PWKheXmQG9rnXxH09UBVM/zRmTBgFPFpP/jW3HCINa7f/m4KqG
 zssZKXoVdrbQ85ylfuJbp7fH05YPKMNVfQDXaVTzpPw9nS+LOjotV1So4WhrcbrlH/Sjbk9xVhs
 +4nKAsaH1NO8Zg/EV1OQe2Kt9UVfCA3iF3K5/+x5KBuMk8uoKUivIKJb3YCzxUcJMI5LvaDgmcJ
 bDVPGPsWgmzGntDhkpkWql+NqIrLBHElR0v2F8Sgw93DckLaPF5Zr8TRcPsyZqSxgiYGFfzM4gj
 duRgwKLtwKX2dVS5XDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX5TyEA93JJwwE
 28sgLUipMNz+AA1K3IFrpVDmRTqpGoYCJeigYhP2gn6gOHTh4B3dmaMxz8LMmp3BaBRI1QYMBvw
 xMdd7p+Cf3vhun7MujpPw7Cv7YYsibY=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a3278ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=eFASmHcy9aB7nxdwtpoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 93MImvvEjcXnJj1KI943d5lgi8zo50yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC0D969898D

On 6/6/26 2:34 PM, Herman van Hazendonk wrote:
> Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
> four NoC fabrics (APPSS, System, MMSS, Daytona) that connect masters
> and slaves on these Scorpion-class SoCs.  The driver implements the
> interconnect-provider API to manage bandwidth between specific masters
> and slaves via the RPM arbitration tables.

[...]


> +/*
> + * Minimum fabric clock rate to prevent bus starvation.
> + *
> + * When no consumers request bandwidth, the rate calculation yields 0,
> + * causing fabric clocks to drop to minimum. This creates bimodal
> + * performance: fast when other subsystems (like display) happen to
> + * request bandwidth, slow otherwise.
> + *
> + * 384 MHz keeps fabric fast during concurrent MDP display scanout
> + * and USB gadget traffic. legacy vendor kernel docs: "AXI bus frequency needs to be
> + * kept at maximum value while USB data transfers are happening."
> + * 266 MHz was insufficient - USB crashed during display activity.
> + */
> +#define MSM8660_FABRIC_MIN_RATE		384000000UL	/* 384 MHz */

Can you ensure that through a vote in the USB driver?

Konrad

