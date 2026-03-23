Return-Path: <linux-arm-msm+bounces-99203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NRxLkEbwWlKQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:51:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EF2F087C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AF10301C168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC31390CA2;
	Mon, 23 Mar 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hynfWN9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4G8plQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC7390CAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263019; cv=none; b=BStRRvNUSOgNYZN/DsYkaZ8aSmPsF/3I/YDfGViGCBRqORgEHGv/SnuaQj3Ka7pjGMaYzu9w3Y3LRXhYDPHZJ8hQvpHKGiTmrtlUREX8v4xL8cZEhTxMo5XrqIK8dwo3EJQzQCwL4JxvM37wSeQ6j22966kk+MMfLgdSkthG51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263019; c=relaxed/simple;
	bh=UZAC4stAGVhtkOpRkbo+a1Bu9TF8D63nsUj9pvsRPl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SV4n2VpD5H6hYW0/WQ239Ncm0xdS4EeG/V5k3VznkE66hr/ljVH01o9blYtOmbt652sZiMS3tguckdEyVr6q/q2IWnwNHn0deAwbbSG36AS4jNVO1HVwVAa4fvfJtl2lewHZU66hUy4j/ISgU20lQ5iXM31MHBD7Hoc48t8QdhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hynfWN9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4G8plQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmbH3539752
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=; b=hynfWN9b6u+FslT1
	hku4Ertisl5EdfLIcNM0RwG5OCWdVUu8zQo4L48FUxyn0riIWco8zeNPjiCqAxBp
	8+SJKIf1dLnXZdnvJT75Y7WAiK584oYCa5aF14BnWHK5fhgS9/RykLC1WFm69cF/
	tYdVIZb4KoI5aJkiNJpn4jCZAfZUTXi/M2idsCEdGZGDnUtRHiJP1QWqlZy2MbGl
	grCLsJofdQ4N2ByoBPWwkUsGOcpP/BbHT8MwrTQCXk9Sd1dl0hgGUkb+Ncj54fQU
	B/qfp74juq0GxnvnDHmeCNGCY+FzuTW8l/w/BktdrJ6ZjC4PPNvvHL5c0Ab0stYK
	Ye9I6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k3044a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfe29579d5so132239885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263017; x=1774867817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=;
        b=i4G8plQ9KygN1rv5A+1lz3J96ScSt/8D8fTxRzu9G2BpW807Gmnl20EIKv1w26/ZsL
         WeKUcYmtbtARB+Rs/92b+mQEgmgX8h1K7ulr+DlHIUJ7XQ9/M3esVSWpArA7FALpJ/yG
         O3utzd1MbgNBcdaE9XqmkQ8jTV+lNW6r0eUh47DmPO2l9zXFK0s+EI8fCj9gDmsUDgp1
         1v7/CL3BBDYU2kR+rKvKNWLegbqbMRIJJPBRdJ5C3rfBsJqfLllW7NqtK83gH2Ge0bjQ
         /EBo1ENw4reEqrs+vQBHL9pyr95XJumUOvwCHTDA19/g3U74bdNnjOkEqNKFM9CmWpDl
         1VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263017; x=1774867817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lmuE2hjC4bi9AnbpQ6hvc2PkKbo8iohz8RVpr2tyak=;
        b=OIG5V4cuExBpwGEwolI3xPZo1yg+EMuZgXuVftjlM5coL0D5SAQDlnf2j7SKp4pyIh
         kJ8JkFkxb5RbSHnrX79hfGq232gXXfLY86Nku77ZJIu8b6Ps39/GCf5YOq0eX+WRlkx2
         V66AhGz5HycRo73mk1As+UdvgdynwRI7tg3FjqNL9+3o3lv3cSgkSJ49GOYG9GxtaqeU
         DTeW+69+jvt57UA3hI0WJynu0+TBoAEzrSZrNX8WQnhsKvunH3IAKP5nKUTadUyKJbmL
         FlZWmTSgVCd71hal5PEqTdSm25m3+7oC79yjVmD93UzeJSZAAARGSwAmjRXtxJRvNQUs
         p47g==
