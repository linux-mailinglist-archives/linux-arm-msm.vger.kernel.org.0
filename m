Return-Path: <linux-arm-msm+bounces-102318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB/SAsss1mkUBggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:24:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E143BA7D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFEC7305BF34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CB63B4E9E;
	Wed,  8 Apr 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSZNno1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+W/gT4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382553B19CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643686; cv=none; b=Q6PHjZSl6Mnp1mbWatgycPvmMlZLfW0iHAlrVSpZ/jdswZmB1N2kr6ujFKPgrU/Xv/TcsQzNXqBGBJ0GQ6TPEbrfBRW+x+I8IsddQwJ7MrEbrklENYpiLdBeF7wrPRcIZT3Be+56amlV6MZrX2UUR1sJh5xr/dVxVivpfPzv/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643686; c=relaxed/simple;
	bh=k+6pByxzbiEmi4bdhUkMDOcHI/ODXHVIqz/rq3Hwa9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Xi6ljCgbVabaslFUS0TGJ5scOTNWtZeLBC4f3W7kn4PnecyS1ygey3HhNUNTFkg6o8xADgeT2a/JpbknRXSSHkBR5kJXlmpG9f08OftOGOuR8UNOXhgRmwG7nyyinrFky31g48AU+/rqS/z/9osP9DX8oAxkcqL//PKkRkHsVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSZNno1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+W/gT4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63855I4S3362668
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=; b=RSZNno1FmNAmsONx
	V+IsZd6/aTrywJay+htyujMDQrJcx6sufd7uf/fQxX4KkmLmAB6OqnXEWBrrk1bN
	T4L3heQCYDt+v3EhOr6IUftxJEL8kPQxLRdzDQs+808eFo7HlhM5rhSFSKVE/cbZ
	p6pxU+ri7aeuIWtbEqT+OIhWQfx92N0fewGHHeEdeeEN1dzXpQKDzoTx4+jGc3lb
	zTZM+/c5YqcH4Xxs0j989X/+nzC9KcWEfFijTf4Asfnx5AahVGs4+4ll47MtbWhV
	bWPj5jYZuX00PGaBaND2ExISBLBWYWUPWyu60DQXho4lpJsm6mQy/Jhzhjb2Tjbh
	z5nHvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkjsy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:21:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so26008136d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775643677; x=1776248477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=;
        b=H+W/gT4jgB6BZTluXNr33HXAPAVQhkVLEbweKsA7uTIEjOZ164Tw5AyFaapDWUYk2h
         s6GCNuNM5t1b42LSHyBO54aaKt0nd2oRTofCXryfhSHFegznEDZCYdq5DPi+wk9C6Au8
         c1+SIrA2ntRWV89KxvO/1XzPg23hQpTl2ImISpquiGJgmHFAQ3zPlszpUwP2I7lpukpH
         3riQSrku5mprwS7XtEKVoxMpmC0mnGcYAH0gmMhrktfe+0+aE/FsCHvhVN6pnnDFB3TR
         IxJnsndAzPfuPlpdVquBC73i0540aFbSsnFte02Rx6itTxexwn92u2vTTa8ZIsT3JnWx
         ZdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775643677; x=1776248477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=;
        b=NVCzxStgW/euqx1KPJCjxaO/UK59AyzphyCR6qBrSrtd/cR73tv/rhNmJmVezmvZsM
         TWgoWXOjtL8FyBbESW60/3XOQWM0jCi+L8p9ijtqVbU4UsJhPrvLZkQR6hPVY9XhZSUV
         KH3Gh6fLEDHYiofnJLD+2SFuLXTrRcThjSabfPi43YCoTok1gHBikQBONELD2fWSqJqj
         9A4EtGOyAzQr++BTLycew3wgbZ9LB4iAArbBBqxqL8LrBywt+3UOvfhWcg5trTbyPl8x
         vwvYyE5rab1bkXWVTO3N6X919bWgRhaE2SRSfWIwAw+b0mqEXsWzTIVrvy7YtHvHu4Az
         EXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuiCRZk3WD8vNerarzcqdZYLo8o0zHAy4+lif/GgyBRd/zqtIGQaa6o8gFpoLXtKVKoat+IDfGV9lnwMUb@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfbTVaRNmDdW8BMZYq85U+KdAG+Mwd4/fhplriZgOtnX0tj3l
	yMbiXJQnPa6fKc1BtU2oEROvHcfmWfMtjavYNCgjHH1UdofjLMj/SGD+cj0w6hk7+elhW0x6AOz
	gONtNB0UFsr3VKbde5KIIGBfIPPiZRayD6IGzWYJnECwyNYiow2B8mvQrSmyDBmyk4Ng5+wcFcl
	1F
