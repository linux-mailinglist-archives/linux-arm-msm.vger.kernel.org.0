Return-Path: <linux-arm-msm+bounces-98442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkHMZKNumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:33:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACFF2BAE12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B89C300BB82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5D63C3C1E;
	Wed, 18 Mar 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KulQFRo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi3l3y9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4F3C277C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833614; cv=none; b=mX6I2bRBO2S8NHM6PIuKlcW2OuMlNb0wNSmGln5x0pJYSAKF7l+R8Zmjq6mzG/M5+v8Li2Trrvod/wJms07WEaO5vMuT4gQNvNBMN8JzesFPEercmJuHHaSlLZMVpmi8gKkkOVFDzk8mm0aHpplMgRvWYAPcYZwj1Q2VLOmJ7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833614; c=relaxed/simple;
	bh=p+4V3p3F/eFuX1bC0acottRUz2aZQ7vSUfMRPwCEmV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovSWlPulcyV8SXQDWOOzxcqVkI1MAzpWF7Wb4wBTwHCuaSoP8kIXM3hsBrpVowShb7aC5TAQvBHsyXG5AJD2tZoptukXv2hFJvUAUkiV+1S5Bdn8oedFPxSOjC2qJk4GkZ1ePZdIZUywJB29Khl62zJ0ssLd1O1fUH0wpg0CaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KulQFRo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi3l3y9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Muji3358496
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=; b=KulQFRo2ppyGCv30
	HzRdW1h/z7ipvBc7tT6iFwc/9hZATfqauRJtbGsEsjCf/mfPOAsx5wOp41Z1uToe
	W4WwTPPPvsqDTb4rymJu/5hEbBbhMI/Sy2Jp8CDuMIbaaMeIs4YrBZmR0uBfdA0q
	PXEHVPWweRzY4QPPK6VdK71aP7yhD12vgGUvfYa6oSsn43gTA04xSqWGkwdFEzui
	LMllPFwnIVapKEQCHX6cbEfvLApkkbJEUduXcN6XJ/OO09Xk1QsQiwF5k/dChpGC
	/AmICiYdSyaPP0+DOSyhSXPCjakoVVHRfRRfK9GmcdJHWEKZYStnJSK3OL1YZEt3
	ByOFPQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0f3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:33:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso51021781cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833611; x=1774438411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=Xi3l3y9Dd+ig+hiEsDN54yFRD4vegsZB5lmB1x0E1vSdmt3rlD9bdJA2O8DU4ZlF/J
         cdIZ/pdlSRc4jUv7xWO1fWEJVywUHrh0E9BKY3WsLMyEUUh1SKN8367kFiQQWgfWnXOX
         CB8u1fCa+f8vbWA5vhRxZg/XIZlQTHT1jHKZvcMQK5wmcTu1XBCRwgubvqvIoufy8uHI
         fzN/0u7F3qSWCTw12b3W9Pkbcb0fYxeHo8JEpJq6oEuiLPv7jcRWHOLvBCRDcTfgSrIs
         AAj5fWGwz/ZcXEDqgCg1QuMz20IhxQoaPgk4gwOMw4Fy+LcAO7izcLCTdE+gKy8aMlYs
         QcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833611; x=1774438411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=CTlfdvlUfeCod4BZtSSsGeNGsFMbAecD4rZrjFR/+H3Z0DOui7WWBa1JdWjioJCxuB
         BnzmJRZQde8PfQ6yr68zdLHWdOBpcSosmndEBZ1kPg22Q7onf+4vKzd1+4J9U3D0n3WH
         hVoePClMId+qE7kuY1Dt0e7lV7zu/xVHmvefgD6c5NSabFVAv999QxvgzM7mlnyWTHRt
         JRe1ZlbJ1DWu4B2glCeAi1pZzav2iF+kVLJ9GyitZ0cPaFHSgAs2yV78Bpn9xV+tDfK0
         /EKo+bRaM9tkPmpX4ykoPBkzvfWnzyT3L/rePQOr1CwcZcnl+mUfvbCnGd+Rm4RWFsxG
         WDzw==
X-Gm-Message-State: AOJu0Yz5/1Y8YPszyb4jTY4lGKUzK4fHei65XwFMzPF9lNGqzy4KXJNA
	d4Ct9rxgKakXQo0Wor84p8O7jv9SsoBklw2C2dbfQWb3aubgkRQU9KyWHK1U5rB1H/44nW9l6Y1
	GLOkUAEmbSGYi+F3yqnb7N3G2ugHovTLWCVdsuLH4ruqtT2fHx+EJD1YpdR5w/Q17Nnbm
X-Gm-Gg: ATEYQzxDGCC6VHdQMNFIMl58J5o9pVG5gKdXSKo7yuClDoSb/Komhox8AvP8LZJIxPL
	1nGAgU+zK+MZHeuMFHgiAK07vC1ZZsWHR09IFQl4xqa144RUhrKapZSL1SI8kzgoBvxgx1MvmRM
	Ege85O/qyu9Mh3HmpUG2PLz1JG1FZ8pZGybvkJFfXteirGFBRRFb35WpdDTRmIkNRpcL2JOAzIg
	ZKRvRrBTpV7E/3QZrJwoILqGJJbyCMeYJVhewJ33wsiba6fYeqrH3cr3q8m27sybDBsmFDKKmUz
	AtmPwNWnu7HfcxJ/ZQQgvhvJtJVsX2DxEyIDcTG/B+OyMdTz9ao0/cMQMcVXddhPSKyf97Bujev
	aeJhvuFB0OhO7s7p8msl1R+7eMVwBIBEuX3YVIM7dVT+Mzd/gzycnKgtSxZgTn/xIEC4jIdAjsd
	k3jz0=
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511831cf.9.1773833611329;
        Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511551cf.9.1773833610947;
        Wed, 18 Mar 2026 04:33:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9849sm1476868a12.16.2026.03.18.04.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:33:29 -0700 (PDT)
Message-ID: <5340bc99-df1d-4736-8e10-09d541f0d2b5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:33:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Uy8xI4H7I7me7MqiLDL2S9kO7DlNxPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfXwC/fes/to7zz
 kC11Szg5rB2uGYNnnP1z3twolOnd9TqSh7S4GYVsTaWJwOdCEn41RxVJWJXBgBUOHj/QXiwLlxz
 6MAENyw+WZroVwwLmHSn0atcL2lwE8Fr4eD9kIRcxtNVP9wx4Zsasb0XrEfnh0k+2BU7x2H8F20
 RSelWHmVNGB7nIHa9xlY0GOEkx5WiJqnCuYFdAThUf5OitXMKAOjU64s6GtR9v4A+GprGeRUlcY
 quXtarRMR7NcQ5jQ+RQkV+AZbjGP2T35UZDuZvovIGHCj5KLJDmJHw3KXRSXvTSrdX5mCvfoaAG
 4ZC7bs06k7XXIsbVSC+b1+vhOIsDPdq1MJFE1+jzsUo8QZcNNzdOwAqvr2rH9SpxxcM2d08dJl+
 jpMkV6NH5SM/VHJ+x6S3JTbS63Wb0pzPsbiHU2lAtEska/2dZTTZ2X6LkENnn/EG5t4/UbPDwQp
 t0XksvvrCrk9MTqVXCw==
X-Proofpoint-GUID: -Uy8xI4H7I7me7MqiLDL2S9kO7DlNxPv
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba8d8b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aywfhrhUYFgYpfM73PUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98442-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ACFF2BAE12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:08 PM, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---

for the whole series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

