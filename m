Return-Path: <linux-arm-msm+bounces-83344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CACC879B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA413B3459
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAD5126C02;
	Wed, 26 Nov 2025 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK4Ew2Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBLxEHlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45142AE8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117547; cv=none; b=QC+fb3ZEYGKQRabUpgfUHCJa86O/Sw4tQpLHIRSosmkQc1sK1boU3O+2hUVyZiYbm1Jxp/tyaOxhKWnt+Yz4DrGMMHG7SiLtt1NB9Jh4IWNUzVBqSmBZqimHckz+Dgv72u+MbtQpw9O8lMJRMOPTQwctggI8HQNaLZPeizn1O6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117547; c=relaxed/simple;
	bh=kz0c5NEMz3efAwDcpZPkZIc/JgIwDZLhh23EiDmCw+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWc0vYcjxMkPPfpCVDh5/RoSt2EX9F3QqyOJN3c9c0DceeftXaXkXrLk8EgYK1CeVYw/kk7L/ALwX1QYostAgzCwyVaeXtw6eGEmNa3s7vm7QjPkP5vWtoGuz3BO0YvqD1xe2aJYtxz/EKrHHMWBGJLFAzEU10Uob+Rzo4CuQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK4Ew2Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBLxEHlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD7wvg3317507
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVN4FOWzgUS8kUh9rCxRNzck
	zEuKSmffVf3B7KzaJ6s=; b=eK4Ew2Y5hWvtNpIg/WHVig4GhAPEf9c84cwCkDZ4
	KALtlVFFQuROra2tCNBe4XqOxi7EzzDXYyska0SqGtlbisosLlLUNt2Gpqhx7EsW
	I5IOSI640w1A2RxVQo1pKsLMVMV3m1k0Wbev3d41psnvRyoVoQDgh+kzZWicCtnb
	xPOeLPLXktOgjAmcdJ+N1ydeWrqDUJS+RIzMtkRVNVPjNoUjNsht5pHrQC4CRw/l
	+K5wVDgTEDvq+WPYduNtEbEx2i9W9Q+OJmnF/EmNXktSW2Eyb8UM8UDAeJn5vO0s
	7+OsabW2AGXb/M75rF5OleOwOelNZh96VdlWaUc2amg22Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qhr9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:39:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b30b6abb7bso1519725585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764117544; x=1764722344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVN4FOWzgUS8kUh9rCxRNzckzEuKSmffVf3B7KzaJ6s=;
        b=DBLxEHlQGSdqa0ofYcTPX1JDA39URsdTu4u5m1EbW8Fb14vsXagk8RKEM1D2agnkGi
         7OzkhpuXCJ9qvpX9W32SAlOMi/h7hLraZLrSiYmy0xY+ye5zRBOIgLg8bo10l8S0QyU5
         cApffwn1lFUpI5uzgXbznrbKOZWg1BS6UpQ9keeuXgQFPWN2Dwsu6Ki583fDDAciy1Rh
         M/S29alfGJRlvStkzf6UrgSJg+q4rv7aYW8Sic/O5JHkPwQ6Pez1woe2ZwhVT9QGodSs
         nEOGqlZyTJ/QTOWFo/Vq/KdDoCtOqPAImMlg4JVxiQcArg0CccGC91jB4ZYcw0mXxNx9
         +d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117544; x=1764722344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVN4FOWzgUS8kUh9rCxRNzckzEuKSmffVf3B7KzaJ6s=;
        b=Asmd3ntF87Gse49UtPLF5KiCM4iLtpU23+9yPOh7mXL75+6YhtgkKWfRj5BXdIztMK
         4P0t3fYg+eS8j8KlqJYBWe11RqOUHJA5fqd3zDanFeJd63s5xEhEuV9qPvHWQM7yA8gq
         cJABtAe4pP++YOJ1iZdax885iinhap5+I9oTpacE1G0pCAPs0R3yDL7izKBP7sfepHY+
         2TL2BiSyIaIsXkSe6d2Ec+zm/ZN+vVSfU4tWXfgb5xDb0AQ2B4Q2lEbZuC1fkOVR/uQW
         4/Leay1DhrGt3DdcH5LkwalHNOFF/aTU1OJeEmj7kpxtWfpdDZG9dDUlUbiEWvJ+IDut
         7jug==
X-Forwarded-Encrypted: i=1; AJvYcCWtGcs0KgEH50DVbTmYlqFOjvouaL2v0IZUazm3ifoHmyLUDmOTyD3+2Wkv8NSKCf2qa6lpEKrV4L0c/HyF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11g5LZZgT8ULVwO9PGldwtArDPclfmNBWXtpl6EEnZuGxSjyK
	mAT78fghFGj2dM78mbBs7VAn6crcFVifpDWLyruUb4UXw+uTMK2Q8EtrRsaTg4HrtpUUV3L40rM
	zaQ0LN6JVKa2rFMvak57WFajl5EGBrQjkvFuIjxEwaFssH50z4BqbBPOQaXUqF2Yy8HA9
