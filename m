Return-Path: <linux-arm-msm+bounces-104695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEBjB+M772mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:35:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C40471143
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7A873015A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B94D3B4E94;
	Mon, 27 Apr 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kU6kphdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZ1tQIZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00C3B19A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285826; cv=none; b=Es/g4c79COlqqVfxTURQw5p2lny/i05hfzHzT8Pj/LLK6sgxgFVvZJ395QzqdyZtSvIO4iCKHCyQcwf0dTiCPEpnLvwycjyXFBmjhtWAF9j34TPv2DCNaq2hBrF0Z7n97mcyXHF9NJkfxkvrLJr/g8/Mgu1e6ORA01NcyJgeEUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285826; c=relaxed/simple;
	bh=O+O2Da9Tx+m2o+PdmRLmn/1gOukRiRjrdAZN96vi1oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlHwtIH1IXEv0XhDuou85lK6su/Oj2KND3pHlpTsdJcfAH2OmjeeOB8yEng2wJrZ8WLVgewnEpPfo4y/TnjA9ot9bNAJBHd/jyPjtiM6YHPaZtVKvbnCx+d5P2vZqxWYpq84a6QSzTJvb8+3nD3zioYMCMYxKhQod8y3c/3AZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kU6kphdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZ1tQIZU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kLu63962022
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=; b=kU6kphdEaBmtlpRY
	kJdoY8GPFH1JA9RpwG9V61mnEK+6pBbsGIg012XB9v03O6RlVkcYmxOymvwT2wXZ
	qLJ9YmTcRAC4ack9ngK+lu/C79Wag/uWZ9GZvADGyopqkWksshOKTrzVjFrrRE1j
	mSlYmYimce+uOGq3sYxODs9NGAGnFvqibSF+vR7PGbXo86EO+2ReE/3uLMO1B/q+
	4/QVbZ0uN9918LNyHz1uig4ZEb9vWRxjELgbqAigNF23VfC/hTxaBVG580k/0Gc8
	GvMNeu6zt0gjFc3lobL2CU5jAlL1lSAw6RsYQPIVzQkv7lAQmxGF1+iQE633RlRg
	TosOfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30mxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e62562b6aso15233971cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285823; x=1777890623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=;
        b=LZ1tQIZUcCNMyHhv2r52qShGKnfXhZW5+ja4zF5rwRGRzyi4kwkff2pkUVfZ6xt/bQ
         dyiCogZ1yELDVXPu3RwGJBt8ax4kd2UJM1wKDhiAwPFbw0j02buwnPeFRHMcRraUny2S
         C5xxjpmHyToIL4lJn/GNjxDMTMeUv3nJ2kRfzlvhnf9DqQJNfzWuAVOh27RyF9HzH489
         T5FKbu7h9/kDlMmzExacOkaa1kSEoGnVrOLTL3igmbR+SZzKDh1WkgCwymPfeblStQKT
         N79uG2QQRKmalq3VfB8IW+L9U9bbsYu/AhcmPdJGqcs0wdPQJg/HrHj7Xirn3tL4DuVq
         BOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285823; x=1777890623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=;
        b=q1x2aPDGcZCZ+TcLLauUtJY6G2PyiIaxBTcIYY4mWnl/L58yZq0x2eZm2P860uWcwx
         DNMB1osjO3p5Z/5bfcqST6VLjK/XOekUPJJz3T6xilZ27EF2N+CGFhu+GB4RGsA0YW/W
         9l/zy92SnhyPt5/9o+UciuGp2kFrCHM7sEPF0MTWFZHxprmQKuQf5Iib2WO8MF+NwBXa
         Lgc6w0ckQCYsEHKgaLzXJipVIhnl+0pLsRH75Vm4q4Ij7pY12lbeVAn3RQ2rX1gh5nS9
         7/QO9x+9EjrDxEaiV5EMuPAglZwUkMf+xuBKBkJpyTGIEvR8ZuRPmrYCfEmWe9+hPcrl
         1C4g==
