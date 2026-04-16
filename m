Return-Path: <linux-arm-msm+bounces-103364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAxHMg6w4GkRkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:46:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FE40C976
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B148F3022FA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3558460;
	Thu, 16 Apr 2026 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afsuRXXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUd59s7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60AF39A060
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332519; cv=none; b=llXYGfnEsp2Qfb8BcLbXdlIKwyo/jlxXW9VDbDSSSxCEQ1mHnfMoDuyXH0DyZVKbuRuSawUegQS1mj6roCDl7HA+aDaDLxLC0d04Wbnn7oOk98hIeT1YfFAqdOje4orroZrJ0chOe0Teo8ilBwFjazDHHjx8haf2d+PuJZ5BLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332519; c=relaxed/simple;
	bh=MiO9X46xV19b65gJgZXFSIe7YyLKgKI6TakCQ5ivCjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVG3sqL16I9HNN1W2DaFzTb95b2dodJj3W+Fg0z76DUecLQ+cM/QfaRAq4ZwfyyxxtyK/18jBQt31Mby+ajkiFHnEcu/OuuV18U/cS7LbWrWKzF69vYvghr1g7IwvlxFxb5x6O4AtP7qCu5F/VG5BfE/EB706PVaEDoLyXafMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afsuRXXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUd59s7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6JIKA1668112
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=; b=afsuRXXcuHaTeIxi
	3WdY3RFg0Ccb2FIa9cctq1kZkBRiyXuAXPeQ+Bpa2baQGFHmfW6Ywi4AxgrjTWv9
	S8l0KWdehkcHfJ92F8pQwhhoga40a2AYvHgY7EAVeeQC1kk22RLuOA5jaC7dOxV1
	U75uD4sMDTD2XBRrbwOxUpABwATvOzTm71AhBP4fccRujYEP2jzWLygFvwPgvsO2
	kuNQQtke1xu6Xv2ky8PaS1SonHpCvI/5PlvSQ+lkvqM7JHo/zwTr9XDoXkfwzWgy
	adx1M1rRxjBMrk9XOWQ1W/7yQ6Xh7t8ZvheJ3kXM97pbEsuOJCWZiDEy0zBCz39W
	Q2GTrA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd90snc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:41:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4966fe6so16541776d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776332516; x=1776937316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=;
        b=kUd59s7dLd9QkTfWxi13g2R4njmI1Jg1qcsZ7dNryw5aJ+/SzzKD3OQ2c96LCzVHCj
         Z+uoMBoKS0TsguTMzYIW6fVyCzftqwKMYSZBEkXqRqzq2XiKte67+Czv4BlAfnYGNRuB
         nspB89V+YcoENmZa/JmVhwKeP/S4n8XkZS8tQvAVsspI1HN3ZDaCSRSDtFDe24bDjoMx
         puOBLftzosbIPW/7HiJccoA3wXJ87gGLotv1KmUbY/iZx1VYVcmF3eAQ1q6lXNfej3C1
         h7gAy35BEatfdeXEbyUH9Zy21/vkmF+O+dgsQZw9SM8+Uvk4yBBrpPsOQt7NmnIpL6K7
         dDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332516; x=1776937316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=;
        b=J9kyF1l1xDFj2d6LjMEVzZfyq2CNbuCY2kH83FeTUZcFw6IAXDjUsXLvkbioamEHTS
         SmHpwgmE+cjP23SclgQYRFhdn8xAvg8jSGry/tMuzMg0oBH/HslMeJcmomxwuLrNlPIE
         g1siTBMwbFV5YzM52hYVrSJQX/UldUq4TPItSw9RdyYTpb+WkxN020N+tLyyOrv0M5fl
         8kRxiD1bjhB1Nk1G67HgtW0s7rbqGO2bHMSglKvCZTdtHJWT3IwEBEYUbEMqQ16gU4OL
         dcmIU5W4g0VMYsIwrw45aaAxSdVuhbvR2tS1GM0Z4H22s6IRiFhsZt7JseqkcIM7ZLJj
         docQ==
