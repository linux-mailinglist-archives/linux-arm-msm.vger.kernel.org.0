Return-Path: <linux-arm-msm+bounces-114253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WisGBnu3Omo5EwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:42:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955C6B8CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:42:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ABitfkkZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gpYELLWO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114253-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114253-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7438A3009B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13119318EC5;
	Tue, 23 Jun 2026 16:41:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD32313545
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232910; cv=none; b=HR3zzhqUnSaNYIvTxmiXeZDirhBviS3nFRjxnUoC8F4e51+qnPjQUkt5JKZNtlDYZ7JaI4A9QFGEeUgyg9kDRodSjMaDzCJFDX+9ZSRB3NFuV5h6Ro6NvK8++0xVqf01TAN2MK4wNKRnpeupQhUk1P/0Aa297GXXyYsSAX7JHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232910; c=relaxed/simple;
	bh=pbaXcc7KcC3MfBWTnd+mtc92az3cZ/ItzDNlzYanHDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMyC9g3O2EQuYXcVdYqlMM06Bwn/fOSPf5B1VvlKkQiEFonuZ7wbZOUuJARAVqEY477lUWKaZPumeVf3+c3Bd3vu8r1JsMkhvelCxtxwsI4KCzSmvrIgiv1a4o3yXvByFpqE494ZazxRO7/iiQkFtBLXvvUUzNncOaNX7bOlvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABitfkkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpYELLWO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXari3752856
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=; b=ABitfkkZzRaL271H
	GuBYdjpHGP+N4tSr4kA1TET3ahrGfC8pLGfCYYKxtrd7og3WU36WSTPXZEtb+r++
	Gow7Osgf3rCVFrUhHZ/OS1FMSeulDiBzhmNMgzK0gpma3gGYuy0NWwUyZ4AM1W0N
	3JBElH0sw0/xQZaEcCJil10rNlfHyfJkm7JRNGqlnhlonoQJlucnqliBNjrEzTWg
	mnxkVS6vkIooCBEBizAZU4miw8ekbEJ7F9UiQlJdXaPdrgLODlZJFOtAXosTsO7g
	cJnnJYLc+v6SlSuvL4kP2vPcswGk5pdxHLh+o5XaQWrUl3UH6TLD0HtkQuvXLEHA
	lzuh0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29j9sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:41:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a15cef334so6795781cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232907; x=1782837707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=;
        b=gpYELLWOvdawyjhBSDblyil1yOKfR+HLYryMu1Zjf9kRQBZ9VPf9jLrrSuZ4IIsyIe
         7wkYHafKXjOC/wbdoqFHmGtQp8WgP0ROqGVLF77Egdy5nGMC/aDtCS5lT61+6YmUmgt9
         7MlNgh16bxXIBjvWsZPp3ddXy0AkM8TKgGTZ8v+gbyidx/WzprzXQTfPc2euCIVn7sKu
         EjBvxYW6OY+4i2C5AtnRvlsShAPjxoHKlipNuScAmtDJJKBWvh4IwD0iYzpRR3t6UXRF
         1Tz2HSu8Vc/YVCTrjYO9wadB0l/Nt3g6tHZ0EbiwawZ8NpYdUdU8Ka5/0unskKPQcffO
         pkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232907; x=1782837707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=;
        b=FvKAaUQ2dKg+sYyn5jcl5D+EpIeEbaUdm6JpUsYv6vZhDAXi4+UMuMLvJr7vCyaKaV
         bmwx5GkEpYnSd6pKU8z7mQpzQ7C1B2uFEQXh8n5inks/x9ZNlv7gk7YDun0MQX0+H/YS
         5dnwRQ+GaQ1xvEi2N6SnAMwmj7zN+N4QU9i5b4BAQlwatX+kOhYlHHAVZHh7Ljoqj3Ei
         TRoAxQcWJpFXrslZwbji8uvqrWeNzD3BX2ibgZOdSchcJMkpv0MWvUlGeR+4ed7ffdMf
         GrKY7vYTuAdZTeht2siDGb3ebxtXRectaOSBsZR2/RaIGjuaglTyPxL5svVLgxX4pd3w
         k34Q==
