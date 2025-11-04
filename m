Return-Path: <linux-arm-msm+bounces-80187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584EC2EEF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 03:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EDF1885523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 02:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B86239E88;
	Tue,  4 Nov 2025 02:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4LWXKL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bsdq5u3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C21E7C08
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222663; cv=none; b=AYbbISYpokvHN0wBzcyNseol38u+qufi9FJK/sr0QBdof6Y0oAntnYbV5sgnxzHeTfi4wJFf/rFuIej0dKWFLv/p0yHiyL136WifOE7y2/49efUDuRnG2uDia3QDjMHn7S5u4d0vpc77HQU2uBdUDcPaoPbkwUDLSlbTQWmjfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222663; c=relaxed/simple;
	bh=ExrTOlDJfBqPwYdVaOdwSFv1qwdVq9mca34J0IGZUqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gImv1TaVzUoECIC23FgTFBbc/Ls2EW++YZdHfxWIMgx89BbMX+Nwyv/szt9Mu/92O2vH/2GalWYKxR0/2PM+gdA78L+wYGeAZW0WNtFMwv7row+lds+eyKuQKr72q77GYZgMRdGNK9bmI2Ygx2eFCc0OuoOm1xsxZ9hilwwKCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4LWXKL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bsdq5u3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H2rYw3595027
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 02:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=knpE3mIPtxcnrRPa/ZbonLml
	p8HVii90osweuDpsQHA=; b=Z4LWXKL3Jkv4GzoNYeaj0xkditIgVLg8Z8NkNd/N
	ZKC7hsEPCHoPiADOSZ8xW9B6t/SlMIA+uvEaMXerfc8ijIJlVBVYpVHylstMDT9x
	+Ig0X1craoF57/dIJF4sLrYvyws3J/9m8L53I9NkawLfeFAlwP29fk23iWEcgwho
	7c8Wun4MITq7XNHdgVDJTQWVXQk1OQU/57aWbOYThY0wXvKPa1Mi8QVxWDwtoyOs
	tauGmn6VnCRivsNhuIchegu4XXGTSSx5LMV1zSQSZumkfcZdHavlyFF7Abpk49Ii
	CQs0aF2n5nL/PhpIn7/hQ+D13Do4qg68R+SZHKs/rPz1pw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exhave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 02:17:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a4c63182so142582951cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762222660; x=1762827460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=knpE3mIPtxcnrRPa/ZbonLmlp8HVii90osweuDpsQHA=;
        b=Bsdq5u3LNvREUReMQhZ8IwwoYGEf5Fd8ggmhyks8si3O/Qf1FntsgkIzNX8OKlBr5q
         wY+m33ZIxgyM0ZD9/t4C3FOLWLQYXlErlpEKfV6UPtVVq4yODZa07Vvj+LpdoXqepUNT
         iESQ7Qqg9PDzNagE0pLbaqH4MiU30105H3J7KOQjEE7IfOTRqgAYy7fiDm3YIVQSZxCz
         cdemSNt/DZWKZkwXGSDdrn3cSa3bRvMI/SpVkaqx9xWGIryuE5twKL6fbYWv9CT8E4tB
         I3BFWDZJpHXsn7iTXY+n6CfiRt/DMbtentO6TCZl3wBDFXa6U//05G4OaXw51os1/rhC
         piCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762222660; x=1762827460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knpE3mIPtxcnrRPa/ZbonLmlp8HVii90osweuDpsQHA=;
        b=OHqB99kV7cgVzVD8SMHeIEmAxLtMjTbjPAapVtlNd1aZMNrEgQfxy13y5wNy/xaVGI
         K5Lpz6h6fzSXYn87D7JVkoN4T6K3EGhrux4S1fiTroPftHnbmWwuiNGAHVlvffrt+nSx
         zaJnMUtGQqrVRHHDr1inWBlEEr1D0qe4DtYPIyz3aoXnQRw5f3UrdXsyU3Y9oE6ZSC2I
         C0DM5ecmO+9gbqEce9QpVXsKh3eWp1DTTkvl+4iqjaW1z+B1UbLXIPYsrAXJrT4vX7cZ
         N5vyAeXC7taeCgreeyj0uqQwL3a0BSD4y2kQ7s2vu80BU8SRDe0R3xWb81ChyID7RNoN
         FwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJIk15MNQF87uTINoF0qSY1YDmd2NDkZq6gZ20k6y238iB4lGn3hwGN0Litx/S+5g4XE+LX7yOInSUGE58@vger.kernel.org
