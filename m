Return-Path: <linux-arm-msm+bounces-73933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A7B7F901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322103B3BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BFF2F260C;
	Wed, 17 Sep 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH8q3UQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0465223DEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116565; cv=none; b=EZbAjjBFHwukPXgWXXOO7u+Jbra50y1tRRDxM7N2e8VLIP7snX8qKJwcoyD2/ke+iwHB5lD5Q10JUL2nG3LZW8RK1MNOQrGUEcZiTug0s3mYq8uXTz/4rPiRH32QW48C1J6WRjAEWs3oervZVUH1zCUPxDgSO+sSgO8V5eBdxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116565; c=relaxed/simple;
	bh=P+9qcWp7nB0G0Mpnq9jRPgAMimjFqsKqmE3zBJHHxVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJWi3CvgfjHZJSIrd6X9Qr3qgL0MGJjP9ljzsscYbSdrFoUDlHe3LNxrpzw5EtgCD0+TvmA5YD+8SysPJ1LZUdU2xwh6R7+yxgJoT2/nXuzBfFjtqqGx26triGJkb75pamYYcxLxQ9CUHGktqNn7tINHbZ9rw8hDc5nE8EJgYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH8q3UQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZ7t018262
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Cx+H6Um1G2JkJ5lXuXrB3HDUnwL0tqqkEuYb++6Iqc=; b=XH8q3UQGN4npAmut
	Iry8oafb4OgpvTI/IgVcqFheSyrG1AIuEg7/bO3mRz8Lo2sqz/gYNodPwtSG7VHO
	eboGISUmrC6mWfGj5IHR/LCpvh8g/iI03vxlt94ee1xdTh9SSYXV+IgBeRAUicDw
	Telxd2JP3heNxSf35v3Lo5w0sOICXpE6q7PgvF7/z/A+C4ld5RrKovlFvOxhaJ5E
	60z/ojoG5HhlkLncfjaGws6My47vKeUsdj/Fga8zKjLojMSWCYxcYhBiRnMt/pNK
	nNrjbD1NU0yeLstflcr94xeLLpjF9JbLcA79XRTVVrIPFwLM+j3o4O2CJJcWXxN/
	+Zw/Gg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwah8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:42:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b77da4b375so15737511cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116562; x=1758721362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cx+H6Um1G2JkJ5lXuXrB3HDUnwL0tqqkEuYb++6Iqc=;
        b=sgruXBR4a/gmrSvzmOyCA6hBR7HnIOwtt5e929pbMjOPdnDNiHDFis3jT1jX4okHlf
         geT0eQtB1GSZiR5wE01a6UEVveg+Kfw9Wt6hwdquGusZT/LBHfndLYBrtAitHUiR5Ldd
         xavcTN+UK4dvqfDLo8BFryOQ9yFbsBYGZJD8BPkoK4kIaYmDWa84XREghmlKQ73peNcM
         0NpcKAq+viJeVB16lAWGlEWwOVfj1AmIPq6odeqsfeT97+7UrB5GnYgMcVc41noPJLmB
         IM9fGhWfhuCFwZqzB0Ih5MOkQ9lTlNCdqdqAUPO0bR+qM4+4dmc3WDqr4iU4CUxf2KMS
         ThGA==
X-Gm-Message-State: AOJu0YzxXzflGjgqtwKjPrnaAx8EEDGAQXOVaHaE+/CYMk2Jk/bl2hfE
	F2vpOm+zP1JNQOn9cMZeyJlRfNe/eZftq1i3C8R0FlX7XntG4XoiWFZ46wxp4AefKDOtvZRS1M5
	01LEer93sMrqjzAif1ddKzlQfaURrj47VGitrYt8XrlRQMtRqd3H/2vX6ndiYE5U/rJ32
X-Gm-Gg: ASbGncsTUu9NWcqOcJGgJDCdlzXzsSSYXigqGpy7kT/mXXBJ6vvCiI+s9M7Dv/mOQwd
	s7+ABzOHu/EVarq41lB+rp6LEhnrLZlbLxgmCQTOxLbdeZ760hE7JEM1z9Zj4pSR2Hb+IcEPaky
	hIfuILRWrlTUnnJNj8jmw407tp2VZ36b230uLkGw/VUq8JsoLQr6+U4a2FSGP6satL4aZ+T69kV
	W04S0NowDSGCrzVnkAhI/mnIdSOsnjmbfhAbAqXwqFNmw/vvyAKtBvSitL3aq3ytA/k5uCjHlAe
	wWVi2Id5mCsW7HRiTmwL89CmuOyFsjpG3yzizZneyI1hIdp/nQbr7BOzevJNLAFxw4QkTsIlJ2P
	fGyH/ZGW1IOaVgbyF0t/9GA==
X-Received: by 2002:ac8:7dcf:0:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4ba67f67aa6mr13897881cf.6.1758116561208;
        Wed, 17 Sep 2025 06:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6it76BiV965uXbpKVk7JtT8JZF7WpBlguxShW0UZUk8ZurX542X6H7QXGdtmz2SFxYB8vLg==
X-Received: by 2002:ac8:7dcf:0:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4ba67f67aa6mr13897431cf.6.1758116560435;
        Wed, 17 Sep 2025 06:42:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd408sm1364974666b.59.2025.09.17.06.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:42:39 -0700 (PDT)
Message-ID: <7380300d-9642-43fc-96c7-a2a42bef5bf4@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:42:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] arm64: dts: qcom: sdm845-lg-common: Add leds
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cabad3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Aa-MDpYJ7-4v3bfwBlMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxO0OPZr6+Mww
 pQGiOs1o3i2v7JZw583MxuRxTIZ2Ys0e/VHkvN7Hq3VlWtFLjkGA1IwqLOyxz+VuA3dQPAbQNIk
 Zx22OKZGNcofCWX/Zzuvhb85KgoNUg6pVmMJ3LeXpTi2OBd1AFasWQ7fvHFgviXwiAkK1VvgsBL
 jw/XkHMpoHf6pCGed1+mwzaSZW2homi3j/NAAW7A5nT6Qnq3xhfttIfBQLjtdV+9dL/6fk+lDob
 yuBOT44ntduHMxDLIS9lQpvqL05ssSFiRvJc4RX/mSvZnIihGDSznNtDVUsUrrEeybhpfcrDGHS
 26S6jeVOhjKWJD3t0PVELxF8LRJfM0rDU+npuOEkmRk6GEiKaFdDVNNdQSq6msWlG00HoAyWKSX
 j0cWTzBr
X-Proofpoint-GUID: fXXsN1w2r7NF6OMWlT1LjqThgZUwaJXJ
X-Proofpoint-ORIG-GUID: fXXsN1w2r7NF6OMWlT1LjqThgZUwaJXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status led in the phone's notch
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>

Sending someone else's changes is fine, but Linux submission guidelines
require that you add your own sign-off at the end of the existing tag
chain (i.e. git commit --amend -s) to certify under your name that you
believe a patch doesn't e.g. break any licensing

Konrad

