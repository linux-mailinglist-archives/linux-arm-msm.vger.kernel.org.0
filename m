Return-Path: <linux-arm-msm+bounces-100298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CbqGkx9xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:51:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E727D344926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E0DD30F5776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1DF3AEF23;
	Fri, 27 Mar 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFoDBMjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdXjaLIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503913A7593
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615628; cv=none; b=SEjLMR0DvdFA5ohqlnm8+0I/IVb8V+sk+mx++FwSplMv0OvBSryjvwlVd5LuycfKg9k0SsG+8t1XsQTIjdcEOx8qqx6hTE504YD5oh1VInGA5aNzn4u3Nkwyn0HpV/fnzEnFhScvJw9/gtXoFlONyvcZy29p3/MsA51GX5VCRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615628; c=relaxed/simple;
	bh=Ff3Wmv6XXMb16+Xtd/2/paFt/lcgzURA1BAnQOWiwbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXhfFmOxYsVfAWZiqT99XDSTmT8ip4TlDSkc49o8VSLE0VryHCTLnYOCs2CNn9DEMqoedXMTBCZF7G8NKpvEuTqBsbrj6IHPihD8iZlxzMy4NEs1n7aC8V839cOJ3rFoylQJABPzox5mGyS0cqU9tICaeXv9iuwGh7AB8nDRtuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFoDBMjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdXjaLIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCEgE5731349
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=; b=eFoDBMjvr8fXhR0t
	MbUQL6GYONS+yRqDmTg53Ju9H4iE74APOZod2l2BQoWGMvYi+4eCeNUwxPITpPru
	8biUBw9RBem11D/0JOxMRFaDgk8/OL/8rYp0V/cWjtLaxJv+BJPee450YQzrKGWA
	x2RB4OuRES+ZW5qEp66RSCCbljP9gXKmpyCxPM0+uMrEit/VDu691PStPblpynR6
	ltwRbz9Z/05nZJnMhrhrgciV493wTMhjt27gwpmeVYzGBK9jng0OsOGxUBP/PGt9
	bqpZg9WuDR/CjAoMjiis6mMHhsYnn7c/MI0/amvnNUirWfDz2MczfyDAGoMXx0t1
	Z1MzAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3cjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b069bfa817so26383905ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615626; x=1775220426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=;
        b=gdXjaLIoUbRCtjuE7apYd6sNdELZj+VtcHU4UIW3Po7E+PYL+m/Bq7Db8IK3IAgQKV
         XCZ8ljfq512cFJAbRusKtedZWO0gXSCdwiEsyLSQ7VRmJ3CkrXShs1xuUVgiSxvR8brS
         1jm2V2yhOrJAfKQgKrcnAJ6Vs7JR+lM1wCuC7iTSfuOUntSMdj76OWVL1NbP1UFLJ0iF
         6ksbh7Odsm4dxNup1p18+BiPBKzKfWOBQEu+OtR8czh5EiD8x+8PE8+Gu70lx2T1kKvH
         3E7jF4C9itBtOiEu7504vEUNhzc7vznN6m+bCkurRQkNjjZCMfRYXi3wPwlccIC8V00t
         6YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615626; x=1775220426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=;
        b=bS70+i8G3+RHQRjtCF0CodGJQKjf1l1u/clZpD8q/XJUqrrTIua0NCC20/RzCyZ7/2
         5mFjJiu7HAQVuMhG6EhDw12D7h9wd3QHp3BKFdte8L0kP31tqEtUd/cvnJmUzO0havI3
         NvAA0Llb4SJpbYlvUZ9RyKfIU1OPXWMxRxeDfXAxWBfvsQi/ZnN25GFbdKnF61p6dvAX
         ECNjEYe26VUpDZRllJVYzoPSBfo8zSK7JEIm1f/nZqr0zGk2AtUlU3ZGH7y0Peqt/nSd
         RzzPQzJ7aYcPvhA0+uU6JzqDoBzd7qWxnnOXtX7sZkBoXzj93fJna3QuaxbZ+/H1kpfA
         8NKg==
