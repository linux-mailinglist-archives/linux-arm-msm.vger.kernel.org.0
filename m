Return-Path: <linux-arm-msm+bounces-115899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6YKJZs6RmppMQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:16:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6466F5BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:16:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="S//qx+K2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CEHXu9kX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A80CD308A059
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5E14218AC;
	Thu,  2 Jul 2026 09:45:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09D47DD4F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:45:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985516; cv=none; b=PJbwgpZox+v2X7CHCqtiAzxIGI4pT80772RXyTa/4eY6ygEvYWs4WsXBScijzeS+yUlQZ2WZrfc7nWA5FOfvr1t4Mlz07FdM+GozCZYqh/7VxxskT11zAVF1ukvnHgkJzqn6atahe+XDQ5gHedb74BFuS5QQTnMV6jMVy+L4oO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985516; c=relaxed/simple;
	bh=ZKDLIcKB1c+j0lf43DF4540JPKcxwPi/cNsd2nYX+Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9nNphmRyKUW6j/B2OSHcbKSTN/CvedoGFOY+gg39JtuVh7gXSH7rrHEwKuODA1bMzlr6584PIoTyzyd4OWNnHbXvleJRnY6wyWK7L9oqqmioNF7grUpgbcLBraLnnFN214zSNq0bOZf1udfzmURg9BDguU47RWH69TMjbiwR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S//qx+K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEHXu9kX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Q8iX3009480
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=; b=S//qx+K2JeYWbA42
	SX45kklpLjUijD6UOhpomFD97lyS3s61zwcu0J5ymJLy5TAu7T/Y7x2gyzdILJOz
	Cl114X3t5ojyGkKchKfDCuCM9v7mk2Rqzmef0SvhcdmemF2omYUUzQLNqn08sGS2
	8uQ5mJI4pqvBpAYadfEEs+s0QkZiQ9gcczyuw7dtzrj0DUv7DvPeMfDP1EqXobyD
	9RdIin/HklYkNb0JhSr4jgbCVcH7GnYzOY5+p20KziZuVATXxrECsmlvXqEFdWDU
	UbfPtoDghhiCIRJMCRnJOhqmbeguLMyunocg35jtozfnnpLj++eHxIFjjSOe5OUa
	JQUeRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rubmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:45:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e16f658abso1391118a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985513; x=1783590313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=;
        b=CEHXu9kXGEv/VsOSBaM+zfyd1+Co596lORejZaq4pkBC8DXZEXMlnf9JaXDS0VaCO6
         bCS/Fl0EGonalTsyBpHKUhMPRyKIGJI+DW3NeDbCdUvOJE39FGklmZZlvKHmKBzBAIlE
         O5CkUYNCJFy7JZkv3Tn4mWdBXhO6hw0pif3JKmOtb0M0/3Ok0c/IATvoB7KxmU1OF+NR
         6h1P7BlhUgSbA8Y2zVHeDen5buDtqKMgxZmt1mVUfC3xx4fKIOeXTnK4gtDAw0tp6zBM
         J4Q7M9ZTZdUqiIDFid3S3XNa7cer4YKSQBqy0E+0ba4OepMCPX3Wrja7ctwxObYFLKAX
         YB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985513; x=1783590313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=;
        b=XrWu9+Mlj5v8oglHxQt23WyrB0Aki4TAV2bBlXfNv04vLMVt0nEUmsL0OEeDydPTC4
         T8Y+sthIobXENjrPIjpXXukjJSLphC9Jfax3O6D1nQBI7eSUaEzaOkuPLjSRJKBff/va
         /0HVOV+HuyxoX4Xr3nP1ECHaPUAIBusKq/96pU/YK25xhGD2n/TP/hO9W3p0EWK8Q1JD
         yo11m3HlCtFrBwSNAoiLqKAPkL2xgwhs0sUY0y+YpryERu0ZTWjiUJ6U8D0z2rWjuWYM
         ULboTF1ggIS20TiUYD9/5OKXjWpQbbsyb6bJsvXJ+uKnaeDdkWT14H0wriPcuMprrd7v
         VVSA==
X-Forwarded-Encrypted: i=1; AHgh+RoNu8T1mtCtr/GuPLWkx33l44h62tS/GFM8eZ1MooKrQgOMHrXe74ZW9TTE5LevbmY+AOJrethtqbMfhBFL@vger.kernel.org
X-Gm-Message-State: AOJu0YyzrtphDHp5faU6ex12z6S7iKoGQWAKET3pBboRwePLoaH5fgs+
	dxvcyVn5E+lJQ+1q2RSn0vjwARYBpFrY5MXAGtaIJ6LJOnraqWnJixjoG1YPe4VAww9TbVTeldS
	5VAhAC02PsVLK9nGrWGxx8aMUCE/acBNmW67Zbk9c9K+hOSIhHZdwEZ4trSm+c6Hg92dD
