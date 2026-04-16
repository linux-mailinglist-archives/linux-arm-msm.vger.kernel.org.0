Return-Path: <linux-arm-msm+bounces-103347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH/4LGCb4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:18:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024040B6F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 797CE31E1C16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE6838F95E;
	Thu, 16 Apr 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4TGSIGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJlroPnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42FF39021B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327161; cv=none; b=bEd3UoPLUvfnlhOFuGvXhEa0tYyznQcH1p+i151Q9ffFqsJYkQu41T4cVpP5Cg4Fy7GscOV+V8POBt447vLJc244w00c2J+AnbuXqHJRH+UU339tShJnmUXlCq0pi23fjXQIhaGE3gVanvsyfetT5VJ1AdXCbP+uzYQcXbrvNPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327161; c=relaxed/simple;
	bh=8JohWthLKlSVbPTgNCtIJvP+v/ADALMVGZyD0MCwV80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijrI0In/kSX2H6twU83KMObpm1lMG2dDni076CciGPYrwcniA5iRueRygDFsblHsEm60MEUUYEw2qzcx0gcT0+3L8X81OPwk0ypmRHMCfE9wInWuneko0Au6f4yoJ1aKfmAH5EyevX2Xx5ZH1f/M7YvSB+7/WgQkcv4i57h+ttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4TGSIGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJlroPnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G1VOnp3089098
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNgKNDig7mxUSXxTpsPasovKIunK60/yJYzkXHM2FZQ=; b=U4TGSIGMI49mFtQd
	sb0/fsTwPxfCyiATyIorwjwfjs/FC0aTpwL8BBVE21A4psJkbVpoHgNlI5PXmo0A
	Q7d2mgQ3SccA+GRLqeeQZPBvXpaN0D1sfQL7+G0JcILCTtq63aMPUCfLCkq/MhNf
	9cgGEQe/igtIJrpwY9+NGeEzOxKBlkW/HZixdjr0Ulim1ypuMyrBn4EKa8PiIa3q
	N7lZe0pdjd/1Hwu7Ve/8PHGWB9Rm/9mXVycXMunPsCgO+giEKKmoVhsvl9QES/bH
	cHJDgJhCJkW3E19XG/UXWOEO9Fk2Ng64p4oxbeOqfkQsm+wa1p2a69sLkPZQdnKR
	EB42eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djp6a94sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so227642701cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327159; x=1776931959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wNgKNDig7mxUSXxTpsPasovKIunK60/yJYzkXHM2FZQ=;
        b=jJlroPnF7UxbJ5MO/LbuzRCbYH5NH2poklPS0BCNsYUy+h0FhNTLrRv5TGVAmOJQqL
         JkXxWP2IlD4RMbUkcAHrVaNCgir9//cjPhW/rFNoS/DzvgqWopmtIip317qHFpoiCjni
         uYZdyAFYv9V1BzOLmNbRntnw8GHgGzfqJJuz11RJxVbmkqg+goaJqxJ5cCwNs5PLrsE1
         omz4xlycvJET/3YF536x/Duxoh0oqF+zBsxCLgxAUOy3Uuo7QNgnLb7f/ENws0ivkpGf
         WfIqqfCtpRgHDxcDnmcG4mMcHN3vXIbOxn9muBH1ap18TQHDwOYw5JJvtASlEoAHJs4K
         sYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327159; x=1776931959;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNgKNDig7mxUSXxTpsPasovKIunK60/yJYzkXHM2FZQ=;
        b=GLBgucGA8ZgTqwMwo9i2KFuEnjpx+A0QfCDh9GxIGS8y3Rmqw6DW+/XlKev+qRA1JS
         07+OZRBQF5KNIM8bokRdsPBcUnr8a7kE0ft1KaHcz+THmmFUlQb+4icTvZUABHYu3IK9
         6t/d/A/TFaODClLEH8F8jmo2pTX7ATz5f85vfveONRWXRmwxpxw0gHjqdO5uviWevuMP
         nL2p0H2i/1n4BKG4S+VxFNLziI48mcE8hCP0nlPHVs4pVVv6LzdHzi6BRRCStyYcinqX
         as43sssMP1QDHKZFVojsVrF6QlN2uOcIXVweSvNdZ8qpBC0/b/ErnreicNX+qiDVOzFu
         izuQ==
