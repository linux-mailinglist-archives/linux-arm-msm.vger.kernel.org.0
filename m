Return-Path: <linux-arm-msm+bounces-90774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKxRHh+5eGlzsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:09:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2894B0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0ED54300372B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC3D3559E0;
	Tue, 27 Jan 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LM8ousV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sq32Ox90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D13559EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519386; cv=none; b=af+s0bD+UQYLtUym1NZWxN+y0UXF8ekzwStUtDxD0yLpo3TZTA579TLe74sUyvmy29ouhphHRgwgPgxs8+JwFftc67fsVAlnFYOZAnfbqs8YqwcO4EuIJk8T8GedQF0O0ZWWfCLlJAsWB0azb1ZMI6euaAUr505BrokpkHLPEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519386; c=relaxed/simple;
	bh=efnuRKhwzJZms3R2Iap4Z5vzHJ73VUnpIx1X7ssSD4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dwdMrDWa81VgT4w0WQDDO/ztVxXGD07RdxNSJdNo8JxB0RHqL/c09M0mE5WJne79CfaDrR0y/8IIt50uq3Gf3/QedbsHNqTAdY2GSvcI6QIznUlBqIaR2YNKkzTL/Jr+2I7fIAMm3dU+Xnwu9QOc2E7PSwRntiiG/blwN9yybpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LM8ousV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sq32Ox90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBwS6g2276834
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUh+2wDwMu27bOWGCEtKXnkz40MhnfurqwVrLlqHxp0=; b=LM8ousV+vC6sax3P
	0VIk/mnDlS5cGZrb5EadMz1r09QNzb5EzLMiEjppDpVsrqjQF9Dam5dZ/OgGXDpD
	VqdXOH2ZsaD2z6XbZFKemU7ohFzopMxruMrHFfppmnfdK5qGBs2tKwgCCUacd21H
	uqiFH1IKNZ4jO4edmRnsu+t3cOGBT/P9YiPCBbsmqlj6MW56juyjkokBfO3SkC9r
	8USUFwsfoSXlUrPiuSMq89EeCqvCqJ9A83561DwSrii0W1Ux7IF/A6jhaXtIX9J/
	7s3cjN1VjbncSugUUQcE5sybJj/MvJwAdVZ2gMLt9eaS+W5SmulRn9qSNksI1IhK
	uUEhsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasrdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so155329685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519383; x=1770124183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GUh+2wDwMu27bOWGCEtKXnkz40MhnfurqwVrLlqHxp0=;
        b=Sq32Ox90zZsBrsOufOYez+st6UJjPjMjRtUUSFTkLjCK8z9Cwuon2gfGrpPOJrp/8q
         iWYbxpHcH5SsZHBj315MfjMU7nZztubYvQLwaC9byee1NzaqMoCZfflPA5s0WkcNBvWX
         oXuogovDIVwEJIlFj9q+QvCqRFajqho0r5R5HFuQo41kTfugJy+YPNlP72qScGlx60bS
         rMVJptHkmLbYfEe/+2yWg8L6N8/k4saKzzx4KtmQwz1RIJd+ljjyU3trIw1UITsvLexI
         5Pun9FTrlL3oQ761aR5xqdfCtZ5LvjeJxj2vh4Clp6lzWqqfkU8l5o6oFilQ4j71auLC
         4WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519383; x=1770124183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUh+2wDwMu27bOWGCEtKXnkz40MhnfurqwVrLlqHxp0=;
        b=jItS6vTDKJ3xyprOtnqjKpFvHFMa32R9nUxaUHV9jpzyEK8LmNiMZPBkYfLO+kXxjZ
         /0ZT9U1Zx5VWn9H+H7TLTXMB3ts/iF8ce9pYFmIO1JiHUy6HlkojWKhO71D1NlliX725
         wZCE0kqG0SS5xUar6WOaln626+TD5dlQGHb1ESIivGPC0vTLakqZph9WIyKURFAFP+eq
         I+/2O/h/ut+dCN+9jIzs/+T3FZXEsEGPrIuTuRiKQfytAyhDiWZNYNALn8Bx4bjTkbYn
         wLMv+WPYcBXXD60q0MjPD5gQOXRGKduZVIEodQ1acnQz0JlvajSgB0tVY10niDxzqVyE
         7RXw==
