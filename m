Return-Path: <linux-arm-msm+bounces-66980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA8B14BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAD541672F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79042857E2;
	Tue, 29 Jul 2025 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCcljsQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2966618C928
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783550; cv=none; b=eqTV19b95V7P/lJFy9dhqq1yD4SiuDCtKo/qpitS9Gw9kpRRp/kJgeqzw5Gl/uJVM7hFysxZL3DmhXIj3M+kTGwmLpknudV6cCqbdid3jNVCTLomp+csuvEst2TAqFOO4ZZ/gW6h3Yed9AfwLeHXlmORHiEpVkstcpfIZ/+cW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783550; c=relaxed/simple;
	bh=SHTEpp3GbW5H/33H1WzW3afLaf6u98VhBfR8Aaf/al0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CcfQPJbodWE1F51FUXRUMt6UerOEqLeNpuu4D4rOaQnSM4i7QmtH6asy8M/thVg6UNTRNSb5Zu7gTyhlQKmjcB5x0Zt7Sv9BSbEMAA3cgimzqOOvsKgKHlSAvoSMy3cjhc6zgkFeWVxeNAPMEdnyjOUj7Z2jwaWfHdUkAX9Ou2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCcljsQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8RI2l031288
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H6/4gB0PQHXp3E9D6c+ROkMP3PajhH/MxVH0eBWIk6M=; b=CCcljsQhtm+R3X6x
	mM8eHwBRYJUEu46R83ZDqvV+OwyCZyBlJgZDolkXicsmy+bwEzfy8Mo9AV4gjyXw
	5St+xDUiFvv8TT8MHKbyVYgE321IK+h8AlGj7sxheJtz8/HO4Gcq6pWJdaj3iWJd
	oa3VMJdYyJolEx9hArdgRuLGmGdO9PE2AS54YucWSlx4LVr2vPQkVjUUqoBVyU0T
	oWyGOS2zkZHpapGR+HN4lL2yusJ04/wiww1ZR/QPog0hZqgzHxLq2H6uZAtg32Rl
	U7X2TStJUHRgMLe/v51+SZc28UjSkWWaBKhBN3+xAooHcSYDUkmhCQU3MMLqOow3
	+NcWyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xd2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:05:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e34e28a640so33769685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783546; x=1754388346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6/4gB0PQHXp3E9D6c+ROkMP3PajhH/MxVH0eBWIk6M=;
        b=ofjCcI5ASBfWzf+4rzsHXdUHCy7Ykw/axqSGObx5DQsEhFQObFV+l2XtQLTJVkEWIj
         BrxPKdWGb4QlI+m5dEvz0UlgbF5d9tst6PMutqzLDJqEOSmax5hY/ZC4cIE+z1vPpwzz
         OJ8W0YxN1z82svZky94/a8oLx6jhSZ9yXJkQLfMsFAtpd6UyOiHXuRcc0/cbEbhRYghQ
         t299tyfFO5MyCJAG1oy9g3hBHGh3zHFRxFAar5vE7GDuK51xkcZ/+KS8bPJszQFn/0C9
         Z0mvxgRkUor5Lc2rHhL7LvFnfXU9veyg73BM5kw2FmEHQwV6d3SFEHfdlG4CFi+n97DK
         dZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKILt64Kov6rdJhCdcbAbCU1545dtSZmWyzxGUmgFGujbc+X/wWdW3r4HY16btp8jgimxgcJuNrepvgu0i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2zDjVx/QkU3KheYgEVc/svTTD+S0Edu7RNxFGZGHEIaUJB3p
	Fe84VFyyhCI97hkbDXv03q8xjwCwJbRdP9I0laReIkUBqaDvRYrQh/hvisQDnTvOohY+N4rQ/gG
	5AQT26KtvwEFo6vwpBrSyYdsVNYtKryEm8GBcBPjrcjc4jiCqxeEImAaW2XhiA9UtqgBz
X-Gm-Gg: ASbGnctx3gEdgQOo7CFwck0OsngliI59K+UGsRjwXm/lDJ7ZaadeK4JIu1Fy/ef1g6W
	1lJIvUwee+BosQ/+o0z1qfo1Dwpdf8kQGeDgt6E1hCPGDake8q0TBImYJ4jJKVs5Z4NnPuAkTiV
	VP+XLFPcnVKOP04dtGy+B9RRwcfrQVcEKukaYmJuO+Ttev8Wn1pU7HS+g+gbn4+BPFJJzrD+bNl
	kc0vrwXjK5w8YYMYgWzPn0H7hjh2szdzK1QPRrMVslX1tbxwD8wx2qlIDLoaXH45nabb5jt1C9I
	cZlnm7jPr3ABJhgDzb5TpRgdOc74Ykte289XhApk7tnGl2c/fSgyl/2xQxeT8/X8PFQmCEHW3Pr
	WmspeKxDelFu9MHyiaA==
