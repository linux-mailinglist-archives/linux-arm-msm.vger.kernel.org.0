Return-Path: <linux-arm-msm+bounces-112528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlNgGHqcKWqVagMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:18:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D659366BECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QmuOQpDZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MZMpVnb9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A91AA309EBED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE8534753B;
	Wed, 10 Jun 2026 17:13:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F52D781B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:13:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111603; cv=none; b=g1QSR23KnFYU0wRC8CEh4ATpr0CsT9z7RSSWjamEN9Ch7IwAkNzuQMkZVCzHPLDxKugfn06nbDqBiwEoXRnFRDYjkbEhhYF0xHSEcV5Sc/b1g5Zci0OJJDdHitXYJzDNl5Bj4NhCnwnJdkzd9R2vWpx++Z96eFto6t0+cC3i7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111603; c=relaxed/simple;
	bh=ouVsz+gFgeFDCZi4BmF8DuQczY/q65vCgfhjidAPCtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpmbNDU12lGOG02wIvOsH7wBY6Xg4S7S8wH5+6AOo+VY/MpdbieMx7kMHN7AOS+IaZuQkQBbJmfZov8phpMtvljLDw0UEd9geVuhqtdlnohx6uP4wS8zS8zYOSgZ4Ppja6U9+NsIXQah942Hjye99sYVG+jiiin07CQresNnFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmuOQpDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMpVnb9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwpfk2042073
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=; b=QmuOQpDZyR8bRzGM
	ly0MH2zuD80wFMi2Gp7y4JSaoRThlYrbhr+W/pipWCSpGxw7yvABqFohzSqR12/Z
	+OBrzTlaljKB4hlJuhGC3DgrwVBk9EfIT81DYyBSPr89hJDEaSIQyvl8CQYhXlOq
	rxgpwE6fuguNIQOpx5nkynSWIL0uZ+D9GeM+8vdtRQDOWE6fMX1bJoaw/QCWS6n+
	X3vZzXKrzZjvRFCmRuIuV23uhPJmrSzonBAu4BkTBnOCQBOlyETD/ytgrp1GR3qy
	BYLRlQLAZ4+6C+Ob4aVw9bSqB6AKVno9i9kRZF0E2K9WWDmzLfVbn3sq46TfzjiK
	9fa8Xw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukevbt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2da7fa311so364295ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781111600; x=1781716400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=MZMpVnb9P9DrGWmDB1W1cVG1KxnHet7ldux4FCdckGD7IKbaHt86iQ6UHFHlusSp/B
         SH/bbHw8rubpHHYrc6Iu0KsVoIql2WCnA+iDm7l5TMbd7ZkoXSrdejWPJGoB7NzcvKaA
         GGDFfCkysb/H716kybA0PvQOLWwI/cZedcRhcCwS1lrPNhz4/rR/RObGUk5BatgWUcd5
         PMO4DIPSZ0vKZA8AcGJUGZRkmIIcHsDe1Y/S2wQMFrhbFInKn+It3b3411oXM+Run7Wl
         xA24IAXdX5ljd6yIdyzK1iiIOL3F3cjaZsKZJiUNT+QFe76qzLyDTdsfMBArXW7etslm
         9qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111600; x=1781716400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=soPZWXbAkdAfh6y8lJYQ05qt7dWhlFnkdBNZxSwHjgZj6i+lxQahMxQXca7XOx2eqL
         Cl24tObe8dICUXru5IKoTMiNtbtKIQPUF5FLCC6vZG9k6bGAhriUxs9hzV6wWQ97PaZx
         kZJeoyIUoLvijOK0FIPa6TXcGQ+uF6B6p3Ohhk9tvW9gGz4ylEP6QbB4iOF9Np7ibWyL
         gfJWfIox5msf3p7CeVS5Njvqrz3tDKdyobjErONe56H+JpA84fdXYN3vv/VER2TcdC1Z
         Mad0PO2+JbvnY/A/G+csQDmIBH1EbZsbNLh9rJ83wezpqmX7h0BccowbnOFkfbHYVQm+
         2kSw==
