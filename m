Return-Path: <linux-arm-msm+bounces-106679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ2RIBLU/Wl2jgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:16:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB844F6359
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF7423051C6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD1B3DC4B1;
	Fri,  8 May 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grVZ939b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AY8OX8ls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416937FF76
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242241; cv=none; b=SeSr+Qdg+UvZ39o51QwYSDWNSVlLwXyGC4WMDJyUXS/dhUPCeFv7JI8mJhrsHRn5hkzEKNcK9oSWfWKywHIMKUlG6wE2NYWzjPNgC4WuhnaGb4eKyS97KviO+yw1UQMqTVQk0PpucBEYTYInq/3ImaLCGDiJ60tk3TnETScq4FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242241; c=relaxed/simple;
	bh=J/+kV5IflBsYM9clJ4t6z7UqtuIeJJPDMTUze5vvHLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSAUF5IjWucJaZv8l4bFfi9qNMkmqkRnxaKf3F9sTifwqIrUYMXqbgiUAFcr7QNjoO3g1BjFErdQKFJZKZxLP8niQpnbGj0Y3VniuoQV2pWiOt3CodFHzm2ZmVm1uwvY1ZYp8c2qaZCeGaHUZE46iSnGPyxhJ/7avj4hq+X5/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grVZ939b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AY8OX8ls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BkcH74069603
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 12:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHVkjAHeZu1FWC+GkLJmTs5KPwOBnP/jbBXlbQonYLQ=; b=grVZ939bjthbnhx4
	XpZzU1D7FaXx4JrzBO4hFFWrchK9brRo3YLNNtONjzZdkzid4tEMPAcUevvkevxB
	gm95lURTZS87pcxJVWyAnlcBHL7SFIWXh4VIvrTTyJ2zsSP1mJ1UGW7hPrPgDtHi
	XuSey3xWSIUBeocEW7iznbQYelqdllR5Ohw9HmyVXJPEF3SaAlkroHg5kNxR87I1
	t+UdFBlPX7e0bMP18Hxuxc1FPL8SfbKzjkIG5efiANKFEolMW9SIp1wE1C+uKO8w
	7z2uk8O2lMs7PAUmy7vX0QAjtxC8uzln76MFHhLX9LDpbeXMDk2cY49xCaZNTFb1
	vQdDTA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2umq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:10:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313443ffa2so107852137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778242238; x=1778847038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHVkjAHeZu1FWC+GkLJmTs5KPwOBnP/jbBXlbQonYLQ=;
        b=AY8OX8ls1jhhnDkBldp9PrBgbdcdWCtzj+r7dnKMkQMNlHyfFrAVN5OdbxFg/VAAI/
         qfWXhozeLVezYFgajXIuF5rkkAZHJ7a/IXUOCV5IXNETOHgQvnJUEGmW2DbQVJWQkbrL
         fo0EGGq5u99YKCdthGWS7GVftDlwFlbcYchNNDYAkBU+u1YzDufDGpIG/o3GZppHRihn
         ud2Uy3C8+Qoa9OsJwFSY2OW/C8MWefFhvW0FWpHk7xeJlGmZBL0LixCv0OHGQSn3U3wu
         g9gyqDYQqbtP7pG2VwRJ/SoTIppbaMe46i2z5kg8jmXlpOp65T/8IG/QMAydunYlbJkj
         jnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778242238; x=1778847038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHVkjAHeZu1FWC+GkLJmTs5KPwOBnP/jbBXlbQonYLQ=;
        b=PPEsvV/eboL6FWK11DqGLtMNcZMtrEd3Jmusio2i0wxUDx7DgIFDKQbg+jVYdrjd/x
         0B54pEWcCONj4uwn+krNArYkr+4jIb4qcDQOcSEY09SeLU3Ubk8NFpD6u8pEyqhIjojl
         diakGfLlxKWcw3J0xp/TWxXptkQJ2TG8Sg+efvOGSEPfz8O+xUB0ZR/Ed78ukVWNvhpG
         zqJ8tLsgXCEPMDdsi1fpMWODf1GdJ+GfJ/t3dJ96ittqN5Z8N+T6ekiFIvQNCBMXJFJA
         hlSs07D3QpR4DKNK3hSZbkpl+b5z81jGwZoPgMSEeMEuTkkqaWGUsOpYmJqJCtCiBNyB
         rx4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8zaqUoN2vp3Wm10oVQBRk5BA99kygFKg6qzla+HMGrIQ49Eu3ErYHdd5RaztuNpOXHzKdDV5ej1Kb7mFVQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFnKSWh4BOvO3RJ8gRRBfa+1XRcK5OWxiHCkYncNsmeevLxIe
	VoKfnqAG1HO6xnGmKjpn9mUlmGaQAThvcRtiP1ng0xVXVGzcqPxQPCK1EuJDQhDAScn20fXK9r5
	pDj6+MVAEUNA7Hnm4rxIBg4ZUKSGh71xEiFDtvI8NICcMcnCT/pi3Ki6eH2Srr3zeFg/z