X-Forwarded-Encrypted: i=1; AFNElJ9965dnJstJVE/u0FZNYR1OkTbDCefsumnsX4l8ZPgWtO1yuqU9S2Sw8xe83Wr5ZhRX2YOerWRTWe6lQzZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvxh+vwpKhVFFdu+Z/lL2v9GCdFRHqQg7+jGaaHuyXTGFIn0H8
	fWEUJr5nz7Ub6e0/k1OSsfJd7VJCqSryVPADxZQjrD/SC/laSvdL8sFakdErrhtzEsKNtSlq09Z
	SkujiVnab9VHmAJNDVSWdFQB6xoEsUjwEruhCC8NOnHLQ4lIklPFEm7tK7bfpGKFrFiqq
X-Gm-Gg: AfdE7ckRQwQ5fCpk2g4QBBdZPFnkpAE1U5N5Gx8EhjkspBAOCxIUDPrINf2u4FIAoz+
	kogrpZjYEg+i5U0RL+s9Hy8FelPp7sax9zkq9anUIl2N9oRIDynd3JSGq5218Yc/1OBjxInAw0Y
	M4UpjxC3yygSnytv0uxW/pjLVtX/W1AJZhG6XTNJ1j3TqYrowP1YyDGBbglmFFzRccyhC+eKawu
	XfAgLmJbKw8Gf+XJpilccDBkndpN27r8pG0NxfJecg4KQMnlPjZUHwLt/LV/AyrHG33iNH19vd7
	APQfhkuMC134scWLvzEpbFyXYj8QMJQDT4OqnbJPHf5KqUQ4jfRIbc7JWxlWf3VqI5M1OUVl2ec
	UAnvUd9YcjD2E/KOMu4Cd8QSqTgdzmM58wdo=
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr58803761cf.1.1782232907166;
        Tue, 23 Jun 2026 09:41:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr58800311cf.1.1782232901978;
        Tue, 23 Jun 2026 09:41:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697dba9c118sm1295449a12.5.2026.06.23.09.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:41:41 -0700 (PDT)
Message-ID: <969f78f6-dc10-45d6-8cdc-f4f65fee68aa@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] iommu/qcom: Document why sec_ptbl allocated flag
 needs no locking
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3ab74c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p1Q4quDVZRqoN1qXw5YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XfddiHIN6Ewcw3JA5aCe11gLIsV3G-11
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfXyEtSRntAhiMe
 BCuUeo7PxU1rWY4Y4HCfNpN8R6/Rb+Eu8lpwXvpH83HHw+Wc5vQjiOb4EkoQHJEAvhXhCYcaMqi
 YTXbd4zn0zNa8NRNDk4Q8Of5XxUWZ/U=
X-Proofpoint-ORIG-GUID: XfddiHIN6Ewcw3JA5aCe11gLIsV3G-11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX+cTumgFSC0/1
 9iL2gIt1t3egv4Sn3dlviCWZQlR2qgMqG9nMom/oIuZP3jkYY28BjKwIOglHqqQv7CzFHUCIhHj
 XpppKUF9FR7WqxmyU5JdO3HbnYOVRJ6LtQA7ti+N0eEJy9em5lkuq73bvIZ4xLxmZPralYzcQV/
 2x12VMuN5NQgeYl9Y/PfiCpFfTD40JXXmpx6+MsSO4eAj9eZ/YRGd/4dVxdpwrsP6p6iGvWUz4t
 rq7TSUxbOC7qa8bToq1/A3rWfvNruPjuLXlScvTfd+Z2SDqsnaaRAwAfW39vkNhJgB7k8m4NYEQ
 Tbx8soTPT8z7EOxpFoJ5fNTw57U8XmwkVay989AnWQk80LkvqDGrpyKQ6N19Z7O/XTtRdRPh9ht
 Q/WptaXndjuZzAQeehTn/+GRxctHd3KLi4F4ez4xSvaIQW5ocw2VGTuSmzZ4JeU4calbSbaYgbS
 MSzza8omIhjLmKn4ZUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230137
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
	TAGGED_FROM(0.00)[bounces-114253-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5955C6B8CBA

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_sec_ptbl_init() uses a function-static bool to track whether
> the secure page table has been initialized, with no locking around it.
> 
> Only one IOMMU device per SoC has secure context banks (the others have
> only non-secure context banks), and platform devices probe serially since
> the driver does not set PROBE_PREFER_ASYNCHRONOUS. Concurrent calls to

This may be influenced by cmdline, so I'd rather not take it for granted

although I'm not sure how this plays out with the context bank device
always being a child of the IOMMU

Konrad

