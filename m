Return-Path: <linux-arm-msm+bounces-90941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AHdHKTleWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:32:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BE9F7F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FBBC3002901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363DE28469A;
	Wed, 28 Jan 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QG6VN1dG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBQiZbr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127329B78F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596319; cv=none; b=lNGX6kdqRt52embzzJKUnQBlzZMnMuk7G+Er8oJyyq+GCOvxMsoJdMOQa81L3cNjAG9LJWOkiDSlaZ3yCMl7IKuB8XPITW3BKJe0+GiFymH37ilCFQ8EXEhi8JkHiF52Uw3UjyVlu5J2PD3thxt9DiUX4CFT0RvWEMUK/NOyiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596319; c=relaxed/simple;
	bh=FiC0GIWTbJQEi0LFdKnuQVwAbqZd0WlWbTASgIc5fLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIeUN168x/PWZ+NqXhbKwnymSKxKakD4ZvYu471CIUKEXzeZsIcK9lImZL4VyKTgucCEgSALC5Ul+YcF7Kfte3NFxZtRBpgU/ubCSX1S68uk9ME0o1ZknDpTRHkbS8niQ2p2L+WYGkkgf3C2gIHf5qtINv9LI4/jdYbtoAbZPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QG6VN1dG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBQiZbr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S938wE3247497
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	402IcAbmnlH0VD0kBgVmX8N/fUEn/UEV1/Jf8NHkBvg=; b=QG6VN1dGoC+PR7ir
	hlkOHQ+6COzmvcUUV+YcDOIZuvLa+kZQuphbWfrhjtk1tEY5B476AOfy/BdM6mWa
	DrWumDrfnsO1rxVaMOcbvmb4jcmcRnLfsezH5bERVCpCohoHgOy5dIku7o5hbjrF
	16LNWnm5hqJl/WUPNeTiflYxIJwycfZyl7fYZKNy0f0RIGnDiOWwdd5Lph+d/jod
	+GK2j1U+ETakiWQP0Ua5g43VGPoJDIeoaEzkJ/FH0Gk9DLL15KYn8KUmm2eW3eov
	4PLw5ILtmGiaTGI5D6ZU74bDL/lrGFw4jY6YG28l/OupVhhCVIwnu4DZ6JuSVTgB
	NldLsA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk0rwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:31:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8888ae5976aso25763846d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596316; x=1770201116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=402IcAbmnlH0VD0kBgVmX8N/fUEn/UEV1/Jf8NHkBvg=;
        b=dBQiZbr+Xj9Cjt39icEEYuJ5/fMaXcCG2+c01ZKxp2CTsTRR5ZSYNb4niYXTeiYWKK
         ZQEm/jUnyzXJqz9H9kPDVhleENyT1vO8TUtLVS4nJorcnUApAbxREkbPCHZY5jioYelL
         pB/+SO0dxumZ6jOLLcx6TephCIGjmSrDuFh2ee72EuC2SzI+Rq2UlDWuw2UBF99Lnouv
         aaRrdZo3Wr/bXr7mtSkvHdQWYpyMZLb8T1ofrj8PCOuDl8qseb/T3iPOyS0+ROJ3dUbM
         nBQEWOn8jYncIDUF9W93ZKV2DUwFAiPsRn1gU2QoK91awWOF7a2fom1etllsBdG6wuKS
         rC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596316; x=1770201116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=402IcAbmnlH0VD0kBgVmX8N/fUEn/UEV1/Jf8NHkBvg=;
        b=BX9ocC9qXX1NOqA5AkCTM8F6hAQ6jDYE9kbO9rDNOk4+28xHoVrQ6BTekNMHdmRLMz
         SkQz6l3bSx8Vg9KrNbttbk3Lt+QqjX8iz/09yLWuoQrL2DG38B1u/u2oronnSKtCS3gs
         qhJGtrG/gPnS6OKvCtLoDi628o5hMXCaP0DainRnhFmVvtl+ScN+ob7SyrhBLC6QnZyY
         zmD31BDd/cq9qnpYoExN6VFh646Llvdwmb2k1W4t+x6IN4ddzRWOFD1ArROggtRqZcQN
         spB63J0PkbYHHyCSvnisqO88pIR8Xi7ca6W/cJwy9ClfRjFj339K0xjw9QaJaviFVB7M
         NKJg==
