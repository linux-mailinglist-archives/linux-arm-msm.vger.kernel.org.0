Return-Path: <linux-arm-msm+bounces-104075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEDYJB6q6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:59:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B64450CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 677A830104B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57243B2FD8;
	Wed, 22 Apr 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pm/HiF7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCCN5Y/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549DC3C3C03
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855577; cv=none; b=vEJofxxZFca3BaUgugeQKv0vGZDcjiOBB48nsvNatRTOcSIcan9U0bnbSbID2wYhEGPbFKwqNqrEJ8aBB3TBryQntPYOZ1v7mUiR2n/VGqB9xUVBpmQ8Kk6Nw4GBbZuxgx10azUOCfhcYLNPGmqrGAQyBwkU/Y3jG+2ilZZo/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855577; c=relaxed/simple;
	bh=1tU8ilTp0izBh60I/s/PQ8PYpHh14NXF95Klg8d3WKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckIr/Gie5rlbMmWOPcd2FKjt/Qx/iqad0ptHsNdOZRWP7dfd1jth4hezLEjpA0aCjGeCCtdLXrMrpDFudtQkCP9MbCSa+39qNI5tWJG7l7LnmVBMxFM6VSagX5l5VPvNzdrKwZ90Eyj8r5uR47zlHeLhSklZ5Lma6uAb/Z7WECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pm/HiF7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCCN5Y/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99JFh1082404
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=; b=Pm/HiF7q/JLF8Dca
	pmwIGvtL78ujaX9oLyMoViGzgAYQrPZ/ZTnVdsodGih1ZJF86aef8/URsRQ3MJya
	/el57WeDKW0j+rwVnPsTRPTcccg9ZzPghHz601HGYOhYTZ5mAdcK9BM4kjN800lW
	2PsIBZbLuZhXTY/dxafMbyXjIC0Qy8ELxE/Gs4115PaM8jPRZhVt1oFf1GSMArrN
	nfm2Ix6FYm0oeckt9cryCP80BcC2BymSQj65aqnJn+nTim9hEZ5rLyDAyNyjVJaW
	zfWB33OQ8IiVplbweCsZCQITDGkpY3o57Hmibbx4ZTnv1tEdK99Yv5fAhdZg4Ajo
	g0BVhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng33ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:59:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faec938fcso7031911cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855575; x=1777460375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=;
        b=BCCN5Y/wcWOuXrVUr0aF2FrRew3XdMepnXGa28WKnrsPSiqOjHpRc33Oui5vJgi6yT
         yMRa+E3lM6qdh8k6mdwEDGr8X1N2QoKUKoSwvcWc9pTMqf3gJEXnXH5oYF6zNylVEeMJ
         PyvRJi4bGQSJx7J5iD5Fe/YaaOl3/T0etxzQoKy0fCmdQf3NLQ/absSXdD/lPDEr0sSt
         H9va7xQ5gzgBS9/zFkZWPqaQnCmMmZIzWMIm5ayIV9G64yWClvwl33ObdgIguv17F4Hu
         BsGvFwRL4VjOcmPjp8aNJpKe1cRmWvbhW0fi/PVftJNMwem8hXmdQ50P5W85NRC9ZtRu
         U3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855575; x=1777460375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaBs1f323n7nubQy6ks501J38n6eyfc8rziMeT9fslQ=;
        b=d6YFOl6d3PyU1RyjGc9YfuB/OFEu5hrYOQQ1R3QXi5k7AYa93I8E4bV+iJkOdYDzO9
         dXcnL4yTblhGlq50/TV6ZrlQN1z1OIWoaIKjRnK0Hi3p7NZGHcfx19KZ8zX8ZfO6mx7Y
         6JoGYJ36WsiyCmvvDKYYA9oz9I+WVWD2Do2YU7pC5cBf0BlsQuYnk4Rv9OpLPFQU2w5T
         S7cFv0idD1cQeDTVK1xSuz6vh/tHsM9+A+Olq6/yasB7RsvpjjrRbgiDpamFybXrBYU0
         gy8AWJFQHE6Tb3vIquE1PQB+QlNLXkIhqTrWGXyqiyTdG+M2hX4o3tl/BsDKUk6uRxfS
         Z75Q==
