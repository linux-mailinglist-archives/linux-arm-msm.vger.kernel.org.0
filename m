Return-Path: <linux-arm-msm+bounces-103349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKJyHQqf4GlukQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5B40B9B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D102F3110509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E9A3914EA;
	Thu, 16 Apr 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxbDqwk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMDCTF8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D038F656
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328119; cv=none; b=Sf+U3reVskHffbtx/R70fz7R+f+CnZ9P5dv1hLvmfnMrlPZYSnUff8q9upcmazKzDsb9jDw8MESegQabcxsJGoA7+CnSXMzR/2lyWlRIwDmWajbOz6P4NP3ZQFoGv2kUjdF0qKfPku5IIq17hCaCBzM9L1v9FudzhYKmJ2gnflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328119; c=relaxed/simple;
	bh=UArPoZ37I80QcdnFfys7bFqnf/VN5V0FZIqC2nIlfYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVWqFqGcZsn4VX8qJLMBsOqpTL4MEWjjhmzBFUmMOCJ8BjxDVchp0BJwvAcvpyQEEXuVzGbYwO485+Lv5hRKFlhopc0KnaUwt296W3yGtYp5NtMJbIk+c8k8sovmtCLHxRNkKrQ+Krs2qwkKsWvY6DE1jAlTSrkt1X+siYh0XKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxbDqwk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMDCTF8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6p3da219437
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=; b=NxbDqwk7EKtyLjPB
	Xom//KYTmM9aj+qhFdj66c0KYuA2dL/fdcTGqIcuLGJe8Q0ahQ+DBhidTOxV/qyY
	05vfoMfTogH24OklCiTNyNJERBhE+YYDS8OqCXZMXMA5car+wuZqOQ5unkZ8jHkj
	gSiPatAJyq+G//tEr1whM6OPAmj9fpx43EyzbtNE6SWHeSeS3bh2RmfBlZTeVzgB
	ZHxcGTyxz6dXniLG0GcSX3V8d+B1g/PKAoH3KnmRB9ZfrcPDrdFN7r2yYotgkdpm
	swEqLzpgvUioyyRMI0ClVUG0D7Yg6tSAj4N9Uvr1QVtb8JmeMwj40jCt9+atMUze
	5auKTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuygax2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:28:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb3741d12so10995226d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328116; x=1776932916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=;
        b=DMDCTF8u46e+nmxuDmmNDkG15QXudbld5IN0mQjLlXfWCH2Yxs3K5WqPb7Cf2imEar
         V4BUrAbudbVt//xx5zqMkAbOCpGshLws8PTC47pScDdw+ZOKA/ruImXPtk5x9ujEjUXa
         DurVxBaEKN9FfOdcH31bulNV4tpt5jTJHUzziBgtKSKmr9nz0qvCa2OUKY0mv61dEWGh
         1tfBLlnCye7YecKTnVFYnwa47AaiU2HGIpCAceCym0FQfFdffar8xC5+Ur1W4N7SlTFt
         sRc3+mgA/uHb3M0NwdR46MdhjjX7LsgCx83Vy1nCLYxKSp/d7NBEfQUqES+wO0v7eE80
         ECmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328116; x=1776932916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=;
        b=VVwJ0Z4AHY/CTTcnJq1xmpbWKaL7lxlnu+7kbbpixeHP3IEcvS3L0in4+HCpmtGwLm
         qDkhWl/Coafh+aXlhJ1KfVp6UBY4SJ3vOI6a1PIt0MHT0pb/EOTBz24kZWjPdLbuzQC7
         84wMzCCSZzl67BRYdJ2nX+ZQO+jIVf1Xlnr+20ub221qhOmhuTsoDjFqGupN+i4WEoXy
         bXI9Rz2vbmL2ilsC48ArOsCw/WeNUhNZgztfRr8ZN70jtL0RfUHo3jslxey3PJy380zf
         8SshpE2oEGMETAL/K2AtItiBGQMaQvfQyn7oZBXgV53ZQZH1oRiwJ3BBpZHRPy/7y9jd
         YOJg==
