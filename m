Return-Path: <linux-arm-msm+bounces-102116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIR7OGXb1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:24:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B93ACC50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DB5930205D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CE53A7F68;
	Tue,  7 Apr 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxAByVLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5BRemKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25C3A961E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557457; cv=none; b=pwv0l1x7L5zGZqIYH64Zj5kGoSkFjlWNtXPzW5xVBlx08kgi2hhy17JdpUrbtE7NgQ0o7wrsJ1ahE1qbT6gTHSbb19W4u/drVvbY87vXpsO1MmNCrFYzB2t/3IjBZ+u7+78gHMgVmO2Ey2T+POvxowunDcLStTMUiHAg697v3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557457; c=relaxed/simple;
	bh=WGTFvZ0ouX7deB1LeI5Cs6VpX1ERJhSLG+hx6Xv/bzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gtb8LfhMIV0QRRTRxoZemtqkXXnaM3hBqaxHL31MJRdnlDWHU48abA4gZRCYUZBIUuqVP7U7kJvcFQZwi+iD7rkyLbSpHYE8LIr6GOE0nmlzh0ov+SU7Yx4x2HeztmqOoWD42PE63uhpzxWEvE38e+QlbUCNxGoZDL7FwD/wzvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxAByVLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5BRemKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376d5ak1584282
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=; b=SxAByVLJojjIvjvN
	mgiFXkQHFMS2v8h1z9y2jtcQBu7pCjdysdYakcgxEuwk/C4nliwSkpUcpfVaTK7X
	jhFdylX5SXGWCy9fbeCYL9TnJS6WSk4ihuvuvqAyvio7JXSK8rTWHImMTIkHObDH
	q2JmR4RsdcEDjcyIsf0HQTd1JtTBkNoiUwr62s0bRp4hPYlNz1mtT3U0ABWtUl39
	oLS2EukD/AH+OX3rvhcMNhKDaP8guzB/qlOmw/IbHSViQ16mAbGBMw/p0c/OSb81
	3F4PBzuJFvhQbQM2hTnEHIVJ9GjbXD6Nfj9N9l5tWKBC2BY5tpBTJVRuf7FBuIIF
	MyOkyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t8wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:24:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso18447881cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557454; x=1776162254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=;
        b=J5BRemKpDlNK+rB+vx+Ml95BvXHlxYTTitwE3YLLjcortzhqMLUJC5MXsm4bytfQVu
         qGBMS0IELHuVWEWnU6qkLYiZoStQXrOnHyGYcx7U5aKGs3VXXeGu5ociqiHlDTFxLSJv
         LFATHW4n15PL7oySb9NG/meXGU8eBsWuLY/NhB2cAYU98qoMRQHZr0TYWc9aaamHMzEZ
         agNUG1At7+pG5NGGioVWEETUspCCO4eAQYxI31pmH3uxxsv9L9PR80Cm/JOlOfBeIMfb
         Tbr3M2G5/h2ThxS/BZFRZkPvFH4ixzu1CkP6QjIWWdET8VMZv9z/M+GzrrLKF3uqz725
         6yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557454; x=1776162254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=;
        b=YlHmRVaBDpeEPqBFWNwzp7Pj1q6WIjjlYitDIhxPKWkJvIx5F/pAhF3yKsNGYMgi3G
         vO0Hkt57c8alZHwE3MwC17c5FFdo8sXxp6cnY0zAs5fvtQEklbe4d0NWCFI4JARLOQC1
         c9bDSFx/nq6mITN8XSKVN0nVX5NwQoOxw31rjKGjpwyxUUCe3sCEd/VeCdx7lpsCzG3S
         p2nuUog2nEEmJb33kHrIOxkzZCCQJ1nc4xBqMCykMuXtttOspPRyvJtPsLK8vBv+GM7R
         87rnOvBmENQO3GF+ost+eRDVyTfyYfqG9ErTSUmZdNmjz9kr425Ju5of09+RbVGQzhxv
         /FpA==