X-Gm-Message-State: AOJu0YyNnebOpnm6oQTuwZPYWiPyXuyBwageXHciRFYrp32q7UH6hA4r
	ZRj/N6/rSwFz3Mxtjc+o/5FsBtmVQxNTB1LCwj8U1OYXUqZnokHH/iIBRME6S6NVfiRkdu6qErM
	TDMSqcHsoK5VvMrRh0H2/84AEN0JEGkVDkmxXtBTN5m3HMNtEOVDowbw4+Wb/zbZXPYj8
X-Gm-Gg: ASbGncsq8Q/TX1JSqgb11rNmrIlIpjm5eJDbrV8JY9sQsz9pdOLe9yntG12cp3nSdjD
	PwlPiXqD1hdS+juYrbaQuRqWh0OIkAIIZHlWZf3C2JklpXcseB+DZhWkEoQ7xOz9FJ9yyDj0wcv
	ueD8NeIAjIqDp3PE1QmDUYsaM2KEtJK0FigMIjCVQb4/r3Gk0bJQcndiAlc26MLeiG9MvqN8MUv
	dBM3cfdcmn6yRDdpDxKfR5x8IWsqrkGjczPH26qXieUai2x39BRf8dUI477U0AQdKABpWc0PxoJ
	/mtt/ndERRLxgDM399miuXoKJbt8iaktiNXIU8sFLHGU6GcazkX4iltt6PHHdwum8M+JhUKh9Vf
	5vdHeEwNuWbpp0cH3LKJekgptuDvOigf43+e8HY5whEqIyyTImEG5CKKIP0v20vGwMIIv11YFH0
	NT6sTn9Sr79Vra
X-Received: by 2002:a05:622a:4d89:b0:4ed:1ae1:5390 with SMTP id d75a77b69052e-4ed30dcaa18mr205476561cf.18.1762222660164;
        Mon, 03 Nov 2025 18:17:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwnCEn0+BeYW2n8xBwzc1o/g3a0jxTr6m0tmMJtQut2Fz7kPHouxaP2IscZJvAUGWO/slLYw==
X-Received: by 2002:a05:622a:4d89:b0:4ed:1ae1:5390 with SMTP id d75a77b69052e-4ed30dcaa18mr205476221cf.18.1762222659590;
        Mon, 03 Nov 2025 18:17:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594343b7cc5sm353179e87.49.2025.11.03.18.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:17:37 -0800 (PST)
Date: Tue, 4 Nov 2025 04:17:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
Message-ID: <i7qxr6lftcgzwku7nsja3wwk5hb54xquqcvep7d5qahssjjvw7@m7w6hj2h3r5b>
References: <20251103-qcs6490_soc_id-v1-0-c139dd1e32c8@oss.qualcomm.com>
 <20251103-qcs6490_soc_id-v1-1-c139dd1e32c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-qcs6490_soc_id-v1-1-c139dd1e32c8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=69096245 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Yd8kl3vfLVjVNOsiEv8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: L3_RWemNjBIBjBkrAYuqRkl41Tsr5Eiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxNyBTYWx0ZWRfXxurjKFI7Jk6Z
 TuWEstvzHGzfGLwSsNjiUQp7UUDjh8UWiOruvv/xTS7GaTVzzaEzK1C8bL7NZO1lABsOyH7Vo6s
 y7L9qXw+nAx0tkaZc8LHPMvi2SvxHgv6t0vzKyamzbgA150eStuvlL3kaje4cgQ+fs6tIi+g6SL
 OkyjJQHlrWq083uYPfuH6V8I3RKA+wSUDEFw0bK/A9hEyqk68p/mRLOMSTCMSpLW95//JTCgyKC
 ePW9sZ9zuIqSYAsT4bztlo/kMABz4C7ALUwi5vKuW3DpOYAdAVk80IO8oVXupD78kZPrg0IbsTP
 mymKgzH6LIQlfd5UUG9ljts0U45YcXpynoBcJizXLSCtcVS6JvsQhe2nTWFCsKgFXdHvIXuF1xK
 3ZPD+cubadmWOOznNzjENgD9lGpNXg==
X-Proofpoint-ORIG-GUID: L3_RWemNjBIBjBkrAYuqRkl41Tsr5Eiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040017

On Mon, Nov 03, 2025 at 04:53:10PM +0530, Komal Bajaj wrote:
> Add unique ID for Qualcomm QCS6490 SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

