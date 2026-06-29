Return-Path: <linux-arm-msm+bounces-114905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iGlhJ281Qmpm1wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E66D7D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:05:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QXrtunnr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YZFH4A11;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F4613016C59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB593F871C;
	Mon, 29 Jun 2026 09:02:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977CD3F86F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723752; cv=none; b=DJQYPeSzi3eA2+ofCPCUc8HnKRGZ57Is+3hYsGdMIGuplyUJLf92CuDPDwj7Pc6wA4VdJmyw+WMETFAYT3qtLsUchJ0uJbq2z6xyM5lt7epImssrVWZuD7nZ7lIarYRrSVZJrEtz7PxaYWiQCO6ybe/W+liwKQjcjj4dIWX0d1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723752; c=relaxed/simple;
	bh=uN8EStkhWQovsXaPLF0VKa/uhW0GRSGeMVCDsuf+bkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srE8OCqAMG1MWC8Rt9g6cLtmLP7uMTSBiPrNcDCQK39cZs93nnCPK9+Eo0p0WAmMF39LxvFNVTudwEfOiGFfUoBM4DeTcJgwhvETwAwDOdQRM/XSI4SNK4nHs5iPs/Q1TKOL7yipoy6gfcQNnDxRDFVQXBnyNyuQKw24uV/GOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXrtunnr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZFH4A11; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91VNv2401041
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=; b=QXrtunnr9U76wGNM
	o8r9cjDDQHzcRe9GgO0ekMEV9LphFsn3SfheMXl+gyLQB+utOYKil5R+t6WiJ3nY
	u4ZvksXg3hNwSvYO9lcGnPlaLspCBvcAHs0WaRN5FK4qYE9EB1UYjbmCnVBex9/R
	jt/PSmK8Y1DOwmpZ5mk3anSCe51zM9bDD41JTLH0SF8QbASmAQbDF5b7QkKSSHpE
	pMZk/Srlca/5dIV5WLCep6NgeUFpAJ6r253mC/LIuZkT6MrzkL5RHLOvCOgPm1la
	LOQmNti4xnF5stnMOd04pAmx3fhR08oLXVbK4PbfhBvpumIci/DYNtTlGN5QBgVv
	YAtCiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso913585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723750; x=1783328550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=;
        b=YZFH4A11LdF7fzqYx2nXw3UiHWXv4vrjgS14pCUW15SkF8goSkaXvPWy9AST3l3XtM
         J6ZkZ4s/X5wrq3kxXF0jNEE+FOt2Z18oRdOrA8cPxLgIdYZck6l8+jIgGdJF862JhAc2
         mf9ZVPl6sEppcgJATWxOTyngQZ2l4zSV6il+FxhHb84iaM/LGXZIgAoob0bnA6sauGX1
         ebQfIM3FGMNQaSR2ARMWWdSXEIXp641fb7RMJ9MU5l9LHM4tcxya7B9UJgb+pZS34rIJ
         wEBjZcAiSsetdsG3RNnIXEKE+rrZAMsyyDYEc3hDudnbrudasKgZHY/7Jdg6Nl3PFqf/
         JX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723750; x=1783328550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=;
        b=A7dI9aQtvKc66RYNt9MrEbtMYmibop3QtWEF6uKdiHKvzcC+W7ciyFSBt56HiJcUnd
         +qSEkkWTsYFzB0qnLUmCjCe69drVCVBIg+4BYL+mXXDzzmr9t7hgqgND+gOmgvQ9U3Xv
         +2iBY8+xVP9i7fsZ5ziIvqgsrMi42XB5pBzNrd88zxMmaOPrWVuhlEDqZXfiLj40z6ov
         fFrLDCr24nTreMh7up/2k1X0OstRLkn2VralujEp/EqzYpiek8XI34zfnc7UcIHi/Q/d
         4R5oiOHeNgf9XlwKHfjfc5wVCQYFSTFkxARxG1ER82htHDxqSS7kQ4q8A+aiAnXghlZ1
         BWdA==
