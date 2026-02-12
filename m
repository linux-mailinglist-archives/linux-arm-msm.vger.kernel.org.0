Return-Path: <linux-arm-msm+bounces-92667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IQuOY+tjWmz5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:38:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E612C91D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD66630093AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095A72ED848;
	Thu, 12 Feb 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAwf02t0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hd5sJTIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6F23F424
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892683; cv=none; b=YCshd5ya52+NW14JRzcCD5JHK0pR7X3Oz9DkRPjiBGf7uHuDqoP9r+o+VF/F3tc26K6UdekP9yhLo8dlKnpFbx1LLq1MjHYnVp82+IZOR7+ZEcc46tqjUDeFeJRC2/i/nGQRTnZzUnbGU4zprHYd83a5EjMAyQAWRdALiW43MRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892683; c=relaxed/simple;
	bh=dzivrYVlNO2Gn+ga2q/0v5yze+ovu0iMlHs2iGufm0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVEEQ/xJ38CDC1G4OrM3JWPVi4nUsXEGAzO6Iy+0XZM4W2dcFj0t4HRi8NnzGtPF2O+xJ0tMqvvQHebvH4qrkN7ZA4Y1+uiLRxeCT4XHzojSLCrK3wrGVM0Pa7JDIp/yyk0kNweixmX0mho7FIUXcHst2xrQdKZSgcdnYtAXlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAwf02t0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hd5sJTIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3Rs3J3963695
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7E6S3bjat2cxjUHSftIQdUL7rqVbAfh3aOYtI8Y17Ec=; b=bAwf02t0MyG/GtM/
	2g2kanFqZz4clxYE+FH2QDr0kGthcClGfExw8901dlMkSAplHjrIXaTD0JsP4zOK
	t7cDqPR7WhG/ZldIaKKffFt0u6xRQja+/u9AYNabAi9NJFTCOSgyMTNdwYZRWR9d
	hGigQzCH9sC3ZZB++jyhQyaDP8GZX2QANqeFNuqBl3kAVAt3pk20y9BCfPY5uH8k
	AD8/cnim/8IV9CYBkLIJXuOrayhc7dXaUiyBZDwUnugAT9dd6Ivn24U02TAp4CCd
	ONdDp8XbaPPYqQETLc9ZU4sXEaxPXK/257Z22u/0ycuCfHUYP+DOj8OV6Si6fHoC
	dZN2Ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntmry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:38:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso164869085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892681; x=1771497481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7E6S3bjat2cxjUHSftIQdUL7rqVbAfh3aOYtI8Y17Ec=;
        b=hd5sJTIsxO49OlJSH3YkIaz/sGlcWKGGd2jYJP5uTLUXdBoCqhO5KbBBidrRgTfnxb
         KpqPWGl9bjiO+bJcigt2jpfPj/Uhd33WA3mGsZKTtf/VVh8m7fYH3p3qi06KBg/qfxKN
         U8N8aN+90m9HwrRXabIchB9Pj4Gn5mKPZktyw0PUMs5W224SpbsPj1GvgHxnViZaQtIF
         w2xRusA0+QLuDcn1Ja0yGH9Fugpghb1dwqkoIB1fXW/1hnmED8MPv3oNRqBwy4vC2u6H
         0l6CABRzXChVq0pm/1FdqNO6fN/UYUKpmiWHkEssHUUxN+OVRbBoQ9tOf8H1IJil3z8K
         vEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892681; x=1771497481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7E6S3bjat2cxjUHSftIQdUL7rqVbAfh3aOYtI8Y17Ec=;
        b=r6ECYCOf0ZHPttoSlkVA5MpxjxdOY1pCPrQeSSKxMj7g8/ybVdMEkUwgXSMCv4z7pd
         dF312ArWwtXQYUqnHUMm39yPswJRB808/Vhfcr/RLJ5f8vdX/GLwz6x65vzgCv2KWU6+
         xlXPeep3q/cwFX2O6bLzr59LU06DyHjCG0/+cHDrTg2kZ5tN4m134XRBxxQQSE05NFFO
         DIrJPYXqib+CqrTlhFBbKqBnUUCCZtAZucKw9Rc0BuvKlr4SHnhKEi/Z0ae6nvYlYmKa
         VUI5/KhrbzGQINvvIN9jes78MJ/w79DeI6/GgXAjoVTuZlJe+sEXE5LHZnHBZZuYg10I
         kbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp3SlEfdkOyZlSl3EErfbVJzGXi5b6MNPaVkKg8cTojkWJsq123j3gFHZGUeBWSa/NTTfxE+vdw8Zl126p@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVoj5N/y/Y9gj09loPux18FZZD1H7UCHYY+XafU3Nm9UQ8JXC
	xwkVf0mSCoc6lketclDZhFna5pQ5G2FaegfzZITVXQPpRqsynzMBtht5TT5qoB2mn3mEX1xARcZ
	yccrHQVb+LOssbeCCGMhnCX9/kJ/3WxS/iYU0D/7YkgbC2PY97ms1M7XU+qttsKUamr8W
