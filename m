Return-Path: <linux-arm-msm+bounces-104151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AKSJcbv6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:56:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 923024482B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC2AD3019FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5FE3603EE;
	Wed, 22 Apr 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqiNL9cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2wQdzlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFE8363C77
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873366; cv=none; b=SlH3BA4l8HE1s9shKclA2Gm401/T2gA0dGIUxpQgQb8vlvC9ows8gqzSELkHHyBSQ9GFaCo3X5FGidD4H4lHx80a4Eua9SBzClIHm0LvifP69k8nBR0xfRRB6P/r7DMwoqFEuuSSlTAD7KdJ0JNYha6uonVvT3CyYHYxJk89Bt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873366; c=relaxed/simple;
	bh=0a1b9eeFZMt+GbcDWk5KOnb2FyE8htEnTFk5bhgpdJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EduLWf8zBH9yESubxp3m3g+Gwj9UQZWtR/0G1KRnLDR31NEyZ5W70AhF3MNa9FEoUquB4Z9E7EnRmcEJJzTJ22hYgwEHjXERvjQPS+/qWa9D6Op90LUwXcbPN2iQNe7KuGgevjmSavcY2jpQcGzn9RFy3Y5YB62DG5JErsBo+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqiNL9cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2wQdzlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAjDg52000979
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=; b=BqiNL9cmzJbIV5Uo
	LlDoap9oUKVneQYVXAZ5nlh7bGJNc0rS9/KXj3ev9uSJHFqV90N1mw+tajvWMVdR
	cacIaH4tPrCRNR2BXYFMHym9cwSpOj8VW3Pu5coTj6kIxVttJMU6Lx5n6BbpgfNl
	ih/T1YCPsPKsvX6kqAKBG9oNzlBtf9vekYeFctY6csAGukGr656F9bMZ0NhKl1jP
	8NMY9hmpFjcwRxIBrTV4pa7VEkPIbhlBgi6lDkfomR58eh+pDy2FJqD3yIz/3jUk
	dDWmh9/jeK6j/MyhgjQXCSrwjw+EZqiVIFanY0KGBO3/6lBrN1GCXjnP8SRqulrl
	mk2QeA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfc781-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:56:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95a78846a1eso1333332241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873362; x=1777478162; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=;
        b=j2wQdzlhqawz2gwsahlW/Uem79hzXfOedPwA2vHnCmmz6F+7MIKmJgdbUiqo3jGsWK
         a0C7se+CK3r0NlgA9CQlW2rCMjkYXPWwQnsunMKTa4iqAHHBoVTRkAZGwbEhS0efn1UE
         nmZSkyJVrSKxOFrKWmuJ1/o30DxWumC8q0jxsV+FPGL1BCPW0DBCqSIwR/FZVuInn+1J
         CHgBqsoVss/+Qoxsh+4zDRdyZmsD7MLK7VcoHCUV2f4o+NqyGqkiLDRILxKC5D+VVE21
         IR9YtbWANpsb43p7k3O0JkGN7ubImh7nnhtKo9Lbq5V6FxNS89Y9NK+Ue5XC+jrlFpgp
         DBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873362; x=1777478162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=;
        b=dPQq1rWZBVEz91rxOYH/UzyA6GRXBRbp9Jlcxg9k1a6QhPvjnBOZs5GJoo1p/33Qew
         pzH69gDJLKB8OFSz/vExm5p5n20/SLLor1VtLv8+Vq6JytE4AWchTadWO2ZyFwIxf7QU
         QZVd5W/SQ5Fmbut2jhM88EaZYIONygr4jGqph2OdC40okv4aPvwzmUIzYO8Xb3qEsz7j
         Ob5ZOep6S8R4VsQJUgt9c1cIpHY2BeyXAFPXHLDBXC/eKTZHtIUpQcRUv5Y3td6BU/GL
         cwSKOr/mk/dTuM/NViYZ6h2TzAGPbapsjZcJXeLDq1bHbakygV2qsyff2eKg1tpYqQzJ
         yQTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LfKCa+bk3KcSDT9JRkjfZV5/HgewRUsxlSUh4QKWEsOGKB/Q1G0SqB8yJfKrz44Ur1qOhS3xpoLLv7CeO@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZYKjtCveZL1HaxfbLrw37MMtdah9N3vhrNaBVKtwluZIpWSG
	BW6E4WjzvOZRFrkoQmqtQsLbvHse1QdZX/u4Ahq+FD/aw7AoVOmHp8GxF6NGwvgfU/WYhoSVa/p
	tFKXu3iLNypsEvYBKg7lbXZaN2VJKrlWSxC+J1fifMragUjwnXZQsFoMP+376mlLQpdma
