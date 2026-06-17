Return-Path: <linux-arm-msm+bounces-113604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1VKLAx59Mmrq0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:55:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE7698B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DdOUdzRn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BxKWWBry;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75633301FD46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409D93B9604;
	Wed, 17 Jun 2026 10:55:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612B38E10C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:55:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693711; cv=none; b=cQxo0ClpF8voKZ+wGSU2GncVEYWylhi65i8j+ANM/f2TUNmmF02lQj/i/R50cey7NO9JseEqwB0xBjMZICcqXPRbysjr83gVpNX4Mt+omsJ6owMI0hSYindqjZbHkJM81xpsahlyxKoNj+k8yJHW21M2fcNSsQy69h4qPjWEGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693711; c=relaxed/simple;
	bh=YUa77FnAohk+h2BuhAniXUueyl5U6lyKWto0NVPAQr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW+n403Z99oxleJk3bj8UT8P4sox6zstqlZZKoLGR7FXJ4NM79cNU9Kdu++r2IaQOa14zpyop1GP2MyDq6KcefBymRjy3yS/vPO/TFtvGwYPyvC2IzDneS+V8u0hrm4sZOS4FtNVAMa5mL9wmKmjE8vfuMitXLk1hO34Il2Rkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdOUdzRn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxKWWBry; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ufac1654405
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=; b=DdOUdzRnL3Xx7aZR
	XOHzUQ3K+aql8bMOvR+VrW0oAOXDfO7kSsB+vgJVeRH09AQNSCJFebEoJ4mtJtxq
	7V1yCjbPwdBBIwho9QsWGsRUIi9+MnBUsXTEvqRsNMY0QAvf/kz0IyUTQSo0xNWC
	5vkIoLke17BYnjQm/Qnt4E9FY1NXE/pUNJFK+mnwUq8iUuxWecZwyJwjPGb/TRG9
	x93lWwrdZn7PfztDLkueR3DQaiZtoUeqNaLOvZUDdUnsBh7b+XUTdjP8cd4jNCLg
	YZt1qeqVEXqCJ6bu2sJENQr5akv2eXPb22JiZZ4nLSxm5YtI/RWJhfgq3D+7pG5z
	GNQRBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2pjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:55:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915737aaf0bso40885085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693707; x=1782298507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=;
        b=BxKWWBryxpeqViHUDXnxwzelCPcOORDdqWTAe51130BAppyvYwFwtshB4253EAXjfr
         bWHuprL96LAPDL8uZeaa+vAOVzKtdPf/iiXGxraQNxpIkrn4g5AA7MtIzw2beV9u/Nq3
         dB2+QVHapwJC/GSxN0ZFOQkWX4OM+LTVW56K5vPNQ8mmcP+BQxZpmrzgMtg6GbYQVIpY
         COTGYz8reNkjhyjIYQqlScs6CBBB7Mo5aPO4l7bfY3QNAHDQoa0RnCR8Th9M8K5/jgrQ
         /nCv5lrOXfMQi3gBLDdnlSinXaVCaX/0HO8EsPcoFJVH3gKv3hV8kjQIbvfeoZkpPRWp
         KQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693707; x=1782298507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=;
        b=FIc36OqH5Pq6N545gZKHgnsGFGVorekETM4AGx3lzQ93KagzFdwEDys0vPoj9J0u8M
         Fx4fHI/BUC0iMapxHIRLZBW4OPvd9zw8p3OJ6+vnpmKhQH5xj6Xs8NP4GZ1VZ3taZpGu
         40Of0SBW4MvQ/qgH5LirXqvXyWXoB7OEoKBDT7gFDdXdMitgN/2A2P3XzS/CTXPWWSP1
         GdlEaMNMYnJKXMAdJq8JwC/x2IVuhrfOzPHAA/WqjEfA+4DIEVLs8kWV34OS710SDVm8
         Z4OHpl4FWKYTluzBf6wqINVxQtB74+t/5KB2LcL4TdxrvAzpCUR12P7FnrybsVZEsC1+
         MZAQ==
