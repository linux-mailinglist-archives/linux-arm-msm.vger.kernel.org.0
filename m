Return-Path: <linux-arm-msm+bounces-118326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v9QJJjsPUWpB+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:26:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA273C390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:26:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JbA4+60f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LXg+2TOB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118326-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118326-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A45883010F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6345732B114;
	Fri, 10 Jul 2026 15:15:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB1328635
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696499; cv=none; b=feRt5htSBF2B2bu1dVe2jPb5RU7b4SmDtbfDO3TfG+XpUXT1ti3Ef6qRKT3rjcyeRjojNBTHSX8PRH1HsWUyRd/AyYvAAZ6aCP1wq7LRXlCKubtSqFltG9dtAfoyc6L7YA8XsTU1YUfIYpqKK+cxBXd1t5/TQ4JiFkfhmOU+2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696499; c=relaxed/simple;
	bh=Q7SXo8DC/0xS/EZU1J22olGXiFpFxo8B5OX9/Vdb4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oB+b3aG4qbb1rmqM60wTIYdBazZh9eqh5RXSTyMaz/TcBr4qYWJ2q9K9T8tGxHErBmudRl9P1B/8taQNEcuVhsavGnEti+n9O9/j9cgQsRjuAQSe6XrcRtujkd2VFHy8kzc3ko4mDVJ17nAyS9m8wSnGjag5xM9I1f01mqAp+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbA4+60f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXg+2TOB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEeDPN1032513
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=; b=JbA4+60fvXE5wrgp
	fRoUWRMadr8xo23/8WiDX7RuIC4x39N0cwd0+jGNv9e0vD1i5ez8uamhaz1mUdWZ
	zSZEejERnLZxR5WqFspxxM0yI4L25gRA8NymVBBCNgseyCb1zLdLttA/BeFDjSda
	ITGRXlOuXClxHb3QawJx3+e4qR3CFuCwBoNi+6rSgtaPy+BT3fn37I6CTwMEqI4h
	dmD7iqk1CM0Tcyps5rtLwNF/o3a3fzI6ZfZrvnVgyodqQgksP4tD5fdvpV2z0yKR
	25beYSmh0RSpOyq1rougnAm8MK+oK7ooWpv6uQhubFRiyK9XGR/OAkVR3+ZpPunZ
	yLRDBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc86jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:14:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so234735485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783696493; x=1784301293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=;
        b=LXg+2TOBjz1C9woSFMrM/nuE3nYx/cw2kcsQwW+IBbS5y3MZBJrM6bqkwxDNr7EoGK
         dVWZJfapHSR/ZJXVv7mhE0hzDtght/Vpdkr90MPtp5y5yx19buHIEtQEqdplckpfPRPv
         i2vZKUDtUrsiV//Xn0z9M1JAw4epurdR6XEPNfipnqXhlFWvol2uio3t31MIB0c5lvAQ
         twIZmsksVMRCAMQ7bMGagUiuYFHMufPktD8k6LmyslosxarvjaqR4FC2b1gJ6KtwxeeQ
         YSjRVOE0lGVmIqMrZKxGv4OT0J/TjaNv7jlbTwbCVPGzq6mNnI5+lZ3dmPtXmPPybGHu
         uUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696493; x=1784301293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0V8KZPgKxdhmBKZy9zTx1VsGb8GdWSYih1vACwJ2JM=;
        b=nwRtcwChAF4jRCJ2tNPGzfEFgB6MyIzXS38WJaw6SGt+t9u8pDOkUEm+z/YaL8lF7a
         eoGSPkhpXYu8l/XzLq46Lx2/6+FY38xcu0jwqBNAUF08uiZO5PZlS1sli4iQXVdTOLk7
         pX859OYP+6WxmKlhJWLSJfqnLNHIcJ+7kp7KoP95H0ZRRpq4d4uzep/Xwu2lgfwwhyjZ
         Q5yo8lCynpPRRSu19CyX8wYllDvBYc0TDIwrwfaOiS3NorzKmM7OY1KYyi9NhuT9H8yO
         2CCbEHoebf7SKXrQz9Eike/7w1ijA59WrEiJGLkz+YtpdmW+Ml9G25cjKyfM3m61W2z+
         gndg==
X-Gm-Message-State: AOJu0Yw+D9wKfvh+T2IniofjTSrT1hywWX7q5ZGhL+nzg0D7DYCnMbUA
	gOaFQkeeZzL8uOO3yrxxSCz6qrdODPG2g34WzsWdIi9AMfVOC6AwxYIT4DUMw4ZykJnEsDSec5N
	W7ByOaOtM8F1IJwsSnHfpR3N9lwbJ2soCpb6NnxJR8xT48PPOiW8WhTNjJnt6jr7w9Srd
