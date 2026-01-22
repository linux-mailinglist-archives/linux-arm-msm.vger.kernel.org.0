Return-Path: <linux-arm-msm+bounces-90221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHg8F0BMcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:11:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91569AE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA91074CC0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5581931352A;
	Thu, 22 Jan 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFUzgVV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tp9esxJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C33469F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093596; cv=none; b=DX0XbN5TWl99AbJEY/OUeyH0RRWxnwNl1MmVHZ8SGeNSGcz9h5hlKDJ3ahSCFBbNckQMdGcgCl05aBD3Jq2pemxhbFCmyFwgXfY7qxUl85cGq9y54k+Z2MkkyCSiNS937FgKa8XkJzp8nrxhZxARWYTOS4zoIZJtH9QqKE3lh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093596; c=relaxed/simple;
	bh=L9T8UXH1NYSvIwtzU+qeqQBwpQMGhgfJGZjMj9x2vAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+iM92SJh3uwEdFLYyFiCmJc2RcAvTeQQETOgatJG+VS/fqeZjuWoTL60k7slIn4jggtt2iNLQR3LDF/V3cHb+sJN4fx7jPIIdv6soPaksWBHb9G8uxL26FqWwkDl9pHOwvNzmbyDe6kQoTVeHjUIO9ZtjV1xLwyOK9iq+eXfOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFUzgVV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tp9esxJz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7Ola0788779
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=; b=LFUzgVV6p90vmtzi
	YRYKd8eD0/XUcAxS8k1dPFQ4wvA6P/1qvypvd8mTW+gqh7Uz65b3liHfx/xI3jCk
	+KMzxpHM1a2VBGHfqo5rzzFnmQQYjB6WGbSbYcnYwLQ0UEplhOtLWXYm/Yumdj69
	SnW2+PFkDNMK7TG1RQHkihXjECVHH44rthE2QJPBXRa763x5md2WOhwQ10+ERjyW
	Ug0Yjsx69u46pD3lhSTnkpAJ4Kv5RrkDaWL+pnowG9MDv5C5IfCmVdOZLWZ3rF9p
	rzLmWryWVFalKDYEkFQJjOSNRx+gqvlZkW8/X9IMS89+C/I2bSKZZTr7UR8zwy37
	JwMuZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1jt6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e518fb75so11898785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769093593; x=1769698393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=;
        b=Tp9esxJzV3JqOBW2cou2E8WiMIGcnpR2ppzUkuP84713GTAQLSuUgfdBfokbvBQ14Q
         /lRe2Bel75QpOaAOZP8T+ygh6EDyNJ1lCTYj621BBJteVr9WYvtr20i5Oh56YUKhg8r8
         /5xjUajk+XFLIhrRx/wCutJu/e0ohzVrDc+qYaMFwYN1RoRELAG7To954HRS35BO0Amy
         Lbt3z6wK+6YoRFuSsZG1SFqPXZjAxxiVKaAbMoWVgWQbJDvEpv7IlIY2MKS+qfGLSe8l
         cGlh5drfiyJTGwIQobpNL42s9mlZ8l6SYGtxOKMRB655ZP+Vf+MDueoUFM3vzfpMAQxf
         B72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093593; x=1769698393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=;
        b=tMQDM6eN9qs1ArRRnCpKSFrQV4vpj54RfZq75RQUY7B/LiUnTd6Py4LDYjMhMVu9eF
         zdkWUhT01C/bSo0F1IGLq/Q9lidRqae+FYJBh1jKgV07BsTr481IT5ql3LEdDkHwvm6B
         Rnz6xIkdE9qkgdkpEj1rMZXuUmDSXLVC99NYNqif1rMu6MKJ2dpihSPL0bzTbo0+O/Tz
         3omwqxiucNdSbT81cGgkgH5C4zAQFLO3xL9Jv4qLy+gOEiurYercdBfD9hPRF8dGD2/0
         JVcDgBOo19aFWwJbd2DVZwzcQScE4KImMMsxaii0v1h5pQhrPdWI56DXUm6ae3i/V8DR
         kQRA==
X-Gm-Message-State: AOJu0YyuqjWjn+eQfBH9XAFMWOX0R/RuHAgAelF9JEWDwlBWPd7uiHwL
	PzqeU1KSGtrcbl0ZBwQD0bb44+WovdxhdSxFvxNrmbMwVYE9yRdNFmSMqTsPk7So0ocKr0llKSo
	dcjh+PzcsBwWoxj0+pLUiMaXbiUskU3PSHVWuXICtvbZRFnBH+GYGFQrsMZZyE9N7yNoD
X-Gm-Gg: AZuq6aLRvqPIR3MS0amZwomVi4OPjnwDcpqi8TonkkWvIMBw6AEXxd9ffw1J+3/+gsr
	vwrW5M8bKip8G6I2jUu6JFotODdL6if8VefZ/BhdEcbXoxg6D6UMTCPoDrp23k9aUGRKJFfKIoz
	09WQ5rQN+0jLJSigwIKNU6qc2isBkka8TwX9n6qJxYGZXfoVXS3FQMhFtEYdKJ4HR8e15WuDkUZ
	D2E70L6qethL7cSWB2FQZ73y7AeVoFCbFKFab23I2Bovo6Q7pwQN0kAMd3yhEV94B7MROkDXjh/
	KafUZG+okrfTNNEJ13F/DlP5HSifZaEAyZwZoMboLYcMW0+/WQ0rhuO5iFxapq/s9pF7cB+P43L
	ZvMLVT7J1eVgUnE4NlNMAa5akmylFR8mnfC5JJdB8kyKkdGz8xafdUMR8TRD+TtIzjU0=
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr2263858385a.6.1769093592832;
        Thu, 22 Jan 2026 06:53:12 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr2263855585a.6.1769093592348;
        Thu, 22 Jan 2026 06:53:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658029e060asm4209135a12.21.2026.01.22.06.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:53:11 -0800 (PST)
Message-ID: <c4ce3928-fbc2-46f4-a54a-0fc12b86c7a9@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:53:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] phy: qcom: qmp-usbc: Prevent unnecessary PM
 runtime suspend at boot
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121142827.2583-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D6IVnwi90OyrX9kTkOt-5DN6Pk6aIEc-
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=697239d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: D6IVnwi90OyrX9kTkOt-5DN6Pk6aIEc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMyBTYWx0ZWRfX5yC5sNONGJWt
 m1Cy6YqJfrZpb2fv2Uo4RnOdKgZBvgnmVsjZvTXCGz8DDBorr67Dc0uAE2X6I0HludhXMBj6J2Q
 rNsZc5vOVgFE597fECE+lBae9tjap1r+vB9t9MWMscpJtFHCWJLTiQDGeMaxKRo8xv5byxjM8U0
 UWjIIU2NOtaqqq+XK0DryaSTTSvmk4p9YuMXb63KRmxH06Jc0w5DmI1D4D+KimPMK2gLi3Mzey6
 V52gBx3/lUJH6iuaLm+JbqsUtIHWVLAuyJJdFtUMg4k88wwE8Y6stwE320z0TEn9H47ZHmkYZdO
 rE5pjF9YEhdKY5Dk/FGf3Z2TGkXU02RQNlmXlebab9KJiIPMw/B3zawu6rLx+b+1hCAYEuX0F2T
 KV8VwRuba6E2Lv8rnXKPUuyaJHWg9039Dg2TMabgYbn2FDfPIw9r0SUl4yYgt/7mk7Uh0+saqZ+
 TdxTVFtn7y5Sql/cS1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90221-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE91569AE9
X-Rspamd-Action: no action

On 1/21/26 3:28 PM, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


