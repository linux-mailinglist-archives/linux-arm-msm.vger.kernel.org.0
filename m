Return-Path: <linux-arm-msm+bounces-99687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHpqG7CSwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:33:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A03097EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15B6930131C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A863F87E2;
	Tue, 24 Mar 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPAv2g/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doSKjjO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D773D5252
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358575; cv=none; b=mbDp9UIGf/nqgw/7ajR8bjFD1I/dXWHfxg8VtxKGZVTgb7aYpQHYfydf07Y106Ajupxb42HAcUIgolz4OlJW46QQsZFAtY7ci9nx8nP5k+Fc3MUP9kyNEs75+V30MIYzhXtA1AmXbCuSz8ZOcHb5c6Mt9OXEUhg41J58BUydjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358575; c=relaxed/simple;
	bh=SxWxuZhStkyXg9RiLNObIhLWFBzd4gIImwTIe/I/EXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgGACxDDGVACj1+sqZq86EwuDx5K9GI4hhnH1vHMg8TdVH8F138228HKLDxXUzGbY+idCTzisJ35flmeLp0DvU+Ww8lNsCgrbsJ0OmK4Sl7RXOhnN7wUAXVhww4s9n3/fds6GLnwUPyGRCwuR7Gw3fLA7y5ZIaOtBfU1O+DLo1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPAv2g/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doSKjjO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9KDBC3934726
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGj9L4UqycSEWx5wMfGw8Q6015VEmmbWgtk1z9+KdOg=; b=hPAv2g/A72yctI1y
	c+pciTAAB2HjE62rao80F5yZD2I7zHpjPOTRYs5Zc5xhrz/TP4ICeZ51uGCg+RmI
	8ft+q8WTuc16riJs4CkRJSQQt+wmyxjBMxn8Mtrb4Z6O0i2tfU4N5wY5e1w97pOB
	pcJGKX3a3yXdb2P8DoaMPSsoKNPPuYrRwbQyQ1K8ASop1lm1q7RIfYyKrt0fgC6C
	I/51LLmHXXeXvhoW38wxMvwNvg/aw/8neJFGQkuvc5xmG3iJFuL03IeGxzMTxMzT
	6ABLOQC/cZsk74y4qPDD19Rc3zr7oC+eSXUZOwT1hxJOjPxFa2KaP1gVvbYwCX3q
	5j4FOg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0mkk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:22:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60274569cf9so748630137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358572; x=1774963372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGj9L4UqycSEWx5wMfGw8Q6015VEmmbWgtk1z9+KdOg=;
        b=doSKjjO8PTVcmXMrnrYXUBm7VBOIzKo67N/wktIb0Eo577Kdqdla9ON47YGBBPoGvY
         FrxKYAX8Dw4o3PWjBZDWDQPolX7IUnlvkhig1WeaZ6AGWoz7BpHA3tJx9/ccv/rV277B
         1nUBpnsFAI5pj+3dJ0lh53ihR+P+4PDruDL7bdZDiMewrIUgyUnAZdKUBZXc1xpW7D4M
         qVjlNnOVzZ/fQlhppPs3TiMlOei0ZeDcL5R1QLjmLkOvxHNvOlSa51kRX24Apge0QVMe
         U7/f5quFEwfrzGq6izh01AxzK0zQ1erzjxi00UWUjbtCDN0RlMA1rGYEvuwKwo5YCftG
         7cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358572; x=1774963372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGj9L4UqycSEWx5wMfGw8Q6015VEmmbWgtk1z9+KdOg=;
        b=qQk5xsucyLj4rx7JILbX9PR6KarHApZEeGndHDP9dxoqnLYECZYgZ8GVY6s0+fJmq4
         4GXFYqihy9qzKtv4oyiA8cRoi0sa4DPULwwgbozbABeZcypSoJ1I590qtUZvD/hg5cV0
         gaZWzYnQu1TXq1J/XHfi2a/qi1tC46R+Lt6/PajEoxMZYaBQpMLTFOAwv/TtRoDW549+
         41ltqCOpEjMHLoHOOx1GC8F+tEaxOoyPdHHr3c5xi5qiTSfmXkhKOgU5m0Tlf0x/X1xH
         gs2ojE2iajzARuKjo656kzAm0Sq/2HGc0GWuT7DCWIUBO2ePOjM+IsTKN864UCMg/kBE
         Rivg==
