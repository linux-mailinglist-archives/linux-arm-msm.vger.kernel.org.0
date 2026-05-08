Return-Path: <linux-arm-msm+bounces-106607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA0YCEmk/Wl0ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:52:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0E14F3E93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11D543019834
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C89359A6B;
	Fri,  8 May 2026 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7c6drTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8dbdxqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC23385B9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230282; cv=none; b=tHaUoDWUpj749TF6C/P2eCP3pspmrGBJH63R139OBp+hw4zeLch8Si0klIHHgBQH/i3ucn0lurG4QhuyKi9WwDH/f04j3xo9HwJyNvUTidoHc5DM7nTxipXsNM7EAtDuvj1NWtxeU/H0j8kVfZlMPe7XUcaX+f1E1Zd+sfRURMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230282; c=relaxed/simple;
	bh=VtsjDtpzf1aSwXKAMAiXCL3tDm2zBBBXyjYr/AaI1x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkfpJmlFOVl+ExYOqLaYK8ONBRzqqtnF7NgGKzRNe8dduQStbpdIDobub9fzapeVUwFGQ7SG4EvW4cWv9JqEpykm50H8WYSGsJJkkqPs6AfL0DQkELYZTgpHJoAMKGmIPd8e2c/sXy7FO+QTYw8k2baMbKG+B2fOUjb+9exf7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7c6drTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8dbdxqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG3H257850
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=; b=M7c6drTFyv6zraF/
	T/6u+JilJa7uUyx8eJYMlXLo5qgRpdTPdq7FjP5E+Lo2YofWdsXg5zubXu0cbxFt
	I55TpKz+OkZffbamuPqwFXhWXZOZPJtBj6liNQ/OdZqTLBBWdjcX5AiJS73QAn1+
	8Qp68VBpJSlY3ygHZ5Eq/SO7+yckKjwiJCDDf+swTsFSMWBjy6EGaY965Nm3HHPj
	lg4yqdi8bm9nbpR2LBsUygYvMERpLOrwYCCFokbrDDZXq3C3pN0c6mL4iMSv9jR6
	GmCIcv9i0xgSlWBs/py4H7Kr89B9BdiCUcpfAowexy7wIcq8Y8qpjCYjmMRg4kLE
	izU5dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegf60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:51:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d63aeaaedaso35146985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778230279; x=1778835079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=f8dbdxqn9QvtcAENIrJWKqtS+oE6XjFKou4INklcUIfTx4kGJjmOCDcWV2V5Uwmf0m
         OZFLDtu1nYEtQZ0R1vBdJbH/03uzzsSsn16Z/vbgLahe7dR6ixga0Dojyk8ziP+MmAf7
         aQbeUkSZ5K7jsTzad7e/xTfx3PEhkvOK1eBucJzEwij5NKnQp36/qmG2MNecL68bUQjE
         afZYln+p47R97sJ/L/mjYzXifTiFWJjq3l1idiniCGmw9jgmVTxbXvWsEyjhYd6ZS68E
         9YbcTguTjRWPiZQrNk7krHYe80witjgIbo1hZwTCUgHBdJ7UfQlVjaeH4Q0Rftm1UPWq
         e4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230279; x=1778835079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=l+IGOKDCwArea79FeNbzvE9Q0+hThURH9M6Gg3AJy5CylvuW566wB4YvJDsBFkGPyI
         f20KWvQHqBE3yfAlzGE9LQabVfVOM/96JTVsRzXpyl49p+IbSOev8FDoE+nyqqIgTN0d
         /Mj3KCOuPJQ7YJEKLXU+Br8SwWEDyZ2oSPG4IFHj1AdLeY7hXyE97CQiLOgpQ1EJoX2L
         bC+YVeNcYitkiwp7Dvvrq5UYjeTsaIol4ZG+9V854+52PkyK4m8VuWamMpIlnjWJMq9f
         9xPPUEKwa3ufNGA5fNPvm89mlJezNZQRgztNYKjwC69lxgsbtL0pcXhqKf+QvXCvK3ep
         kRRg==
