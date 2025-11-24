Return-Path: <linux-arm-msm+bounces-83039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18068C7FEB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8E36343354
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DFA2FABE7;
	Mon, 24 Nov 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCCUC1tQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kk7w7xVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAB2F9DB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980404; cv=none; b=s+PCPjk1X2fLZMsJ43Bqep2M0H2M6hdfyStWySudyPZ1dbafCHqm6o0djysbQbynHOINjfv2YZZJTbOYcnRMK+P/Ud6bcFMTsZJgtCaegdC9PcqCE7NIN/WHQldHCUsk4l3I5YeZZmy0MGxqwEMwjEjunSNXzZsZIIbjcsesCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980404; c=relaxed/simple;
	bh=rwGQrTGfqAo8VsyubJvBZi0mJzUDt0rYT8dIchGYVIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAgdQN5/eWd7UrrkjQktzsswCsEGUw2KZVu37ICoLRLuAK0AsmqVhlu85TMQwGSpdLl0OTYcHVJbCyY92DtH0BYMJtM4hoe2PFLko2mbsPrbd0DQqF7qo0syN74EXvjJGsJ8D7krDDNRueGIkUe+lOPh3HP2dD3d7l1iPHfCYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCCUC1tQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kk7w7xVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO88alO2518350
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0Jm2grvSgkUN3rYx9rkJH6YHqau0g7/jl3IwGSFlUo=; b=WCCUC1tQOjbN2r8+
	2Vdl0bGuAvsPaW0lQUsaIs6J8sxwmpSU4hcbl6mrgCSDd6CcI4QJ7txUR9+30xUD
	AkdHKdBid5ASaoBIH8xEuagoeLqs7ZBkbZI5Xo/WnNj4Ra+sRyDmHIVqVd13tvco
	JwKcqSiawBHYIA+1TroSgmpaYkgI6fHWaKG8DSXh9a0SIzVJIyFpzN/UUT0rn0ry
	Xm582wlyarZLnKgITP8NcM0lne7LentQ8yrNSsXysgW6aC/Pwefiywy4vpmmD+pv
	ijolZmrHmAH9p2m0Lf/awhy9OySrUryU2PKox1KClTX80Ztm2ijyySxBmIKYbzWi
	GLq0/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffcn98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:33:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so16775261cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980401; x=1764585201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0Jm2grvSgkUN3rYx9rkJH6YHqau0g7/jl3IwGSFlUo=;
        b=kk7w7xVeRlaKm9n0cbLZ1rjE4Boc2gjoRgPLus8GJ/Yg9Qn+kp2VgJvKl8DupGG+zq
         ECNwUK+5ZAed1xcC2zSSqZv49OOJDo17lopnDHnNO5+Ghk5GAXve4pZ/cgfXZ/QtoVHm
         R+Tfts7H34q+i4Y51pmAp0n4FW+OJueKxuGkOJxL05srJi01wiFfRM/0XY/UrLlZZTUY
         TynWPfAGWrFSMWIeypV3JX8ZCevKvSgmxVnV/HU+DhzyDI71Vu1Tzocr4dpYkJkSWGXY
         LZm/KBD/T0xUjiWc++KCEGRSSEmEbv143Cr9TFAclFtHpRhNKFc0MbcZd5FRHwIGy9Bb
         zZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980401; x=1764585201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0Jm2grvSgkUN3rYx9rkJH6YHqau0g7/jl3IwGSFlUo=;
        b=R+iQ1SOlJdoVDeHxCxPahW8ugUcMn0G2QQjYzVADF/Z8BRQTN4UZ+d8lfBcGBQBZ5n
         WljmBiwczRFaEwSkXuhJ1bPop6jSb7YA+tJ9ZVw3ol6MJwftLSq+COG0HdsSHUzZvxo6
         kNlU6Pva9o7XFOw0wwMhNhP0BZb7MdBt6Avymr532Nx5bGLbr4aJZKgz7emCnbGJHuPI
         Cvq3xruGzNYgAkaKCHmm5HM01nd+GnFi2/c/HMiE2gfiY0+uZ6yLePMGghUKh2qnqYNe
         sykzOfEm5f9pc3lRz3x5kUEiOYiJeDHDIbX3bocwcYanxuBo5c2h+jzY6YPy82nWRhBg
         0ZBA==
