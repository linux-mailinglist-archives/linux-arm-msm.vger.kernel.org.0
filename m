Return-Path: <linux-arm-msm+bounces-116837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzESJUC/S2ppZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:44:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17D71220B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CuFLOUc1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RKtvzXIc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4067F373DFE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E046526F2B9;
	Mon,  6 Jul 2026 13:08:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820073195F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:08:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343329; cv=none; b=BZs9GGkct5C+XPxzW7PaA5qsB4ydNC6mMR0CcwDHBoymElI6LnmOGd8DgAE1oKNdokiZ/7IbTlr7DvebEMZ1BdqwninIqKNmw1R+G25fJ0v6v4Razd3iJ1WsF+ECXozwsbbYoaCjc67Qu6lCNmElLy8q5ASfK95S+OWrrry3NLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343329; c=relaxed/simple;
	bh=ex4N4gMCKxNo0AXdWraAdXV4xtpuS2QfDzHJaq0R6ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLJAC93wlIrTxb3qg8LPzXrbaX9kLJAmw0193pinI2/MmimSn7tNLDTPaP6a635MJVJ3ZWk+67SKXs7k4TnxwQTquOtZynONkt1xIKpIPSABChYh1WC44u+wYrnVj9fXdrSDZgBCy7Fy+5o8nH3gXC2pr5LbpJUjdCMuz/5O+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuFLOUc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKtvzXIc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLmP395413
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=; b=CuFLOUc1M/dPROWo
	79zZSY0nVeKDFJ65kBS4UeR7QO9PgCqIJjXTM76Y8RklqArjF6Q4/YC1e8q+WrDX
	7ZZQIrMmLUGeOsaUSpZfSIXtuBm7Lrq8XCSFTw5kOVYXszyVJCORlT5qkTbbCNFr
	xeYtbQUovjk68JSnhKviZ8UAusx9Y5VXMYHnbc7rLXFfFwBIxiKCXUeEy+mAAKGu
	oUAh9HQHwyrw1YIcCeo+7Gc74gBBCVmwp8VraB+wUpeCgOSOoxRE2RBCw8orhTg5
	CMCtKUTlq0l3Qtd2PqfNxOHC7liI2cGap0fk5Wr0jUQZHEoBtCK9vU1x0+cQng8A
	gEHUMQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgtte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:08:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734bafc2646so70865137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343327; x=1783948127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=;
        b=RKtvzXIcJO9NOIn2NNQ6OIqfIL4iDqsolXu5JW9AezFPbunflnDgC7fFrh1RMCApsO
         5u+eZfCUvjgLL7vVElN6hBZfBwqvY/C4D6pXh1MuNSxyUupJfbTP/62shgdMMJjyTO4D
         vS1+jvi24l9bYg0HUaGojDRVW3FE9J7Dr7aIR2neRpEB2KbAnQ8vGs2meFTFJPNsKBHa
         jf5YjEsGeB3yLuDNdtJhjaG+TZ9U8BTZfr4JvYaOV2vjctP7e5PzHyMLJvE59fK7WqNR
         WcWmWRXdc3ByzXQUB1mtw5AnPU5650+LlocaZSePCAyPp4dLK4ch7SLm54chek3m1ffW
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343327; x=1783948127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=;
        b=p8h4TE294c+IKGHqYfK0sQ0EXU0Tt9ZHEsxM61YMjMEz7+dLT12a7ek7HX/0KBMsjl
         yg0ntimM9N8a5k4HATpUS0RDhyevU0E46xurC/j06yM8uLaLFQsBJ7yMKOnFO/ohgF08
         KJ6YhTGNHzi7VMaam/9CQikLoh9mSmaOeD6ZO2oe9yijOHWBxvTwfejNmMVlx1Z11DBc
         5lJqRojdnAWiYOgWEQ2FouuDbAKGKAIeoXhKSeebpPeqERLIsVazmabIqQw1sSf6A/hJ
         0Ilo1xAA09dnfoji4qa2buwSP95dd43CzFNj2tVp90Y9e08IDqjByoHnbPECAGm3QsDW
         tJuw==
