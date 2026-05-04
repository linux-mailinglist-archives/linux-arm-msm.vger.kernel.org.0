Return-Path: <linux-arm-msm+bounces-105656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACasBX9R+GmQsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:57:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEA4B9BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95E0C3011071
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F7B313540;
	Mon,  4 May 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTaxPjdJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDRAUMJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F43033D6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881460; cv=none; b=Xj80l0C1HMjnJEjIDhXil8Vx18HSbqpiWOBXlSV1taH0fWwMZLFitDPf3Jdbm9zg7eVj7bf7QsxEvXxLLl0StEldYkw/+dWjpKKVRB0V5WNL+pmnNAhT3H3S8ljEiynmrtXBG2adT8hNBlkAhECcielB6I5dW3fvhb9Y+oXF+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881460; c=relaxed/simple;
	bh=fkLkWCk/YI+XHiiAuuLOJYEbpU7XZUki9L8Z6rL/VCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pG0AEqrqUiGcbq3U+6FTujyllekbTfHcZuzrKyXh+f1mrvnvt0IJyQvXWCx790wEMA/9NAb9iuHOo5GMN2WrZcpLkuFo4m48pKBVOx38cj+Ev/WZR9Zi9ATk+Ca/KbCEIRfmHtcFjVcSDtPfiQNJDZHIfwzo2jcWaKjmK+hhi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTaxPjdJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDRAUMJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D7al483519
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mLJTsfWKJnPQjXHflzAt17SxY6xVFap91s69pWbPts=; b=FTaxPjdJ/s5sluFa
	qb5j6Cform50ydogtObSy3l/ZPaH1bmYehfrKHJjTdHfMYI4x8VJ8ewyqr7DVBnV
	9TbBos0se34DnlndInMYC9fNIqZtMgIZSRzRUui8VMGzLRk+Nicy7OV/EITqw9pT
	DMCTxK9+cZIPa3E6FjxjEfH5/hMR92MTPkZ9rc4P+3/34daxzcJVuSIbY7hopDpr
	f3t/8OBBacaOJiyOHfsjbPry1aay7ASGjc1yLROgt5VZ/+eTHx2oHMzZPFbJesZx
	bV05efRZnl8hEwzhyk5HndCUvNI9I009ItI1ESOowG7BkEIL+bY0MhSS8SGYuLM0
	8lBaXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87scye1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:57:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d840206c3so9026191cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881457; x=1778486257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mLJTsfWKJnPQjXHflzAt17SxY6xVFap91s69pWbPts=;
        b=TDRAUMJgRP1sRHrj5gjmpEEAp+YcMZgw6rj4sp5+v/N/J0ueEYqZrWmlXga9yt7UqF
         YxTnb3CLiqwN6ANbceQvvfvRyA4R+HAwJ/DpnFCQ08polDXZYAZSBWuynygYQcZtbt/c
         EFjgrrmS3NMREeCjzPRDppsrwpV3GCab/LgCTlPLFSdHFK93RNZYYr8i8rspMvqEVVYq
         tB/i0mwFpGWsbmzW2B+JH15N7+OAq0O1l5j79CQX7mEhqr9L33kT1Gcu2ZiPH3F63RRb
         ezEnaeALh4N1hRB5RDWHu06BmhyyfDfGlnfr4CqOd8m49/UYvh0cREsYtYYj05jtTyNj
         yoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881457; x=1778486257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mLJTsfWKJnPQjXHflzAt17SxY6xVFap91s69pWbPts=;
        b=V9VQncUGt0RlMfFD+cMr1jeu/FTVwJpuk7lWeg9pvnAoxgYLq1EtF4RPethCyVcuNO
         ePyxfVIpB0fUk56zsw9ad+uyBDtT2fn7dM0BFeugdiHdJJ0hMkQGkDAPr0T0HQGC5EoP
         WBsCuMxfXvg5SFx/PTUgLnW9uJTjiWexXVuGVO13h0uFF93SFNrAg5TtfnZ7yVwySmaf
         Dr9wrMnIrGJoVEAVv9xkCnd828CFZPbJ3de6Q5CXPhvyXrqxoelVW2lAmlm0EMznJOBP
         pQ44HCryQuBJYBE0n9GOf8kaJpkKSRv9reYo9MmsEkQ4jDdmmaKiS3HZfmArAGtUcKuv
         tqMA==
