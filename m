Return-Path: <linux-arm-msm+bounces-118948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UTZrIq7RVWrftwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:05:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C9751523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:05:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="J28O/RZg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=evDxUqZF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8CCF305AB12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289AC3D7A07;
	Tue, 14 Jul 2026 06:05:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B09F36A033
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:05:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009110; cv=none; b=k7xV+au0Y6s4fopqZvv9IdQXprZbrIcHy1nWcbJpENOYJ2xd3ACFbmDNv2HALkLgoPzb5QRxu6+1VPGquhywd4CwYsE0NSuRO02QTh7DWphecusDA0kxJzq+a6q0KdbDeLE3IdWatwKPeu4bEvsVF+LCgTNduqhG2Z+mi5dPlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009110; c=relaxed/simple;
	bh=cTM7Utma1mPa9YCMZME1aqbleG2xe3Cdxz3itTeROHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvjM1gfa4UtkFHEUTWzAL6X03mnnnhpc68nExgESuWQbPJAl0QD2SOvUjWam6+GfbgfS/dEq4pIAnJQ6Izr/BTi8N7DJ3ZQz25ONzSLZHWhYpp315/cCJ4rpLBVUMwOhzBSSonfcp/nWHDur7IsKKM81rfE4WGzjzhF7Vxc2FSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J28O/RZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evDxUqZF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3eqvh3365303
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=; b=J28O/RZgF/YPJQV1
	aglHk98mJ6cpDy24zHGyWrw+k+aLlciKTMYce9Ha87nVLu4UN6XTgWNUr9KdYDjU
	1oIlFkmP6saEFofCayWYt/eGvntl78dmeMEOW6YSawpsAPk8CRcY6SQ0KG8ksqWv
	E9t7yEfTBHrA8qxNgW3CsbgY5rl0d9K9zbvG6qqQNhLk3atpD7NMBLTAb9k4Suh1
	6pEFYsqI6p1wfRfROXQH+aEgtu6Y2r6DjMBLvAGLG8RoA+8s61RC7XITYW4N/ta7
	Pi3QIyB9BITwHWVl4CcOVzMY9VLZmDuumtRv2UlNeLulE7y4Xt+iD45M4tJK1NF9
	RoX1zg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde08ean-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:05:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so36454595ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784009105; x=1784613905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=;
        b=evDxUqZFzkpokTZtD4+xQGn+Db97k7sxREKV8DcJMNL/IufrXPtIApjantBFKXrabV
         184ubEVX2VZ9vOBWN2CwJSwQ0aDmA+BvQLBxdCI0T2BzwFY5w63KJIeHKKpmaNWffFhZ
         mzJNM24+uR/73WAJ2WaysrdK79Jeo+jx9+RfAMYgZgTD2fDLnikyhlyXLuDjqeBayRQh
         YR8ovtc7w4OCKrw2GUO4F8IkFQS4aKntZuHb1pUNca1PH8mbeb5us4MNyd8C9HTcrDQV
         6fjrTtaBQJoQ/bcPADhhvom3Tlgv2piFj6Qy5E1TjqpAGewtaVV5tHTW+lfvVn6dc+b1
         kAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784009105; x=1784613905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=;
        b=gIbocPsttqPWJRdMu9V5gO7ba+EEPxTrPpGI39dXtHP9Vfz03ViIzJMj+QFlEFWHI8
         rFEEurikx3aE/oxb9+x5vCDuABX1Rao8G6Nag7Inp1uDC+UpozXt9UafLj08vD7LRxjn
         2kZx2i66zi0n4U3FANa9RlUzFk5VglUsD1a9qtk0iCnBzfvcINvisT70kXl9bOpFzbh5
         6aHSgYHkbzmdxIpBsWmsZ6ASJXbRw2pr5gozgxi8nIYcLUPBVFLBspMulbgTTcsuknXX
         0aGhiG9dPa6nE8Oy8ixOZn9ERXXPIEJjLZM7UjLg8x9UJIMpLnjEiWwYyeBoQyGoyfbp
         6GIw==
X-Gm-Message-State: AOJu0Yzk1GjJ4i68uD/ZrGBsOvFNZO4dIYU3rNcWEDuI6vH8feZyVoNU
	3luxkGfnQc+uwGdFtDlROWsQX4mUecYun6TrBfwO7FWuQWSaWU2E1rze05NTJe8GyrPLVw40dEt
	bBuZFt7QbvjKx0DCXSLGtaaMUInD+Hqz8QBhKWSdvL4rFJnfDgF1Zvo4m0e+3lNTc+i+V
