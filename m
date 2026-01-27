Return-Path: <linux-arm-msm+bounces-90648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHVMjtXeGkNpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:12:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605D9048B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06AAB301DDBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C79329E79;
	Tue, 27 Jan 2026 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+uGxUXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDA1l8yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25D329C5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494329; cv=none; b=fODXy2cH/ZG0Bj2qa4q9O/Jel/mYi7cjhhN6Veb5ZxsJ2iMN7JStVI2tIpGxlXFH9e5SwF877mhXj99RAhmmcA6uAUBRMidxat58jPM9MYfi8gs84UyVFp+C/jTVe5Bjl2TznxCc3JL2pbvGmUmgVYVYMq2ZyO+tgGA5IUP9Nzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494329; c=relaxed/simple;
	bh=cJTtKHdavxmzXsgCYPEa0JmZDtdBVQcCxIpGRpBzASc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKX0+6kpaEmyPDf4mk5D0MafBheW6ioyI2UiYuF+kb6e54hVB15aH2GJw14nOb8sGrBR4D4l2VZawqqqK3vQphY1swLOW+/R9btBKyaskWcwJ1x6UiuzTvA71v7x42rzx5mCgq8SvA1QJ0dyAR4DSIgXB7uytUwRQiz3buXl2eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+uGxUXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDA1l8yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4TxQu786325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=; b=U+uGxUXcRqmCDNZH
	I6/GdR3OvQFg2RTo3mU5sBJrabaqQ3ac+wBWsyP35sdcXldyFx2IhuOijN9UKQfY
	vEVJW2zG5lq7qsU07si0k/9aOXDdJQgcn5ZWPd6F/wuhzqPl2LZW3cu98OLR+ocB
	5VfEAc1A8XVWCfOuSHMJh9cnRboxF8hi11KEjepbRH9OmDog2PrV/UxYChLEv3c1
	kN5AgkqOqIspi3LDNSIpmuTfWKWfiXSeU0xILuI7Xe2StKhFru1qARSpWjrDBqO+
	jfVqM0cxXTEhdLLiapv0HL1TqvsVYepT9SPAhKO9JddUlpmWpaqHLvYBOq0WHVdz
	a0Qi1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93h9jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:12:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6124a9fb86so8311403a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769494326; x=1770099126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=;
        b=RDA1l8yuIq6uM1+IsrCkYFkF2NcpGNU1kreJqoOO0dDe5doDhbOnzFK6tLzOx5D2S0
         zI8dD6AjkbzUKLYtsMTESWJQzFRPrR7rDi27Gm/wb/YRnnz90MgzW3vidTlTtGl+4S/h
         /RxV8Up51ZXm3wQmKP9Yjxay3tyfVpsPLQFZF8kKsV4YhjZ7NbFRdnaGo0gM6vsU80Yu
         P/fTtoJv4r5fIZU8wV8YnzSo8oNOnXNMNJn+5fw6pZ59XZK3fC1StVWhKrpxMy1t0VdG
         gsQcsautCqbPBldrSoUKyZ6dLKnlsvm2u0ck18wTHs5EEF6i0YKc9Y0cBIwypTIEZYXS
         JIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494326; x=1770099126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gmev3uvCguIZxvsHqRmRj2OkGS4cXvr16nK23VjL4g0=;
        b=C6xi9mGT6HUGbkr7khroiyvWT7GWBLwVfVbqkLjdybeIKmQP2yMppbXQ4HoqOyH3Do
         H9PVHRyUFL57HDMoZW0RhmD4l346Jh643FALUzsL4Pj4S1rUezPW/ZcKY5TfXTvQ70Cw
         TeYmKFx8jqwa7N75yJjP0Rsapl9FUPXvRtFgBe4O5BXcTIWWWwyVxJswLjWrDj6jLanj
         DHfVuag3IWJoNzVrqvnfba7Uo2YAgvA/a0XbCSM9dwXJnLuto6gTTT1kZ9evNgWiMFkF
         TAHZt83lLrbtkS5blfiqmgNr0YNWfd0qKKFtXwbxrOn1oQ2bJlT9FXKd5yVPh6VqGQJb
         LLvA==
X-Forwarded-Encrypted: i=1; AJvYcCVwdSjdtPr7btaVl9bpMzUuSr2LXNMcjjLNzJgqSDlaIFsGESWlau9yO+z30Z3y6VgM6EpQk9P8eFXtBriB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/iCWePBoO9yhYOtgL2FJWc6EwEeUCQkqMNuaPA5OpxQkOu7h
	iZAZgHf6PPOtlfT+zo3P8ZG0M400FfYYMVfh2oGjORPfeZPUZnWKtEgGy7Cea/LQ9AA5LBW8ACJ
	WdPkj+xjTrl5tSfF/CuiFe63fdrDUP0uAQfJdupvJNp3SnZu456wlfKn1JzjgsOJN7v6y
