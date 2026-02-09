Return-Path: <linux-arm-msm+bounces-92239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKigIVamiWk0AQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44210D72C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A12143001FB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874413624DE;
	Mon,  9 Feb 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK6Vp88W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxMwY0qA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BF32693E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628690; cv=none; b=jfCK0qk5O2bILLE2qT/CvyPo+YjweXwBFx7vAvene5Rjx5sTcoPNGTluSHy3l0RSNL+qQUfA/yxJl7im5+4d3jKKGl4BP9ywYYh9EsbNiV1mMCAZY/J/Oj+UR2kMF8fSlKjleA2QYTabwAhLbTiMUNwOblqHo0LYjvOk94UBqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628690; c=relaxed/simple;
	bh=F2h4eErvxBUdmGM+WmmshUiQ9Giuyfy3rl53bVf2foM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYfpRwY2O6T0EHeufR2bymT76Xr78GBzHj8nwURDVxk970igcNsiAewJ9dsvt33H7+NWhJgVjY8Nx/HKkc3DxVcvrTg3I8xy/caMxXLy7RB8GEXUDdm/X2s6U232mCMHl8499AsW1tckFuWXcf6mOJOJdWzGOahVKHEk6Ymu5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XK6Vp88W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxMwY0qA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195Nc733347589
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpdPZ9ehNMoINxXHzMXL5zPTp+IGaHi7bAJWsWZEMSo=; b=XK6Vp88WrNGqbpzm
	3mtpX/B6oSGaryeTptUg3J153uNL0RY50dsVLsjJ2sp6AruXWsAZ6oMer9tDnTkv
	n6mjw7HwULs+7J7fUpfvKYZLD3mTAY7HSax1tkChxQ2fRAPJ1DsavZjIb3RgBFFO
	xoJnYWo0r1NC920Xf8PoJz6h3EyjGC3HdZIfOfrNrBCLLqDtDWK5yzAzp1G0j/bG
	czew4MykHJb+ipH2bi1TmU6A6SsxfHh+Bq+cCUxH08vQ9ApgnqChuy74Of3/C8ff
	R0zsmaZhl0JALCeifdS/mcpiPZJflKnwZ1CFlY0duRS4G0/dx13MrFzD7AMRC4da
	hsqPCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy0sjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:18:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c536c9d2f7so155276285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770628688; x=1771233488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpdPZ9ehNMoINxXHzMXL5zPTp+IGaHi7bAJWsWZEMSo=;
        b=JxMwY0qAZ8+E2F24rFs+2z1HMbhHuKX+LZd6hlZLWNgzgG/oIWtCao0aXKCcQTSCo8
         T3exOyM5cGNw+nJnWqsSe9UusZ//p5HDXu6TDoUCmz/yrY3ALlSkLu68zmSKrV3JxFXu
         NeIIgYWKgPU/FYE5DZt38m5DjwiiD7JJ5PCWUuPeU488gUKEzK4VDMUf3XFcuedxoFss
         ICgU2z/Hr2pFXXWImZAllugJSXZPh4eB0E5SJJY6VI3t3CH1Kmp/NMFSllFTA85oA6ro
         JYJt6Kd8shrE9EbYbXaB8ShFUJA654VvP/rySIpJwXAiPXAqX7E0qHYZbkQfWIZw6SX1
         0rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628688; x=1771233488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpdPZ9ehNMoINxXHzMXL5zPTp+IGaHi7bAJWsWZEMSo=;
        b=fYHQVeDVraClB7yZ1LaorRs2lYSV5+fCFsO9Mc135z0qW7KmY+IYO8kaJDj+cmy3rH
         dQ9+jpydZ9znFCZA05L/u8PTgXL+crJ0cu/MqioMjQDjDPFm7ZuRr2NE22jiXFqipgAL
         GFOVgRduCShrMsSFEgNmPI4Veb9ELqDi69MVSGqv69P4kkWBh29tVoQFsYF9/KYejwH4
         BETX53koHbx9B0O3GkvxHCHFHyMXBTuS1XfnzSZD+2vfO14+HkyQw7OVv8dlecde4geW
         sViJTFxUrOYvXCgAkl9HG//zLOfzasL4DQAWBsoTkbx5S2/+4mT7kw8A1Cp3waCcw5PN
         eOaw==
