Return-Path: <linux-arm-msm+bounces-100971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKEgGkGHy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:35:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD136639A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F105306A4E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C987C3E4C68;
	Tue, 31 Mar 2026 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU/Ph715";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf8o2ibl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED293E0C67
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945837; cv=none; b=raOiNj2L8BYl2c133TSfra8DBYwK6i9TAYVNBZ4QorsNyhSEtms87JxUMYh+AhTF/9vfzGMcSLebUjlOoS6alOdO4aENl97p6WZ3dBiGo0Fhiulw5tbLSS7diawn5QbUFUUsrP9bGkpuunVyUt1QiKf99RQPu1m/F7FfdA6OvnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945837; c=relaxed/simple;
	bh=zhSw1H3hTV272BHay1QKVTvp6fECnqDFpv0i+7GGyts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r1CbxZaMvffFuqxsQjwAMIJV91VkGw+H6zp6Ic8rWGDsNvKSvf7P+f/1kBt+EvOMKNSNqOMUGQsCaaxy/givkk/5IqW19rigAskOOMnw5CYlC6Tne4c7F2j/ajhcZTOSxBOsJvwZIJ/XMbcp6q22YxvQu53HQTbfBQOkp4uandU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU/Ph715; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kf8o2ibl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8ExGH4013639
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=; b=KU/Ph715SWzVFZYf
	SayWknkRotlWp2XUt5gZ7bqGtfwZzpWJ87LrjfX2hKpkIm2WTrtfp4fXc4iTdxgl
	2ZpSyLbg5wtPhexmV7xw/P93lkss1uoGPneq7R1y+5RcWqKbPer7saVxJTpdXcAr
	jawbtA9JSbFd9SvQHq05wcWXWrNJajBQUBvKgmsNiQbTqORLBMHxMfCHi/JXUsNF
	Wx3kAmSydj+snCkhVZObDYhCwMLyGW4vVlbdnc5Gv0a90iEVtV4fL/IFRe94Br5m
	Dmwx1WiuglRsQG4bfNk8Xqm7XpStz2+DtNn8oHXwtS1HFIhtO5LfHQtkBx3aEn3r
	Jja+ig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regvb62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:30:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a016b99579so8179596d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945834; x=1775550634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=;
        b=Kf8o2ibl5m7GlKYQL9b2MBb8fU9lt3BYJPPiOq3F9ATXMuv89g54dFmXETrS/7e6Yk
         iUAU6dNSEy2G0je7ddhtR1WOZufZpIFCrQYpyeoIt7U4CZTsl3AmytraYTzeAHWykLZm
         Zeyee/Pcn7Eng/Jfg4tsAxBppI5+NWpiHYjSSOSobLVd7A1QA5snsI2Ourx077ZrDdUd
         adoAsr/jzDHvn4pkywWNyxU/cl+8sSzOG3I8gm8dciVB8unoWUVrqOn8rOTmv16D5Tzr
         F3/6LB78ADW0dBqe/KBKF2DBVOj2OWXTho739p4gOyTWWNOG9MbiJ4tb3ex9lv5lbD/E
         LUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945834; x=1775550634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajRkYACtgcrXgDfyFlNx6ATLzPHfdnSorDZkvxC+xOY=;
        b=s56fAQ1PezGkqHoL2RlD8v3xhDpPEBIi2K1nu7mdxt8Hx98GM5AdzaE4XpTggkEW+p
         D9MDZ6hTVqVBFn2hzxUVD6MoNQjpwUirVosGPR/8pbMi/OJQ7wMlxOK5mW6/2DlE5S6n
         2VAMWf+o4cf10wOXaReTVy/NmFGj0jWEPGzGI7sBBmr0wj8GMpbePOW8SZVrRCJ53oOc
         3dPGAU984CduaKYMqgaOn+pQi4ZcAkeXRw1ix/sDJ8bBkwdHIBTD8odpwberf/MASJb1
         D0AN5jt7IG6lwv+pOsbKKOcUaDhiCn92IGccQU1WbP2O7d0+2GOTgzEQbGiWMR1X3eJA
         CGsg==
