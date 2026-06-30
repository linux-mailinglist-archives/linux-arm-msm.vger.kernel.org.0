Return-Path: <linux-arm-msm+bounces-115455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /yNrJKrLQ2oZiQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:59:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F112D6E523F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pV2WMVe1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VL9a5PYK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115455-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115455-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D67E30D18A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117CA36655D;
	Tue, 30 Jun 2026 13:56:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24A1283FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827813; cv=none; b=eI3MJWtHTbSTrvZ7mxttYX0fiyzSB2hwM6owV6/GT3XrjkYHzwzMrkPsXHsJzRmp/dFqbrsrA92Oij6CWukILi49XcrE0DMnic5RyY9XNxGlspW8ox8iHWStJeF3qYhs94192X84lGA3TAKRk/d7MvdkuNFzehSGJkgtOMuz+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827813; c=relaxed/simple;
	bh=5Y18P1OXhI2wNiiZ3URLaQNonWt7gRHonLAgtQlX/aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmlA9mbqb5gUE+dTO59+mljYtiDWaH5pISXNX0KmPzT2Q45uYOEqTXcQEIRs3D+UYwP44Kw/ZslBatk1eI1X2aDPG+mHGa8k6EhwCnOQtXV3seQtQgouZjJOaz1R/YekscJnrDITDUpo4KDBS1bCP4Cq0pfUQspDqELjJNNkdkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV2WMVe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VL9a5PYK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnPJ1602558
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=; b=pV2WMVe1L3loPsAs
	KfJkGEDW2Zdz1pCIvj154ylHL+vt/ybz7ynry38mHjJVtcjLrr5uVIdDrsB5YICR
	sekLeWXV/TP+9fQS03XfdjemuZimlCBZBUyXNh8+IR19MQmM/MVJ0rShZ8uoupLP
	Yx7BbPsrOFBjBgVY6cfEhZGv45EboeGyh7pmLzXQrvc4Yf4bhlJ6R0zy5OIZJTzu
	o96dZa+fFzqFboIMLRgm3/5PNW4MZINW2nuTEH9X2/OK2Kmae1jOPajonOfmiD+O
	2sYsmzTIWjdstcw769qaCIduQbK+4oOVYXpyMQRaIe5CxhShYGkDgl1+0jnx9JKw
	DkBuuw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avps7um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:56:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96920484543so147532241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827810; x=1783432610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=;
        b=VL9a5PYKL8X44wGBLZGRJgQTtcPZz/lEESqgBjojXgyMHt5UX3CuIP7rBN1Ks6AVsN
         tW0PFmsRQdNk4cE+y04hOcwoAKmDQvRFroOZbk1sCMlOMGQnbjaQazH3LJ+ACzoJI3gE
         q+JYXB6tsOqfibcdAv9vn+iPFfil4aNS+ZKEXFzpkX70e4pXSiVsZG75YoAhkU9n/4Fu
         +retVJUOLgQbpRLYPEo+rw2p4D7uSduFzs5gk/IFmcnMnzhBouCew2pEVzcZrZ/Gfidq
         qUcVsTdNJMxtgAhHd4bnvJXGbldNHLxTHRjYxMGWb5lZqkGGAR09Q7ygT8JW6YZbCx0k
         sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827810; x=1783432610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=;
        b=jtQhShggx4OFNHDEVO6mG7e/I0IDtegmS5ZIGf/xITPXDRlliA+d5MIsJDOozCdDxd
         hswjsGtTUFBeIeJggn8YL7fDRffvVvDAHPDDWRH3XG3Vs5JWZnLmOvMOofw18qO29Bzv
         8CafK7TLvR1ArOd7CZgkai1XT46OSewd7IyI6xJZpf/k7mhjIMOGcOTDYX8GrUFlp/3f
         9OAewMewi3KYzA1vnGiqEpCA4npcVz9G6q8+5i5p0zSRMKkLR/eOnmLHQgNVAAkhknYv
         DkilhQboCwnyX3XLvFS0EnsRB/lWg0mWxgglvTPaiB8nvj+4vmdx+EyfZzVF3/WBDH/M
         FQhw==