X-Gm-Message-State: AOJu0YzXhcT1wG9mlUBzvyNqe+4JSDHwjXecp5OmMUCH8JoWQFoNrYA4
	y7pwnFu7ZqZ8FtyXH3bX4uFGpePaAFdUDQERo8DNWohyfu/BMtRjhPPl3OdRBNQjSBRVUeiQgzL
	js7j2lhDTPX9wsmyYoX3/+GoqFyh1ekhjoE67bSeGT4J8y+6xIsQkKDxnFeZmLYRIduH7
X-Gm-Gg: AfdE7cno0XBw8mWsx9u384tluGVv4iPKq1qbK4tK7g5ebYwWkP3Jwc663x3vMWinkOc
	i/l/n/ofb5hvYST1ALJrLTbTmUpi9uKGpubeZM/2u7aeThmUQHHguDPVECwm000Ut4deY6NrNPY
	JALoz9JRDS+UtjaVgLDEJzQXli2sMhz+oA32KnBjOdrmEbB3h/NQI9CdVO8KDuaPX/Dwqk4klN4
	rreleGnkkqj1P5k+kdt7J1O93ayq7rbf3dmlP1OTSFUka4W4/UNAV9ll2PCPCsOV1etB3cZGvSk
	uakIYK/K7SuHrC+yJt4E9wFCEoH9EXyIW7yAY18QyJU86GSYpZUcrBZPCTxyR/OR7uDwM14zgaz
	VpVf3fF6MmWl7gvs9iiHRADamDVYmWGuYixE=
X-Received: by 2002:a05:6102:5815:b0:738:befa:e851 with SMTP id ada2fe7eead31-74207ae0403mr1125634137.8.1783343326920;
        Mon, 06 Jul 2026 06:08:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:738:befa:e851 with SMTP id ada2fe7eead31-74207ae0403mr1125615137.8.1783343326426;
        Mon, 06 Jul 2026 06:08:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm752720666b.44.2026.07.06.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:08:45 -0700 (PDT)
Message-ID: <b541c7ff-29d8-440a-b501-592ea6688f23@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:08:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4ba8df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5eIueRZCLR0BMlXBp3gA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: h55too8JGk3aHfp5kp4Vwux0ushafE0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX2sDuu9v7QZox
 /HBJCh/Qu6FzgjVlu5Zug/HwYz71nmxTpqk9/qg1NaaVL/+m8gQN8CvdkZhNWvdVz5IODxjM+Ln
 4Pdhw3NMtp54KKyBvjbrs8ugCEtBdUxehOeJPr7gmDEGbjMZQsmou2YK+WkmabAIeHwUvo5Y9G5
 0ThDyTK+tXZDPnzL/XO5ZTbqazVcFWdErZmyi+AMceaQ0irnj36QCG8ZoWTeQrKyI7JVt4M/18B
 JZFPYf08lVdfGqOcFYLiVwkCrVdou/Jfbf9apTKkGubxnV/9+BQ94gBIzrbrIn8nB9iImHjPAB1
 YYRteBmZmanxlYu2d33UaW+1YBPeJP5B/McwJb9pgPEjYZZWywcEnO2xgSjGUAtU6zJvEBdmmpi
 6rKsuAfFrlFLNbO+n4RPo5I0U2DT9t/icyVNJaszhSrFlVZV4O8Xnli+QldIr0EE7eHm5J/dVIy
 MU3lGOiYpbAcBcztzqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX5Kk/nZws5Tr0
 CH2TJ+YEwtIsM0IUQRtgGalnDrZPWBwMSNdAA5zvoqpHn9SPS4fUzRvssELcKplShYwuBRo/hFS
 F1NXXuboKXtyU2QG3iPKIhAxHfLWuUM=
X-Proofpoint-GUID: h55too8JGk3aHfp5kp4Vwux0ushafE0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C17D71220B

On 7/6/26 2:31 PM, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

