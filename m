Return-Path: <linux-arm-msm+bounces-92894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOliKBTSkmk1ygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:15:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA0141761
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74DB4300CE50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CEA30148C;
	Mon, 16 Feb 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWeOBRmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icmR8pMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3B2C234B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229689; cv=none; b=fPhf0xwCNp6RWuCAlBtdrfh18RFfGKGnQckzl6iVOPm+MIdxoVoz/sqYRafreubbxeQMtuLx2zhxPwrzw2hsQl+vBljPJYgK9x3+aXmkfdXyjID1fK3irb3u+89Lghd0+UCGPv/n5xFRaCavdrEnszgUgRQW3f6g8eUN/jzaXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229689; c=relaxed/simple;
	bh=XdU3UmP5cOJ1RGVsl6tVLBLdGJGcN6ti5ijmHlfbWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UysxWRFInFhPZWnLZ6SEQbr5GkUYlgTT4leASnmM8MMs1DHiM3TuKK0B1GHSHQXKKpuCEAG2GJ7HMyJMo3UMkvKRPexb5xvXnZ8+0Px/NCaONHtNpCZAo+LIG8E5zotaYoSNLYMXr1xN50Eggs5WfGqxv44oSKMVBglW7MS/O2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWeOBRmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icmR8pMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0Hjej3249869
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atVq0LiFZTshTPBiboL/xtCxFhCk7gIZx1NVOVi0LDc=; b=WWeOBRmiD4qOcGL3
	G+vUD7PD6q3xPysISnxdxroNYUkffUVS3h6SCoPMjX/gGkO83JKuWkn2A91dwNMa
	iIcBA/6GxV3iM8w5oRCHflLURbXDqR8f0BEQFmc53KOR+noAJznrepSGBml48lDg
	hex7YEJmxcSfaljFnfUyt+4m+7ukWC+8S0mcIq2JCc6eUwTPDjHjWz58oSSCCpCM
	dd60b85IlMOzVa0aZeUxdaAAqtxkLnAPKwaRFAhtIh3C/HAPtaRIxjOnAKB6Nfsq
	1xD+PaJb43PU0svgMlzJHYtLiOwfOoPmoTGEu7H0op3jNmgpZSqyX54Xj29ldf8E
	AS2dfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4skute-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e204f951cso903128a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771229686; x=1771834486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atVq0LiFZTshTPBiboL/xtCxFhCk7gIZx1NVOVi0LDc=;
        b=icmR8pMJi8KpAVX2oz6LBEboWNdzFRIaXqpeM3xh9OgDCoClJHBxhb6ZbjOeUXntec
         TJ4kRiZ1mp14tcRw9nFh3m0CqOGOrr1TvXXepsPfsOTLqdejqSGxWFWv5pr+xCSOStQC
         77AEE3dKcgGBhi53qsGYW2682oxGxEY3gPAdLC97McrDlw9fp+ZbVnAjXF4EL3xNuzDf
         HZSWtQ6oSu2otvR146NOSLv9dljeGssFotyW4/ROP3Ik/JdBXqnZZ3pixhVSFX6PIEaT
         z3fQJ7ZhtHtQB0jMCt28DARW4nbDBWImW1EzVVc4+DBtw5Q1b3AvMZQuOMzRsG2JvJbd
         R9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229686; x=1771834486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atVq0LiFZTshTPBiboL/xtCxFhCk7gIZx1NVOVi0LDc=;
        b=M1dUzHZrzjzY6o9PQnsJChE0R5BZ6aGXyZ8xDEr7rAr1OQdt6dp9iq1tsI2oQiPvfL
         rWOzd4Ho2HAn+54S3CWRrh6MClTMhk/h2TZP9bfOSgWd+q/5h83ef7BUUy6aC7jOxWQ7
         Appn+yOFQM695bFTT8pVxL/Gqlpl3oKrpSB7KUeKccK17tNcVJngkbjHgRPZCPlHngBX
         /5nAjcWTFLa3q+dmX7X4nXnsLS4FYYYU5ZhItDZDX45qa2bxMSlA4axBujLiDOVeIO93
         9uXOdwTYKq4ML20R0Nn2sTm/KpGzPidVGK9+VgVNbQZkmRSl5nCamM5xKZeqq/GQ+9Dn
         GG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXO+nDE25QHMflwlmyjBOg8iQlSIk7Z2SfEj4gWulO7v1nLXPx6VjPkLeQdHnPnRVDzGEWVrnfTmmrHZ3wy@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUwQANOaSKK8mBpcfyLUXtn90+TZk1/YMFtMUSMjB44Ha4rhc
	hAlJ4klpwyU0vqnqk9oyfVGdB28bNmtoX9Oq7bzexR6huzxAczjFxAR6ZsEf5dPIiAtYDNwX8R+
	UK4zGf8Se46o8Tlr267nFrBlWvNt1nLvjajhtWx9dv7JfCroci5Nd0fSE5Q6i2U8whC3U