X-Gm-Message-State: AOJu0YxoJ5bUhoIJ4J1d4RZ73Atk8F1YdqTXn1PfvSxw/SRepWRSOlF9
	YMH9mms78fE+qzqgPcLDkhSTC22RU9sUz+zCRu0ukYnxAlZ/reG7GtYSVIj2QtmiuaDo5nGHFDG
	b01cCU+61jqGQKEGOQZXOvB5JAq76z4lhDTguMKqpxGPzmEuMVLsaH93JcVSUIjTdw5tE
X-Gm-Gg: AeBDiesOtT4jWGtxnlMD4bWksSY+lS2cW11w06QzSJFkhYOZzkYBORv2tZxKVbglE+F
	8KQ6aKcLna+rgRM9rHIYFfogTjo7X9+OWj9IxaRUkk4uAeuGnDATW8kVt3xly1XYkOklTU37t2X
	3UQE2aMnc3RQ9s7A6mlOU2r5QLvUQFJrnhVuCHcS6eUfluHajMmm13fb1zgb1eEV1nEAXbGkvyS
	ryN/t/KBG9nnDpiWx50TPy3yinHD9nuxNuW+2C+gu8CvbaahCemBS0wCSe0i+U88APofoVLeyiy
	3m4Sev9Apn2TJHkyBbz0+xstt+DiqwuoWJiPtCfGdpRGsWrt8kw0i+kLr2OR1Hb2YuyMS0dpr3I
	3ICeG3qE+XVlxafC3W0M65PNRpIoFegSSYGrpR4gFLnIKTAjI
X-Received: by 2002:a05:622a:14:b0:50d:736a:6259 with SMTP id d75a77b69052e-50dd5b95d34mr370723911cf.3.1776327159215;
        Thu, 16 Apr 2026 01:12:39 -0700 (PDT)
X-Received: by 2002:a05:622a:14:b0:50d:736a:6259 with SMTP id d75a77b69052e-50dd5b95d34mr370723581cf.3.1776327158785;
        Thu, 16 Apr 2026 01:12:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e263csm11235435f8f.29.2026.04.16.01.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:12:37 -0700 (PDT)
Message-ID: <808f4054-ffbe-44d9-94a9-13562c5c8382@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:12:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 12ZDZp6JgtarRsMhvjirXIC9BCr8oqla
X-Authority-Analysis: v=2.4 cv=NuvhtcdJ c=1 sm=1 tr=0 ts=69e099f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 12ZDZp6JgtarRsMhvjirXIC9BCr8oqla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX2DAkLKZ/Uw1V
 PhOtE46Amr837aAw4AAqFepup1zendQu8WKYgwtzdlRzpgE7zVNijBhSk5rpZss6RMMhsYgqHJ+
 wSNHELBQIZD2Zn54UsM2GsKX5zVyxacuYIuXPqH56fTEqQ0g/fdEeRSi1sDSgmiqZ85XD2F5maO
 YJgKN1LBpHKoKSPD9EIc2T2P12mGjoe4dVL/YDaJ9bh9nalHfryWHRw2NVElAyKATqsN4Qc6IcQ
 JqqP3hpvMzhIWZyzTY7uuXU6roR2xxmrpsjlh7I6TJj3Tn5cMRgo98RevK6kERnj6gjnCiq8X3V
 YV1IHQnyOCZvInDQxQ+GzZP9NXpcXsEijgcsuSGqCyl7Ny191h0J3iTNXpyfhxAnE0keGqq8WMp
 cKZ+j1UbFJZgZRDPviMJFriO0kgUvQ+up9G6sCTllNoLTAYq9SyLa4coSpPBPB3q2CV4U9+1zRS
 yUEDMYfRuH6x2gOlMpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-103347-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4024040B6F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/04/2026 10:10, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> defconfig to respective default 'yes' or 'module'.
> 
> This has no impact on arm64 defconfig include/generated/autoconf.h,
> however changes few drivers for arm:
> 
> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>    (ARM 32-bit) uses it.
> 
> 2. Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and MSM_GCC_8916 as

This should be "qcom_defconfig:"


Best regards,
Krzysztof

