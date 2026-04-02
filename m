Return-Path: <linux-arm-msm+bounces-101496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPJXNNEwzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:03:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85D386708
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10E6E3016D25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDCB396593;
	Thu,  2 Apr 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF1k3Iue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7zNrDKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC553A3E74
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120244; cv=none; b=Fo+AoEpsNu3aT79ZV9EjB1oRueycMa0hQG/S6g7RiOje2jQY164Ff2M8rSuSw3EBz8U9DtKHz5t+ilQrIOsxqo4MDnDI1rgl+JLBolm/7Ac+K+fcBRTQRkgjoejcgQcVymp0eY/4g3rPsgZ8H3kTMquE9pPhGoh+1g97lj5qz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120244; c=relaxed/simple;
	bh=gSxFOsowoDl0iP5vks3jNKSdjjPdJuAGxSqU4gowIlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njtGhay1205HAqnpO7RDw6F0Lf4ohukIGePAT0m94YpadtxgwknR0Kd3Fsq6m8+R43x9KKdC4SXw7EvUZwUxuUurCEy6f9CHss+PE0XZ41KVrkWREn8fQZ3nT12I7SnCChrq5E/8lETmaKVFYYErWjQ6ZNEGs/naukE0FMjj9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF1k3Iue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7zNrDKc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VZAQ091011
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=; b=ZF1k3IueQAdW8o/o
	2Al0TIZLU/ndMc/IYAVodT4qksDciy6mx/7qHo++UMPrXPbjGD54twC4Kdmmyb1r
	sA0QOJbzBXyFX9//+lzpNibEUhTqrqnYsZTsJQYyr4OWBkGAyI+6LbaTM2Wlhz5M
	zTNmzR08ouIAmOpD9UlvrgQKYs5XsQNM4P+aikKZOkHEJB9wIq62ufWbi++f3awt
	OjtXr027jec5DhJCpbGly21HOgOnHVyshMcj8GKSqtvs2qL+2lF+hw2q3JOTwP8K
	au+owg8SVRx9puFtsRcBDG1ctNV8tjjYOzY40XeNuRTAzdrvFfDL/o3HKXGUMce6
	Gw2Azw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8twt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:57:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd97debc51so20891485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120242; x=1775725042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=;
        b=S7zNrDKcKYZSXdcoZ2RsmSTdXZAL8zVMQWk3b4ceJKUXibpDNRrjlmsFdcVzkIJfK1
         cEHCPsECgodsgeCaDxnulhh8vTyeYsWdYCQFHELw3h5126pDTgbsyGVNJ2dkXEBuIPQT
         voDKYGNdQetdMo5nB1sQ4s3U8ueSZ03NEatGB/727Q0dhAdZ1ZWlSf5XaCODG8LMm3iW
         Qkl+LYi9z2qBNCcByWGURLI7hxsrqap8fXlDVBhQh4EbNiLIUWznQVReZSHEs4nm7NDy
         fT9yk3G38x+4mb37h4dpjEBW2SGpWxaZjDEtel3bmv/BxihLKnq5HduD9sON4WRAmxK+
         uBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120242; x=1775725042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGC7undiBQq4aF+qMpkovLyUIFDlJW9+4j//dEMPgJ4=;
        b=bCPDx4vKNHQyp3ZgrkSrgqRaAjqoNVNL15gAVrj4iZSaxHoMWSPGYsRtYj4LgoYP3L
         UM+31cAVndhVL9XfY4kB39vyUsoNtaUVEMPUSz+HVMrmEHvjVVFN4dBuaApusaNemFEO
         YPWcxbAZmcCwAYauYbRaseoERtdOUt7128yz7+kiu+K1Io0JKd1tExQngvM4oU92FBxC
         ef8lrUsObT6Wls9yCL5T9LwMQmgLSQncSl2k4OspeK75qf3frBUTytKiCgk8i86eGiLJ
         v0PVIqGaBTzHMVrbpr+KJiStvDJx3618GvoMn+cm1PQmQPBpD8GyMeNceFUzd795+iOW
         x6iQ==
