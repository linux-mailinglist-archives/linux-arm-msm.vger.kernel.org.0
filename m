Return-Path: <linux-arm-msm+bounces-72061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3AB43DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1583B538F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE343002C3;
	Thu,  4 Sep 2025 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQOpSyAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10F3064A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994326; cv=none; b=qhXUhIZN7A+cQJ2Yxug4O7JY3QbkotQMM1XLFVtPijILLMWce2iOtg7u8hN+0uIc+OboAZwhZq6x7zCUMlbUaRmvPLAI9p5ie6S898d7gLh0sytOeSa+NxZvmb6k3YOP0elvmQAEMbBJ12QZeOHXnM2o5bSaNlmcW7cTZJYlXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994326; c=relaxed/simple;
	bh=zqDYEE7xs6zmmqkVqfGgw4oWt6zqxepm82BdlY1K7Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shcQ0UUH1Lh7CWWl5/t7OesZYcHiSPJHt/2cQDNRCL29+jWJVQfSEa1O+gDs55ZIKaD+eaYnN5fqiVn+8nIxbNozvYuk72ZUaEiPb9leH/XekqNB67xEaNaFFwSR5Ei5diUi7Tup9hf+9AKRd7myTWUt5MCfixxx5ZpKlb3Kv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQOpSyAM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584B5wek018519
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 13:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3li4coGXy5SzIXwPhJBRO2Cvjfz46MuwcOqco3dfBhk=; b=CQOpSyAMqzzF6mB1
	xtL5lv9x3eFcuhoNPJeo8E+ozULx6kQJm6A1QkOSBofEX50Eh22LaMjtvIG1tYsh
	KG6/knPAQWI4yy7nm/cLKltq2sPRULkBmC9/XJJC7mfM5+aEFrb2C9hhWTVozaz1
	jna/14s5If4JLxElki283cPlH6nlJDMyZU/vNSiar79CQhobeys1OErC2r1MLumE
	o7uQeXVhVH7YLxEIGw6klLl9gREJdavJEQvSkqrRXN9V1SRsBeQukvmbz3+f5lEY
	05MwS2R+v/DA3pX5vIDQpTTXU2vzSL9PfgRngqujVhFxa4nPXfCgyEh4bii1lH99
	Z+8ldQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpftst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:58:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-80584b42d15so224371885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994323; x=1757599123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3li4coGXy5SzIXwPhJBRO2Cvjfz46MuwcOqco3dfBhk=;
        b=jSXhysmqMPPs+UQgrQ5neDrJNCrnD2TvHTWamIz3jT4OAXH6aa7fjFcdcAu2Zt6YZZ
         ayIWtCgKzL4FPjQcOMde5H/aZSngsPj75PQ1F5bZLcLFqHoY1HOkWuutuncRGjv7k2eg
         PP2i2VIdF0d7SzuIcFgLQ7pP/4lvVJ603MBhFnfc1hA7K425tG8CeJDgbWGWo++ay/Ny
         Jb0mKhp0zobEhqbFYcoZC4FAmdHapnARSYaoAUL0t84Vky2uY7IhjAvAndmzhRjtBU1Z
         OV3kJGos4mu+U9bFr7APhM8Crb/NXBwLBYDisTrbQNTVIOBIbfrAwXd+ucapLg6nNYKM
         PZrg==
X-Forwarded-Encrypted: i=1; AJvYcCXHvOaFRFxY50GUzNVBv7UdDWV6BNERHfLPcfkRc2At8B6sw2mEyUoR+NQEOtZYRT6vQxONf0LGxQmgnGtD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WyS1MlOkVwtindJAXaKGWFZaNMa5SYglmCjnir3H0430o2S1
	kkXmB2ok1v/7TEc5rEpVSHZ6tRsTNtODGt8U182wxD8FRIt6CKMnkKhhvEwQs3IA7tGJGr2FaNY
	89R+E5ISirhiCANZLn4c18Y4ADlGJElIBFIiILuKnPF0HwZHYmaW6iMGIWsWBYQayAXg3
