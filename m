Return-Path: <linux-arm-msm+bounces-114970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +/CaBylGQmrs3QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 858976D8C98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:17:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mOEekcEz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bKkH+vLl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB4A0300D6AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB733C3C19;
	Mon, 29 Jun 2026 10:15:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC53DB639
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728103; cv=none; b=ZXhWnmetJ7IpjEG/JGiu2z3S9GG/q3c09UZQEA3br5gbS3gBtkkgFg3xIiKD162eovXm4iH+i4oiqjfOd7Lc9HqinixJaVTIY5F7fk48wzcd1FZbCCun5lkdSdLZrSK96b4zt6Rp1R9psXg2LfQCHK6khOYtI/1E36u19rLFXRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728103; c=relaxed/simple;
	bh=+WAdYRRalhghIfuIm9qMuNk0e17uLYcSMnoP6DcjLaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+wZLsfvIID2jOLMzDuCh+OILn/0jTvnAGTgu6a/a45dkj6llWSWcg3LFBV7FcZQjixfTKe7wbqxxuZL98VdsMbylbc240elC4Yh7YL5+WqUOIxmQXrc8chFdgtUrNJSqnn0hmDwh0YLXLDrnhIREB6XnXZvUMYpjj1a4MAMVHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOEekcEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKkH+vLl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72bdC2163932
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNWml8xksVkoWSoINvr+qZ3ly2K2jA76uLu65SSIdxw=; b=mOEekcEzUqWlQA+L
	D0F2cqAQud8ZOR6M0HLij/EeLasKzaF50xxU6mFvODMGMwIyLv16Iik1g2UHw3Mp
	8sn/Q/O1uiD8LxOV9rkQDg6ExsPgC/qfAMfhlgvSb4UUoN5/arcIIvZgt6OagUbN
	DYTA0nbudLZzzPPC3Iq7PdcEHWOgRIxN/hJFcFhZ+1nz7x3F4vdx43UmRRe/qwNB
	FU6iV4bfOz6UwCpGk51Lx+dvBNHwlffaoTtVBuorrCXKwM2cPmROad2FeyYc6qGh
	dkXNtwG+TlcbeZRBTz1ZlXp3tuctomLq7LOUubYnWHV4iaZFaMuENAQe3mEvFlMJ
	I6bDOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgsnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:15:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92c326f6e7aso75738685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728100; x=1783332900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNWml8xksVkoWSoINvr+qZ3ly2K2jA76uLu65SSIdxw=;
        b=bKkH+vLlWlWVgCeFi7lRdzHYSRHEuODX8A/3GxCW158Ne41AM0ize0s2RO4akDmEm0
         H6epKDI5CTd3yOgz/r5tqywgnGSIrSyQKfauYv33fYR6oKcHGUL23euXrI14zPNG4WKB
         V/abXq0uo1heajna0BuWNlSZP16EXit/MuWPIWaEXmm4mCV4+pbSP8rJu9PANFfq3d8Q
         NA6uEBVuG6TxeqlCpioLDnW4ostH20x1uvb7DiyWgOb8kn3LPod1bQE3aVDBizu5nOST
         ozvC2WOMu1s/84LmIvJseF8+BALzYy4wrO744/FTCKhdyuxUW36fn1A3/qGxmTkzhJMz
         iJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728100; x=1783332900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNWml8xksVkoWSoINvr+qZ3ly2K2jA76uLu65SSIdxw=;
        b=beYHnYeKsZRqUdsWsvaubF2XmrTPvIEYMkDr6vpoj1Ax5XJDiBvL0pDRU+w2s87nBa
         Ohpeib3rgS/dKYVp4Xd817RvEW0ByF8xVY2zx7Rhl/c4UoXG8syfGwn1CfHJblmxpSzf
         19sygVi0c3hzNJZAmBD2KlbR/hCleiiBf3BH7FXA8lQDbfjzbFnQakwV9/PDiJNQeu7g
         Mc2ACoCFF7gvPrDKM8A0s/12qRCCOnZLDFFztHSvDOrYzOEdrGThFJfqaMpP3IiWifyK
         xxGI+qwksHq5fyvZvdMO9qgJ72gdgkafq9nLZVLxCRziBj1uGYO72Cnu42vZ7RQOeMr8
         KrBQ==
