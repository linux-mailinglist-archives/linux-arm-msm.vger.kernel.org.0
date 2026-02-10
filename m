Return-Path: <linux-arm-msm+bounces-92445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDtZJXn3imn2OwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:16:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CEB118C42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59A053006026
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A46333FE12;
	Tue, 10 Feb 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOAGhP5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Igz1RnbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8333F8D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714995; cv=none; b=V5Sp1FpvHao5MvlqoOFFapIrb9MUcj7cZPiloNf+0itwybJIQ02iezYxlNYuMCXTshn5TWNS3kMKAM9JeDCFbtAbsBAFJa82SDYmJI2H/nZO49Y5N+MWGWUb3F+BjKliWDI9ch/EW2f3/KBZvhcAXrpxUd9I4bHFOv+Ps//TQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714995; c=relaxed/simple;
	bh=oohtrnJaWmG8ArlViJEVWQt8tQOmGlQroaWIZEHlatw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2sOzXnPfITLUepb47Jevp12tEf4lZTI2ItqDb/iGlnpf7H+pwpKfLgb9RchkuGEsWICP4cqdNnDx9Epp9v+WqbyOFpJYC9+L0IG6+o+P/XqRjCE1RPS7PhmZRriOKZTACKqqTpBMN4C2VR8VcqqwBKYQ+IjCy6/f6cVu9Liuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOAGhP5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Igz1RnbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6lrt83436819
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=; b=BOAGhP5uHxMOmNHA
	KVrGB8bjQ6Ydtdipr6zMh9l3StxtdtzLgNAaWVc2+LYUN6JLrGN1L/pdI5Op7yBA
	vdKQ4wKbKuRLKMc+ebAm8tQm/9khyuddIE0pI1oWobl7xrsYBCEpJNSwETa2UWV9
	RJylOUoNLniSt7Wt/ytV/4Lx/hJsLm8NnhZK65b+ugyu9eaUB5b91GX26IEu9U9k
	oYRe3syMWxgZMV/UkHb3ciMP+h1g5O68zwHUVhJcyDTPz/mDqofcmdJTHD//wNqD
	KNvPWqlmUESodkIIl9sdLDr5amvRr9O9OiEINcX4zWGaMPBd5auZfmxcCetZ8mxw
	wlLb+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fevbr5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:16:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a94369653aso56763425ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770714993; x=1771319793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=;
        b=Igz1RnbBMkqtvcNjG3e5A97CzjQ4MK2EGgvL3yovZ7A9gwH+/+jlfK4XSt1BNvsi5/
         jyDKTBYaE0CEhD9L0Z0+qzR9USavzhVJ5agnumecf7iBqupAcIw6Ptstk2wD1Yymhvuk
         T5lvAliQ/5gyWibwB8LUlBx2Ab/1RXqHOetnfTTBJXQr6PtYvV6La4YiRJkGx/0W3VRl
         N7SorExW4OvXfFv9ycX9wzJnKGDFxOcxa/73IDb0d0v2zEEm19fKtCw/FuL4rqUWAus4
         Zg0rJkT7qgEVe9s/uLjOxK8lwhQyJuRMDavWR/OHy+78EnZRMk4VqvOGM+AjmAIqfCGb
         0SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714993; x=1771319793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eH+1BrdH9miSqILnClS6BrNkHjQ9waSl7nsIHkIU3R4=;
        b=qYxSUEri+LJPhHydbdXolOe2aB9ab/w+Cn4LjD9Crh27zeQIoU77c7kHW9a9E+45oz
         uP2Ml5Uh9GQjltwmerD6e2M6NMwMEyeJnbSIXA6x0aknIcNRiDckJoFZ3icxsOLVk1st
         5oQCDwmqbzXf62w5FBtTywE8dDwjheC+CXu38n0medkM7pEVEZcG1YLeDsAvRiZYUgEJ
         uh+h92XWgtgtKoNJJfcpGXC5T1l66K1w00NP1PXMlzRtzjy1zQ+KqmPpbXYbrlyITP2x
         m0CRSv+IW98NkHdnFbpvCba/BumopzponxvxmyNibJSN5uJcod43xmsBBKp+vjHf46s7
         Z1VA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVwv2URHYAsHTCiUgIz8jbLjaFUqWTH2uWMmDhJ9MajeoTya0W8Hu3g2g13hHmX3Eq/X1FHvCpHWB3bs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8GaXvuzCCt5HpFKGeZTC3qZZUl4ZLNGhx5wtKqddamTEAON5
	H5flCJXL84p7vvtGHPd3WqWirm7gVpSUYee/ZGPJVv2ClXpmp1qteG+sUxYW36LaWJBINvCKUv4
	GQSkz+GnHQZeTfu8zmc26AVuqp63dvj3cucDxhfcS/6kcbmL++I7iNYovsVtLpG485/Fh
