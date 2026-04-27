Return-Path: <linux-arm-msm+bounces-104708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHQ1O2pO72kEAAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:54:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDEC4721CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03B0130387EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E1837B03E;
	Mon, 27 Apr 2026 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEW+4o5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSRIesRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9E337AA66
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290643; cv=none; b=QkEhHSeDzWTATUDS49xFKVaIC5OUBDSPlFh97brUUm1PJcxQeeWW1/nhqfHiSIduG8HB6cAx2b2BESgy6tTexyxKS8RT/IoTnYKFPiu/G3M6oeVUFI/aQudVXNpeXxgPm/U65o0gEDwi2EoHcEBIq53qqmfU7OCZPD5a3rdLTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290643; c=relaxed/simple;
	bh=SFZTLIYPmD9OV0UY7jeV026g2fXysy6Tc264w83FgXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFoKXmLy40ri5mzwGYviA05DnxJg8Ll8aHuCmwgfAfAt5HK8fxMIsJu81hqW/TiT96UKObEjkVFWqux9RrYPc8hm/KI0j7LdCVUUAWrCxM9UtW6QEChQvh97WlSFpNKiGxJFcxtVFpHlt7olhLrgNQhaeG/E3Jd8gPBJtPSs21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEW+4o5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSRIesRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TALG1501431
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=; b=NEW+4o5G2RldYWqH
	rQjMzjl25jvTYOyHZHpLlpg1Qu2AmlLAaOuXi+GHM00gpEFHpRNrGjQu7FHgou0o
	AFcJYIA/1L82AhAb+NEDiL2OEairKt15A5n2mrVOHVusvxz+YmhGy4feVr7Nd12j
	BOJDvNk5wZXREExROUGHT3cwrEbHYckkqmxfFLIRxVb80hSGcWBDmiFrrMKddw6K
	K83C4Og7BGNNlwyRV5LkXFH9WM9OBrE6j5+ut0VJ+3N5qDi+yYYP351hW/YuiOo5
	MUjG2lJN/2y9C321C7/sYkFtnJX4FBAgQNodUIA1lIlTI3HkB4JToyjBSv5VHFkB
	WWzLCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnvuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e576143baso20821371cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290640; x=1777895440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=;
        b=fSRIesRPtD2Adme08+QyVBiD4XUDTHJNhbukJfSgpewhd1BD6pk/O8llpQlIMfa0rX
         QI5XP3u5qp2wqEeLS4qAVz4K+oU1Sy4fIcj2nxwq7O5PV/itQpvb88U70Nid/N6EXgXI
         zlyBXIZuZH5mp1g6lkUG1n9W579x2gtilZHq/ARRUpxNFwlwwDER5xQDPETuQrXGf4b3
         kNEoEyoC0IQGIFl2PHI4+ed327NmaxA386ounFFINwE5hwfmmkHPdjHA/hMarE0YXLO3
         G0+Jbc2S6OJXZPzjkJ3xHFFw5wMNoHFmqaUpcpuv35I8+CBXiHNHtii0svicBpEclLWO
         /yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290640; x=1777895440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=;
        b=acpc5cAsCMFyYUwBAUiMx+UwfotvqlqtkbekQPUFxp8UuiFnMKhsWmjd60ytCjAbTD
         SnS5hzEBLq/AvhaznPWzmlGQHD+vGOlgBA2dTm2o//Nd6ovqlD2oPJp9gBveXl8ARpHy
         yhqB9RvM3g2+O75HkINQmrzqVbNctAJ+vQ91W7MPfY3VY4PwURfb6vw4X8t2wNF60Vwg
         isbunVXS8P0IRdxy/tCZRwuQdAq7tL96w4AJ/WL3hQ+SJnFpbiq1DiJDW+BETLOfzMUz
         x2JdNuocyYCuw9wIlI43KB+1RFFeAv3QAlS65pj6aeWO5tOiXv7cv1enGUAX59XXZ2d7
         5chQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EVtnHr0/7J81H5NVgIYT5X/kc6tat2cwlQ54GvQyxESJtiVHJVbMq+rYfjsxWTRnttJnY4P1une1pgEla@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPDKOKMbcHj+GJd5H27r8wJ4xbt5GSgYE5EjCvyE0NDaBlmV1
	/5TrQUtRitHc4uWmEIl51lj5p+Lm0xMFtkaI8PqXR/NG85vW42iy6LhKNN/Ns63ypFR5JmkhGqq
	HZBdpz2Fz21Dob0arTSJPbxiyGRvmyf8Dg8zjwpFPJVbJKEWkXVDgVCYVIYvZs7ZSrmkh
