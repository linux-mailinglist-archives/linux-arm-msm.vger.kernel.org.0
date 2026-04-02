Return-Path: <linux-arm-msm+bounces-101491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JhKsLdUtzmlElwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:50:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 581FF386490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA3183029C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5963C65E3;
	Thu,  2 Apr 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBfuHd7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsYKRZCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53393C5DA2
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119824; cv=none; b=WZUBXdYCUTQe5CxbTvco9NYZBLTW9GoqMGqPa8vYfFNeB2MnijJ28FNTvabDlXO07zEqiLkoHy+ro/EzTUdIS8c0quwlRZ2ULo4JgI2XYlJ2JXfXfotqGKkc4HLkO/M/9wJBZDrMSLVF5h87hoC6wI4RLzPTf78TWqCdDA7qr8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119824; c=relaxed/simple;
	bh=nT3uv/bM3p4U7Cc5AFOq99C/s5Fm/zMmpDSpH9xpC8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCk5byZ9RoLiaE8bvUyr7laMpQ5m0aBia0n+9e454BFyJRlBXdCvie+2afocyja2WW3XcIBysrmLJkhRswmNybSMPF2rPRXI3HT91fPZElGeQYnGvYBQzfnEZKbFkVZ5Dd1Mq1O2Ux62hjQNtudtM02hw+7Y+kx160MqHWhoDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBfuHd7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsYKRZCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327CVEC3044437
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=; b=IBfuHd7Qy3ZpClMx
	Bdr2GrGoxnMnk8lHFc48N+XohkHsxAJjoWc1jIflnSGkIBtcqH7lEqpo2390r5lv
	kPrLz+yaPYTtzeXjqxc8iknh3AcikGS2GKvfSHR8NsBhUUF1wYrGcifda24VLTVU
	7Gjxlghj2O3ukgVuHfHwRItIVQZdNqI5baktLHbjuARLKLEM7Yhpu8xal/cG2Tq5
	hlS2BQDJtIBOsAS10mBe6jz8Q/vZHZvM9YujmDPsxgUsAujJXSPk9pcJ691bWD6c
	Tfl0MbafgEo+mRIpADL9ED4ZfzgnsMWYFq0k443PuoshX7LAnjcQ9KH1WGj+Q0LR
	Myl8hA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v0j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:50:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8dc8b434so19457285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775119822; x=1775724622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=YsYKRZClHgfZ447zqIf1M5NXVNtq8qKY7YvRUYd7aJk7v8wNupolAUEW6dYhuoy6a3
         Y284uGUWZs8TCQZ4K62hCzdMm386T3ZwnuiQOFtgASW34zv5UoV/C/ba2NqQLaIugHMH
         hscFvkWxX/YyW126ahoRiEsFKgdmdINUORjO8clrPS8fDucfHSZRdfcLUbvf1qwbHk9/
         ywEXGAfmVD+QPGvgngsZTx6TcB2xTIm5/AI95ZvFnPUsSA1mWuISV8dBw+A+0BGsm6em
         /qUzoTjcFaTgvQmwJRvrGzuY//wn1dx8l0fPujPyhy+SZ9PrO4rZkewdjnwObpCS8WLE
         6jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119822; x=1775724622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=ijN3x1+O7lydchgEa3fuEOPbAvN4bTY0jOqVTWCeJwNHWClKo/ki1nSgfRQDQXyrt2
         jk9SKD+ed7/6JJPbo1bFE3fBqCdhFYZacfAsrHePkYO5ZGe4k79MVOXkzHKEOcJW+Mws
         snuqwxzDn27b+4mp1yg7nG1oymq5N9f6hYQ75o0xBO7tDQHlSUOkalXUnTxsMDp5RSMR
         BTF7PxvfMIUBCdWa103xIr2qofqmYExx+m50+2HLmnMG1dNI4i65XxG4GiUFueZy/1C8
         zUBo7UMLEOoPMEwCMummipwlV575nYL5moIsz7qWBDEnwqwa8P3eBFDaQnNrhaCCS/b+
         SOLw==
X-Gm-Message-State: AOJu0YyAJt0av8Y0EZ8OG4JoQUW0jQ9PxDz7JnjCIFE6PfHdcYtaJKMH
	VAduARQonTQo5/gtESVpCUKAZ4oGCk5C0b+Pe86wEe6QEn+pvdmghj8iNi28Jh2MkObE+iXa3U7
	lQPemHJNQCeBuVW6bl+5aEjW58x10yKxCxHJhUqTXbYWZWir+YxxFvjioKEi/5FshspKrxQA3DE
	mN
X-Gm-Gg: ATEYQzz4i1kr51x4ccS7fK4jzSEs8umd/pCBE5+GbbZLxbTFt9e8ZmSdP7DpZDwaeFJ
	q7AHg5vrSJUfoFAidm2+Vkd02FkZflydvx4VSUUCb+sTH7WlYJFi5A1ut7I9fyiTy/JjcJA83ao
	LOVHWhtMYN054ggDt2VF1/tbiSNz1Ept4Y1/QnkOJ7OcFaaPOEp6N7DG6OOxXD0XezywHxzOvdQ
	Gydcp5zP/L8uHlLuZiEWb4Up87ess0G1VeZSBkreoA3yJffEApRSrnabDoMGseAI2KG/3r1W7uX
	j4Wm+eoRihN9/lu9GuIclCQCH2FstNcz6BLd6bp5A4ZrSnbnXRNB0nbktn9wrfazd/ZRnJYrmmy
	WwCpYi9DIPD3svaV31mGowloe4dzqEi9Ih7p5Sp8PS6Peqqq0nDWMs2HE2cNmhsHJgcwfkEJBxk
	1REbw=
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732119885a.7.1775119822044;
        Thu, 02 Apr 2026 01:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732117885a.7.1775119821615;
        Thu, 02 Apr 2026 01:50:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fd4sm526816a12.8.2026.04.02.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:50:20 -0700 (PDT)
Message-ID: <734db4f3-3db8-48b4-b630-5efd0069a2cc@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
 <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce2dcf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfXwttY7TuyakAO
 C1oOeAbegvPCOzQlff089ATCBaHuRenC9YokJzBICIq8l7Hyx4KIX0SWBQr1Eq5zM8rPQCg9PoM
 I/uTwgfQCJkWvnBWPjmovsuPXfjeJWxR+vfXwbb8Wrk0EFy7NHARnHigOtcdLbDalRAw3Wt776A
 R/F1K7sFZp+OMxLqlhM+xjnza8fTCjbAMM++wwMNgWanYmx103pd5KXGKyx6utB8koDrRyQ4lRA
 KI9ZICOrI0lfldOe2AWcVLR/XjOy1edaum0TMoCKZOraDsCGhhnMMH8NErHGZFI1qVlMlsq6Xmn
 QCOfwAd1/kUtDnSGyZF2N5x4+2llmcChocoJcLflGT9J5Pa1ky4j9kgxaM3elHelqSxcA3jHGUN
 As3/Wk/6RMsaWcwlCnAc5B+26W9LgeZiv/63G5dyfHhopew5u+U6UmErh4iMQANoxQNGZptCNDl
 FTX+0jk6zg2FrjAK2Fw==
X-Proofpoint-ORIG-GUID: 3w8ZEGu4kFSbkME-AvCTTBytF7LTMo8E
X-Proofpoint-GUID: 3w8ZEGu4kFSbkME-AvCTTBytF7LTMo8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101491-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,samcday.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 581FF386490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 12:39 AM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