X-Gm-Gg: ASbGncs4G2kcSFVFk6wpxJwzCop7hqz0syXr3OKtMyshyNYDsETbkJnOdy+XTQwfJAL
	UboNpbzCxFwmA+640W+xL46H4ifCIxZS3ZHSCFPPSD6DVtBqI235c5qHTvxgVnClBuiSgXaBzur
	kXOAJjTRuIiWZ5D36NGigPkdIW6oX8W8sFq7MQlKYd3cCTeXg84nwe86UYJRo9tMUnbm8sqAAFV
	dRQsB4ZsFgA9SPteM5Z0EAKftmENywMwhpqF+SRwQGafRLc6+Sdc79BOaYhybnhhWD8YlWEFhOV
	bpIw4/jTeV6ByoPNixXWdVZpK8VRXzNKy+7L400fbaJOcEdtmv9XB5hW1VTCbd3xFdXmWYg8cd6
	X430Ui21gCSQwiCVCj0QjKd9QkQUKRKu/ShhQWxgS0XsXoELTWAFE
X-Received: by 2002:a05:622a:5445:b0:4b5:4874:4f8a with SMTP id d75a77b69052e-4b548745167mr35483281cf.28.1756994322532;
        Thu, 04 Sep 2025 06:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzxCSGcfklAF0/xmKGaR2pwlAaKBc2NDu1+M7YnxZA2yQtM1955eKA9b9YXi8tVVvEeD19Q==
X-Received: by 2002:a05:622a:5445:b0:4b5:4874:4f8a with SMTP id d75a77b69052e-4b548745167mr35482961cf.28.1756994321879;
        Thu, 04 Sep 2025 06:58:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfc152sm1250300e87.101.2025.09.04.06.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:58:40 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:58:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <wturd73lfutj4njzrmatzli356cfyehbtr45fjcttmbo2pieu5@he3fnsqzumfv>
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
 <20250904-hamoa_initial-v9-2-d73213fa7542@oss.qualcomm.com>
 <2o2ypmxo6wbohrb5edkj27ueqpgbqhsnqu4ofzfubtfwg7vyri@mdsu4ca63fr5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2o2ypmxo6wbohrb5edkj27ueqpgbqhsnqu4ofzfubtfwg7vyri@mdsu4ca63fr5>
X-Proofpoint-GUID: 5fI2W9ibHLWCwlN5i-JIV36tYvbZ-PbE
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b99b13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=g8UA7gJT8kHEbcL_ufAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5fI2W9ibHLWCwlN5i-JIV36tYvbZ-PbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX41zI2nJaFG3F
 /2wT6+wWaTPefmFDHrsTFSWOn7R6IOt5Cdc/qT0cWJwWCLn3Ab0k7IOea4JDwtpRmLL/D++P/KL
 Y3FLblDEFz4MjGRk/XlzzagKWzhRwoE98WiFbcIRUMIbP3KpLdkN2YkKVwCPKb/ZSv0Ws/tk+AB
 jKh/+Qo4VLppZqaabmxJH7nQ2Fl6BEGkFhSDViLQTenEhV1CO2emk8AOcY/CueOyHxM4FwCWuYG
 0s7ZjZEvJ1r74nFu75kxYTjHDCCbyi+lC+80KQGtsalHQxziIO8ynU9zqhLxwsUBzIVWegvoYbC
 27ffln5v1xYI2CAAY4/az7MYuAoLEso3ADGMKaimeXbliS0bGA9d1YEp50BxVlwAPGqHxY+ABUa
 mdb9auis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Thu, Sep 04, 2025 at 04:52:26PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 03:48:33PM +0800, Yijie Yang wrote:
> > The HAMOA-IOT-SOM is a compact computing module that integrates a System
> > on Chip (SoC) — specifically the x1e80100 — along with essential
> > components optimized for IoT applications. It is designed to be mounted on
> > carrier boards, enabling the development of complete embedded systems.
> > 
> > This change enables the following components:
> 
> Documentation/process/submitting-patches.rst, "[This patch] makes xyzzy
> do frot".
> 
> > - Regulators on the SOM
> > - Reserved memory regions
> > - PCIe6a and its PHY
> > - PCIe4 and its PHY
> > - USB0 through USB6 and their PHYs
> > - ADSP, CDSP
> > - WLAN, Bluetooth (M.2 interface)
> 
> No, you don't. WiFi and BT are not present on the SoM.
> 
> > 
> > Written in collaboration with Yingying Tang (PCIe4 and WLAN)
> > <quic_yintang@quicinc.com>.
> 
> Co-developed-by, Signed-off-by.

After checking old thread, you can ignore this comment.

-- 
With best wishes
Dmitry