X-Gm-Gg: AeBDieuTJNReG4vTlv2cBY9cpSLUWpwQpNSR5JyADZZlBX1SjpyNyFyMo5Su+SZA4EI
	mZlgx0QF/t7wYO4wwBWjuya9QhFCzB6A29gcmjjeMulHbt6GyWgc4+J7K6uOvyCq3V5ViHS4Lw2
	Uc95//KbCqs/Tk4uD9gY9n2BCN3322URAJKCotldr2/3AFujEMPhVUojAprRrEO30hRytlbWKbt
	juQK9FPfl1sPmCtsjUAg8QuUL10tFDRjoeM+PgMLD0FCbgLzIyiERm3mbPBJk5QlU3/LFIVRV/F
	GHhWKWq88fytggRP6/uLnRWmUmhl+dkFb1hUTAIyw9CZcN8PWk/p35l4uU5/EZZPaVFvDIBChbJ
	WV8x5HKf13Szo6cy9ADmzSU2+suJpDWpU8u73aORXgHgMzapymWp/fYcU1cm9e3T8zEJnnXDvip
	ZlLJMNvS+SG42H0Q==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441526901cf.8.1777290640547;
        Mon, 27 Apr 2026 04:50:40 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441526611cf.8.1777290640127;
        Mon, 27 Apr 2026 04:50:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm1106684466b.42.2026.04.27.04.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:50:39 -0700 (PDT)
Message-ID: <ae88fbf1-c0f8-4daa-a6b1-250d3245746f@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konradybcio@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
 <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-5-ee5257646472@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-5-ee5257646472@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNSBTYWx0ZWRfXzHw1/IoQ9lFs
 olslXze5S0oyJR1KHTvrDusC/19l0y/N0W27mwoxfniF3Eb6BkDJyes+C7LMkQv2OjwfTusm4IB
 jUwvgMyzeL7Nb8A4UXCMJ4QvwY7HiSypvEFEqTm/X+iMBfyy4TrGAPvrbfF2pXCgQR0puZ+I5UQ
 RAbpYTyM7vTQe9cpuaBOsmcbwNaOa1ayGlH94AvwyezE91j0kP1setWwvw4eYiP+foewvEmDYe9
 NBpAt49IsUIKsIAzuHESirXdT4q0cx66r0n0OaOMkKbC49F5Oc+h6CAIN2fLFw8kRdGRFZUaCAR
 U7X+KKvYnxpGyz7Bofveu6e8kd6/1/s2+AUeSaeXQzJUVF+rP1ofK8xBLebbRXpvCfCzD/g+rSO
 yhUlWolcXp2IM9ShwYNfrpZPO1iiXl3ofvtPXaAFBkr8IbTA+ClEcV+/rCgCuxjx0nrcigAjClQ
 AcBImgRkhxX2BG92FEQ==
X-Proofpoint-ORIG-GUID: ZG2_K9SQpIk2AnQl-qIp4VZDLdkDlrTZ
X-Proofpoint-GUID: ZG2_K9SQpIk2AnQl-qIp4VZDLdkDlrTZ
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef4d91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=iy5XOAXv690njMnkD8cA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270125
X-Rspamd-Queue-Id: 6EDEC4721CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-104708-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 1:13 PM, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