X-Gm-Message-State: AOJu0Yzc9xyeyAoS5+yKWIYwZLHIOPRFvmS/ogGCRipMiEwz/9lLWYTS
	+bgMQZ7zKS5kyP8cOrvNuVylDin+z4Nnr+pqGkvIm2xPO4j7IT1Ot/BQJ3/xzOmbBotLpJgIz7E
	iDjQ3fijAjpzzrKo2nMbQZ8guCQnq6PGtAcyxz5FjMiEgsrpZBbNXcd1ZhXcetJWCo5wK
X-Gm-Gg: AfdE7cnwWk7xx+EhjBlm1BHMdXfCz4VqekxowumK+9y8/SjtAHkCEDl0J2Tj0EqHvOT
	4vSlG6ou6qwsh17jjroiUNdnelT7j8srHEqFvKLuozPqnecH0JCdb/jYi1fhyBlWSnEUA6Z44Fy
	VtDr4x1NOt9pLbinlWIQO1eN9IUU9NOQVSlP5lRgLJigRdGalRbUtchJl4g/jwbZPCNKGdfqPkH
	P6ce5KUll0sHKTMPY+tszhehzYfVVH3wSC9S+772M91BjVA/EzERX+WN+irsNw/HWZaWQAFGjIm
	HfsBlm1aUUuCA8TPTXoyGCpXbxuovAfoa0dIODeLJkVey7DBPgJRcF0cTSWT43qJPmNEnIouTJx
	4eAtMGhue6Og3IBNZjKg/Iyn5AGRLADldy4Y=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr89108701cf.9.1782728100470;
        Mon, 29 Jun 2026 03:15:00 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr89108501cf.9.1782728099986;
        Mon, 29 Jun 2026 03:14:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ff294b6sm87171166b.21.2026.06.29.03.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:14:58 -0700 (PDT)
Message-ID: <690a3d04-f213-4985-b020-eb348c84e5ae@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: gpi: correct channel name in error path
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260625-qcom-gpi-err-fix-v1-1-5ca3f00fe2e3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-qcom-gpi-err-fix-v1-1-5ca3f00fe2e3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OixB_KFigtuhvQ4zfbRzbP0_G_jQY0s7
X-Proofpoint-ORIG-GUID: OixB_KFigtuhvQ4zfbRzbP0_G_jQY0s7
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4245a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=E0WXl1KephRpjzEqspwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX7FnkxChPKVf4
 bMSF1Xoz8WiEtVeh84RHVJafv/YfuVBEy+I5R3JSrLmh8OJqAvXtptXjAQFRNErQOaLwhmLsrXL
 0MB330wh1d4X70GJ5koKKAC/iurlUsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfXw9JFRU8CmVH0
 wL4ZIMkVETAYlJjmyxK7iNDzkCAeSBESF4ymeLOmfLqk8P9u5poPbCNbff8Dwa70zj1EFD+8BKj
 Cn11PQaacNCKA7ShUKl8FPabmMCJ6U2i4iyWTb1th0ATlHd2yNszcud0ra0vdHtZP9gNFiXoZh6
 wQvr0obAEEwd1XzMkx5fP6U4ztnzwTIMbIdkRpSjnrgBFt7HT9a/IbRPPvfgW5MNiVLpApm48Mw
 bfXSspdY9hIpg1rKLomHnkRFTCUbj2ym91KrODu/MLAnZSJ8uP7pIcYudB8Gfwdkz0iFuau/sqI
 u6RmdnzrDVfddIQoeBrDHTueS0ucFlJ/F8C3h9j4gkOEjthTCGbjZ1uNVd5RbDfch6+F1nATfh4
 YcV09pMAEEVwZtDuSNtOGprdCVnKHkBmMaCX5kuXyMVQ4zWFJ9kpB0GqP1u0Dmrj5z8XCilfNSi
 IQXPO3KzNtZoLnt+UGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114970-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 858976D8C98

On 6/25/26 4:21 PM, Brian Masney wrote:
> When attempting to start the Fedora graphical installer from a USB
> thumbdrive on the Lenovo Thinkpad x13s laptop, the following errors are
> shown in dmesg multiple times:
> 
>     kernel: gpi 800000.dma-controller: cmd: CH START completion timeout:0
>     kernel: gpi 800000.dma-controller: Error with cmd:CH START ret:-5
>     kernel: gpi 800000.dma-controller: Error start chan:-5
> 
> Looking through the error path, gpi_send_cmd() sends the wrong gchan to
> gpi_send_cmd() in gpi_ch_init()'s error path. Let's fix this by passing
> the correct gchan.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

The "channel _name_" part of the subject bugs me a little, but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

