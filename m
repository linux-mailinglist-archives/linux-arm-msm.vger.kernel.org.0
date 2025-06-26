Return-Path: <linux-arm-msm+bounces-62575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74EAE9482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 05:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F717EAB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 03:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7961C683;
	Thu, 26 Jun 2025 03:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diKasmMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FE84039
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750907847; cv=none; b=njctuXV1OcNwd/idFSn/62pry+7kjg12iYCI6HrGROnYQvpzXRxwCS2X7kpXqZoHtctiIa/5M7lU5MT8u9XANZxsByuPGO1LWOz9s6F243IYP2RdPAAh5AbNMT1WmQcLOGEK2rsZ0EpvTCODj9WisVNX85mig0dYi1EvuU/voLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750907847; c=relaxed/simple;
	bh=x31mGF7s/0RHh07FGyqoXnkN/evj/qdApu57bE/qeio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYQHmOb0B2LCWoLqTSNHlHhP5HPn/Q7nVODuXPe/CTmAcywmipf3qKOvAlHJNI4RwZFP0Xl1aOKnFMCZQgGxhlqoIlT8DftTuFAQjpMffp/dZDwno+PFTMcIVYdbXtYOlVXJlHYCNeocYcvtr6NtQhuyL1rWloEopqxo6RWie84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diKasmMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0EApV022397
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ErBUOcE2lsiiqTjUOQb6F1cA
	j3KxdxJhCA7no6eV1V0=; b=diKasmMgHdFRDruQV16ajkorWL8ivqnLHQJyqUoB
	SC7mNZrO5GTA+JfDJxhVWv5K6BCRc3K7zP13TMQ/qti/lIQC4OngR9pmLzfM6Uwv
	wip6va9+sjUplzEkInaIrnljhG/oBoMpWvO23carllT3pNSJ6oKET3d2vhZ85ndZ
	lXutHiSjCg4w3F0COxDVclaaZyBDrFfbrPtK4XpRjJt7oA7KxhvUjxEe5BzWgZ33
	MSJ2HhX6b2c5pOh5WGV6N0XkYu71SvksfKZ5z7y8/LOoRzT6aWNLqP997JbBPXyo
	Xmh1z0j63B3RINDGKyaAtJT1dNEBuTRTfEpOMsNKSY6Q2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx03s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:17:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2358de17665so5201785ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750907844; x=1751512644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErBUOcE2lsiiqTjUOQb6F1cAj3KxdxJhCA7no6eV1V0=;
        b=OoG+tmWDwbkOm0wRpnAjFuDxPqSDFui3o6STR6elVRTneaEQbzYJCxMdW0AMFG7hBg
         s+OxMCug4vXcD2z4vUc1dvfkQZGjz0y8avh5+imUQ+X4fN4Sp556nVBy4/jGSlH38eBy
         HwcAnpYINfMwUM8686uO2BFKmEmlsAuZhuhJOjKxvkBjP2apgDYP97cOuDhPqEUwR/vJ
         hYJVg/t4TR1d9uHwQ0RFKwh3ttOH6z602Av95CKB6c2uHS4HdWaoWkIez/tbUoUmxBHR
         fB9Cmy6Re8Bt7Jmdm9KJ5i0nb+VMdi9vCmOGwE7OM/y1Uz3PwaXfoMeHKUXJ4yzth0QQ
         V2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaP5wirWh9seCfRQ7fxXE7CFZYp3h71C0fkCEmBwN6cztnfEUlgZ5CS1Liw+wL6/6hj6ziSa1AqsjYePGA@vger.kernel.org
X-Gm-Message-State: AOJu0YxhBhL1qlM55K+fpuRELjTeDq7iAyxlFW5K/HnGzXPOGYLIw0O2
	IM3UsQac4skq/vpSFSkKb8/lsiF8w1gVzlGEw2+HKNl+mwg6CQ3YIscVgtDXdVA2X5QsnCDbgcE
	RSxL3Vo+oGt1EhdhKHNovlHc2G/X/uT0cIrnE+aiQFwT+gy6+Yy8VIPSLsK9PXJuFgKxv
