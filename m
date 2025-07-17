Return-Path: <linux-arm-msm+bounces-65458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D960B08D05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BB2218873BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB402D2387;
	Thu, 17 Jul 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyNRj3O9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6326A2C3271
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755677; cv=none; b=puU+JR2FHP1jr3JEUYVips4cf60MIEBEe70DSvNBPyOavbPYwB6KObcvy9qyIhTyt/pZS3x77/LmMLuTD1TQ19GRsyzs62Tn3jt46FT/IFZrj5dp46jaF56+wlHgJE9jPGD6iTLRTnqtkyGqVBNKSIwNG9GqNbFoweXDo4cCR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755677; c=relaxed/simple;
	bh=tvj54Ugf9mCR0aycZ49cLKLbPEjNF1NK4UB9hQk7Bts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rV7mYfKEGQ3M0ARaodN+kJVdIdxqR5v1nkwLOL+HKwqCnwQivItLs5bXIubjta5aYn4oM5RMrRNJqI/zwdGZ1IzxQL+MP6Jr5FGj+VvsN3UxS5pvl8I2Wh7YZKeTaLX+b94tdiXJDGZa4dqvBF0P9m9bOdpfpa4KZbx2A1a9kLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyNRj3O9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBUxNs032206
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0EtSnDYQ0MstT4xX/sUazSxxFTRJ/EGgAkOJJTf0zs=; b=FyNRj3O9OFjjwKMo
	Hg+RGVB1j87S4XjL1Zkpx0Te87MmkxQC5PYxhrJLa4gXvpNCzNzOtUZbFQ8slvFa
	RPjj50JoYPl7s9P+hZeUna65UhlpynBzvLUYrL4M0uQRZdOfF15Pg7XB8DRy4p7k
	1iZscRFyCBuMTrNaKhqOK4MfWpMMnIZfJxoAfQu/aXApEbxjTmlYAmAcCy7UdTct
	xJ5iXtOOvK+CKlYb7YbNpWfxEdO8Qzvmf4aAj3H+xON9ayfBRjQdQa0Nf22t2urL
	2Y7vQMuLdm7/U+adTDw1Z6rMtpQRtblWgYANYejWE4+5c8W/kFTYQfA4gaPwZ/so
	2X3FUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug387rea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:34:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab77393308so2228101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755674; x=1753360474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0EtSnDYQ0MstT4xX/sUazSxxFTRJ/EGgAkOJJTf0zs=;
        b=cH/eE+IPd20g0EUELwuEwpXVDnGXjz/TgdYRiR75q12DICuZobRb1KoyrVJDcwfYBJ
         tZsEoRpE39x3nFd2qymYclBSFV2zOCk2f+EEmEZhUAN1Fq22V8C1tYM+Jpk6qgHOGuT7
         ap1HMSDZQT4hvamJ+83OnPrTAKrMLC0LoLBJvuV+swWQ4XsHUd1CfXiiWMT6N1+abl61
         0twnfteAmv68LhfoSiUhBB2VpOubski6V00GWBQFJuxuZJ2LkmMQEo0pQGMdmqsp2DoU
         rwixJ8tlNeC0r/1LmvxzCP9/qZYmi6lmNn6AFtQ02XdpFFNztDrl2hqSw+9j1QSRk+zs
         AH7w==
X-Forwarded-Encrypted: i=1; AJvYcCVAFGhzEHIbJ5iNevnYE0Adslt2LuxzhDSUSxL184Gtmz2LSjrA7MZPEgslKEJshUiTf+n5UWB3j7+xhBae@vger.kernel.org
X-Gm-Message-State: AOJu0YwaEH3lgXPDL4DeGDLDV0y6c9NkXRIYvXA4TVUukagNCTNxX+d/
	UtVMfcwRxFZyEfX1TzLicCHqwGzsOkWDWN2++EocdHiTN77bfLIaq+lIjSofoAHzxNX9jSNkwFn
	PJ0O23biJh4SScJWEmh8jR00EpnkmqCu3UmaFujvhkje3L9v229pR0uwwfwxPqjvhO8qYM+kTXu
	T9
X-Gm-Gg: ASbGnct2zs7V7GQ7jcTVVDsj/0M+Y6oY90V5rjsmo2EagVmgcfZG3MlMES8u8b7j2EM
	nUz+dO6q3J9iVGAtMJsbzeprlWLwfh1PA5wKCg/MBeoVIse3Opc7g50617UJN25ZchtPmcZEdbl
	HaBvuXo2H/ktDOEDmil8Y9y/Qe11w41YbL6WVIJqjQCWcsNyd+leB0pkar2J3H8SOrfeCKWBNWH
	oyCLj7TgC8LMFEpkPQg1C7LW662NfczuZRjshpggxBK1AQ1Wa/eNVclC+E+BrmRcjc7ISqrtxrk
	ZNo+fHcHHt7jLpunbO8NxzZstaDi3c4VW+LlojGkO3xzfiHAGTbmZPCGbOPCiPt7C4sH7SE6rT/
	+6/MrMz1jRJYuItiiXJCu
X-Received: by 2002:ac8:7f15:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4ab909bb071mr40839111cf.2.1752755674104;
        Thu, 17 Jul 2025 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Ii4oHRT/NNq7i3cIAv6HUe9Cyd9qkoWu/kf/j1oMAf1VxpLFX0jnaIsgTckfm+2dKO8vGw==
X-Received: by 2002:ac8:7f15:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4ab909bb071mr40838971cf.2.1752755673678;
        Thu, 17 Jul 2025 05:34:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645fdsm1368246366b.97.2025.07.17.05.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:34:33 -0700 (PDT)
Message-ID: <11eafa2f-ce53-4df2-9193-dd6fcbab9bda@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMCBTYWx0ZWRfXw+XDwULN9AB8
 Nl40uaHppb5I+agMMZogvxUk/XrQSurdkcl5457ux5C3xpQFEfrOU2Gc/CsDRIxE1k0B87/wd2r
 PJK2q8lshSrohcoUCb01j8Ft2AuBgWXqLaSyZ/H3SWDoFcGIEouzek9WHPCfy+1dLpGVXB0xyMh
 rPBh78cQI4kxrgQr6xxSfRaw5a3XNJ5c/m17ivIIF89h1nGG7ZJlhaL2lJLYj7V1gJBRq5vM4Ox
 TWSMr555AhgF1nni42M2dND35lEz4UFkWHSZVm5dizu4aOiu2WgWp+1wzySF/scNFvy0hOhLLpU
 hfZalbA+mnhYx6NeHwehvYjJ/EgahoU2rlG3L6A0Q1zUsXIWNDfhYUMu0V+hKxsi/J0lr30RuuG
 T8QBVE3Uub9VwoqlewNoUXM/PjytosF7Tu4PTCMdB/6dVi8oOGRv9LI+P+1kzRLL+CDWqaxD
X-Proofpoint-GUID: b8WDm5cWGED8LX-yGLpcV2HG6impTjyB
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6878eddb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kyHrPkqWk3caiwKyUVsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: b8WDm5cWGED8LX-yGLpcV2HG6impTjyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170110

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>   --capture=7
> 
> Dependencies:
> https://lore.kernel.org/all/20250711131134.215382-1-quic_vikramsa@quicinc.com/
> 
> Changes in v2:
> - rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
> - Link to v1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

I got a patch for qcs8300 in my inbox too, that depens on this series..
Can you coalesce them together, in case you send v(n+1)?

Konrad

