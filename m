Return-Path: <linux-arm-msm+bounces-102270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN5KLBAH1mnbAQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF883B87AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9D783004D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8009E382382;
	Wed,  8 Apr 2026 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0K3k3cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYi9kp5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1D383C90
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633818; cv=none; b=rOWlO86MBD+9ietRRzPXNR7qbBuOmenOoJNqeSG6RJ2GxfzOl93LqnAPTjsbe0R+kEgKeffFalHulT28gsZfW2ZH4uxMGHLjAGPNhonAlC369QwdwVplQmtCYZTAB+WPXKdcxc9uhQdML41IRajII/nSSCgh8ZN7NT+mlk4o260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633818; c=relaxed/simple;
	bh=LTWCfOQIzMWLox9Xzjo7jJBOkH7s4/SrN1OB8aaKQQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ukgtm4alCz8QnztdM0u4z8RBCCnNNvI+nsDdYzrSyLsZne3taIZdXLMN6xPnGfaSlu59CMeiKBTL2MVuGT5lcO/CoWIQ7voQOKbnKL/0CQx9oeqUnb4tIvBJESzrpGyGj5bpWM/nSOuDptYTyM0gMcBUVUHMyPHnVp8Iwi+VYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0K3k3cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYi9kp5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387Q2PG2861191
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=; b=P0K3k3cp7IqmZJQQ
	YQ7RGgCppWOOh2CBadHhcxzE8ak7D9xM6hpjmAei1mzpJwDU+2CFLxpy/Vaiz5Y8
	PvYq+UU9TGJcg+beHTmeNxHn4eZ+nncr/zsC0ee6T54A6FCWMAb2/mJ0aF55B3OW
	Op79Hj/HtYutQ5gCYBaDs/V+t4tKv+jWM+rEecgPW1URmcGCS7cWAkjiOHFLcUKn
	mCogtT9jE7FevmbibSNRuiymAZeI/IpBhwsMl58RTYNZJxx9zGFabxhIOCuaeyf0
	A+l8hPjUMJ8WzZTNfCgBiyAEBR866j2X9nYQBZdFlZr0fzxWoDQjOjWeZGtsToAE
	euOs9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8skd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:36:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6999148a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633815; x=1776238615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=PYi9kp5ZZw7HzlELf+KD2bCzlSfM+9fBQAl+HWuPhiY3de+NUl8ANqUUOxodblSSAr
         qCiKyBYltb+FmyfJWNib8neQU2bVg9shFf19bMgHGTU87g2u/ayU69+1b0xCfWrlNMWX
         5ZWNdMRnsfhUaT6N8ymEkz17EYUWOqRu7ObsL9Wmoq4FmfXIHmAThkwaGQVz6fVRUhQ8
         YZsNkWhe/WhiIh9PcdFooQY2kGCcFXe1dGVawsnjDrCYikxlzmldkvqQ6mW891dfU13M
         k5xnCCT+X3yVR9/7oxmT1BQq7LFvuJS6GbQK8agHeIPg/uxryQiTthXPOrpfrySagAaM
         P0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633815; x=1776238615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foXQZW+HFsYsOpgbdU9gp8rFPeiZKMy9pLJVC5jouzg=;
        b=VbR5Mt0IuQs7fqijzPrkK9WmCP29k/4UspNJan41El+PQk+KlJjqMUCVhJzuXa/MiM
         /XqwuudLO/yTvuCdt9WAFgxb/yK9lNvZap0LItH5cK1ybqGGJ65egSohhlI7lRBmprCa
         a0j8pFRTyTIjBca6IeCqyj1ZA41kMG9DVHlrzu+Z0XdII6KmWgF9v9y9W67r96pbMS1M
         LF3E8OHz2VqrWMOcR8rR7zZufx0OmMKSpfe9RDm0QMpHNCcOGjgh1nZQEHJ32c2bQ/Lq
         fZKoaf/YhhBTO7jhU6BoT0nvTYUMf06ncw4vUEWl3ZuZh43r69Gq/qPs8wMvIZufw58Y
         wkLw==
