Return-Path: <linux-arm-msm+bounces-104416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHuDE8c+62nFKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:58:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D645C9FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35DE43021734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837F035B14B;
	Fri, 24 Apr 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9AmSok8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkzW4C5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294E35A3A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024688; cv=none; b=IXlzgyBzaaPjYt93FOjV0GYuvnHXs6/l99mTznP3+5e6S+kePkbxgBHoY4zlSdyw1CsWv+2rL9CQh54TRot486nkoJfLtPWHx43v/b9j/nJZNUZYzO40K+HZ6INrTBqM2FLMWibP0pDW2bjNl3ws8aUezgg+nhgd1lD1fyjB5TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024688; c=relaxed/simple;
	bh=bV6DgEAbKJZLYN0J8dVuJg5XZRJMUGqCLBXs/Tn3PxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIjqrtxBuEVeUp6yof/6Fv6xXSnSpau83quM1lCXdrJBfPyKwEQ/fqnf0N8uWk6KM7/n3mDyZkl2eGsimNHEKqCn+uT0bAHlBr7SyV1X/8+m/wTD/HlmSvDyTDys54LbD1ARAGj3ruwNy7nJGRC41LmRVxlzYL3bUQRRZy0fud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9AmSok8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkzW4C5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8T8A44012360
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=; b=Y9AmSok8kad0dlJQ
	9iH9rVsNRqL1PtVs7oLw20BhpFhS8zoRLuASmq8PQPzgHdL/wjI1rCdCD9duopAr
	oPM+018Iz7nQ54FJozCgV6j94dvGdDCr9zLVJaVmw42tX9Mu3+i/OGQstO1Zo/RD
	3KphUBaYkUdSDzAUnmAuot0k0zyNTg65i3U0GVxTIR6Uo7j5Z2mC10J8mc3VhGj5
	jsEACjmXhX7RqUZP4oArMffGgQoFCVEVQAefNMK+LnRFcCosTEi0ZSbca1GIp2zd
	flvCh+ri/2+I865xpEQdESE3Yktu++9mmXnZIVVLBs/rwEim5KP574L+h7R16lK6
	PGQu3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9uscx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:58:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso69592951cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024685; x=1777629485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=;
        b=BkzW4C5R3Cimu6/tup0zHHHZXz1r/sWuBWLCRQzo/CQcJUMFJcS0YYy19iYa6rN8pT
         LOKoTIiVKKSQh7s6WV/hpT2Zs5FH3rFTSYF2RwPGov/aFIAbCPL2Ii5/CEARSs3vhxB+
         HBzp3bL/5e19DwcJxdJzEC5af9FO8YfAxDwvZA7qZre+AssOaZRwgJSqH1vByA2szI8H
         ZqrnmhHcI0XQaPOgoQ0oLgvoiHUHkfpELJPHr5cj5V4eXzqNBiVnPHJZ8feJgUIFyhqP
         /pkrGl7bWmX+lbtcw4mLns4Am7ONaWaC5dylSNmWhz4gpuhp4Wq5uzGUF0JVPXMoDT4I
         oPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024685; x=1777629485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=;
        b=Vh1/BJYNg5KzVUvtsJEkiQB6iopQpApkzmQvlSDpwiP2AnEmYxn/R8QcPcBiQosFFy
         Wm862uvtJgSbbc29+9fnKhY/YhwrK1iYMyIcxGVw+uWfqwxU4SD/bDv0UTVJF6sTkumf
         c9WsE7YBFyDosCpdnH28p0BG4+ygHyNd0CjYeCXscmTpLGpMbG6mXejfksyb98lpWM1P
         Qxcpu1L8wTvwBXNylM/Tj3o8Q7vKncuO0SOY9AkY9+J4Se8zB/+Rk3a9Dd/QiVJZ2qwS
         s0VLWpKS2MCi240fi8EJ7CIeznc/AqYxSZ3RyA+7pPQfqI6lppfWc5X+zXY4e6pAg+xG
         MbxQ==
