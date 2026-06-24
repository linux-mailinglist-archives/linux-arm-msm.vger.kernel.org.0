Return-Path: <linux-arm-msm+bounces-114338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTDQAqfJO2qTdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C706BE03B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9UWfaQt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fmLH2P4t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114338-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114338-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC1083033D24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EEA30DEB8;
	Wed, 24 Jun 2026 12:10:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B50347532
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303036; cv=none; b=KiEW+l03+xyV3GZcjoG84dZ1KqLBrXrJqwD9UVgrBIDHs8FhujtHHusbAFtGMcFvAgrXsbj9PldiSk8EnF9G3QMr7v7cPClr4YXm+K/AC7LzITTVYO5R0EWBSjq7gB6RJHqeu17SWnz4rCnS0lEe6byZj/+qS6Xb76FgkkZoygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303036; c=relaxed/simple;
	bh=n9GH3JGrjjpag4qBC8sKecKKNO6oBKW3R7zNxpSrvPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gktoUimR210deQVkJB2cjCLuqw1GYgmtBOZM69zAZALm+g3rtzOCCLRO50Ld8Oj2fMWJuWI5gKHIyAV5Q87zy2uX7pOckCB3Pb19TBhm+i46AmE711DdRFpHa6/7v74nq/A8Wa3j/u0x+HNwgs7pmBWNU3qMUBqKVClTb0gB2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9UWfaQt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmLH2P4t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANSf33069753
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfbD7q2L1GT/3biLgsy0N9Xrr0lBiD9+yf39VEcsAhE=; b=a9UWfaQtRAZMIIJS
	RON1CxmLT1Dl3Y6WVDlTfrthk9bx9OiDIlCVWWrP7eE0OxHPeKMqIZIkysqyZRlO
	jW47b+OYNZ66JZ8YX9u3vNlpFDTlTGdvatDVek3vqIgIFlceWvmbQC1sKoa8SL3d
	kc2ILgcbRULxDrRKFShMFTXb764LkMrYQiF2BQpEKBaQLCbkfEe/taYukPpZJC9g
	IOD7oFO7KP9t+x611PAQ9DE+5R29HjwEmJ+kdg5B2mKIqZQgfF7dU01vk0QtOTfs
	tI1lBsX4UxC3Pzodz2aMaSJzvYvpurqJPUuqRRbqRE0w12YV0//GRzwzbZ51QMpb
	lo7EGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0erv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so2785901cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782303032; x=1782907832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfbD7q2L1GT/3biLgsy0N9Xrr0lBiD9+yf39VEcsAhE=;
        b=fmLH2P4tvetp1s+3SPh3iDuKBnJ0CIezcHJDPefYSL5JVGF979hcDaMksbaIN4xptm
         BQcp62wfLjT+vvobLieuizIgmhHabkUH5P6EIbSXmSQ7Z+0wdWSHdR6Ky/8MIcdCnVY0
         Qald6S95++aMgJiUlwMVj7JICSTUSn3mIJt6kThYViJQ9XvNyiY1d3zDCLHcwb1pFIMo
         lMjt/L7OzloPorm0ntp/Mj2p4D8lrJSn/ThrwdBKJtPjkrQuDkh7ThIWJHuYHL+5es1q
         ARi+7kRyBpF3WUBdi5yumLseSs5TINTgxgQ/+ebz5hLNPPZqEPL2nQecjc80TUcOJGwa
         APtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303032; x=1782907832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfbD7q2L1GT/3biLgsy0N9Xrr0lBiD9+yf39VEcsAhE=;
        b=TbdTQv/8Xx+q7WNKhvuk6jCESFKn1axgSrXmxKUkMW+ZxLbvT4EH0rSO3XqMWCRPHq
         tQMJOKtfmHqxC5awLRXKPM/zZSCdvcujRMYgi0Qnje682a2RFOOjYIIoNUkATUiDrf1+
         dvaE3jOmFo1zDK+nqav9zdrUuV2EJYpoEK0IQ0BYf4/gErkHIbzziD/MxaTDr6r/wUsU
         nQomjWzn4qA1lyjgUzr3ZCuay6Yz9ilI1olcvomY8BQibdY/kFqPOQ5kbbP21AriYy+j
         CS8pZKnrcRqmjZ/FLBt8YZOOyoKM8j8frbV/GszElls3HXGOjqESyzfRTj+B1CGzishp
         TEAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/slrxmTPLF1/yP4krFtdxA7iG99b9Dfu4anc/VHbSGT7abWMSOQChExMUQyTsKAdcd1SbbsxR+2iO34bxX@vger.kernel.org
