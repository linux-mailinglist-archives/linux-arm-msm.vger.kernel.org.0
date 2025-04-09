Return-Path: <linux-arm-msm+bounces-53701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAEA8305E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 21:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5984E7B1B6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 19:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325D4165F1A;
	Wed,  9 Apr 2025 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBUBH+Nu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D71DE2C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226513; cv=none; b=UzyrHTeZ48z9KkXvsIKZEliSepZVG/xXLrKbLRhlTSdPgTAcnok1ObklqoiTj7ZxWuEOSA293trDewBroUv53EVnbxoZ+4bKc+SO2rB7t3Hu/8xmg3QXU5ISjwLHH5A53MhzvwNbNLjlyAJuaapZoOPLz2TZQ4j1wSJXf02k2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226513; c=relaxed/simple;
	bh=tqqtVLL0a7rnxVyWWNMx3H0IFxuLoh3JJkSTBORz7dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRKs5vRWxRkBeNxVRwqIacBiC4TwtGyMEu3wrIkVjAEClC9LedpiEN11PTdYs6ctqWUovKD1fIKjCwQv+pgH6B2idnzIz9Qf6YugSLuylWEeeCaxA/WZsTXQRfDZnQd2t/egJpouIEHoTA6yIwedRdOKfJkwh+PlO82sIOqwd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBUBH+Nu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HMCrU010454
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 19:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ao2/4Ir7LjEidGCmtnAUzgnJ1V7Yk4U0mm093nzxA/8=; b=FBUBH+NufFHcklkW
	+pkQwxYqymHBAdpD3DQ9e77+Bf9pxYOadwtNU+oar0BXBZ8YuGvK9KQEQ3mKr/mv
	PpVdW8sfpQ7oxKe0HnubXHyiMd8NqAUVM7Alp+kPbHnkc7o2uffeuN64eCzE2yVI
	JXdwYhwJ68+l70W4R6SwzKvNe8uVvoC0CEeknToRvAAZe6ewmdJ4zedDNAKGcPf2
	2ku0u8aut0we2EAFiiK1crcozY6SSL8xQtRal91g9vJD7ycPp7NB0jpid4Ztnmuv
	KLjDq1LMuMjuEH9rvpF/diEhN8GTppxlEFxdXg2uhqOHzCWqCkNLAzf29gIZWIvG
	Bbb6sA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftmbmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 19:21:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso837385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 12:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226509; x=1744831309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ao2/4Ir7LjEidGCmtnAUzgnJ1V7Yk4U0mm093nzxA/8=;
        b=WGx6l3a1dFwmj/sAWIzvBwIpsRx67j5n2vC0aTeTg4sl6xGDBlj75e7HAHQzFCzJtT
         1IN3IHWXvHsjgyUoqYS/wVOUOYiiyGAMc/r9QkknUQu5cC6vXe2rKzsr7qAF262SEaNQ
         RGudMcbtLnjGpj+ZMBlJKevtA+80OVfwyzS7/x/p5TRqP7V/alK6u3l/e8MxTcoHeBti
         r9Z2NfBmJBBpULqebeUJs9tSm+oMNDNJzXsQDykYI5WCaavOTHe+jUQfDjR3HT4+IzBJ
         b3creDd0YPPHgyPTf/KdtK5XaxO5aJGHds/yUTlqVD92YcKMpNgxDQvy0LtILoKtCQA7
         sgcw==
X-Forwarded-Encrypted: i=1; AJvYcCWGF5yvkv2eY65WLudfbUYiGICmsWZFzTPDWt9S6+cxa3/mlZfQRhIQnzA6zMk0EFziJySqfMhpquxNXIDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxKaYWqzfvt6tIaazqCs1mI/V8mRVe4BZRsEbTI/jAHs+/Gdw
	lwCUq0QVjN5dcmA8owNoJnAIK75gx/Gj1YJz8z1IwsIbI7i3X7SUBO0C6GdoobRwff5NknR7oVs
	U0u7MW3l5XcLvXnQ59B+/86Xsy5d7RkUDgBeHTzfZJZI8iIX+54EKW75O6tsaVGHs
X-Gm-Gg: ASbGnctxgtjWUcbcDZ0oEu1HMrhMl2lcbWFzGK2E0ny3stQ6bnGbhNhGmEfy8QQxV97
	nKDTmkZBE+hXuRpX/iQm6Tomcuy6D0s2GENKiF+fNYRa2axchfurtQNrNqk3PpmEMTGynIhCLki
	uE6TP2AEME6oiCcplcrICtBzzB6ujvlcbmbaTOg5F5k3hXjFHN9oSuLxwj11QMbpB0mnLbA62Ry
	a5/8Y8PIWsr6G4lq4sy1Qdb8MtxXrAuHiO19FxQFFkb0z2R2kq3RxcFgu4MYHC4XVj3HKRePRtZ
	juKY9YYMikA+8yab7W0NEWg/+Lw6sOB/FwT9AzIhix0/0nIv5AoPqWoUJPK84pdeSA==
X-Received: by 2002:ac8:605:0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47960156d99mr14124301cf.14.1744226509596;
        Wed, 09 Apr 2025 12:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE77QLvXVQb8hQrclk4GktTwGGdd9UcIQL9qbqVYhfi4TU+IPv00TzOyHgAFpOf5a4SCAcmAg==
X-Received: by 2002:ac8:605:0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47960156d99mr14124201cf.14.1744226509199;
        Wed, 09 Apr 2025 12:21:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0c7basm1151156a12.30.2025.04.09.12.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:21:48 -0700 (PDT)
Message-ID: <2326817d-0b23-4990-b5a4-68efc8c20b03@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:21:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for
 va-macro
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f6c8ce cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=FVEEgxo8gcP725zB7O8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: cSR1V2upg5e2sfis0cuPbC-bj4clH_Ac
X-Proofpoint-ORIG-GUID: cSR1V2upg5e2sfis0cuPbC-bj4clH_Ac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=673
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090128

On 4/4/25 10:42 AM, Luca Weiss wrote:
> There's devices that don't have a DMIC connected to va-macro, so stop
> setting the pinctrl in sc7280.dtsi, but move it to the devices that
> actually are using it.
> 
> No change in functionality is expected, just some boards with disabled
> va-macro are losing the pinctrl (herobrine-r1, villager-r0, zombie*).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

