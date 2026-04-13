Return-Path: <linux-arm-msm+bounces-102891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJGeMwep3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:27:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A13E91A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78C67300576E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF098381B00;
	Mon, 13 Apr 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uo2h/Y8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMoN0zc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F334750E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068867; cv=none; b=GPQqI0oNemz+eIerB1drLNANUIacqbJkAGopmHGmhWTPa+Sing4SknYUOj5P2u+0OBpwntAPBOk6yHSJUJyd17hhbg0rl64g+eX4O3+gRH0KC5HKJ+TeNSmOymAuYZGKC4njBF3GCqyw89gl3wSCDcgfSCFHoh/BekT+hNlvd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068867; c=relaxed/simple;
	bh=RX/e0s0VR19SMuEOuyMYOgroZ3TuAVHof0b/VRTSRRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2Ejn71JX6DP/YS2omCfI/JeOtZUSV0j+SeLZVuD/WknPGYpJZ/QqbVw3hW5yEsrloBVUArxtWkawXQIPCZR1CBy40uBQS/pqC2SN/uGBOd3vn9QEi1ntqr3du6gkRFuriaz2LF97skSn5tYZDIaZWnWf905IEHI2meBEqI6p90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uo2h/Y8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMoN0zc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7BfCE815394
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=; b=Uo2h/Y8HHxXHvRPH
	OM+ChvOedGeWklj4EMg8aXkKBCrHgyC5cC+VRV2FvftmyDIr84/u/P61oV7Vz/v9
	d014iSymiu4qZZDn0S1pkAzxRwb7Rc/cO+8SCrn5QJ+d27GKsUTZrWm35yQpRe/a
	UZ08BDGdBR8dVCwZ8WSgEBELhU9OX//ZDR3Y0zlISFmmDEIQoVHr88o+27YsQkIQ
	MQ1vFMbmIm+qEtHN+kJC5IMUqNpbX508jgaeYoeANqHJFf6nNYS8GTJ6GaajhMoD
	FdTk8HLObI41jwC3UNZiTfHq7PKihoPrcSe5wRdoTKXuCrd4B6R2rrvVmXpXJlWf
	y9iEng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04exk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8e141739794so9629285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068865; x=1776673665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=;
        b=JMoN0zc9GJ4RG1DEeb9S/wS7+yijZ8h+Qe4B31KjQYCCiYn8iRLSDsYi0FU7WXrzmr
         UT4nSeqXH8QIGrvsSB45Q4QPfd+SqsSlOCfEIqqVXQeipaDLoW3wMyAovi6Th979uHdx
         +aq4znH7cOzHcnex/WRrGmrumIplvHrXuRjK/sPsIfe1TI7LGIJ/s2aoeNlNVmArMi65
         V3qF0NoGmAFdNk85s/P2NSfT82j6UceMV6ORQ/gmoeWQfI+gV3So+Bm9bUPhGu3Vs8hv
         a4QEOsargEi3Nsq9sdc9JybJjlrPvbKK05lxMY9KohFxQ3XooDdDLltvGrHfP6DkJXJC
         rpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068865; x=1776673665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWJXLv0fsrJ4VOjwQCZ3mV8mZryqzFZRmH33NOXHaOg=;
        b=n4BkqPfWBCSnqDHk7zdweZuQLyU5ZV3j4LCRm6wtsorHB85kMtJKPFKGYSbahPM9tJ
         2jRgKzGLpF/FLcZ7fx7GrTMd9+MFlGf+K5RqsSkkMD9gP9gpR4r85HNNNKf+Fc8UJa4n
         QAf1z9v4lYE1ibYT/4bE2sSuTLk0lzJ2+ZFwjFeQ+qgHUIEjRmIpn2BFyj8WDQpH9W50
         /pljEbx+hI+PcrZqRHiBcrmzr/YpQeWtP6KLxWZNdlBldSGzv0rAsCVRo6Pzga39niKR
         crI7Z0SL+Uped+Sb/AA+2puwRlpZD/opvsp/hmXe5/0+X+UZMIg3Wu1ITkryXuVUfLkV
         oKJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5f46wKTjNCFb/7nbzyWLb3C6FaANIVI6CEHuamwYbs1y1rvyXmJdWXT4kfMuEe4X1vL7CKY5fC+ma0InR@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwP4fakuQpmUi9jITSXIvDSCNgaN6KPFoAQopDCSXRcgY7SyS
	3LtYA2AfapUTP7x9amFuayig8f7RPWrfeESXkEdPl5GcJzDmlbFJUgyIY4IN+foBW2Qs+0lI8v5
	qR4OC+gM+Bw+wIFOQikZ4vUesPBzJoTVTbo50pfM3k+yob7EYA3EAeVgXTDbjZV/ASPq1