X-Gm-Gg: AeBDiesaDMj4yOB6+tMhD4e9kE+FSJ7LMwSpCxkZFNGxixh20omQ06M2P2DO3gHT5cv
	lVsx1k30vU4lOU4p9S5m0crDromt0dshcRyC3hy/fvcemk6BGVm5bXV3h1na1RMLp415FcTOVtm
	34a0o5UNYLu381U4GlXsijVrS8ZjvNrwUW54j/KmeI8kmTgo/AGdryiqsZto2LWL/MQTmURaO6d
	fQ3M68gf630Qmkaa0PGLgLAXvAX6O0HJPQbOH8M17ooYqYRRrx3XIv9k1+teV7NQ+05QOnBN9yu
	cDtp4qKZ9AdVW+fWRHFqewiD9BHcMywPm1U4LDlEWv70v6UPzyphQJaFWcEgvOQC9BCrKgfu9lY
	ahB7iPAZTejpr+Ma80wEPxTfDzZMO3msYsEeQkb+5UWIMorEbc7VLcSnVZFaPmQy6fGRJEaUXsp
	Cm6gWKc5iY0qnZche1Gv0QnYGAHeYtS0cjw7XgTqAgrJmsfw==
X-Received: by 2002:a05:6102:3e26:b0:608:2acf:cd19 with SMTP id ada2fe7eead31-616f70eb1c9mr10725121137.22.1776873362453;
        Wed, 22 Apr 2026 08:56:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3e26:b0:608:2acf:cd19 with SMTP id ada2fe7eead31-616f70eb1c9mr10725079137.22.1776873361954;
        Wed, 22 Apr 2026 08:56:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a418376d0asm4558989e87.0.2026.04.22.08.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:56:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <4axoaocjfkok3aktflnzb6tscv654j2b7uc2twvnnaf25i6drc@gomr5g5bcacp>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
 <20260406110113.1709886-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406110113.1709886-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OfaNaKF3A-ODWJ0hCwdlnEqi7mj0cg_q
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8ef93 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=B4TDdkv_pgXWvdOZbIgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NSBTYWx0ZWRfXxaLSd0Bx0ZzZ
 doYrrD82lW3DLxelDCttP7Ddlz6sdicsyFbUij4U1Oc0TLXXgoErtaU0GwKT7FTEI1/f0I1c/zk
 2wDNh8PAGUwmDS6ZAn5hbAsIDnGbjf9WSX9RNrG4vVvvYMTFWZM98Sl+rqNnYxLcRNpUByYyEHr
 HqJiwqH1eFwQdI7dzzJDuAPK1BLC4OaBCxfk65yKhL3MCjTRbzyf6h6Rqhoseomf86FKHQanjvj
 E3QK7KitSpbuy1NP94DTEJKi8HA95tOtaP/kVyx1HXkw9oWKKyQy1Nk5mdp+YVEsAKvqK3JJbVD
 U3ofPsuW1DaJnoYRinK7bh9DOLgMV9A/+7PubL2u017lur/m6PpTwL3bYdiVUmifhFw6m9DKjTw
 sQpgfYc5irNiM2/aB2HB/6i13boVdccyGbRq2pUWXJ65xPFYCgQupGOSRnHp2pB71/7GgonN8+v
 XdSEkU/xMY96k4A21Dg==
X-Proofpoint-GUID: OfaNaKF3A-ODWJ0hCwdlnEqi7mj0cg_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104151-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 923024482B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 04:31:13PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Secondary USB Controller
>           ↓
> GL3590 USB Hub (4 ports)
>     |
>     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
>     |
>     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
>     |
>     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
>     |
>     |-- Port 4 → M.2 E‑Key Slot
>                          (Default: BT via UART;
>                           USB only if NFA765 module is installed)
> 
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-C connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 168 ++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

