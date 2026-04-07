Return-Path: <linux-arm-msm+bounces-102129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKXxFXff1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:41:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25C3AD0CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9ACEB3026C90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231733A9DAD;
	Tue,  7 Apr 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrPx23sL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4VtTPAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD402EF67A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558433; cv=none; b=rdg9q3xKqRCeIq/HbAayzrx1waDx2WSZ2pkoQUAwyWaveWQbkEEPdi9eSNEbrQjWGXaoDr+f31yAfQTFnoeGoXgGMCJ49o/qaw6/iOZpVA0W96/cTF6wIHD5lLvyx+6abq+xVUHuJIRs2ukdgSzeaKe4C97yeijngdrdFpA7CkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558433; c=relaxed/simple;
	bh=A3ydXwomAr2rCw8QLiJCLbOQjFge804nba/zWwaOJm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBoYtzanjXnQl0KxipRiyukJ2USjsKww+Ld41Rdwu9c4itqVWor46n+4ts5pA+Zvg2shc/8eYuzGjv0ZhDgFfb3IxnVBrUEX+gs5BH+w3Xjn+s4lqWxh9Wl92Di/fPkcnub+fneCzhgFkrmy7G1yimANuxyWYX4CDb5pQRI3fog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrPx23sL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4VtTPAk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376UwpJ3536859
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=; b=GrPx23sLkh18AeQw
	ov4ZAWjC0IkKxGiLEVl5NOxhU0NBvYV9W/x2BpWGo5PIzwP5g4TL7A9EyZTgE1hb
	Oz1Wc0gWZOQRU2jO7p2Wm4VTCxyp8jLQXWVklX58eYtT8XNgnAQckCaEadO6mkgw
	TRhDxwJrBriOWrC+XN5tuDQb1J4cn0STzd1l9CKIvS35u6YZxtWnyvuaSV1c/hu1
	IJTKxmeoi5cmcUjHXvS+JEjQoZ3iGmk7cOAsoPRpXMz65BOP/V7T4XevPgZc47sc
	NgwVHMGAdAFYdykU9XlU0QfFoLvFVQdIJIxEcg1CgKVRnJNTdwjqNioSN73k9jHz
	NIjIxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2b7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:40:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso59045485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558429; x=1776163229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=T4VtTPAkMleoCL4H/1CvTBNEcYwg9wxERxxdZ0k2jBwhAMNOsKk9ajAnSagkm7njJ6
         jPYar50lc+gyqBnlNsOwceU4wRWSt0g4O/CmKImh8N0kmMJnu8oK8lmpWY/I/0rqAZ/a
         nRaRwZqNKHb31j1qRIOrhzSwRC5Pog1s2pWVcKofRftuH3KVOXLalk5dKASkMMq5QRFl
         wKgYrGg1wSDCQbuDOBx2oviTmPZHF3tQAgA+f3yEYpT069fkwx1YKJ0t7uHb57wX2oVI
         O7pQMKHQP3bGEf8rXM8I09x7MeJLHlpyt4BalJwUWgMJhRSiod6xQw00e1L4XmyHnvJ9
         yzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558429; x=1776163229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=AQZ8EWJ3skc4YIpUMtexD2Q5TTWEVP8a3QsSaKCrWKZoA81AB2AZwkIej4Nm3lK5NH
         mMK9f9DXlvp+cjslwfaMe++EuySLtABN5ny72pZTraZoBeU29SvlvFahpDetFeeZcwHT
         EQ7ysc6MMbjM3s54aL4+OxpVgx1YIMdIggnU6/QiYnCXAdwvlW42gT6rpJLTW/6grPfY
         4rROBvpFs20iFqKtmMSlZSUWj3SY/fRl9XkoH3PpwoAmeZWvelp4eHroIxs+BlLKl004
         G7DEMSc3klnS+XZtDVW5V/e4Y7BVjX30O7JsaEV7iI5Kej7FW8bGE854XBbKtUI3GjWs
         lXkw==
