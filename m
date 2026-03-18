Return-Path: <linux-arm-msm+bounces-98444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMJqHuiOumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:39:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2A2BAF16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C026A300A52C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614423B52E0;
	Wed, 18 Mar 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkH/cHW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJj2wKQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE23BA257
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833949; cv=none; b=EZVOaX+R7hpZsbWxXE2IkPPgkNc4Exc+/QaMqNQ8k0G3sJX3ykKVEivgJYvS3kaGfU8ACeetbHC1Ug9IIhFKCi2BhP9jAqvjeaUmGAQvvFQYOCSP1plQgVEgUSPRlVjzWsv7jwJtXgq4aJE7If1DNnUm7gUc/pbwjMidYQesvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833949; c=relaxed/simple;
	bh=o8MsylkKNqnCY21JiXI64HiJoZceiLCcKPMcJ7kXa2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnnyWHLgnJTzHSwoD/0ZfaKawTkZj3F5AR4slaXPctnkPi5rL6fV2u1owqZf4sO0w8KsSPcKlJWm24HkYgwnMYZKBOYTy4EPVLm3CLWqRP2RDga7ADboNpIFXyKMbD7SyDRwEKJ6+1uBS07raqRsJlplY1FY/IOV0M1ud9xAonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkH/cHW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJj2wKQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi4bj008787
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=; b=kkH/cHW82mDvgPqY
	c36RkLru5x8G1q9Fw80L1zPhKdB6uQkcFteXuZqLHti+NETQ8F6B+X89iqou0tuD
	C/1KOWNDSOxVh4BpQ8wH8IQcyEZ5D6MISLPQvbHGlS3k19H8lA1QX27fueIyQF4l
	b6Bqpg4vh2YT2x0P7kSv0hSmALYFshs+4fwBsfYkrq71UxiQCpLLeD1OCz+9oWEm
	yarPbaOSrDgy8eXeTXIOZ3oKqPYvd3nYlOWnkgm8pMb2OjC1LYnUbi2njxSnNqBw
	7jIu0T23haV474nucLYasvS9azQ8KvPFpOi50Gp2T5O0rtnjCJUTJh1sEIllsGhE
	oONmVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj505sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so740261a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833943; x=1774438743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=;
        b=fJj2wKQkELnbKBmnQXm/BOb2DLzBIZRJXl2EGQIhEVVMvdczOo1cp8DcBBgylrmfkV
         nZNSWY7CPdV255grvJjY6vjr1vFywgm+rKlDOJ+4Mw/C/dqe6HQ6kFu9pXilL0tDHRQv
         hI/vXEzwbwe8ckMiJdOMbmMVVmqDjybEaxnlxBY6xr25Q8p4m63hSGtZyYJIN/CoQUlb
         MLmTCV1JdEE0su3NbmbGupfDcMly11ESN+2aL/YsK0wS1MxU4bZQ3Y91Zpedu2cczqmA
         jma6v8ZriSewVZa/0UIrtqZhFTUwDG4hZb8Cs6EbbjUHzqGszuBLDgNfOtqF3Yw/JMgf
         FAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833943; x=1774438743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=;
        b=WqBgXVuP/tzjpe4m/fFvzFcXnkbAsH8pQFXhCG/UcNzY/TeEyAH6mHdYC7vglk5Hpu
         iU1oH92e75pP1FA6MGdhqfdSlTxnUozEmoM4NESVff9N6TV6b3j0kGTR3vtpl5oEvjPD
         6YA0Vpfbjqo2KrR70ymsnCWaMApRNfokscRiek+j6Jaf7PXCYgQgErs9IzKfKhGGNyQi
         wSYLBXMLMsS2slbLEw6ut+f6bwTAg7uWovAqzNNEyE9728IT8iVLEa77dRTQbNWtgzEb
         xXtKZutHhEv4qSgTdNUeR3/6V1oC+8799+0llMD8rdMFyBQBNIwswao4LK8d9WThmljw
         BrgA==
