Return-Path: <linux-arm-msm+bounces-101264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIJ0HjLbzGlzXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:45:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F83770B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F165630A77F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136DB3BAD8C;
	Wed,  1 Apr 2026 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msl5D8/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWM4Wr4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C93BA222
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032591; cv=none; b=FfvSUaU6Vr6AP1aYenvdrWiphGXYou+87PDx9uTXijPd/X4/yKAagOXP3sONFe/fPeB/j5TV3KgxeH7cHFj+b5idB+/GU9qdxB0qC9sr+Oh4mBc3yuxt0+AzkkHSo4xqcGqQI0o4YJEs2y28/roLhS/RBHPCteAEjqIdGPQLS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032591; c=relaxed/simple;
	bh=sb4RURzUAdCqXijAvVp/9BuaYDqBVppZ2cO+8U1LByU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R66nhHG0UTmZHChtWLIKGzKS11hcYBF/Af3xl3DW/1hUMRDnkziM9GOIQ274igrv3WUQUjUawc77mtZigYjz/CtqPPJ1HnfrIr/vQ0VdW8OIC3Fr3tz1BW6I3CpjONTxnsA/m3uCyzbhDWxWBJSejk/Cc4/iBLXdHz9WKybcgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msl5D8/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWM4Wr4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VFWi1458739
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=; b=msl5D8/dfnYthOpJ
	dbVvsd8FVXvemaeD6nIKQDvACvivDXAz362MYozJUPQMe9BAn7yRkrBI7F37KVA3
	d9iSRVWmadkT/Dg3Gp5bTeJegxwjXkQdgmZNfGiRaOitfvIdOUww5ckJjJrb4L2+
	OljxON1d4RrIS72MTRhY/IJbeJlOWimbaETPmwmWNNUj1RKUp/Be8gfFZ0E/31J5
	G4Mr9MSkIQxbqol+o502En5G5y+cqkB0xzez4YKrsEqHBVWgkHvbLfR5OTTcUs+E
	XcP7LN2zvkcF9waMtDoAQSOcpQwcj6T0lEBJziwgO+tVLS9D5Byfvt/Puy8m4uUu
	8F4rRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg14y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:36:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4bd8e77dso14205411cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775032588; x=1775637388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=;
        b=GWM4Wr4Ek/HtKL2B10YxGrbZt86FHBabc1o3TpLDbc4Ba8Df7U5eoBZJBtSumQ/Pjh
         2sGb7u0PZBLNxQp5zO4dfSpiAFLyFjB8XlKPm0TnJbUZCxyUvxtNd1bmnHGwfYVq0sUV
         xxBFVhex+y1CNpOCVoZVsJ/sd6rLov6BHFHQqhyEOz5ZEhudF56FwDoEiVcUoe7ay/X2
         zuptd3T+A2keZOHc/mJP45ObhrTCiFtQ9MNSGno+iC6yIQZxQfxYBNqShDjmOBTzqUxC
         yHrUmJSBlVfEeZiU7h2Lzx8d0cNMS9l0zMs9sdS1RPWOwYAuW6V7b39JRQpKTpShYwsb
         M1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032588; x=1775637388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=;
        b=dG7gfI8gRRSz9Zt+wN/AqMomgHd+TI+dQbdfqrES1CtSg9132RaZ9qawi/UjM3Yxh5
         JcBc9DBQI0z95NeWmHNgoEjm9craCmqEAiRRq/Ab8kXDJ0S6GpUt+HwzqBMBzCY2EkiZ
         gyBF6KiYVNUl1gyl2VCFzYRwLOc6goqwW1fJP2fvXXS9vQG9xNB0rwJvFdF42EjpLue9
         EXU6i+WCC3mcomwPqTxZ8zM3pwzkqYlFr6KXcTAD/9BqLCBGePsn7n+VV2hZE7LaWezG
         YGPYa+bByF7aR7KTimWWmveG7Ewqmkmv+T0FAUOln7GkphNbAF9TRXYRfjITixxVdUH3
         JAZw==
