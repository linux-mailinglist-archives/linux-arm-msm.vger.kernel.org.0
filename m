Return-Path: <linux-arm-msm+bounces-109040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNvqNV31Dmq+DgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:06:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1125A486D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F3713011BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A653C8738;
	Thu, 21 May 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLoAeiKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl8rqs27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58493B83E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365042; cv=none; b=ud4qqe4S7UCIvjjTJuX0kECPRXybIFtsGymLqT2OaNn7oUpWDgo7a2UOoJTyKuj4oY3CDaZRtxgCUlw9MLdOzHSfCWH8xkXNlsUNKElNscSSOi22rc9GwQCpkqVjIgReA/hSYUMe94LGxKE8/gJnrKEIU5RTxKtTSzmJ8gDDz5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365042; c=relaxed/simple;
	bh=vi+ktZKZm9Yy2L+06r4vJsXGCOhQz+Pz0d6iDzYMf8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkU1RWNKfqEkM/K4YNP/KGIjh0jMhEJzg2X2sNWdsmLr0BR2l55IkRfhYgk7Sf2jKTrVKD5UcHyTXK29BzHeZZXYE8RgGEwRcKD0N2BLfdl7wL6njfnF7FLOr//7SV6nqpCFYUExH/oLKVQmvsVSGaKv8ACMZb8YyuAmBir14gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLoAeiKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dl8rqs27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A6iU3452608
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUELNXDXE7Cvv2I02S53zLhzYwfJypzl3RST9hT9jEY=; b=bLoAeiKUbDoKe8FJ
	mx66EZYJrwXLvJG0xrF3iuWtpbhpCU2xSlwwg1C1t7PAl6EeZZ42pR1Q6TohLfE9
	XZKtHCeXwVWoxaAWsrzJeiyTCzcGjKU9UYT+bIFcgXVB2SsOzsoN2RhnZ7ISDSfv
	lmeLcTBTsvwHrO+w9hCzrf7KmazSql2UJmoWvLxdgcBGzOkIthEUc53QnZvqxBv8
	StPYoDy4qRGViOkV2p+lUfLL0PWlMv9+cM6fHUbTFL7DLkQuREB8B/4QjySX+Ym3
	mEJiivhJ1HsB14SB/G8Yxq60JoQNoxJhWLz/cC9GtGm4jxhq/Z8lu7gvQIQdBW5C
	bF9pIA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8q85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:04:00 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e5f56b8b91so69020a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365040; x=1779969840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUELNXDXE7Cvv2I02S53zLhzYwfJypzl3RST9hT9jEY=;
        b=Dl8rqs275YeJtR2XsD7aDFxkQbdSnJMioatq6KaGX8xga/PCJed7JvR9MFjnItITcc
         dJ8ncjYPUYSmXhwMTIZBtvHrbjD9MEnCg49bEAy4nFwxikhQpYjx56bLqc1gdvwWoyE0
         KrGTVqTF5gI5IkrGkwI4q49Mus0gq7a8suHlAnp0JewBJfFjA6cVepMSKm0tj0TGoPmL
         xJFvsgN1roM9NHNGiteyFY4b1bwpf9lWTVh3BblQl6lSLhDTsfQdjGswDHOCLIwOav3w
         BvU/mIBeH2KTSZHVXrMJx74c2GDzHTO5HH7UdatdOt6jNzYLOc0MkgvQGn5QgRlMRv8p
         ducQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365040; x=1779969840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUELNXDXE7Cvv2I02S53zLhzYwfJypzl3RST9hT9jEY=;
        b=mtwohSLUTt47CMyU+mUeG2bZpM8NO1JWyAUpFi8uyVIFRE59vHEhi/fk5gBv2Grne3
         9jHF2u11VXaK6QxDcmWoLQe7k/1zQVrXoe1j8o+NB6pnnq59y9rTKU4MorB3ssdGfNPZ
         Vh77Wfu54xsBKhCEzvlt6MmNZW2+XezzZ0i1Y70D/gjmeT3ZKWm6wzjGXwbYiwIh6zob
         m+L+q/Wnone7qM7Yy1D3Iq1MwhVb+GeoSOT0arOZjFIJO1qGaXiOV0+fGdPBFHycpRYS
         I4AfzEHHHlhth5AC9A2kw5q1hrC5PBmDLNBfwrRXFqmjVQKH5Sob/nBPTc15GIY3D68E
         stYQ==