X-Gm-Message-State: AOJu0YwapLnJTJr7fX8Wjl5vDhdBED9wHVv0w2n+TNq/diefJrrg6rOj
	VprW9BUCM0QAhbBl1TIGvMmmqMI0556Wcetz8miXV2B162Tmk0EhGbeifqYCw3R+taoDZC841MR
	PAR+gWS6PM/pv8vEY0ey31t3p8KwcsEiEDgClSNw3Ytq9NL8tmiXjwZnW+bd0raWDxYRQ
X-Gm-Gg: ATEYQzwpJ0dNmjBEeaCzJbchJpgCLLn502G92a6igplv6dy52h5QNcfdyJa7SIwTk9F
	kU87gJmKOmW5i66q56rGQUxyx4EdryL+6+PWqnhIDG+c39bO6y6WZLfRq5WugI7QX8AasVbLdSw
	rrYQPLnyyD7esY59wN2tt6duFN5lGM4U5RjqrWIbFhQ03UAFvopN5pBry02fWA/yxWej2LU1nPk
	Gjl6NE1Ld20Ykv0bLRDh7NOz9IbopWoAwx9coGYMOjLVCp4YRlVGD3OmRWQGodzgk3DBaFo9Dtf
	WrVlsiJp0+/82QP/xDVe3ANqCsma8b7w5XhQxy2/xjVkJG1jdbOrYapd0mxISfdBfGgHjzKPo1U
	a6BInRUv7nVzGivxQxTFmSrCkrXGNTaOCwI3Ey++j/skzkatA8b2RyNClDF+ihtT5XStFA2C/QY
	iYY7E=
X-Received: by 2002:a05:620a:29d3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d1b5bc1729mr751143985a.4.1775120241781;
        Thu, 02 Apr 2026 01:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:29d3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d1b5bc1729mr751141985a.4.1775120241264;
        Thu, 02 Apr 2026 01:57:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm537156a12.14.2026.04.02.01.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:57:19 -0700 (PDT)
Message-ID: <2b94ed9e-b4f6-494b-8fd3-e45f29d8d91f@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfXyiRac/xLg/cq
 wzcKQdppRlOad+KAOrfTBmWIMz1FmeMZ9yYej3pIFfcgiTeV14SmR6oetdnmLoaFpod0rsg8REI
 TEA0TINo01IetSrCLH4cDo0usoGpLkhlGor/5IEkFAwz+m2Huv1Mwi3yDvOyCz8UBj/yePxwY2J
 npu3jpRcjvgWO7wLyCgzSUKzS4xascixvmSSHt4aLuk3Ly73wMHEE/KApnJrc2LmYxzx1ki+2s8
 aML/kAaP7llAg7ptjSuKdvDmzCBaiO3usXnD0JlJT7Ex783rRbXFxIHZl+uNBMEQ1NxpPdRlroZ
 eNj29h1k4z/nPMHW7/7eP1twBOcfrcuZqOSMimlZmHitFYXJB59zf1dTJ38zV0y5f23pr0wa3Lw
 18capUzyPGxOFDp5voXNSJrs2rgd4n235pKJ5h772XC/1ZSoIR2NkgMQ0Vatr9e159pbRwSXzok
 lyqksMNeo9EfnvduKzQ==
X-Proofpoint-GUID: zqXJOHgjCrOqMw_qWqZ38JZ0nryrxkPQ
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce2f72 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ADlz52F4lO6kqzZzDJcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zqXJOHgjCrOqMw_qWqZ38JZ0nryrxkPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101496-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A85D386708
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 8:35 PM, Kuldeep Singh wrote:
> The ICE register region size was originally described incorrectly when
> the ICE hardware was first introduced. The same value was later carried
> over unchanged when the ICE node was split out from the UFS node into
> its own DT entry.
> 
> Correct the register size to match the hardware specification.
> 
> Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