X-Gm-Gg: Acq92OGxmhhEHIhWFIX4QhMh2mOe1x6Uocqeixq6/7mVouio83mK51FBPYHasV3JpAB
	LMN4OmfzdWCTXz72+hmQ1JBCph2zNOUCd1jImwXyqNHCkouL7oZYT31R+HXYBnid1ObOlTKSJon
	oXlUsKFWJGgiMGUn1UX/gFLhbOpQC/j/j6cSIeP5ljAVTyTA2i0JUaRZ6uTuI4zNrMRkeVjRQHv
	pyhjKqdmFS/hRItdTP8EylaunCUZGGsanHzQsAYUvrAcw6GhnJa5XIHUA53CLp5kiASqctnPbpP
	4eTjCo6XKLkrkFx9mXszSTWSXxuOJH2/b86NsoLfO7peogtssABNHUaKSXUjTLqw1uZNGRFhcdd
	oSfjcaG/6W435hMVvZxu4NnDWQyl4Zszm06UO1NjR7iFefvCLMaria0pbwGxKfwjre85BA/krv+
	dA86E=
X-Received: by 2002:a05:6102:cc8:b0:631:4d8a:1514 with SMTP id ada2fe7eead31-6314d8a227cmr58942137.1.1778242238535;
        Fri, 08 May 2026 05:10:38 -0700 (PDT)
X-Received: by 2002:a05:6102:cc8:b0:631:4d8a:1514 with SMTP id ada2fe7eead31-6314d8a227cmr58926137.1.1778242238139;
        Fri, 08 May 2026 05:10:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfd34fsm584028a12.14.2026.05.08.05.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 05:10:36 -0700 (PDT)
Message-ID: <c97ffe81-7664-4647-b60d-fd2cd6f54708@oss.qualcomm.com>
Date: Fri, 8 May 2026 14:10:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: tsens: widen temperature limits to
 match hardware range
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
 <20260508100700.772985-3-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508100700.772985-3-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNyBTYWx0ZWRfXx9lKrhVM2PGG
 YH1rC1EMvN/t178KzOkzDsFMtksCQT0jzzWtt1DPTbXTuABRAbOzgT6a3sa5gVFQorMDohOhcDA
 hWJLTeEp4xtif6jmQArYkR3xG1je/KV7IBKRe00yvSQWg8zloJ/AorRaVrIvxJSWLDQ3KvPZTxM
 DosSsnaogt1xi2+lLAtSuY3c7TFP9ckVnDO5UIzX8On35MZZCsmFOzl1QazBsMvtgc/xchAF3cN
 P/dR2wb4CnOLpvYNbFjaAJZdWIMmrB76himbcb34nNXaXyJOMLJsOgYSjV3b5uVgFqfL1qqRj1b
 h9HAjpVaXbhYQ2To8gVBXyw88BtRK0Q7CC3c30HFc5/pGJfMmyk73hQLnhC0OE95f9XYTilcVVi
 7YE912+t8Ts9w2cz/tDBsFZXvBeUnGLrk/s1DnYo5Nf9t0lFCwiLbvhhjP6Z0MCCgFqvLAdaQeJ
 Z2vI4NFlwPDzkuq7naA==
X-Proofpoint-ORIG-GUID: T422zp5HQK1FhXcXPoC86wlXjNoUdrox
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdd2bf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bZ6dXzqpLwj25owkuuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: T422zp5HQK1FhXcXPoC86wlXjNoUdrox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080127
X-Rspamd-Queue-Id: CEB844F6359
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-106679-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 12:07 PM, Priyansh Jain wrote:
> The TSENS v2 software driver currently clamps trip_min_temp and
> trip_max_temp to -40°C and 120°C respectively. However, the
> TSENS v2 hardware temperature threshold registers support a wider
> programmable range from -204°C to +204°C.
> 
> On newer chipsets using TSENS v2, devices may legitimately operate
> beyond the existing software limits (for example, up to 130°C). When a
> trip temperature is programmed outside the software clamped range, it is
> constrained to 120°C on the upper end or -40°C on the lower end.
> If the actual temperature continues to exceed this clamped limit, the
> threshold is immediately violated again, which can result in a
> continuous interrupt storm.
> 
> Expand the TSENS v2 software trip temperature limits to match the full
> hardware supported range (-204°C to +204°C). This avoids repeated
> threshold reprogramming and ensures correct trip handling on TSENS v2
> based platforms.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

