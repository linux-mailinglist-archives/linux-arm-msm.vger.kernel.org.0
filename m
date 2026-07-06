Return-Path: <linux-arm-msm+bounces-116836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZxPOBGarS2oJYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:19:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A238D71129D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=COIsu9Xa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Am4KQnsB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C6403016D11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5CB3CB8E6;
	Mon,  6 Jul 2026 13:08:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29687420898
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:08:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343283; cv=none; b=SAOdgogH4SdZHq/m9fX5L4DK6bYpCuusrFqYqu3l11FChdeqGcMTfu5b8aVlAVCLhNBaW6HKKsz9dFe/F8myH9yRSaXVhzcDzlipaNrRULdXQQsoG9Dx1ZlC74jhQCe+5LSWrwJVbCmWQ/b0Bz4fDAhsIxMf6mhz/YsV7yOezZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343283; c=relaxed/simple;
	bh=hTyksoAcTNb+Y+CUq/HdPXZw0RuoUg+1Sz1/5923wdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcQyfVPaHV49V0aEXHCdU9T7WFy/YJ2mBZTgIT9SGWp4XlQ4lguRtSUvRru3kDSCtQN6fjN1ouB7Men7MtNMaW8T2RFAcb4Bt97nbY7bRegOoJMtjuAQd0sG4SRTnI/ZDnuDt6gqjjpnhraoZJx5txl29YeCdeHRAjDj7PRt9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COIsu9Xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Am4KQnsB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxAPn391078
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=; b=COIsu9Xa1aol72kf
	XoyJCmc1ttvay6wZVGWAQ7Md/XVirBORzuGdoOSEXoqeDNcNlNWMlxWOaN9ERKeZ
	ix6eI6qVTwLPwIh3PtAlqXyyd6C7ZtEm4SbLAcuQBPoUxS/Tstixlbi+BSi+Trdd
	U00+wzfE8AO8qIkENvvuv4HCZrt58et5tjEHbVvEkcBRvzYeJneME9cNVxbjhUHn
	6Vyh0HdOlKwPJfhdzOeNsCqavSFzWtHZHehdTIkEmBlA/2WQkC8ccO4Ky1Jxg5g+
	bs3UuoRSP0DPfAHxa/zLd+SAt2mShE1giznTBT+kBdmAdaWrV7PW62+Ex0ssZSKW
	9q7Fjw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgruw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:08:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so106794137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343280; x=1783948080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=Am4KQnsBt8vOdkHBYY9sS8FwsvA6nwyRPrTP40ppoyPRrcT1fTVkv1RcWlrdQoFwy4
         RbZSwMCW9nNdUKPcS+S7KzLSvU1x/XIP4HLwnAPzHPMf9sRUm3niU0S67Br0rRqoCU7v
         9laoZpkhJTD2x/NrU4C8O86L3sasPG7yy/16BGqhxv0/5Y7WCM6oE31FQA17Wj+p7Hgj
         RvL1ni0PotvH+0bUVbnpoOetrq2YYvotR6ei/h+N3XVTRAAIIPULR+JQ0WmEOZBvQkSx
         hrJ5Y1nqD7y5G5DTiANr0GUX/sjHTzjpTGROL/hEkQqlxKQdi2duepnZ4TAcy5kgnixu
         kO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343280; x=1783948080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=UBozo2dNUy8ETe69I6h7MuVioPWjp2lpP/uPpUgC3kVkHITcQdJIP9wg/tR1pdRZpG
         fsWADlyQpkXRtnIQ83zunqegzAvT37AZni8Di9VegJJOCb35Z5ugncQ6NQbm2xGECM5M
         Sde+28hcGWti6e3+OpNpJnGNoJvBMnOj53sQYN/eSvcJ+NboO2vBxtIfBOxXM1cPhKIK
         rwhKNT9jI5QD5JlJtNvYcodDgYev4Q0doPTJPUbYv/O5aUtWcIzgaM60Y354INhxt6zM
         Qiy2JecO3xysCUt5bC0IM1NdKn8viBSPWjaXcAMQulYwo7csjidAj3qBzCmcJXhact1y
         28ag==