X-Gm-Message-State: AOJu0Yy7gPiiIVrojr+7ndtqrmvicHEybLOfvSFDflj5cPb5bNULBI/q
	T+n8xlzJgy9vmG7aEiPV7Je0fuuzS2zUWoTFSaGtoqdAD5HSfozeA04FLJlEwq/u1l6SDzqXqEN
	ufPtODgwL7HGy+uNiU+kR2jjoXWE7JK/f2x4eOpuV3ihTxWd4YDHpMUe0Z0ufVKTFMt2f
X-Gm-Gg: AeBDievNxmwCGpJilwGUhJi8yVgVOuW5OLt79QROoNkyycYWziqDfu1hi49xQp9JWrb
	7wwXOkLoQrrIcF6xpWoed4aMCEKSAq1B0baPUJGQ3wh7JZErl+7CYnDX58MPJpf1Ctt/x7l1x+c
	jCdDPwObyVb51DteU1caRZqE/cKwQYlV9OaxsIvvvU/o8AKy3Xt8dv53RLkHNNpDVXXLhLuheg1
	QDc6aS2s0UHVVm8k1CnCRtRg6KHs691/MiaD12ZlgXL1gEt4htagRXT+G+R1Jk5hmVcpGvrBXfi
	PbYPYNf4GxWOeF++27KgFaU005OA1slsDeqx5/y//Xf1z6Hw94N5k4orO+Com4EILhAg0Azp427
	BrTm2p/vfPlXatOwzjvfFO99m0A/CSgXMhWif9h8L+QHFs4jgKZisErPJ2TXClx22pfieYvxmwG
	mo8yJx5VR3ysM4uw==
X-Received: by 2002:a05:622a:1812:b0:509:d76:fe73 with SMTP id d75a77b69052e-50e36c0fd9amr228235611cf.3.1776855574484;
        Wed, 22 Apr 2026 03:59:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:509:d76:fe73 with SMTP id d75a77b69052e-50e36c0fd9amr228235401cf.3.1776855574051;
        Wed, 22 Apr 2026 03:59:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm524976566b.42.2026.04.22.03.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:59:33 -0700 (PDT)
Message-ID: <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8aa17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=klSbozjfqijqAWY7aroA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: f5qIuOwxHoBFd2ZJuFd01AxVhFOtAcYZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNCBTYWx0ZWRfX1tV4iV80h5bw
 rqmVJ3s0HNAbmtKhc3fYQ9iwFLeAIrKotJSwghPVAnRHUo5fjGqoS0mUffC1aL5LMI8If8RRos4
 4QmwJ3JU8duGJHjAoUx/W5A4UvZ4lhUBztb+Q6Bgl4Gttrl66GF07oy7g3QJq3FibInVcal9OIr
 bDS1pfO1Afcd74Z7mtxtKH4AeY/OZATdeJ83K2/SzIXmIOsGyJPJ0wFkrBu7OZGu4NoE4kzoJao
 Htk0q5BiqyOcH9DV/GDDGKLgel+J4ZckfzftQXbE5hXgopnKkaReC2J0ZCHIm4CHZ0UFLOGoEHM
 +ldW0EyZkuPx3QzGkjjEGclPzWLBxmKqgIjSKYqW+qsV7xoP5SIwfDB//KYECVUK51el+dqBhtK
 kHZvb/CxERsCdBiVogxKkaqH9qnB8B3PPCp/3u5DnLWinloH/PETen6iC14MQDxfv2v52ZOqh7E
 SOac3totdnaBA6xeezQ==
X-Proofpoint-ORIG-GUID: f5qIuOwxHoBFd2ZJuFd01AxVhFOtAcYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104075-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 551B64450CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 2:31 PM, Ajay Kumar Nandam wrote:
> This series moves LPASS LPI pinctrl runtime clock control to the PM
> clock framework and ensures GPIO register accesses runtime-resume the
> block before MMIO.
> 
> The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
> callbacks are wired for all LPASS LPI variant drivers sharing the common
> core so behavior is consistent across SoCs using DT-provided clocks via
> of_pm_clk_add_clks().
> 
> ---
> v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com
> 
> Changes since v1:
> - Kept GPIO helper return type adjustments in the runtime PM access
>   patch and switched access paths to pm_runtime_resume_and_get()
> - Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
>   (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
> - Addressed style nits in GPIO access helper declaration formatting

Each patch must be self-contained and not break functionality or build,
so that bisect always works

If I only apply patch 1, non-7280 platforms will still regress because
the changes made in patch 1 require that pm_ops is set for the clocks
to get enabled (otherwise it'll just autosuspend 100ms after probe and
any subsequent accesses will crash the device)

Konrad

