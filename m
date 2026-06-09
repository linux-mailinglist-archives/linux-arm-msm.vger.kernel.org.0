Return-Path: <linux-arm-msm+bounces-112208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NCaWO+csKGpd/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA486618FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V3kjTEny;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BlPgZOPk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112208-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112208-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 662CF3285D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3A335B653;
	Tue,  9 Jun 2026 14:46:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502A943635E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016410; cv=none; b=TCWDuXYV5k8KTHeER1co5/2+TXuEjM0axqw+Daeu11syLJnLQAmfl3c2OTS38dgCWwT8DRJcP67pfDkC9zfxoahWavx61JxGOoZq7wuAyiDntzXJ6Y9zdzkhr61n/HV0oYaKJMqypMlHzSLxTMIZairv5ecl+n9e7NBla66Fjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016410; c=relaxed/simple;
	bh=bcIiQ3Hy3fZNoZPgiIB/RB3eMSSwI+emSFXrO98HBV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5EYEr1T2dASn5cnH/q4DsVREIDxko5rHlNK+61g772MjAYxYxfUw12hMB85O3KXwcTBBoMy1vTSGZ0h4EZCJib9UGNYq3kRJB/U7TXbS2ZqcNZuQuCfhuk3HE2I0qxVDQDaOruKy4xucR2zNaW2IAhASLgLhqhNRSwaYjOHLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3kjTEny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlPgZOPk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGEt2251543
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vIUS59A0O6RBuRS+Kkco6cG24EEkEFY7etH/qyFh/I=; b=V3kjTEnygGOL69Ij
	WkEhWs3ymG/H8rKa/JUxRg/o1MjD3cubOObhIRGFP74ADLXbKjvcapH/gEPdF6I+
	+ZgFjiDL8BjAdCflyjgsTN6LKG8HBD6SOW1G1qkqasaJ28uumGK8hfNpInA2g2kR
	cteYG9nx4U6y7ouzH2iBw+iJFXvkfzjtOzJkIjq0aQW2M3t1kM9GtHrNMryNB7wv
	T3Uy8TjlOcEji/xDtX/Ur4maovZQVhncAaQzuVMNZSlEq55jVUlnLGFYDJ1eYOa+
	ltqMiFIo12/iVnnTrGBcDhrW+mm07ocRoMAxzNW4aDAr5B2J2qwqHIOjk7HQC/lV
	1we47A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghxeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:46:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cd4b27e03cso316512137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016403; x=1781621203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vIUS59A0O6RBuRS+Kkco6cG24EEkEFY7etH/qyFh/I=;
        b=BlPgZOPktizQC+gNcbXrzNE6R9GUOxE9+kpEwItQUGQIMeTo3QjCMQi9S/4zIV2qKr
         TUJ3L7Q2MA+JENTFsBz3gQUanpC6Aquur4uL0ZusG0UD+sVCJjSCBhEbwadfNhJliWKf
         IIDizNQClKHXSe7XZc+X6yLTe94X2wzKWLVMyY12ewVKXiKyVUFQ8Xr0kt8tlFpkdAV1
         mndIEudrKDHB6d5ZBNmCq9DYsfKPPywOcaPe8+kxmzduE9q8N5TuBp+nQbJojP8I23R4
         LgNxH53nwpP2IsHvttk2JOX7fXal0f5HCFyVuBNfmeTnjvtfuEN0+Yns+P7iro93nP59
         +2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016403; x=1781621203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vIUS59A0O6RBuRS+Kkco6cG24EEkEFY7etH/qyFh/I=;
        b=KLXZB/HoZD2QRpAfcMwC0y6DDSNi6FqXVfJ38YDuO8DiMFGRR8w+ExYVr4bnQb89Hm
         CijMPNQW8facmt/0g+iXbd+IMrOUFu8pRq4OEj3Sd4SV1fEw2zyXL5IYS7cfJ8sNY3l0
         KRXMSDyJhPyEnyZJbo8Cja7NuZyyDyBP+qlumtmR7fqinBnf8/+mdTuE1Lw9QnYBf9ql
         Qn2qc03WRxD8D2XDDE/l2TlQM/ht+45fyWsicd4AMii8q0MGwDiY8HRwWVC4yvBS/eWb
         M0jq4eeWk+nKKJdlSHh9G4C2rBs1dXihA3ag2OjQ7nyQuhlGtpm3+Nn2ZK7KBNG4z1Pe
         cMqg==
