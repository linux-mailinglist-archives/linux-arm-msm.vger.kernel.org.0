Return-Path: <linux-arm-msm+bounces-91175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCUVAQxQe2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:18:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C71B0011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F27A53039ED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05F4388860;
	Thu, 29 Jan 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsTVVIj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXFyN9qJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EF822D7B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689082; cv=none; b=ryb+oGhMzMSQuxoB7FREtlZmGnXChXOR12bkqp/WafjtO4dDU4DTCFrZVFuauruYO99beoCdr3sVCc8CHKzy4Qm1qb61v/CHRTnhxMBFH3VIo752am4gPKlRPCpJ7yp7aKTUjojAVp+eVyXc3OWY7UWzw6GP1QOsoAKFBErpHXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689082; c=relaxed/simple;
	bh=7G2vAEHNegfOtPP4Ox8PcGDR2+nERnG0SVVl7JqceYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiESGxA4pwIFQgOEKQGjOF9VvBrp6DhSyIXeQ84NtDQPC82fu6KFK2lyrGzLnsOj97XwG9CKRXhyVOKTChndD31rM0ZJJKFYF3JIGaBpQzZHWP8UpRoCojOpqnmtAEexII8ZFEA4mVOtP8Ty8DBsnavo4O02aJRnpJ6zXs6kzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsTVVIj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXFyN9qJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TALFaj2033483
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FcrwN2wnlNsCPb8qZU41GPI4nI5ZkjV4GQKGB3maAUU=; b=LsTVVIj1PPZjodkk
	FzATDHzgchsILT5pTnWw+S3WwzG++XE4y01Jn9CugZTGE66vc3qYVXQnDpr6JIxJ
	5N1BkRcLeDQWje7A78/HUZDVLBYLWH0DeG05FmqWylhhMivXQPyUnW//tWlXmi1w
	jzHhv6UEhEBblfmAIO2Pxx/Ku1c+VJjmJcfCUjIMATgQSEjE4QViRVUsdEw1KGma
	Dkf5wbTwXiAdbvwfY9rytvPrF/uN9ThvBTeKhboNR9FT+tTidJ4mlTdNda82dvzY
	UtDQIgoqFx7PCTZEnAAwWfgaYUXKkx32Nd0JqHG9UlSh2g1J5KG/9V0Mj0BEPqXS
	ksbGBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy2cys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:17:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso31040685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769689077; x=1770293877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcrwN2wnlNsCPb8qZU41GPI4nI5ZkjV4GQKGB3maAUU=;
        b=ZXFyN9qJ3GY2MUcQfhGYxP1CAAWB4eW3Jhho8DfRSHklzxiQLsdgUQhH3Ls/pN4o39
         JfphziZGOk8TEFsG7wTWC+GZc4qQ3bf/spGxTQXjuxLnHfeUhOeY/M8Vzj8qV6OjP20U
         I1wOo6yOpbx0OZLFcb3+UZFoR4VMZd6ochJ/9kzGEkFWnJgmlr80uLWh2MVZnfX65oBw
         0p+sNzGWvxK0XjFOj6pCWg1pvuUnkTdvCLswePlvmulM8cHdtR4ORw/Fvy8hzCyOtx/h
         m42ANmGcawhoq0ljPwoRp8Z18nTGr72ZYGgHWgg3IcH16nzGUFu7XPT2RsT9GJljxUMn
         borw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769689077; x=1770293877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcrwN2wnlNsCPb8qZU41GPI4nI5ZkjV4GQKGB3maAUU=;
        b=RRtFrKfrdDLMUD+d/e/qb/91d7mJer12DGHFV5EUzFQCB+xBu2D++oD5ZBkKNzO/Yv
         oiEwEGJ6p/7YvG/bWepSQ+xifsXxnx4HaepAlGUu2fEjaAb+bvMUAb3Hs0+/rBM3aQIC
         PMNHIo0653dhBiQUdfws3uXPVoSkvU3fg6MTq/hcqWQm/4ZRotWq0Ioe0f1UmTbW8wk6
         lBh3rgXHYnSfpPwyeDoqYXnO58gKjTe0FISG4QuoFnwsqKERQ9FYk77I/cK2BCBdmWVq
         /Cqx6r33xYeKgRU47y3Ze1RptNoVP3oXNqs5CtoY8jVHZmSZvoGjl7LZai0kZgI9tvlk
         MX7g==