X-Gm-Message-State: AOJu0Yydj+GlHNToVQEYwPiAXjxYkUT2X1oE0iWvRAe515WTIBji5A/w
	EnA7no5+9fzrFZiI5wr3LBlRibY5m+YM9wo/PtqCaAi8BC4BTQfiufmk4+n9BKqhO0RqugM9pX3
	rMnq7lUB8gQEytQ267wNiNQEU6v64sJuIvw6ub+tgY7kuNs0Q6llWz42aGNifdfJIgu6b
X-Gm-Gg: AeBDievYnd3LR/SPse0+iage1cxwMZ6nYlp43lBpYl57ONt34IDhsI5rVvsrIOaGnt4
	hPo6rNsOp3EqZhDrGIbSxPy2srYnGfUFxjvLfyEQmQOZWJK61ZneUJLtqwhYmhy01+IDyKSXc0i
	fYDuXsdM5LjfsBTKGcdB3c7skggafyhAbESZm49iYhjCZKZsOuDTGu5m+LfxtDtUsiW2gwDTZw1
	scSC8wcVT9vhokyXgF99KTSVxI9hAn+pkIhKeyOfriMJgJtVtbcWCqdhnYormDc9buDyVYZZT+U
	+jW6kg7ervm98tzk3bzTLwEhfe3YSBXY4vjLJ6VocLP24ObAx26cbl2EkvNX8n8OkqRFOLEm7JA
	KjOeo4fw9AGGu/7qG9NA7WCi/fvOxeiPWZ00JnidA58Mw4ccsHEgSR0pJMDOiGMQNgt6Y2x+jRR
	LFwkxNCfr/BvE/CQ==
X-Received: by 2002:a05:6214:e6a:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8af61fe98bdmr16985606d6.3.1776328116355;
        Thu, 16 Apr 2026 01:28:36 -0700 (PDT)
X-Received: by 2002:a05:6214:e6a:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8af61fe98bdmr16984156d6.3.1776328111838;
        Thu, 16 Apr 2026 01:28:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1739300fbsm146192266b.14.2026.04.16.01.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:28:30 -0700 (PDT)
Message-ID: <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3OCBTYWx0ZWRfX/QCTO9th+rns
 uqjmr98C4CFUuYoPFN8d7CckejxHDCCLQRcudIbAnIfITrFVnhRKgdJjNNl72ykGTqRw0YlVadJ
 rWDdPDFdlN00hFg6GQHXIzM3LscG4C31v315NocsUzk3vlU5jMi9L/5GbKRdaB1p1Le2PiihHZB
 dB2uqcMmrWsO+1EoBYVHd6Yy15CM8t4hgUjpXsFawFEL1pCKjO3kwgepO9lpD1cvNn3qj8Qr1yU
 K/g/Y7GmHfg5NF1jbZXpFItNR8USCVKTlDM+ibhJr2cG8K5aac1scq1jchr4LD0ACYv56yuQa+g
 xvUIblM7zaPnUyKz3QgHTspgQ9W6SY3W8qWucmB6zStpm0p9OAIUr0hsX/Js8EE9jMptWDe1DnB
 05kTqwVeDCvhd/l2hNnrFU8VEooylZHGIekXKRHQl+C5udj08iHpoVE2Le3W80CaRbdGMSuhkJW
 KYJ+3xEP5pMMfaGZXXA==
X-Proofpoint-ORIG-GUID: AUGEcyxXVE-N1tFJUCo7t1FOY3kuaK27
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e09db5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=H8HeEjOgkr3naCPkutQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: AUGEcyxXVE-N1tFJUCo7t1FOY3kuaK27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103349-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 21A5B40B9B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
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
>    built-in, because MSM8916 is also used ARM 32-bit.

Is that to say that the arm(non-64) defconfig should be updated
too? I don't see a related change in the series

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

For the change here:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

