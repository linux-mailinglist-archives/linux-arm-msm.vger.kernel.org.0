Return-Path: <linux-arm-msm+bounces-117994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 06YhJT6gT2oklQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:21:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E496E73181A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f3dhVFBq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QZcm4L2A;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117994-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117994-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEFDF308A775
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E830E265CC2;
	Thu,  9 Jul 2026 13:14:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8BA2472AF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602854; cv=none; b=OqX6I+tBM8F/YRRbuMqEplSOq9QeY4G5Aq2LN3EcGIzQ8VqtbO6PsKhyoHhBC66drY2fR0+aXhCU1zFd/hs0P5cOwISIxTeu5S12aeL+fRLomszIDh85zkqR7qMRclzpBPkJqosahLJghTwO/DHKytLfofGaGw9iirfLTobuhog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602854; c=relaxed/simple;
	bh=NgMTWP8X6uZPAe8E+uX7ej8MHiSFVc+1gGqdB6EWjBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBuaOvKbxTrGbigvZvRAkI6xdDE/GlEqitD40Vta5zvUFuziht3J+ECVCe+GVEqP9oxa2y8ckW5v3AgyNlL3z0emMTJ+nD+/AhJQ35DYcdBq5Z7fdbYeHhLWj/kh/qDLlDJvC3xoqTw+k3eLcHRkWefNOfKVV5TzengHV+bhNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3dhVFBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZcm4L2A; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNmei1626563
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=; b=f3dhVFBqJAFo4XRE
	qLnHVmtw+KFWh15TcfQNRKmuHgDSuhLrqetDDXrPicT5pWBiJFhOqqpPyxxMME75
	CGfoVCNjAexejIpms9FRXbXo4EMhzpaMaKEIIT9ll02VvZYLGlq1iWP6WqehdbSm
	Blh3A/5R96kmbKu5PNOMKOJVsKpZWkIJz+gjhn7Hgy73vEcY76IySVcAKl2tFgEG
	fb2vUNvC9j4iOK0HSMERe6I4doloxMkRtDAn4PD3/JST2rDEu2jTLdcVGQCZ0sZW
	BWhoCE1Q0dgTlUm9EqrXV5G5UJSBtwxUzFLynfdMOFJWdYDYXI12bn91EF8WABvx
	jU4YAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34rep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:14:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so63746385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602852; x=1784207652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=;
        b=QZcm4L2A3Y5ah9/s4330jSXd9Ua3yMsmG518DAYCrp0xNZeQdi2FalB4mXDCDUXN36
         DKOr2yMKrB66pSQvoVpl11WkqUi/61NCRONo/11+81tibeYdyDXsk8wR5RHSIxZkpnQT
         S/kPLcsenKgRmij8Sun+lnUUfrr5Yn7hnqXGV2Omit2Kk7ONJokHJmYBggZ5j4WJ7o4z
         e4Wi9xcsarniyW9uBzJHELLTD9Ix5v+G9JdCdrj9BpvLwO/Ptnow29ZAzhFglKDZAuS2
         6iDv8rehQg1JMtyoyCxGMO1svT/eUcPzoMOSsbta8m+JfohCoh3NtFBLuKKtsaTK2Bbj
         qUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602852; x=1784207652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=;
        b=qHmxVpmFPD7rv1KwvN7R3g0V0Zlk0tZiZbh34enldbaytpHHQisrGYjj+p59HAxpKp
         iWRleBNAGLlTD/HpyKlXdDxGwe46CyXHxTrAUk6WwhiJeTAXAHaGa0CBh8PP12pi+v85
         VJvLVc491iIzwAIsG8zQmlaCZT6jYwkVA3RIdzasSShPgU6HUvbTJ5yFIKbmPXvyRiRg
         OZNpAfggan2sBIBng/q1CrVPgbt4lHecG4fCA4a4JBtTlhdOhz1zvuMU+AWVozOSusPS
         8F+RwLpTJDG1SMDMYh2IfdsQf9e9LVqtl8+rbtsczdem7kGE7sgNVTtv08PJpeIKARC5
         jRpA==
