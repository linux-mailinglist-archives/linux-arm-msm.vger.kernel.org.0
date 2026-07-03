Return-Path: <linux-arm-msm+bounces-116322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D8fSFKy9R2oZegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:48:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D577030D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:48:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y733nta0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ChETj1vM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0403B30066AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D4B3D3CEF;
	Fri,  3 Jul 2026 13:41:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2EE3D813A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:41:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086072; cv=none; b=s/CGJVEv0xEKRgOgSRbhvtkIHuIbG3xBPJ13J4dzb7ASMhP4vtCMDF8jlU6IozXKGUNeQfv2RNNe8NJ5bHtUtJ9irggVFAnNm/AjaYu85bWk/vmpBTRl63sqwHelGOLVrK9huvD2/z1aPZ5sqEvAKQOewfh9oDqaC76VcThbnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086072; c=relaxed/simple;
	bh=he9cX6jEcZEfVujqV1zCzc5qhfJIrA0GiR+K6I2CB/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp4IRY65q2a++Y5vXQ6ix4VHAUfa4wBrrYym8wVFvIxcof3QC33WNY7SCLOihjXIQ1EfVXlzFKA81R/+LJ0FE34d2IbETRqLA5P4AqBMH2CgInnlAiSXDnbA21Pknme9s8hUK81S9JNEiHpIJqeZj84aRT3CJmCNk2LuLFJg7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y733nta0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChETj1vM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CwjkJ3194636
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHoWqgO4GGZQYSbUIkeyWKJxMlWu2YG7NbRNUUTVKQE=; b=Y733nta0Ed05LQVY
	2nkqryDpPGe+/VmOmPcrRkwvXjCULclXx+fqYVKbKabzriS3Hirs98E9MGk7MNO1
	vFgAd8eYQUOyya0jdPDfxypWvRYzFNFjNTlQZg0TnrFL2SQOWmELjWWO9SwsKxoy
	lJRNSJaOs3cz61rv4hM+wZH+Sm2WYGKPvnni2myBg1+iYOxTso3oGas9SmoZEHoU
	PjFDGWGqr+tJR0Kn2cvQ1T2T+Sp9/aVw4yah+BCAgexcMXV7f9qAR1rGgNj1HTH8
	03HxutIPCR5Eu56SDm9TsX0GECIE19j4JF7f5H3qtoUQ74nkseCm9bwucqSA/y4b
	noIL8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jysdn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:41:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efc8d8e897so1704786d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086069; x=1783690869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHoWqgO4GGZQYSbUIkeyWKJxMlWu2YG7NbRNUUTVKQE=;
        b=ChETj1vMSWEzvf4zhdhElZOhdXRTCNDqn1Plf+xK0msLtf/9KJDJLqhM29lZBaw5fX
         jjRgntNvPrj0+z5GgPSjjrJoZ2VdLFX1EkQrerJ/9t0jkPsJ8Kso/wq4/xoR/swr4h6V
         oqyZ3dsmzFSZ3XO7RIJE/MR8J/n+XaeqSlLGKYMumLXdT9NaUbao4IX1vo/n3ZD9OptI
         j6RjCM0oeSak/1QN3Ja1JykMa4mh2C/mbD62BdTX/E24X76Vy88aBYPxT/7CF1gAppX8
         2IOQRcutU7i+i/twx9y0kCu6YYh7O3jpoPsp4ifCEq2gsZPccWEOCp7K+4csiPDX86Pu
         Ai/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086069; x=1783690869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHoWqgO4GGZQYSbUIkeyWKJxMlWu2YG7NbRNUUTVKQE=;
        b=i88Hb68NmVtde5E4x0iX5BMGOklqDlPTJzSyxjt4uNCBFEljpxqHD7Tw1pHHW1y7/r
         4N+WdjildXxEEjsjHRqgeidEP1x8VlFiE6dmlkZReyDnwD+RRu95p0Tg/Al1w24mtluG
         PFSNqZz1BeyNIpQJ7jW4ELTgNJ6apnTXcrjzfBbXeM/m1/ZWz0zWie49gjbQ4L9PIozg
         Qur4MdQRcGhPy6rfJiWZ8zErFzcvyFZY+e8J157SjglO7MTVkwLysU5mk8Jr8r4NfhEt
         wtj3EN+xnb43DT28IagVkorgW+kbQgGKpfzXhoLQTpDSlIQwGwrSMK/p0G1dCcdxtHeb
         M8fA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6qY7XwEF+lOqcMuiwV6QvhBdeg3SpVCa9Q6QIN6CRM88vChIS5+B0GIa9UH2wE7eiYc117i4DBLUjJZmm@vger.kernel.org
