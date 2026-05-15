Return-Path: <linux-arm-msm+bounces-107780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPKXDhD5BmpoqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:44:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22454D98B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78EE631C1B84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253383D3490;
	Fri, 15 May 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llmYrdTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j16PCA+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4733D332F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840700; cv=none; b=HZuzkQ4UtMY69nZvBdQJ9QDh0elBgUp3PcQFCcIQ/jDAIm+hK8zAVH7bqT4PsOQC+8FWQJNS+it7ypagntPzAZ/njJEqK2waJHWkJbhqCGjXNsNVDxHZ234CENFWpZEm2nHZ1K/TpYhbUN1nGqTTfrF1EeFMVRIaE0qERTmAMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840700; c=relaxed/simple;
	bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUpYFsDANgpB3B4QJ1Vi/8toCBjrajflvxJbdT0xUrdlvEGYDe2HoOoHUOPGdxXHPknJYmhINXR2doYH5ZzkcdCh+2+ahfOMWl30OykZEkRFOs6eyvPduX7tdm0iT4ZVl5fIfjP+iNjsMUkqVM/NYxa6/w8gkiXX12pToU5vyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llmYrdTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j16PCA+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4oGDv655515
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=; b=llmYrdTFsnjF1cFw
	vx652tQFYeJyq7+MsR+c7pP+zZG5eZh7sPBt8RiuBC6m1btwTpoR5qO3LnmASLuJ
	cOKiFs2MJyEBU1QaO7BHYLazANHT0k5DW3z2+QBW4sn0hYO6Slh1JqUrmdpOAHg9
	a4bJZ2wX3VAHHenQbFx1NicjJsJu0xvMg838+1Iqqldy/q1uEfKfsFRcI7dmzMIV
	h6D/hzadeRvAEG3uN2SC0Oiw/Nxi02rjBobsAMlMFWSjFXrMxK4tlwfM7Z/1gazd
	GZ0TNM/eC3dkwS+7o7Yn0kHFVQf/E90ibOA+iy4SM1ZM4VP/70FAP+iQOsqcJQcI
	yyruUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptvqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9f1bccd7so19146771cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840697; x=1779445497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
        b=j16PCA+18YUQdiIjDY130qdeaK9IER8GnEKuIssoOEDcMZl3Q6fVkZpOuHP8RZPOup
         JAcdH/2rWJY2Hi3HhIBinb6ejFR3xqZ9LHqlo4FMM1CmSzAiEyEwUwS4prwRoQeJ80Rj
         uV7tkDquLx15dm8Y8oDBDKjsMs4InHdJutc1Bt8E37r12yb53fqp0B7WnYQpgfcyyzYo
         T0f3g+j9QyqmenX41A5X5Toahfi3WlGFVeWVzyqi9RiJT6TPpwMPqM9IOPSrQ7afnKzF
         9rkjT2I9G3Wx05STX4iBKQpFjB0HRmY/0PVFai0vC5yEwf9dh2BteIV57P7v0uW7uVnw
         YlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840697; x=1779445497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
        b=XCZsf/nSFNUNJC9HHdJtz7qZKENYktmh0vlfc6sWoF+9SJX3WOFKqR/e8BeFMDSt6I
         0LCxmTuYDNyPNS7GS9ttDUypR1f0G2xyG65VXF75vnTXTNwW4GxbYMG4xy8V1nUTJ7OR
         XWvevKxNuIzYM7/el4dtN5163XGW1nRFTtBZwuk7CoPOoDJK66rMQ5TqSFOQ2DX/vuoj
         8XqcD/z04n0XViVsRZ7qjaI7URJ37OV08WjFSO/x2HM2sOW/JmFSmE7Tin5cN7Iag3ZL
         Ixc5rHJ2/Qc4A487y6+S4Ih4MIxjn+SFk1trNBFWT8ARcFIVMZSZb8xCqgHUhwg879NY
         u2Cw==
X-Gm-Message-State: AOJu0YxLwrei7qFgCmrVKkS4g6kzSKrQoCMnGriGx3tadX7O8Hqf9DoC
	14IYJBLZLZHJrskn1azDUM+l/uQBVsFMkR24u/ToBxQJFhFTLIVcXRVxTXA/XWOd8NT48yTjP6R
	M34EcZU6zIDuNc0yKPP/f0knGXP+eAzWPQVufyWUdMasfbIpInpva2tuDZ+56d/t/JeTE
X-Gm-Gg: Acq92OFx+/rSKekpfao7VCilL5Jl8GbarjbBk7K+WraOgbP+pydCkUwuD51NzB/7Xc1
	BGwlJoIru8EaJfRwFr9fAdRpjmkuoWX3nh13CEti7vS807ImOBrqA01x+ZMU6zAttE60k5lRXoL
	q7Pdbh5epkH+jnx3WFb0AYbhsSS9l9MP5kxWw/zTarq3So/mVsOqle7cZRdv9Qr1R4QsijQ/5YS
	wEtyRZ4PpzDjYBKfINyFgpxId5Kg7gF2Ju9eoAPMTq4jJMnMopPJ/10Ht3mXcQ1EhLLJ8QQqB8i
	oPJSu3K0Hos1mPhnqkFApiRIIlToeawv68liIqVDIXOPLOlsg+pPwcR29Vg4PVcSN4xcfXbnwbw
	O/NZKnLsOtGb7PwoZ91aWLTJol7YycsxuyCV7mVN96hBdWHOnLB3GttkXZhLvcCmeXkqDqV/EFl
	gGOMU=
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr31631741cf.2.1778840697400;
        Fri, 15 May 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr31631401cf.2.1778840696952;
        Fri, 15 May 2026 03:24:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e973sm1866130a12.3.2026.05.15.03.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:24:56 -0700 (PDT)
Message-ID: <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hu8bQhhLi_DxVsLtHWjskPgPSnC_7Wa5
X-Proofpoint-ORIG-GUID: hu8bQhhLi_DxVsLtHWjskPgPSnC_7Wa5
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06f47a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TF-tFn1qDOM9O-gCeBsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX4rw7SgAJ5PU5
 l/n40x4DCwitzCv2eQcov72hMM35JK25nWB4ZEiNWUbyXV8qJtjin5v+NhEVsmXUT4O3v1qnHk7
 XosFHfHGEXZKjCnQNBridTAzkSZR7xhxZogT3/bJ+AIraYbIN7k7rpCUHOQbsVUkJTpO+0zWXrn
 azln/xfMLL3lfWXVnBrrn+vTmMivs5doqRRUl5xeTR0oZrhCdGBI/jZ16AlAaByaXIImCtOgYJ6
 BDRRuGw4rp1Hh5m/ddtrOr2GH51poLD2l7loT9yrCukNw3RiIQlMbYbXVOHQnYumF760+KTo6/X
 cbFiWhPDnAIvDL1KBsbtv5VeRJDOM3R6SilC1UqUDU4DSFcYSAdtTN7t3FID5WpcswEjn541FT2
 1HZ5CEJHmQwNsmr87pv1/dhVuguT+NDtMxzmqaD++cluVwRoVd7sVh5xWBbWmxDTe482YM+K8hA
 38gvlU2FCRjOiY2VLMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
X-Rspamd-Queue-Id: 8F22454D98B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107780-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 10:30 PM, Kuldeep Singh wrote:
> Add UFS inline crypto engine(ICE) support for shikra.

s/ufs/SDCC

Konrad

