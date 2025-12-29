Return-Path: <linux-arm-msm+bounces-86849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2FCE6C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50E873009F5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0852C31DD86;
	Mon, 29 Dec 2025 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhgHL1x1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+ww5tZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5B31ED89
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012905; cv=none; b=nWy/B859Q5Sg8wKgxL40Ehr9WBGDFstm5pICEznykk7ZMQonhsq9IQeHdBJsC6YFc8er74CWVO33MfdCOAPXX97f4N2AcpN5pzBWPs2deLjQ/rXaJBc6OLi89MYmXZrP8ZH08YQpmI2CtcRdXU9nR6XpO3u0gX0k4Bc5dGKPB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012905; c=relaxed/simple;
	bh=rN8REc4oSXbULa6ZoaAoJNGCRw5BcaG+TBTh5OINegQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njN8pLVPPxNO43JbmJUjsGh1ndCFSfodgYqQDz1NG7zJw4wy8Rbc40npaqkMih0aXVPI3wyblf/+liKOoVIFogoypU+rGTzQIT1fgoIH1/vVsyTL9fY87YuwusJYAE5hTSrroriO6La76YoodMrH9DKikz0qLi36umFp8OE6gHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhgHL1x1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+ww5tZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9Twg53686954
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jA8QcHtW7HHVoU0EfRb7gxplI6JDHnTKD0S4pa+WkEI=; b=GhgHL1x12JPvZ6k8
	8ZY89rYiOsJ57+tzFHtWgXHKmaSF7lPlZ5cxK84ilTZJcFjgGeMwKEUnuA1dz4aT
	e3j79k8J7XXJo4CtjOWaozGE7ZSA4+vqzJR1dNIBkiyo8UJiTBVHlynKd30dGePe
	hf6dpZKm0xAoJ54RHI86Gv5k+zZtAeNDSXvG7JBXrI6BIn1UFVHV8XyvE7ommokA
	KG4zCtzAKs6uJRDVpXj/Q+niMyO17UyKD0NYwaqtUpXVhUIhx3E2VnTUCI8FEcQL
	vRCYYVNoJv/AJX64/FHYaFhpiSVAlJL8ETJ5JjooUmKY+Av4THPsexQmQ8NXG60m
	d7O1NQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsccfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:55:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so29870191cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012903; x=1767617703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jA8QcHtW7HHVoU0EfRb7gxplI6JDHnTKD0S4pa+WkEI=;
        b=Z+ww5tZHWb5g5HT201qPxfuiXMo+OJ1RTS554CGEPzPK/LJbhGRBgOhSI74EoSQKgB
         6mqYciOX9aMsFg9dOoYNxJDxXl/OazaGdpZQptxONSUHdbQKBZPakEi2rqcDqJ7Y7fLE
         JrF6BS1WmdjpEK9BRMqPZDRDexAQfPm8/NRAvLq5yUdZHYLRB9sxIkzFKt6MLL5Vc8kr
         POnpjPqtA73YFrFKRofoSzw50HOQwy+kAwviOLplwAZJcFQVFPMJ310yjEd8hOflOrAC
         54hm+i3A1yBvMbOXrYZbbQaykZm5q+WQR7oTP9w2wPYyPiF42zOMZmmpT+Ast6zJGuxj
         VLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012903; x=1767617703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA8QcHtW7HHVoU0EfRb7gxplI6JDHnTKD0S4pa+WkEI=;
        b=J0wyiCz2iSm4YeRSRJcfKSY8CcRpusVZnSmrlNbTqYqS/vNg01KkSEsL4oISIP9HFI
         1m93OTO8S0Lg4XiloLowvmnB+zSnZmj9lOnIXptDJW+tqi2j/ItlAitPNz51MV3zG5XC
         oIs7VP6JsO/zBp6yOA75PwWYG0EUBqWvvuY3SWOY5Gf1m6sNlA2CuhPSV5Yxr49s7mtG
         IkUI7MoXLzRZbtCAdCDLmvvvny/2B7xsQPKR8tJx/8TPrI1k1sgMjzIjW5Gn86Suw17G
         afyfJd+Q6btEnpO1jfdwo/WXCV2Lk6c6mgTuuEKlirkyLND+0wiW50XBUsqfRdpEyLgM
         Ypzg==