X-Gm-Gg: AZuq6aLf1dPDaWWu8jpH/tIBQKsXHH6tpkwhesMH+QXJv/iEN1om60R57cl2FTAUUXQ
	9JLzxLm2k2J8lRTd4usIZdwUbpzGI8/iM61jIcFMl1KaZSCbM6ZYWv6xa+eLekoMvlmP2f9TGnX
	RUvOnoiVAwpV6mrsVy8CUL5EbpCMeHzmJcaW6cLcVsqoSaSVLY6bVTxwELysuGxES5e1bHjnf1r
	YgoEBnuXT086xIjQy7kQL/AUzU9MOqCkKAld/BHCsBZ8j6bZmdwLRqmsGPrxVY3JP9tz9syS4HY
	i0mHPP4DDQ/QiiTnrijntn1d62cigCbYzHY9ot6aOD0CBk899phyqhIrcaBHRbm75nDLKOFbRSx
	ykZWKMM/wcvA5mjE2JHPL6a1F8LcPo9N4XO7lf1A0iR6nOyXi2fm0yqgkTKatnvm65Q4kOJS0hf
	RAomQ=
X-Received: by 2002:a05:620a:45a2:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb3311bdc8mr190987385a.7.1770892681172;
        Thu, 12 Feb 2026 02:38:01 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb3311bdc8mr190985685a.7.1770892680703;
        Thu, 12 Feb 2026 02:38:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38c5dsm1643228a12.22.2026.02.12.02.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:38:00 -0800 (PST)
Message-ID: <e7d77381-4e03-47d8-8583-3724f50291dd@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: talos: Add clocks for QoS
 configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
 <20260211091112.3285626-4-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211091112.3285626-4-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX2DOZa/KPxRhJ
 GCAWX+ApteK093jlcuCaGbcR0RUfZpFkkDVz4jpkfHWopQhSM011czrg2yRM9uNxXRlVc8P1mBL
 LpXT94LtHk3Zdk9TH4VhR1lFKulkerD+y/2ILxxEKSSzptmrHW9TP5suOxzRymVzhmbzO6Gbh/m
 5GivF0lTAVz0n4Z2kattzJMc3FwjQidSGIowlOhFLwZQPljh/W+TOHEeRohCDFP1ILe0rGwG7wF
 dLcjx50ORsBNcLjunlWqa4OZCBMfxeNJ0n56bYf7kM2e4ZN7JqgkCkBwSE9TPWHczu0WfXevvif
 S3YNtaJwcK76PZUtZUhisToAVk5EFYLxqJsv0UydfsFdifO51q7Qjq5jy5juUHJ1MsTbqS1PPE6
 g//OmBnTN3RB+wlikd6dgyjwHnGlu8FmtPpEp/X5trp8RUEhy3CfB/yImfLsyx5FGWzdw58jAi3
 1mofn1wo74IBuQeI6xQ==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698dad89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QD8XKuxi8VSVazGx0XQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5PpKmnN5fXpDSIDr8er_D10cbFtYir81
X-Proofpoint-ORIG-GUID: 5PpKmnN5fXpDSIDr8er_D10cbFtYir81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92667-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 157E612C91D
X-Rspamd-Action: no action

On 2/11/26 10:11 AM, Odelu Kukatla wrote:
> Add clocks which need to be enabled for configuring QoS on
> talos SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

