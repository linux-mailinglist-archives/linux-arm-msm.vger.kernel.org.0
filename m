Return-Path: <linux-arm-msm+bounces-99202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEWlFuQawWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:50:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD1C2F07E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F154B3012848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E00F390CA7;
	Mon, 23 Mar 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Qpslx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+YlCKWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57D390995
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262998; cv=none; b=QyXEtf1rm3fTay8LOdYOMkywz4tG6AOkItbRNuE7p5oEunbkNpxJJpEwSuVHFlW1re18Ay3eWwtxqNnpdhID9DXjE6strjNTByNGsfTKwuE06ScdBvvIienVt5qLX0M11R9HFWpr+SESWSDQ25wVcv9ouEw3ZKZpG/N4CPecmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262998; c=relaxed/simple;
	bh=wGjj7ERA7nr4OJjrkafjcBLtU5QBzNDp/qECl2A3LRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mASYc1Ekatf+hH3sqjMkwKsWzYq9K49J83i35/5hNccVOIGs7QgWraiUMszGRlDVWUbFheRQciVveEig4KaanaVaaMJRwifPn0P/p30VPwLyirrbVGU2c/whiBxcBA1CTxSVPM9Cknk3zXTqCE8rAibZXo1/b5x7NkZeKN6akN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Qpslx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+YlCKWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tOCU2292005
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=; b=l3Qpslx48taa11ql
	EKmeq50oHYVGGGtT7AEJjfZ+d8Xy9fk57yOm1EsBjmkzCS2MiEyh+TbsehH01hg8
	Ncguif2pDnOdeyllqM1Z5h2t4fFXWTFml0XznnjvsacNgMgBaDEOYxV3k5BAc1ov
	8Voa4FBcabEOB3G9+xRnlE6NVBkb7THrYJ25qGxya98DakCZrN31ZZLoF7psKZWM
	+W43UZt+lMaR4nJQQ1j/SBX2GyGvT+zHEJ+KxTeV5kNacL5brJx1nSaQMsLObCrR
	b/34SUT89ikWw7ZOVIndrQd4lcRP+I4S1Dw14OnRx9Pf3jBcN/jL9stDT8MrNPZE
	Fzi+lA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70kwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:49:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c49436edeso36088446d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262995; x=1774867795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=;
        b=T+YlCKWAs4XwtO5QgmG3HHxOJpuHXFt9GrMtYpswMcWoZ7rskTsEdu/52qR6YUZ4PW
         LA6iOxpRAfe/mtfQcdlm9J/6myLF1cAO7tItSGuZQj0pa7WEOAUDlCFX0jIc70JAtW3X
         QtVND3rQjUEa7LXgMhH6GTt2a732eRhvhs/OKdCzRshFhRTYId7lIXjfL/I2NNeVGlP7
         tM3vr2A/+wswy1cSsNPZ4mpC+FN79G7jjA+PhTFsHQa+2k5fniJJtwN15bUQh8gTFDfv
         oUukTl05LFTCBqyWb0x3JuOmWkGKIGRxX3w3W6NkHyBZOldmfr8FeQJYSdsFGhCMzfdl
         rXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262995; x=1774867795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r2B2oJ4EfStDBIw7yrgfft96NvA4Nk3SOTixfnh3ZA=;
        b=cACw9fcnFF+pL5inb7uMOqk1uEDj9hRSfV/qn+r0uWCNyIc7TY/BxerG+G51x6cYQu
         ue/534ernM/6BCZA4Lfwxw/4MImZnxDQtWJiFbb2wZeru+/hel+7qkHHxFQazoeJadWI
         MZcJO15h8nvmeiGYDxzzIuQvX7DHqtu7fomo56iKzx7o9l9TrWBTtQzMj8OKI4jzstJ0
         30jzmzeQLb50Ne7NH5hBdiUQwnJ+x/N6YR6PniS6s7g20klm+DKespu43qVvvg2jqko3
         tlo5nM/OSYpu1kabI0i5s5ovXsM0vJWEB2Grbvgj45OpoFaaJsBBS7/2jOLwRBvD/gYn
         uaCw==
