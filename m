Return-Path: <linux-arm-msm+bounces-90223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mb8My49cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:07:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A56860F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF81A9A28C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A986E34DCEE;
	Thu, 22 Jan 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHD+FvwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8wbetWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07D31352A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093630; cv=none; b=nOhXNPR19EXQFc1cNyuzQgcAdAadxGeSZf03tfec4DC76WwMjORzFPB04k5f/x+B1Mmo0/abKzTIpFtTQQ5OPiFt3umZSxvVOuZYDi5SAmKH6nnu/h9vsuokCP9mpuvcp4dMAc0UUYUffTarhEwa3cRAeoJNAE6brVr/pEcfgSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093630; c=relaxed/simple;
	bh=xxtvmu2vyEoG8JbdSfTeLIwGGoY0eIxzddDEp6a6Hng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNUkDOqxIbbuHSWjehpfjHNTE1Z2kZoEsvI21nFK4nj2L70BrQN1qxWZzC0Q24kyb15g1XUT8EKDomyeD2nkr+PbbTEndETb6Omsk5411B0P+45n2QoZiQv9OWD032hkTi0xOpVvResx+tWtBCyozl9iUG2Nf7ZVEBbLIILcRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHD+FvwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8wbetWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7X2HT4057918
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdCKN4ogjRSe34zs+Px1/0ACI4XiVOC7qfUH5IdyeoQ=; b=cHD+FvwSkOIlNWEf
	DXFPTFpVsu7Z0t8U4tMsIsnaFhJIq2PZ2XBnuqMfdnWcEGea2AnCzCu/W8kLN+f1
	iR9eyFmhI+kcbReBhck7M34HTWXVxeTBnAqRUeZaNAc/fpZEfaRuK3JfE8ikqZgr
	VHBAWyvsY6UoJ7hKMRQ5J5hiG17GB79qfiL6K2NCW6NQEUZa+Ft9DcOXlQwaoTGX
	JIWzGPGj2dy91UBwQ1Jhxp0O/kVfl3t1DPOH0f5VStG8PBHquYREWgEIGm+2WFwD
	t9FLI887F6xNHE+hjtXixNhVaD4wJS8pq4lKRis/F4WDNmHtN3aGUseIfVXQTM4k
	AbPOYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbtn72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c536c9d2f7so30677385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769093627; x=1769698427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdCKN4ogjRSe34zs+Px1/0ACI4XiVOC7qfUH5IdyeoQ=;
        b=V8wbetWarYKnKwPniUoKvWlkFXdlkfUx+ZUeGmKBgjTtSBIcpiQlazEj9FG/1RUpyR
         oVtnA/6Y2H7Gx9GSNscYffKpDt+YpxQhj/KFthXYO5xQ7M6QQv36Zb0G+CrKwLBz4CIl
         D5umOpIA7kKWA4Gq+qwsvwmV86/5XAVHdTZdaa/OJHDQ70MOgg9AvDESJsxrwMoKW21o
         dwl4+w6Jcx6ryClU3/lzEvXCKo/PUzEl+rSgecGvGC1mnJsUuUAF45mxL+36n1wWyKtr
         vUuR6Ly35ZLlT05RQeSpEKN4ddTBky5X8nAqDjeUHEIJ0/6IcnTenL0jIEjUW3st2edM
         8kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093627; x=1769698427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdCKN4ogjRSe34zs+Px1/0ACI4XiVOC7qfUH5IdyeoQ=;
        b=JFbptcmq3pJU7AP3vE8pfCf2U2aB6Hz3g0Zqof2sX0n7Cv3hOyXelFkJpbnD4Bqigi
         kGc8YEPj0SLX7nxnSvhnjI5GQ/9c5ZND25jS7YC1lVWl8y2B6gHV6ze60gUPdrCKdfPv
         hAvUp6kd/zIKEnkTfS2IgZLZWDRPx+mU6HBtL2ersB/7vGL3qNxH9mur/kGZtDQ9UMqb
         pAMed/24yfnErOnJKcP1GTc/n8pArNeVSE2klnjo/hSNSfIWHpOyVWR5dCTW8ytEJ8+s
         QtgAdpfsU/meLpphLFw5fepTzysWVyzOtJYj1KM5Jv+261IbiPhbx1hZl8A82ToCKuuu
         EcZQ==