X-Forwarded-Encrypted: i=1; AJvYcCUR0OH8CyCcN7jKdfI+bEnq/ZBSy/Kv84kYGioT6ioipzVyj6pRBGge9/MpWFVlITIH1OMreO8+jY6TmMRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLq868SlOHILHykpRxtQv6QjAOtkLVphNEq2ro/B5LP87nfyZb
	CcmBlh7Da2a3xH53Y710aDodMPu7HTMT1qsB2bLO4DG7eL+tQ6X0FY3a9yQ+0DR3i49x3CxTR1o
	ovaUHrhz+Z1uyQqK09P8RhZdcdPfoA8GYp7B52y6L0sRxWZS+RlgjhZ5BZl+ptAoS8M8z
X-Gm-Gg: AeBDieuIZ1q3r98bsGCmnwCDezX4JntMmi1Rqij/vj8vtFwBWSRrhIRruAUdwOIwVWj
	e8qCh/j09CF/Wz6hQVOAmAxU6ZxhC4xspgnXKrquwq+u5DAgsisGHmMlw2+dgO/xufyT/TNpW0j
	jsR6zTAGoU+7spOlY0kW66ZIqsN1Jel0YEKweBsOfjZDkIffJNGy0GdU7KyiM52Ur9VWLRf92Qz
	MxOZfADonZo12BBDDLGEK8Z4In8xFpjxeUM+XvQqnAOTsB7DEjg+idvVKo5Hc1BFO1suUweLtXd
	rM5qISLRdfVS2bCdoi4Et19sU1Y29hu2Wzob+wBZliqN6kiZbhXeK5xsWvYrcQKk8fnWAxY1Qjf
	kkEm/kQHYAFmW7K8XFrWZCmevi9hJENiTDlczoRiLARLS2hlEOw==
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708385ad.23.1775633814976;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2b2:4260:109 with SMTP id d9443c01a7336-2b2818b011emr206708055ad.23.1775633814473;
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2adc8c4ecsm46328265ad.5.2026.04.08.00.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:36:54 -0700 (PDT)
Message-ID: <3dcd713f-dce6-401b-8c1b-194313ec5e05@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 13:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
 <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I1coDeKffgbCn1JaFqMuDJZlaIsx_oG-
X-Proofpoint-GUID: I1coDeKffgbCn1JaFqMuDJZlaIsx_oG-
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d60597 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f9sTazImdp3HmuBAhI8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2OCBTYWx0ZWRfX3thhfMI8H8zL
 ocFB/Rh+wQew3q65bvhtk6on263ZqlstlgxVFvpp3g2m3ip/L4nqeE65i/dd3tICOpJRsPCMk18
 9rIKXN9XwYR8gTDAVaD20FwSU5nFlcyAp4CNlDhzqTyWW/8AoqT8tUe3Lv7fwDzfLwS8srf/dlJ
 lsJ51AhKzuk0LcQcYYtbUvASB82IquJDUdXihmluOPhDECYbs0NMgPsJeMWEwNbPBIItVSF8Fgj
 9e5ufZzzhVTa9qEC8ZIxEMs4DNuyRrBjjW3hDk+Rvz79dHpXOvWdCdNznnxDjDoSq8wA5BJ7Xoa
 9giKdDHeR0Okx4HetUp/5J/0Obd0vJ537+QDFsn16CGulL6Vz7Oy3vcSRy1Z8O0lt6wrGMn1wvB
 UKdUoRfS8Qq2GHWJ+LrJfiWFtsOGIWn4XFAnJ+lAU7gxj95y80vtnfOk1nRLgZwq1rbpENi9exn
 TBtg1BYuPaNHZhpGVFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102270-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFF883B87AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 7:10 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add compatible string for Eliza video clock controller and the bindings
>> for Eliza Qualcomm SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>
> 
> Although I already suggested that this was not tested (and you never
> replied where did you test it), but I also checked and this fails checks
> - constraints are mismatched now.

I will update the bindings for videocc.

-- 
Thanks,
Taniya Das


