Return-Path: <linux-arm-msm+bounces-104426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOs3BqxG62kmKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:32:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472145D193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 615CE3004D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E47237266E;
	Fri, 24 Apr 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O63MnVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMAkFblC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7936F414
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026701; cv=none; b=JHCuNAp1zM/wHI7GDiLtnxB9zDfd+IlYbDV1sk/n47f2MG2by0vhxDqXS0RnzeJ2290glFsxhy9TIV58vbW69Gdq0MWbBHCpIhXoVqiRqCiDgfzAi4yMsu3SgGH0xYd/6S/ucwtr9ytSPNIUwExOpaJX+YsW+eIQG07TbY1+USw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026701; c=relaxed/simple;
	bh=FG3QCVSbq3Om7M2OWawg0Pd9RG7BZq2/n7Sii2vmNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4T/eOwKfXzTfGaGoE5iHnUjQ3AQSZpy5YGPB0KM150Hl4uIK59NEiL9/VkmMScb1G+UAW+roqSSwuhIOcGrAv9KdmbafkK5goQpKKdeO6Forg9D7Y8qW6T0t0t8y/fzISXeLszKOPKFYmrTvdraYQVZFtPmqkx47a/mwxfPJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O63MnVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMAkFblC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ZG8m4167976
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3HZiIm5+GXi5uQ/9khASeVT
	w3Fme2svbGH3MAgGRVA=; b=O63MnVO2aBDnLwEUtjnPvu70l543reTQVGySnbc6
	y7s2JPC8jw2/7wk6tCCKVQ77Oh3G6ZOB8Mnid4VLhHuqpqQNkbPX2Mo+zdkbzQkX
	m1DqgTi7w5XmXb3a0lxCqKFWTFcqQjXu1F4n8aCjyf/DtHJB+PHnSxTT1a1x/bO9
	H1wk7uPKkOzi14Gn6s5dcuT7WMMfsg1zdBkWlaFbxjOC3FSfvGTh97yCJyoPIng6
	l3ViaTHoOsxxtRHOplnNN4Ntqj4kq1BMnPxK+Kvp9KE3c10BQODG/x6QRYL3a6VF
	cv1zp+KlzNSDH+hJJWUK4Z9ocLWZwXA3rZ4X/6EWmmL97Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0sv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:31:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60fd805d912so5584483137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026698; x=1777631498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3HZiIm5+GXi5uQ/9khASeVTw3Fme2svbGH3MAgGRVA=;
        b=DMAkFblCJUTKGNZxUKI0KupDt9ctQXc6uCyJUuCqIzAo8eDk3fQA0jrAP7QTMKzPmV
         SxN/kXcRcgMpLhhVdnBsMxSs8Mct72ZRV4aKCQyBxSYfM+ADWd4BGCdcx/PKBeYSdPfZ
         1NKw8qcL/nsPNJmY3EYVyJT5jna09Dt0TcEHsPfy20h69xHhS/7SoNZuBahSQl6v9gWR
         X61NX+zO/XgJl2eRyovhxCOPmYuHh9hHbwo0JbI7aGE3AZzIhg8QnHL13Apj1336bJxw
         EWGSHYrkm9YUkAllBtxapGbYw4Y4aOISN/wy5ZRHz8xC7aLRCiQ6XlRnnQbzMP1TyWZB
         0uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026698; x=1777631498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3HZiIm5+GXi5uQ/9khASeVTw3Fme2svbGH3MAgGRVA=;
        b=nbG+oNEC/OmrA0kssBy6N6S1t58l5gANuvBJJruWPke369IMhqrZ8LAdjacfMWaRvm
         W9GET68KSdcDANc3BrdvTZQxAy4Jh6Cn5IsCe4JyWIz35PY54SnFaeNfJhn22PsQIcNl
         beUrcyUwtZVuDu5XuVOdBVPqyjvJOOwT6Zm7rC9sWFvLGb1li9EoRLSO1bJt7Wzc779u
         diEYyizRiPD903ta3zssXrqBSTh7wWXXoHiDyXw2aMVEs6ApIdCc4GmYJR8mrGn9+XxL
         UgnMwZ+KhwyBnXdvV6hJO43wszIrLIEJ1fdslH3igAwzlcRWmaXaDryOhM/BdHFzWxs3
         9QQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wIxdOyAXSS3XLkzCEWmHzfSQxZppIM71TiRFuLbrOp0MLgZgt53ghA4RegpmqlGXgbf2DtULkfqXiT/kK@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrCnTkv3zhx6yaQT8+np3Bu78bb9j7gYSuRLhiMmPgZLbhvwo
	3dZW7vEXV7vTl1eP2QxP1F0/eW0/z1Yz2J01fRCogDRW2Pyjy3BPzY66wcFaIWpXdZdh/O3Mc/u
	5UDp0x1EMK7eEms3fYtIxHVA69Y7W+roZHOXPws+lvCuRKMx34IfaGEGqNiON4aqlh1YTROMSzN
	hB
