Return-Path: <linux-arm-msm+bounces-98453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA++Bg2WumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:09:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8032BB407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52CF6300D90F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EB436B058;
	Wed, 18 Mar 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N81CMaN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNufPPMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4368B248F62
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835786; cv=none; b=aV6Ht2nVwIWWCK1fX4vpEZgufBp2cXdAempKx6vSF60JfBhAk+YZYwBegtMqSMNk/03O6ZDwLFkRPQ9fVSmtAGHcNYvsjnJFM3JxajCHih4Z4TO++FP5WeHfA4XUuAESkqS617xCG3xOj4zKTl1Nn+oDiSzXtL2Se3LGNsNCUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835786; c=relaxed/simple;
	bh=MasSu6LrX5lPgNjrXNQ4hDcLWXBWHEq2tH9/laGLU2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/+B7v3irb5vFU4dKC0SdEanMWsneEnk/cAiyM64gkQEXhbfXSzieYwF1CpwcOTwuCIWleXtiwzoWrfy+GafjcLPN3CaWywJSnp4gPLMd0YbgCsDW/Z4JwYpRE6suG5bnER/4jxfYyrVN1W7Al5DXauupljbUBIqJIctwbW/EcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N81CMaN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNufPPMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IC8fjg1458909
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=; b=N81CMaN1MU+ZxPW5
	C8Xe6kBgG+huzIe9651hcdfMEN6KBbk9eTZaHIL4iglggKQA7mA2EaggnQTgMD8Y
	TPlfvFceRpBcKh9V/dO8Fdix7OIv1MLtwlxjBBNFLF2/qFE69WQguPYLQXbq0IiK
	FUuWasjVu6dJMnVXPwi1Xss6mCbeHC/ltO60RRkvpbcULK+2dKVjMSZS9j0u6UUH
	EPrDzl/GMBd/96L53+8KeXKi04JUmhSxhNsr9AywCpnz45rIljusJ8hCSkwFwp8Q
	50Q+NSc8UpaDItT/P0ABcFhck7VlTekw/kbGeKs3tkplYPKlw/1lUhD7xOMtwhWk
	4i9Wbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1804u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:09:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso51236821cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773835784; x=1774440584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=;
        b=XNufPPMi9EDOjpXfKcMUliELbRM5b3ydYVXO5cBOH9efhUsaaMKLtKl4fruEMvCFrg
         SODOMUKSP2V8Jv9xTDWEhFF/VyNGUpW7iQjmlge4wCptGvMoI6A0FFjDNRUq5gGq23Ms
         Ifbra/YNKQrh4kevSlWolJsWWFcGbkYFoMAa4s9MTgZ2QGdfMWJl07ap1ei8HEdEV8WE
         I6iUXqrvdIcGU6ai75rCm9HAR7WnqsleFh1z7UFijJ/q+UKk1tdQvLgi3KgXFErPiop+
         V1yahOhRSogYm1dVMLft8xYEDBw5aT1XWcUZuC9qeXzo6sEkYDzGLBOCC+VYZBgq5RNH
         jWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835784; x=1774440584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PHXU7+o+q6TQfOmo9FWcPNUGxEdG3zDnyw8T7/zKsc=;
        b=f4oJg12xrE0i5E+V/r4DGkJHhO/OekeH5WB2kToZxHLlLWVpJDt6Kb4AJcxe2FWtqr
         2aM2c7cmY1pS2JCaa70+sArV6XFf5EUpueQJz0b6yeJo/g/e/lrAjXMlWE9yJSHvuTEu
         +0BX8ZMvcPpjBChDQBNuZlero4xZHJQG5/d3K4BGc8o2JPkRumvnzrBjFlsdTvjK1dyt
         xPzfLm98Al6LBw6hYD0oPTDNGP0kds1Z8m7WoNVNk5puswil5mjrM5kKjVwUYKtjkH5H
         RPpaDzkRsKn/gYb4BPjMheKnGYza2XWm6fvLbLThPbe7jsjOb+6OR9O4JC9As4Q0G8ds
         +U3w==