X-Received: by 2002:a05:620a:472b:b0:7e3:30a8:4c90 with SMTP id af79cd13be357-7e63bf6cd35mr779060285a.3.1753783546532;
        Tue, 29 Jul 2025 03:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGuwTBBhjZj+4ShS9oIceW3dlnFR3ST5BxB15eroVIhSQX/LLYlS6jM8I47EkjVzn5NEPIOQ==
X-Received: by 2002:a05:620a:472b:b0:7e3:30a8:4c90 with SMTP id af79cd13be357-7e63bf6cd35mr779057885a.3.1753783546012;
        Tue, 29 Jul 2025 03:05:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa4e88sm561174266b.106.2025.07.29.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:05:45 -0700 (PDT)
Message-ID: <ea81638c-c9eb-4a3b-9a74-a590729e1f8a@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 12:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [newbie] [patch?] for mhi to get Quectel RM520N-GLAP (WWAN Modem)
 running
To: Michael Fritscher <michael@fritscher.net>, mani@kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NyBTYWx0ZWRfX9gvWTIlQnx1w
 GL4csle+k0qGGjaSiZNTSq/v4xwl6PMRj1sbkkqCPWp8Q7v2EvJ6Znkbb76EOwe9dKiNgE1oRdw
 cMhpcbT0cx9bB02ActgoJgFg0nDKSeAKeIZeaZll1CKmpfjIFXYSTO5QridxmuF1kEgWcUQ+sUp
 yVHCxpWltfoYlpdqmA1ZpoMk/aNlnRZQclgEeEw/n82GXg9YwqklhYKZjQQJ+VRVM97VIbibMV5
 ZqvgOK1yweQshGtnCq0P271zgxKhYM+yvQh5kXm6YDXkJyIF3+HZAxcwDhK3HBQfrPZLIaY+qZz
 m0XyUJbrw1bbzirpHe6U9Gi+ygtI/AXXNMj3cLYejSitqhJ76VhVEwNBUIxolqZKAU0dKwsQy+r
 GvFGibRrhINjshbmjNt7A6XKxbH3NBPBFr2WaHxBgbUe5KBGrL5EgzJxlnBblV9mCpKu4j5k
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=68889cfc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7JHxg_qRAAAA:8 a=SiqW3_QkAAAA:8
 a=VwQbUJbxAAAA:8 a=bEQMOJCF4vkCq3EJMD4A:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=8Tj3VdMd3OmKtKXJkbp4:22
 a=0-oVHmElw7bdUHZZ8WX8:22
X-Proofpoint-ORIG-GUID: nlhXn8pPvHmOBAjrx2LR31SEvE0u55JS
X-Proofpoint-GUID: nlhXn8pPvHmOBAjrx2LR31SEvE0u55JS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=961 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290077

On 7/29/25 11:27 AM, Michael Fritscher wrote:
> Good day,
> 
> my first email here, so a tiny introduction of myself: I'm a computer scientist and work e.g. with OpenWRT and microcontrollers. I know some basic workflows with git as well.
> 
> So, while getting the Quectel RM520N-GLAP (the GLAA is running ootb) I stumbled over problems. Luckily, there exists a tiny patch ( https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15 ), which only adds a PCI Vendor/Product ID variant for this card to the mhi driver. It applies cleanly against git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git . I've tested it with current OpenWRT and can confirm that it works.
> 
> The big question is: How to get this patch into mainline? ;-) Should I simply send it to this list, following https://kernelnewbies.org/FirstKernelPatch ? It is also ok for me if somebody else steps in.

Hi, you'll likely want to use the b4 tool [1] which simplifies a lot
of the boilerplate in the process.

The general idea is to:

- check out Mani's -next branch (since you're targeting it specifically)
- create a new branch based on it
- add your commit (title and describe your changes similarly to other
  commits in that directory)
- make sure you sign-off on the commit
- compile- and boot-test it, confirming everything's in order
- send it off for review
- respond to review comments should you get any (which is usually the
  case) - there's a big doc describing the process in quite some detail

[1] https://b4.docs.kernel.org/en/latest/
[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Konrad