X-Forwarded-Encrypted: i=1; AFNElJ+9Lz+Ob/cDJTrtpSw53Vi6iIw+Dl0scEp1RQFLlbyC0CJXhT3E+oZKi7JxSjT7ne/Az+lpLUEAzO8h2WGy@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3gCTZQ6/lDJIb8UQlw1RkrNdkc5Et9qnjZz6tB4trKvioc8d
	c9J3aXsT82LM5P2c0h7x2q3+cQUEKTXj6UUfNn4TCvX4nD1hBmFhoh2gM2My9O44s11tNe3wLk+
	Rp8jnHUe5hVsec1r3Ar2aFI0r2/MqFB5r8Zbns5R1NqrJv72WVmjvtm8OplqODbQWi9f8
X-Gm-Gg: Acq92OFX1ufAg899us2qxW6jvNLRVaebonCSRin1LCaUWdLPpGKtZyDe8x+/gChImmx
	yAVeZ/TqRAFAW03BNrn06k2mDsIDl9TE6V4FDMEwfhqfEoybhqFlYqdmQ/SuhVqoUC6zeHht6fS
	xI6HWhQgQN9bXmmsFGa5Hbzv6H0K2S8tq0PUgGmqoFpeeL3qjqTUDVF+K+J/facPn4IKYKFGIvK
	1zobluY/PkeyZlcZnFoFOzVoln70d7g7Don6WGWeg++y2JHGahUhnd4P5ln2fozS/nG+S3gel8s
	5CBgKDoguwav/mr3U7JuhXegalSpQh8zYvW1nBoWPkR+TaHTnmTtDpU9nEPgYrHySLtStFt6JMG
	e2DDaNYCAb7osY3ZGI1jvH+Fi35+bKQp8r0m0Qh9+T6FTKN1gbnI3xx2BxuON
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053435ad.7.1781111600457;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053055ad.7.1781111600028;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e096sm256509955ad.44.2026.06.10.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MyBTYWx0ZWRfXwaNwXbH7t28v
 MMFztEGtKrdNHkde7VBtJZWX5Ht940hrTQ9NpVf4F6ZkHKrQ+hqZDEkBnRZXbKXuJYHS0S+VEEy
 KhAfXPhZffTj0nWl9xxKh1a99AKah+dnS8zeLczO5ZkUtcE9G796Y/WsBa15tWyd+3TyjDxoClt
 3fflJRTc8JRDch46LxQ5wLcjRLmYTzESR/f1OpuOlOH/Kn6G6j5rCOnuZpMgIL0fDCim4X2xGVx
 eUizA7K4jIEFtG7mBxV7shUSUhQ7s1NAUlTQyI738PQ64boOGKjlUjsQuZN8SVXgWWIx2CHRIgQ
 Ps/UCjabQ2puiPNAkMY3ZiGaYXuoiyHyJfYKuK0IiI+ITnudt6yu0POoWT4Bj8xiHFwXvbUPdDt
 ydWFnpJh7To/zrV1dTEmloCha9c6lDQR3VdnIkA0JNeL8X3nviIdDP4EVHs1Hclzqb7KajmSXRu
 7rzITbRQcK+bTeFx/0A==
X-Proofpoint-ORIG-GUID: 6f8f5obl1Hh35KXi4xCaT2jNabtpKoar
X-Proofpoint-GUID: 6f8f5obl1Hh35KXi4xCaT2jNabtpKoar
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a299b31 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=WmjVd0U74ipakLrIZZEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112528-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D659366BECE



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.

BIMC PLL is never controlled from High Level OS (APSS). These are
controlled by other subsystems and voting should be via the ICC for BW
requirements.

-- 
Thanks,
Taniya Das