X-Gm-Message-State: AOJu0YzSZDcAPFctU8pb02f0uHuW4XOd7ioH38PhdNHnI0UfKQUMizCU
	qbPTeFSWrtx8X/c8Zme/3kvmltDTZo0Mih5J3at/HTnUQb9W/gY11gPGFa4oOExTinm1M/O+yO8
	IjgccFOw+GLHYlwkpLow04AreVptpAquTPZYL5MxoMX/W7Lvv6i15uGfYXYdJWMAEANlG
X-Gm-Gg: AeBDies3KCVsmgQvTIkL+AJKMtaOR06u2jrMGEcrqKHrjAavT2QKq3DbC9i53wYll2R
	ArScK6vzP6SdMDf0fA9jkwYBruIErxe1OwmAIIYuiE3YnlGMZ/QuUfrzBfCaqFAtmiEksYMuPGB
	9qCWaeXkv5Q/A4Rmwq1aasHd1lutRqcMZUkC6FWt6HlbpEGI5sX3mc3UIXmb934nFg7ivtxI0cS
	SXIN5KH0iz7zcg7ZrPIYbRUz5zCbIGVO25Mp4ghp9UmvtyI3Kv6ePjlOSbiZn1cufP+/lx1M2Rl
	I/rRs7lqb0EhXecSCplKzEB8jRaUr6i9QHPOGJype19xQh5ycSfWwL0rz94HiQJ7EpQPNJPPfXQ
	UhpAyGLBuL/dak9Xaoe2x6hB0MRVZpV0KYkncoypg9pxjqXWS8WjJNNvW1KM4BQ3SYx/Ub7F7vq
	PJO15a3w1JctbqsQ==
X-Received: by 2002:a05:622a:144:b0:501:4767:a6f with SMTP id d75a77b69052e-50e36c08aa2mr313961411cf.3.1777024685416;
        Fri, 24 Apr 2026 02:58:05 -0700 (PDT)
X-Received: by 2002:a05:622a:144:b0:501:4767:a6f with SMTP id d75a77b69052e-50e36c08aa2mr313960981cf.3.1777024684910;
        Fri, 24 Apr 2026 02:58:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4861717a12.3.2026.04.24.02.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:58:03 -0700 (PDT)
Message-ID: <086fa582-082a-4339-9168-479f3e92288c@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:58:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX7Y/EuZHzBuU3
 WQfgmfe1vncK4IY2/WZwZ/C4hNDtIs62aIvfaU5aj8RrzwTw3tdbXRaGfuuQBBeWPc9zHTLpp/C
 96WFS2NVjt3Ipb4F2Vv9eDIukBrO7vwrntn5Rax2SlkLj692aYW58ajZfb4f/rLlFISHcNst5ji
 AHQ9Zu3h6lMypskRGi5Ffa+w4JP4pghhUAqW98wJLh1e37fy7mThq7mH4HIV640ONr+QbMMmY/L
 TGkCDinBFSg+3G0mUTN1a7AJbNX+ZflSKzze4bM7pHPO8BYDgSQlMQ8cL1E3RA+hosUaPtsYi1F
 9uoDkfIAtMUKE57baPr/SThdDy6nKXRqwao/HrvkTE8OQ9I0aj1L1tC8FSvj1UNwZT0iuloW9tA
 AaPSdeC8He97Ij55eplEzYyifH3Kk+Grbl99//lagVZ05HV8syzPC5hxN/zc2htd91xfAb1oFxB
 dq5FATK8IyyFjstb4OQ==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb3eae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 74IjUh2HeezrLTPfehazVfwURcnwbdtZ
X-Proofpoint-ORIG-GUID: 74IjUh2HeezrLTPfehazVfwURcnwbdtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093
X-Rspamd-Queue-Id: E00D645C9FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104416-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 11:07 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

