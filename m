Return-Path: <linux-arm-msm+bounces-95090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBd0JCyxpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:00:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 911381EC373
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4C65301BF86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB177390200;
	Tue,  3 Mar 2026 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpmQbHdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxNS8FLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF438F65B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532005; cv=none; b=M27M2QruMqukDL1iTSulSzRrrEXYk2vgNezsKfm5/Kg4y3ea1Qk1wUBnO9og9ek0EdBqVDl9irOR29HL8N0S98nXdOQmdHPKYByvl3dCdlHdtEPPY2afWCsAyp5L47jjYYZ5WPpsW+9nFZUJWRTy04M/WOmM6niY2ka3wW4JeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532005; c=relaxed/simple;
	bh=vZ6va53BKQGHpGNFBIeoZu7Y+fZK6wk7obb9rvhxuyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHQMa+CKjB+hmEDUH/mXe/5gUq7XrCOEO5gOR919KfPTiKgaF+Vlsd+2xIauBSiIC7boKUQT93TgPL3+ok+pP3ZVdPydtV0oHhKZmvdKLFevmtjK0xiRkfBXYJ0Vi8jW7tRALCi847zevuDv+aBMJ2LVQuKkJw4t7YR8NZcULGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpmQbHdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxNS8FLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239muie2736083
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKxnX+39uKmiEJXyji36N/L6Q/VrrJGXVFS/Ho1WbB0=; b=bpmQbHdjLq4lF4Ou
	VMlW+bu0i7LkZG5Q/esFrKw1q2qXO4sd/hbKeJOulUPpq5JaEOVqCz8rgX2B4Pdy
	DxrJWARAXsi/OvtLr9bmkQzxYu3IdVfVlvIZiuS2UF8GycZLOUHYMfD8Vx6Hab0Q
	jm9A9+oTnk8HdsWHG00ajH2TkwJUizVkdHp3cKMm9/Hk/FRKsWoAyB72aRQIxAwQ
	atbo0SebNSgkrRZU+EvbKAZqac00aTSauAcz81RlJYjLIEgbre8S28BQvikwPMUI
	HpVcLCzjAtiZm6/jUuG0L4K1vbW8ol0Nif03kFklaiKxuFV+fy+ceWvcMR0anbmQ
	QBVF7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0tps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:00:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cbdd1bf8b0so129618685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532003; x=1773136803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKxnX+39uKmiEJXyji36N/L6Q/VrrJGXVFS/Ho1WbB0=;
        b=FxNS8FLcCvXK1DfzNDZTDZjxFfwOu151yANt7uAWBa+qgdwQbvGeHZALjEtsDbgouY
         a4to0mx0cTaAkZh8ev6XVk9G6k6WGMTzKzv4Awe30To+mBl9/BWCJUO7T4m0ME+8tvdR
         5tVRO0IrFAcA+/P/kcyW/8MhWVEqA1flyMKkLDwYI1rAeH2IKPH05462bSv5G1qzYwTl
         aZPj8yKlVfu7OPBMVnF0AEoTDfVIUyMipcPBealCCC+quJUpi8ogpRX+iI2lR6qWyNwQ
         D+AMAecd7smu6/YFcUiLmm46VrXXDMWIzHxkCm7W5YOVKiAzxxR5NvIHLi9hGU7fMWCD
         IiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532003; x=1773136803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKxnX+39uKmiEJXyji36N/L6Q/VrrJGXVFS/Ho1WbB0=;
        b=tzMuo768ziPl3/nY+YgSya79QJ9WwfJZ4KJ8+3LHABkFhrROOoEO2LYmmGj3pK3T1a
         TqClC9oYHlWhbQ6uy/kN+0HIjJ4aU+1BF+dyByVCcmF/O3R5xc1r1Znil8f3mS3YwYqR
         M7X+NLmAZFG9ZCgCT2FcpG8wIkCibobTT83+Tltq0Zm1SZDTRGOpl4CdeI4nNNm9S498
         VwVt0LsLDplaFbA8Qd6HYgRfenob85fcqpKuKdKMm9KXX+iM6SxqtVdcqhRzhAnnEmjv
         9C7FsYSC28Ij4ay3PE5QOZZihGdmHqAg+OKNMYm7gQzBum6BXs1ph1JA/TMNVezHdgPM
         AlGQ==