X-Gm-Message-State: AOJu0YyHsZQUGcQb8L7TpuZswSi1AkX+jQllxFMGCZDqJxCtjUfTbV4T
	4ySs0fDCSYIGeEVZtyDyo9338OjvASVmmkPojnL/1JYYZAbzctjYJ8JmhHfQ0IAtNKe1HV9E2uY
	NQnJnIwrHyzbZAyJLb/Yu2kI3Ww9YBMRvBipizogbqrxFmIFRh7PWR1OuSBOv57m3OhKG
X-Gm-Gg: AfdE7clUB30SXdvbfWzcqpR+smevXgXbRENvhDB3/hCIdSWYENG5ZYxJQbInqLa144p
	OfaJj9D/+MNdKuws32Ci0v223vbMzrp5jNbRM0noH8JYuIyOUFH0J/iCtrdPVaK/VyzBH/i8Jp1
	ngB6CgG/KVPbPTkFfO6MVz2cz2jRKfIzjxAyBrmob6wMadQmIuuEYSXW+Oxz9BuMbmfZWy9D4jW
	pwhBWsjRv2xSZQvnbA2XxaKvzFqESFG8sJT8CFoUZihfiCmf40zvPTSKnfNYpJSP0h+40oStnZo
	rbLxWZufLzT99V31TkGbQxQ7wkbP1WnOtPNFpWSFRlrJ30FaiDOZ+/0kFbQDMrtpMl4HNvqqWd7
	ATVMgpD/KN9/xVgT5yYvphfMKlBf3mUTX3Lg=
X-Received: by 2002:a05:620a:84c6:b0:91c:9d38:30ac with SMTP id af79cd13be357-9293c21883emr1504705685a.4.1782723749879;
        Mon, 29 Jun 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:91c:9d38:30ac with SMTP id af79cd13be357-9293c21883emr1504701285a.4.1782723749141;
        Mon, 29 Jun 2026 02:02:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa4cbsm725874066b.3.2026.06.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:02:26 -0700 (PDT)
Message-ID: <6ca1def2-daed-4ec1-9c59-2015a822e0f3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: Use predefined
 MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
 <20260629065905.15651-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629065905.15651-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iJSb0_jQ9qvDyJZaB9aUNsjFBt4zMqh0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX3rtmTCd7MQcd
 UQUVmTghUgZ/etyJnF7jbhu0gvU8Uis2o8v9O340p3IgnmxEgJPQUvPTfPsyDRXEmvZHUglT9MP
 v048mHOspXxX0sm/hlVq0lfD/DO/z2U=
X-Proofpoint-ORIG-GUID: iJSb0_jQ9qvDyJZaB9aUNsjFBt4zMqh0
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a4234a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_DbJdq2sjojDXUnWG0EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX+gOFWJqHKqUG
 SCQOjOc1xiINPyUVMs2TBlSr6rV1hkm2/Hj9KmsJ5JCnoaY+joD2j/rTEvCWohqCsktUX7x7xMO
 37RQ84okOhGiTvui1avHqH969ODauVZT/DsnjJARxBIDuMwLgUsvKEyFwSTxeV+AXZae284oBVG
 fVlMr+uu/1vGz3nGOnKwNykBiTG0eUQ4BPC4fvrHJJm/6vGntp1WPALW7FlexyNi0Z3F6HPzF1O
 1DcS1Cw+0Xxlh039ck2SjDzwxCZkckj8zdbR8MDSE2ZN1OBxq8aDpYmnalVs+Cc5M9JFR+Syl+k
 zJnXF7Pnjngxj7ts3ZFTm3aoyh7buo2uaSSDRGWKGsFMucysAn4krKuq++ezggwaC41/XBpZIG4
 +/HP6XYyrV/sW9a5l7BZ/ElfgA34RjSoM0p9cMj76ObyJA1bkNCHPE4toeFnb4GNPAdDV3dyarK
 4C3gDV8vrCrnqERngvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F8E66D7D9C

On 6/29/26 8:59 AM, Pengyu Luo wrote:
> Now that the predefined MCLK pinctrl configuration is available in the
> sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
> duplicate MCLK pin definition from the camera pinctrl node.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

