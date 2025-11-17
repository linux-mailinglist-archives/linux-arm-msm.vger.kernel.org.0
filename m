Return-Path: <linux-arm-msm+bounces-82084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F03C63DB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6798023EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F8627280F;
	Mon, 17 Nov 2025 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXPk/iRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgMEsdG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70901D5CEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379534; cv=none; b=oWv3dsQEU5Byi7lUIKBNH71hlXD1nmWZJ4FS2104EqT8aaIj9fEUL2rD+yNvJ5BJl7YJc9nnCFUbQTd7JD/72fGR0fsL6NHeM3/eZhDfMX6aQZuxPfFiaeRZmhfus+PqcLPNZSyVcAxgROoqdx05CXO6PCQ6arCprvN6dGP41KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379534; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKGvv2I9xvcxGqg72Y8sl4hJXqz/hBTRKtJOAi7NK+io/tsWSuS6ki2G+1yuCfTL1ioyp4pFyxrx7k4M+KYXGRMdPEKpfJSMzO1aKCfhSOqrfMNeIlIYCpyvmO9iULGzbfnN1qjxSgnu0f4GzFliYwAt62dlZvweZFeLLvsoSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXPk/iRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgMEsdG4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB6ErC4108034
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=HXPk/iRHH2Dvx/9+
	wm1hZtqAHvtsRD8Cy1hhjRPWAOPn+VfVOko22+m0YVnlgcYPokxUDPeeJv+n74WU
	J7lnQqXTyGkE7e4Vzq4kHc/Ehb9LHAs3X5Xd+46smanuRMtAKzHhy20Xu3rxd0jE
	adZmH31G9E3wDIAzryBUyL3P7oZyOcid6SgTN6dkk4xosLv5y8lJETFO0rhHAvx1
	bgoDVIgM42qZ+4zZBFziHtoxcPoQcEg497whzT3Nei/ihbJXTKtg+EC/zcxsSMgT
	r3Lp3pD2X+RXhYuShdEzj6HwE2JUulmvyAZLGArGhNlCFokVY9JTyBSxBNF4zGiG
	N7miDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp82mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:38:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so6247571cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379531; x=1763984331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=VgMEsdG4u0bLb3Z705oiJYHOwNlaJaQMBd9xywXN43nk3ThGNon0Pt+dyp8BeM4P9B
         SHUAd8PBiK7eh6T0kBYPxZrwXdvlaPIJTIjUslZM16MD8992DtIfBU/dVITbhjr3jWFC
         56UW8KZP0t9sde4i9w3nPZOyfTVgzxl1sgPOTuwV3dnntbZOWX1MVPCERNxdEkEc8VPR
         SGBrmKg+NLoftdMwXVRXWto/a3pQ6jlFl6e0fSzbNkPXZaEw7eE3oILk10LE4UcnyBVj
         glowV3tS5JP14JQ8aVD/4W5fAJXnx4r2wje+54mx+WkE6Gyk04b/96mKk7yl4Py7gZjn
         +OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379531; x=1763984331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=ZfPQG9zsCO4NpDXq5dSR7pn0xQR9Lh+O/VTEbKAM9Zt5Vzpr068Wy7KTdNvYsc5FsU
         QrTOw6CHoXBUzPFN490D7XSfsaBdQOPvwevUATyT9UYleyFrwlQeKM7oJIV0TwNDNdAS
         dm17Pm/QCMTNTu40WaI/RfYVXbV22ufz364XBEy05q9qsfVVoA/+CSjXS026KfI7CJbc
         gwgiltbGyE+nTIXfU+8Fkv8VJBEWd+/Q2/HFKjICrQLRm8EE4TDHVD7erkKDyrkifKe4
         udSOp2zb4psfkRwPyjsGta7BcumosQb7p3/L0yA8T6Ewg8HDLcrS+081O+58G7hw53Hr
         DMpQ==
X-Gm-Message-State: AOJu0YyVsXux0HPoekILCe0v2CU2FhB9qn8fvs+usS0tFqNBMG8GCQGU
	u8Ueqfs2u2hn8U31nKWsi+E2P9Pafcvp8YFOowwVPM+emyZfBZI/ozeug417QjY/q/JH78SnQNp
	X7cbIt+Mc/DZx0Qwj9//P17LMXs5ET0TRP+KJGoXafAKVazN5WPVIxeKxDPLaPM8GzTZJ6jQqIJ
	+6
X-Gm-Gg: ASbGnctk8KqSANCizYKdgF4xDRfO8WbELk8u3VBtJiTwAOOLqrQfw3EFnyspH6uNPJS
	HpqPxn8xC4LQTz7ORpkc4lVgFa4ZkbwvflC4stLkZYg6N6MfUqMkVsb5dcDGUUQdRNUGkm+Ys5r
	wc8vErzREv1dt6hy3NM9OkpaLUIbKmVGByRBP9Ap8nnj/vWf2A+8fci3NlxWMLNgTfqezcr1ybK
	LMjx3tICpP/HG+L+8vVJkLt6vnSKsS4DohWDq1P7crBmE7dLTgslo+FEx3aL7q0SaOt3hXIhJGc
	abPdnRF3mSU2f5t0aHIAwmM1hy8VqgcqE+a9i1H2MjKRQr6x4k9I3+DM136BzPMt45bEu0+KSwF
	zoHOaALFMskGF5+VUrvo5FnM7ld8eae3Rt8lfJNY0WRJc3Dou06Dj3wA2
X-Received: by 2002:a05:622a:2d5:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4edf3632a25mr109867781cf.6.1763379530723;
        Mon, 17 Nov 2025 03:38:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeVNmN18CkzG3EqPFJTl/rIftnVu0Q5wkLuEO6o7Tw6zrVjEg5KfAyQyyPQlx6XBvf1k3RFg==
X-Received: by 2002:a05:622a:2d5:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4edf3632a25mr109867611cf.6.1763379530360;
        Mon, 17 Nov 2025 03:38:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28b0sm10074933a12.30.2025.11.17.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:38:49 -0800 (PST)
Message-ID: <1d59c3f3-7f3a-47cd-839a-fdddd0502ce9@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:38:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] soc: qcom: spm: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-9-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-9-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YYQ-oUF77lfZuh7qTkE7k4Pf9_9Lov0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfXwigX9+Kq8CF9
 HTrhjNg5SsjrAYCBA5fLOF6EZkGa8NC9Z0Qtj6IfGsfBXCE8/lcZQP6RqNiaxc3/rp5tBRw0jHe
 UxNT4S8wzw49Fu87sJWXTCwAgPksTBvdm0qVvG8HoA5Z/LMo7zgaPhXip1mDb577iWlevLFHAPA
 zp9dhbY4nGtVwYpEGHdaqOcBrBEMDIMSGzfizk6UDJR5lAZFQU0IK5imyQjC/GH29OuK0NlGnrq
 tPieM1uuJsdsANazAZBHKvf4PvQnNnj2HDNdhB4I+Q3Lu8xY3vGZmEC/uFC4radiADQfxDVitBY
 lu/eeylxLoIgFM3QgtvAdwv2QKGsOGmICfn5vZpy0lsmnkyz3d6V+lnCdOvZ5ZqaR99aUb6CTqM
 tiNxuvjI0BLu8rnvexo6eaH0rjoSIw==
X-Proofpoint-ORIG-GUID: YYQ-oUF77lfZuh7qTkE7k4Pf9_9Lov0y
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b094b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

