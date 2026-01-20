Return-Path: <linux-arm-msm+bounces-89799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K2cKUpZcGlvXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:42:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512A51206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1243A7206A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCCE3B95F6;
	Tue, 20 Jan 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqbplcGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZCY3Qcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2BB3EDADB
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904940; cv=none; b=VAVnRBUWaiLixd+DIfCN0DztgMAO17ejFdQyiS8kQsgyFTZd+pjOk5GWO0p/qr+Oi3xja6wMIRXW/W/VW4Fu0X3sa38hwylqFnsOd9k/zWIhs9GlaaqixZqWqQy/y7YIZdE1FLTOu6YvWTQhMGZ2f/XTu513LA55Ukb6D6Vsl80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904940; c=relaxed/simple;
	bh=L1TmdJo1ckZ9gBLPk7jpli633KbtqW/BImSVBp/dTKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9ElL8BN3POG7Ue0NxXa18yMbO1wT2OBsDTLsz9l1JsK7DwL/6AGZ4r4VfahFWibvzuLz1bmOdxL6D8naJcYTVZ8CVelc1sD3NV34na0qaHKDd45+Ix9COkKymv0cHa7ddrFfGEo9xj6v/ZsSytAxdXlyHFUe/OVhAW9n4WA9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqbplcGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZCY3Qcv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K99uOM3256460
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyrwdFF/bnoi6wfXW/LmdcxN2ggK+WPvoYGL0cYbldY=; b=XqbplcGmdBqo3E2v
	c2o1vLqq8S/0+oU3rNrRFGKhqUK5nEVtyydmz4I5t8qnFFwfs8x8pwgIZHaLjMZ4
	4m32uTSbvJ+W7lgPf9PX8NeFYbe1JTGQ/zjENKIs43Kbs2gcdoQj6fw/R7S6jFa+
	VbMV11oLGTuvQEBGbfsh3CWSPUgM+KxTWXquYA83qEXXSdbZnEBVHjCrw6LbH5ba
	8nOBONyLTg72knw9CmqQIIk7tN5Wi/5o6kgatKZ3+QVWJcwhVhrlAXhvh4oVfgFl
	WLyJeLybPk5E9LzX9TvDvpX7CSvemuRz2mkIixuoYnHTNgshDE/s8Yx32SzYChmK
	ZLGccw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7r7k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c532029e50so176042685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904937; x=1769509737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyrwdFF/bnoi6wfXW/LmdcxN2ggK+WPvoYGL0cYbldY=;
        b=JZCY3QcvOGPn5h/IbAElB7AqnLYLd7O9xno0iULLn6gazOIzLwjX6H0IecesqNqN3R
         qCiPU+4dOJ/rBblfYvV8veQEl7fcUXHIPihv1jwCg1glPFCggcAa7SaQwkAiRkgNB/xj
         4aWUd2o16Rc7HrvVGU0I+KEG7Ti697POe/Y1vOFT/i4HVs7gZswb7TgGQ1ZDG5cl9Mng
         I305nFIjHeboGPsePmzJsBZGDHW8XDS3Xu63YFXWo8DDq2Z5Lv5UChtgHm+BViPecME+
         DpVW1a7bFKf3r8JOSEhd9wlZ8uwHOdfvrvSaMhskZGGwx5ZCij2xD/mqn27QFFnQFJuu
         mCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904937; x=1769509737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyrwdFF/bnoi6wfXW/LmdcxN2ggK+WPvoYGL0cYbldY=;
        b=L3Ly25AaTm0mMi3mF+PTyw/g9KtSJavX9TurdL268WjNzOWBQG8EyePlUcMt95yANc
         HwwI2Pr4RgtKADw4JCgPZjWkB4zyr3sPc72J0RGql1iX03zH3uqFtESDPzmVRPSQVCqN
         2GsZ3LtOoeyieYTOn0xN5LSBFBahoXqiU5qtjbxrftXVNhlbNQDsyJwt7WQoZXFHht9a
         jAI6j31bBMup6DLUqLpSc8/ZNKg8aM/mpbCCgANbeLYjQx/8UGZlSLg4snQP2ObolcGb
         xa0KDbJACX3xIjKJ/XAHsTqXAd0ZpfLfjQyUJ+9F0Was5Ahl4z+xUzSxyd/M4iav3T2T
         Bi5A==
