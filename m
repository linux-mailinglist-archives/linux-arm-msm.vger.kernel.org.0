Return-Path: <linux-arm-msm+bounces-89287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C08D29073
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 23:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47EB2302A94B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192BE32D0F3;
	Thu, 15 Jan 2026 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGfrPDJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg4P78PB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976332FA2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768516235; cv=none; b=Cq99jC+pDP4bXniT5HCC1KLbuexDqpkxlcvbVHF1fRmCVy0gkXJ/b5FtkbrlcuzxQk0PFPW+2c30FS2D+LRz6Ah2DNPxjnY8PY+mRl81TsKJHfO2TWdkP2IVNEbKEVCXODGAan/3suLqb+I31nA/0+MFCgg/WAyGv7YLVUWd3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768516235; c=relaxed/simple;
	bh=Q1ztBYZHbeuHfSYeh4P+EVbAsMT/PxPj5sxkIr1hX3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ajlnzz//OQB3EoeVW5dvAF40xlx3z3d6uWVGKqLpTEglM96U0igYh3xan+meb34fKQUdNfS7d/m0uZUURN4a9sZ9V9x+yKAa796fIA7M8jAjd8rtCOWGSBdwxouqemd6hKbQnm5/IwH2u/tOgVrHe75d1Z/aB4BGmGjDixDPiqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGfrPDJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg4P78PB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMIXMw3030438
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=; b=ZGfrPDJCgCWwJvNj
	hcP4KgxMFEL81528zd9FqBDLEDfbg8JiPI2gwhtJH+eONFYsck1FyJzBfo2laI00
	NjCEuBG5xIz2gne4zjurmMxzNMFEj+4hn193yEHjxi+E3BJqxcWhV37GYhgLZIgM
	T5YmTWjLzCDIefmbFNr/bS6ms8SO2esYb9BHlbabAoADlRpUwaWOFviFXDEfTm1X
	fl2SXfCNw6Hv7e7YAdLVIHH01FssSve4EtYDjJ37VLNJ8HAw+MeRwC56jFkvnCkM
	efbDRSL8YNBS7UOWpBnHbiglZRAvzWES3P2kx8tbkr4PK0U0G4DASYNHKlMv03u+
	331jAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh9egm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:30:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2adc3990fecso1004653eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768516227; x=1769121027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=;
        b=Zg4P78PBN+QJD4kVz++/5xPkyVQl6lOAIKW5m0fqbAhE9Eq5JFRLjaADQWDvHDYVXU
         FLtD4cp14rI9DnLVAswjiNZfRFcgTrGREcP3IbNJXlJPJq6veYJQ9SpV01IzIWS+Pm7Z
         z6I03PZCPX0pa+dW9PCENdcvsZzgzb3QqLEMNPr7Exn5Jgl1AVCaFG8uyNnDqw2AL90T
         1w3jy+oxwJ9eIvP3FTIv0Ud/6nEAKhqg7+tBV3Sg4JpA31A8YvpodJCvbWgXe72YdjAE
         fbYsffM4DmH1RQh1DHwYWS/F8D2y8g3iBQYVH32LqlraK4WUB5SM09jLOoFRvxlaAX8K
         cPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768516227; x=1769121027;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=;
        b=s4gS204VgvDn95u9Iget8AFZwObfAWyapk4fa/zG0YVo8pi0B/QQAtQRP4VTjKkd0J
         /Y/pJ2eKyhlfqYu6GH1nY/4FkE/rnjhNipVPs3/2mMp7L9vVTo/T6hLz5hU6nU8thzTW
         vQz5htsEogcvzsQKtXr/8+4KNkeBIE3AAzQkaI2PGKuNiQhDvzZ6JgbQtdImQdDZ4RX9
         PC6aOwss57406q36x0mbXqlGYDS5RcXhiVzZ2yhsUg15HNpuYE2j/lz0mjATN4Zo/OqR
         RY8mkTEGynbHAN5O5k/zjdg4744GqyW2Kj9G/DkvV674bk0K5yBOWS9KJ05HHY1cSALG
         UAAA==
