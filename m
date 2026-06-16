Return-Path: <linux-arm-msm+bounces-113370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mc5SO+slMWrycgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4268E4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jzmPgDiT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="a4/65cZY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78C733008479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C4842EEA2;
	Tue, 16 Jun 2026 10:27:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970642B74A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605644; cv=none; b=adw8MpzoBWhMAm1sLkXVkOXo3gu+fYT+XVPtj6Zkpk7q4CCcz1vxi2X3CC1OIRJNL38EzYD1GzKip8Xm1zMJkrU/sxozdM34XWGx8vDUv0FAn8kgKuosQj1D/6dfSVC2nzytjp6kdTqC3GmQqZejOeYc29SmfZ6Cl2vwYsZYnTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605644; c=relaxed/simple;
	bh=QMo3iSUBVZbXVK3uwB583SZFQY/wSl9nL8ZZ5XuBugo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNYIVMkNIO+c2Kz1TV0T0/OrQ3eb3O95a51zsAn6/b3PgoUXAyeD6vemix1/4X7fI7LjUHFcbjJcyhkh+BiyfuAlqxJIxwJRgAtb+oUB9WAeXGvX45vAmGOqetTXYjhRaNjS0N3L1wSZFjRZiQNIB+AZW1es7dkzkzMA/nGYHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzmPgDiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4/65cZY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9G8e1413951
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=; b=jzmPgDiTIV/kyDSn
	QxQ55kQeJcp/0gJjC/9zdSfF/zsfyIb0SdZEmXQ3PwVfAuSTU20+DoQAG6+8kTgo
	Q0EGd43ttYS7DnSHV/AnXfqdmD/nREPmUCTc7uvQS4I37GMbIUa8l+boO4xpagbH
	KdAcFpJ1xcl1BHgx46CJA84uR6UtPrutsV1I3YF0LF+Y5mJ26DMHfpxtpS5dpfcY
	42GgnFRVR82fXV/67mZNvquo2uaK7zqFrISQX+37VcSeu6KjUnpXYTZS9g5CxGWy
	ReMrJdnvb/nXotHJeRV0fBTomLY81r/NVtUhxkwlvyPrfutsP6cI+vYwCv7qiCDU
	W+l1NA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0bhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157263095fso35433985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605642; x=1782210442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=;
        b=a4/65cZYCSi2kAekvL/zUyWeedulEH1ANCyb3eqRUtVH8VfCTcm9HsMlFfeeSpEqgA
         fKh8hSzF2+L7StLIpGV1lDszEKcv6ErlNPQs/zM+rQ5+bBlePzhvzcZbOzRpzTgcyz3b
         juPVNarrA4Q0uY1N1eo+lP/WDFZMPzAKfzPvPA/OBw31TDJMv2jS6q1mF/ge8JNlv0DB
         njpGx9KhBFTGW5OaKT5mLprIL1jBHRw1e0TTLFBwano0iKDtU8AEX0xjCNsW9EQVL4Nv
         mOBh00dSw0kFK9PDjv7k0cgrvHwMt1qNUSxSgShXogWIWdjg4mWvDG+GXPqXu1r7PTbA
         J28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605642; x=1782210442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfl7YUDOtyUDhv9IockQhbr+f+EP3g53NkHVlg+iaEw=;
        b=iyujkQSsdont00Twl5r0pZHZuqNZxWQPVchgQLWCSQbYXjyvEnO3AUvaqJXdeBQ4y0
         nTu/qst5NjCZh+ygNOD2Hmik8W0PsdUX8ojGhipkXjAqv1Ehg23Ov99ln8KGNeTEodUv
         +3X2h6TdaKJ++mietF8JNveGTZl17ZBcFtFnaxyyhtxK3A1KY6jk8JaxsvgiZ+5C0Dgz
         tHRUkNDx6RNzfFIOq97lMoLavogdEed5hltTxMTvMJEVVVoVNkcsxv2WRokdp9GA9eOr
         EYh9law/XB/5SbWycPTQhRkxlFBEy+wOsXO08nfoxOAisFKBqrkwpyl8zVy+m6wSXVCw
         1GBg==