X-Gm-Gg: AfdE7cmSZX+18iRdhNhZ0TCf/O6zIr5+Nc2NinNXSNm2R7Z+YqqBaktkOxbCwZTzyGR
	SuUXKMrmnJeozFf0wR2UmeJq1q+JOiCWEpOsCXsdPp7gcvH3fGCW65zkmfpbWT7akujySS/VPWI
	6KqyAWtWLfUHmYMdgXsthGamQ/LNhV5KEJ7ct+6aZi8VUmoljiCGCdUR5a6Id7dube0+eM1Uv5O
	rYOrW+dUHz5iBPGml5VzDuJxVu2IenwLmk2we4G4r4J14aJwfHoDF9XohNxQ6Hj0DtlWc9B9yvM
	AV+u45+khTU0fC3ZadDy0PFPEGJ+OWR0abZwMl2Bg+mjeJ6AteH7K7obSgeAih7mnO6GfTl7m8h
	D9Ty0PSQr4x9KM24B2drGGlQ+hVJsCKcFDqD7v69B
X-Received: by 2002:a17:902:ea01:b0:2ca:26bf:1e4e with SMTP id d9443c01a7336-2ca911f4ef1mr41757885ad.33.1782985513075;
        Thu, 02 Jul 2026 02:45:13 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2ca:26bf:1e4e with SMTP id d9443c01a7336-2ca911f4ef1mr41757415ad.33.1782985512360;
        Thu, 02 Jul 2026 02:45:12 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dec35sm10975865ad.15.2026.07.02.02.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:45:12 -0700 (PDT)
Message-ID: <be2d4b2c-fd7e-45e9-bcb3-b907a6a345d9@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
 <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX5XCNcA6uMPc4
 a3M62Ni+zOIGiGUN6oxhUwgm4fGL/VmXTEDEjGtQxF6YXUOPpeylz0VAXuLEfmKH/rp4LfHEQbP
 xrdQWvqE2gpl+I3Hf1ulRdph43VmNAM0Gmw4tAo8tDxkanjn1cdEyxL6SyJPg0iY7tit7t/dzVM
 M3esEhnzDPf4MeE5i13uEITjIHMvVUS/cvwhNB86YpX2wuWE4IhIEVY9IkfeREM8N8b6iYsUTMn
 rqgKK0EKnI8iCk4UpNsaqbxkgsMXEV4cO9U9sA1NwTg5t1nJ0aJnUClxvPnFty83WrNksI76wSn
 au6hI6Pm6P364Sm8UJfnfo4CJ4GLcufaXV7+fETZdRDUPZQ+ppvRMsxbXBlTvsPAJ6yo71Zlzd7
 iBkLWkeN3iBGhw2Z2u0d8SN1jCx0WemJwAd8P/tjmP+TkaMdvtiQq+3BTW2gAA8Unv38AhVAw9J
 nFnnfD7fp+fZxVnQ/Xw==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a46332a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=81jcH2gtoST0syqoSCYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: glxohbzJZhpnrSzUDPhAMJwLpZYOYLik
X-Proofpoint-ORIG-GUID: glxohbzJZhpnrSzUDPhAMJwLpZYOYLik
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX0WP3MZtk3avH
 MTXp86a4IA8UP4w3WrYyjTHbC1KBHBaJnW/34anv454Ucnn4o7PUPomN6Xw0daGGTS8kVzdHrKR
 fCFDeMGuSrxGLTrmla2XyECc5wWDWLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115899-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF6466F5BDE



On 6/12/2026 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 04:45:08PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
>> regulators and gpio-based card detection for the platform.
>>
>> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
>> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index c98dfb3941fa..f68d27429440 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
>>  
>>  	status = "okay";
>>  };
>> +
>> +&sdhc_2 {
> 
> The board file should be sorted by the name. So these two entries are
> wrongly placed. sdhc_2 < usb_mp_qmpphy1.
> 
>> +	vmmc-supply = <&vreg_l9b_e0_2p9>;
>> +	vqmmc-supply = <&vreg_l2b_e0_2p9>;
>> +
> 

ACK.

Regards,
Monish