X-Forwarded-Encrypted: i=1; AHgh+RoS/LJ6COIk+A4oIvUlaMl+re4AdBtdkHA8Z6ZZdV1GG/tP2K5nKquR3ickVvKny5NgKvmATl1pZMVOgt50@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNcqiJWHSD6fDjVjzukCDCQXRmc5HZR61O9H2D2v9Y2eHwu7D
	UmTdJ6Mg22mRKEd9w7J7wab20+L0fkhgA4YUvPXXpW5ImAWD6dpYL8nWuptqYf14ozFJV5+50Ht
	hqvhiXOZ9j8LksYGKYy2TPv1Y7sTHQcjU6Fhf5+tL0vdKmEqa5atM3y9z8bcqrtrYeJfj
X-Gm-Gg: AfdE7cmbmLWn+McQMtR7y3Tg77fgZbTmSPeSuD6SBIoyan9U2kXlZHecNb8NJnW9Ztl
	d1701grsMrJeYnb4p34rSOJB8qjM2X8ijUOL9fxuKsXgPXK4DQFIjMXht5p6ABJERqxy/42xVUd
	sfWe+CLcmQpbrxdcttPrMNctsHeGmv95xODYYjqmCMpfC2jr71pni1QOIIqW02mLIkYId71u0pK
	T3y1Lmd97TqnebG1+ObAplW6eXyXTvz3/QTgoEDH8QhGhzsy9b6u71uCKMlzqCoYXSFbQ0VjX8g
	pCYuIbp5xkFCEy3TGw75r2IWKZtY10RSwl6yV2DxiJttb134ok7eXbIHKiKP1AoSpjQN8ZroNWr
	Hq6Seg8RnQrcriYIDGaGbHusO6e0bSruLRr0=
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576130137.2.1783343280552;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576108137.2.1783343280126;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091cb3sm757536666b.22.2026.07.06.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:59 -0700 (PDT)
Message-ID: <1abf5f75-730e-42bd-b2fb-950a6c6c2763@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GmZbpK_lv3FNuS46DdczCAMUHbDW84bS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX16OFFUcilemp
 1EQ4sc2YJ5r7XNxcmGi8cbVXNXXTj0T8gRCL9L2QQktqPnkRcGbOqHP3PyeZPSIYT6ZPgAM5p49
 ZMbLvJWIMN8Jeyrvd9+8ep72u6ck78ctvOiT+gjYBFP4ldqYBmGPgy4hoTTNbtTiaaG27trjsK0
 xGrK8WG8EP33HPRMBftuhl63EMjxMDrO/GJw0T7x6/vjvfxRvsTPkXDI1aAM0PRmWDoVa3U2LRD
 UEIvrduvKB07tYbLud+LNvMh8lfpsLQfs3/QPFR+3iM/0JTMp+bPMuE150RQCfZsjPIZSUXJI08
 8eGayeEfoJZNSulhEw3wNrQt+Q74fOxaJIgwMjtQkinM2Dy6nCy/ubwMjW39t+Is18AiefM5qvZ
 zuyXqOqXongJZEzIWVtw3l2VXkrZnnIsoswTYbB1ke211z1TsMH8IRCOtLLgSg0XIKqMkCX9/hK
 VM8lNhs2mFtTvsesqHA==
X-Proofpoint-ORIG-GUID: GmZbpK_lv3FNuS46DdczCAMUHbDW84bS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX1S0okmwC5bjm
 2U/N97DmulV9u35y5uFJuvNAFxQj+jrSnhdoyNpFHmdgT7aVKkLydSkgMzsVNG42jLFLwOL2+bF
 wLjgdum3c/FsUHFVsnTtUvG7982WZSs=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba8b1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7Mhvcmd6cMb-wOCvpSkA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116836-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A238D71129D

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