X-Forwarded-Encrypted: i=1; AJvYcCU8PxU82t482iHFYyEKjgawVGAJJ9TvbQ/FJmxV2LS9TNw9CheUSSNCtoP/Z7G2QI7tGN6H/gm/aXge5n9o@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnmgf3Aa05BYtMSvF2C9az06XDj30LwemcfvMqQzPsToMt9yB/
	Tixd1Z441zB/7Wrc0UsAflJj97NyWofmRQeiGtyUscb4E/qsc87idGn1WuN1Hhhz9fIp3QvDrkY
	PKhh2ibEygi2FJUQ/CRXMCr7jfpPm7pgo+TwpupcGh2GIfXtgr6+oaok3WCA84aGAIV08
X-Gm-Gg: ATEYQzzWObGInAVmP0jBo8ePJBGlyb3aF2Ey3wbfSx6KBJyjZo4Wls0th1n7cTkNrZh
	xNhLSNoa1uzExyMMAv7qv51Oxs1Lj+0lj3Q8+q87I3VP7nbFen/0MOYbfYlgeQcBhMoe+GKF3+Q
	oUMpqyA5zW5XvHMky62Kx7AXrhr1ILOy2yZpfxquEbasXY2t461dDEqk8YTY19qSazbPiLPuhnr
	hCg/cqL6tChWJlQ3GnU1nTtwlvdESELNeS1DPMpAokva+WYU0vjM9VnGulY+nyGUNHlcpSvp71C
	U8AjwhCgT0n6t3F+zlZH2w3sR8k8dcNVvzM/y9hKJFx89vN6nladin+KscLfjSCFX7FYYRrkApO
	m/b6GefG+Usr4V4el3k4/jmN++vSRnvXglQJBvVbP4FMiV6o/GHbOWWPQT+BcDMCKF1SiCH5yHb
	Nwa/c=
X-Received: by 2002:a05:620a:40c3:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cfc7a6d50cmr1190576685a.0.1774263016678;
        Mon, 23 Mar 2026 03:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8cfc7a6d50cmr1190573985a.0.1774263016137;
        Mon, 23 Mar 2026 03:50:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-669c2ffe59dsm1083674a12.15.2026.03.23.03.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:50:14 -0700 (PDT)
Message-ID: <a5ecc234-eebc-4800-b9e3-8cbf2ce8cd63@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:50:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c11ae9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TdatPKb3Q4b5MMZQtZgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX17bR4mEGW16F
 qua83Ik9Hq6jATtERhf+g/Vdmt0Ak/2GRC0DdrdqNedoEiovM6H7CSlTdjnnBlN+Ln7oPhuocyp
 T2JOH/qqp46I3x/V+ucry2Sh3zDGelzvVEqZ9qOr9pMtaKSLVq4zo5Q4OpQPaa8R294i3AidDOG
 3erKvH/wJOBl/wG5/e5iVRNchGLwEsgEEiJQqmde5Lq6yZl4MNkBWguMXMtduBDlYaiUXULVHmi
 3CavUhe59a2YRNcMw05Fs0L2YHI6ugbNOtrFOA8XD9VMDxkXwBHGDIpaqv0QKgoyC5HuCZGPqPh
 XG+mjCM9WMTHYZQyjkfCoL4N1lQVg9Ppgs+54nqdHdcSm3A+BYBU6la6vrOd/EiXbVQTGUbOTji
 FmOeQ5TDnhuniPNoTor9ulU8rKyyd6mP7r7YCPBoM9f8wH9Qx/jONVJVUpXYy7wWzStgZUf/zm5
 CcRrDgR09nKI3K0ywWg==
X-Proofpoint-GUID: 7ubJHqDqOOCGFCsTdGV5Jfq_wQmmj8XQ
X-Proofpoint-ORIG-GUID: 7ubJHqDqOOCGFCsTdGV5Jfq_wQmmj8XQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99203-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D0EF2F087C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 5:08 PM, Abel Vesa wrote:
> Some coding style issues were raised during review but the devicetree
> was merged meanwhile. Address them here.
> 
> These changes are non-functional.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

