Return-Path: <linux-arm-msm+bounces-102127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM5DD6fe1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:38:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB373ACFE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CDCF300BCB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B3F3A9D8B;
	Tue,  7 Apr 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMy5Iguu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8CzWIxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECED3A8733
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558304; cv=none; b=NAGPSgK1ythHoGGxlBEFQblWmggiiO7v51aNT9F4eMoM7hred0b1lpeMBlj5sH8mKStBsvyTzS7xEhgENeQ5HKrENma0TWFdEMttiKtP4ZdCm6Lb6J+eL/UNA2yipn9VILYBhYbor3q6+36T+6ZOxLKKclW9K5l2BiOW9ZlQiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558304; c=relaxed/simple;
	bh=pG/8VuhPAHUopEyOrDM0yRnbbv6CUyYjLv9n4BTdsLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8xlhWb+DwGMDHX2RoL72st10RjMq93HyH/B+dYHzqeIrcp9nqjyBGqKjZ3fR8MsgBgc9PuhQUPowxqMS2tvvnMVP2dRVg56oNsrPetVUKixiMU0RAj1LDYdyrIU3oEpoA7rhHdIdaxe+KEEY3XPsHPcpbJFErYCu/xAt68BVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMy5Iguu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8CzWIxL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Da0C3815649
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=; b=RMy5IguugJnpzQcg
	6o4jFwvz/jof/LMb+A55OA39sxPk5pXFxj9Fh5Qmo7aLp6Nsa26/8gYDmhnskaji
	6YLsdjnWowtMYHv11fASCJYU0C6tgbpnHM6qAK3W971O7700m6QqLOh0TiBt1Vau
	zO/jCxtoF+8cNJQXLjEtLPqmF6+S/xFA7dAR/gE2X5wEeCy3o8C1MLsV8kIZENWX
	I6yApgT/jmP7ZVJ6KGMSRR2yEPkFWq+tBOR/Oe5RpW3CtzGBGNod4BI3t2ZbymFi
	zNwdsxqwzZ+skdNosmSVewIE5MCf8iNNPK5PT+hYEZAL3mekPuTplXkMAsz/uVhS
	ucLxRA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tb1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:38:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so17161746d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558300; x=1776163100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=J8CzWIxLDuu02BO+ivJlbnjDFCqSVyx/e6altj7vDtl7lMEjEa3o/+rYFYhWEKRuwo
         oXpzpwfNmgz3NAmWQ8Im5VeMaEo1z+Ujur6/Kkn5gWjaVYdRZE2ZzULdqRj5o2keffsC
         fIxEs7guE/WC8Pn4tXNAhX4VQsDhqR8x1AG27PAFbE+UXw8zYVtA4b4bEU8QSOJDaTaH
         iKb9psXzo/CNyTe/MLC9IyAXmmwaWw+Z97QtiQmQeCe17JG4uat9J+EI2VNFQ/VlK7mu
         eQ/oLJfcroO/IsnD4aDLViwf/P7fsO4M3WEe5lUpF+x+Sb/t2vcDoDuEtB3hN1xsvrJW
         PIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558300; x=1776163100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=Wivb6BbmosV4/sgAa5yDcEV9Wjgn+2XbB9cRDdG4i2fgyCVP2zPQdplBZZw+yM201h
         szCGunA3lHWDPb+T47xFZ3JV0SNGKF7EeC3xlHgj1mL3XyaTOlOhgGQiQAJB3Ardb49r
         P2y4uLQrV22qKnT/drWscndX4pR6H7nx1+FzzrPnowYX3OTLaGgvR4/4FumI/Gkg9i6B
         OwwrTRyd/y7cAJLCiN3QzvF6xtyGlzJ91rhoAJFq1/O6x28NaKlUuOzjQfOjFQjAkdCZ
         9NxKc+XLu0zzqhW8r3LT6Wd6ybdBj0XH40OslkWvcgd+zS7S+b+rok/Gmew3Eo5K5OgK
         Q8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXpla/7pkC0D8Zdxtp+DXxBY/MOBE9B/Tjhjc9T36HxAYhmyqqv41grXF9Mr36CXIx4d6W4ShTX9ixm2GRy@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3cTIzq/sdJ7EsmldoammUXJHQnM+kCveftDjvcyGm8B4b3th
	IE0fzMVxB89v3df7q5dfI60y3nEbDikckKjjCNm1LZO0uUu30PjswEgGzh/2C9StmQPhm7Fudea
	t6lcbvLeaajy+WHaZm1x4eb7LZrRbklpIXkqnv198PHesG7b2tDvVwwtPxfojx5us/wFZ
X-Gm-Gg: AeBDievPV2RblY97goTec49YsC63nAZt/sp+aeJhHgasiCsUhFujwl3sSai92UG6z6W
	Dv6EcJvOjBGQHx1sD5hWFZ512Sptu6iSed5ulyfkLDKNBcAwPIlvCS+wySDfK7TxeWtQKS1ZBL9
	m6kdmSQQTj1fHz1f8fEONgqg/gCak0TEagWZ+sMfdf29jUK1e66jrthsTErhuZuLTKBkTV8ijtS
	1g8SnXZUfDbrcYaKMIcqM0LKumgnFSws9qTxDydrfyUuTIYrl5z7MBndj+noxVgMFgdbeWMPCaa
	DMZua0FAxwX44qz59f8dpYPcY1x8X0t7zYGzBp8EbPs4UrUSx+vwbOm5P+GnI53inp0/St+T54k
	VJlGi+YjhBAglKX+9pJ0roO6XmA8hGsAxyVJn8h7gwR8ZFnFTswA/3AE2zISF16QKHZbTkRiAHT
	uUsAg=
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210870316d6.6.1775558300356;
        Tue, 07 Apr 2026 03:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210869966d6.6.1775558299965;
        Tue, 07 Apr 2026 03:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm539698866b.48.2026.04.07.03.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:38:18 -0700 (PDT)
Message-ID: <588004fe-6ede-4065-afbf-eed620caf380@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:38:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4de9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: FjzcIXVUsiLAy4JP9XEmIRU10p7HMxiU
X-Proofpoint-ORIG-GUID: FjzcIXVUsiLAy4JP9XEmIRU10p7HMxiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfX8CFCpNRkGbxl
 pmjOSmXyiBqg/r79Jb2Pi9ItPtivdPiilZkRupYgoSX9JhN0m6BMH0IeVHA2Qki5JojGEOBIgDF
 gRvDJVWfCPfMViw5hqFuDw3xBzRSl1z42C0kF3BjjxN1tdvvZlL+x63svt+kbcrJBXg6p+Nk+kw
 st6ybVw6rhhQwhcQO/kVzchBbFHRN39f32hl+a2pXsb8KT1/arr5oAoSKd+ccP8gZy9bu+3sSnT
 AteXtpcgol3rQ5BBcbDSRqkNJFTchGSLo/HYOD9lRd4dXZ+LZaZKFC1Uxz79j4AtQGj894U/JoH
 w+efzy6NUPRdX181WVLxoDCaOThIPZbZHsmKZmPfNQeFRvOOkjNBtBdbP4deZBA9YPcTIgsGtbc
 67ymynVjEQcCgx5lHGteZyZ/LFn+5XHhMK+Kg2SQ9JqmTKR0kyOxxahkm8T7xAh3BFJ9I6XjGNY
 i82d6y49LWDspn556WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102127-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BB373ACFE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 7:33 AM, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad

"fix bug" :P

> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

