Return-Path: <linux-arm-msm+bounces-104076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGr/M9eq6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:02:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F998445141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEA133013D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99DE1EA7DB;
	Wed, 22 Apr 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHMUmXes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JA3zGcRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911834DCEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855765; cv=none; b=HpcxbdyEIF0dVhg91k9Vv01TiDX62g9xwCdPlhbMujf+Bg06dUbZEz5aq9Ae+nh+qFhNoe56pZqqyApcVxzics7ViyZK8m2jnaWItxX//bolB24cSG0GGiy4Jh7JRsdD5WeXb90fsOA/NdHD7G4z5qHOnybBXCMzaz7n2uLjh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855765; c=relaxed/simple;
	bh=ZX5tTXtfv8tODJ1cFZSODnLoIJsWZTvkiU6qdwl5USM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzQvrTkABd4WpRmvkSNTJ5RYdzCsgjdd7hfjiu2gkbbYSc92NnlSeB5Ojpl3NhpBVOZMno5Vs/kGd+uyHXqioRKy/GgCq15CDObRrC9zSz2M+VZDQfmC/N0HSWeMJddgj9EH5fptJGO7TAgwPEGKZGedq/dse/MS+msxia21EtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHMUmXes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JA3zGcRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M991Rc2639355
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dluHTVVppSU0nq8UhmRd/XA1XbHIyKovDrus68EDiwA=; b=YHMUmXes8HnjSMez
	HS7xJpjIaObeUDU7KeOyGGf69YJV93ZjItG2cSHJXXMNjZttl+yN0/1+cE04E1CR
	/mABQ2lfSDOCSzJL1K5JCD7gY4giSz26h3wCWkhKKl2FWe6V1L6pk7Ff2mSItfNF
	Rp0hz7Eq9Gjo6jVGPV5LhKPSWUp7GaxF9j3Fy26bGepL24MedwUNCqjmVJDPKB0+
	VRbsikqfNBm2c1nXKHvEjwlw/7U9J8xTknmr40Ez1hovpAofRVhZyB2YBTD4LoIn
	yfdXmkmceyM99qCNy1PWwtK+epfq0b3BPDXeA2hzMu4jvoNvEmqX1utJMx8SCC6t
	UGh2/g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhb163-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:02:43 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4638ca66624so1303639b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855762; x=1777460562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dluHTVVppSU0nq8UhmRd/XA1XbHIyKovDrus68EDiwA=;
        b=JA3zGcROFWhajarsR3YTFcGH3xibdRkjxN+HvsBW2BjF2jRnq02nV60itqU8CKx3Ma
         KEcD0ZYTFVya5NUi9Q1TZoGwc/0WkonJ0u98nm8TvSlHtAWViztn0YnmYtMHOYianSc5
         xurcFhzSXqQjDPayVpjK+/nwgFGTqO7YiKE6MJMePOwfG520vrJpRT7934hxPDvFtuMq
         ydY/TjK2B8CpmNemLDCydP+8h8JOQ6Og+N57wNGZYGNO2ZC3l2mjIcu71AxmMXuB3Jkj
         9IHOfggKWwh+2A6D6JDCxywmebNUZliYGi3ujbycqqRpzts/guC6ihAHq0ASc6ElE5hQ
         oSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855762; x=1777460562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dluHTVVppSU0nq8UhmRd/XA1XbHIyKovDrus68EDiwA=;
        b=Gwxg5++bs+26u/JJWIVi6/hAhJ8AUfkmj8vn0ydzqJIS++BMkFea3pPYaJZGHYIiR2
         oPrSHuxKUnNlKnWhcBupQB9Z/nPk7P73iBjVP/qLEvxtx9/grN6fyk3BqbMjIJnXCEoi
         DnXRFPwK6MXspeMDV2tbQm9nTS9oYDXCl0Phl3sZs8rZJt2Foh98a88hDMLcSfPIPtYI
         vTfzEpfD3GxAPy9KHDzeyXnBWuYNq0PIiJIJ+ERrLyEVH3gYzZkfyJj8CF8E24hD1dQT
         TDVRhB25imfF9s1tHcBB2LurC7MyOtSNZEBXVnw5SxcBRmyGx19RPC304kPTBI6D9wKm
         RCCw==