X-Gm-Gg: AZuq6aLNEhJ7H135//vUaLu+GER6sH/BdS5kb34/SozBmtuCjRtwIBuh7CsBXSg5u4N
	Kjacwa/SkdcXa7l8oM1QtaLJhr8KBisiHyP6Bz52kWIxdiWTqHye48SWrSKX4z2zhOmXtVy9r+p
	XYWfZOV5bzHtxp55NqCIwsNMBAktHoscKe4en0Zr+qOjr1Lte/v9SE+xdM/2uCEk3fbTi62jPWQ
	S89ZuYXSzTD9Jv2Kq+KHUEw/5oDLV3r6BP44QpXlDwgY1SQDNAgKEiSymSI06vmPNk2aLqcHUt3
	5OVShYPVks2y/uq0y4IkIT+O4PMcEf7CvXB5ORFNht17+SSg75+MJHZr15qgmH0Pdxd0jQa2COk
	/ld043zegQji4WNoHhvg7oAa2ySKZjNOwNkB7/0KTtaZ6JtxZpg==
X-Received: by 2002:a17:90b:28c4:b0:340:bca2:cf82 with SMTP id 98e67ed59e1d1-356a7a44588mr7342779a91.4.1771229685796;
        Mon, 16 Feb 2026 00:14:45 -0800 (PST)
X-Received: by 2002:a17:90b:28c4:b0:340:bca2:cf82 with SMTP id 98e67ed59e1d1-356a7a44588mr7342762a91.4.1771229685380;
        Mon, 16 Feb 2026 00:14:45 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm15943085a91.9.2026.02.16.00.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:14:44 -0800 (PST)
Message-ID: <ec672f6b-2b8f-4241-825e-4b3e6d910762@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:44:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <z7y7gpfhrxgsxsqlsxmkwyr3zemvwpnpfuegv43ne56g5rsfl4@pehu3vloqjsy>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <z7y7gpfhrxgsxsqlsxmkwyr3zemvwpnpfuegv43ne56g5rsfl4@pehu3vloqjsy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OCBTYWx0ZWRfX8GV9nbwhKd/o
 s8WOeiJwV3Aj6RdQvFa6cXQMYlMm9r/d91V0Cgk2TCKfPE4Vefw6YNB2ElY5OM4HO1IUIgDTUTL
 /6mt1jmWmk+g5zK2CA7LqRuqmdqlYjGsEhOfq3hjwrBAkNbxk/YDeESJCdMdRUQd7IlGHe5bEiM
 hNfVYvl5eqTFRlh53eFPn4b30K0eK0bX1rRdHffmnFcW4a4yzlscCkq18l5G8spYVs40Or0+0rT
 qNaZFNVecjFklCHg2MGH9EA6CoZSjwYAYgMxw134hFkeBD+OxWH7apEcY6cKTyi9N7YVaRyDtWl
 NcXQZyTaXA3jDWH77LPjD5um4Mry4HBBhyonYLNrD+F9u9sd+KdoAgQNIL97YJgDFYdE5Qgresy
 EAHYZexWyFv5ygY4opWhOn2drs+GKyfSg+56hljOnccZeQK/Fh/dz2UXH2wq0Aanv8cNFFs2PI/
 tCQice5ylValJAObwOw==
X-Proofpoint-GUID: m3KT3Mq1uFH-hbpGYvsau515C4nEMyj-
X-Proofpoint-ORIG-GUID: m3KT3Mq1uFH-hbpGYvsau515C4nEMyj-
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6992d1f6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=MCphP8ZxGBsxnHqrgG0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92894-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.52:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02EA0141761
X-Rspamd-Action: no action

Hello Bjorn,

On 2/13/2026 1:33 AM, Bjorn Andersson wrote:
> On Tue, Feb 10, 2026 at 04:08:21PM +0530, Umang Chheda wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> [..]
>> +&i2c15 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
> Do we need to repeat this? It's in the top-level i2c15 definition
> already?

Yes this is required to be repeated in case of DTSO -- else seeing DT binding error if these cells are not added here.
Seems the compiler is not looking at what is present in the Base DT first and is considering the default
values for address and size cells and throwing error. Had to add similarly add for PCIe node
as well to suppress binding errors.

>
>> +
>> +	status = "okay";
> I presume this overlay is used on top of monaco-evk.dtb, which already
> says that status is okay.

Ack

>
>
> That said, I don't see a "clock-frequency" in either node, so I presume
> you have an error/warning in your kernel log about this. But unless you
> have reason to change that in your overlay, I think that's a unrelated
> patch on the monaco-evk.dts - which I would like you to send, separately.


Ack, will share a separate patch to fix this issue.

>
>> +
>> +	eeprom1: eeprom@52 {
>> +		compatible = "giantec,gt24c256c", "atmel,24c256";
>> +		reg = <0x52>;
>> +		pagesize = <64>;
>> +
>> +		nvmem-layout {
>> +			compatible = "fixed-layout";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +		};
>> +	};
>> +};
>> +
> [..]
>> +&tlmm {
>> +	tc9563_resx_n: tc9563-resx-state {
>> +		pins = "gpio124";
>> +		function = "gpio";
>> +
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +		power-source = <0>;
> Does these properties really match the TLMM binding? Please double
> check.

Double checked on this -- all the properties match the TLMM bindings.

>
> Regards,
> Bjorn
>
>> +	};
>> +};
>> --
>> 2.34.1


Thanks,
Umang