X-Gm-Gg: AeBDieua+pcdXPCD+Ji6wjeq6U3F4CChZi+x2to4uYn+p8ln5tlPw/SsjIPxw6Ya8mQ
	DzE+2OK+JtCBmklJhw0jc/d11Qr9uzI8DJenIcJVzeUAwXmVRDbTWuZ36uFNt4J+v8hSOIly68A
	z6I6O/1x7gSY97rMfBSkH52ieWELHEEayzsRnnCmifFWUVvuQjQ4dSCbHcO4kFCssdh5NKmGiYD
	6AqFcnJPcopal1eX84QImJqNAw+y9Qb5GvlZmwubFIVV2H0R/DhUHof3LnucBfdTfKPQGU/zp0s
	3QR98mYunl7S7G7gEqJOTfrFCPIEOplDROe+fcd4f88iO2Z+FcWR6x2ZrOs1us8Vv7EXU7g6RLw
	c5dh1b9qYJASe4/CztDJ9xlmM40I1NwtgtCbuTqbswIrthBeFxJYme+5c+CC67ZAUhMt3rs3U8o
	7x3dU=
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1200932785a.4.1776068865022;
        Mon, 13 Apr 2026 01:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1200930185a.4.1776068864567;
        Mon, 13 Apr 2026 01:27:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a15577f9sm198124a12.17.2026.04.13.01.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:27:43 -0700 (PDT)
Message-ID: <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX1lwmLwAZaheG
 TtgQ75x6pH5Fbu5BqJHbd831lb50Vcp6aqupYoSLr0ONpBhQ1X55aeP8xi7Wfavly9gQuqa/+RJ
 ZprBJixShHr/COSxTpN9rcRRrBTcc1aMNOS5khSUk3abwjMo5DNzu1A1fbwDDBvkDUyJcoCUgqc
 06yVPlQTh8jkjyccgV2L2elFZEZISmPSVMduahVXFC/onHgo9VqIDq/EVceWJhpmIGeG0sK0Rlp
 9LUqpdHLGxwMmzFsxVNM2SoFAKxCxBP8EKUOBiT8C+dizhjiOi1BQaktEwWB5vyj1R5k/IGiAu9
 4n9gdZfqwRALdd98Y1J6LIb518RHVFwX7COGMfEr1W9XAXUBU4cZG5XWSwz9zNQimU1QgCAKGd6
 YvoZq9opLLGPIcpLb3u7KmWWqGJtILtsr+Oc6Q31QoQzB6A4fDlGvYc/xn9pc9uPac3Men212gg
 2wwIpWXZxNN9tjljYnA==
X-Proofpoint-GUID: IsIrJHHVuUENuGDVIHcoA1X7qe2ArhM5
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dca901 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=DAk3-xv8P52wg0kA9P4A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: IsIrJHHVuUENuGDVIHcoA1X7qe2ArhM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102891-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 314A13E91A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> (Driver) regions, each 0x10000 bytes in size, where each region serves a
> specific client in the system . Linux only needs access to the APSS DRV
> region.

[...]

>   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
>   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
>   arm64: dts: qcom: milos: Drop unused second PDC reg entry
>   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
>   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
>   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
>   arm64: dts: qcom: talos: Drop unused second PDC reg entry

I believe that was intended for this feature:

https://lore.kernel.org/linux-arm-msm/1568411962-1022-8-git-send-email-ilina@codeaurora.org/

Is that something that ever turned out useful?

Konrad