X-Gm-Gg: AeBDiet13NZLFMsR1wj2E45xaT0dS8nA2Vs8fLhU7N5+Up/UeX6SD6/mfhI/54pqblq
	IFXEHxZNH8Qe+ZZMAymHHAENyfKjO4Fm+79RQNI8H2/5Am0snG+nDvHQxoiABHLdwD7nMSGOMko
	8JCAee/H/+N29I7OBCd1t7v3i1gE1RmV9IKW1NKWayLXCVuifY5DF3OBOGN5txT5JbGHW+ZrOJX
	uwc9MQBoo/3q14qMPQ3UXDmynZ3mtU1jSCHFPK0WjKo5XnsAcM2/b8AEPh2r6Kp8uDSvl7qhLTG
	sSRMkdCIRVsr6aTYT8MMTy2oRiYscYrsDNNrM7nX2TlzeuNwCBTMvH25Xsr04rYBTcWAWjvDP4d
	ngpzrp4uWwWlZa0KL7EOw9md8/jtUlmEAi314wTzatYzsxZM=
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-616f474365amr15009697137.4.1777026698373;
        Fri, 24 Apr 2026 03:31:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-616f474365amr15009689137.4.1777026697743;
        Fri, 24 Apr 2026 03:31:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm59900243f8f.9.2026.04.24.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power
 domain to GCC
Message-ID: <6ksxaaqyhtle52atgxudkqriztb7g2om52uhd5jmjvew7fblqj@bjavdc3leqf7>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
X-Proofpoint-GUID: jNDHQqVFc-Sd3n-tSwBsAgW6Jx5Pb8-C
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb468b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jNDHQqVFc-Sd3n-tSwBsAgW6Jx5Pb8-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX2hd6AnJRGv35
 JKrQED3J5DF0ancAtUMRl2TaRmMj04apxVFSfqedE9gwLj+LS+ly9th8hQzfTWdiCybH/YnnL0Y
 aoEFP2HMkdFjDAIMCZ4ftDaet38tw6mGpRPu7ZJrKqj/i5kBAVP9RzJwfLTT/U17LWRL0DLgjov
 wewi1KX/rYagUxL/AQ+CPYpfNs6lvdMDHk7Ftpxsaij6og3T9X0EGmT/hJH6yUSNFumh0l3fYed
 XpDrRQVxbcNBWB6dP2N+aR3lsi2ykRCCBkE2BlyZPMA/KcSRcem2AFYSxuBjmRNNilt1msyBQmY
 QctU9NbzuH9yQiAngT4rq78K5BnJMp+WTepX1yvRhAiJ9J4+ULCbc1B8bVAroqzTbE+64MshNKV
 KTu4qMWjWyXZtOlVIGPbKh4tXIWxmJ4SUPB8/nd3O+zOsb8x/EsWz2RUofs3K1ibAsZc/ly2iwA
 tR/PU7EzcHu6z/pwHCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099
X-Rspamd-Queue-Id: 0472145D193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104426-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-24 11:07:59, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