X-Gm-Message-State: AOJu0YyuNQ3V/yRw0OX4K/aG+VKeBxA1uFSqHCoTGNKYnDh/5iwWFEZ9
	VoC257+0j5U7VTXz/GmMOCvUEQazgLpZQpAhJsv6OLORU5/LmbghdN6iTHuoeuZyb6sc3txJJaX
	qHD45sGdBR5JGIIZ2z6IbrY4x/+XkQW+p0sXZd8rH5t0eYn8WjUJKpqpqo8buzyY07eAW
X-Gm-Gg: ASbGnctiYETbJqIfIZGYpW3srAbETACipkwT4VWIMh/PyB7U/7BUpyZ++l6uf7XGzXd
	ui2CnmskiLXewGA97IzG5nFxN/SaIgLfqGh5sPxJAIwXNq1W0wfCqooAh8Q/inykJxzcte5az2p
	hBDDdncKNoV6SWszWuNwgFLcq2bEx/1fKHiAz27+oqTh/ci31gx5En4tzgWCVvs/gVzeVZaThbK
	c0nKL7aXxjnqvF9x+yGwByS4EHK6bQC379bHnTtBxJm3aBkvKLsBJAQvWjVkoftp34P1IZ4W+Yo
	PcsCfqLmspdN8E9tPHGmYAJK8yS5rfUGKXKvEFulfSXPLscSDhk0tZHmWlOOlT8Ovx3TbQ3mKvg
	e4vtvu9DvB2ZDzU0HNy0VsK44YdOdlRpjOnr3FKFgM2cNzSEGcQm5qHiPiTABdY/mHWU=
X-Received: by 2002:ac8:7fc2:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4ee5885a9e5mr113117581cf.4.1763980401342;
        Mon, 24 Nov 2025 02:33:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8qI/bBiQVltXN4iDi+AWrAjaBjGs72AWTsdoCpGxXcUrId734AczoUQkVRTUfqATBAW+9VQ==
X-Received: by 2002:ac8:7fc2:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4ee5885a9e5mr113117311cf.4.1763980400942;
        Mon, 24 Nov 2025 02:33:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d80665sm1228920166b.31.2025.11.24.02.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:33:20 -0800 (PST)
Message-ID: <35cc8bf6-4927-47e4-8f68-97138263e7a7@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:33:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: lemans-evk: add additional SerDes
 PHY regulator
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-2-73ae8f9cbe2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-2-73ae8f9cbe2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wzhi3bryBwpF0td_eCCbm5jlbJ-V43nO
X-Proofpoint-ORIG-GUID: Wzhi3bryBwpF0td_eCCbm5jlbJ-V43nO
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69243471 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mAYSrJZFqx11qOWNMfMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfX4l2fO+NXz487
 yrHYf45wRppm1N7sHbkR14GP0ufLZnR+RByMwZzEk4BflWYfuuHXWLTT/03HTcDNlJ4gPI4QU/D
 JdRET/A4+vQuaZ7D2LafXcTZUEobNF+d36GsQoalVpATh21+keXBmyOrpVLI7F8u5XsEpv/di5R
 toedyJK2b620CMwXcGGXyNF7g0ZqfVTG2guKexFkWVUmiDNdTlGjwVB3SsNKY/1xDAlmBV+a8+z
 8GPjCueecvlYik9GqcYsFN4iNnSl76DXizcdOKZ0yYJKaZJB5gs3+nxecGOfVk8kjRDUWQDxVpw
 EJPPRgesDOabZ4M57sA5/3B9w7gnFpa9p3QkzMHwpWrDIJZ7PDHRFqu7s+6MLfJOGO5DWx/YSpT
 Z9dUcCia4Nl6YTcVzPpn9x83jcxSAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240093

On 11/24/25 10:25 AM, Mohd Ayaan Anwar wrote:
> Add the additional 0.9V regulator for the Qualcomm SerDes PHY.
> 
> Fixes: 71ee90ed1756 ("arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

