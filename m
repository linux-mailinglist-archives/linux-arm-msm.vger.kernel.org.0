Return-Path: <linux-arm-msm+bounces-115454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ubbzJnnLQ2ryiAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:58:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD76E5212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:58:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NGGViOlP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G7WQKQb9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8383013871
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5587D334692;
	Tue, 30 Jun 2026 13:56:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20575283FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827798; cv=none; b=lRKzwGW5qJbvps0x8Md0PJCR9ha50u4IzgKkyxAE4SuCG19gOOvAEMSGbWKFgGHMfut3iF3Rzm477vORFP/pxFa9B2eCFCSCRQ8SflZ8E8r1Xn4ifeXFATeiSM6O/rIpTuT3n04WIUIm2ORtidGCNYurcAUW3POS0L5/In1TlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827798; c=relaxed/simple;
	bh=LhKngGkLwz8BGAapm36Snr8y0ch/mF0ff4cMVKXpjNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOFWC5emuXP6XkyefggWluLLKC40MxdsAj10X4bterow3gmCErAQBz0462FP5xfdgaAQYATKV8ucoe9sNxCv02tSCnkyjEb/b4pV5gf/jf4ia46DvUBRyenEZHJsLgBCUPtI/UA87SG1dVjXMVjkcJoTvxd0yK13vvo/8AH2ZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGGViOlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7WQKQb9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mx6E1613434
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/C4zaqYyFJx4mzZ9Z7Dko2c5OkhA0oBA3/TFBdaRUc=; b=NGGViOlPZ76GUZb8
	MKhJBB8USm6CVidhmHI+UCpzAQwlh556ekgfW+GQf6zeCcYhhWNxp98XaAfDwIMf
	7KO0I2KM1fCrNZsX8sVTm9GXFIgZejKodSsku799SpwTFdIF/MS2bN9XEkta1tnr
	yktHuMaSzvhyvxDh3vv61o17mkUfmW4ZnRlVp/M+yzMlsR4uJj2qHM1+brGwZR85
	3lCTcwtGqqUg0gFMwAyyJazBKUYdJQ9obeufv/B4c4BAhp4MPQmP5+ju6NKWuW8s
	fuZwMl7xDPVOd4/PNPdMGB7aCCoPguywFkBxis0Y3S2aPylAqBYF8+PzcBxk8qxz
	iQCgmQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cv710-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96927edf751so197176241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827795; x=1783432595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/C4zaqYyFJx4mzZ9Z7Dko2c5OkhA0oBA3/TFBdaRUc=;
        b=G7WQKQb9pK9ZgQwZzBES87qk0T+UQyfXpw88/u2PiRuW0Y4MBLK2gcrxkfQod72CTv
         yS7xmJ8YqkLly6mmuq6yrPW86g1Y2WBymUeKh/1Lcnd8QZc/T8z1XtTs30mDFuqOeNKy
         yLpnZ86HGkRDN0VcgXbcfu7BhHZk+zev8IwmK3pipWo7MxTiXBMlxyoVvjQTXq1KSuya
         uIy9GS+rDiL6BiauOFDoTd0US/HwPyhLm4h21tL4hobjATyXLYw26bbDUyPO0tWnPcwE
         J9zXixNsSmHRM0gi1nTQRpoT2W8+WIEPuVhVAvIrvByp6QV1BW++tDh1/zMa2o7HquSE
         DJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827795; x=1783432595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/C4zaqYyFJx4mzZ9Z7Dko2c5OkhA0oBA3/TFBdaRUc=;
        b=jpQ/K3XPbvZXVBIK80ke4H7DiI5lE/ZsFzxwH768F+vGqtbdGKM7odPl2EJsc04QSj
         BRsX6cCnxT/D9IfQ3KWSU5QsHYdPQYa9pNdXQM0JSJ31B4gro/IpOJlOz/pwJybYDIs+
         7T28q7tcuCR/zkO/EAVbtR6fEB7fEqhE3TwiaHk8vvBMpbG9XwQYDjDtMuuVaLdO2obm
         zgMxqknymyy0ojnKpnLzXJfQr1vrNh0SZ8Bwg0lNZHxX+16a3KztcEm45SQ7+aojzjFj
         9uwcxa5tQxgrjDqO8cUSGlTe2+zZ9uW83LdrQ+BhyGPmj3/5aYDDF4cIJfr+LoNcdN5a
         9GHw==
