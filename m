Return-Path: <linux-arm-msm+bounces-118755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7ShAUrWVGpnfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:12:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630474AC9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:12:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lGX9Npx5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M6GNQi5h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118755-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118755-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D8E9304C309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDA9406805;
	Mon, 13 Jul 2026 12:08:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C734028FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944487; cv=none; b=tQERKo3uXCaHKpzBun2xtzZuhVKzUsnS2BxPc0L5ILZw2jQDrwB1Lj7xu460sa/rHc4wvnmaDu7N5hnRzgas3gvBnQhp1tJkmPIlskUEJmT/WSaDluKS6f+nn/ZoF6YuYaQRbgh0UknjRsM16MTLm8KmxPeajynCYHkTzBpfUF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944487; c=relaxed/simple;
	bh=m3o+DRtI8SeyLbGcBfrARx+CIF/Y/cDvLkShiTldeeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqWcBl7zIFVrPa8sJx5QcMs0WarEoxiCeNDDPDoSNOzVgmZGdTswh6bQ0GjwQzFA1IB1iFtsckQ7oa021ifZ6m14K1QbGGB4qkYPG/XOCuoKE+o5tmdNAXkOwipJqW8q0nESf1MJIN4Ellj3K1gPAtcahXPCGwC0pNQFvRIU3bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGX9Npx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6GNQi5h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBKgsi668628
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=; b=lGX9Npx5cAHZYX8H
	mp/9K+oIekZf0rfxwRICUlGFvcb9CyjtVMXkEoLz97HnV0f4HRk+YfX373sLJjjd
	0F3IA9To2bf7mBYemo3ZzXKIg5LjdOIJkXs9iAC+mFmjZoT9CA3XUEixClhfbMua
	pVn0nS4YkBdKC+mEUUMN9ss8kUHi96mXKEe55Sivq5kHQpQvbUhyviJq1TcUSNYj
	KFl/A+c+be+LP7jOR4yoqyR61DlD+acN3t/aD1/Voyryykpohp03fJRu+NewuhN4
	chqL4hoYpUdMdbEsnNgjQBHnD+BLYA1HEXukBAcSchT0dvn/ikW5cAJ1a7j6Bp6/
	kCXNUg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2e7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so5572727b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944484; x=1784549284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=;
        b=M6GNQi5hX7HUyuGawuvVGxqWQtqE34ChffNZTz0hT+isbrm15V7Cg06KndJLQwTEKR
         VxU869LX+/mADUG3ibC4Jp4iyeeOyvpqfeKDRelXzhbmMiuM7m3MxFTUDEVedQ41feqq
         WWaTt6ewtu9LZNyDbXWlCzFuR46JGCOsGt7xArGMArjZVmQIagyLdwTX3Yv9/TRPTsxe
         GLS81QXFsaTLnnPCCUq13a6XPAhcT8fSZWlrJ+ShVvXTYEXLcTQ2FjLGyOUI/1tICu0j
         2IdSOmexYRthgHeKGpMnoO0r4QS6u8bvINM8tCI3RESmDKtySXHORTxOPG/W2hoG1GTu
         UvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944484; x=1784549284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=;
        b=Bwd9yFZV9+1xZyCmJaPGJxl+q1BBgrGeshIdkNUhbm3fcDSo4CM+nGNhS/wUTBG5K3
         oCtcnNp+QSaDnM6aGrpGAFYjrqHgXO2rUZCn1+4saE3XL78ZBWMo4F5KAgXK47oAGp8b
         P77Kl8Osl1fMZL+2MUObyuOnHjGCKQEq6QR49LQZy/JOctbh3zDlApgC/EZmvkab2qtZ
         gWBX4vilC0iJAlOgM9Wi1rJVe7H7qzSMfFQNgYul6MUW0N6MW1vDxktUUlvqAO1cm+kY
         Hyh0BBcSAs34zIfvgCh7hzeAblTkN1Q5k8vo1THLOmGHhaw3rasNVwudl67B4avs+xoo
         j/ag==