X-Gm-Message-State: AOJu0YxEOwHkjVgn965OA0817rUliW3jIPZ/TYAyzm1y1iwxzg660ZKQ
	9pr18g/Z59vCp2gLztf80E6e7vAj2BEawvdfZ5lYMG5thHNMWEKStEZi/6Sn2tO2lksfLlVxO3n
	CTj/gG44+H0SmwxxT5HUI8rRbBUHFqk2PGR3lTNMSZ70DjqNf9RFPWHlkMf+9rQz+GAt3
X-Gm-Gg: Acq92OHA/KRJvQ0NWn02SExR7nwaDS/1dsQM9YZ8nUXLQ7Z13fNULEJjwBCgsVqv7tg
	3pcfeoIs22hAaCSrFwhtUS97my04rx7ZRs32IXmGyRJeB+qHmMWSogNgHdnBMVyREbq4qLbhx4P
	IeK+yMooPmHzVdIFtebalAQzWspHvPd+6JxqGe4QbyjMWFwsj3rZmRVKzXOcPbR/jPrfchFpqx3
	f7eDnQwn4xXzvep5XJkjs3/1fqMLDO8/tnsLgxrAMP5VckDGHzP+/+v07NcA/KeDIl4SZOCw3EO
	LmeNEb7W73bqklHqWdpvjRA1JqAXvaa14aYqPaeNg9PYBAc46M0jrISGD4nsv6ufjBdwsM/uYJV
	qZL8pMhfe6K9Od/wL0DR8qF2X37Rbrw5UhmM=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250786685a.5.1781693707594;
        Wed, 17 Jun 2026 03:55:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250783685a.5.1781693707107;
        Wed, 17 Jun 2026 03:55:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938ab02sm6094751a12.17.2026.06.17.03.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:55:06 -0700 (PDT)
Message-ID: <ec16c184-2e0d-4f9f-af9c-d551fc114754@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
 <20260503-ayn-qcs8550-v8-6-d733f5e57446@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-6-d733f5e57446@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e7uBmIiHtJj1yCpDbl_xwUFgBQgsQgBk
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a327d0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SMKPoOfwHAVbGl5z8tcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: e7uBmIiHtJj1yCpDbl_xwUFgBQgsQgBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfXy4y+DnUAnCcO
 9cRJffhPvvq5zQlle3ZwDCasQw7Tv8WDRRRdK+S5yngCdpiscXzC69+ABxkLShvNofa8bJjW1UY
 08RjOqRkxBYuIdrU7RXc+7WzWbBWl/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX0q2RQKWfqUm2
 KCNeLGNUWNSsr9AXGVKYgiXF0mHY+En6Q6pxCJ4ODvqhIvu430wvc7s9l8PriCnJf6PYvPJZj2m
 QOryTEUMT2W4CRKSbFet22Wun+U/bFtw1GFnNpEKitR4LCNFpzlY6MM6nzN7sCtpvY/ai/aBwu+
 vd8m6bppE7GZaRBAa5cKb7zdYXX/MRK5VrPfeFAOcBA29uw+Vzs//ajzy5ZV+4IZ2hmnR/sc8zE
 uT+DCZ5bqtLzYrDN0sZFZExn5mr8jT8tnkm6zsVPGg/7dbhdsyaCdarZ4vyfRDPPpcNah8bCWZX
 94sx392jMbTkyFjNbNfKO7NyMj2b7dUSMY6Mic+JAdznUwtmt85TBH2hSaKiGfb8B0D2ZomXxre
 iKaDCo2XfbiqRfIdtevc0qx25aIEEUsheJ8uuVdyj0PdAd2J186anmF9cWH1AZdV9bs+ovEyZuF
 YXQle9EF4pCXxw01Rjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170103
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
	TAGGED_FROM(0.00)[bounces-113604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4FE7698B4D

On 5/3/26 11:48 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";

'status' is generally meant to be the last property
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;

especially since these ones are already defined in the included SoC DTSI
(and would only be necessary when building a DTBO, which I know is your
ultimate usecase, but which you aren't doing in this patch)

Perhaps Bjorn can fix that up while applying..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

