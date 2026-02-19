Return-Path: <linux-arm-msm+bounces-93348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B+GM53VlmmVowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:19:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C915D4A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 638E8302A6C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5C3284896;
	Thu, 19 Feb 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAxh6iPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehW2N7y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF40324705
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492742; cv=none; b=kw0HA5yUv15Yf6WIE0d9h4N7eYBaHTzKmnC0QoM0QMO1kVtmC1LQNkDlgddk+iPOUnTpWqdkB38iuso/gcGK6KrpatKGcspSrp4kgRjJPDjsMybFypWGOKzw2BdGnIQQJg49LzZmNkXLMSqOBkllYLnzdSskCkJ1ng9gT6sfgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492742; c=relaxed/simple;
	bh=kisVfgvpDR5taz707UhZIUsAYFSg3p8Ww2QDn94jDMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATDH2yx+Zpen7zgGnZSUE9HSXLfgaNXYdtlax+++BsCRV3xC3DTj8UMzWuzXLupBkTTVxkfb8e+yqDrJCb1QF9Np/PhDPavjgcI2zf0JLp3psW1HpRHCWDBV39pUpRDOLbggahFZUK8RSXBuvS2nMq1f9IAx3DykmHJhtMLqZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAxh6iPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehW2N7y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J18JiT3077995
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=; b=RAxh6iPNf7knj8hB
	nOyilC3xwUoJ96Fa+tFcJyGgFIJudemacMiPk72wdLm1rt44i34y7ZQ+xxKbQ4/H
	Mmd2BeQr2g8Ht0JL89EsyprDhGNWGaHkm0+s9DR1oPo8J8Y00DoBPvBl/0Q3mrp3
	5J2l45zMT/vrPFRZjCv9QDQZDnuo+Oq4o569VIWG2WzeCh/pF206jYzTifvu6A0R
	vB0vC/UXKUZ9Gp70a7GGvLE4Iyoq57C5Ery5xx4Kh8PXC+c4lxxD/g5o1jY4Ltdp
	jSljad1UAgIVhneEszDAAir8Kt0mMHV/2VEYo2bbng3Se6kC0Wv5IXP3449GiDKe
	cZt2Ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk80x1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:18:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-897193937baso7398226d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771492739; x=1772097539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=ehW2N7y/Vz44DtrKEdgLMrViz8MKyPC8puN357vVaitWd50VZt0Y/tj+tKSOhgeP+8
         gAQayg8bcHWpfKb5rjm4CKvnfcYeh2E0wm8bxUbhxMweg0TmYPsS6Qxld0Xna/VEcPMB
         4B5sUay9BvM4Z53p3bVll5KA7ZpOeUqDpI/A9OAg2TEKo2kjp5l/2YaO2hbvxpckZv/m
         BIxZG54u4tOeYdwdIplGoIvvYkNixHFry95/HZk7y9kXwzuyqX1hJ8hSulv6TGI9SGZv
         nW2lFmhU1jikUuAI7PpuWDCOwClBNYfKpkVsPORaPDDUPAZHLX73cudhiAblJuw5bwRa
         kpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492739; x=1772097539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=NQHbRl6mPvyc2n1xhlfbaEF8OQ3ATZDWdn0+WzKDVgxD1Vxb8DuXQoqzJqmAVXo7q1
         PCPHzM9+bWipSjRGqCF3Z89cHRjiLXXE2iYwNP05oDgXUxlxgIoNnLfF7HqHagNRp8OY
         mazSBNZJ0u+AMyFTOG87oq3poCdVWcG9hotxfkzjdKUvPKvmQN5lpTMDBNsR7vzN4nBq
         PBbJHl294Ka6vRxuVMSk8M6ltSd3lRYX7oIKI0fn5oY6ak1krKw0S2NKbNuBmcWZVepb
         lIsaVvY26e2vykLuymSwqX8Dut+1hKzJdH76DDfl0JbpTXGBpvPA4CYtEWIzvkMTr3yo
         ZmJg==
