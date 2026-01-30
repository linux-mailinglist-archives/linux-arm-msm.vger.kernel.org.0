Return-Path: <linux-arm-msm+bounces-91300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLLRJpyffGlSOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:10:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47887BA578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBB11301D041
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FD137649C;
	Fri, 30 Jan 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq1WdLaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXz0t+Js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B1136B066
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774988; cv=none; b=TECswvc6hhfmWGupjVoJz73R/NIdgRFClMTdsORC6NtBe9OojAdue6W3cATIVqivOt6LsldI1NISS63MkrZYxc+lC+B5fXwSRLEHty5/DZJ3n55uMjuAT00Ne0+EN689WzNjDNVesTCANOVVZFTzDjm+U+H9CpbT5Wx+fAs95zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774988; c=relaxed/simple;
	bh=B4E5Rc7ydMSkhCAXk+m65nqa567Uhu5nj9sJQiCD1+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzIlbQu3V7htVWko0OtSMpNqb8Ib8Lqa1D+8ekVz8SuWGJrDH7H0z9uqRjkvjK/7cwNagQAcLlPdjGQuebw8SrisfDbTImgPa9TAdZGYkaO2tdV8G6WTbSF2DeMrVC51ZLHyqHRZUKVzHB8h4BbaFaTdq/ZGvg4hSRJzoDUKvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq1WdLaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXz0t+Js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UB5WK8890991
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=; b=Zq1WdLaq3JLTRwGj
	Y66/oFEePtIsek5vsCbpD5JGZdP7KCgpoTiIdEShYDlxXD2ubLUYqfSmN7Y53YIa
	3ewRzH/Z78/VGtFPvawg8TF8RhymZLO3NVL0HcgjRnbOTlBIb644tO8TIcBUZ6dm
	IKjAJdt4DrI8OpVP3I/nCqiybZJGrlMnSUu6tB8Ylnk3S+nwU1lphjttA7RQ79SV
	FghrNkAcvtOZnfi0rNiZ+Kuk+VhmntdBvERbRws/IOUZp0xLYotMVMcaPrMQkYa8
	vMLYlG0NO6FJyFSMqeNo7BwT/p7pWD+JvJZvlN03L3gYAgaWW4TEOCZnPVqPDkGl
	VBgKeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7t2tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a377e15716so50624005ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774984; x=1770379784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=;
        b=MXz0t+JspKBpekhFRRYC1q1mGxKdifaa5VcCK+RrV4HcxvpuB/bwKWWbQavD/YvT3I
         iph6iZk6uoAT6r36AE3DWELH/O9F9Ib6FRgojGKqCPPnZvrpcR013n/+VggjXVSURjwf
         Qew3Ui2U6x3eRfupLumfSfp+btaK6FETXTgbjsXPyggyexWPgqK6s+RqHa69i8ZhuwhX
         y+kuGua4xBuymTgVzYw71WL30uBqadHt13urPn9CAjTp34t9JXLbGoiLqA+BAlcTU+C6
         PA3x351MJehnQvyk0i/rMg8gke0MyWRjby/yLLZzzrnQXQuW8gYBZzUM7Dt35xITgb9r
         BRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774984; x=1770379784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=;
        b=ra3hG/zCfb/NyGz2rosD/RKJOa55EyY7GeDXHrpwLsCe9wxUa8/6oLlW52KiplnIk8
         cNDszU5sl+vOTTA8b//5Ou9odP6nHxM8LZwKJmwNfpjBdiRtZFvx6ypTgqBLoYDkR9pJ
         QqZe3F4JKHO6a/bpLNihWbFELSI5864ctbN6ZOFnRjX7ApClNmCQ35DQc8GCydpS9C29
         2RYKJLCCP3631LyXd4P4L0xZ3f71WPmtTfU0F62JgEmdKPIcWorl9l+E5GPZ/dL7s/wl
         5w1JPNUCIDF7uJ9jYm6ps6h+iC94/+4uKTuL18XvtCGOVvwsIxwR2tcgNOhvAOO8v/9Z
         V35Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/jyakFXwbGgS3DgC0LdMOra9mtSOCWQth3FbNWzsaodWOLSPkLhAMm4dt6JZy6lLyeOLfFLJoKZYJmKyf@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhxAlTIYUsIl2sy5OeBjQZTyHcyljLJDTJHKC0lLhJegr68mq
	hzyElPZ9ThqkRSPLfmV9WL3/6P2c+Vt26ANia549VBE7lwuu37sFxl0ovhPUTBA9HsM3NZ4swL5
	SOF9bIBbQ9G1Sjsih6cPogu3eheKpcdC5owvGm/JTnnmmKC2O+VMiip/VzGs0YPHFOOAp