X-Gm-Message-State: AOJu0YxHw+MFO/ctIee5CzVn27l/HtNhHuXM/0Mu/kT97/KQPY0U8l2N
	u7C9gLb5hKs+yb+FbA/g20XUX2GxEbcJfhf+rkz9yO8tUBEMEEJlnCdIww4jUU+BCVb98VhMJvA
	36PkJOIathgAi4lHF367zHlpXNEWXwi0UpwYjSS/Vx3+gq0yNs4FPF4iaam+YVAnSFrdk
X-Gm-Gg: AfdE7ckTt31ZHT6calRJesPnscumWpta3Q2N2YbTpnMgfDeBEB4Yube/8xox/aNwpqm
	YDcIQWbb9djZ8XuXwhI7UHUKwUr+g41rnjwtEQOm24vCkFt/cn4n5c5746Dtsi7Vr/qaR1pKuF/
	z1gfyrwOC2RCJfZKgd3Ivdb7x46K863Nq9VoQzRmwTVKqMaeZ2zyjfjSTJ5Txa2wlXO16X7ffa2
	j0pBf458z4at2p209IeDno7v/d3+OJrkRJ0JZaAcJs0whqgUf7/VlOM1wRAwPKa2EXoVnIWd9Qb
	8CwuSiICen7+biaLFh+0g73kny2jFY9QncVVhpEkGfmKPQkPcjYAEP/6zeUXVcPt+/THBdV02oz
	hoQh+1auEC+9WGRJUBULxgM6BGItTMPfQVRs=
X-Received: by 2002:ac8:5812:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a4f4db870mr84855851cf.7.1782303032221;
        Wed, 24 Jun 2026 05:10:32 -0700 (PDT)
X-Received: by 2002:ac8:5812:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-51a4f4db870mr84855321cf.7.1782303031590;
        Wed, 24 Jun 2026 05:10:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5b304722sm639573066b.0.2026.06.24.05.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:10:30 -0700 (PDT)
Message-ID: <34408f18-0d1b-4828-a0ce-feb54f536ef2@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
 <20260620173833.17728-1-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620173833.17728-1-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bc938 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HS6WGF8TgoXg7XbOFtoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wwE2Rl6dGMu2sdaqg5DQSuvTXyrGM2Gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX2o5JtRMe9R7m
 kz/WDV9O21qXEeCMZ433Hzrs2U5m7G+DKG1FMe0YG9xyXhkJhXP4TdSvAgKq/RHce7SrrNW2Bzv
 DNwHByMx+p3CNRhV/HJXAN6pG+g2W2gwaX+7j/Jxg/lhCX2F/mI+sLfYTi/3n2fpnVYSmoP0JCt
 C+w3B6yk9dtUJwbNdEwwtv/OZ0H8kJAjVrGKZukWyIMreiA66hXYjdx5UJX2C9DAPNe0LfFNfks
 SuNkpjs4kXT6t2lH98TGtwOjN8bCRiMqrAV6tMfJvWcqlBIWowjH1kTfQ9WuV476eG0hyWyGld+
 L3b3phvO6ZGNLUYfZij4tdLfo0c8N+nt9RbVE9GlRa6axThmDeWtuipZE9kCJLxTqBFZinDoRoK
 PFuAD2WxI1e6gD5H6O1UxvEepnQmAQ==
X-Proofpoint-GUID: wwE2Rl6dGMu2sdaqg5DQSuvTXyrGM2Gl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX9Zy2qhU6jOJ7
 LxKx21sN5qlNOfVvZsgaUeqkn+KijsinBAWHD/R75vtMoO8zD3df0ft0TLS1KHbkN0SRGoLiQq2
 PpNbdpY9HDdUKw1+Sox1b3NigqFjsH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240099
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
	TAGGED_FROM(0.00)[bounces-114338-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53C706BE03B

On 6/20/26 7:38 PM, Konstantin Shabanov wrote:
> On Tue, 16 Jun 2026 14:37:13 +0200 Konrad Dybcio wrote:
>>> +/* MP0 goes to the USB-A port(USB3) and FPC */
>>
>> "MP0" refers to the first USB3+USB2 port on the multiport controller.
>> Is there a hub inbetween? Should we describe it? Do we know if VBUS on
>> the USB-A port is controllable?
> 
> Unfortunately, I couldn't find any documentation for this laptop, and
> all I can tell is that the USB-A port seems to work and the FPC is
> recognized:
> 
> Bus 005 Device 002: ID 10a5:9924 FPC FPC L:2407 FW:3334147

OK, if it works, it works

Konrad

