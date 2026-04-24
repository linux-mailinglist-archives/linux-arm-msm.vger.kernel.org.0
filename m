Return-Path: <linux-arm-msm+bounces-104458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLezDiFc62lGLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:03:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EF45E27D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97E853001062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EC1282F36;
	Fri, 24 Apr 2026 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaoJALgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzfPZly5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB7318ED6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032217; cv=none; b=oO50VaqP06H97yvplpBJKmc9PngkuPbFyx5lZpSDd8PVOCGh6VeLRq4x0pvlBlqK0ZlV1eWKxJ3QD0EAn2a/7Z6pPXeEqhijAXLJHmwFKuyhUo65Kt6IQ+MOlP+zjI5XWmKExshqdRpJlG1/0/7W1oEvQ/9jf8nJ/3gWPj6eQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032217; c=relaxed/simple;
	bh=P03y8Cz/PQho1qaJY+z7AEvcB9WS9ziyAKvPnj3HDQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RApyf4QsNH5Ys24mex869pGXU3xZyMg5G0DHpSVfpOZjrTIN+MsOAeP5LUpSRuUuYXGUqOJIuDFwr3gbmEBde+qypwo5RhJIs8a65etnG5kOXaVT6K6HU1GZkdPNHB3chGyNhUqAQpMOiRQ+GIRb0WAAfwk1pzD6QexQKfs/Dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaoJALgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzfPZly5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9ANch1533272
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=; b=IaoJALgQ74anwTfS
	qnzcMCSb9cSiGZB5L14Gt6WN9GPIkXtjkpy3yh/+Prl0nhegxl+oEAu3V4x4pR9B
	nZFFt+aTha0RYuOi1tR3b49G3Vmwn4DOCopva/o+7aaHE2FQVEJlHxBqHWZRFrTk
	LygjeliOXF4YU8UWRl+mHuXAZm3QSiOA0yw1r1/GHdMicWq0+B/ZkCm+m2OvUFCX
	JM5KSg/YTyxVibTDISaCyDmD0YZeO1qAVYCfykn5Skon28TRTUgDIHWsSrNqTiPU
	2E7rzhcsR6KOKqDpLI9+6yn96QT5YfnLM6QVWLkTbGww9jqAIEAk86IdABczP4gA
	586/zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26m1th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:03:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8edcc885cd3so120605685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032215; x=1777637015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=;
        b=DzfPZly57mHccVfn2gEEQnpr7jfLrjGtM6vLXovz5GdJJ83F5sk4IplaG9AnoajV/M
         9OJaJIWqMjNMHmus5n9AJMoGKLuuJwPX5XkedMScnxdVGBgNKv4QopmS8OZh3Daz09YT
         GkLu2vxkh1ECAcoXslJT+BVGb5iLyikiXzq+4PA3Kiw8wtiadnByakx2V9T2UH8s+Jkr
         x4gK2TIAfoAirE+jl0FskmeOawniq9vMe2J5VjBzcP4ZC/J/BDVhleHkuiZMKb4IziPE
         O7180PGRKcmiLvS/DwVZnDDErwIiSLC/DPeTQFUfS4lOAbzw1NnyDgPLEPkfOCNMO3XY
         df5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032215; x=1777637015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=;
        b=qLTLwFvit4zArEKK6eEFHVatBbj/duZjymuAGjhLlkY/D6g3NaU7u0fluvjEHQpKBn
         kFKH3znDIJnQ/1FF/5qNoyttsX0ehmWdDI63hdsbxIAVMA8n/kk2iQxoROjPvhUXNlBw
         AsaCIfh05lLAfL+djsO8E7ElPbPNRfVhVzBSG7mlRLoCKxGX/s7e4b7ZGdXgS8n9RyP1
         t+9B89VhamS+ZzQYy9pyhOCDzr/bwOPTtTyDS5JALTkqTAB5Gdr8dY7UKVt/r05e0B3U
         8VPLmRmNj+opzC7Z7TsvobOHj1K/bQBGRME5XGQtcEsyjrSWRgE9AZDLMWsF6VGuafY9
         sJ/g==
