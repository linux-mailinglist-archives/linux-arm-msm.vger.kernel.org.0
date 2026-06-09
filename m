Return-Path: <linux-arm-msm+bounces-112049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxwFHKLLJ2pt2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:15:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FA65DA25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:15:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LcFkZZMU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gXdaYjou;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112049-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112049-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7EDE301A7F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE40C3EA951;
	Tue,  9 Jun 2026 08:09:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6F3E95B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:09:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992546; cv=none; b=l92duVDKxqdff/BLHidujfs5byDrCCD11Gigp+iZi2SHTrnoz1MzqRGCZWwtTtJNXsZCeX9poj1vDvzMHwVy+vb9lwnEUiDzu8g0cWssXkIOthfA9ajty1oUDvjpoqh6WT/I2r30db0qF9Iz8fGCxJva4SAD8qtieSkuJC6d/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992546; c=relaxed/simple;
	bh=BWm3nGLKCi2joyFCAViC6bp/DeBV9iqZPiIn3YWtERc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwhGP30zyNXX7dRiRyEp1PfpilVcG0SdkPtyjfsyx0+8gdSMm8WCO4oAAIs/D7XfdQotB1a0C/1cSM20Z3EbkJ8RgbH7J1wu4OvkXsC1zTJxu/hL4GTuYHBKYsDZVEAcYkYSGOlsDpW1tlAsqiFFM5bylQuORBbrdmk8bkXYcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcFkZZMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXdaYjou; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rtll1587566
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=; b=LcFkZZMUpbH0wss1
	BE3WlRIrHY6M25HK8yshws4qycoj6hyESiMF/VxS+V+dJmjJU8+0wICB+AS7226g
	NJcSMc7e1VLwojs2aQ+P3tZq7awVuEyPLeC6469nmift2XPaG2FMfksYFvZV6wx+
	KInE0QC4W0fBV7lkMnWlBuMseHlVsIjaKaRwjKzXkmnkpPfCoc5vhMkq4oCMdAOd
	I7TlR3jJUWiF7WRNeU7PLh9WCg6wfVqDqF0WAEkzqpNKlvMG/ZitK9y2DI27YtjK
	iEw3D0SSWbxspu++dhmr+R0MUr7uu+V4J54gYKApijeRa1mfiLQo+67U9ka0I86R
	FnnuQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m4sq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:09:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178a632a12so14537241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992544; x=1781597344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=gXdaYjoua3QQpWaKBp/bhHo3hRt+bwK9hTGZW3BDYZOixqmzxuIDMEkJECpp9T48D3
         NsI1pxxA4AS/9IxmTgJrSCG4cFJXDmTbqRnKFQeNbtphOeyrv665Jv9CwtTtuM58xoTl
         blZymZZX3o/iR1rKLj1eKiBcmz7AT4s0RkJ8XvVTYYeayNdOI894zMJrpmhV87GsZCnj
         mAXPUVA6sNRyYAW+yoL/kQTV1cKVu3rvLfD7n85B2ZwKC7ZU4ZynC8s8Q1nXfnGFUhlt
         MmoQsxOk9qzXz6Z3dU2DS6Dm4wsmu6XikBTNZ5O0HquI+2tQ4dWbij9BnfyVi1xBBvNI
         ML6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992544; x=1781597344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=Y+GnsrVarUR4rpCF4HfujV5yFuzNnb6zv7R0NbRWz460lzT5VB5tcVul0w+YIvOrU6
         4GCrhhuWHIxVN8c/MRdqVciboWkQDNQBJb0oMk3L1yfTipUe7vOomy2VB1/26n+9HA5R
         SOiCdh/UZP7TP/jvhZpWUNgxzAm1yOIoibVfY6TEgaGYvUMm9Yz3zVt66yOxTYKubrpo
         flAWSaPykDfn2fZcAomjuuTS77GA7ma+jodceA5+xUwjbKQ7rdmCGyfQSmTyVteL8Gj+
         UZMCWNf94u+HI6Ig87fq9o7W69t+XYQreOqAQJRxhLQ93qf4TKR+dl+UUWDt8v6/Kwiq
         lRYw==