X-Gm-Gg: AZuq6aKhtpkSGws+bS1UAHlUkREsh4Gq3E+m3ERm1vSkGoopOI03+u4kctu1HUszAFF
	CRpUDwRpYF894vCL/hTCtOXn63JN8NZb/WajjPmzyusLL4IKLE/eTy6bAz4pGiwWeqDS9s5l6ta
	RtwNPUitotVhiKJeUrbTd7P8er7uk2aD9jWVngc/WV3FDrXOFceZcLsZUEW+N2SPz1uY/L6Ok7+
	x3OD1x/4q1TOK8tD1S3aSXPnNAW9Ek5GhX0jTT7mnkAxLHToD/vwQqLSDHbzSMSckKkorqZ3b59
	LlpTUAlFsNDDR0tyOSfoUzgX8LWLSIkwwP+euXU7+aPNpQpQVy1/qsLDag0rom8vK84Z4cirxTO
	0G1D0rxWIN7kGVhDMN7rU/72v7e2WnhysqhQVBA==
X-Received: by 2002:a05:6a21:b85:b0:364:1361:a8a7 with SMTP id adf61e73a8af0-38ec6246ebemr509937637.10.1769494325499;
        Mon, 26 Jan 2026 22:12:05 -0800 (PST)
X-Received: by 2002:a05:6a21:b85:b0:364:1361:a8a7 with SMTP id adf61e73a8af0-38ec6246ebemr509918637.10.1769494325054;
        Mon, 26 Jan 2026 22:12:05 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a13080bsm9674559a12.2.2026.01.26.22.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:12:04 -0800 (PST)
Message-ID: <3e381303-da09-4224-8929-8f47793d6bae@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-glymur: Add video clock controller
 driver for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
 <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0OCBTYWx0ZWRfXzIPDzh3Q3hPW
 FzPMAPJj6XHiGjwiE6/SEtHPDKAoyDA5HgyGcg+Cxim/f7pNAKwilu2ph3Zjqldz4TVa2MAjazt
 MvjiDMZqsrmdvnkz+1NuwYUjmuARauLSlQ0KLBnMthsopfgJXOBONDzsP7scS6Mp7bg48/Zt+L5
 O+78fqC+HXMhHx1PS5DAv5Fi2R/1FzUww4wz7nKoQGucoJsHlei4c8spwa7PT+HWKX1Rz9Rxbah
 oXAUDX7jN+3HUcbsaE1yAaUHw2MMYuzrtYqneSdXlGovwKVc/JOWMr+KekU7vQf/Vrxf75rabmJ
 au0Y3m04tF7KTIOt42vm921YHS/Vn8TZOIqBhGdWi/B6359uZCohTAqyFBd32AsPNplglDuSmiX
 z2iGo3SyZuYVlMED0ZVUHX582e0V49HrhcXAZO4T6CJKG7mSw0hdX3n/55sGhyUWvjeQ1i0HPgO
 7ApmHHv5jQqksZcOMXw==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=69785736 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SW487GPSND6qsctmCwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KgWrTDGYFNlrg_-zyrCTmjIWzp-2Lr7t
X-Proofpoint-GUID: KgWrTDGYFNlrg_-zyrCTmjIWzp-2Lr7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90648-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4605D9048B
X-Rspamd-Action: no action



On 1/25/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Sat, Jan 24, 2026 at 11:05:03PM +0530, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on Glymur platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig          |   9 +
>>  drivers/clk/qcom/Makefile         |   1 +
>>  drivers/clk/qcom/gcc-glymur.c     |   1 +
>>  drivers/clk/qcom/videocc-glymur.c | 526 ++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 537 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a8a86ea6bb7445e396048a5bba23fce8d719281f..20af4340b08f98773eadcc4a97b1669f51277eb8 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>>  	  Support for the TCSR clock controller on GLYMUR devices.
>>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>>  
>> +config CLK_GLYMUR_VIDEOCC
>> +	tristate "Glymur Video Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select CLK_GLYMUR_GCC
>> +	help
>> +	  Support for the video clock controller on Glymur devices.
>> +	  Say Y if you want to support video devices and functionality such as
>> +	  video encode and decode.
>> +
>>  config CLK_KAANAPALI_CAMCC
>>  	tristate "Kaanapali Camera Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..a71dfd0ddf5122d91b5ab4427a9e36cdd57f7bbd 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
>> +obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
>>  obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
>>  obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>>  obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
>> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
>> index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
>> --- a/drivers/clk/qcom/gcc-glymur.c
>> +++ b/drivers/clk/qcom/gcc-glymur.c
>> @@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
>>  	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
>>  	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
>>  	[GCC_VIDEO_BCR] = { 0x32000 },
>> +	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },
> 
> Separate commit, description, Fixes, etc.
> 

Sure, will split and add the fixes tag as required in the next patch.


>>  };
>>  
>>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a5045866982554ea46a9d75033537e7771df8fd9
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-glymur.c
> 
> This one LGTM.
> 

-- 
Thanks,
Taniya Das