X-Gm-Message-State: AOJu0YyRi0g7in8mdCA9Js4e/6holOB6Ejxxkg//4nz4xCHtBLvVNGsh
	5RNaFbf6Lo8RIlcMu0wk5CUjQHB7NoOUG9/T8fnCcmRUEfdENbCvoht3Jaw2MF6UF1D41ipn7ou
	TS5Rp6I4GaWDLZidrYFGlhbdoDXuQ1Jp78GvT6Cp16REXsI6MGOWgYggQTizRpAMln9mF
X-Gm-Gg: AeBDieuGtWXoC4NFSG0kbLrGHT/tIPazRigbT596ic5SHvmIg4vjCz9uSk3sot7DV/l
	cUF/cYaak3QVMZmi3yvP9KHLnYYZuRZlrd2DJh+3vtlDErCB+puPsThP07Un2U5lnB4rm8b7PpA
	/ndbPZOsvN58IlqE2WgZXW7oz5aLCNMRkxFJ5ISzVAULVro/oWgy//DZR/OmixMym6gmomHMP/W
	lO0hVoXCq2k+ZWqzhHgqn11kZS2p21bBsYW1vHcrvN7xb5Tk/5xY4f8eqoKfCIxNK0vm9hN6juW
	I/ft4/F2HuCGdk3aXQuAoF7WXq6W9twuVEsHQ6TO+xYw51vnh/V5vgErW6lC0miJCsY4V1kZqY9
	8Uf2O9hiEdmuvz02zfacwxY3o/XB17WwMxOS2oNsd8MxyV/ntXd0/Eu36dPwI4ndl+m6qjJo/D2
	zCPQM=
X-Received: by 2002:a05:622a:5593:b0:509:39b5:a977 with SMTP id d75a77b69052e-50d62c827e2mr163641661cf.5.1775557454509;
        Tue, 07 Apr 2026 03:24:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5593:b0:509:39b5:a977 with SMTP id d75a77b69052e-50d62c827e2mr163641421cf.5.1775557454105;
        Tue, 07 Apr 2026 03:24:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm4173930a12.13.2026.04.07.03.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:24:13 -0700 (PDT)
Message-ID: <3b279568-1163-483e-b79f-d84421702a86@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:24:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: Enable known blocks
 and add placeholders
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4db4f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-borPC1GNyWcu_w0NBkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX9I4cAyRtm1Qt
 KfcPP71RjtumFE0te+C6Bj6esaq0zqJUaTCgLbacjpLUU6ywLyVcasskoOtq69gRwmAu/zkC1K5
 gQ7o+9iV/KWTWxzwvuE7zR/M+nCGw2Gf3QkHD4vSpDa1jznhKndEzMXuBxYf7dugyBr3Owgujc0
 E9rY1qxfldBFDYYO5ywpzAzDXe3AvcdTRho+qmCA6q9g2EjZ6fIxVk9Rip57ssmLWhioauf05V5
 Tx8Lqp11CN50/dbkGxNcAiqpfuHAtB/+ZJHDozDVY3BYxfitODG7g+XhcYvm6pUEmbKptStjXPl
 fj0fV9hhB7QI3x+4w5Jwu0GRIDt1MMbd95HAJhpLnfkvP8i6KJAikgcTrt04n+IKPdwGjP1rIbU
 S8sFpxS2PmmlxQSOH+iuisN/g5YUB29+JEeDERRwGOGFq8vsm9p0umy3PoGl1+NCOYl3Rv8dtd2
 A+onCNoTgquTT2aN6qQ==
X-Proofpoint-GUID: 1rAMBPWPzPvIbqlSVbjenC2T64z9LCcR
X-Proofpoint-ORIG-GUID: 1rAMBPWPzPvIbqlSVbjenC2T64z9LCcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102116-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 854B93ACC50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 10:18 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know these devices are present; most of them are supported by
> downstream and are close to the mainline kernels.
> 
> This adds placeholders for:
>  - front camera (imx371)
>  - rear cameras (imx519, imx376k)
>  - actuators
> 
> This is very handy when rebasing the integration tree with
> support for multiple different blocks at the same time.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I assume the preset 100 kHz freq is fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