X-Gm-Gg: ASbGncvk2LaoemGuGdWi+to9HYUXImpdMpqDXp+rYkIL8APrW8ju6kZu1CY5qNwK48+
	ZbxqRy9S9U9TXNzFYYhnoGHLkYk5DXYXboJMSJmLzT3t79e2gl2XfEZLkWZvkC5IN7ZLF3Rrf2q
	cFV7bW+uOL23GI67rLmrgH18Yn7KNma8rwt7h19yDL7Nd33ja7AQEu3b7OGXFfUjIZ/ic4cjX98
	Zjsbyg/tG49PJfHKjRmnDn6J34MuvoDdcMB0XtgBEq9GbxWz/rRRBl07iSkjColQsfFyz931CG3
	svRPUNiNhgga2m8YaV00Z+O9l0f44jOgeYK6O5mZ8ez7U0wjze8a634U289PiC3T6LE69DEVlBs
	PzbKHLozSi7THTBh9/Tc1s+jzTGVwg14Sn9R/ou64aD7gZ1dGXcajflHZxQF7zOHSaSE8yfgADo
	MzxHJ3uYwEXy0cFNzucgrNDAI=
X-Received: by 2002:a05:620a:4506:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b33d5f8f25mr2462538985a.75.1764117544110;
        Tue, 25 Nov 2025 16:39:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKjM4qhJ+Pj6deXm4whIHqTtEWTuri3C25gqZHZPZAONHKLEHerWIvU11miUtRGsfv5NlRAA==
X-Received: by 2002:a05:620a:4506:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b33d5f8f25mr2462535085a.75.1764117543635;
        Tue, 25 Nov 2025 16:39:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db88f71sm5639002e87.34.2025.11.25.16.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:39:01 -0800 (PST)
Date: Wed, 26 Nov 2025 02:38:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <g7chy34wnwbqme77ssnpp6fzuc2ymesfk2jssjdfskqjxhayzj@cie763xuzec5>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <998d44a8500132bc48e6882a5f7b19b45286a965@postmarketos.org>
 <fae984c564f240b72bc65bf3eab679587a9d90c4@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fae984c564f240b72bc65bf3eab679587a9d90c4@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX8C8iwzU0zvAW
 ybdMqwhSFPAQwVoksU6xkRWWWuoPaAncwobqKmK8SJO4a95L+mLYCTMFpc7rCUkpP3h4vdC2pwr
 Xt65zzJ3DgliR7lqKw2YCFWNqiBW9Bh8cRki7TACHzr493CG6LvEiEYFg95LQep5kKfa+gJ89L9
 pyaXuuwHcVE6F5NDPm2h75iVbLSc60TjVEVuqtIeAb1/PGS8x79OwcTyPSZdY/1BIetwOzHWK66
 PvB8cJVkZlD2oZpxT5Y8mcFKpkTe8B4Li5sIdbFvalqJAA19xV8bI5OFN+vJBdyFMVJYY6e+yaS
 G/PdCjewsX34wRed4XwpzXoduh4XMeeVQu/eWo/lu45OZR0NMG+xRw3bk7IUg7w88V4M5Hg4+PB
 +C+2mUVjvevXMk3Wye0X7l4Wbdxszw==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=69264c28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=QgkLZLD_Px6AUkAJ0r8A:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C9UCnIDUo49Y4rIIsDGTdkbjwQCL8qTI
X-Proofpoint-GUID: C9UCnIDUo49Y4rIIsDGTdkbjwQCL8qTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002

On Tue, Nov 25, 2025 at 06:51:00AM +0000, Paul Sajna wrote:
> November 25, 2025 at 6:40 AM, "Paul Sajna" <sajattack@postmarketos.org mailto:sajattack@postmarketos.org?to=%22Paul%20Sajna%22%20%3Csajattack%40postmarketos.org%3E > wrote:
> 
> 
> > 
> > October 2, 2025 at 9:37 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > 
> > > 
> > > On 10/2/25 6:51 AM, Paul Sajna wrote:
> > >  
> > >  
> > >  October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> > >  
> > >  
> > >  
> > >  > 
> > >  > As the dt-checker points out, there is no such property
> > >  > 
> > >  > If your wi-fi works regardless of that, you probably don't need
> > >  > to set the one you intended to
> > >  > 
> > >  > Konrad
> > >  > 
> > >  
> > >  Perhaps this only exists in the postmarketos tree, but it definitely exists, and doesn't work without it. I'll remove it for upstreaming for now but hopefully someone sorts that out. upstream.
> > >  
> > >  So you didn't test the tree you sent? :/
> > >  
> > >  fwiw
> > >  
> > >  drivers/net/wireless/ath/ath10k/snoc.c:
> > >  qcom,snoc-host-cap-8bit-quirk
> > >  
> > >  Konrad
> > > 
> > with qcom,snoc-host-cap-8bit-quirk I get 
> > ```
> > ath10k_snoc 18800000.wifi: msa info req rejected: 90
> > ```
> > 
> > without it I get 
> > ```
> > ath10k_snoc 18800000.wifi: host capability request rejected: 1
> > 
> > ```
> > 
> > Please help me understand how I should proceed.
> >
> 
> I guess I'll just voice my support in https://patchwork.kernel.org/project/ath10k/patch/1601058581-19461-1-git-send-email-amit.pundir@linaro.org/ for now.

Can "... we just ignore the return value of
ath10k_qmi_host_cap_send_sync() and move along"?

-- 
With best wishes
Dmitry