X-Gm-Gg: AfdE7cmjE9AwPCdq8kja3yyDX2egJOLvD3Cnr/U0ppBmmaCe+fA2ztezhPx/1R++54c
	36AgpAiwnrlR75Q1mtD8bUFLgiWIARt3AdDoV7N7RpOCJvBgfCGZJ4HeFHefhDL+VpuKTLGHGjW
	dJBfaJ14g56UzUAcQb/bAGaz2/R1XpaL6cMxyY/OksLyfMxcXAsf6K+w9jzx+41ZbBVdh732fl7
	TSpoLUxHGj4MmpaG5zXX5ZILMZPaupCzlL658DybQJ954t7legOXfRCC99iXqznV7LnHo1eiMJt
	e2mjAvHTrV20CervcdBTOXjpF71AuhMnY9qafczJ2JInyKW1uwZ/YFY//j3uWb0FlBCoU5bgYMN
	3lhsUcD7P24LTTNi0D88E3cObT254Z+BaauLP+2W44QGSs451lFiK/TUC0l73+Rz1Cq6Stl+BQw
	==
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr41262431cf.44.1783696492614;
        Fri, 10 Jul 2026 08:14:52 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr41258081cf.44.1783696487295;
        Fri, 10 Jul 2026 08:14:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d86b:ddff:83a7:67da? ([2a05:6e02:1041:c10:d86b:ddff:83a7:67da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm4604990f8f.3.2026.07.10.08.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:14:46 -0700 (PDT)
Message-ID: <67b7d76b-f13f-4dee-9b99-d7a8215da504@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfX9k5Es+ZmCqCK
 CkmbaXFAo1TTNaBworW4VFdc6LFf+L9WVknHahAiPrfoKaNvuzBt9PEGTXv/ndi0bOlAws2pgN5
 oV5Nw9whfpw9VoMIC97qswSxUYPgGTzi6usCpe2eVIcfPKEP71HnhwLSAQevVGbhtgM0UNrxSI7
 3PcyXQXAxv8wv+nH+M/gjH/qZQiqprNqHdg0FEKaXYcRBWxg4Jp+/NnPFtv7oURH5BgBIQ6D/jr
 ngI+mH9QM+HrtWabBQg17KP6ZZ3yoAORmkTm5A5m6Aizo1YV++QHs0UEzo4QYEEbdOaILgTQ2Fo
 7wtwkLTyFoZU11NmxvkZAXjtOOEDOCufsCR2IjP+9LAAT6fcKEXgLIQPlfG/GBBexlZ9Z2oYUqV
 3nqVnxvKSHf6LOvxfZrUFCq9yYsCmjHqceacfou0ZJlbJRnrvEQHE3hy53n0mydFKeswI0SiIcR
 PfPISmnKM9KYTYnhUAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1MiBTYWx0ZWRfX7uFqRjKsBGYF
 i+XJtJAWbAKC7cdJBlYSLpK1W3Iu/UYc6uKkZryDk6CLAdfYZhOqivukAxcj/XjZwGVdhgJo59+
 UPdG0vHBwX6kmkkgMUncbH7hCCMTXew=
X-Proofpoint-ORIG-GUID: ZWq-uDpaCtriswJp71L7y2trbcXP5vTA
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a510c6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ELNG7oYFuFGS01GaYMYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZWq-uDpaCtriswJp71L7y2trbcXP5vTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sachin.gupta@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quicinc.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90DA273C390


Hi Sachin,

On 7/6/26 10:14, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors the

MBG ?

> die temperature, and when there is a level 1 upper threshold violation, it
> receives an interrupt over spmi. The driver reads the fault status
> register and notifies thermal accordingly.

You are describing how works the thermal framework. Please explain how 
works the hardware so we can understand the submitted driver.

> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---
>   drivers/thermal/qcom/Kconfig            |  11 ++
>   drivers/thermal/qcom/Makefile           |   1 +
>   drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 256 ++++++++++++++++++++++++++++++++
>   3 files changed, 268 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
> index a6bb01082ec6..f2fc24a3096f 100644
> --- a/drivers/thermal/qcom/Kconfig
> +++ b/drivers/thermal/qcom/Kconfig
> @@ -21,6 +21,17 @@ config QCOM_SPMI_ADC_TM5
>   	  Thermal client sets threshold temperature for both warm and cool and
>   	  gets updated when a threshold is reached.
>   
> +config QCOM_SPMI_MBG_TM
> +	tristate "Qualcomm SPMI PMIC MBG Temperature monitor"
> +	depends on QCOM_SPMI_ADC5_GEN3
> +	select REGMAP_SPMI
> +	help
> +	  This enables a thermal driver for the MBG thermal monitoring device.
> +	  It shows up in sysfs as a thermal sensor with single trip point.
> +	  It notifies the thermal framework when this trip is violated. The
> +	  temperature reported by the thermal sensor reflects the real
> +	  time die temperature through ADC channel.

Explain the hardware, all sensors are showing up in sysfs and notify the 
thermal framework about thermal events

>   config QCOM_SPMI_TEMP_ALARM
>   	tristate "Qualcomm SPMI PMIC Temperature Alarm"
>   	depends on OF && SPMI && IIO
> diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
> index 0fa2512042e7..1bec2746b98d 100644
> --- a/drivers/thermal/qcom/Makefile
> +++ b/drivers/thermal/qcom/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
>   qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
>   				   tsens-8960.o
>   obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
> +obj-$(CONFIG_QCOM_SPMI_MBG_TM) += qcom-spmi-mbg-tm.o
>   obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
>   obj-$(CONFIG_QCOM_LMH)		+= lmh.o
> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
> new file mode 100644
> index 000000000000..fa2f10002253
> --- /dev/null

[ ... ]

> +static const struct mbg_map_table map_table[] = {
> +	{ -60000, 4337, 1967 },
> +	{ -40000, 4731, 1964 },
> +	{ -20000, 5124, 1957 },
> +	{ 0,      5515, 1949 },
> +	{ 20000,  5905, 1940 },
> +	{ 40000,  6293, 1930 },
> +	{ 60000,  6679, 1921 },
> +	{ 80000,  7064, 1910 },
> +	{ 100000, 7446, 1896 },
> +	{ 120000, 7825, 1878 },
> +	{ 140000, 8201, 1859 },
> +};
> +
> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret, milli_celsius;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		if (chip->last_thres_crossed) {
> +			dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
> +			chip->last_thres_crossed = false;
> +			*temp = chip->last_temp;
> +			return 0;
> +		}
> +	}
> +
> +	ret = iio_read_channel_processed(chip->adc, &milli_celsius);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Failed to read iio channel with %d\n", ret);
> +		return ret;
> +	}
> +
> +	*temp = milli_celsius;
> +
> +	return 0;
> +}
> +
> +static int temp_to_vtemp_mv(int temp)
> +{
> +	int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
> +
> +	for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
> +		if (temp >= map_table[idx].min_temp &&
> +		    temp < (map_table[idx].min_temp + 20000)) {
> +			tc = map_table[idx].tc;
> +			t0 = map_table[idx].min_temp;
> +			vtemp0 = map_table[idx].vtemp0;
> +			break;
> +		}
> +
> +	/*
> +	 * Formula to calculate vtemp(mV) from a given temp
> +	 * vtemp = (temp - minT) * tc + vtemp0
> +	 * tc, t0 and vtemp0 values are mentioned in the map_table array.
> +	 */
> +	vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;
> +
> +	/* step size is 8mV */
> +	return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;
> +}
> +
> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
> +				int temp)
> +{
> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret = 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +					MON2_UP_THRESH_EN);
> +		return -ERANGE;
> +	}
> +
> +	/*
> +	 * Configure the last_temp one degree higher, to ensure the
> +	 * violated temp is returned to thermal framework when it reads
> +	 * temperature for the first time after the violation happens.
> +	 * This is needed to account for the inaccuracy in the conversion
> +	 * formula used which leads to the thermal framework setting back
> +	 * the same thresholds in case the temperature it reads does not
> +	 * show violation.
> +	 */
> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;