X-Forwarded-Encrypted: i=1; AFNElJ+HRqYlCDfOcrNTq6OUKX37km4WGTe+1H5osqxebp5sxrF+ywjnbJk5N1UVrdT+PlxvQXJHPKMuFZDn/Gzl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3cYosg3YumGAG+3IMqgzobedZ1N0G7TsPE4dAZwwaOGhjk0W
	laCL2pDIB2aHFIB80kSDdmPHwdOLLXtURMlyXwnG6OeiwjXc4EzPAKjcev6Jcee6D/UGdUay5N9
	2rDJQ8xkk6SP6f2tc0Rh1v/49Nz521Fyfg9g89E5z9qvt2m6KUV1PwQTechqvYCbfSDxk
X-Gm-Gg: AeBDietn1Rc1MNUBHtXnXYFdHKkKbB/5e7NL/D4fx/5nhm9Qg2Pz+DqND5lkf8TWmKh
	WBFDCXQJtdt6M0RE70eUkT8l6QHs7J1lmgtvL/2R5kCTVkZuhY6HA2ED+DsByVb69GEhlE/qE3f
	6BhstS9nN1HtQ1OJZNEadTk7k1v5ITixBX/U8bL3Yn9HsnXV3fjPXeM7SBYEvrVDOuKv5eOCFld
	JWy0J6G7DFsUaUdzpRIorb4bRKLgGRgXINOST2O5iX+SmPI0WzK3ZTdtnHJ76x/QhbN6pwxEXGI
	3L2l4Oi869xe00QH/JFGt+MrhNcaA+3AY1lIYw5SFso1AzvymTKpNZrp1946rPIxA1EVrnGzar0
	lCnpUQ/YGlSTEIpu4nPub70031j5vIq4qa/eI7wR/SRe1yByzKX0OmIytN+/kaHa2746w1uZSBi
	xgavQOPrlF+kEivA==
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr395732771cf.6.1777285822991;
        Mon, 27 Apr 2026 03:30:22 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr395732511cf.6.1777285822589;
        Mon, 27 Apr 2026 03:30:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121042esm1071712966b.13.2026.04.27.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:30:21 -0700 (PDT)
Message-ID: <cf7de1e0-fe66-4134-b061-bc86aaa758f8@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
 <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfXyNzhNSB8+VhX
 Kc8PAcaA0n59IQDBxXKrX8UB3RhP5LSfpvMSio9290hEKKEN5zuEb0UuOCtj1wuDcu5YxNaP7ik
 oBeXeDQTXg59+xwBWfXsUIIfSlb/ttT8/s+9XJlbXNfX8Ym/G7ABcwOL8Lz3Pn0g1UR0NKA7jrM
 usihY4TNCzJnfZw/oGfoyUN35yrOYbW0+qik1JTkd+WKogItUR40MzJmff/OOtojgjIYNytklcG
 3EtP2CfhtIyCv1/Yp5Hfjtppvc78+jm74Mj5ae7ExQ9b/bkdcie+FQTBfUpShQqASQFdol9H3I0
 0h1XpYcvH5cn0pOxRwmyfyrhSm7NzAoLWb39DllNbkwX5J5JfA6xAtaSiE8Lc4h+dw0/d71uwkJ
 QPCVehjkYyoK05Lmuj2pEQaRqxFZG7DLtp8zMz28Tj3WzHHbvfNP2z40SC5D5NjTI+0CLMK7X5y
 /4jXfhg4K7WDt0VQOIQ==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef3ac0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qFgLWpbH0Cdle2BixX4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ulpK2j-K9k978htPmHx_nhlv6c4F3oGW
X-Proofpoint-ORIG-GUID: ulpK2j-K9k978htPmHx_nhlv6c4F3oGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270111
X-Rspamd-Queue-Id: 85C40471143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104695-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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

On 4/27/26 3:11 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add support for PMAU0102 PMIC voltage regulators which are present on
> Nord boards.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