X-Forwarded-Encrypted: i=1; AFNElJ91k5mmBqmchjaf5GJ6p/Qj/TuPvmYCy2WJkAvaJoc7umOfBuGDr98okB69oypaNOCdfi4jqrVEkQfttLOx@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQDRNWp4QEH0DuM7x3gDxaf28rt49tEsKJaZyNxrCwZ0ZUkhN
	RZb8gPDL8iUcCPicpJIKZ0eLp81b2He7Xf5Re07xjx+flOdhK/rBmBg17UFYml0rxIgzYyi+EEK
	mT06Bry+1YRGSq6AYZc3dZ0w/fjHMZWxeMMkcZRXW+8r7Kem2/A2gVbi7HdawliNBFQ3L
X-Gm-Gg: Acq92OEWfSVMCOkzwvM9rkfFOsDarvL4tnS2QPW1hGKFgItihF8VQk3MC6EVetV55qN
	3nnzjIo1+A4ZCrYZXC/LG5xMcl6P7IX81C5b3nf/ED7U9PqZ9vvI0h6wpsfAC18HDA/EI3J+vVz
	jB0fNBm6uVeJctoBnhZ8BhMtx2RBdDoiv99dx3xm3muMPDBTBYb0qMTED+i9R6B45DkxGtdouTS
	6/tKy95Zyro+KK2mXGVIZ6ix66vF0tC5PsO7U2krnqXg44EI/uQoVRWtaP+dC3A61og64zumxOy
	J0yb5viJwz/oLtOpuE7GjvdwGlezvf+E6bEEbgXHhDKDjtQlohV9lInTVggkbHxjYVU5stlDimU
	2JPJjO1KA1dVPbyMc0BTqMjyYm3G6uuHvJCFlMLsHEFHppUn+z7vnudV+A0JaWEQZfthdnOtWU9
	pNQ50=
X-Received: by 2002:a05:6830:4c0c:b0:7dc:c5e9:b99 with SMTP id 46e09a7af769-7e5eca5c102mr836613a34.7.1779365040016;
        Thu, 21 May 2026 05:04:00 -0700 (PDT)
X-Received: by 2002:a05:6830:4c0c:b0:7dc:c5e9:b99 with SMTP id 46e09a7af769-7e5eca5c102mr836593a34.7.1779365039515;
        Thu, 21 May 2026 05:03:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e964947sm57293a12.21.2026.05.21.05.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:03:57 -0700 (PDT)
Message-ID: <9da6954f-79ef-4510-b2e8-741d08c04d15@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:03:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: scm: instrument SMC call path with
 tracepoints
To: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
 <20260506-scm-tracepoints-v1-2-4bc983264014@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-scm-tracepoints-v1-2-4bc983264014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _1YqI4ZhdHRLnksl-G8zwAOpuWTx3u9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfXwPRfJinbrano
 GGDj7GYglIMs0AuP9TMhQdgtWhpv5FKaKW1It4l0mWfNSs251LPFeePU0nT4UHbP2z2BlKaz7St
 5NWB4Sfb5BJNcxxnT2FxzaqxMGZHRUnot+us7mBI5YrLvBx5v0AcmbPyUpHcYS/3JfQH9+mufFd
 532+q/zt1zTiJit7cJuVnsFsLSvnrmox2CPvx8LcxIJ/vDz6WkphX8T8a29kOcfldNS6RDQoRIk
 cf6qeUXV8/Q7M4RUht7o0vSOMM1buheu3TnL9IdGTQgOnXkfdAcE0cNKXU+r3fSC8kXMhFpuynS
 nX/bMmNEkclW1AWKSfXuZ+6TlXwsbqYWPsbq/fLOB+Pv4e4WsbzunGDCV2vtFKIoTZDcMmxRkUj
 JF9rzSkx4EWM/2XeoptqSOSSQ194DZpjolc3D/jeJpmBl2P37QVgexnL+I+Ii3eMKa/9q05sxB/
 Xw/9ufB4PbEdOPtbrHQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0ef4b0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RlSQ44rCwcSWJ_mFnB8A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: _1YqI4ZhdHRLnksl-G8zwAOpuWTx3u9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109040-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E1125A486D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/6/26 12:37 PM, Yuvaraj Ranganathan wrote:
> Wire the five tracepoints defined in qcom_scm_trace.h into the SMC
> execution path by including the header with CREATE_TRACE_POINTS.
> 
> Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

