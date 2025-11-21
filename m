Return-Path: <linux-arm-msm+bounces-82877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40643C7A495
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C227386BDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EFE3502AA;
	Fri, 21 Nov 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNViAVuW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ik3cP0Ob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A8346E48
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735956; cv=none; b=a+/Efw+3ERn2/KaL18r7cIUzgqpGBv6ZrECmNNvoQJJRfIeZ5dfpe2Xc1AlfTQ+IMTVC/+GHU7IIHYx7SO2mfOK6Jn56EiQkFYknoGnscZcdeXLx1fwlEHf8ljx5nElSYsGJ5t+MSXXlN5CL1pReHp3+hx0W1YLeRV4PlZeZ2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735956; c=relaxed/simple;
	bh=C2ujbzHakz3k2FGPtUel0s0om+iHTtJ1DQb9RNWfavQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShC0b8vXzkNqqBa7Xstuwa1rxSem5DApbwIayUWw2a+2bWqZoEHM2JAicjRlYHWWt8YzW00wonaLKaqDkPE6/+TCNfgqgUqBgxFZrb2pqJ+SZR7NKgBUb94rzTCfQ0uTij4nwAJVRd+cTt+LoiFL5IE44F1sMR6iGnQESV+A4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNViAVuW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ik3cP0Ob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SY5E3541426
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sr0hVkOXVGypAoFCY2ssxFetWfZ4bBT1gLeV6S+nVjg=; b=YNViAVuWfjDb14oW
	qgaRoNezoE7POzopCRuFtt9tnl3tHYyFM78T3d6xedJZBa499v5suJGewPhu48T8
	kHbIbKew7aZ1v2Lv15drGaq0IRolQZg+FM/IMw4Er37XLHF7j1gdD/rDxsK8JgcO
	ettFdJxeZipY2G8bCASulzdL0NheXOn50pRu4Kr5g9eJCdiVba2EHkiL1b58OBbm
	ApPZYPC3bw/1DimPMCFM8Nttx2Ixh+gjBVH+YURlRyef3I3qvFagkMLB396uUCDS
	CkrPEw0qN6asQDJLz375CwX8K8JJzBFDyGpUwMnzH69TVGXQ0Scnvzvq1ujeqyv8
	/J7s/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng00w8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:39:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29f90f9fdso52934185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735948; x=1764340748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sr0hVkOXVGypAoFCY2ssxFetWfZ4bBT1gLeV6S+nVjg=;
        b=ik3cP0ObifkgjMsTA8v0rOcZCxoCqZKHZP2K46Nxa5vaEeNrS5fG5ct+32PgvgbqQV
         rC02Tekfca4ohKKd0NhN1EECHOuUyx5nzHgfjsYSMdOYjnh650PH03SvX++kpNtMAeNT
         tMzsQKPs/Xd5yUFMJjWQCuaZQ9QUC0SiB7l7tjCzgPQQ5AUuypYQaVNGwxZf//TPif10
         qHQuItkJqAp9Feex+b8MPei9icRjbP+e7Lwjit12U6x/jjbSbDlcsXUGAZFVEr34q9E7
         qSMiTZUfJpbP/tCmZM/7wtZCTWKmX1ETxWPb0bJ58PpRRCghwuc1c5A1IJeo2MZDeBxJ
         sK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735948; x=1764340748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sr0hVkOXVGypAoFCY2ssxFetWfZ4bBT1gLeV6S+nVjg=;
        b=H1w39i3egDKT51dTTC/rz/72sx+XqQ++pLZhQGcyrQ8OKQMshYTZ/MuMwKMEnoBfKq
         33J03YgOpQ+dZ2+UP586gerMNLf1HXWXwjFZNdW4JsGjFinxzaL/L1IkAo5r5VN3rxG+
         LjqoY9jcZyvFpZl6/mK1OWCHd11IXRzaMzjFks4M96CpF+U0iptt5P+EJzz8lUkS6R9C
         DqekgnadTExaMQX9KcMzFT4jFlYrHV2O0nqyH+S0QNev2rgNeqNuDHhCqoZIWPpV97ul
         wlxly/4w8C2PsQ30LPgKThBdH2c2J/Hmk438zfM2H3za8zaozy3l+BBPLmz5pe0WIo1g
         iqhQ==