X-Forwarded-Encrypted: i=1; AFNElJ/VH6S7bj5/Sm8s7i6ssP4Di8xUdNlpWfuG+5V5aOfz3DMdY/4PyG9vtGp8dMan1fzQIx7gp/P6MYw6G+4o@vger.kernel.org
X-Gm-Message-State: AOJu0YwhwBsYODEBqZ3e+OX0Z2H/6tylGFtSDa416KESty2EjXpKJEKQ
	lPR7XEJXM1Ti+h/INqa+gnZhJ8R8ztDm1aZ9S+EOEtYNd1dFjMktkOoj50TXJ/nYAoPz6xiipci
	wlZ7LbOr73D2CRjZjtidXPp54Lr9EVSGRVD3GLDA51kATP3aIOyFituVcbEls/Ru1PYQO
X-Gm-Gg: AeBDieskfoBVJ4m63/aa39gNO6TgRODLeAFpgHDwTC49ped/jtLa5UZS2BtzHVyARoa
	cd2FUvJmEwsjst2bwFpmgFgdV4HNQBPwmbeGuWOEKX3hULu2q9ZhJO0Hnxa28MYMnc5c4DDBnoa
	kaZVYaWG8cEX2tqgMEl3yBE5Ki9NLxYPKAlLVLGudu/zsJXS7qxKfLnYFIQDL6lIfj0tGamozTe
	1ZA10oG5L1l53wYmSPMqmV/Rx8H8FNoxNCEssCChUPWR/xezaqnxWX9xKJ61IFbfRckcnzTSTyz
	7EfngzNFEOjxzI5vRfkPBdPboVPuAkCdBGoaaS4kaVcXftj6Wy8knGlJ1Se5gWCCeIUUgIR7G8R
	2LDKbpvjoGeVt/Ai/beq8SJrdeeuPov3GUTwZ/vpCbNeXCHhfMK8J4V+JFucKqg3+RWFvD4Ec36
	98QTg=
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168440885a.3.1778230279550;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168439685a.3.1778230279185;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm407542a12.13.2026.05.08.01.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:51:18 -0700 (PDT)
Message-ID: <cba5bb2d-a885-4476-aa16-eb1384fcaa58@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add gpio device node for pm8010
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins
 <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MCBTYWx0ZWRfX6KffUSO/xHd+
 EgsOGUh3N/Zqequ3jd4y7IloNwvNR7L2k8IalhlK8gm3uRKwDoKzophBrrxIAPSOqWnrWL9GxyF
 W9W/4qhnnPA/gf+NZki1ppwMEwZBu7XRIfbfcBMqSn2rHkke9gdT7cH+Uvyj7slChnr5GoP1m/1
 2Bq1AqIZW7Wn50yGKEovcsKaf3xOh3sSJNslxJrZ+wU7C7OgGvi0YfXHtAeB7TzqXkqBkMu/3H6
 Ah2u1Iv9sg2BK/HFYyUinUvP5/sGC3FkXzr/sa7g6BTWOZ3G/wULWDhe3TuYOCOBTazhBlmoe+r
 ygM7XN4TcPCymk093LvZqjUu/UFT64TH/P1J09uIvPr6qOxV/NsRcIzzFi6RgRJZG7kdN+0JVBn
 lO3H+3lRmuMbLGqRit3f19DIYUnsEQ81HQ/p9t673ws+i/bf0MWYDZ5LbDBWtUtBgprnZOB7/vm
 HelO72wftAFFEhxy+Ow==
X-Proofpoint-GUID: kzdH3W56C_raivpHTTqbsqpPz84VIyRF
X-Proofpoint-ORIG-GUID: kzdH3W56C_raivpHTTqbsqpPz84VIyRF
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fda408 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iQYToJXVBgYrGeExREkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080090
X-Rspamd-Queue-Id: 7A0E14F3E93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106607-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action

On 5/8/26 7:34 AM, Fenglin Wu wrote:
> Add gpio device nodes in pm8010*.dtsi files for any consumers to be
> able to use the GPIOs.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