X-Gm-Message-State: AOJu0Yy9BBHKD3kZ5VJ33W/xC2hitM4yteYqqKA5t5ESsjJvPyehVvxg
	3avMy1fpb+q/s9E9FbnnHeo3TQEkkdfd6RX8bjcuiVF7L4NTk8FzQCk0ol7DtzzV2iwxi9BEVOS
	8ZbPAv0i/mtrXGACcD70evofnQoDogiavZVUV+SfPdZcyT4mkYVvPhDndALLm0ucmE21j
X-Gm-Gg: ATEYQzyWuUq6djjtuGnQtByhTP6RykZqFzHkd+lOsn7EpUBa5QL+Pf6YnsZGqX/Ut3t
	2am7flQ+ql8mR3tBOI6e7SxfXpGSVRMS9/iHoKhMaiezereuLGIQE/DKXoAADDMofBvaGi9v5+5
	xsDG75SmhfDDLejkBALHDtNQQYzKxJrgg4Bjaj/l65YfCichcKZ0H23aNg46mguQMmQdv5HiYjB
	8q20yBeQ54fkzb7k26g/NQRcL6NJJdkTfrGnI63GiqwQIer/F7/l3e+853BQgoiOE6087QjKV+T
	VQ5cWRVHgLbJQ/57DYmCeYstt68l2dbn4pABkv9UbLlASsiry+mMJJiIlSJqDPuvAyfB6I1I+vb
	DqweCh9USFcSi/7UFyRv/TxJFOyWlJHOI/gI/l2c3Higmnfb+efK4Q4Kc3igLhD3GM6mKfjOmpJ
	svGfw=
X-Received: by 2002:a05:6214:27c9:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89c85a4d900mr144852166d6.4.1774262995467;
        Mon, 23 Mar 2026 03:49:55 -0700 (PDT)
X-Received: by 2002:a05:6214:27c9:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89c85a4d900mr144851996d6.4.1774262995099;
        Mon, 23 Mar 2026 03:49:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm479337766b.34.2026.03.23.03.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:49:54 -0700 (PDT)
Message-ID: <925fc96f-5e33-4ac7-9595-277a6ce3fff9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:49:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11ad4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sYhY2sMgwC2GqzHfdbUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 344IuJV52lx0_VtY16Qa4YaY4cNQzhjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfXwJ3+6IHy8h3b
 9RSlmnvLYcSGA9v6EavYFpndH71djcVaIiGrCNimI2hQm+SYobJuev5AVhHd9pg7RpgaDOgfJVK
 vEieRD0tx5ztDZkL+rRyvv8D7cXJ48ADnc53fxpV2vNj/5hgOEBf8YZsZQqR69gPmtXhDapfqDe
 iQSri7GJ6d/5cWFReLw+p13ycHV5nq5hConpXKWnel9gOHisf3BSC+HD0Ou9eW55sRmC2ZbmsqE
 ydggucLv/Y3U1qhpdk/NRDZU3AQ5iw/ggoi4aqhmk+iEzPutPTWV3a2HeXfjw7mTxRQV9hPhgJn
 1aaXFk8dww/Lum0zJNAO2hGJ34ZpkRz4Y66hBvOmGV1oVA4VhOm8iPl4VnfqIuK6aQZGwQkgvjV
 WXrk/245EA4MpSSVOodBfQHq56xmb0PjabjpNJp02J2dLtQUHf31dUYyLblf4drlpKS7H7pYVSe
 sjupeYwkBBH1k7qul5g==
X-Proofpoint-GUID: 344IuJV52lx0_VtY16Qa4YaY4cNQzhjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99202-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DD1C2F07E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 6:00 PM, Alexander Koskovich wrote:
> Add a devicetree for the Nothing Phone (3a) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Camera flash/torch LED
> * Debug UART
> * Glyph LEDs (AW20036)
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Assistant Key, Power Button, Volume Keys
> * Regulators (PM7550, PM8550VS, PMR735B)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * USB (USB2 + FSA4480)
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +&usb_1 {
> +	dr_mode = "otg";

This is already the default (if unspecified)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

