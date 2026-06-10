Return-Path: <linux-arm-msm+bounces-112451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xNvcJLNXKWpPVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:25:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31133669402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:25:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o+fp6481;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="G/H3wYMe";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F1A2301A320
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22A43FBB69;
	Wed, 10 Jun 2026 12:24:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E113FAE19
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094272; cv=none; b=YgrWDxin8mXdcmzgB0jENbyE5gBEktmaSCWEqgOpSiQuraOG5AqILk4fNpRlm+2kk09ESxqkcYIJzBgbXNg9Ir1bsOTcxsCFDk9qOPpM2pZDjKTkgIqzm0+dyAd5HE0FqJCvf753Gbn5sHSRXaqTg04ln4naJ4X6+ygL2xtoXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094272; c=relaxed/simple;
	bh=+58dkkhzFmFWzk9Gmvjn9HJUpCHLBYAvtBUgkR2/5SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIHfDDgfood8rUD63jrF3XVYqGY7ellnztzPQ3Nub/znXOMbCQ7i295Nyy6GaF/zxPBG/xtJwitSUFNPTp+5cx0k25pKd/L7emQkvv92iVqXtZq+T3Z6gpftzi5IRsJDpTLacYQKJfqJWtntbphTWsa/cpQEbij3iB+6RtH9Cps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+fp6481; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/H3wYMe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCfbZ1598522
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=; b=o+fp6481pY9Yq97z
	ndnZ9yRSQWJw6vgv/jFZq8G/xStfsajlao1nmP4FsdoAGFUbLw1qR52MM4IcO4Wp
	YlMOfsaopMCdDqyRDmGg9MMQpSsQte7TeAT8GAEHBslBasWGkN2nALGyjsDdGYkS
	FmqcpQ+wT+8wlN2ZkUpRUi2oQixGiy+8T+p6381tZZA6tyAFai/mBaBTaRNifcHy
	9ARB5c3KPs40JiUwfl9kr00SxgFs+64NmBoBTUmZRKHGCaIR2mW5MvmCfXjaPIXn
	uxkYR0Dz07zQcBoS+8ZEk16f27dOYM1k8Ep3l+SkBP0tjPcGzVlK1XGp1oeHJFEg
	5hOM4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehbap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:24:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ac43d27so18515051cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781094270; x=1781699070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=;
        b=G/H3wYMe1WuFRwcY/knPbvNCzCGoUomTNoHnOA104jdo1RHgusWuj0yo0HkMu6ey5h
         ydggDWcx/z1KVYG40Pqw4iLqJJOKb4vlZlbFCpO2lXA3aW9NkNV9V+lOjg2hHoVLBiG0
         2NlMZszxviGaqqnAc/GXdqOPfb0BMXTn1w2nvvVidMq6Dmy/3G7xrZpE43n0UomPey6K
         PKeCBF/yXkwtK7FkVLH8cOzZT2aDYVcOV8JHdFkCvELUxde/jNxJqw9HRdaZ1NE4hOZP
         PN2I7jDhxORn38Masgc/N9iVAJ1CUSBn0JjvTlkR7mySJhSZG+FNL6Ki5TrPWKLghVrA
         rTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094270; x=1781699070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amM/N+oRLG8mRewYc9VWMlxuVViY6WRo05rga5c5y5Q=;
        b=Oiv3fi6SAFy0tZA9fDIxkk/wihUNmkB9+DUfJYYCLVIVSh4BzZ6zBNNZ09UIDWu1zU
         9MmDhLyNrUFxdz3b60wy7y/SqP3XVyn3L1Y7o+/1E955W9IWbFJZCJ+hm+lPcXXH5zFX
         ApsJ/vxYHW6A2yFJrNv+3LSaRlyWpjGsuBuPbflGlKeQv8bU820i0f6+hvAGVytIX/uk
         BSksg95OPz9ZaNCVrsI6j5TkDtLOtO92yj/snuXjHw6VrGLyk8Naev/fZ9Zes/UG0nUg
         rMBzeOUUFpqSazFmSglotHcxNkrSHwa5aaPsQgICabyqU+0nUQmEtb9pi+yqyYCzUKUs
         EnPA==