X-Forwarded-Encrypted: i=1; AFNElJ+q0Pgjioo6+5fn61b1YBd4LPLfKSFCqRJJOFhNMtHcIaICjlIzs8Ok13kQoS7Mw1nXjJludxM1HDWAcXC8@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGB4CxboJnobfaFC81p5w2xzuVsEN5iIC/d/k0YVnr9VGcA6P
	Bk1FsQO+910dFCoacA/me7rNJZPFmBzC/o15Zny1yuIcSERulQW5KBcY4ByeXEUZA/GuqMNwbel
	r+P6E48gFSZUBk2kQJmSBBBBCNle4ccDb5uNOWVoT1sZZflx17fB+JPb4HY5eZb7SmYw7
X-Gm-Gg: Acq92OFGelON3vp+UAUpXN54WYUhI8vaz5wRTwXVTrJuTK2gTdDnbR0HkYl5w8T/01W
	sFIMQrYm7jumxevv4BKXUQbzaNRuOGtVKbuab8OypVAhhR87HVbWyeWLjX1lXK+9QwI7raPFdLk
	TSmZHKgeDgcUE+jH+pK74BoMVHDYTZh2CycbdSMW8Mbiim3T4LASAYscyF+YmR8x7qC3Trl7Q44
	wzEvej3maTX0pakN6z4clD6EDxwO95ZDm5/Ufy+IkicJ1IJAPpQK0BFTMs407DjC551T0DbNb3f
	Dd9jW6ehe40XcvUQDqebzRqbW++nisZmi9yqnWvNJsBWHu2Ed/dJykRcHKinXbf4q+8N5G+yGKg
	ZNEGm/awkjuHPJ/3AnlIbmtwjqGolz7hxaTM7JIerPR73yQ==
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1758230985a.3.1781605641726;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:915:4ca0:1210 with SMTP id af79cd13be357-9161bc725a3mr1758229785a.3.1781605641290;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8e209f0sm610213066b.57.2026.06.16.03.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
Message-ID: <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIH0108 haptics device node
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a31250a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WGoPKrXAnCDrgKufU7AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AXKbx7Nin-6eb-De84sHhv0ltYI3fAXF
X-Proofpoint-ORIG-GUID: AXKbx7Nin-6eb-De84sHhv0ltYI3fAXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfXy3WobCoEscNs
 p2rxnwe9FtxWS7eDKSs7SnYyUoe6kT76GHNbArwI+pJ4viGjgt25EB3KD6S69zHN8YgUhQSYit2
 woDbnZzj72ltPo2eZpiDCKMYn75zazKwoUiPus0havT61WimkGKNu478oJsQBcFJrAbeMoAe3il
 m4xNs8lPx8cGWrGAtDxD+DZX3n5vOx14Vb2BiKi9yJt6QDoLuCKfYw93hLrOEkoNpfjLO15/JNI
 Y07RgeNu02PUueZYnqUkuihFhV2jdk54zGrllRwiFQIShydQqDRnUQ2gWM1oYdY6Ls58U/FDfI7
 8vYY0fKX5gBjgo5Tz2QPIJpM8MTXoiLFFfjWzSe9HXVzgN/TRebK+eZQ/9UojiSLZ74aCcoXtU4
 rMIoTI+Ua2/JE/uaCTNNLUxxP6Zjb9qumrvY9xYwXzht7yg5GPknMJtW85hx+4+2DNQB3Ix6TS2
 y6YvLEwNnb4O1ny5pag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX63zCksgNPCyE
 gFuyLwqaMTZ8Db5BN/z3Vyt9LNabn7SnMtJxPM4haKPEZpoc/wuegS45D2hLCZ5oQWoEJ0tRo2Y
 QpcKHLVWGf8Cwh9p04hB2B7hN6l/baA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113370-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: EFC4268E4F7

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add haptics device node in the PMIH0108 PMIC base dtsi files, and enable
> it on several boards according to the LRA (Linear Resonant Actuator)
> component mounted on each of them.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       | 7 +++++++
>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi           | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts          | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts          | 7 +++++++

One commit per board, please

>  6 files changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 07247dc98b70..7e3f59fc008e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -952,6 +952,13 @@ wifi@0 {
>  	};
>  };
>  
> +&pmih0108_e1_haptics {
> +	status = "okay";

'status' should go last

> +
> +	qcom,lra-period-us = <6667>;
> +	qcom,vmax-mv = <3600>;

Do these properties depend on the physical characteristics on what's
connected to the other end of the haptics driver?

Konrad