X-Gm-Message-State: AOJu0YwjRkBSbFHM2C9thKRkh7IFes43zU1+PaCWMcRjtAhjNatsqRyH
	6M1px8oOt/s8Mw12XhecPQTThHqAFbOZa8H5egY25udM9vjiX6TiLnhhbxlcu4dEnQkA6KM404M
	lTulzo2sEzN7qIS25XbxuCPG8BjRbMh98Ow34dQRATT/EoaLCcWH7fqgGot+GoIVLcMC8jUm1H6
	qX
X-Gm-Gg: AZuq6aLJBEw/WgNLHov0mMS7zuqY3GYW4CX/u2/mIMYqNiDos4KUJLA1p207nBETtx3
	A30QxNK0PykWjKKv3PhVuJD8BeDLFbORtBPad2o58cvGz33EVFL2y1B8cRAQWI9LuSu7x2SDavE
	/qgpozfBsAK5lYgo0HAvPQOi1ivqY/zvHjTlCosH91Ngat3An/j/vUFo0IKkTvfRwgd3fArL5db
	O5zJLtQaUHjwPsMCQmLnNTBdRTPQ9lKtzQNSqUA+rVChSV5cVAI3w3GBfL8zBq40q8i9+lpp4gR
	S9yDNvRZDiqbZ9q+xCKMbuzr6brWE6dtcoT/OkL8DCGOtGg2lAM1J43p68a8Ca7eUbmJKs5Dv74
	noVe0EA2ikVnW2LQBi+TzDRH+1ltiJdKjaCnW+culSZZF8lO2ZopoYpf+8Q9Ncn2kUDk=
X-Received: by 2002:a05:620a:44c1:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c6a6797f81mr2197752385a.6.1769093626968;
        Thu, 22 Jan 2026 06:53:46 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c6a6797f81mr2197749985a.6.1769093626433;
        Thu, 22 Jan 2026 06:53:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6581d306580sm1797287a12.10.2026.01.22.06.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:53:45 -0800 (PST)
Message-ID: <f1985450-b770-42e6-ad44-4be49bed7205@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-7-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121142827.2583-7-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zzJlrrRDtC8fASoqrPZKNATxwKBnZKsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMyBTYWx0ZWRfXw/ulXq3gPe2m
 M6SA6YWltqWqKDFx19jT5S4UNAH9iyzzB4X94G+S1xh3/c93WaFhQfcS/l48rUg71fPESvo6m9l
 pQZuH+2E64f5xc01Fgeih+TUafLRASmxWi6svJvaaF1/XLBQBj2k+TzLkTlAdjnnUeROpk/rRKs
 YlAS+H2mFlrnfgfj7/HTdOv2IK38yD2RHMhG7jCXKNM7UvhA8Knh2fWVzOv1fz2AGd5G6r8eE18
 Sxqt/rOBpu6UhYXEB5lbKr5J0Y2JBI0hlrzDPH3qJkDorg8zzTPOVz7l4hlgE14taKkEV58VAu3
 oQpGtHsDckP/lL2kKG4xwwFcS/yWHM6Wc0eeW37+DhdMe/bvTq2cOoW+e8amKfpKreHnXDfNDGw
 cz4qTtjcZluagLcAJFxLb5IvSFRABvBKBStzBYvChkHw0TDhjE3hzLMq0p21tN1fTrAxPFmUQ83
 FSgqjlcQU8wd0Ar8sxA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=697239fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=01En1cxxkT8w_nZohiMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zzJlrrRDtC8fASoqrPZKNATxwKBnZKsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-90223-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3C1A56860F
X-Rspamd-Action: no action

On 1/21/26 3:28 PM, Loic Poulain wrote:
> Enabling runtime PM before attaching the hsphy instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> 
> Attach the hsphy instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


