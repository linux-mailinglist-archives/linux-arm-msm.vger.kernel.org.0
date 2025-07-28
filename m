Return-Path: <linux-arm-msm+bounces-66824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069BB1379F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F56618973B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8152522A7;
	Mon, 28 Jul 2025 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiBrqKxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0071EB9F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695520; cv=none; b=rzf+LUt4dg3BTlQsZuMsSD8yUZBZdaxlCy0IZzUHualShTw7bx/pEMptzjYhJ6lyFVBMtVwLtAiqN7vnPmWykNk5Jhbj1yCrGR036S0K326dapcSqSLGLJDl6FcDPa/ldmvOHYAjmIAkapARqbuXRB8cak0rH2vqtLeCLLx9UNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695520; c=relaxed/simple;
	bh=q5HHSBNpMysbC45WGfSgwoBWT0aIRRt3LCmk6oh+hB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6VsuCNv2/f3HTN1jYF5kDQRVTcyQL5JwbAb5G6nRSNSn/xp0hza9soc9hsJeAbYSwft5JJiBFDxhvTJQ218zmob5CDcQ7t4rpdFApT4zkRO2TGXQEKFsXWe/JIO+tnmV8xTDrfWWScoXz0mWicSqMTecBqzkhAvMti2gtNkMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiBrqKxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rtuY023885
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ymQQyXq4R8zra2CrX8sKtX7E
	xyNAkEiG1xeLlCkLbxw=; b=KiBrqKxLqj/ZYogs4OCYIBDXfkmLyl0zQdf7+sl6
	hxufwOwSkMytyCfk08Noe5CVT4ym5A/nJjnJTOniULfV3G2jYOsTgu2jm/OCodxF
	lyp9h5Mv0N9Rd1bdWjKg2Ck7SQjjgDPVMkb/jqXaRESyuAo/tFpZWs/eEOImcn80
	6mUYd1Sqcom4w/JIPAA+j49vHD9YtXXru+CauIRn1LXrFyL8aMtVR09WwMiyPEZX
	JVdnqnsXaYSaH7BPHuqoyS0XKGSE1yraOfSvDbp4b6uwxglezrMbPWkbL8g25Kq9
	J/ihiUxqPqzRj8a79eskLLnXnmeaWeLYNGKrYbZLGiDACw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1x9d9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:38:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e347b1a6c7so1155407285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695516; x=1754300316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymQQyXq4R8zra2CrX8sKtX7ExyNAkEiG1xeLlCkLbxw=;
        b=hvc551vEaiPxcSp7mpObHMP0v/dBqM0EvYqCqUcPJ85+M/pMUy5ebV+fRQAjPeqfaT
         tdEj0t/tUgNQ0tLf0dL4xaLVnnVvo23lKP6ewBbSou4gkGp2UdCQN/Y8fDQZnm1356km
         UzDtwIPLUfrAQTJkWj2fzGK2POeO1BgCN6KAzLBznE83D6IrqweGwNFg0cTEGXEmT9a1
         NzV9dPcPqCJErfk/SSeQ8+pjC6Iru7vDiDUHtist3TpGTfKxTdh6fCrOehI4e+4D8Q5+
         qFASy+PdJdpbraslPaE5FsoSezO+oXOF7oCoo4m+rFtjRFX09ZbCGgf3JCypegq0E/7o
         ZnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNByE1MtaPKj7peJalSq7gSi6gJFBPLhdeL8rR32HRR6aH1+uphuU9FC4moDDpjJ9u6/DMkfEt1JBMUb93@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ARkvCxrksm8PocoeOiULjsYocla7oGulZ85MIMT49UtePT/3
	YElOcXAaHwkx16UaTNIy6zlTV8xgWwHWgpJo/lUks6JZroqQ2oW39MIy+hqXHkA9YBjv2jenI22
	2Q9KCrdkckXygGd9V8UugFZPUJh1/QiwJ+Pbtnku0oOkPHr5H8FZIdD72Yh02X1UsbuHi
