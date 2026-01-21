Return-Path: <linux-arm-msm+bounces-89989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAiFLImvcGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:50:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E44B55855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7F276BA88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FAD3E8C46;
	Wed, 21 Jan 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsSrXDig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0Z1u0Pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3513957E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991839; cv=none; b=IBjCtaFaPM9TJCGKR4/PuU8EJrq1Luy4Hxiv4Q9JVExBTAlV4qE161HyuHR+uamISuuWeXmCDqAgTfat3hwe8QzjsIceoaJVtvvRLIbrx+S7gxa4dC/E1JCW479HaSM6GplZ1OBDV+05YFX5h+pj50fcOj3Oc4Hhc4rsxnUw+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991839; c=relaxed/simple;
	bh=aLmqcGbfiLbQu3OURTEMClnX+EcS58GjLNdezEN/Jr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6QdORCUlY7OL+XxT/iP6RtJT/uwRIu+IdIYTZxCd5E3syH9DleR/epFafVnExNAw+fnnC6fP+qmzLvehtZGVmCUnevAKyfcbIXgW+6Mt/NEFbRdpZK15iH8arbPbqVujURBEJU6cIC862vl0HN5svdrc3B/tjFZY6tyLFI49b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsSrXDig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0Z1u0Pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9pWhZ2452261
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00HJ2WKg5ks04XLuIgWAT3HUKXOTWnnXf74hpRf4Dtg=; b=YsSrXDign4zqSWD2
	XeJuv6bbNmzbZDHjL1d+SQTfLhYj6yz1l3ABwLobW4fRlNm6YcaU1grVcUoqDw04
	p32XZNf2+mDRa1h3PBHwBQNCLILPVvGcXfXc5jIeVeS9la5eks1ELLwfFyVCRUBj
	5BtIDNuXvDtniwwJn45gKDK5WTWqvF5phRl6PliTgQ7VJ4pu05+uSoaB2UhpM2z6
	pZg5EseYLwIZ5croPtH8BvHo0zeYw+Ltg93aFIsWexjPgS3TncFBT0zE45bIRp7q
	c3NL4LnY8RwDX0p4diDPjkvZ1GtlFXxSXNuSSgZhBKOvlhCb+vvpris5RLoGqeWg
	v0FnLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqg5p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:37:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so144537985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768991836; x=1769596636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00HJ2WKg5ks04XLuIgWAT3HUKXOTWnnXf74hpRf4Dtg=;
        b=A0Z1u0Pc9+/z9wOHH4Vmd06bVlgO7oCOa0iD6zwyh7ONq6/bUTZ2EcHYmwCpGDS8Zc
         AQ9lgW21UYEFWiwz9tkA6iD0M0HVtmyfERn+Qpj0/HmoWdY7NztFNmIeamUt3kEpMA20
         1EbYXiOxqcVxMcsj2frGe2C4Bq+9Lpm1FpDvSnCfeuei1B9b5ywV9Z75qOmdfY76ALdg
         I63OwBrS70ZP9sbm+v+2cx4p66CV2IjomFyIMoz+g7cJ2HVP1YXr3pIcNjLuFqGsxgqj
         pkOd1LCxfTP88at+JnSww1XLLeBOqURPBe3Fyu0m/bJ3SETQUketnUNhn3MEcsz5SfAb
         9zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991836; x=1769596636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00HJ2WKg5ks04XLuIgWAT3HUKXOTWnnXf74hpRf4Dtg=;
        b=N1yMTcWMST38lFdhh3xIaJR4tnZf0ypdvkJQXri+5JlzLiNDnUv4liAOSfeSq7X1WU
         uefODsGMHaxSkez850TFsw5R81zwAvNNrMVqtM/UGakhUP/lTGjeZLO08QVPBNEalJnR
         h7yvpOUmwGn10UP3UvIowo7lyj5+mPTi7oZ/sb1nCLJcq0n8xcdI1U5OgiQ+9QiThK3z
         YSY6VjAfFfGUYBEarko//dIo1up4I38w0G46sLoCBIzc07dU2xaO37BbmbCe/a2XJSDX
         pKP2O+Z+nfODRt3vnoIhXr/+Kn/kp7FhO6YGqVimv5g9mJxuFpDquXZMLsaIRNNmhMdt
         ZHkA==