X-Gm-Message-State: AOJu0YxYVVSBQQZBSx7JJOsFOTbVRgJCLZtnbc/nYYYwL/kiiQlGUiFc
	d6KGTbMPTEV1wFoIJ7tlcu3r+wFovJjBPzt9ht3x7XJ9YHcSE9mb4XgBQPrGDfB9gnnvjCckDza
	741oHIgfSvVCgXpDopqGEosL0KO7HfjiwzAKeQM+mFgvtMqN6sNJ45kuIGuIHHKkzTUzC
X-Gm-Gg: AZuq6aKjhb9mVsEbGINcQEQZABNnu70gNUYTdFBnKEdHS7krVEREpFt8gTwa1XbVSb0
	Es6G5KfM7cGLj6BP6M2h5G93FLbtM9T3Lbk3uB/QeStO2sMkByh0PvkHYOxDx7YZaLPxdD/6luO
	2CmLeE/9xGV+4adlrUcx26qASegmIAWyhYfk3dOdyJRIWyxSobxs10if4YpafI+hyUeNcFNVcNW
	O/Zja4gc568py7K1FpDeBZgtWQfGZXhcaUTadieoyYXPrQRAJ2sWobZ07z3QQyhnoVXoxv/oUWt
	ydfysb6JS3ggX3mZoXI/Y6sDDzq6hspFVrRJRXoDQVCotiv6w19FZFY7XCYdiNVmX7jbu1EcKPy
	VOrp1+jQWJA4QBWysfQppptqL0olfERVyFrbB3/gt8S+DNjlTO9enVps/H4Chvq5kDFBNoLT+lp
	U7e0I=
X-Received: by 2002:a05:6214:5e05:b0:895:3227:1d8c with SMTP id 6a1803df08f44-8973462702amr208326906d6.0.1771492738630;
        Thu, 19 Feb 2026 01:18:58 -0800 (PST)
X-Received: by 2002:a05:6214:5e05:b0:895:3227:1d8c with SMTP id 6a1803df08f44-8973462702amr208326806d6.0.1771492738200;
        Thu, 19 Feb 2026 01:18:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76655absm533402566b.51.2026.02.19.01.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:18:57 -0800 (PST)
Message-ID: <beac0435-478f-4d83-8f71-9dc6518849ac@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:18:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC pin
 state
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8stqlQ6HJB-K0CvMjhTyorNQpl7bF_om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NCBTYWx0ZWRfX1RjdY3lBQyA+
 +Sna2B0q9bphEK3rxKPLf11sYaA1xuUwVa8L8xiEjx1jl1iXFuvCeTQPZMKDdbaOotipgJw9SYN
 b5ULvO+NhVIYZ8ptyXU7ht2f4wVGXDCwdn0GjvA2jHybuVOmCdr8z24VyLzHssw0PfsP6khJ7gW
 TgAyeRBOVS+lzY1WDSINy7UCU5fiTdlL/M8QOLvCgkoHaRUwOzNnEvWlPqgkk/dV9te6G79nvpX
 pKyI+pnyekGgIc+31AEQQlJi7mwlpATZz+VhRq1YPDFlxBHDVxIPFDa72Wx9Za0KcJLk4cizeJY
 nnlbI9rZ+mmeYRwY7UDiZO2pu/OF3Y9OjiC26562nS8qXufGj1uQ2URS4um6WwK/nSRdw7IGrJX
 SBT8yNI8yUIq5dWcwN28jKQv0J9WHvD8tLiRkIW2CSq4VeRownQe/MDiujwTjv4hl/DoDMrhutt
 oR8Bav1MLEYbbGRtijA==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=6996d583 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NMe5sQuIffPLTvoV0ecA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8stqlQ6HJB-K0CvMjhTyorNQpl7bF_om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93348-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C2C915D4A7
X-Rspamd-Action: no action

On 2/18/26 6:24 PM, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