X-Gm-Message-State: AOJu0YyirytnXvUGCqN2SPDZKTqDJKvAJfSuXSY+qB7d3SA3Kvwahvkf
	197MXrXoumKEq/pAVb9zJpEHmp2S5lHyJJR+M2DPfrOFgevrmygvV107l4W5YWjlwMKs7TSVbbC
	U7gSrYa4IdDRahYJZPJZtvMUTG5ByBu+j4pGFZmkjpjQzR2zsT7ktBdNKidWYwVBis+yQ
X-Gm-Gg: AfdE7cnxG8+KByFZUatCELvIO8SQ+u8boyppW8TcPXKNBVOvNYGBgoRYl7sXDhIuA5Q
	IuF8UrMAbeVFLZVF9R2317pbwqcMPwM4jVfTqIyUGZRM/IHegrztg2wHm/LgfL0eSv39fNTaWyz
	nFwrhl9om3xLFUnsZsrjNk3AZfnMO0nvCZ2tSBl4uOEvi110mfGyRXU1VBELqAacavVOUfOaCOg
	hRNGuHErR+736Q3ZitljhB5SWoSfnpGUB9xg9dD4NRGsbveqe2583vUhw21CUHJOAbKQ029K76F
	I/t9PNuK5qHC+CAsELpO1hklF2CHzVRnqKrcVndS3TekbflerjjfpuLdi5X5xoRy2Lg8Q6YgHeX
	/lcUB7p8Y3af7WqL3fRuGU4fuRtJBP4RKltk=
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr602374137.7.1782827810172;
        Tue, 30 Jun 2026 06:56:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr602366137.7.1782827809802;
        Tue, 30 Jun 2026 06:56:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cacasm1328329a12.18.2026.06.30.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:56:48 -0700 (PDT)
Message-ID: <e29d7898-a439-4e5f-bdff-0e7daaf23c4a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:56:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
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
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
 <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dwhQGnkZ-O4-deruosQ9GRFsDckPg_xh
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43cb22 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MSeU50jLikp4iQrAx_QA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfXz2hSBhoCMnzv
 pLwLuCYsnKyvaSQzYTbGgzbegWB3VRZ2KiqmdCMN6X96yE12ZiM6gwYa+hQYOKLPuyLf6Kg4aCn
 FjSwIxW9sgFhCMR5BiO2byWRK4RvegOQYzW10CMoCnKZkQcVrcyW97RQOyX8WgwmFerrdG7VF75
 3uHWyZ3qa/TCZkeQSBKwP4C7JWqK1k5qit7XpT+05yJcP7dIsOqMrJLwIIwi+qpnqoI+iz6tSxA
 VBCwiSo7Tiz0APmiZhFAB0PyaO+Nq/UyQo595GVBKGt2rkcV1Nn4o6KkDntYh5sIuEgmeeeD4EO
 DYuB03cAA5ycE7cSqlD5/i9DImXdK17QXCDEUe1xXc7ILNW5m2D6VvEwfbCp8JLJ7YSIkOxhI7s
 Q86SpvbXqqvlf4txqN6JYkGWt2eKiP8T85NZrv4xiXlrIFBZkXWhnux0mRPHcchcL34N/ZwXyX6
 Fe5Oc5Ls0tJ1yW9CdbQ==
X-Proofpoint-ORIG-GUID: dwhQGnkZ-O4-deruosQ9GRFsDckPg_xh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX+bc4BdLb1WWB
 zKHiCMmE94cYEbAjrtDkQ5IlLNASONhOil2/0tJStWxmJSX4dCdAzuh4WOqwuB1zpx9cPy2AL+w
 R8w1lmoaeACnoXbAXqJV3ZKT4jDVNU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-115455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: F112D6E523F

On 5/27/26 5:53 PM, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