X-Gm-Message-State: AOJu0YymtV+Jb6dE7HCBLEQvM+kJigeTXPWBDKm+vHei3Hn2GpS3W4QN
	hqf0/Jge5JdG09C1oeP8Ripst6tpBOaJhJ71F2TuqFl9Dm2UtX+7H/1EhS5/LTgkC/l8xOmzvSr
	/h7DYbv31GvH/8oBFy3C5l3nRmc5axbsbTCJ9OUkz//uEpRy3SNBrEZlY2zek7CXws0QG
X-Gm-Gg: AfdE7ck2pawk/qMEJ3y2oWEOcKpi0W0rbnh7Jplyy3P5R2gYfX1S1H6qlSTEYaQBwuX
	ROF2x8tp3Wkk+eUPFgJrviQ91L8Q6YeCv5pCZO5S64+HYVfuRwiz3IbGeeIj0oJGZqU6jxlqjhI
	jEnNU/eAT/kD+tcdo/5sqhuUeSPonhASRDrf89Rw2zoQhnCopsnqnK7djBWNBeP2Y7vJu4JQ5SI
	f32AUI9B3iydOy23K0HRt14TKckiwkH0w3T8Lf6lPRNzr9Gd+KUH0NM/uuDZg1CCaSLRLMYjt50
	WAT4VwrvX/CEjJ5G/EkAK/FVV/2K0O3hG0AcVoC5wBAG5D8QU7qQDViUz8hMeJjx/QPxRe4Kxse
	YEbOs9gGZEsijU5oIBWGxcXqhSTgTeFvoZFo=
X-Received: by 2002:a05:6214:83c8:20b0:8e9:f0a5:b9c0 with SMTP id 6a1803df08f44-8f3c6dc6e3fmr73950546d6.3.1783086069079;
        Fri, 03 Jul 2026 06:41:09 -0700 (PDT)
X-Received: by 2002:a05:6214:83c8:20b0:8e9:f0a5:b9c0 with SMTP id 6a1803df08f44-8f3c6dc6e3fmr73950186d6.3.1783086068687;
        Fri, 03 Jul 2026 06:41:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm2348675a12.26.2026.07.03.06.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:41:07 -0700 (PDT)
Message-ID: <b43bf30a-be47-418a-8070-4a58a1a8a972@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Add trace events for Qualcomm GENI
 I2C driver
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
 <20260630-add-tracepoints-for-qcom-geni-i2c-v1-2-474cd6cdbe27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-2-474cd6cdbe27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfX7xpfZY9uhJHv
 AlYXKAH6j5JtA3QBII/TeXS+9OsfrxahzegSp4xatvxj2343xAbjfdEgVFn/vZ5Hwsp7iC4VXT+
 qwyXoSVsrtJ9kw9WWcSdFrsxotHX0m+hJ3DUfXMnr4C1TsX99NLR3fhZBV9M7i0hgL3thaAqjqQ
 fUnJGFIrkf6KMWCW1u3x/PTGl3sdwRbRxB01yaqx7nPfTw9MMOm7XwfvWnfJ+39wwPUNCqAwYPC
 n8wNRfJUv+jK8H30EDAnXui03kIhZz9FpB61kSKyL7+/W03MSTrGQ5mlp93PYEGKmpMip5Bdpaw
 bsxqRzfJECXXXhoxNBL4wxOIHqvjXmU11jdE3W6Gc7mXuQ01xi0zzVRdwRJVC+GLaEq4O8B1mDG
 o9nnPVrJ4WQUL1VDZMo2fVrqBCAL2aeqO5BjtQf22AtjlkfXXya1Uy0tu4TXbFGDVM4eVn/cM1K
 RGKRsUgGzcCy4lC12RQ==
X-Proofpoint-GUID: IrM0-l2S-QTma-TSJ-KLV1GuSqSYBRYd
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47bbf6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=od6cqOq-T75QGo3hM78A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: IrM0-l2S-QTma-TSJ-KLV1GuSqSYBRYd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfXzBYw+7f7pYfx
 l7jPBK0LUV8MTRgHgOGCVANayr6IO/WW29ROk1ktv+A3LBB+P9dthHIxmQzbM4POCdBe24piiIm
 +57QwY5bq2DnGkDDl+cFAe240SI+344=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116322-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3D577030D0

On 6/30/26 8:02 AM, Praveen Talari wrote:
> Add trace event definitions for the Qualcomm GENI (Generic Interface)
> I2C driver. These trace events enable runtime debugging and performance
> analysis of I2C operations.
> 
> The trace events capture I2C clock configuration, interrupt status and
> error code and message.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