X-Forwarded-Encrypted: i=1; AHgh+Rpz2gDqXu+vSfN7qXjLds97IGsETXiaY8pcK978KDLEPKnntQ0deBmmDmMoA7PU4PFwMhjYUaqaI/NeD2P3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6KtKiRYaU/A4LwEzQzPdDlozpk+xhE9zaTy/BWHUrz3EwSLu4
	LnW3aci4rUNR3BbKf+yjQFtrNGwG0VU06bGeJj61tELrWJ32ongCMtaGALVVpA7iGCiCReg2rNh
	wU4DNIyugptaJha+ieFa8hNeXEkz/9lAizniL+IgczsHDcV0+eO372NYUoNcfl9Lo5EMi
X-Gm-Gg: AfdE7cmME5OF5Ohwb5Sv20vNLyNoWq0XoAeg5+l7fpOPlkGNcm+caSq3Y+IvJtGyR1D
	i9Pk3+tPUEsp5vp36PXGCWEVP6l8T+2DtiBfKIsOcuxc92AsU+47HCDXgm+4QWx8tGX+E+VEPkC
	MvsCDLpegUYhXrpC1NACUxinTGrcSv/jsW69wjBKdLAhNG/d4gdFAOtXy/5JDw5zfRMnRHLnZ29
	1bPPZt28amifGrX94W4BzV0lNzr+jEbNk+9j9UE+WNf/K+m9eyv610ReXG7M6iZpw8qYsRI6B//
	BsQjVeLKgElNV/m2hFZ4X5ywOgn6ss2LfCAXVH0Pdn8IYdF7WBlEWp3Lh1sqyU2k6gu8b9Ir5GM
	RigaWM7nafwmkPeMJUNklJkGpwHwX7tK4VGbT6Q==
X-Received: by 2002:a05:6a00:cc1:b0:845:c662:2be with SMTP id d2e1a72fcca58-8488971d43emr7797854b3a.42.1783944484376;
        Mon, 13 Jul 2026 05:08:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc1:b0:845:c662:2be with SMTP id d2e1a72fcca58-8488971d43emr7797826b3a.42.1783944483927;
        Mon, 13 Jul 2026 05:08:03 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b60571sm14012070b3a.9.2026.07.13.05.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:08:03 -0700 (PDT)
Message-ID: <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:37:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UOrg4LRv1TjwoOxmSrLDLLdyevpF5RMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX6OXQb7bwMW1q
 Xiwh5Et8wfDBSRrRBrzQJ0D+nRpV63zSEZX112YzGWYTF6M2dO85QJMXpqiKXF1wGWKkEaBJfaI
 NFoxklqJy3YepQ2hEBQ/9XoVVkOYo6vj2X8na5e5tSlhpRcp+B/Iq1iemGO0p0toe+CXngmMAx6
 jS4JWeAqWVwu7hpmbx5dSoNiVoHM2E1pAyVsjwcSOtHBh1NUSGrp3zi5DPrl3GslGLZwukwUbEF
 VNxKJ4PGbqSYVJ3yO8xz0Yr3UsYc+gcCeD87Zys3WkkWFib0y4eS46epsFfVzi/JWuJPNM7XNvS
 ixTZeesVP0ShbRQGIXvustPP1HaGey3SEnRW8qfdXOpd6fUkMbABDvztoM05iNBNko6JsuCrTP9
 EJRNvHcV1+AQENCqC0Rgljoq2+PaoxoSjPRFltyFQihu3kDdACOsU3qnYT0pBxx0cF8TYPrcz8/
 oirWZGghkjYmSOSUbAQ==
X-Proofpoint-GUID: UOrg4LRv1TjwoOxmSrLDLLdyevpF5RMO
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d525 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XK49fb3b56mXoZVge74A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX7nQ7vEZq/NyP
 XMNh+pXg4+u6JsyYZukbDj/+nj22+k4h6AOpAkGcEc6TnhoSPchFXxaGhG3q9rvtlO5Aj29AQnm
 lYSj5kTNK7yrHG4VAyaEuv8VC3PXntU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5630474AC9C



On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> On 7/8/26 8:25 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>> differs across Shikra variants based on Audio subsystem enablement as
>> follows:
>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>> are required to be supported on HLOS.
>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>> handled on Modem, so from HLOS only resets are needed.
>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> For the sake of simplification, can the resets be enabled
> globally by default?
> 

By default (PoR), those resets are under HW control. For audio use 
cases, software desserts/asserts for switching to SW control. Hence, 
these cannot be enabled globally by default.

Thanks,
Imran

