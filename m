Return-Path: <linux-arm-msm+bounces-72528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC91B48737
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5917B1628E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E43D231C9F;
	Mon,  8 Sep 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcIYfEGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EE1E492D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320242; cv=none; b=dtxbEjOiiz9em7foV3OUOW+3OCQa+aRdKPpFVDA/c/YHElRLXxwteIycZHPBJb9x2ABoBynRT3UW8PM8lEYTWzUG06zZDTmZIg3eKVCSwc1s2PN1DslQYPyZoNu6pBSIpqOfyQS8Qf//kgwh1EKVT+83O2qmDK6kC90kXxUP2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320242; c=relaxed/simple;
	bh=LdQy1ux3TFO97L9j7KgRura8OaIrmueztuYraK4RdZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwYtDg3Lhf2Vkt2h2sLYyXfg46iFQHXoxQbpdWYulDHfmDWd0Z3A2zXA5G/dTyGibojCktVco9i3pSzWlLBL1DcaWngumhIIXw9lp6gxYeZQJi56lvdTrWaH177qsTcV5kmwMocE8AMPgjhbqnUzkrUiHYcfB/G31cxCamkJ7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcIYfEGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fnf9005565
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdQy1ux3TFO97L9j7KgRura8OaIrmueztuYraK4RdZg=; b=DcIYfEGvJkjyPGUN
	6yXK+IF3fZma6Z2PNyYwCP3RHdPQK2122r2h6WfYbvsKOtCqUZjJ5LanVcy2xZXW
	HGZTLARLbBnYaMbynExoWJykpucwLJ8rKVgpiJeI43869toRDKDCmfEB3ysNHJxG
	jRoaEmP4LOmC2E+JEkwTrI3cDLd0DsiWPSai3ujCa+yx3a3nb4HIp0hUme+V5nTd
	0eEa+zvZR+T8K3dSFxH/PwHGTu+NivZgqIZGpiT6Q/P8MfNmueOxv9v3xfskoO51
	E5tJ/Dl2HEaUE0nPzhY9NiVQ1gN5KHB8FFXROPfnn7ExXcSO5oS+LBl8bCpspgbj
	vdYBeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37radr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:30:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8051d4916b0so172613385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320239; x=1757925039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdQy1ux3TFO97L9j7KgRura8OaIrmueztuYraK4RdZg=;
        b=c1cqvnK1mPoh9Y78dPMnJAaOw59y7uko5BrOwagc5A1z7scQ1ndMhoTkjzQqPlyYK8
         v8A4Yp1/FaH5oBv7gTiK9DQ9HIqQh9kBeImD16GK5clXGE69WAnJ72jb31Ti/r/XkXc+
         EiUBNd8oJV8g2KU+VyUtyCUG7/mzX8jRCxOGB99Q4OUSwLLkPxSU+ymTZwjgbzUtd+h4
         GlLSuvFwYgjb42Od1pH5t/ickAgYrYbWN7BjufWwpkjLSXirg31uB3V+nHp+afw/fkh3
         wCj0v6hy3lCiDrsCeffVdmX5QG+w15IMV93qLCMZQVe6FKXavesB/JlWeJmOgLiRoKI8
         xXzw==
X-Gm-Message-State: AOJu0YwXNu85PJide/SfjH1M/Ys4WgSj4YdUhF5a454lWJIMmS9fOePN
	oifaBRkNEE7qKROAl1Sb9VKpCAwxZE8mcTQicx8bELkOEAwkF3riTZFBVShL20m+pIUCy0MazmC
	hGcPn7x2FQDchiIsC6+ZmePXBWE1/e7TE2egudTq/xgaEdHxNNOlbT80a4mhqWAkMfitQ
X-Gm-Gg: ASbGncsf8uWRqgsFX+ciGwal0wJ3rkDi8aNGF1piHRt5ImFmp+81C9wV4tqua4Bagy5
	ZBoz9zTZS22aoes58KuCxUSNYHbAKWXa9Fe/kGQueqE58DACFZMCOWHMUIMUzunscxAB+QSbYzV
	SiZmTAkGkniav9rqX5KA9jYIybzY1A/hU8zOMAwM/EKdKZ9TZH3k2SpxemBOaOF1ZVwWgM8TZJg
	281ihV0EpHEDaDpR8lIUEeBHNv2NyoP3EPyV9jeK4uo9WZh/Ix2ziXDq0M+hqAE53cTwGpbr3Sj
	wK/tx1A3j+R0Yr9q0Ai5z3xHC0HB+DgGFyFtdbsUdl2ZQyz8WOITs5EzJ+akZ/1T/UGKKlRaa2r
	xAl/2qQ3mDMSMdrqRaFyAIw==
X-Received: by 2002:ac8:578d:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4b5f8463068mr51892531cf.4.1757320238786;
        Mon, 08 Sep 2025 01:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERSTWm/T+KcYLEj3pcPTCBa07ap2kgef8Psp3x8RFVl4n8Hlu2Zf+x4N7m35PGQLHBEUM5VA==
X-Received: by 2002:ac8:578d:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4b5f8463068mr51892411cf.4.1757320238295;
        Mon, 08 Sep 2025 01:30:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04c69545fesm388450266b.73.2025.09.08.01.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:30:37 -0700 (PDT)
Message-ID: <b9678e6b-fb8d-4379-8ed6-4de19b9989f8@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom: qmp: extract common PIPE clock helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
 <20250907-qcom-dp-phy-v1-2-46634a6a980b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-2-46634a6a980b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xfOfpGg5ATws0eEJ1sLRT-PaCu5Z-V0M
X-Proofpoint-GUID: xfOfpGg5ATws0eEJ1sLRT-PaCu5Z-V0M
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be9430 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fziS89exnlNdC9XCmC0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX5zNIRR3BhYxn
 Dm37vdX2pnOCV7v53fAZ98nBiL/J+RxRtl3SrMTsPagnbvf5Wb31lrN6Bv5/6ZPn81t5NzUR6HX
 wV6OuNBszKC68/K9xUz1EhBD6wskSbtQFH13TuAG9UjTWXFeRUfOe20acZZPaYmPqiJX1paKTB4
 cokdgMYhdl31soFBugA+DdDfRaobau4VtMrTxeEq2Ca4gAjO9/L+DkzovR4lYpqe5hCbWnV4R7b
 8IvkleFxZGCCM8YrVdzv9uxmfKyrB4uOxBAvyw61lJMdsZ6V2PLFcs21gmjIVuPMBrCoLR0bud0
 7vntkqxaEe7LiFFGe7H4hrsJpC2m5fuNeyLvuA62VSjFYnlhl6NYlWO+pK5IprTEjFziMkYTLOx
 1JyGynFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/7/25 4:52 PM, Dmitry Baryshkov wrote:
> Extract the code common to (almost) all QMP PHY drivers, which handles
> the 125 MHz PIPE clock.

The rate is a little more in depth, but:

a) it doesn't matter because Linux currently only prints it in debugfs
b) your new wrappers can be trivially expanded which I suppose I'll do in
some follow-up when that'll be useful

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