X-Gm-Message-State: AOJu0YxtOTX1kKeZEQApYAnvHSj/JEcFmLLAInLkq2hti5CR8tfOimLZ
	aHwaGqcgn7gErZixOy3RL+/Zfg2k6ExFy0SO7KQZFO1BKHyNipiP0BlfYOhg32mSmMxyqVwQB5t
	bnKlcYKuowQvNC2IYcnqJDvFL8WFdQVtR9WqOgAxEaiG8pQCW7UlPyMhO/GebR0mCleaG
X-Gm-Gg: ATEYQzz/PSZ921AVLom0Vy5iV027Sji5jOhhhIAAz9BeloMuDXVIZm4e9YxlRnMXr1i
	plAB0vH2ZZPldC7pkiwqT/b+p0QKUInjntuRJR/85NEMSf9uP+sgvCJ0lKQkFjFxsAAaPreL3k9
	LufW4LWqQGSigcXWpA3Lb0g5zxVB3PPQuGClFTuQX3AozJ7XXyPnonWbL0Zz2eYwEQgej939o6h
	AV3brBitusPx3aFlrdBqx995206pq1zRpZ8OVTz2peUd2XKRPfao+C1ccetmP9rtk0Nj71wEOGk
	v3y4EU3RqkPclYq1lOHxFmsL3GNLea4QsDY2lZfkmKBP8+issmjwV9KKWJpf1nXkA5d9P4ek4MC
	rbXWbdNf97NNTXOKY88wbNrJLzBrr8zZ4QElbl9Qlk3nb04k7lckmILfESJtga3w7w4NsQWnn89
	gCN6M=
X-Received: by 2002:a05:620a:294b:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cbc8e510bfmr1477404785a.2.1772532003001;
        Tue, 03 Mar 2026 02:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cbc8e510bfmr1477402185a.2.1772532002538;
        Tue, 03 Mar 2026 02:00:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd46753sm4203798a12.8.2026.03.03.02.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:00:02 -0800 (PST)
Message-ID: <3fa87895-99ce-47e3-8aa4-6d55a497530c@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:00:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add role-switch support
 and HS endpoint for secondary USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-3-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303082157.523847-3-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xk_zV5DH6X_ZVL6a3fp0HdKdG7QrpGqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX//qny1aar5iV
 BRNP5K0ZOvvv3M8J2Lg+yQ20YiREz8c8c0YIWusZO7mb12WmJbFOGsRiaiSI26zBessF/8OsYr5
 /Lh/LQYOtfvc0PojN4qV1wjYXNDHtUZ5HRq4U8XqVAFEfv2eNAgGMPAHjc9idWc9/n4M2lzGoux
 PPDKRwlPYqZtfYlFmzW8rCmNCVCFC//I818TXKcvaCmiCCWxUaPkVqVnTMOjfGJxKLn8plGYcpa
 GL3GPOSVlLmmZi5PAQQ19iMicx858P4bCUuvvKy78EsMmFBdyPsixnooUg4Tj8zhI9GboowNXDR
 Qj2AVtDSJo6ryGBUYW689zQkIYfdXk9vb3TnCErB+UahJ5WnNuesG3jFM5xga3tn7RGJ3HG/NW/
 nYH6vmnosHLC8CgZSAFEFiXbkfTLJr1Sk5H8J8mrudEzXdUcd3drf/Vc541k10IJbuKv+laM9gh
 nYICE2f6c66d6EahXdA==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6b124 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6Fmm3pkiqsXrxyeGFgkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Xk_zV5DH6X_ZVL6a3fp0HdKdG7QrpGqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030076
X-Rspamd-Queue-Id: 911381EC373
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95090-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Action: no action

On 3/3/26 9:21 AM, Swati Agarwal wrote:
> Enable usb-role-switch for the secondary HS USB controller on Monaco.
> 
> Additionally, add a port node with an HS endpoint so the controller can be
> linked through the DT graph to the corresponding connector.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