X-Gm-Message-State: AOJu0Yxr15k4BT3BEzGa99tL9D9kiGZ9nbWghb0gFTmavmq67OsnPEn8
	cDAAIg6lXb9CE7sdhRZ15Qd9say6GeX0W/RP6NXEeTDvDROzKsxKWmfrZRo29ahpN1on7R8wRbL
	5JLB/fzb9jNRC9uY+FJ0V3eyBxt3HmKYxOJkFkR1tlrJVbN7NEX1cJ50EkPWTEEf56KSZiEZZWW
	Rb
X-Gm-Gg: AeBDieuWyh01dsF8s0kL3vUfJ0OyPy+/IAPlHcSkNojArwhluKl6S3BEzmq9rJO+RrG
	738Jl3R2bflQrsJFE79q9Xk5UEnZ9crD/UplOamUnw/CJ5A3mhZHj7uGcUn3MfxlIMvbn78xLCI
	dJAfkTg9asqJn/O0+NDuTuEkXX5bPcRjMvfWpLO3wF5mjqMadhVrHZvFdq8GsctG4IgmjTWf7Zs
	WKBFbCsA2nkulQ+p31zIBzc1qGwSTl4YEpbLX07VjBGE7gjGlmKVHyzSyDqn8h3BF1+EXajgpxo
	H7i14U1zTrrH4fREQAA4I240XfPriO9B7dysXmYOVr2IMwJJ3FUIF8lk/RESuyKeBOJoUdbSw83
	5DEuw8TrccUgbL7cs/St+Vq/uGqyf7GAp0/hdYEZa4ItbUC1FIMVLvqdTepWwXK79YSrOoW/A+p
	1xSdv6/81G/SP5CQ==
X-Received: by 2002:a05:6214:29e8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8af6b6463d8mr20001606d6.4.1776332516161;
        Thu, 16 Apr 2026 02:41:56 -0700 (PDT)
X-Received: by 2002:a05:6214:29e8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8af6b6463d8mr20001346d6.4.1776332515676;
        Thu, 16 Apr 2026 02:41:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24dfc5246sm91967866b.56.2026.04.16.02.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:41:54 -0700 (PDT)
Message-ID: <5a6fcff2-93b4-4dfc-8fe0-e1cc692399d2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 11:41:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MSBTYWx0ZWRfX5bPlFPph3ul+
 nZaZ59cqOa5SNn75hmJLkjXWG0Ubhpyjg3RbUmKld1kkn76ifYEoantwC3HJI34DbXOdzXZ4PI3
 hGyKYFfxvDhs+ARJyXmGwUQhj91UH2C/Uy67XRIeER0nVv/Nho1T1l5dcn6b5WFD5Md6GRn26lW
 rryKtFA94IUKGLwe2iSeDAVY3IQuOpVfy00TfZEC9obKucsu/BRQerBnIUzFunvBa1x23RSjJjS
 yfp/iyfgEUiQ6yJqquTql1+0si3cbf1ps+aiuQPIAFNXAzXnoECMPFlru0m3FXzDRiBxdFjaZuq
 6cCZHpBdFe93MeiZwpDaKgSiFmXovFcko/PYZhQKCz3q0ui2L5MQi7lYJBRZNcTDjn3K1/6Oh5R
 NXb8qYb8hftuGrY8DE1rmi0Cf8GGiivAOjBU1P88Rrhp6ZFxi6xmyijRLbUGjupKP/bYEScMcFH
 oiFQtskn5jULSbhScYg==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0aee4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=p7Cr3RLbn84ePFTaJmIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ZVtqo5ZLzTmoJZg3RCcknCTOtemPGYvt
X-Proofpoint-ORIG-GUID: ZVtqo5ZLzTmoJZg3RCcknCTOtemPGYvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103364-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 351FE40C976
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 1:45 AM, Alexander Koskovich wrote:
> Downstream the IPA IMEM slice for SM8650 is described as:
> qcom,additional-mapping = <0x14683000 0x14683000 0x2000>;
> 
> Update upstream ipa_modem_tables to reflect downstream.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Thanks for catching this!

Fixes: 581fc5d5ade6 ("arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

