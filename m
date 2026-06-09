Return-Path: <linux-arm-msm+bounces-112179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J0hKGKIVKGqw9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0E66093B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kMFXdbLt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iTePdh9t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112179-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112179-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3723A3013495
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD44307AF0;
	Tue,  9 Jun 2026 13:27:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E732D0C89
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:27:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011666; cv=none; b=D3T5fMKIK1xr0slzpjC5/Z3lbij+06PVOcWDiRBGQopJTmpLqhEDWcN5nVZgUZdTYOpRZnWtKZQGHyufb6q1bgxgEg8rPbVH3dzTOa9yoPy6JJdQKccH6tqVVPUVMBKk3i0xsUBUuolZy31RO2DDXhrmJTqgCioxY175gTZ7sD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011666; c=relaxed/simple;
	bh=nhc7KCz+OiYOb+UWgD3CZUOWb1ZWdh52MnddLfgT8QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGQ9FFVEQ/ysytBRa1ds2P1whgD0PhhDZozU0gBCQl8ACJiuWELAPgi66LTeIRAAFJ43h9SPR3CG3Bne7yvWFP3frf3Whueaj6JcurxAifIkxVmJFbeFwm7lmHSibX5Pi9tr3F0EGuV5b9xtRU+q6a0pzRi2rgF3ihG1nkPVHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMFXdbLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTePdh9t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmGRj2587822
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=; b=kMFXdbLtYgXrT8sa
	NNtgbEqztvNikKrbSGT4KgTpkyEE377r12AZdx4Q4gsQ9HCCXamDs/AG84QjJu4V
	6xFT0nHSDSUy+vLhhmbsAaqM59S6nPCvKzPpxEqBObgMAtQmIxBs6CYwVTy9+f5C
	wAo/JWM0xpQkpr4C7y0l++x+aBadls/np1Uy3PWugi1p1IM9APCulfnJScl8VXyc
	Tpp4Zrvv2xXlXlu7RZ92dZScnEzC0Yvc1BUkPrFIbIhqt9X9c8GRw1zn+yDFDLvU
	ZHwg9QaVcws50w/cW1x2iH5rCiJIPJB5vcEDMfwwWKVR0HQoCQGJMf+rHbT/uBlO
	CU74GA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4hgxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:27:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so16572981cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011664; x=1781616464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=iTePdh9tlDtOHRYalu3pLZSDBKWbOqAiWVAc2XCvx7zaKbEIoRoMG3QpsMVYgNNYKL
         wUIYXmT68mINlil9dJOR4/Nn1OljEuv478z8RMj63sG/PmEC1ZTiySNvVuVzotVX5bBY
         0M0pMwZAbYUReEgT3Kcj2595liYE6YhtpsiVcmiiApdXlwvn6a5rxYFYZKyFPO+VfWbj
         WgrTdZ3Z4tzTtxDjXecWUMstVqH4YNPaq1ONCf+JsTSvTTiP9gZuno3p7Q0y7DbZGqUx
         136kvnonI76QVefg+mrufGeYnNCfY+GGkltsMXl2zo9Vio4ZNkdnhWUK1voA/0sEIGes
         hTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011664; x=1781616464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=MmXCS6mJez3yH4hpGxt3shf8f0nayJlZ7o2Cl8ru+00HgdlWPjxBLLOXxPOEI0qTtp
         cgdKaZ5IT6cV/JkcGK+a+ZcqVQtjthwF5E9d9cOorFevpkOBRka4YU/Nfank/VEy0ozs
         DOXaDMjzgvUwc9fg5HWWxAzl6mOM6fMbBbJA9pi0jkY30N8SjMbweNRHazRb2qbCNM1J
         CAECGLpP/UoQIFPs4rq4tQ7O8IKg2sg/VYBTO/T2QGWCsz6hxcT5Ug74jR/4kU33/SQt
         ckgWD7ppKz/hlx/57tgOicwzQPov31MIiG4bWhsSZrKO227BCz23WC5Vgmrb2CD4J0kM
         p8GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w06JEFiHSVbqagVK9cLG5kKAWLN0C+cAE/zUyj2vVDlSC8ppJXyKhKmShI/77q62ooKUeaeoNhpoiB7H0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQRp3ftDpZmHu5Z7Y9i5TCt/tuxmT8FNSfm+6te2lSMMCVZzgm
	yiOvZ2ulCs0l++WSfs7k3xc4VOw8aCERizX460MaH4dUjwd+VgYzhWG01A6pdjLWzY3tkR9TVa5
	MPewGqmzfTBt8u8RT6jAoUeruIGqDD9kKag8gaSFzPT/1Sf9oilVjuo5U58LB+yMEjzbL
X-Gm-Gg: Acq92OFXVeQIEAwc7BOwhRn/pYTEJ3uglMIecTNpHAxFook4FBkunKBdqBOQscgeM4D
	RoqoLRGz4jN3Lm9QVPPIrNtdi/XBKgtUVVYE61wDiWHsZbr6BKNg3bpmbdfurxTorYPL8DE2TGM
	rwwaNBC5zhAznjQx6xmAskc7IsaoSVYtnoTSVwKgRNzRDMVBFlFgTPsYaC1VDVU9M57+TXAk6Vy
	BiXrxI8A1iDV9X4vMV5fApV0XWVWI9003LLMJnTAL8qmsbPTXWvPPLsO2jwAP632k7Nfu/yBTZY
	2Cf3HH/Odqd9NHR8nE4kKaT++k5eiHpWs04IuKOgeqDsxWmLP03S2JRMF/H8hw8nrQ432zVq/CJ
	Z6NClM0IBTmH/oL8nNtKyRrMIccub9t8FJQOsY5SvcX3mqms9i9p4KOOS
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190603491cf.6.1781011663541;
        Tue, 09 Jun 2026 06:27:43 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190602771cf.6.1781011662748;
        Tue, 09 Jun 2026 06:27:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1058581866b.55.2026.06.09.06.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:27:41 -0700 (PDT)
Message-ID: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a2814d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZVpGCM6XPQlVWg26268A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XGBMWD-qL2gt-8GL7c8wjiILiPguwmaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX0gh53HwIf650
 Xs893PqEeFGgiRIfAZ7SD87TmLTcvdobES85ZlDw2z4ry5e0YUNee2rxArk40xaFjE/5igonqsO
 Oy1XJK5tfP12SlzkjOBQRG51juWOc2TFyRCCI7jvgZyRp1I/10Bc4CBiIAkoOOcKUirgpkfomce
 xssVpXvv8eFKqzYfo2AUXDEoDBcKvMkmIhvU9dRZqzTyglhQHUz1CXrs42CapJiP26NLnaZ5j9g
 8jx/hlLUQezZyoC3c5wZJtfvKGdMCnYbTrug5pOayxl5jRQn5C5jf42vFDf46q5qoqY0gEA1C8y
 vWrbMjoiRpDBKLDHHkxkb0VjdjhjRx2GxIa3ymlW6i0CxkZM6PTpj0ccUmR9EzU5A0lC5S6TUji
 L1lihO5A3sa0W7De1Wq7koO3UJ+qnXH/31zzyhCpaj7ZBML2gBoGn2TAMV+pURSJGKuEq9J1Xr2
 bLbDcpgqFfeHKtOIfkw==
X-Proofpoint-ORIG-GUID: XGBMWD-qL2gt-8GL7c8wjiILiPguwmaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1F0E66093B

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
> 
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60

With the changes split into separate commits for each platform:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