X-Gm-Message-State: AOJu0YzmVMqUGSlvCi291cy2euWAKYYo256J8oS2LWN9sGWlP1eJGcgl
	gglYgDwlklsSqF5Js0X5/OkzzamLqEq62IvHdfggpPQKAgDs/sqxMFaX5swj6QHc4Q3Ktmbl1gf
	TDQghSALoT05x0jS/m6tBdePWcoYY6Tp8nyrdEbHPqyQXl29R9ue+Tl3sAq0BstfIZ2UK
X-Gm-Gg: AZuq6aKV0sILe0aUAMlKkRMUuWucn8m/ya3sZZqbVjnd2PIiHLhiRsDDGbfAF2lsNec
	Tm1RNCEh6VR8wzb2AE+KkkTo9OK4yJhzIPxCnTYx3h7c4QhzfPPrBpiqqhmVH8wyvSKx6vX8I5n
	TT25muoWGK3PCH3bVZ0Dm5VAMxARiBjFzQdjytTTEyUrb4vu+jNEDuHlNRM/yBnhmr6bxCsPH4t
	o7UFEqE9spnDvQWfd5qP1Pymm0b1ZtjzET+bVlgkqx4ucvfx90imniatIZ6i5VQUN7146+0o8GX
	0azThMH9qi3jt4ETyvVSTUO5QvX4TVsltGkOyHoT9s18m1T5EgTSw4yQb4pWPr2TDZMGDTQtpYg
	oTV0TN7CzqWG5oO8v2uC79+ScW7Jyk6ncgaDkEd/ypvw6+X8aWj8O1+BUT3YQ00xMUS0=
X-Received: by 2002:a05:620a:2954:b0:8b2:df32:b900 with SMTP id af79cd13be357-8caef313a83mr1118572485a.4.1770628688613;
        Mon, 09 Feb 2026 01:18:08 -0800 (PST)
X-Received: by 2002:a05:620a:2954:b0:8b2:df32:b900 with SMTP id af79cd13be357-8caef313a83mr1118571285a.4.1770628688224;
        Mon, 09 Feb 2026 01:18:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a4ccbsm363907066b.21.2026.02.09.01.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:18:07 -0800 (PST)
Message-ID: <ddd67d56-2f81-4cfd-be3c-0f395a9e899a@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:18:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio DAI
 links
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260209091139.622756-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209091139.622756-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vsxMTCjMtXk1DJCrzudixgkK6V3_PbtI
X-Proofpoint-GUID: vsxMTCjMtXk1DJCrzudixgkK6V3_PbtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NyBTYWx0ZWRfX0zzxxL4izr1C
 evAmJbWtN3xlhMRnSBZNbkbtIu+CG+Rmo6E0QrOAm+gLXyFwcED/Z7WOdYLrujQ1l3LK5YR1MGd
 H81P1Z6nlq41eMi/M/4FTJQLramQIOhjbLs6A+HgYAQiSlILLm6IHrobi0fsSD4itJbEpcbtHO4
 PAX3RhiNJdBayHIz/rX04QO6K5jRF/oDBFPIxJNRgnFAEMuyUqWL5lKEfHGuk1xqoOiC3W+1VCM
 GNhJVU4qfzsOtYNInVv8e5OzDesydepBVKuYzjT1w+wFc/U0xvARnIBNRnMlI7IKw8Kzs0n05rx
 ff3tLqOcQCwaslRuFFbagmdaasiqAhkTDW1D1KMZP69kXQUYC6bdXH1kqJeru2Mk2b6xBGsfMRR
 JyI1cGhYsUuKGuOh0kd7V6jluQrOr1JyN5GYpdzkeOVz1WdqzIuZm9+rXmpB5itEX752TSptoQE
 pLib0QQoo/q0fjTyO+g==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=6989a651 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=RxiwSHJqq3P24Ii4000A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92239-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC44210D72C
X-Rspamd-Action: no action

On 2/9/26 10:11 AM, Le Qi wrote:
> Add DAI links for DP0 and DP1 playback and set sound-name-prefix
> for both DisplayPort endpoints in the hamoa-evk DTS.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---

[...]

> @@ -902,6 +934,7 @@ &mdss {
>  
>  &mdss_dp0 {
>  	status = "okay";
> +	sound-name-prefix = "Display Port0";
>  };
>  
>  &mdss_dp0_out {
> @@ -910,6 +943,7 @@ &mdss_dp0_out {
>  
>  &mdss_dp1 {
>  	status = "okay";
> +	sound-name-prefix = "Display Port1";

This is already set in the SoC DTSI

Konrad

