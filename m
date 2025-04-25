Return-Path: <linux-arm-msm+bounces-55735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52601A9D152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0839C4DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBE02D78A;
	Fri, 25 Apr 2025 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5QAuYyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15901AA795
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608650; cv=none; b=KyYZ0JnZSD6zCQeo76hfn3Wjwn8mIGF9t97UjlgV2QJFqrX6n/MajWovvg83UvlajTc+C4q9na3Mprbw1jHzXGP8RnwOddnVIian/Vw98Z8MxeQTJZMvGI8ILCdC/AWoUD0hVjJKCunxRt8q9oIyVIixMh5KXplWKfwplv9amVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608650; c=relaxed/simple;
	bh=/eHKeSZlC+sG2RSbp5FBHIx3+dmEo7RrjA+oItbP7s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8vkEvDj4n2AnCMK2YY+btSXCkvkbBjVZIDD+oPncscGNOP4nD/tfMfx+0WiKzpd2sVgC/GEVqtwbrzJe0cxtv2E7di22f37CpzSyrA81qQYNirvTDBzIOdGv87zQU/YtSvdyrRTMcByxbXzBo8sQzN2Z7HqJlpcIlFT4Qbpq7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5QAuYyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtpN007897
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zW4BUb9FJeIyuxTGb9b82pbw8fbGpR+wNWb2Ep/lNvI=; b=X5QAuYyL+Oy0kz2N
	9XGOknSgXa4sgRM097HDNaLvXo4B99GjTQvOcedu1RoilUorgRcK6gpZh3pVOCQz
	4ZGQAlpzX2YIo0uYbLFcYwnAHX+fP24IM9U5KFdCzZVpL7OIqHVhBfuTdk95p2KS
	IKvMb8MjAtYFXSIPOl9XJooM8D/XddQcW93B8hkvoU1RCCXPqtuDHxnI7i7DOBAU
	MDuRzlHyl8S6vor61m6layMJHeyaRb+IXaIPUdnpH0DkOn/4QqLPYfMgc/xPhSNa
	cL/O8qt+Ryz9dBHpoFoi7sSVbiwao70XPwcioMpDpw47LDtdIvYJRNH6DA/BUj5A
	n6yQzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j57f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54be4b03aso53648085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608647; x=1746213447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zW4BUb9FJeIyuxTGb9b82pbw8fbGpR+wNWb2Ep/lNvI=;
        b=uU04RcfcZXVCR3cRD7Vk6payULo1BNzYTDgr+VjjCV/8YAfr+VCWfrA8cn0xZqohOi
         dI4K9dE9bxeqxf8rADrjQxdB+T6k/hZzvrtEQfGBKGVm7EIrrgQgo1w6Jqzjpo0vSxtY
         WMuQGyyL8qxSC4PtK40U/3uyeS6xqldI1po5xP98RrhjoXSIsAb1gr31YXGs0FiZXJ7z
         fliJ5Cv5euA1mcS1nF7GvZ3mXrTwuQxKRoluJ4db4hp1cXjBWz378f3sE/HoAB9Hhy3q
         Tu2qFauWH81fFABG9+iiiBeHh1ooTAffFq6yIz50Bxr3YOfDpwKMPGYrmFRDX5ofVMiV
         r4/Q==
X-Gm-Message-State: AOJu0YzudOdgSgVKS1pM4Ojo/kV0BWGqPeRZ6P2RvanmZMj1ewQikDuh
	TbHlSsVLFM66Gb6A8c7WrpFZQRGkfuCyWvtds+nlIALGzpITPsmQ7I1VMhs6hS6YUM9I2Tylef0
	RqYY7xiEf52HJ6jy76z7kmsysH0jp6m9HqdNBCzUVUUkiSRszIxZ6F9bEH8uQxQeU
X-Gm-Gg: ASbGnctE4CKbaVOuw2tHShOyXXWBBWnmv08nqtwaClzInkD/WpVYXNTyzwuIlLw/rIz
	YaF31BkXCiMdCm1hTPU3gSqCz8ABCA3rt8tu7HEiYO9X6HaNLP1ygtGInaWUPNhoJJX6J1blH/d
	g7JcjAufXzfTjhQLKuCtsynTsWIGpxEF7/2YCAwWjehZSnAfAoPRp6tVhjC4kbauiO2aCB6ybCo
	QwkI6S5FKUbo03w/Vble+3jDt+8A4ipy6xNIGaTQjjYCV8PSPgF7pDP0JIBt4wsbXSu3NgHy0f5
	nJQBDsKluAYmHdHMSMalL7An+ZchFQjMYH0R85BhSF9kIYFeJKX1GsNVhU4+bsP1Ysw=
X-Received: by 2002:a05:620a:24c9:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c9607a7a59mr149123585a.11.1745608647077;
        Fri, 25 Apr 2025 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxvPbUgf4x5IWB/fQYC99GfuF5ue+amA++zXhl2G8A3b5eTC8c/agPDJ4FcIoJ3T+aG5dJg==
X-Received: by 2002:a05:620a:24c9:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c9607a7a59mr149122485a.11.1745608646681;
        Fri, 25 Apr 2025 12:17:26 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6811sm1690254a12.47.2025.04.25.12.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:17:25 -0700 (PDT)
Message-ID: <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3YiCkhnyW-zG41ZECAxWjqV2CYE05ww9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX4icJsV55Uji0 Lsrv8ROMzGrWoNSkm4qEXgxxLpGODXLqjK/lSPZOJaTucjcnqMiIB0Z83APtGssL1yAU9njwpay YGherOg8zbBzZpNbN7es75VHQypqkqgV4cOg894oG9lmBxh5muOIoz6MDupWpye9ukoxxe04n24
 ua25crq/qAkepnpCHvYgwi+rpbB6EhbHzCL+/E77ZH9RMKf2LfUbKeioaPoTwv5w9/r2aCWs7mo tqYvgApleuAn5QokZC+A59B4jV21T+LgYjbesoY6z5Mfm3sHaK2TagotdkucPZ/w8UCNs801g9C zL9Ja0Chf8A6P5NpunlBw9VtYnT5ClRa7xDB4+2dTK8S53Tt4fX3ZCTf1jNTZ7jDR2wbowrbJ0Q
 YeRY83I3YUZWGQaZoXog84Egz502fCvaCzAkvzDJO3OnJxDzf8NAxd+D3I+6EDnJpQEyyAZS
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bdfc8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KcDGLjRRELW1gusNAwwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3YiCkhnyW-zG41ZECAxWjqV2CYE05ww9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On 4/25/25 7:32 PM, Unnathi Chalicheemala wrote:
> Add description for return values and other arguments of a few
> functions to fix kernel-doc warnings.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---

I only noticed now that the commit title is funky (unexpected "docs:"
prefix)

Konrad

