Return-Path: <linux-arm-msm+bounces-73943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD881B7FB21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A37189C37B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8812F39B9;
	Wed, 17 Sep 2025 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmusjpdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6529B76F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117559; cv=none; b=SDerAfLvkqdB7CPzo0CnCn0EIdinYETWIRXQH/BUk75QNVxi1Wyqn5nQk8lCa4AsYMZWrDoMu1CFd5gJys2Ir5TKI+y55gWDh9rjTSizbavtWVNYy/RmJK7AC44yLzmWvtVdHxUmdm9a5H/7bWuqtQDw5lblmBzKr+e6eA3H0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117559; c=relaxed/simple;
	bh=lyGb1aFoYsF+raAKp8sU36n+AGvzU8VFUBNR24jkqzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT193913JRGXNrr+T7IzeZRwdyRk4c6vZf2XZyqkO53T03DCpoG81rnYTjZnkw8zu9lkLduokfZKI/1AtX18ip0fTctHDoLY/aheKLsJpciOcZ/x97I5k52VUnqsX1RKYIY+6je2zFIYJskaGFnMtmjJgfA4zMZGa7ftXIbJGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmusjpdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XbPn010769
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uiv/XsSJSXK2+dr1Alsnv4ajZiNrr6ESJ9d7QQbgOeM=; b=GmusjpdGWf2ntEuN
	yKa8qCfbKl/RpVTJVVX4qC7wlSFDnSXYYpAlMOT665oYDxcgHFCAPo94gap3cs1g
	HEHutbKCNyXeh1pr6wTzKJ8bmzbLh3hSfg5AJUCvVTBXkXt7ASZSeafScMixmaRX
	9U1Qtoy9rqDjd9IDQSbIKRCdKG5KcI90JyzbW7Ts0pgB2YM8pU65kFgNBPtaRY2/
	ffKZRIHvflq5j9I3YBjEmToNuL7gupmIjwaXZi9h+DROeu1pRr4Sv1x/f+nSFb9K
	Fro7xJP687mno1TBMVJ1brL7purdc2tffvT7isnM1RQsPA0SXnMZC9ObTg3PNDVN
	hIiRIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxtjux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:59:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b822016cd2so5457031cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117554; x=1758722354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uiv/XsSJSXK2+dr1Alsnv4ajZiNrr6ESJ9d7QQbgOeM=;
        b=wh/3ek9RkUf2cR11XdddFq31/MhwSFtLJSi7TJbB/4tJWihNcE4VbEYF+VrRLH3YJi
         ohhix3nQgNcedWi1RUzwVare2rpb9zk2oYOjlydHuAkYpE7DVkBmeDobiBxdvQQxfNi3
         e9edWwlNJg7St9l4gyG+Wp9yVMBBQZXVa/L2E3jBDy951yIOx6p372HkmOTC5t/hp0VM
         wUaMsJBtOdnM5J5u+U2uZYDfAOBnsAc2gTHsMUNaIMgn4j8zvZc5wOLog4XXpGrYy2Gf
         7KwDdhQXrq8YDnV5Yk+2TjeGJ3YCoQoh+1YcJBsHyICz4HKBqv8AOvDQM21yGAmWJmIM
         BfQg==
X-Gm-Message-State: AOJu0YyGCaoScMfX2qRAA5j3t+yO+3xVB1tjOGho40Fdk9EyefkQ+KZm
	yrZfwojsivs+hBUpRI6d1fUPmM4RkWpPJEqCyj6h7OeOpsjJRLSZh1JiP4Aqh/y8JUtm8HxJv8M
	dj4lRmQ86aUhXIaRbKaje65a/eazdoWuzTK9dY+p0rMgCEBr/iuInQwKZXMj1GrQiNbpA
X-Gm-Gg: ASbGncvQu0q5E7ZI0PG78z2K01j//PXcf++qiPtLuAk12HPtHn2wrSSRLgsWviGJ0sT
	4Ci64InVBtCdK3l0BmdZ+19VP9W5UBZAeu/vLgUwnyGdl5YH+QZ7xrYIHlooRVh+IEXQ8vmus5f
	QdR3JTtcYd+izoNn8LlXiYNpCBQQNjoHqL0G5fVWFmNTWxXTI0cBIZuP13Xnj8GMP7ZtUnqDIin
	7BfQNAmbq1PMaWYAhSdv0JdoGyOJhvOdWvAk181I5mwmNIOVjCzxMI/MNgk8p1v7PxDny5wF/8z
	kVXPT93NupDBUX1/TUh0qJn7qUXRKq5AGYyju7hh+Eunl8Bf/HENJzBJQC6CVyxCc41Tt9C58fu
	oYr3aRGTibqBJ86Y+nPCjkg==
X-Received: by 2002:a05:622a:10b:b0:4b7:a308:b5aa with SMTP id d75a77b69052e-4ba68901f95mr17460001cf.7.1758117554310;
        Wed, 17 Sep 2025 06:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXp9M/NfwdwYTCoRDI+XQGNkB750ohCjW9JwuICJtNf50OfYIZe+NpGOz7kkOSn2YvOjDsQ==
X-Received: by 2002:a05:622a:10b:b0:4b7:a308:b5aa with SMTP id d75a77b69052e-4ba68901f95mr17459721cf.7.1758117553734;
        Wed, 17 Sep 2025 06:59:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07dbf5dbf5sm1019452566b.79.2025.09.17.06.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:59:13 -0700 (PDT)
Message-ID: <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:59:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
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
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX14PKb4TLcRRp
 UiXYK9eTpC9t+K3Ld4dzGAdqynnI43s3MN4CITHVGxQNiddoAmpH4ii2J1lQwA7md61/a4WBZZf
 gzo77g9LWBACRlKkDFcFIiM3Wze5w39uo05LabVi8IVnNfGdwouQ7SuwXq7a7HUDLLe209ZAdw6
 bevhOMMRmcczVULUUNeDGL1N+kRB6oXfg8bTyFKRQFGD4SoYs3YG0tS7PmgixYJPlPWC/UNvpCS
 z/QsK90+u8m2WuHQsLjCswimZHz70ATiA55jTINHvg7lWpZri00rc6t44G5CtTRHH3CgpjTOFLq
 gyhTI4HaYmHJvQAPlby3V6Tk1he2S0XxI+O/D/BzG4R/lKTdc6cPqyDV7coTtMX7LsjMpQuh7lg
 jxv4zqE3
X-Proofpoint-ORIG-GUID: sIG9AVgt8Rk_z3toTMgyT-A79hA_2E0q
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cabeb3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=H5uZHoPd_HLTupC0YvAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: sIG9AVgt8Rk_z3toTMgyT-A79hA_2E0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> Add display dimensions for proper scaling
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index e84b45ed82fd13850ea7ec1f34ddac5b59fc1434..8c1692f86e6ceea7b718361965e78f95d39373bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -23,6 +23,13 @@ framebuffer@9d400000 {
>  			format = "a8r8g8b8";
>  			lab-supply = <&lab>;
>  			ibb-supply = <&ibb>;
> +
> +			panel = <&fb_panel>;
> +
> +			fb_panel: fb-panel {
> +				width-mm = <65>;
> +				height-mm = <140>;

It'd be nicer if you moved these properties to the actual panel
node (the DSI one) and referenced that one instead (I think that
should work)

Konrad