X-Gm-Message-State: AOJu0Yzze3zrXATaE2h/J8VoKxuwj8c4NQ5eLD3z5OBEkITDamvbcp/R
	lxc+hG1cpGg//74WNIpC4+bXMNx310t3ljdqLhSms81JVK4kbrTy5AsfJUwSd2oPn2xJwgJnXbH
	wqL9Nvhoe0K2X5wvlc9LTXmlpp+fqLhuzIzcamWIr2wdoD9Nal1mlwiFyucL733isnRL9
X-Gm-Gg: AZuq6aKwCBZ+ze0gy82vTE1lgR+3lz6XwQ7AlPaMQzBIrI99U4cOoHGaFUx61mYErGI
	Jafu1rYHouzHrEmYXfxLmzGjPjj9QjyRB8FrOmjSWVY8NTDViq9AeixGKA8Eo+/nlbJK8Rm68c9
	07zZGTxuiT3Yzbtqob/fUxoUh/wgDsd/Ilw7QCGthYx0xl+duLWVg/zS4L1qbM7ojg2/RMchaCc
	HxMM9PkpNm6tGGvfBRDYWB6HBvV3P7oLJH5nlNwsFGyQs9Lz+bQTt0Pl8pfZOkwvV/uhK1nGa8r
	n7HrBr3cF8JUrNJVR3qeL6sNrk1y+u2M2xW2XLLLaWJbYix/cSSdpczPdLMV2q2UzptLOnvVyrw
	ftKilPEnlvvl1SXsXARvC1fC3X2z1XCWHbO4WVHpgEWS1HtenYpQJleLx5MQiky5ynis=
X-Received: by 2002:a05:620a:462a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c714c21c96mr102179685a.10.1769596316110;
        Wed, 28 Jan 2026 02:31:56 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c714c21c96mr102177685a.10.1769596315639;
        Wed, 28 Jan 2026 02:31:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc56e8sm109798266b.15.2026.01.28.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:31:55 -0800 (PST)
Message-ID: <2324aa41-6b2a-41ca-9f97-7a5b5e0f575f@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:31:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: Flatten usb controller
 nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NSBTYWx0ZWRfX+4TqpVsAwUkv
 hkkz1S5yMP7ttI8n6PjJ69FKO//qG+dhVxvdt6zzaxwNvieqrCZUIRUwRIq9kxWke9e3+9lNbHL
 UuMvTG+zsKF3XiOQG+g4GZv5cfZfZZO9NzVGccT/L5TOzTzHJrQoH32H7Qh7fTZ6+le9PscKaje
 7JUTSNt7OA9V3cbBcv5K/uncAi50nnheiAfyq1RAmBUUb5fgWhJUnY5/3yUfkOVpT+GOKpespFv
 GEiiceMRqW3sEDy5gO4hs0qHtvvxVnjORC0wdWuqNUGBFnO+TS+3qGlrcTKKlHqlq8ac5Qm5TdM
 vChsvC3KXHj1SFS35n0Onu8jcDZEvPRJe2w5SW+AbbEHgtiv1GDLEhTbuYspRMkA6+n1rmYk4FN
 tdi+lC+fCpk1AUgfA+TuB4/bhrQXppO+UNWpuPoYG0NFzoO/1DI1jll3WDZ4W9BjJpz1D7oxsu3
 ui6nuiHuHwSWm4N1UVg==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979e59c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FPiGsNb838X_Hz9JFSIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: sWBZvCM1-VEAmEm8sP0NOSHi1kX6fIZ3
X-Proofpoint-ORIG-GUID: sWBZvCM1-VEAmEm8sP0NOSHi1kX6fIZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280085
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90941-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D49BE9F7F6
X-Rspamd-Action: no action

On 1/28/26 7:27 AM, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Have you checked whether this brings about the same crash-on-suspend
issue as it does on Hamoa?

https://lore.kernel.org/linux-arm-msm/71c15a78-7a50-4913-b677-e5308fcabfad@packett.cool/

Konrad


