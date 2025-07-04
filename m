Return-Path: <linux-arm-msm+bounces-63695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2722AAF91EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8982546BDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6712B2D543A;
	Fri,  4 Jul 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7NN3DMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180322D3A94
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630098; cv=none; b=ohyFCdYCmYdXuyD2Sy5YADkLs5ya8NJeNUtC9rCGMu+yegPs+oO7s8UR0k9shmopovfoR/YUdk77k8q0H3K4wKmaWhJeGPdDd1TB1rWuZzRtOOHtZwpEpvC540DQ4fmfu2DE4Ga1NXN+8mb8ESTqWZNt4WgUxTemw2qCe3x1kYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630098; c=relaxed/simple;
	bh=kBoOViu98NWdps6fE95Kh19ydZRURYbRTNtdY6TKgTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBwYQpnoEq7i8/N3FldygQX4ezyAZN6HH8IQjhpmYg4210EgpVcpyqPneWKDORSJzYXDEw1aI34b/F9+SO7OXq6idQcXuvOR76XM/q1whJBnftQToGqJxNQsqzaCy4TMApyvby1cKmdRXo94yYwDS+Wcdy+sl2R6eB2ZvQClaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7NN3DMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649Yqef024441
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=; b=o7NN3DMRbBRXx2gi
	VU5j8BTAxMMc5atqI3LYHpskCl/6UCWFnYQMlN6kSSnxL4NB6vsqruywF4BcKoJC
	kqAl/7K62ssqXzmvNmn/ufM9zbwz2ux2k88KhulKnP3+57cg/p3RDckgvF10kB9K
	9zOTHO4cC/DmMt/0ZwhqYvHw5MSElt+LAIxgHxsCCeSq+SxgKptwUvir+6Ha2B5O
	yTBjTrE4v4sKpLh/qffMXIb0MVjsQLO4UgcgfBKuGRF43lbr0P+Q0/PWM9L9+3Vk
	eCbveVIiC4nqgHxO1GFAwvRLZyeW3THUMiJyI5x/Lib9iupTMh9qV66MlNpxfmwq
	Km5zhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw40jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:54:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so2277181cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630095; x=1752234895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=;
        b=sYRVIKHZ5ndbPCuceRmN5Wh3/mUEU8ZZKh6M+hvLyB28kQW8P1IzsLTYI+PMlxQT2P
         9Y0FyWwVr9Zlr/FoBtNkNJGuTYuzEFlOUIXwiWu3l0D00hlNDpLQ093LKNMuq5+OCvPm
         RLvxt5Vkplyqw1UKf/l4iW9AQCn8Mlex5Ui0sc2Gr9cz+oJvu/NUPCzJ38TaoLQl8XqH
         72GWIHvxuJvbsIQ2SVNm0DL4YDmrpAPNRejNZT6UtwJq1V03Lw1p9tCLweIKKygS41ll
         rx8FjzVpqft7aMZWddbzwyLFjdtHMbNJ+HsIthio56cY1k0IU3+VCHs5sOvK8hvOpr8d
         x/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI7T8s2uUEv9BixgMrTXhC8XaeWgW62RkP+EJOCbYf2R4fktKnuzt8wa8KVnm14bSTOJuFdpwxFCKfeiQD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkn4LC7nfin1PSN09BB2r3ZF7vLjq9rRXGVPTHgb/tn77oijc8
	VZOzlchnybil+ufT9zjaccTyxR73M7okbeqIgs1p3zlITfLE2JPkB9ZLov95WHLyRome8FYkexW
	6t4mQ4SYmg8e9db9yEGi5L5656tIGnwhNnvjc9uA1ALPQZqM7fiiBk7PWAfTVAUIXEsi+
X-Gm-Gg: ASbGncsksq6FGnsdTRmkVfmFxogMgJDEeNkJuh7UacBZ/5d28EMQvAFStPP4H47iKuI
	g692H7d9ojgNuwxcgHYVNFmKnE/Q9OToSo3uwK+s0n5Dui7c/4+FtKCud8AQb4YWrDfrJJ8r5CX
	dojP1Yg4UhrFSCRcXO72gIZPvk/2j0H37mD12kh6nRm2BWSYtSQr/27RxX24Tp5QRPuItXMgWiV
	zsUuiDUkGhoYWcgZ0uJf2M6ZIm/acwLaR0JVchMlxifoD4SVb0ZABI+mlU6EKXy9kCxsHRkAyno
	b105nhc5d/f8PswtvWVuhoNf6BO+w9hapxSfpIku1HBD8F8hnKVQBYt7eeFaoIcG/JZxugr6Aml
	MkIaQLQ==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11747001cf.15.1751630094598;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIKC5nuUHGEaQphhIaG6OtNpGo0pYpdEktZFYxCrH4FwUf0Uz2dPk01S6AnCTwJ8mF/H6C1w==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11746751cf.15.1751630094122;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b64e9csm157844666b.165.2025.07.04.04.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:54:53 -0700 (PDT)
Message-ID: <ccd6352d-8c98-45f3-9acb-cd8b2d8d88e5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R3Sfo5blwvetqv-83Io8tbVkVvlL-6TU
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867c110 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=4HQsANGw-NoHm5yINCEA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: R3Sfo5blwvetqv-83Io8tbVkVvlL-6TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX6WAlGHepQF0K
 NyOWMbIPaMaeNR4WqV7RyWqqGtrdGtg82I2zsszXlz+dAuDZkjn+iowra2T0gjs49okIlmdpviM
 1SNoDBM0bcbpluQXyif4Lq/zjnHXr/PGiJj+6w0qAHYNlBLYfuE40CUNMuUQd/zguD2Tp0BZmKy
 kLB299zzDTJjAr3qCwyRq9tNvXaB+AddilR0OZ1JnTgpmE+dCmFPVEkT+iZefZyh2h0jwGSrKkn
 whr38tl5d4OuN5JJEHoNk049bbHymQzl/u4BdO4nGgeoB9Z9GidMYApD2QYGCooGPbR5rT6x/4X
 26BfV7ebdXgMCM7NxxTIf9F8MeiljOzw3af7MX/AZKfI24lXFSaYZmI38JQayrmdsRpgGZ6O80N
 7pcOn+o+5ym+Oumy6xEWT4aWvjBRn2zPo/wlE/qUB+q6VdCx1I6asbmpwB6mC4Dv2oaDFFZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=918 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:17, Luca Weiss wrote:
> Add support for the video clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