X-Gm-Message-State: AOJu0Yx1Znmu/PrXzhwtjztTyWWVqiN6T/IXdlkWB4lEPUA/QuNCdZSC
	rOFojTNd9z+4Y+Q8OKLfFVpRZcl6/8tJClPTGWit+7K08penRbF1bJ1RodqzjJfnTlgYttvsgeB
	iVwvTpXCGSZnsDWjHB7tms/L7I9WKFgRDEV5nT/L4tz4m9vc/JPvzHl0sHZfivq3OKzsh
X-Gm-Gg: AY/fxX6ktZRlxMuAhunGYXKWnNbqAg+py6Gu141zDC7dK1uVYecgvcFG4qFmNX8wiu6
	VIH7nDefkQBnLAP3D1FBdj81dn6p9ogadhn2UNA5K0NQcdmVxdIjIybVC7yY/JnDttB4GIV8hwD
	4d1JRZe06m/C6fEHgEmtMt8dvRdMHOHM1ibwydicomf6lzsX6CA3fwrj8d7uxnJoAFuVtSsvLMl
	ROkPxZrP19SNoOKE/dWrxXE99yoCjuuQg8CJuxJVY6d3W5n9yE5wWw1qbf+m5ymqlHYDsgZRk90
	Xu+ExN8o88FZOob5YMM1KSBhRM1YYTvwesViXfpzExsS/wISqC/ht9l/ytkyhKcc04ANEo9Ze8G
	IzltKtIGDcivdOAi6JbLVlzn0rttuGQoORvGAV7ucWKPO9teJM7P876FMGoqvYL//mv7OtrkfEO
	EJ
X-Received: by 2002:a05:7300:640d:b0:2b0:487c:7aba with SMTP id 5a478bee46e88-2b66434e796mr6726499eec.21.1768516225261;
        Thu, 15 Jan 2026 14:30:25 -0800 (PST)
X-Received: by 2002:a05:7300:640d:b0:2b0:487c:7aba with SMTP id 5a478bee46e88-2b66434e796mr6726379eec.21.1768516223209;
        Thu, 15 Jan 2026 14:30:23 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36564ffsm635436eec.28.2026.01.15.14.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 14:30:22 -0800 (PST)
Message-ID: <52b2b799-09e6-40a4-bea8-c7e8bf21cf51@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 14:30:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8x-YHNeVle0caCnZE0-qAqypJ-b2CTYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NSBTYWx0ZWRfX4f3ivbMZDPPJ
 Fmbu436VOq10Ad2ft7cgOQ8M5Hd6N9tmLVJMYmbV7L7Kw7aIv2/mLNm1hy5RsJ9byivvBZnmHvf
 O07Cu4C/puGN0jfViK5pc45x7giY17PbVaLAKYapNZh+t+0GbT9s2qOM4+qGwf+YocIgP4QI6St
 VKo9YEYF3jpLHSRg95oXSeXJfrFcRnUzQ/huzpkWOAHt6XQ84m4FWe9NLVmkDVoSTLtxbL3ep2/
 Sl8udSQuHZ1XdmY6OWp1w9NgsyhGCxNTM6WgdLyxBMtWw+/IJtXlMO4EcbetdHuwl3UjiCfDDqh
 orDcb3q4afa3CKBEFdPIS8u3LWK1WNfeBBiFinB6iGMFkJxEpE63SeC6gmfaaHUBS2a+n28UgrM
 yf8Bp1cXyANzSY2Wl5oCuk7ulmXNDdktqUlRVjd83pULld9qzgliki/JuSvh8QT0dit/CbTcLhc
 pAMMG3svjQI0t6OWrGw==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69696a83 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=L2C35plnZqJTIQ-6vfsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8x-YHNeVle0caCnZE0-qAqypJ-b2CTYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150175

On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement support for using powersequencer
> for this family of ATH10k devices in addition to using regulators.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath10k/snoc.h |  2 ++

My automation flagged:
* drivers/net/wireless/ath/ath10k/snoc.c has no QTI copyright
* drivers/net/wireless/ath/ath10k/snoc.h has no QTI copyright
* 2 copyright issues

I'll add these manually in my 'pending' branch

/jeff

