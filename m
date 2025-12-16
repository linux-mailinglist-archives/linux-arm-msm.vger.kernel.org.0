Return-Path: <linux-arm-msm+bounces-85335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0ACCC28BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9C7D301CC5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FB73659E7;
	Tue, 16 Dec 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doFcqeEf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3BE4x9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20113659E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887008; cv=none; b=MHKlQFXEUe+bxtV1gWZXfgKNhEEuYKXhXVLmhhhVbMzrlon+PH+1dDKqiFM1tW0IXz8avv6QOUWiy4BAHHqAfZxUprcF6ZN/EC1xNJBcHvKDAMVVCnWcG00ItR2mi1DQH0pCQhN+MyNiuQ2uJG0gSblAErhoEiEq6h1O2ZOlzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887008; c=relaxed/simple;
	bh=2Ng8otDPDABpJwJ9f2yBpnv+lm9Xsl5zOl56SaOeJZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeYFez/TpqMhBa9ReQpKQHURiJmVl75nbuAujThAQAA12x6jx6BMDugIWj1PjVcEUCplKgzVfW82aiKlwBScj9hbvCUkTXN0QxbWfWxPSWuky5OTCte02VKk44ozw/fZcS14CKjT4b2ov5wFAe+NfXuiVDYpbKpr7eGMK0r6oV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doFcqeEf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3BE4x9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGB8f5Y3872460
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=; b=doFcqeEf+MNONnhP
	MR9kNQgOwMo2baAkxyeXNu91flf0RAbd8tENzt2Shmd3PVndwwlfykA0cdGh3o9y
	VurZA4Ym9JZsP8f7z1ecYBNDZ6550A9ff0LNZUjwfjyWGcroQf2dJ7VByzifBdiL
	UH4Uky22Q4UwZUkejP4tmnKvPcNJlxpj9hA6dWuO6/FgdIodHVrTF+GCrMFyI2cQ
	zqnAQeW/QSB4Ljbns8mJgh2c6TZ0Y7OBKqX/WZbFMXuhuUjOAX+/R8ItgJ37hK2T
	Cr6k4zY/kB3qYavGvxqg4WsVdcdsyCW5eVfLP/QWWp/SIgGfoppfg1R3my8bITxg
	xBmLGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b369w871k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:10:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so15763501cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887005; x=1766491805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=;
        b=Q3BE4x9HecAd/ynYMZuagvma1fKLIrebHr7kKyBpYYNkdugnG0iD5F9IMod0AGJvGB
         yFL+tmWMQvfcvuyQUHgs66+u2fwrsP22B3uNOMIzM8xphuhwp9jw4ooOxXVzimNygaDr
         1pex0MK26EMHotULmmqnp5RwIw6f3Nk/qIinC6AGewivEaCx59HsiPZJ8a9FQblr5+uT
         70txL4qRQW72sNVZMJ43T7nb7/+K61RGCZSKuICwaCoR9xrdlacLhGs72SvqOzq2/BQJ
         LpmFoXpBkP1RxvfepEknVdfoZjCn6LpfvpCAhPwKTjnzI6DUzfUB/KKob4geaJci8LXP
         huAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887005; x=1766491805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=;
        b=j8nPsepepkS75+t3p/Kijxhb5n8mwi5zBXzplfO+sTebHh+glrWBueaWIexjXJ8NXt
         3C+MV9IGp7CoRB9v1c2CGpO77F9vB872M9IXf9WXHvm9jhKCG07TvKBEoOhhL413KxEW
         XvpVNJUE0IBEBFQIlfpoYXM9ijdCI7rzLsYeVn/1G8A0j+3l/xsRkIO0fd6Rx4jGylag
         zEKvFzXDP+z1ZDW43IYFu3w60txCoSilqUwX2qFNcUNyMiz3I4HBVjgaOB+M/g+p7ZFf
         HEGaDZZ6FfPzLyYEC8+rfQR1QPZLY4aJL/PdnIoCqJaRv65BnRcYTnBhc+9Afxm/Y+3G
         wpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe/xCi/55l0ArJOVuBF6G0vDDZxbMHFta5MY7mjpv+ml0CZ1frshrwWt9m2Y0zSFChoqwdPFmbSMQwxrRe@vger.kernel.org