X-Gm-Message-State: AOJu0YwalxIrg2A0KdO5mhTkF8LfsRsXwgFnlmHzlKAq5NJFwhlmIeD/
	bufPClLq16f4iZODHWSK5UapJPzy4J2q3YEdnq49zbs/KxgqmRLU+Bmx3zD28nO6BIXOtvS0PWb
	thFZdlSstPYup3Xuoj1xMHJIukEPHw8FHZauF5gws9WoIqTWd9GeBAWYbt7E+SHY43GNa
X-Gm-Gg: Acq92OEHCHzLZjTQp94teQmvvzpB2Hzp/UMHQRWylw5yD5IcN+/F96BdHU9K/TB8Aww
	HK4Db80I8js21su+0DW7wogkZbSB5cSMC1TOASdMYzS2U0qhU63+9h3MFlVjx2Mz6Gd2rmCJ8RE
	k35uWV/Z6kQTDXNaGc5Atsfs7rm3cA/SlZV6A28ie6wjaxyN5/eb49hhEVA0mNrgI5eeI4wUQkx
	1mfjB0ArwLT862S7gemj8A/m2eedf0HOfU086SgESAJF3JxDXfsGJs1CI4ZmLafgfKaUxhgI3iD
	BqkQerpcvoLG9woym2eSUVL2uw6zyfTBV1WrZjMYlX+75KtZFV9GmZh+ExvFLSKSws0Xdq0MBDR
	STNMuxIG6YPh/crgW99Bw5eBd3+vyyy3OXmRfiBIg8rIxoM+kblWIXqtS
X-Received: by 2002:a05:6102:161f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-6feee4fa818mr3239496137.1.1781016403166;
        Tue, 09 Jun 2026 07:46:43 -0700 (PDT)
X-Received: by 2002:a05:6102:161f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-6feee4fa818mr3239481137.1.1781016402812;
        Tue, 09 Jun 2026 07:46:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm8879687a12.16.2026.06.09.07.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:46:41 -0700 (PDT)
Message-ID: <468b82e4-dbe5-4fb8-984a-7f91089d3ee6@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:46:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: Enable Shikra interconnect driver by
 default for ARCH_QCOM
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-shikra_icc_kconfig-v1-1-c589db2d023c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-shikra_icc_kconfig-v1-1-c589db2d023c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MCBTYWx0ZWRfX1lvYDkks+tdd
 k0eLD23Akk4qYmx0Ui3eXhA4XTBEsP6FCOYYs1uvCApd0ZBX3tLH/Z2dQLW5HvThxt8SSDeb0iD
 4JDScooHjogegci4LvsHne4H7xc/rFQNTD5HYIB1BuNggntjEsSkYv2Ih5RxB6bkW+bZD8h0d+R
 noRlwSfk8EGdqYxmxOfRMAMSaKat8wL5caZnsVXlF74FsGHTf0oBj8LyEBuqie+QFeixivggvEo
 G5GelZ9xB0jfWamG33HI04iphIr7XsdbzbFnX2jgB2a48+IJPSCI0fOtL/iKeGqIN2fBxK2qB3g
 LkgxE30LDeGcGiY4S/ktmpvYNEooMPtZ9NBXjIl1ksnjKQTglNRv46zXygx3BcQJMBlJyRBARCr
 i1GKVhkvDzsjjOAYckCT6CsNatUHPQ411FtuZjvslt7WbsvaC7nHqPQgFzRSn6eQioDy7WLMKr3
 XwDSN6LpH+Yb2NBQfAg==
X-Proofpoint-ORIG-GUID: rQgII8wvoS5HpACV5ZCxeFP62q94SkdP
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a282754 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O3lOxlod8mDF5Zn6aN0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: rQgII8wvoS5HpACV5ZCxeFP62q94SkdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:raviteja.laggyshetty@oss.qualcomm.com,m:djakov@kernel.org,m:odelu.kukatla@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABA486618FA

On 5/26/26 7:21 PM, Raviteja Laggyshetty wrote:
> Interconnect drivers provide fundamental NoC bandwidth management
> required for correct system behavior. Although systems can boot without
> them, power and performance are impacted.
> These drivers need to enabled irresepective of the board variant, design
> or configuration.
> 
> Enable the Shikra interconnect driver by default on ARCH_QCOM by setting
>  "default ARCH_QCOM".
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

