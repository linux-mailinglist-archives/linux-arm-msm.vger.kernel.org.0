Return-Path: <linux-arm-msm+bounces-95872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBWjCvf8qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:12:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C596B2249B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31966306F395
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC023E95B0;
	Fri,  6 Mar 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdKLaLkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRYb4TPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DB03ECBED
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813246; cv=none; b=ONfSjT1XnwfQzWTfZipXD+jOID4Cm4tcwcBiMPOVPnaoKENwdKBnZ7nxXwIV7Xcy6QOPVwGB3bzVXuN/ZkOxFZcYgcQs8TL2x5WUQjdHH7//QYNzVHvephOaGI7x09aubSddf2FvcLrq6cZYfVRpLQ4k460aRG6Xm3B1Jow83Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813246; c=relaxed/simple;
	bh=cdxKXLY4dYCWYDvJkWDm/Fa2uK8iUSliE1rdVGBSmNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlE4nQkoeGuPlwV/xQSRfYD9NQ8nxUL+J32Q1GGsm1Z03sIHhz5AqWo9xCRgT1lE9ZblBynBuJrARB44f0NEr8lpm1OAZkRaSIE7zfQDMz61DlqYjjrRuBucdfO2AF+L+S8VRI428au2cc2XL1VoSsuQsH82BSbV9mTNUTr4+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdKLaLkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRYb4TPe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FquGJ549900
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6rjc/+TCoxfFxZSfhxFAwcD/5kiCHA+X7AyfBBMsZ4=; b=BdKLaLkZQjwvwMDK
	XgygIWHhaBEO3qrdbb0d8Z/qOV8kdKQ/CkXjWvjBUpGg8lyaHA3amOufArHH45MB
	K5q1PmhU5s/x/9suZnVPZFGtFLAkOiO+EVqGsm2DNnVE1+GD0xgmv91wzRj/6tlR
	RrDvou7ExYtYeZIkiDJhbZqTg6BBGmvW/dk2AR3FV6g8hTQhiplYcVYqymWnvJXV
	v2ZvUh4dkukJtbSNxnqOQu2Ly7RTvSpVtCegRy849GvF9XytaXABTB7QriY5TORc
	Of/zUFf701HS1GW9MWUjdq1DKlJo6Fw6468sDDMIKbBVNMBIXk9Y5HBYbA6R+TeQ
	KrTpRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka1ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:07:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463c39so57818105ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772813242; x=1773418042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6rjc/+TCoxfFxZSfhxFAwcD/5kiCHA+X7AyfBBMsZ4=;
        b=cRYb4TPeUUZEfLdjIiRXfU9DBzQrzMk7n4qPA0a4KJGwG8lKekLIsu/yp/LP9cgzIR
         +O55TSXRJwQ5YKzWQhynlhiD4qvpH1AGE5JitMnVIFDdSVWk5to3aSgLZRuXdz6BVGle
         yvRG/zPDg7ryTAQbOHpVCztjuBs/hfQeVe5RRes3ui8HEzHEmHEasOl3NQ2tlgPR8+Ls
         tA80Ul/JCKT08T9w7+7Ru7U+wgoJaDiaU8xl1nr8RjDWB+Ok6w9a2Mms+Zki5C0TzlSJ
         9L1RaTa5vVK+dwezuemqXVunDuqrxEe4M0gmDRewupkVFbwQ4tVtE9UweH+qZnzKh5Y4
         wl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813242; x=1773418042;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6rjc/+TCoxfFxZSfhxFAwcD/5kiCHA+X7AyfBBMsZ4=;
        b=P1jQHii+R7Q9A2UNXI/AHnvKo8XVYAHiY2OiaNR6hrSZpvTXoeRqA+RqgFLPao9u7J
         3CedLQmceJCDea6Q9OV2IpB4whbD4T8rD6wo58Fsl6DCrDv2KtG79xF25YeP63ZJx4Mo
         L96tQuuOcugDhEqnDy6pNYsHVMNhhNNYwkgQ0oVUgMVH2rYpCnRh/ubq9ZUC5CZWuJEJ
         jBypDQehlwVh9ULJyi3ZOlKF8au1GFPDhFKv1MRNVn7Vd7EsCWaCVQhgCyDrlxGYNdjj
         m5kz6dBLZVWvJ2954+L4z7Wf5J6KSbeVMxh1K6CQ9pBQtI1JvdZ/tfIgWBnATxwLo6d4
         WOhA==
X-Gm-Message-State: AOJu0Yyww+gtmDvFAg6AoivDAmjdFe1Io82QyBy9qmS/6XmAeq5pjVWS
	xRFf5CTikW0VeSVR0JSiyCsCyNH52xOjBoOExOy11K3+VF9xFDUcKezkHsP0P4zzz9XJeqkuJBT
	0HqZomxk+1/cTLs3ZEQg3BtYpsoebSoAjqKwarx1QWwbFF3kO1nbMDBeZSLRjjRWsNw96