X-Gm-Message-State: AOJu0YwOuCZhZ7ANB6r50dmTVjPo4Ri20wFMVgmefwF8Mlt12kBCGm0z
	luuiRSxeIHM7TbH24UEs2Qulj92vlBuzTBBRIBM1EDE2dw8Y8enXU7j8+/sH6TBrircKSUXdA6v
	Q6GNbWcjqmAOV+HGCdlEXN1N608PkTGMlMiylJcsi6oElZkWEKXxto2HFNpxYoha2UQuT
X-Gm-Gg: AY/fxX5thrODtHvWNWYt2tz7BAOD/IVu4JxWzqStE0Qpoug5TsI/ZyF8wSilCYsm5eK
	pDAYFWCzqK3yppJVPDZ+r+7HAqfZAQSTk5HZL4R90vj/CNoP4wNHEPhP+7zyBldghlUMcUDd63q
	raLWiAFPlKbvgRsJ+G6xMsepaQYxzhHu1gimXMg43JRtasaLQhJVWF4bjYf2RYEtDuwjQB3dTDC
	dRQ2kQCn4tP44LvYjHR7FhjwGvtz9slAT9vNg71n+Y6mfwpo3vjAUIT2klwTWdxuC2E5zHTaKig
	yrxvzW8+Nb4Bah+Hrs5TXkDH9piQUmFcRR97zH/RAJcTFoveXhj7+JWbe0/qigYOPoACnQHiLXQ
	AnyQ37jZ90OUbCXQVluVLrVfNH93j6InF3YcxYHIZvIw28W9VYW5QvsbrmG+KO5r24Q==
X-Received: by 2002:a05:622a:5cf:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f1d0520a7amr168791831cf.5.1765887004953;
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI49moqnLw/Xuz0GAX9vTq1WwwC3hKc0bhx0+EqN56QKBJaEA+WgN++Iui7m2A10BQEI5kFQ==
X-Received: by 2002:a05:622a:5cf:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f1d0520a7amr168791541cf.5.1765887004566;
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa3456casm1637491466b.30.2025.12.16.04.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
Message-ID: <5cb03638-1db8-4681-9504-80654f32cd83@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 EEPROMs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-2-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-2-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HrvBwXtrzpy3RlSal4RyCL_xXewFLmH0
X-Proofpoint-ORIG-GUID: HrvBwXtrzpy3RlSal4RyCL_xXewFLmH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX5OyPKwioLh/7
 eL/wzl+lsV/85isuWWz30Fbe4aINLp5XwZTZDA/OzsylvzWm8wmkOuvTOxG8jDSbO/KGEZhbY8k
 N0+VqbIKv/CfqnS6JsaqgU/XAAeGECJqXxuFsas6r3hCUgSOaF02t39ExB3BZxipDlkMjBkQxNF
 m7ByB/c5WSHflBcvCyY2rLia5uP+KvISzb4FIpLjPmDSttxSLNWUFdh82Nbn8MMLEAlfmwXO9O6
 stonl9VlFfE7EQP63wAasm7Qso8LgQJEOJ3eS2J7d96GKcmHpvb+cJqf8ntrNwGmzSJEgk0dO5B
 TLilMF3AKGTeG7PMbzYzn2bOHpnx+uMWtQubIHDOJNaBytam6GlbPu4UXJeknmM5nIma+XoKFTw
 CG7zLJp994L5mZw7qrn5MGA7WvqhqA==
X-Authority-Analysis: v=2.4 cv=MP5tWcZl c=1 sm=1 tr=0 ts=69414c1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gec2KKgFD0QOCAiZvjgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Add notes for the EEPROMs found on the main rear camera, ultra-wide rear
> camera and front camera. Also add some comments that act as placeholders
> for other nodes that will be added in the future, for the camera sensors
> and some VCM drivers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