X-Gm-Gg: AZuq6aKahs/jpWSk5iq35d8l9He9+66Z9QE0304CqgdpOD8Ut8Aj1saHxCL/91GzVcc
	YSN6LRu06J2iCgVCnyjnOwBVXTIWToxGPnlps552dc/u8oZJkbfAvI90WT1EKV2ehZWhAfIvQ0Y
	LHX2J4QxHz15CP56YYz3e5U4cKZHPdDnl7dIzv8l9M4UKIA5/6Gs94mWqPhUNrjC9wsDm/Lb1WM
	gzqYRfCiW3dn5D13fuSwOWoTww2A/aq4klDBx6WqgIoP/drnBIAJ4xNRdEMWOkpwRm6yFb3sKoG
	TKnLxMH07KoL6pDuo2lJVKMxw+6FBLUJFRg+Sw3nCsUDlu8X+0d7Ae0czShjmZNEODRlhkyvziK
	5BAKkGcJZpKHHVc/A+EnOMgAINM/1xKoZRLhBjIk=
X-Received: by 2002:a17:903:3508:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a8d99129e0mr25485485ad.30.1769774984429;
        Fri, 30 Jan 2026 04:09:44 -0800 (PST)
X-Received: by 2002:a17:903:3508:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a8d99129e0mr25485145ad.30.1769774983963;
        Fri, 30 Jan 2026 04:09:43 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm71343445ad.54.2026.01.30.04.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:09:43 -0800 (PST)
Message-ID: <f5c0e401-7053-1fa2-299e-056744daee0a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <7127f32a-0db5-4f30-b1b4-cf72fc117fd3@oss.qualcomm.com>
 <hkiyrszvcnczancdrbxgjkvyy2ifk4fm74v5meba3fiuseder7@yagmskxu27gh>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <hkiyrszvcnczancdrbxgjkvyy2ifk4fm74v5meba3fiuseder7@yagmskxu27gh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OSBTYWx0ZWRfX3aITMFnEECB4
 UBF9+xJ24C7lMsq9D4c6qmHIPa8k1IuiBnHRmsjiS8xeCxu4tvCkQuhBv0MWnYQdfeg6t+x9Qfu
 xxWxyes/nFSDzKaTLkEudhkAZDtsMGNAhL+YlF+K3tGr3PJRSACNtAChsGi0RH1Ja397lqd4TNv
 nK845e2CgCOFZtCCUwi4njFtbZIbdOsn95l3FDjcSL9Xt4LS8qLcCkVSSTxFX7ciQ0WeKoTrQp4
 NQAirE075tkAcZzpR45TDQ+FFv6gRRNWdc5/0n8QwkgtgggdDkb14Q665Ox2bjIir43ztnYm8B9
 R2v3qAOP0UFrZioIm85BVIiWCVt1TUvwKDtWVR59c6xIIssWlvbE7uxhAh2XOQxy0cNtCjChtYF
 z7xESKXir2sKVAfaD2AOZqB8wt5myZMc4n215pciOgk2mS/vLcATBgJwvIDoVJ68AgT3+uxJmKK
 WPZLicFT+SbuUG58DtA==
X-Proofpoint-ORIG-GUID: qxTYkeZsfoyWkF0zqB0LdxEAd0fKaok3
X-Proofpoint-GUID: qxTYkeZsfoyWkF0zqB0LdxEAd0fKaok3
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c9f89 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NYMyJ-crKx8sv3Z3ZaQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91300-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47887BA578
X-Rspamd-Action: no action



On 1/26/2026 3:50 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 11:00:56AM +0100, Konrad Dybcio wrote:
>> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
>>> SC8280XP having just 2.
>>>
>>> Document Iris2 cores found on these SoCs.
>>>
>>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> [ bod: dropped dts video-encoder/video-decoder ]
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> [db: dropped status, dropped extra LLCC interconnect]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +description: |
>>> +  The Venus Iris2 IP is a video encode and decode accelerator present
>>> +  on Qualcomm platforms
>>> +
>>> +allOf:
>>> +  - $ref: qcom,venus-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sc8280xp-venus
>>> +      - qcom,sm8350-venus
>>
>> FYI the hardware is actually named "Iris" starting with 8150/8180
> 
> I'd prefer to continue using the name that existed in the earlier
> patches and which has been used for other chips in the generation. If
> maintainers insist, I'd switch to -iris for the next series.
> 

yeah, pls rename to iris, that makes more sense.

Thanks,
Dikshita