X-Gm-Message-State: AOJu0YyJFNgdPIGbSKbAqHCLSsAR09DlpjxZNSvHMAiGpOZFFHERtqa8
	CxvGjPwduaU+nXMtMPoJYYREX36RJPa0PGYNvQ/xw3IRuY4tuviLeJSL8vICOq5AFdKvR2q6ZVq
	vou7jAi9kVgk+2WimOaVDXEPSB11i+VvY8wv0JVvFqVudgdQ38r622hsvhRRyy4+EiKH5
X-Gm-Gg: Acq92OGWqFQyQI9UAAmMKp4NYydnkR+sk0/bnRpUUfTpi/OL2Sz/0C1veZZHh0xnNaC
	IyIt/+7rAu1ykRachkNBpxjFSmFKWKW8fq1bPpxIP9Y+R11LWbndmq/kZHr+U3LQandfghpMqpP
	XGF3T8GyFMJ5JtU8GQj+1U0drsAgeZE29kknXGAL4O7Z2dCvDLhduFrY0N5m1f1ENp2184AxC9v
	N2HdgClt+MF2HtjW9N6fTIytkVeIwZt9FE8t+SvL2e+42hU90jhu6w4jceFOon0MUfZhLZTUUWa
	icnGi0rB3fkRW/po1JIcpkkuRoVRvS9UG7KugT0k0sTbHFLpD9gMDtMGdz8Eap2BnhzZYBC0Kd3
	PjkzHRR1ntgd6X2YK6v0Gfa2rpzgxhMhxnHmh8CytJf69uHmb1cEcQoDj
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr66925241cf.2.1781094269939;
        Wed, 10 Jun 2026 05:24:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr66924761cf.2.1781094269455;
        Wed, 10 Jun 2026 05:24:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm9858893a12.0.2026.06.10.05.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:24:28 -0700 (PDT)
Message-ID: <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nUiVkWhfe0yfzeFxYbC4Ur85M-htGetf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOCBTYWx0ZWRfXzQX/2skg9RH9
 3TUywMHY3Mhua35pgSO6osF8TNr7K3sRThIJp0EWQcKQ47ox8bIDETpzrBBgghcW5d2kzVC1GeK
 OO2TEFOFZce84VoNTVad/71AagnV1Sn0bC36/9MYPACgMQHwUBZ+iHbDj3KCXlv4QWzzKCd4ZTL
 nByWcgdbvflab+S3sBdPxQJ3IKZtWLyZ020bUAAHM7awe7Jlkdbmq1wwFx0Tpj9LE+1dhxXYfqk
 XoaqMFkfgNPC/cOOp55SmlwTyz3KcMqRbFjtvG2xKLkICHaxKVGjhGl5bNKJuxZtBsGbSdZz4Cv
 +dlAv2lZKfmgBqCKGn49NrcGCU7zEMqKaIvq5k5NHUcJcfYHtS3DotT2qfGQeez9d+0KLuqeq+Z
 27nSApLBymx6Dj9rRWshl1XlGkN3W5v2EcV7JbhC+/+X0+Yf4qqjuc77OlVUrmBIu3PkkuJGivf
 HC7TYpLuGNl4B9HgL1w==
X-Proofpoint-ORIG-GUID: nUiVkWhfe0yfzeFxYbC4Ur85M-htGetf
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a29577e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=G7F_0OPF8zoUQoNe8PQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112451-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31133669402

On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> MMCX voltage levels.
> 
> Add MMCX domain to the Iris device node.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;

So the computer tells me low_svs would be enough for PLL0 to generate 720MHz

Is there some transient dependency that bumps this to svs?

Your changelog mentions you altered this in v6, but I don't see any related
discussion

Konrad