X-Gm-Message-State: AOJu0YxtYzBc3HswEtqOHtQguOY6G7wmboOKkUH1gqtiD750hzwMKswX
	g079snJ8KqKnEx/KShxV/7X0zp3YuSnZTo2zv8mdpx8PyKch1ulIlvyscL/A5dAsd0ew3zbbw97
	uRTgG4+nZsUJVe13VjprET79tkhH3exblQJI7xwAoVCnWfbMxIyhjBszdW04UhXF3ULhs
X-Gm-Gg: ASbGncv1HDnffqa2SLG/g45EFHDliOkiLua9qkY53S7g/j6eXHgscryvhElHD7pyEoE
	lvVSsUTlMyLI6WC6yRBOGbUNZITYQZbOLD4Rsj1Fp+hITFsn7PM7+rQlxlgjD6PcfF6G0UeSicU
	g822gCqXsCOVom4DSsEWMQDeb+89+xJQZpr5ll26lVvjGRe0Kg/ACYSIyXk1okbe2O5sp0EWpSj
	mtJjqFiJTz4gJZrkV0XWPL5hrQfLM6zIFKZBK4MXCR9/8pJGJh4XIIVVWdJIagDfnNLtvG9cqvQ
	2KvT88STtrJTTL7zEEP8RhTETXSqmRqwquvKu/7wVT+2eaenRtoWoXUiXsoE1fBlFbzZF3A5Izb
	BpzGUCzCBa7UvCb6gX+7ODu6gW9CZmN5bh4OGm9bZ65yiDbw6+gRenfoPvrt1avfv9sE=
X-Received: by 2002:a05:620a:4405:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b33d274814mr188011885a.7.1763735947756;
        Fri, 21 Nov 2025 06:39:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf/BP+LU8FzWhiCd4ND5JO33BI6Mho8KB9Cn73hlIfVcoLhEBrxKfF2LJJslfn3fHVFKyZGg==
X-Received: by 2002:a05:620a:4405:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b33d274814mr188008585a.7.1763735947256;
        Fri, 21 Nov 2025 06:39:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e51sm476242066b.42.2025.11.21.06.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:39:06 -0800 (PST)
Message-ID: <b67e579f-1bf6-43d3-bddb-caf2989086cf@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ARM: dts: qcom: msm8960: expressatt: Add more
 peripherals
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W80Bun2h2xuo_plO_s4vsInGlgc6JP6M
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6920798c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CZU3aQCQu-085CoM26QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: W80Bun2h2xuo_plO_s4vsInGlgc6JP6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNyBTYWx0ZWRfX+I5XZqab/FXz
 XCFTx00BkiLMxPzVwvUe27rZnLN6PvSaVO7F+hYaN7PM3/P3YCIxFko3ai6s6sanABRzLdSzrvN
 viFEMT8VP3xvtf8p2zFsl97zi7UdKU2IOgYnzFDjNbfHrn5LBhqdaSUps5IvqKV3tVOGIVZcXtT
 iOpk5GNp6eiWKBNPLNqy8xh1gMKaVP0Qj3aUa/BFXEWVfVF21+YYxJme9fgrkwvQCXWGVTvne+L
 nsJSA+e/o8rCXeeNuxFQJ2KCRyrRtYckSOY3neO8PuaRxNbecrz54oPPQ3+dB22vWb/Pb/P/3ct
 kJS+eXuuCotcAutguRvhtJ1jre0ZiE6iTiPtUa9+3u9zga4ovWp4MSZwtYov4l/FJOiJ71/Kp1t
 AlmH+DhVm+udGW0xen+3hzpkSaKhGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210107

On 11/21/25 12:44 PM, Rudraksha Gupta via B4 Relay wrote:
> Intro:
> =================
> The following is now working on the Samsung Galaxy Express SGH-I437, an
> old 2012 Android phone:
> - Light Sensor
>     - Proximity is currently giving bogus values
> - NFC
> - Magnetometer
>     - Maybe need to update the mount matrix?
> - Accelerometer
>     - Maybe need to update the mount matrix?

[...]

> ---
> Changes in v2:
> - Fixed formatting issues
> - Use GSBI instead of i2c-gpio

I'm assuming this worked out fine for you and the devices are still
fully responsive?

Konrad