X-Gm-Message-State: AOJu0YzmGv/sANQxKpDTXH5+WOUUZepkmkNuFxA0UB0HN3z0dzGvcQds
	vtFJOycdco4C+VbmOW2ISwPVU9IjCewUAZUHlf/b7lZ9C0yUasTOD0I0cntBK9fNE8K+G0xRN4P
	tLx+AYm8jZWTsDexGtlhErkEA5PI0whTflOYkUFXMRwkqzPX7whfNY4fAFyCAyIyIxggl
X-Gm-Gg: AeBDieu8qVhK/ILyDixpEu+taafCDSRvFJq6ra2gp0ojNqXh0G+ehByhY5ePYeI6+dy
	EeD597xSjhReOPX/4u3DuKWm7sIscPXjmDQailbRAZF4R8wqRQ+HJLjjQ9EI1RyXNKE5C8fe5T8
	Y03M+RayKDWgD0SyP5mqOzqMYLC+SkDSXnhOCPa4bzdZiTk5XSZDScrzakJka381KdfUynoAWVc
	1Gn5zyZdrKG0UwE2Ze/WhChDQ+98azatjYe2YEYcH2NCAz2FOY6NW/hzLq63L08WOwOLkfzeciB
	Aen+Hn2SCuW+FuMCaMpQHsHLzSiHsot1z3YT6NQn5zDcBzv0YVfSGgz1KDUI1B/xqibug/7bcwm
	tHqV34dkemduQ1NSEArIEOeOTtCeos1VhjpXyZiZiC/+e9aRaX23jeNwVNwSF5sSZPnj1QQ5v/Q
	kEgq2bV21boPavug==
X-Received: by 2002:a05:6808:7047:b0:479:db65:8dad with SMTP id 5614622812f47-479db659388mr2544444b6e.4.1776855762459;
        Wed, 22 Apr 2026 04:02:42 -0700 (PDT)
X-Received: by 2002:a05:6808:7047:b0:479:db65:8dad with SMTP id 5614622812f47-479db659388mr2544436b6e.4.1776855762003;
        Wed, 22 Apr 2026 04:02:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm540110066b.23.2026.04.22.04.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:02:40 -0700 (PDT)
Message-ID: <29c02913-25a7-4269-9fa6-6f44c94ccefa@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:02:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: lpass-lpi: Resume clocks for GPIO
 access
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
 <20260420123135.350446-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420123135.350446-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e8aad3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UMIF2k7aEMshPr-VxLEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX1JEfPa1Iuag5
 Wnq6ojO99FcTt1KBhY4Uedz7UGnOe3Sw8bAPOM+d9u4kSzCstgj+kytpbncM40hM5LatevJ4CC/
 ExjW9XwsElndbzRo3Hm/46hn+lGF5vJ9xQp4BsOuK8Q8eXmwfEEsk+0WQo3MSgGjBz0rkpDQPc2
 jBsyV6ucbzrfuj5rASn05/mkctiu3PFyX6sMh+o9jl32obMnljBbBfuaGKuu85wPNxRDd0w/x7q
 J3DIhSp/MV+Ba/qSqwlNbnHvjmzpLo7s9PYgXTFwpSgcBXaYZ42KBF36IX8UTIjxPxICClwDUOU
 8Q99CMuf/m9urhhayKoN4PY7w1x1e8CwjJWKbT+3Y5t6a071JuZNxuYiQLZHaA+m57X/iqqSF20
 sdoixX/Qyhm39MSCagOTlB2pxLOo7hsrt81KphH3yVnbHUfhICkmGA2Bm3xlO/j/ddKTjxqDRdv
 qtizYW3mjwCTKLA2RBA==
X-Proofpoint-ORIG-GUID: YJk9QfWqKtAWCkCcPHp2BgTs4bStcdaD
X-Proofpoint-GUID: YJk9QfWqKtAWCkCcPHp2BgTs4bStcdaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F998445141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 2:31 PM, Ajay Kumar Nandam wrote:
> Ensure the LPI pinctrl device clocks are runtime resumed
> before accessing GPIO registers and autosuspended after
> the access completes.
> 
> Guard GPIO register read and write helpers with synchronous
> runtime PM calls so the device is active during MMIO
> operations.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Lacking this patch with the previous one in place also seems like
it could cause crashes, since the resources are not enabled.

I think it should be fine to have a patch adding .pm ops first
(which if I read things correctly should be a NOP so long as you
don't call xyz_runtime_pm_abc() functions) and then the remaining
parts of patches 1 and 3 could be squashed together as a second
change

Konrad