X-Gm-Message-State: AOJu0YxTgnUryvNpjFgfnpXb0+OSyJMXIsSqAcpV14huOSDwuhO4GoQc
	8Cp75BX7q/OejyxmsAOalP2t0WxVZlENvi3GxAjS1ETFsO+5ubpz65w9MnqM5eUY9O/TynXgPG2
	QrLohDS1QrLHgjM7nj8xH+0D14N+FzkiAWuI78fGzthdbF0TDFLPzDptUCVvdJxOmpkBV
X-Gm-Gg: Acq92OGfoLCVTenFR3a1CvYmOPtF0Vnmiwe9V/eGrL6JsZ62Pd5gXPT3nHiD60L3urs
	O7BIkLUmAcJSivCjAn6onQzb7YwBRNNwgFAHWunHg2wCju22OH5iYHfH9SyQWn/NJBJuSybVZFq
	oRS2+NfAZzQnLiLLDVTV0/VlYe4GMWT6n/QlgRUyWBpmDWy385ewdg4lMYfNDoTqWWkauCmRuUR
	rYV8e2u9f5EamXt3LCqKYbOtf0iS5tYuzqE5Aq6/BzwSIYUgJl+pRi5vUHNun7mc8XWMdfc4sTp
	AyefiFtDIGLBO6Eijp929wSxApvdgq2LRC+kDapRDznMUL4Po4BRJZ7kRKxgnWcF02VXfsnoAA1
	XQxJMoiMTejaONNjmfnm5kZLUOZXOGI3t47Un1TkbuJBZwC38fWsMkgyS
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14829141cf.6.1780992544055;
        Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14828921cf.6.1780992543502;
        Tue, 09 Jun 2026 01:09:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm978297966b.45.2026.06.09.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:09:02 -0700 (PDT)
Message-ID: <aca330b3-3fb4-403e-b30c-5e3a612eeb1b@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:09:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NiBTYWx0ZWRfXzPuFNSrNBSKo
 QcHKAXZz/gf8kIlLV1UfiJXvV8sYi0xO0mdimVgsbw/zmDcXOCtBjxoDTJYtg3F+tXCxtbQVgQn
 q1Fv9+Bg8fh5H03gF8CWOeOmTe8Iju5OmKJAWrQ00hc0sCpRDfNSFBtdIRoLwcPTS8ypeR1+YZj
 aqgOAH7ckmf6tYkJbrLf2c8axYH6TdSZexU1y6vfmnB58a6YRGmTxSw0zyfhz/wnee6eTfSJ7y+
 i94IXwj9yqkhO6COFzVXtlBL0WbP3a0NXHkh+/lyU9/DeHMG0hpnDjeFOVDB6SVodlxJE2OF5oO
 7PaMCLKDSWHqxem6JjdFoLVvmMSvkLvBeWP5L5k6o+tapb06LDp87+6GegDDcNwxAjHpaJwkVhR
 STaES7zpiXRWOQBQOm/ZlFIt7WbiEkscmmM37iByaBJcAWDPz+TE55/WjzLQ1nkEJ1OblLSA/G6
 3e5YZ8X4FLQDI10VXOA==
X-Proofpoint-ORIG-GUID: 05tCC8tfr_PEzQkJFOdOp2pIWqd_w6cW
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27ca21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ubw6xtKFYLytkWTF8eAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 05tCC8tfr_PEzQkJFOdOp2pIWqd_w6cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112049-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16FA65DA25

On 6/8/26 10:10 PM, Yedaya Katsman wrote:
> The change to the panel compatible was missed, fix it. This compatible is
> already in the driver.
> 
> Fixes: 493cb869874c ("arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel")
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