X-Gm-Message-State: AOJu0YzXPKTJZkF5uctPOzKw7ldJnxsZ4JBjKkQjhg6UYIyzXNR0Urg7
	7BKTWulvkj8Dt0/HpYUvealCekMwmeOFZQ3PDG6fCToSAQYpPOyLzeXMEVK+/ZUBAcLMmVQaNc1
	oYGyBROSxDAMWQXJ9MSR7N2QkfebCCSf+xww0XY0G06dqGNgJt2ffS+NJplxzSKCfL7H+
X-Gm-Gg: AZuq6aLmvLau5wf+H0Wsbofz69rLScW+MhPEFQMXv0zbqk/f4LflJ3jfJ71Te7+Z20V
	L3jhpOSAkH9dGPElyHG1S4dxos0VIi+sYOzvgyLftXxLncSshItGaQHXcw5w56CUa5FKeGR7Tb+
	Jr9dLhS/nHJ/8PWX+DhRnhdWIxAD+GsWmOOcFaQzKlhCFhIsV6k+Lxn9iBx9U85TwxNXGlojuoi
	3b+GSTwVEyYjVPndJUe4kWpxaBNwnDM5/pujaPZ5DMZ6p/HWA2AmiCRe3fP+GL2VeT1xQ2Oo9/3
	UPsZjKLMi32frNxxKSiV/MBxnXICOSMosv1tMX1YqSjMz0KCaJG5UUl95E3vndOycjiP1e5Lu/3
	V32mZb5xZn0sy5necS/hx2sw6n/PSoXO7kZ03YyOz/pQiHDaY8ha/UFkhvbT/PG0j4lk=
X-Received: by 2002:a05:620a:bc5:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c71ade7be3mr352929985a.8.1769689076978;
        Thu, 29 Jan 2026 04:17:56 -0800 (PST)
X-Received: by 2002:a05:620a:bc5:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c71ade7be3mr352926785a.8.1769689076547;
        Thu, 29 Jan 2026 04:17:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abea5sm2831410a12.31.2026.01.29.04.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:17:55 -0800 (PST)
Message-ID: <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 13:17:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MiBTYWx0ZWRfX7MCxQ1GGo5X9
 P1SOWRX+XYZZ8E6c5CKCw5B8cQBXlPVlyBpiuzULnLOuIk9Q1VyvjtKoWLSl9riSX8e/6x/b2wS
 R9IqYAHHOQTEzo8ia9mtDxDfCULblFMfoCGDgcI6+mB1ashirzwI3rKkGYeByGhZOkLi7Lf6idk
 yqspHQfi+RUPceK7TynsJxmdhqCF9suyiQn76lZw8dw5g8HjYX1IQUHQuNa27ctACiXyavEVmrE
 ojyV4SaUtBRnJk7nYwRb+7NgVMSNUt6DHAEzIa+RU4vOQV6IQ/Va08iz7vWwM41X0RKvPwtTNjr
 j/K+4tLF1IGht+z9Nu0HdBSlsxczV+zDu/ambceNz8of/z6aydlDkWDUubm+v1DxmI2MvJemX0I
 1q1bUdCAeRYbso1vcm7Yv4cUrKcSrU76EWExQi9p+SS9MVEEKsZEQTnd80TmhIUmxPuPCx+67kw
 nG/qQn1QaTpHBZ8/8OQ==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697b4ff5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4MEm5NcWsPKhGJVxAVQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YCdF47CPCgVtS7csb73G0OWvAAHrzVHJ
X-Proofpoint-GUID: YCdF47CPCgVtS7csb73G0OWvAAHrzVHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290082
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91175-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94C71B0011
X-Rspamd-Action: no action

On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node to
> determine minimum and maximum supported frequencies for DVFS-aware operations.
> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> controller driver in response to clock scaling requests, ensuring coordination
> between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.

You skipped that bit, so I had to do a little digging..

This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
would absolutely wreck the power/thermal profile of a running device,
however sdhci-msm's autosuspend functions quiesce the ICE by calling
qcom_ice_suspend()

I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
and a mirrored restore in _resume

Konrad