X-Gm-Gg: ATEYQzzKZz06KtYDB56D6y0h/i9DkTDf/Ox3d5V+/ITiyeUbIJNjCKjnFOGVo7328mU
	COO15gz1FYT4hqxvnBMLe9slP4hMon2InfUmrqM75tBChzkWqycfjIPhK+HsTJiHEzZIuu1EkXe
	FaNlvZgnO0SWDmpP/zlGbXOG/AK7pFYbtQ8M35CGp+121WYCF0VscIA6WGsKRxcIjSpQp45rSFc
	Lifcj8bWhiyBPq7htAQzpek5P69qgYevnOSaNZyo8R0IxQdIRvjiUUZqNTwuC6+klNzFJgizJ5i
	GJHzvn8b2VRtNdnHbIPDuEG6zTlnp20y9CtKpcQrCJEACRDAr7470xWdn8zetfHQaSuh+XgXYVG
	60hANmmmoOtE79wEw10hfj7X4NY8u5NicCNvZQfzvFVXZEQ==
X-Received: by 2002:a17:902:d585:b0:2ae:608d:ecc0 with SMTP id d9443c01a7336-2ae89ebec33mr1836625ad.3.1772813241778;
        Fri, 06 Mar 2026 08:07:21 -0800 (PST)
X-Received: by 2002:a17:902:d585:b0:2ae:608d:ecc0 with SMTP id d9443c01a7336-2ae89ebec33mr1836095ad.3.1772813241029;
        Fri, 06 Mar 2026 08:07:21 -0800 (PST)
Received: from [192.168.1.11] ([106.222.228.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f770ffsm34727825ad.45.2026.03.06.08.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 08:07:20 -0800 (PST)
Message-ID: <866adc34-1a42-4abf-a95f-76259d86d779@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 21:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
 <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MiBTYWx0ZWRfXyWPgU4rQXLPm
 rONVJSyFSykhU1gTqkQNA0Z/mWStxmvo3NZsT1oO0Okz3lmGFligjAJKA6IeQf+CnFwruHPlfoB
 z7Z7FI5Z85/ifBgoZf04etou9HI78urr42xXJ0voQvoLHt2pCbH5bj+3Qy88MBJxZkdTY1bO3MT
 SASSeh/M4LjO4SN9ApWYEiRYGZ66ML7jJF2Qz0syg0XzCJAJHUaNecjUCVzmsgStscbRBINSNu3
 VuZWpy/hOoVqzP4E2XDgmqIg/0odU+ZPNvw73BCwACNY6xphgV1hZL5bpX+Gf78COwF0BbeRvrd
 2b7ZMlVKKndIiUC2nfqZpH8mGB7UB9FFJD21o/xftw3TQrhb6WEPEoSI7DhGrJNxlWgPBux32i1
 xRA/D/soimNWyGL1meT7f9LjmVFCo1FJwaQ5AOmh5J1OR0yA+nJsCO/lzLFzAlCPTPolBIJwXLZ
 /GrHzc18dnz8BUgRzOw==
X-Proofpoint-ORIG-GUID: uPZVtEOzAvesLtRwuu1h4P-LPHXastl9
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aafbba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=uL+hpB4jSAN/g3a/thif0w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=yqkthdN8_KF3SHEi0AoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uPZVtEOzAvesLtRwuu1h4P-LPHXastl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060152
X-Rspamd-Queue-Id: C596B2249B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95872-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 8:45 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
>> Due to the way the DDR controller is organized on Glymur, hardware
>> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
>> Follow that recommendation.
>>
>> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fix the syntax error...
>> - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
>> ---
>>  drivers/soc/qcom/ubwc_config.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>> index 1c25aaf55e52..8304463f238a 100644
>> --- a/drivers/soc/qcom/ubwc_config.c
>> +++ b/drivers/soc/qcom/ubwc_config.c
>> @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>>  static const struct qcom_ubwc_cfg_data glymur_data = {
>>  	.ubwc_enc_version = UBWC_5_0,
>>  	.ubwc_dec_version = UBWC_5_0,
>> -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
>> -			UBWC_SWIZZLE_ENABLE_LVL3,
>> +	.ubwc_swizzle = 0,
>>  	.ubwc_bank_spread = true,
>>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>>  	.highest_bank_bit = 16,
> 
> Carrying over from v1 discussion.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Sorry, please use my oss email instead:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> 
> It depends on the fix which is currently a part of msm-fixes for the
> device to function correctly. Raised the question on IRC regarding the
> immutable tag or any other proper way to merge it.
> 
>>
>> ---
>> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>> change-id: 20260228-fix-glymur-ubwc-f673d5ca0581
>>
>> Best regards,
>> -- 
>> With best wishes
>> Dmitry
>>
> 