X-Forwarded-Encrypted: i=1; AJvYcCXaW7UKmXt8/uIKTPvm8O+qWLEpuV3nIRUONS8NQYtRV7ZPmrw3FQ24TYJ0qiH1f4onTEorUV7VRDaZzJly@vger.kernel.org
X-Gm-Message-State: AOJu0Yz08lV9/C/8nHBm309LqMSLFdMwS6mSX+rfgZ/ILv4+kMwCjBqu
	m/P7N9v1EPbib2l4qT8cCqnK8mwwrsHE62gxUrqyj7t9LJJxEXQAZc35k029ke7Y6BTvjHEHFm+
	HIRvjTvEg73OMgbFak/nsV+DfDY0gHEYs7T/BswQgUn2a1OGCNXjNoQP5yT4xvw87AFAM2QXqNq
	Ky
X-Gm-Gg: ATEYQzyHqaiusfgGpAPLR6Wt/KEWEUWc4or/PlauMU4urua6tlPXNYozrfTL/K/yAOq
	sMBh8cNb6+WslcW6ArG0zpG5qv9y/v3Ol73bUrDtuMy8yEINZZC0aKK/t5jD2cBJcobSbPs6RC2
	+tsA9lMQ1hjmxVBVdT2/wW498Sc4gbJAJorgi46gZcOPJXnhYrlokWObfHVQwWPmNk8m8mutWmH
	7OU+Lc6yRG1jnbEQ0LGUou8/VkLaKtbr6cBsZj1VqJtAVcplG4iJwYJ8S5qtmuBpCPI+oaf124o
	7tdB9e90X9IA9UtCQ/GY8fMp2mTUGEl8+AhUA/sJvpNBhsh4Ug67zymSn0AX9/gb1dCtQfkYIFw
	WAIR3TXNLBII1B9EK9vX85mUQbNmKGef0uEHB1IxGW6Iw0tinsIkrN9JCTrPaAnIl6gg1FzcrLh
	VV12w=
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr131302246d6.1.1774945834296;
        Tue, 31 Mar 2026 01:30:34 -0700 (PDT)
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr131302016d6.1.1774945833919;
        Tue, 31 Mar 2026 01:30:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm375575766b.58.2026.03.31.01.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:30:32 -0700 (PDT)
Message-ID: <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330165237.101045-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb862b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aS_UQZgCiH0XZnXXTdUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfX3W52X1Z3sXHA
 Zq20o6dU9j+bYEh260rWrssveNr3zOTowS8wbBst84+ll4qwhNBANAgJFZtvsvRfnvs57BhiCVx
 OEQuOCqLS6u1YTbBo8Vm3cXfye8r8jMeG/8bh8j10rr8b5Bw4wYXDJUWPb2VlcKOTlIHJaB6HW5
 iamvdzxsEiIOBYsACPH1OEErktn+LY8lNybutZa2neEcImF4z3P3k6zW5ww06XtRGIBx5jj8OaZ
 prpL1vGBEC5rvgFL5AyAS4XjBIS9dKDKCIL9c4e/UHpprx5J4oUc5vQgKA5BGwhQbt5MHL1rSCx
 3UW5r/TQpfxhRu+AlLs1I8mdFNsC7mfBBJCsSviPZ/L6YACqwHADrskvo+B1u5XHFqFtni7sjgF
 wpAFr9Z7wGdBH8A9JMKDZ4e7/J542SUXzHKyOTmE2R1rTBRrqIjuTPrWT0HiIwGYhuew6oo7t49
 AJAZ2wcEIAQpWV7QrOA==
X-Proofpoint-ORIG-GUID: jmxg4nv1u1tm8Xk-L8l0RYE3JnAGo5d2
X-Proofpoint-GUID: jmxg4nv1u1tm8Xk-L8l0RYE3JnAGo5d2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100971-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDAD136639A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 6:52 PM, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this tolerates linking to any CPU in a given cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]
> +	if (cpu_id < 0) {
> +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> +		return -EINVAL;
> +	}

nit: try to use 'return dev_err_probe(dev, ret, "....") in the future

Konrad