X-Forwarded-Encrypted: i=1; AFNElJ9+tb9Dwv43G9ze33r/gB/cLuE/+h9pIhGFVo7rHgILoRS2Ig6YhiZ1Vu8ocqx3STxpAreeUgPPm1DIm5Ga@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nZ6Q+72pfwwUShBI7sjiuuINYRc1T8hMaL9r4a6pfKa9EFQA
	4JpVwS5Mf+R3ToK4zoTX5NGAMBPMZiWwXfQr+a6C+CoV4ayTPRXL+Op3J0qvQlDbI0UK3MVSuil
	QgvPzalGxQK6QtbM+VjciCuJHESWNC2gVicPDP1g9mo+CUQ3Dn2cM1mMSm8okuG0dFmGI
X-Gm-Gg: AeBDievvBm+F2iwngkOVDjPRWYnQYl2MJJHz38/zD+6Munwel9T1wiZrhM8O8XBz+7S
	psNQtHrx4u42Ssoz7tyebysHpY3yJbksovytx9ZzSQGCf4XY5w3ODwsyUM02ed8gEqoKFXLgv3/
	e/0MfU26vM9xk2Ja284D0hi5LVAljKROcU/G8INGwByKA8sdI/Cn1Ih5c2+KdASS4JHLGhVzKDg
	TEfD7encvWMJP2s83OdONzHGetQtnS+4Va0JxZfRZgAcAN9kHLDtDbPYt2NN58Mcp3qCTbEmNc1
	S4zIMa4LwgzJbqCRpfqrd2rVrF6jZyfRoEDjbSOUex1b01Z99iWxXlqRLz3jyeIu+TzvPwrWw8u
	F/hs4SwxuNGza5BgnbWJTtfozKoVvqIZnhpcdhDGd8GrwTc1UDZonmKKHyxAiUhrAc+hFk3xW1Z
	y2E82qcRq96ZqI+A==
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr92704691cf.8.1777881456715;
        Mon, 04 May 2026 00:57:36 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr92704531cf.8.1777881456317;
        Mon, 04 May 2026 00:57:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88473402sm3013016a12.29.2026.05.04.00.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:57:35 -0700 (PDT)
Message-ID: <aa237c49-4b41-4d5a-9ce0-79d09b07408a@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:57:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: interconnect: qcom,sm6115: Drop
 incorrect children if:then: block
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260503161653.60785-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503161653.60785-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yfXWmL3NBao3SJTh7fQdmkXp39drYcvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NSBTYWx0ZWRfX7DjenZPjc6FA
 LnpcWqvehMzSlm7RCwMm4KjOx6qN+r0tCabNEafVJxsarBOjBsIqG+NolwRNJuJ3XfcY0UvJ7ky
 5VmmU+BhNwt3Sgr5yvZ4X0f3gcFvZz3FQP+C1slSKi1iAPY7aqPNgj8scl8I7CLTqFrxTe1as0D
 l8joWkkPrMa/0QOVO05J04pCD5yeERow0fpCft/90mb+uZhw4j+9I05du7LK26fPKQoWz6wcOxS
 2PLxtLROWePwNYNg1vXnk7LrsXqP9AhyvQwxM/6ykSnjCOlz4/slkgmnQaXF85k5PuUyx1XJChK
 X59ggwW+Gzo2t7lU1sAIr0ftGRJxv4N5DRjwKRRjfeCjux8Uzoz6LMHmLMdoyoMuZtVm+h5Kvj4
 V/hHq50kjrWIkQd6TjUt57zIkBOZYg==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f85171 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xbrUrHjBRW7Kf-CKWG0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yfXWmL3NBao3SJTh7fQdmkXp39drYcvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040085
X-Rspamd-Queue-Id: BDAEA4B9BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105656-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/3/26 6:16 PM, Krzysztof Kozlowski wrote:
> This binding has children, so any if:then: block restricting them,
> cannot be defined in top-level allOf:if:then:properties:, because it
> simply does not match these children.  The block, if it was useful,
> should be defined within patternProperties for the children, however
> since child nodes do not have clocks at all, there is little point in
> disallowing them in the first place.
> 
> Remove completely redundant and ineffective piece of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Good find, this wasn't obvious

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