X-Forwarded-Encrypted: i=1; AJvYcCVtKRfpvbH/TEQUMvL37HcbfAZgo1Ev1gTTIL8t2/3fAdWbp9LVANCdrUTIwadaEw4IlQijTnQewCaJa/K2@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXtWoms2/fBlIsW2eSvt9PPZsW6rHLwoZP902LJnd44+jcqpU
	GKRrWk98e9Eb667vtB+b3sDtYyp2qfmW3Q6lApsYFTL9HtqMxXoZtlaK0iQB+AkDacM2wzr5cho
	iK/cBkabI2cgBxGk+CoeUFCG53YWxjpkHqYh2kvRDmXLcggFRv25WKnYOJO/Zd55Jclml
X-Gm-Gg: AZuq6aKuhZPB1Yu7lB/eIT9q0v+58JZ9VZIBHPLO6VUDJTw024q32AC8JU0RUFOkbKb
	kfmlqztbEXWp3wW3ILoc/suUiPyPwuq4iVPc627Alj3/jBnarD3R3reHCwhHPE0PKiUXLLti/Pu
	hRDRRyZNBst79bGinahqsJ/5pFJeY4jhVCA16myouRHLHvrrqyb6XtomaOxz2xRJrbMt3S2jEQz
	kNYeH5piK5aZ+1OqTvpIwjU3unQDwn92ft56qZOUFZrwHtN4dXgPap6AkdxtSY67olJAi9ZMEWd
	IABoF4r58WLP6oOO7gBBxUDIi2HxSuTJjPJybNXKkCTdRyHUfpMH+zmilYjOBsoK7qRPC5C+X6H
	6oFB5CnaSne7j0+A+QAA9fSMk/1wXIUYJieLE7PtwJJQAf+Dsq9r61PfMqOSm5bHiBqI=
X-Received: by 2002:a05:620a:4606:b0:8c5:340b:415f with SMTP id af79cd13be357-8c70b879418mr120553385a.4.1769519383367;
        Tue, 27 Jan 2026 05:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:8c5:340b:415f with SMTP id af79cd13be357-8c70b879418mr120550185a.4.1769519382809;
        Tue, 27 Jan 2026 05:09:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b5d7sm6310264a12.17.2026.01.27.05.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:09:41 -0800 (PST)
Message-ID: <7d222bf9-12e7-4d14-837e-77e683cb7b25@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:09:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS
 to introduce eMMC support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260123120016.3671812-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123120016.3671812-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n4I4I4gU72d7aCZhKTGJN9qVIzUKwlFk
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978b917 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HyYZfqGJ5dFu0zQJZd4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: n4I4I4gU72d7aCZhKTGJN9qVIzUKwlFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOCBTYWx0ZWRfX6dTm27RzR3Fi
 iH8W5L96tvH4uTpkHT8Ggwu2W5z1WddetjG8Pjsau0Eycqof+TEczdds43R4+SlCI5IgUyijGiD
 Tch4oxeby4iAuPWCRY6DtKsu/QNK3fIH176e8fA/Tbeu+0dqZvwqFlpr5tsaIAmPkdBp2LWsKFY
 Epl/JPkK6PgpuWBSF//pOqoZ4FkUM9fmx8AsDmQf5lgUFsnw3nNujT9pZ4i7SlWIt28fddWhSwJ
 vdiDe5pyeNB1V2ZyrgrB8eGoaJst+5RP2yb0moqPDfduwdGOGDWw9q7aFjMIQcAV8OlbEohfDph
 EO+zkIgBCOuU8lFDTbSWCVEHqLI2OrxXchyr2TdMYE4Vu6mKtWGuIFfit041jxlcUkVnwo0Qck5
 IpmyGoPH5lwC9N+yR0+9xm1f0VemQkxynBiYZidzhglrmUchs1BAx/L54CuZIkE5ABH9Krf0Iva
 ZEoTjIh11S+5seI1ZzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270108
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90774-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: ADD2894B0D
X-Rspamd-Action: no action

On 1/23/26 1:00 PM, Varadarajan Narayanan wrote:
> The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
> supported. To enable support for eMMC variant, move the common nodes from
> ipq9574-rdp433.dts to ipq9574-rdp433-common.dtsi. ipq9574-rdp433-common.dtsi
> will be included in rdp433 NAND and eMMC DT files.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v2: Move common nodes into ipq9574-rdp433-common.dtsi
>     Trim down ipq9574-rdp433.dts and #include rdp433-common.dtsi
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