X-Gm-Message-State: AOJu0Yzg8bYiqIuh+uha8wPOn5qpG1CV/Z29VZuwrxq3dK7G+CkLBivv
	g0V9/xX0YbbZktG0ueqdwfUmVkyjIyhq7QGJPZs5R07AeqG5IjhI/VZz6jtbh/WGCcoVQW+Nvli
	M+PrZsVgc3KRnVsGx3Jl6PmqFV+oM+MN1uQDMeDEBgzVaElA6ff3ydYDrc32wXzp94pbdjJg5Ck
	4l
X-Gm-Gg: ATEYQzxa/3fHMq366p868fkSpA/8LE4ROk/yGWsLpQ/pZWgM95km4iUgYN9i7W7U5il
	1ZDKHm9iMITI6YeF26lalx6D9M5rsgbVSFexbsUUlQ9eIhgWyitb6k74zLqr6V3i6UJc7sA5hL9
	GVI1Nrb6BkX3hByMCpLmAeRTnBkniIqw6kTobQZnF9v3UGr/K0+5VLY3vqRlBH2qRWDE27WdZlo
	Euv49ou1Ng1vg/vKTLSRCHnLuCuoKDxWrqLQSYzfXOyk7Mz78KZnSRf19a17MY490sBgKjxv06H
	+N3KF0jV/Z4pEQwm040Y3UhOYFajQygfR6vBZeKQy9nMAwIFQK0o/dl3zNxQh2ScZt4w9Dd12eP
	ow9dIGGZEz1/dM6eeW1fVdsTVdAP2dER8lyPJQWRMYBoXxZaY1ZSVNh2ai9c3S8VxpmdrosflHs
	AY/g4=
X-Received: by 2002:a05:6122:e4b:b0:56b:7689:dcfe with SMTP id 71dfb90a1353d-56cde4156aemr3565463e0c.2.1774358572140;
        Tue, 24 Mar 2026 06:22:52 -0700 (PDT)
X-Received: by 2002:a05:6122:e4b:b0:56b:7689:dcfe with SMTP id 71dfb90a1353d-56cde4156aemr3565437e0c.2.1774358571639;
        Tue, 24 Mar 2026 06:22:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm636822566b.2.2026.03.24.06.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:22:50 -0700 (PDT)
Message-ID: <9a11d28c-4dad-4de2-8f17-471a1af1e716@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:22:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for Glymur and Mahua
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c2902d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bW0tPYPAxJPjzcMiMfwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNiBTYWx0ZWRfX6B72GekvhaEn
 PVxpp3WG0SKVpx9YdYbT0JHwVtVoR8ysiSjwixVElA4NWX9bIzcL5kbe1fWnf76g2VzAWIPvKgF
 m3zv/Ym6Pg1mZ9vNWfC3/WEgWfcXycc+TyWc1QMXFjlLx1/8fkknUoRNm9rZSuWW1TSJaLMpOGZ
 Pyl2TxBleeXTR43AXC932tpoMLiBnZhIGLfypkIqUIFIpTZtoSyrJG8xguqisafu2DugcydLOcA
 UXAhvEBeMOgDGYv1exJTC8NNzLjqEcIpdcMKVOfh+weKNauff1zLDyU3QSMNpWqy9qv2OqIqZD0
 CjFpi7atjgVfkQIy4yhGiL+Bsm2/XQWQEb8+eNKeeoQbE947lytcZXzlpymOYtu/Me2BQQ9z3gK
 wcvM9XRQ1R8DHtjCQ/ymnDssmfroHB4V3DWkdoTRKJZWkM8hGE4fvK2RlHX3w8ruKQDTqdze6TE
 QVY8TfWthxc3uCTgxQA==
X-Proofpoint-GUID: 5XgbxR0YPGbz0WHkLQGOwstQZ0p_jSoR
X-Proofpoint-ORIG-GUID: 5XgbxR0YPGbz0WHkLQGOwstQZ0p_jSoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-99687-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 681A03097EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:53 PM, Srinivas Kandagatla wrote:
> Add Protection Domains for Qualcomm Glymur and Mahua SoC which have
> both ADSP and CDSP.
> 
> Adding this entry to the kernel will avoid the need for userspace to provide
> this service.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