X-Gm-Gg: ASbGncsTqw1EflfRPcQZUFDPQIHg+D09UkDr5n3494/NwpqmISvcfrJDI3JRsPR1o6T
	kY4St8MB2KMBrC2n/lfAz7t/Cp4sLxAc+mdm8pwrrm10CRaeK49m2bjjKxOH6zIajWAnre14kVa
	EQfHVlNnJbeC2ZdsHuOdnHtYqSzdGB7Ul0jQGF2+B3XEq8MZl183p4UpDTQh8Yd3wMMVKKnI9QX
	il0bEXTxNBcC1vmZBWT1xlZVyuAHmEW4XC5x91DdtSVWYcYVZue9l0Pdc9GDpIZvOC7bOOQgh3/
	T0p7QaEqAqPJmBSelVl4dN6Dz5nmbnDlTeWaANuYodNNTa8o+KowEwT/YZ/StxuSRiNUDoVrZAO
	rNciXnw==
X-Received: by 2002:a17:903:187:b0:234:d679:72f7 with SMTP id d9443c01a7336-23823fead84mr95627285ad.23.1750907843607;
        Wed, 25 Jun 2025 20:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmDn5qi3w4LtcEg2tNZs4Bk6hVI5/xpEnIq/0nSUsclWzPvoDTvtuUsmOO4aLVTEXCpBXtZw==
X-Received: by 2002:a17:903:187:b0:234:d679:72f7 with SMTP id d9443c01a7336-23823fead84mr95626695ad.23.1750907842898;
        Wed, 25 Jun 2025 20:17:22 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86cf609sm149804835ad.203.2025.06.25.20.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:17:22 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:17:20 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK
 board
Message-ID: <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-GUID: UsJwZv-tmi6auEJFS6TD6Az17-XmCYW1
X-Proofpoint-ORIG-GUID: UsJwZv-tmi6auEJFS6TD6Az17-XmCYW1
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685cbbc4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=PMlHnbKYs8XDBWqhuCgA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAyMyBTYWx0ZWRfX1SLxi+Knke+M
 q7ZUC8wA7o0N9+KFfmHrEeS1d0CTa9IrU1MKl4iD1Lur5Tjdd2R+FRZNrBAkh2d4Jwyd4FQ+ahZ
 q7tHFzLDutjr+xUXchF+gXtTpIRaFVxeS1k5PkiYgZwLtP/bduR5jB/MablHqb49frigp8DDZ96
 Yx/PGmyemtwmbTYRaKKCUfY8jdthb03x2Qk0J/k9u6LPhu/8YLHVCxMq9W7UYPCGpiwlqPqx3lE
 ae1KvHcLGIgsef40C8vLHj4W3Z9mAtG9JZZv0GcsXp1uFEbVGRsXzjjJmU1j6SQFIZDoB+rdi6b
 Ge0ThTs9j3NLPzfdjtIJJSenOp+MEv1nZcmPug8s5/93ns4rI9KpqISPqBRaZw8ggk6WakFlYpC
 7Ny/DevG1CfPkRz7Mtvxv5KCbY3SOYY7XWI2Wb3v5pmqPLQ0ej2IDV6Gv4Khi6dqzaFfeHGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260023

On Mon, Jun 23, 2025 at 06:34:19PM +0530, Umang Chheda wrote:
> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
> which has safety features, it doesn't have safety monitoring feature
> of Safety-Island(SAIL) subsystem, which affects thermal management.
> 

QCS8300 and QCS8275 are both the "Monaco" SoC, with some differences in
which nodes are "okay" and "disabled", and as you say here some side
effects thereof.

Describing these as "Monaco" and "Monaco with Sail" would lend itself
for a better structure.

> qcs8275-iq-8275-evk board is based on QCS8275 SOC.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index b14206d11f8b..19823bc91a3b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -54,6 +54,7 @@ description: |
>          msm8998
>          qcs404
>          qcs615
> +        qcs8275

Please add "monaco" instead.

>          qcs8300
>          qcs8550
>          qcm2290
> @@ -935,6 +936,12 @@ properties:
>            - const: qcom,qcs404-evb
>            - const: qcom,qcs404
>  
> +      - items:
> +          - enum:
> +              - qcom,qcs8275-iq-8275-evk

Please use the qcom,monaco- prefix. Is qcom,monaco-evk unique enough?
We can sync up offline on this.

> +          - const: qcom,qcs8275
> +          - const: qcom,qcs8300

Please replace these two with just qcom,monaco.

Regards,
Bjorn

> +
>        - items:
>            - enum:
>                - qcom,qcs8300-ride
> -- 
> 2.25.1
> 