X-Forwarded-Encrypted: i=1; AJvYcCVgA1hOK5BqhJ5FkZ9SOI3RoWbDlMqGXM6yhBLZi8dH1J/NcG+cR/pLOdSlbGKyAHoyvFAlljBDdgu2Le7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqr+PyP4AA8HTuxklUS0RRhj+T9VwaVVF7yGUFYohBWJ040/GX
	zeZglddsETds4bYxXkuXpLeqwFH5Zkr19Y63tJkCQQa7RKif476SAxQTz50w4UbG7Re7JQDFpVi
	27MPcCSsuA8QbkR2dX+qrLPq9hRWIU2nfiBK/FWRho7Vgl7h1BorXLHJrFZxT9hvOI2p6
X-Gm-Gg: AZuq6aKbO0lYeqY3y684PDYDft9f2xTVPaTsjqK9iATIekvDKCYTbBAFsQIRvbm54+5
	pxpogo08KNe+awIwq+vbeggvaIfRjfaeAIn0AiS9tlNfr3ugJxcaifs946nWpzNKczWo1r7g+qh
	+HGeTCKfG+wtiWgrNU55Z6CqqsXmXBEgzNtqP2Q+h5RdUYp2SY3HSeRj7s98S7QE8b5Gyf8VWtC
	s02yfcg8DN1ukn4bVlag0JAcnMfXQwXrdZHihyKB/EBoeP3R0ShMEiFoOWRT3qVJQ+OR8l4oAow
	Uy4/aWghX6McpRR7wWTjvKycv1pF1OkbIdHew9hfioZKOGEfTlKIBHM5o4Tsh2dXdVr/j9Cl0xP
	3bV7ThEKvpZjXjMmxCs+DW3JDJkgfG5IfrG1jqj++a32AYQclGEvQrWocK4b5uIHo7ws=
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1633824185a.11.1768991836305;
        Wed, 21 Jan 2026 02:37:16 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1633822785a.11.1768991835907;
        Wed, 21 Jan 2026 02:37:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6581d306580sm323754a12.10.2026.01.21.02.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:37:15 -0800 (PST)
Message-ID: <65ee478e-e0b6-4027-a6ed-10a3109482a1@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Recognize "LiP" as
 lithium-polymer
To: Val Packett <val@packett.cool>, Sebastian Reichel <sre@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260120235831.479038-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120235831.479038-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4OSBTYWx0ZWRfX4BBEivqRPgX2
 t5V1sd0t9PS42clefsSsKLHr8y9+ydBqSYbv79uXa+aLEH4918cVRVFocY5mG3cAZsvd18YWW7M
 9ylE5Ko1CE8asHkHaPR5uW0j7tQ9gnMgQi1ltfIttabd/57Nn48q4GHAJRlnoQNwtSoWbTtjjKB
 adtJNt34hrAF/fnczrVupriogktVRoI7jTWhiI/476101YZ7zCSQgu6T62X1DIMN8oOgcZ87NwJ
 VNLDOfTZlVjut+KfGe5TyJkJg8L/uSGeyQ3pjtVAnGD9MwHGoMYoSfTf2tcMRzYUSKD4NGMvRIr
 +0O6mq4R6OLd34qTuBWTrWa5h4wJQygjl1j88uJuaujhSV4G0vSRnAaboz2uKhNMVoOkMyg40go
 xeSxJZhLo5JOwyQi7x/3IaqGFR9XO87S8VaHNDXjzUGEb+z9fYVPx5sHbsgpK0QB5m9rKM4vNIN
 QWJPvu8lBF9HKOWct4Q==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=6970ac5c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G1jGPrsn_bHTxkitkXAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Hhi3iFaVzqtcSqXCS2z8nHfL7BEI2_Um
X-Proofpoint-GUID: Hhi3iFaVzqtcSqXCS2z8nHfL7BEI2_Um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210089
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
	TAGGED_FROM(0.00)[bounces-89989-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E44B55855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 12:57 AM, Val Packett wrote:
> On the Dell Latitude 7455, the firmware uses "LiP" with a lowercase 'i'
> for the battery chemistry type, but only all-uppercase "LIP" was being
> recognized. Add the CamelCase variant to the check to fix the "Unknown
> battery technology" warning.
> 
> Fixes: 202ac22b8e2e ("power: supply: qcom_battmgr: Add lithium-polymer entry")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

FYI I *think* this data comes from vendors so this list may end
up growing and growing..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