X-Gm-Message-State: AOJu0YyQ+iOKmYMPYNEHzv5UWSkHZK2mW5JBraIQ7GEQUUI7xU2lhJ4J
	97oRAF8ctowjF7Jx/3CqOO99nh3iS5DFIAVP82XOaX9/DdASz4Af/Ea3Xpg/yG0WksJRM/q0oTs
	VwveCRzSrXWGS94PuATHdC8uZ4+wwNFcAae1cbY3YN9cyPvZCZt5FTPhrAVDSpNsFnMYR
X-Gm-Gg: AY/fxX7NKxQL4GIiX+H9eAvg766aEc0rHu70O07BQjZO6HiDFaTePhOlD8faCaH/xju
	hVoNJwE7JoHCMLQ4bCzvuY6pClqj4WDXEaY8VnUG/FWKhUj9xuw7gwF5nlJoIgnqdLdTN69WnHQ
	stBZXPSvClDRhbAFLCdVFszT1HqCRX4SRjACdbuZZeYycIeWwTe8Scm0GWwV2/Jl05tmDNNUfBW
	0w/z6IpBd5mYOTJlzDCyAh8JuG5Hhs1QTpS4qfj5AF7DA515hZFI5hX7eOCm6qD8vj4crSFHrAY
	eVf5m7sV3q5CIBo3RULDoZ5PVYegyS0e+E7sgFLCm47sETal47WCnvELnMZxUQceHoQFPHOFWAM
	fm+CuYtUWdcO1YN5Xtk/wn7m4npbQ03Lk2gbnTC8uwU1EeiRoEOPcD+VA59bJ6Hf9Eg==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr339489411cf.0.1767012902636;
        Mon, 29 Dec 2025 04:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgwl7DckFtnCRCijgPOaaCcklAZK7Ymv4sZDQwpTGIlBx+INb/9SMIIJVkUk3iIhDqmoyrIw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr339487211cf.0.1767012897392;
        Mon, 29 Dec 2025 04:54:57 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm31735914a12.29.2025.12.29.04.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:54:56 -0800 (PST)
Message-ID: <05229512-f138-4d97-9f90-d83ecd47dd3c@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:54:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct
 firmware paths
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251224-fix-medion-v1-1-305747dff79a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-fix-medion-v1-1-305747dff79a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m_yvGfZuPBvETl6MlYw1QEbrohaxuDVx
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69527a27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yDUiu3_GAAAA:8 a=EUspDBNiAAAA:8
 a=swqk7-3mBDCmWSZuQGEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-ORIG-GUID: m_yvGfZuPBvETl6MlYw1QEbrohaxuDVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfX3HnD89vBUhGX
 KJDSoPYHIXaKgeuKRj78JtoZ4V3AggGkOSAOYPdM1CsCH6XMwpxsDbEEXqfujMrw03siB98ifef
 3NxkdeNgD3sYOdR0b5i4ijnBCNB6oGBSjIj4fWWi10IOxVYfZrx1sNKFK42bVhob/p92HwqIGyV
 PfGRQBdWJgZRZ8HYSWVddJqkvRZkSHSSQkNZrg4KHIizbHFGyKpEanEPJ6nhwGLvWRwRQJ386kQ
 w5rM0I52tMXi9T6yN0KtXuIwl615ekau1CbQ61Oc7WiDXKG2OyWw79gVpcxsNmq2GUbojr+/teq
 /1Igk/RXlcvwcVmjIL9oYlQ17dIxqfLB9md3+WT5qI/SFT7m3RsHUG68LSqaNQbE0GjJ/HCqCnp
 9qearN6zji4dk1HbBEnf5q3V9CjSi3OnGEklbT0sGwIS+p7/ABmzEhCI+VRtHXtYOdc2DG3ethG
 ypiOIjgGuRGps8ggKhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290119

On 12/24/25 2:09 AM, Dmitry Baryshkov wrote:
> Per the agreement, the firmware paths (even for devices not supported in
> linux-firmware) should follow the SoC/Vendor/device pattern. Update
> firmware names for Medion SPRCHRGD 14 S1 to follow that pattern.
> 
> Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
> Cc: Georg Gottleuber <ggo@tuxedocomputers.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