X-Gm-Message-State: AOJu0YwSyfeThPVBvGf531MDcbRgbdjMBFjSiWqSZYrF6CqWpjvWgmfd
	YWnluIjibwvFLF4OH21i3cAHgHVZ6oTjWSWroPvUDvWQPdarbEmZYMwUCoTsendYeP1Q2r8jNFP
	yJw+iPcCUE3F0ovvMcmvrtRcyvDlSm1hfrukBYfjNZlGhIwWSza+XEQV53TTvf2rsQhjT
X-Gm-Gg: ATEYQzzLYv4Aa1BZPBqyn/YvUWmiSsdkmrkda9deuqfV7QtAl+3pX2ThasPTEc7wMJh
	1ZjZXFLq8afoNT0c8Li5/oxIPVzoJ6pfG3mj5Bf3amK4dqtcT6+ykf5ycTXKEPAZ5WJw86f86va
	5sBq8ujiMhyFAZQ+R9lF9P1dqr3Z/mto9KPYgtJe5/5JtAY5xPhqtwvgn7k1ePKl5ZxEQGDw+0v
	k1ieHU2dent5ags4C/5JrRYf8y/3RCfBfAeeRz7YOFmY1JiYkHtkpS1PxWkgAOyf9Fe8AU30Op5
	6JiABQlieHbcAEiZ1h95t2XVtc86KnQfjGmTFmkH2Fu1lYotMBbF9hOWWE8AQR5ysMkQDkUTBCj
	zGp1PeOhDqQAexNKr9szv2VuBqdbptG7c8Fh0w3ily46JXW9grhPC8bWIX3Q0Rnx/xy7C9CcOkV
	RJbMU27XX4rANnGLjcnxZbNFwM0AQldXAqGbVR665KAi3GQ+8=
X-Received: by 2002:a17:903:3508:b0:2b0:669d:3a68 with SMTP id d9443c01a7336-2b0cdcb5c2bmr29017325ad.19.1774615626048;
        Fri, 27 Mar 2026 05:47:06 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2b0:669d:3a68 with SMTP id d9443c01a7336-2b0cdcb5c2bmr29017035ad.19.1774615625579;
        Fri, 27 Mar 2026 05:47:05 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc883c0asm63833515ad.45.2026.03.27.05.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:47:05 -0700 (PDT)
Message-ID: <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:16:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n3RxALGzaI954vvqfzqHWz2nYB1wiuL1
X-Proofpoint-ORIG-GUID: n3RxALGzaI954vvqfzqHWz2nYB1wiuL1
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67c4a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=5Hq0NmiOkHtrQQVgowUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfXxfdevpCJ5Vyq
 h1OhV560Tlbf/ug4m+mOV6RT0ePk8ZJX9T86gbyHgx6gY5L9UfT7pJ57RjfZsen3FsG1bPnxVwa
 xczk0ZaDSRr6XyoU4uKsXm04LEOrEBI43Rfii7DqDGyDyzfDaJfF/riH7HY/vlh3vQVasfrC/ff
 9T+SfI9pKHhwQ58hMA+hFB1oqKamUd462I/TYqEkGW8QsziPOCqGTvrBa0B7wxKJUgot6koCy/5
 aDBP5moAlPtcEwDEQ6RzADrsE4bw62RHat0QSDJy9p0hck0/eKCdlbp/zdvrbYLiWqY0rx1criw
 6SnYnqZMdkyrUEd9iwFepQ4ZClJWC6eQ4AVcY+b2rRYGigye3jW6cmrP0dJpNXhbTZkQ06yQS9h
 awVboKg+uzig6CF9Dw3eVilhdMENd4d2Rkc4WE+d3ClrYFrgw6mYI3SsAkZOFvStDVjBMWf7lHU
 eDm4tG5/4nDtq6Ffp4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100298-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E727D344926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
> 
> Same questions as for earlier tries (why this has to be repeated?), e.g.
> x1-crd: Please describe here what is the actual common hardware. In
> terms of physical hardware, not what you want to share.
>

Hi krzysztof,

Thanks for the review,

Will update the commit message in the next re-spin.

Best regards,
Gopikrishna Garmidi