X-Gm-Gg: AZuq6aL9jnF9Pv8SQopM6G+jHwyuw1sEnyktD321DMAzApZhhSrArUJA0jZS9wpZur4
	KLROlbSLyRrOJbFDTEmBGYPZ4CYtt157oSHKpFgqBw4LIimn1eEYmZx9hgV4BRc8r46oU5xKnBz
	hqq1yFrXH6LPU1t4e0x04UfhZvEk08iI3qbOgH04V0ez58fgJVAanuS5IFK3wN5oqIY9mi9rC33
	2cEtza85taYFqUAapKi+NfgdaaZKXRa2zJk8Tc8osdZnm6she8dsEBr7Si+8sjY+B+9Z4WMeUk1
	a389ywmjZub52kdjUf74mbURsw3Lbg/9Z4ZwGVV9peTBOwxJSRbgSZ7pb4Gu4HugiyEubf06F7x
	sOBaIY+rCWksUr1mJfnPG5u+zqmOlFiT1nualUeNQrbNwKnAdv6FvJg==
X-Received: by 2002:a05:6a20:6a05:b0:38e:cac8:f968 with SMTP id adf61e73a8af0-393aef17822mr13893291637.17.1770714992749;
        Tue, 10 Feb 2026 01:16:32 -0800 (PST)
X-Received: by 2002:a05:6a20:6a05:b0:38e:cac8:f968 with SMTP id adf61e73a8af0-393aef17822mr13893253637.17.1770714992266;
        Tue, 10 Feb 2026 01:16:32 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fc3e8sm12337205a12.5.2026.02.10.01.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:16:31 -0800 (PST)
Message-ID: <86d7268f-4e2a-4a71-8a78-c5e045556714@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 14:46:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b07w16H8E0AnoxEaz1enJA0IAyInkvp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NyBTYWx0ZWRfX2wkH+HX650pD
 j3DuRzdTZHZtgy/YsHMn1lPzWmow0J/KpffYv6bdp/OAOP3UsZ+BE1YcqWm4befb8gDL8ESQ6h9
 ldnyQTOEFbJuR0GalhblYsBh+twLkEAYi5b3TA32cJr+Bey+Np2yvF4TyHUz4Ck0bQIj0ZIImFp
 NjbionpJQalC1wGWtTh3FFVdwoZaghcBm4PtUmVmKJ8d8E/V3R1UfvTbxzg1LXBAJB0cRPJBa2k
 G/UURGM85sth1Is67GldrEYItcUHqXD9JQtetXLFYlgc/1Y1DimpwaMobOcTLMOvuLNVPG0s6QN
 trTzpKd3SRWlddIofJH35Txt994kLAB3pPCLEoaKzFchStfWsuRA+R1Q5zSmpvPhHcmtXmG2V3A
 4sFxn9ZTFJ/UJ+gWncZh7dFe2w7tnxrb0j3IVWX9XMoiqHYgu1ROsCXlJlPBQVLoVC8S1RV11K+
 ZNXZ1EQmU6h9PI+ZEIA==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698af771 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b07w16H8E0AnoxEaz1enJA0IAyInkvp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92445-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6CEB118C42
X-Rspamd-Action: no action



On 1/27/2026 12:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for Glymur as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-glymur.c       | 619 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |   1 +
>  4 files changed, 630 insertions(+)
> 

Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