X-Gm-Gg: ASbGncvE/iWfjv3ifgBIcEumSDhgh2adAOs+/73hEnw3GbbgMx+abloEbhi6Je3XR/e
	9z0FLgvGQSR9OdzIBVKlin15jGhlFfASbmnCC6Ac+393lNIbCHDpeo0UuXC6OfTJ8qujHdZB+Ri
	LrUNtbcmnCdkoAeLtm2cJe9uHZx3CsrDxoLcRaZA88uLCXE/iC/VgFSQPdoU9xw+uqEbuCBBax0
	fYnvENNtZpveA1DOE/nZt2idXBw0miOjOyEZR6/ANw53D28Cv+lfUZY5RAFJIfreQ5Js8xEVcQ6
	7X6hrabfcDfEdxJaK8Z9Mt/SkrX5Lhd3ImGmatVExSBH8t5kyt6U1sqWPlqKam0mMEJuTUCRj06
	laxp/kuS1pfvcN20WNpxd/WAVNkOMwQNlKLwboKdQQvjKeLsI3tZQ
X-Received: by 2002:a05:620a:578e:b0:7e1:9769:97c4 with SMTP id af79cd13be357-7e63c1eb5abmr1168011685a.47.1753695516307;
        Mon, 28 Jul 2025 02:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG10kGOUWmTQsYTevtsiVFMLYylA0uFADXbwe0E+zdoCeCvqpAVZeSZo0I49TRM/gK6+MR+fQ==
X-Received: by 2002:a05:620a:578e:b0:7e1:9769:97c4 with SMTP id af79cd13be357-7e63c1eb5abmr1168008985a.47.1753695515786;
        Mon, 28 Jul 2025 02:38:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375a82sm1222565e87.134.2025.07.28.02.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:38:35 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:38:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: leqi@qti.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Message-ID: <nbeo4uywsrimfjdvvire5lzkebfxddwt3s6wpiy4rurm5avbbv@7g64jdlx3hiw>
References: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2OSBTYWx0ZWRfX91pIUjw0nVQL
 8FVJUe1moRkVC8L9mFWsYuuf9IEzY1yHasdpLJishWQqotqd82LQ7GMAIkgfpfc+KXCm/oPYPzI
 6dyCwjo4Ly38LG4bceYb8IALP2mZNiDKB645WSBQ5CEtAsWwpsQpABBwenjhtZVZAhrvhFhNU+G
 7CODw3ZReEPxFIgzLZ8Xt8fnJ0gs3k2TcDBHjZIlutNwLXzSnuAlnfry9gGL3G7hXKmXfNHOc95
 uB5+o7aBgNvglc0/9R1Qll62ZP7Dsp9yoNTfgWI/LPaPpcyZoVdZO0zRp4hKpy+LUFiGAMfGUf0
 d5tHosvoRBET5/EUun5PqtFKk6XNAMvbNzkdI9A64uM4xK7lJRdUb4eh+p5IiExcONWb/4VHI70
 RV9BfsAvozwVJdjubIaCpQ3eVtPAiybdp5oGP5aKok6rs/Sqpn2N8NlmbPkBVodKC4r4NJF9
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6887451d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-V7wvo64C1hL35F_OcUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kvOTiVHUxplECj9FmAV7ORZgMY6fT9wv
X-Proofpoint-GUID: kvOTiVHUxplECj9FmAV7ORZgMY6fT9wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280069

On Mon, Jul 28, 2025 at 03:16:13PM +0800, leqi via B4 Relay wrote:
> From: leqi <leqi@qti.qualcomm.com>

This is not your name. Please fix your git setup and reset author (and
update the SoB tag) before sending this patch next time.

> 
> This patch adds initial audio codec support for the Hamoa-IOT-EVK board,

See Documentation/process/submitting-patches.rst. Please rephrase your
commit message.

> including WCD9385 configuration, micbias voltage settings, GPIO reset,
> and power supply bindings. It enables basic audio functionality for
> further development. Basic test is good in Hamoa-IOT-EVK board.

What does this mean?

> 
> Signed-off-by: leqi <leqi@qti.qualcomm.com>
> ---
> Changes in v2:
> - Updated author email address to leqi@qti.qualcomm.com.
> - Clarified that audio is validated with this change.
> - Link to v1: https://lore.kernel.org/all/20250723-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 +++++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

-- 
With best wishes
Dmitry