X-Forwarded-Encrypted: i=1; AJvYcCVuHE7nZYAOBvQTY7lKEQ4/EHa30j9HclRfY3l8f+dOwhgZpzgd9faZkwWXDSoZGP4w2Md6NvXGYiDgORmR@vger.kernel.org
X-Gm-Message-State: AOJu0YxgX7wfUQH4vEveWWOHtxATiGhXmE3c/o9QKCOoXurzFbFuvqJ9
	KMu689cPXVe/gV3fzYtg041RUuDl8DkeFweOek2cO4728VBpgWqBYv9xiM2UYuFiuvt/30m6PVr
	yJ9+kiYJ7XZidnoeHltUBNUqgsuDHfRkg0jXNY2msmdRaamW8rTzs1L3+yJG6H5K+gsT3
X-Gm-Gg: ATEYQzxV0GoJEGsuphbXEGxfrdjkq1jnh5eM5ZGf3qfNCG7XwXCQU6ekWnXT7UdIcTq
	VCWuLkibmqZVhfWdW3hy2GkX1CwF0gBYMMQe5HeHuJ894pRKzyZfyyuOHJVeQ4SbfaVWePvuC+Z
	qsM6/zDrOLh/Cxo2skWUgfszo+O6aQkoSbkoIREuuKa31UfcKE/9BBenoRuO27YH7NE+QQerfOr
	BgI1AC4aOs8NyaNrRUT3+o/XK4tahdR9Qo0WLenTA9S1kDzfsnNAfabsA6t5zGJnpxGm3XyVsqy
	NaJau4m2iane+kap97OgTY1nVs4jQghchF9g2pzp3qkUJNDqcsSWpnCb8bV+7XSRkkcsJW++QGV
	Zv2jPelbfdOrgiG88QTWgCHiwJowkNbPTB8AwwXOBujGKNaccDm504erM+p08ayIkWkKqH5YSiG
	WF/FM=
X-Received: by 2002:a05:622a:34c:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b147690e5mr27514391cf.1.1773835783599;
        Wed, 18 Mar 2026 05:09:43 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b147690e5mr27513831cf.1.1773835782975;
        Wed, 18 Mar 2026 05:09:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16ddd39sm190290366b.43.2026.03.18.05.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:09:42 -0700 (PDT)
Message-ID: <74c7e115-2a64-48ab-9fc6-14efcd46717f@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:09:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl
 nodes by pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
 <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ENxabUkGP1zXRZqDoKuplYYlUay0aRUk
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69ba9608 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=x2qkw7L4rmU9F7zQ9u4A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ENxabUkGP1zXRZqDoKuplYYlUay0aRUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMiBTYWx0ZWRfX2dEuueD7Obj0
 yuHQHgTs3FwCcgpAekVEdut1zJvn56A2+hzNwW2SFMgYadhWB2IXGQTssR+ro8FJLDoeH/+wlP5
 ZJDsIsH/ec1o6VlHxJuYG1MgFYcoJBWaLBm+pgcpaJim3ScdcdHBRZ+5W2Y9Ak0idrgXdIj5xaI
 bFeQeILK4z6hEg0mEpZ12aTpjhwoO+PJBBr01ZFTLLV4X4wfHogPu2YdGkMtmpw3jwypOtM24rZ
 jZuCZbUDm6iwrsyS1Fh9WhUHoHb4ZXbzhiJpY/TsK584sOEuawJn4hCqaMfLU8U3nP1W+6BQJJh
 X1/BWaHUV3sD1UiqY/D52nfH7tbcCeUtuC+5LQ/GhiVJaHcNOpEJW424gNc5i/euLNN1I13QurR
 QSkKZsXDtxyGBCYS7OhoFR8EmsOLW4Y7v6vdeTyTSgGyjd1WdRLg3oJ1uIxB/LZ4GdJgQrhkyZY
 SjXxntSAPVNyngOQ8xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98453-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E8032BB407
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:00 PM, Luca Weiss wrote:
> As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
> in preparation to add more pinctrl states.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