X-Gm-Gg: AfdE7clTX6HAjzGg5Qu0p8PQCfSXMpemJSk0LUTjKpXDspx9X+vaB+XkQbLVDoQOySU
	6loB2ivWqkwPhKfvXs2doR7CKmKsCYH9yiVbqfm9VFT2k2iBw8GOtClT1LG5cn4CnjNRF7B0bTY
	UlCJ6zZtWy9HFhQjaa/bc/5z4RiRwVvv82Jw4PeSvhMqCBVUvAraLheSx1R3qv9CJUlCkbPAfvT
	VOGqNhYRh3IGGSO/tRsxM0C3hhm8q6yUql7nVvOUcC6Yj5lUpQEaM0Y4DW9/hNVywf80JUw6MWj
	oHJf/ZNNBaCOwyM+GbTAD+bInRSoymOTLjB66cvkmXDBIGYtVQZagkGm8NSBTG46Iajq1IRl8X7
	8OlUdhH56wbmU+BxE7odQVNHU5/JZlt0aLxCaSbxQOg==
X-Received: by 2002:a17:90b:fca:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e1ae26793mr840944a91.12.1784009105283;
        Mon, 13 Jul 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a17:90b:fca:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e1ae26793mr840911a91.12.1784009104777;
        Mon, 13 Jul 2026 23:05:04 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d37sm894492a91.2.2026.07.13.23.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:05:02 -0700 (PDT)
Message-ID: <fe3ac7ae-8aa1-4ec2-8735-423d58eb9fec@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add QMI TMD based cooling support for the Shikra CDSP
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfXy6FBohk75krd
 y7dUTNLYHE+mzhyFXFGxNNJh96DVJHLu1Qn9Jlbd6esTRovB2yfe4wQSvPHVW90AKLblB+U47zf
 09UHSm9XwEsxkllTy9Bh0SygtFcVCe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX+bm/gkfLPiqh
 awMdd1YVMfJEKizaf53dK8zDO4xaKjhxDJbuR1FnYiadsRi8T9sNyBE0drtmAs1diykfVMIDIum
 f/bBph6+lqjrwWCdH5Qq6QFWawDY4Lh+98ep20wgYTdUWPf0iHGUiU1b+lIKyxDgHkU2A0ByD0q
 0CHOdNLOamYsyQi2IyTpIdiXDG9d3LWKWVCjF9GQM9yaAkdmZTf7fiUtLJEzF69wDaY6IyFwnkE
 Q9HzVtsEORA5AUQtQ7RFpqZ1zDwnCT4gNUY928ri7uGaWMEjqZzR8iwVIaRLmJADoF9vpdBsp47
 zLbKCs9dq4z+1G3ToEMKYsuF2CYMGEkWb2ETUGdhIvPHxlpZRje05/Q7GZzmzz12zpzhWJhVqzb
 f9NCHSBUYWZ0lg0Pg6UxisyY0HjM8pcItlQICRwnXbAlEi0gURiCfpRm6n7E2GwouiEt/IJkrgi
 tAFicxYBMLDng160Eyg==
X-Proofpoint-ORIG-GUID: h1Os6r3IJkPPB8Ro2FAmjaaw4wm4Smrr
X-Proofpoint-GUID: h1Os6r3IJkPPB8Ro2FAmjaaw4wm4Smrr
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55d192 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JVEoc1XX2nbpnddg_OYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118948-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dipa.mantre@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D19C9751523



On 7/14/2026 11:30 AM, Dipa Ramesh Mantre wrote:
> Unlike CPUs, the CDSP does not automatically throttle based on thermal
> conditions. Enable CDSP thermal mitigation by adding Shikra CDSP cooling
> data to the Qualcomm PAS remoteproc driver and wiring the Shikra NSP
> thermal zone passive trip to the CDSP QMI TMD cooling device.
> 
> Depends-on: https://lore.kernel.org/all/20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com/

Please wait, we will send v5 version of this series.

> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
> Dipa Ramesh Mantre (2):
>        remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra
>        arm64: dts: qcom: shikra: Enable CDSP cooling
> 
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 21 ++++++++++++++++++++-
>   drivers/remoteproc/qcom_q6v5_pas.c   |  3 +++
>   2 files changed, 23 insertions(+), 1 deletion(-)
> ---
> base-commit: 22f1a2f6953d5cc0a82845a69a23216158325d61
> change-id: 20260714-shikra-cdsp-5ec6ba6c51ce
> prerequisite-change-id: 20260609-qmi-tmd-383d30e1a60a:v4
> prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
> prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
> prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
> prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
> prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
> prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
> prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
> prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
> prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
> prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e
> prerequisite-message-id: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
> prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
> prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
> prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
> prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
> prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
> prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
> prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
> prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
> prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
> prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e
> 
> Best regards,