X-Forwarded-Encrypted: i=1; AJvYcCWOTrBDBSbrv5piuN4Z6roV7ttFjljZxLwy/MboBudr947mGq3+IfHGGOyiOni6md1NXdQ9I99osBq5Mcgz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpVvX+q8KenGmja+HqwfMVnC9CCELvpWwP41MkplwRAvWVMrU
	UCkWYZ6eGzMdKQ7VRR4EzA4PzPcyDk7+L4ypxjJvWK+WoLn1VbEAs/RIuujNg6CppSF28CFn0rk
	6RKm0hfZZBzZgPR0Wp4Fkmw9larbFbonwbmzwvcXbzo5oEUk2brfcmWNDsD8eAyDOr2aO
X-Gm-Gg: ATEYQzzhM0NGVeR+mm4RZ/UeeHtI7RFMS/99wUnE3M/5lRjKjxmQV8vUyevHgp1FzEA
	WnZs4rbkPtYXRQLzF1qqoRFIRrczX9nYv7qgFMGe7FjWtttAzElG1KcGFfSisEcX9/6DDXc4aUV
	tK2ntBWVDMYwGjyUbI6qQVHbRqt2/+GewvV4ApahLyuWjHmUXR9Y7tz4e7rSYtjJdPGVKMmzrXQ
	Ty+uAe5FpRjUGI5PkFWOqRmuuQ/X7OZ/6v22zyxGQ9EXp0alQTZJcioVyRZlk7ViwMey6hhB2dp
	zQR3ut/45dFV3EVK14rCGQbGmkR3oKlc7MrRgoGmiSzxuoSex/iO3X2zDq1h3VSEvGWONrrUtno
	aOoR8DosiboujUpGtURd7/UheCLmu7zi7jsXIo++uE/QKPBBXnfehaQ==
X-Received: by 2002:a17:903:2acd:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2b06e3c3843mr34896065ad.27.1773833943147;
        Wed, 18 Mar 2026 04:39:03 -0700 (PDT)
X-Received: by 2002:a17:903:2acd:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2b06e3c3843mr34895705ad.27.1773833942658;
        Wed, 18 Mar 2026 04:39:02 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e615f88sm25207385ad.65.2026.03.18.04.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:39:02 -0700 (PDT)
Message-ID: <1373ca07-8a94-4f72-95e9-a5d247bcbb3c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:08:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-5-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-5-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfXzmwHvdeiS7yn
 Uan8M5aOFz2F8pnsRHrRlgRC90ETHHmCM24d0Wge9CZ7iNaDe9p5dxXmvTZYx2QXh99FEB+aUWk
 JZwXTeQV4tQJoWtuR+4oU4lsAHIujplv+KxIbgjwneGEGqt60hP1moKx/h+yrF5U9eSLFeSxtTz
 jfiLbJiko2U2NLUJZ3lWi015rk/FFrNepTEOgAR2Pyf6Vmlw+BAq3Xs+z1gwpbTfIVfalEE3oft
 pAmxdUPafUo9mEfJVK36F7PKCcm0PlQbSZq/jKDX6XGLM4U2J3Mf5hEVNu67766qAPfVMN4abPc
 0npcSEmiXpoDJi7iYbEsX55NUOrliQfptN5l85FPdk0iLYFi8bqYHoVJi5uvb4k8GJ6qkW9OSyO
 2TTYkxUXi6KJVNUUi4MqJ8V22mX0iOXqVfb2Ez6po9hBzDPCJ5vev7ztrYMJF2CS8tXX7h/i1lB
 hNJ65p6M7VcXC9PX9XA==
X-Proofpoint-ORIG-GUID: wuOuW8SVtKtzf87XzYpmfU-JnOECWK44
X-Proofpoint-GUID: wuOuW8SVtKtzf87XzYpmfU-JnOECWK44
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba8ed7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dj55yBBYgCuu58Rt9dMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98444-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAE2A2BAF16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


