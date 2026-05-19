Return-Path: <linux-arm-msm+bounces-108489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKJhHj5RDGosfAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:02:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656E57E3D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AF3530714F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F713A641C;
	Tue, 19 May 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ6smCqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EO5ZxqXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7659D369D7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191504; cv=none; b=OSUyrYMkE2DBRVQlHtbjQVu6l2u1jrMCm02KdTcOIRBlqVnIYtGJOI3qDemLCqJ3YSq/aKgv5m6ErdDBVtLgfyaMyILLLyCP3SI1wHqsCxeCtx12iYDmDweoJkxsUhQ7tEo+YgGWeYztQCaCDeEWHBYUpyUL5CVw1mJ6fpfuFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191504; c=relaxed/simple;
	bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFnQOS9WPqHXpJbxZxCFJzybgnGzAqT0wFxWi/v7/xyyWK1QKEIqxscs31PlrA4hdJ08UjrivU3KaHKA2Ksa66hzWkOf47zzrjQzBIgbuZYEnM8JsVzHUQBHynVMiyhP+ydJadzcGMi5q07fPOTCF9J0Gthoy1IL0rEDGVnmXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ6smCqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EO5ZxqXV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LpZ74062972
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=; b=KQ6smCqCRl3S4GLo
	oL+Guj+g0A7gNDWly4GVS3iiDLztIRrXwGpR+txIWbKYvVgXy3j5MJU36QgqkYdG
	Dvtge95w5RUfAKhT/t/mkGJf5f4X/We4YVBhPZUtl4xT3Gs+r3RcmX8gKrZN+DZz
	3lnZK1ytX4FYhoK3dvJUHiwr1MQsMhVDDEovCmzohqmca1Hz7xkAd4yMLyYUoIUD
	0m71A7WMIpAvYeYHarzElfnmr34YXwePzqEtAoC4ySz5O/nP5hpFT4GjnwaNMHJ4
	7AmMa9mqBJ/ciqFpEWwfWKnuLfX1nK27d1UQCmN9a1/WFIM1ecmadUDv0YSOmcx+
	5e7AHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u0j7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:51:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f04f07227so70174785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779191502; x=1779796302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
        b=EO5ZxqXVIHbDiTfJJ8WCYqmKtpo6WOwuGl1rOOH09Jbl6jXQOxb+zRDZxJOVT3F8jt
         MKtAiexx9t7w1igC0YhRrJAm+zdXEuTgBjZxFKUJolfodwlrPHhgzZ6D5xXKkazGkuEy
         vZZyuUzBMkxYxQ9p1JGaNJaja1C/XPlbNAWCpGcrolEbZFLJzL1WI1V5gqDgqHIP7Q/C
         E2x8+09muATiPhQ4l20f0aOXQtM8K9SrT8QYxqC1+/1c89Hh2IpZvT0c6uRaxJRT59Kl
         vQeo6FHtOMf4Q71zrwbdEpQ/ibS1Cjw9JIzP5/REZHzWQc6SlVcELgEGvpHJH+579shz
         rzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191502; x=1779796302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
        b=FBfwzzKjnzn1Uu9GTbOha5KxPjQLTp1YrlnNIZ4qJbUgQG+cINpaMaOgOrzc8KkbSD
         2RxwFNNhfWWJ3O7SRmiSN+s0cymJqxvZSVrvf+EAjO2f7+wKq/Vk1PmF9X8DRWP/k1Ht
         HkwmPq8AXHLGKhHQuh1sA3zGhFeUNB/UESd7plgZI6PXWBQB37xW8M204IYTigL3Ynzm
         4mK85g88QZKAhLZifPzKngE4eKPgfqYEW7aeDbIW6EG27jMo0yrcdTlOpXSsf0xKwpsp
         TC/UW8oJxYSWm+Ebt3Q0rgpgfR26IFaGe1JKrvh6EQWT7uGk2461u+uFRPQFY7kYi439
         QDhw==
X-Gm-Message-State: AOJu0YyyIfBv//zYSV79AIXMpXZORo+gQme7qtaOhWs/h5JjwnCPZdL+
	zJuA7Z6RS9/OpzI+4YF08x2e6JRj+vCiHPDUZzYYK7ADHlOCM/lyiHavpPh4EXdzU/b/y9+C+ZY
	czZrZxEJgHi6JyJ4OnsC7wZqBb9WpJGgpHd97KITu2Xtrg4ljCTEQ4ZzYC6dP5mMBWfv2
X-Gm-Gg: Acq92OGWI8UpbnOITWchIp5R5z4q1E9eJdu/LClXxZAJmZNkRZCgZ5xZQgsVB839K7S
	Eg7iykOdpqdZaUPbIQRaDEFctidv1XHZeR8QkePxUu4BAy5WQCivZOIZXXyfsUyiiT05AThawQK
	KTsLf2vpOBs4Li+P7ZqzlXNacVeDY+tsmHFedpRIlUi+xw/Fkuh4NyB9eE4VvQ9pxPoaFG93gAp
	bQb8RUzp2UGn/o7A5J5+yOpODTBES6e79GsFbahmb3gp7F8+Y4+wrCL0dk8tZ8JJYl86xKk7wcT
	AejBFB/M0k0zybM2UD3bmE6elGJlrdWdPVONm5GsjBt/jp0SlDhZNeCDF0nZnK4+cUkMUEOBJJu
	7XKG+FU1yhhO8EqPBB6gUMmN/uDTsOH9gCHRKI0YJSulYF9UwNXSxW9fypuaKNG2m5/dsS+kXf8
	SIdXX7S5U0dHIF+A==
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1962910385a.1.1779191501623;
        Tue, 19 May 2026 04:51:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1962907685a.1.1779191501253;
        Tue, 19 May 2026 04:51:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58df1sm6536454a12.13.2026.05.19.04.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:51:39 -0700 (PDT)
Message-ID: <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:51:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
 <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c4ece cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=INWPgVgdgEZSfrFqjaAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -itPK3GwOs-g7J7hzBuVlcrgG5R45Hx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNiBTYWx0ZWRfX//MCwdEt2i7u
 GCVHci+qQYr33pI7dIDwN1Zwmq4+pi0M4aXf/88aQfL4w9pHBK27F1DeHGuIftFmbn/IsA+Oixy
 ScT1HcI/5vHfLhyzKKMlGU5ioAXZMpCxAH31Lq4N7zZQ274KqCOQZ34tdE58kvQmRof/tdOLK+6
 GRlfnqbV0rQqYFRUUTLKB7XILKTMI3aJ+3yeN/vLB/tDfF/1Q7eQEX/9Lv72zUKhlwu7lxrIJPN
 phcaF97pmidIjM/VVLkLeejFkuDkPcu1BB8cT5WbBggzUpyioIt0rL+ZuO9bwV/YkgN1TpCwnOU
 30XkCpBYER24FysDEda2aHoSu2s/Ajo8+xXQ5eWFBfC9ikozvRtyZx0yYx42pMUHrm0uJ7EBsA4
 RRAOpVn8f+V2mGEc8KBx53wpaiph04u6F9OMpXFBXaiytPk0DzPcayGKSz5s4+DcjwPBGMI+zYG
 PhC+7CtkqY7Mt4IfnOQ==
X-Proofpoint-ORIG-GUID: -itPK3GwOs-g7J7hzBuVlcrgG5R45Hx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-108489-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7656E57E3D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 1:21 PM, Komal Bajaj wrote:
> Add device tree include for the CQ7790M variant of the Shikra

I don't think CQ7790M is Shikra

Konrad