X-Gm-Message-State: AOJu0Ywym08S6ZYLt+d7bhr+KsYTs5GaUhUSKDOhkgtzDlaVLsuyhriA
	osM4Ysrl1W05pGVB7PWuPY1PBxYNC2zG5QxRL5AJfIsSiICMJUCLtRpMjT4p4h8FZ7KiT4SMP8T
	Og9bby7mY03cNhfAXama0Dna/PmUIZfWBjgkIUR7+TJ5ildNjM6POfy6lPwubfV2X16ur02Q5AL
	5x
X-Gm-Gg: ATEYQzxUwCIXnFGxfRYDedYHxLIGBbn3bDzWRRrMbGQ5gszBVTTXQmWI013hBT4Zjwt
	QeJg2YLU/xEPrkrwTNKnH9kOIfKTR7lXS7utSuaoXGS5/kk/qaLXD/14eNzOUKPG3uiKxqJT8qs
	qzh6i+3n9GykcpbwBS0hgYHlveDwHMLchhVOMengxApCVvUwqGYWgTH2BYJvdzXFf5Yh516GD5i
	BuJhhmRPkGT14qKP6OZ3jMZMUeEaM6nuitxgWWX+45JAAQBoWowWOyFi6D2WJC/VVVgVJG/caOu
	AnZqRHGxRsnx3Tg7CyZsMO9mzjYqBI4byrcopFfp/08CKdVIhxXGcXF83RKO96htKjIZJzGlZvQ
	29uTJlTUaCsjIM2Kap2pqHRPW7TGm/kPyZANvgl1NlaG4APzEWyYvZZOC/ioBpL+8RrcLB14RDZ
	J1FQM=
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr26700961cf.0.1775032588019;
        Wed, 01 Apr 2026 01:36:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr26700761cf.0.1775032587543;
        Wed, 01 Apr 2026 01:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078bc0sm4300932a12.23.2026.04.01.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:36:26 -0700 (PDT)
Message-ID: <967f491e-5776-467f-83e3-fbe4ca10e550@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom: Fix minidump out-of-bounds access on
 subsystems array
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NiBTYWx0ZWRfX9xZ8Jow9/akO
 4vXDSUkwAVB/Zf96RGZuKTPS9e7vCU2zQVgmZDBHglejkDJ2XvNvdllQI8iHQHtkHjy48B8aoUf
 CFdGMlgOUfLwk66M5SFwRbXIeZSxn7TXL8IrGnNRe6R0ltpkdAkOCRgZEDX0M/67rVwOoAGYAGE
 z1/NGmiIvRxIcFvZ3g1OjtlVtqq0Kk3JWvd+Xgys6oTS7sHQK5a8/QDMt2aTM543PXaMuhI7w5h
 Z8a17xHUcm+jaMSid4ab0dY7VCbaX1e68/QjkVpw+NJq7jOEvR8xPTww+X2fbN8ZS/3GexrQ2NF
 0r/WUQVMZyclMBxLCOzbiJLIsb1JGM21k9KFknvpPzd5+fb7c5Wy8cHhgViejr+Zz+pBYfXJmGY
 XpuRRcaCkrtuj97O8j4C04IcVBCHjCDiEjFIZSqvfuR3PNVlDPfzx3DQf5GgltS8kl8iJYpjjC8
 biecCJKaBV9fp5yPPmA==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccd90d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dHygj6CYKjtJtfZXbZ4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: u9phVGUZZrUJuRWLsUg2qcAPeKskGm3V
X-Proofpoint-ORIG-GUID: u9phVGUZZrUJuRWLsUg2qcAPeKskGm3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-101264-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C51F83770B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 7:12 PM, Mukesh Ojha wrote:
> MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
> which is a direct overlay on an SMEM item allocated by the firmware.
> Newer Qualcomm SoC firmware allocates space for more subsystems, while
> older firmware only allocates space for 10. Bumping the constant would
> cause Linux to read/write beyond the SMEM item boundary on older
> platforms.
> 
> Fix this by converting subsystems[] to a flexible array member and
> deriving the actual number of subsystems at runtime from the size
> returned by qcom_smem_get(). Add a bounds check on minidump_id against
> the derived count before indexing into the array.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