X-Gm-Message-State: AOJu0YygmymFZABFAkSzSHZKbmNMDKkasOZTifd47BTkZHIxVEDJNXQZ
	lWDCNEdr3rmuFADb4dnQtrZQEImUw4059v3jpHZYLPRLBXmo5IZxaMOipqW9dg61ArtpdRQB+vi
	aP16o+agudK17/SoXfNE0eHcjup2L5TCYyYk++UA8YhajpUowiFqHwPvYWNyzHOUNyg/u
X-Gm-Gg: AfdE7clB/Tw+e0uGVTzKvXns3l31SO45wnyFZE8Uh3BzTRhVQ6/Po9KrJoXmZs9c7S8
	LOEDZAor/PYNN4XFCXtejfybxeh+5A9lzqrCZVBbyM+ONLrL2VN9g8Yhpg65fHvGPExFJ7mAY1C
	niZtJFl0+5oDfa/MKodQ4DZEvdh3K2Ny5+iwRGzcZUSiauVciG5Srw7AEKFolYYINm2bHfuxMhk
	lLcP/64zRhYF1nSjjnNAMEPGYO+uHx/bdgYm8dRlZMHQ39MFej3x2XxC9TR5H6zlMtLYBvH464N
	IuoAwtzU6sEP3VEww9ZPdJ3w4awFR7M9ypCi0a5Dv1maFIgGdR1sAYfq0a3lY2BDVbSFpUJpXcg
	vCz67LdKzxBGaCtpZBG9etcPDVgy4h6LcN7g=
X-Received: by 2002:a05:620a:2987:b0:918:588c:d095 with SMTP id af79cd13be357-92ed7a583ebmr337942085a.8.1783602851925;
        Thu, 09 Jul 2026 06:14:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:918:588c:d095 with SMTP id af79cd13be357-92ed7a583ebmr337936085a.8.1783602851259;
        Thu, 09 Jul 2026 06:14:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm255954666b.44.2026.07.09.06.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:14:10 -0700 (PDT)
Message-ID: <e32950e5-b11d-4924-ac3c-692707a880a8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
 <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7kRyiiBWoedf7AnDmigFPv26S2dpmadc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX5rRvtHTS+D0D
 UPkZlCl/6+Z99rGVS05uKDcr7AzmtJazzk4GKCzxTuz8JbW5deHdJy7BOeWzRPDyjFyakpe0jxf
 /eeI+WPNi6Y/9f6K2Yv1GOuO2W6mnkBxKFXdUyDRFQ4uxt/ZiflCxVUPokqRrhJ0JnrQsGYEcfL
 iYB7zcTCcDBxRTW+2Th07yuG5jQ6iCFBW3qa+bhpSk+psk0TEtZP0dvf2+mmJ6URQq0FhFyw1bt
 AgqNFj5huIrdFlWxnpg8Y7rTNdlErbRi8MGqbec3PQCRr+75PrZ5cTNU5XK5TF7hnS38fz068Mj
 ZXtfKWbDSAuI3CytiMcJX46vWWL/KE74Ew5tHUE1Fh/Z9H4PRIPnqoH3rZgnQSpaWUOlTvY41oV
 OvLm1Mjse4JGYIgSp4xqir4Olh1sMukUkU42SMJCXmUEzeeb15MIJtr0a2Gb7ktY0VUVnil6MuA
 uh9EmFydL0CW0FyRfwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX6bei6jH3Wpc4
 0sjK57YLJ4LSv7mFiKUHs1QE8Oin/7Bm2DvEqVAyahEdzn60A2OlxcDBePVsrYIrgll7m89tsoQ
 1wdaOs47Elh2wDX43l1D+USZMfk437Q=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f9ea4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7kRyiiBWoedf7AnDmigFPv26S2dpmadc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117994-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E496E73181A

On 7/9/26 11:44 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..051cbde20983 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -4,6 +4,36 @@
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
> +/ {
> +	thermal-zones {
> +		pm8005-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

Also here

Konrad