It is because it is inaccurate or the temperature decreased a bit after 
the interrupt fired ?

> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops mbg_tm_ops = {
> +	.get_temp = mbg_tm_get_temp,
> +	.set_trips = mbg_tm_set_trip_temp,
> +};
> +
> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip = data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
> +			chip->last_thres_crossed = true;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR) {
> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
> +	} else {
> +		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");

What does it mean ? Spurious interrupt ?

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mbg_tm_probe(struct platform_device *pdev)
> +{
> +	struct mbg_tm_chip *chip;
> +	struct device_node *node = pdev->dev.of_node;
> +	u32 res;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +
> +	mutex_init(&chip->lock);
> +
> +	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chip->map)
> +		return -ENXIO;
> +
> +	ret = device_property_read_u32(chip->dev, "reg", &res);
> +	if (ret < 0)
> +		return dev_err_probe(chip->dev, ret, "Couldn't read reg property\n");
> +
> +	chip->base = res;
> +
> +	chip->irq = platform_get_irq(pdev, 0);
> +	if (chip->irq < 0)
> +		return dev_err_probe(chip->dev, chip->irq, "Failed to get irq\n");
> +
> +	chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
> +	if (IS_ERR(chip->adc))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->adc), "Failed to get adc channel\n");
> +
> +	chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg_tm_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
> +				     "Failed to register sensor\n");
> +
> +	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_isr, IRQF_ONESHOT,
> +					 node->name, chip);
> +}
> +
> +static const struct of_device_id mbg_tm_match_table[] = {
> +	{ .compatible = "qcom,pm8775-mbg-tm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mbg_tm_match_table);
> +
> +static struct platform_driver mbg_tm_driver = {
> +	.driver = {
> +		.name = "qcom-spmi-mbg-tm",
> +		.of_match_table = mbg_tm_match_table,
> +	},
> +	.probe = mbg_tm_probe,
> +};
> +module_platform_driver(mbg_tm_driver);
> +
> +MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
> +MODULE_LICENSE("GPL");
> 