X-Forwarded-Encrypted: i=1; AFNElJ97yKAvGUjseqwPNHo5NvOA8IvsGfY6TUYWtr/IzcRK/AbXKJcIzO/FlUI1fulNgastUadF1vnK7mWAdDp6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHc0TFwOnmZFNHQJqP7kfxOsiD6qEEWYZFNdYk+/URnh4K8gVe
	d83Ep94gaXCtLLNGj1TmOARIEN4yNiDytRAsAC036KGR3g+b4S9HzpSA2wERbe0zJqEZjZGFmkf
	YBJm2C5Mvh0onLBatbPudX4vbSPHE7T/T3u1zZy8d/g3Tky5ti0VQy/0NbknS9S9A8E2V
X-Gm-Gg: AeBDievfCaR7gPq4voNoPjjCZRI24OVDNpnVlj+6FHorNcEqaz6hka7zxr5Ef9hMuVU
	sb1ccLOTexQQedLpZVihuew5oK/ZjWowo7REYXlm2ZFV5PCNq6UYpI92hamdkpzZOYW8Q09BsN2
	2YWw0qS8bHH3i915YkKShx5FZwV7f0ESR2lZYwIRQmXQTjGEjNMkYeSVkWs9vEqdT8K2b5mynlt
	LLJSOkH3lCjpEof6BvqLURUMrlxB7rDEj9Igu/YwZ68O2W8WbY5kXrIGq5BlKT6WsOcTXB2ncVc
	7K48HWafZiquUm1H6A04TtTTMr740N7SYJ0pJAAOUczdLly9aE1E5f//pdJPlecj3aPkYYHNV4w
	scRRjgYDIIBaulH5U7ckiVGQUmOrojozPEHMDmNCO5rQRsjYKRn/PF1rLj/5/u2iPCYfOER2gIT
	tYkb+KQslRij8Aaw==
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr1607168585a.2.1777032214980;
        Fri, 24 Apr 2026 05:03:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr1607165885a.2.1777032214518;
        Fri, 24 Apr 2026 05:03:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d51820sm5008447a12.22.2026.04.24.05.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:03:32 -0700 (PDT)
Message-ID: <4d1d71e2-18e9-4262-9dbc-4e05cb17d5a1@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-3-813e18f8f355@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-3-813e18f8f355@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 26R-YoQecrGfaBOg_l1pDw0QjpNDCoeH
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5c17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Vc80FJqyMH11bIRubAIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 26R-YoQecrGfaBOg_l1pDw0QjpNDCoeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNSBTYWx0ZWRfX1ZepGaRwgbsi
 JrFzk+jVPA4ht8CRDFveey2hgTsO6hSy4p1VYtgDv+Y2R0+MkD2WG/r+iGg0BDP3RRXbdz2heuS
 uTi1Mu85uFK+ZydpCKOC9Xs0tERFaU5+8hJGp2NLsdsDFrvaN+aRO3ifsrjdviEWaKTg4eGqWhV
 e9rtanBnktwJedocD65jL4UKGC3ybgu0bZL3TfgcnqBFweizLfWix50Z40stM1gTtQLhTjOExWt
 ea1l/kD/kaXmp21FjIYcbbZBDPbQ/6oWCSBfszi/ubwjm7Jvt93kOBuR3HotiAz+hKyDjI0/1RU
 Bk7JaON4R4Y1i6ffZj1/IjXjrFbw6O36+R0/k5T4xhGecmDKEzQp1Ks/QrT0/7sdHl3aGW+koVE
 ef1EdxFctVaB+zf8zAERRITa5TQdUmKlEsx32UHEtixWbU1e9FaJKfJVbH1FLoUd/NaWI8Txd7G
 iOvcBAy90J916OJadpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240115
X-Rspamd-Queue-Id: 847EF45E27D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104458-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 1:34 PM, Kuldeep Singh wrote:
> Add qcrypto and cryptobam support for kaanapali target.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