X-Gm-Message-State: AOJu0Yz2Kg9IarHXRBgpvXKnIJg8ISD3Moarny4Ta5c+6RqbG/vWDgHG
	mFLuPf1Nov7UdjKjktdO7ckk9L/1O4ttad3UmxEu0dAIcIEdzqDwsKm5GpIUZuiHdu2sDlpgK8k
	dmxMwR8Wq96Pp8sShyw9NdHJId8TV92j4qOTpZh2xTVtCTV0ebB/80qLpuiCc/78AP9nu
X-Gm-Gg: AY/fxX7/fIvUNpPvrleFQvuZAJ1PBJDymk7w8kG89+ThX2uKs34DPjvypK6k077LDWH
	TebdverVETDuc0XYC5sKDGvwbKZxVKWs8aCA8ZvPhlqaY7hXJyMAQWAnf+F+OjB3OnDj+WmsV3Z
	lEY8xaaddz+vJwKTwVyB89wD6A6ogjagVt30KGykSp3kXE0uJ/jsLud2CIlqfHn80JuZ6ms3jAW
	W+c7/HuLHmEcUnUCw5UILI7aQd599trl7FV/xefXDRk7mKG02HzAMHt45U4BrkxjaimeC9Jg0R7
	PL9oA7MVKirOpEoFq4q0II9i4DjAtPoTQj9f4Wfrzbv93usynvGOz+/bSrHzdxuqAaZ8R3A6jJQ
	TrzDrVqNJzYlTscGVsLZYF4bdps+vfq37gp7hi029ivPIkU37JWItHhsFgJpaQQBR+Dw=
X-Received: by 2002:a05:620a:468d:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c6ca45e8afmr210730985a.11.1768904937034;
        Tue, 20 Jan 2026 02:28:57 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c6ca45e8afmr210729785a.11.1768904936529;
        Tue, 20 Jan 2026 02:28:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1aesm1388258066b.61.2026.01.20.02.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:28:56 -0800 (PST)
Message-ID: <9d9f3712-75c5-48a4-9db6-095d3297473c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:28:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug
 UART
To: nathbappai@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
 <20260119-xiaomi-ginkgo-features-v1-5-3c8fae984bda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-5-3c8fae984bda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696f58e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=xHxH5GpVV14gQb3VaR8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX2rPmRd8R5Ux2
 h5KAFV6mrf9IaPatTuqdoAr4GHpukaEkHiWEkWhzL9kcaN4aSL9rjlebUptQUMGFzBh29jEfgE8
 plFSkqT+oQ3H7N215QupUSmk4wSdY/2y22u6zDbH6KWRX1zUs1s8OpGZwI/yAKJg1FEp+BQfuhS
 CDPXpgCJjNcerv9UhyeTJP9QMtlEtfedhqGQUm9l3OWgYngcq3ODnRyLc+/Dm+uQieljKMoVf1H
 3hTUhNY6YqKhpMXx6EqdTTWYb2CTw51xiXTOUa19X9a6tljRJDfsUku30bHAMhoPFEYzHp1nRr0
 NUyqNDjkEOyKclOA3cOrZsrWw77GmD71zK+35ummjT9tvqHkihcXlMtQ5dHNdcXL0C2Olkfdiq+
 dkf5R7IyVk5YGFocegHr/1DKK1RzMj/U8Qw180HX6VtZFQa2DU5dek6wupRemPbRHde/BscWxAs
 pHuOI9qx8/Kxxp9dUkQ==
X-Proofpoint-ORIG-GUID: TPC-QbkJoYyIZOth3uzBFlovIAPHNFwd
X-Proofpoint-GUID: TPC-QbkJoYyIZOth3uzBFlovIAPHNFwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-89799-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2512A51206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/19/26 4:13 PM, Biswapriyo Nath via B4 Relay wrote:
> From: Biswapriyo Nath <nathbappai@gmail.com>
> 
> Enable the debug uart node in xiaomi ginkgo exposed as test points.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