X-Forwarded-Encrypted: i=1; AJvYcCUuFPE5y1vn/ICc7vH+MDHa/nB4xRsu2NWXEvXP+cafpboI5TJbuIGGvJTd2zNE0nQg9h3BGrOq3VyBI8Jg@vger.kernel.org
X-Gm-Message-State: AOJu0YzQy2uVelBReTsgQFsWR7IwmV9ozg7EHx/Le0L0gbFrv3YOMMVL
	8Usx1nusTX4tAaiWg1DJtHqFsVeP8bffO6DrBRtV3ijcdXnO2nKY1egBhz2p3xl0bJWFhMYDIM1
	DwTzCwk1ToUrt4X5PKRcGS7l9cQ1/1Cb67Ua3pLnwlXyJKCM+Db1PlUeUxFKHvurWnXAZ
X-Gm-Gg: AeBDietpDpWp0S6pyFsqMJ8CBk9C7NDkAhsXeq+M17SGc2cYj/t8UlfIuXGxLrAebMf
	HBcXzCjeoKshDjZxJzPuR1IcdpHNc+ZEfls6CszqIIDk4d0kzXyFUFZuKWyRiY3flZXWnUFzTXZ
	hOv53/z42F9y6TfZxMn/vO3ai7CYD6LyYKrdcalp9qVUtsyry1/HkZzJRVJIFt7H0xsyYWKSot/
	d8u6V0IgIKMoa2Ujov/sJUqmNgUygNPD7+dYQYzOEcmmhDfZf2q7IX2Gz7lUfgcFvLQCwvBdBr1
	A5lG3LsEx1tsfZ2wsWtmoffPXxWkMzX20IPhUbOEq8W+WkHEbG1JpLFCzgADsscGbbZfMHrDqqO
	2ZFIGCG9FGF+Vs0Sa9ykXduuG5z9Eq521XCuXhHo30VXPo9RdsVnFzLMzyDIRD0rvUoYN0WsAHq
	erczE=
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673957185a.7.1775558429224;
        Tue, 07 Apr 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673955285a.7.1775558428775;
        Tue, 07 Apr 2026 03:40:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fe1sm4040978a12.9.2026.04.07.03.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:40:27 -0700 (PDT)
Message-ID: <623b4ff7-463a-4681-a5be-375ce6fdf90a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v3 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
 <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0w7-0rcqpr5bJR6X_uQN9YrSWPXSdUa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfXz4zeDBTcsEKI
 lFoNnVg73Wszxb+f7O6mzyPaoNGrIct4TDBGe/r2KoBpgEvmQwy9u1VCxybQLVkXp07wpJWOiRS
 w3tdpYIiob6H7YaAKrJ/QCMsUbKw7/qvqplOB0hMCWoMatVsTvbQv1Q2MG7biMDmTtCt2580iEk
 CgDU/o7x5DNY2PdG7b7kZChMu5qbquJNJjyFh3AlbeRFsfOxIcZlonWjYsRlRg8txU4JtwIr8gY
 x1mryClCXNJlS4AnIoQSnKk/NS9PBvPsphnR5T/r+8T72Li8tPeDuzTy+LMZSBrD8J/xxRX0EJU
 a8z5aiWMR9JheP4Wps8Kh0aQj/BqUu4y7JEOi+/Wg2HrrPVcOAq3h/BzUdM7USY+dZ9+tLd4wzp
 hWU/6k8n14LG30NyTnioO1sbcQFqNuLxHzVOTGrQkGBF/8gvSqXxSJRgw2K8SJ3F4aSd/nR2+5I
 DD/T9uPReOnE9mDqQ0Q==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4df1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 0w7-0rcqpr5bJR6X_uQN9YrSWPXSdUa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email,ixit.cz:email,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D25C3AD0CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 7:08 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.

I was really hoping for an advanced touchscreen!

> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