X-Gm-Gg: AeBDieuEFFwuPuwK2T3JPo4dVtLTzOh6CuphgQIumnGSIIHTYrtiHff64/rbpXzqIxj
	lZs2HWG/5OUr3/aFfcGs0+Y1y/h30BRw6womt3vMfGJxCrSI0gQLGO7asjaMayFhzluGjNrll8G
	LpewLteLxZLtZA2FOKSt4fYch7xmMY9dQIHv79Qvl0GECyxMgWrXLdt43FAQR3OWlD5+G2HNnKw
	LO2QfEOyqVbyyh0yF/3JvRMupwp5QF9kuWjwcCa+VNV1DWvxhdYDJRy06N8jhwi/jStbYKhK9+H
	HY5GS3Fmjx9NqSRUQxKUmrd3tlPIeSgDjQkEvK5xDPlYt7v18IJKf7giaIvR+/7MljWYWn7vzki
	Z5sIgSOGiC91xKONMCBJLq1xSUYPkZ6lQAzesqvV16LS5ROvFrJKnD0xgI0C/PiGbEkS+dNrTnk
	Mx+FE=
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr33843781cf.7.1775643677386;
        Wed, 08 Apr 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr33843481cf.7.1775643676986;
        Wed, 08 Apr 2026 03:21:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm629483366b.43.2026.04.08.03.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:21:16 -0700 (PDT)
Message-ID: <87350a3a-b227-4375-9f52-86433f5eaf7a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d62c1e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hdY4OLW_gtqzIo9ogFYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: zVBA1w4Mdjrk-P8nmGQlaAwetixJd7S1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5NSBTYWx0ZWRfX6mN85T2YZrEu
 qBpHsT3mcd7FyACXNDg4n/inTh43j9mMk7TJAKkqAuq1wOB92VpYmYf2qN/0QcaMze50bpMCisw
 8R/wXO+8ScRYXHfq9hmUwnoreE1tFJbA+1A9RWd2EgSCp5u/UFfqE6Xu0kT0I4CS+t/LCCryCNm
 2AYtcgClcZdXCSzktrJbNylY52pWzpu7cDsLMwfnkXNW+wP5tVU3GWQ8BwaT2JIz9ZW7cI2xhvu
 9GiJ9RhRo0F4AhaHUYiHtyfTxPWO++0R5cxN0zw1q0J0WzqkVXt3Fd9nAJSU5vp2JVBanEY3esB
 4+KdOSXbyYbZ417a+jsXCoGx/2Ypq6e4rGVWuz/MmJvmCtDAMDa1YD/Q0OHdC6BNJow5Sp7+xfz
 ug9eKZWQJ3OSR0en5iNQN5i8beyVD1aG9wmqqd50KQtZn0nryseqKgShJgRTkINucKtn2vheEV1
 LaKbnRzWZHMIEY4u7oA==
X-Proofpoint-GUID: zVBA1w4Mdjrk-P8nmGQlaAwetixJd7S1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102318-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76E143BA7D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 10:18 PM, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