X-Gm-Message-State: AOJu0YzU7y/Wy0jWl33g5wcPQFV6yp2xWTaAzdUSi5FYSKnB05xpQTk0
	hh97PWHfBu6FY7SuodESgcLVldt1UYPOTBL0+amcXmMvJFqGy+zUJhvO5nRGczM/iijrM8T1+Di
	JcTl2lhgUuDYEjJjZVak+qsSt41UMa3HeA0fSkJcF3UXFi34jHR/EY2h/kUr1apcqR27Y
X-Gm-Gg: AfdE7cni0b7DgkYDnjidobTulgVVLLoi8yd/ZoC3r4a1Isu2ZP0DtdDiXLJxUpNQEjD
	axCvg4OAWKQrtzYE5USydPuTYX1B0LM5mviY3JMnJCQsNL5wGbOZ2biObgu4YawSphfSX3zUUGz
	oag8sCkYUJM0GI1/5/CbGKyDWPKQeJ5J2XkmXJZnn59oT3/vwmqE4Gwt37KasyTVhiEExyy+O6a
	wWe/t+EsyJGrhoTIx7EsgnnyWnTUCKy46nFS7koAE3arA6hhQJJ7B7DxmXROV1Tsp1DONTFj0eC
	w4n31CrfxvQwiktojaxgnFk2rDDkYJr0+LZy/vRAu9I3bMjj8rxgA+Yvckpu1nc383jtgVx0PMQ
	W+HtcAtjU8oE4Yw3EvFYrhD9gJd7fnjYECoA=
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr656454137.2.1782827795246;
        Tue, 30 Jun 2026 06:56:35 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr656449137.2.1782827794804;
        Tue, 30 Jun 2026 06:56:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3d9bsm1292012a12.4.2026.06.30.06.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:56:33 -0700 (PDT)
Message-ID: <f3da322d-48ed-47f1-bcc0-50161514d390@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
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
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
 <20260527-shikra-dt-v4-3-b5ca1fa0b392@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-3-b5ca1fa0b392@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX4hCPyMtuzRZJ
 1bzcag+9vRBcnfRGTTmX4QdQ+ZwC/B9szaZpKnDDz8YvVRQx0S4ZoNfKlbZ7/kWld03ad/+yhfg
 Zt0YitpyOVO02qqQIva7aVLFSuIBzRYWrst5KtsGuw4IpGkStXWtamrlzp/te1w5b/0Nq0uqKRk
 ThYiGiAmwiEHoGCPtb4uF0wnrq/YYETpYR+Z+qLpdLfIEl1sn/j17PI39HE9p0eqHyhoy7HWs9Q
 Cr4SZPvT2RXjOm++ZWTn75xt9auqfiKgeMIq1r+cd0ogv+6zCETFWQRgdHaoTX/lWkwvLA3vUTG
 +vXsUa70N6ynligM6OJ/+1fKNv7aqiJlSDQMeeqkiV1WHHPTrFzZ7+8yJ6Xk1JB5Q+yIgO0dyco
 wGIZxq4rA11PEf3aYqVv0hNiLUDcQjdZAKAa/AnkZO0SpCRqu5vY3VmrcvVDwjl4b/7P3mPzpQE
 z0VqvoOSUpcjTFmROIQ==
X-Proofpoint-ORIG-GUID: kBeu1bxOGBHg9xez5mQSI46Q31kcRIfB
X-Proofpoint-GUID: kBeu1bxOGBHg9xez5mQSI46Q31kcRIfB
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43cb13 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=djcwQD5uGQ3GNs8by1sA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfXxbBC/GhGbMgR
 LkxZ7hw9gBvNB5MOv5iMcNPLtTXMeSB0F3FUMCUKmRDNdmm+ibRL2X3sRGEVoeySvkD/iXmlhsm
 OyoZgyWLpLohOnshTqsYK4f6bFghV7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15FD76E5212

On 5/27/26 5:53 PM, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> peripheral definitions specific to this variant. Since PM8005 regulators
> are controlled by rpmpd, so disabling the pm8005 regulators.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

I'll pretend I don't see an issue with a volume button living on the
SoM

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

