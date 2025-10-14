Return-Path: <linux-arm-msm+bounces-77144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C64BD8A10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5EBD4FC5E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029B42F066A;
	Tue, 14 Oct 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/+6nKNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE3220686
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436135; cv=none; b=aEmXR982jCLMxbrGF93xbOr8RkdGXswKhDUtUr/uLd+XP49u4aK0QddX2sxJknjtmUR9G3a/ZIM2vZ9sI2DEXrsHqLEqJ4KOjqAIQ6/KzK0EQWlvsfQPEIM9H6c+5jGV4YKU75+AOTeA//xr5KFips+mCj2CM46QYdmluReSkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436135; c=relaxed/simple;
	bh=KtcuDDpfkcmM1QwJQ873CWBxDwjgKZ5Wz7P9Hq/NKJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKbQQUvN/j6BWxu2YZ53GHdOjZ+QZ1qMMqWosvS/PIZH+cuJcOAcNT+NeLiggh5jIy1S8O35I0ahsUPLB31GCSzU4eqbb/qZedcmi4biNCNma9IOwuXXHfLRbn8Fw/gktk5GEtbS0NF0LW1q/nR+OwDeuQRtSOVlnW0ZwJhUh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/+6nKNL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87FvU018068
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/bIQQMaDnARFreue2R/gE7kO5t8Efqe56u/lRw1p20=; b=m/+6nKNLIScw23oi
	LOxx+npLl5gAFXC13iRUC249EtQCq/QJFZHJ1x5Muw6pzZcV7GeBdcuEtLN/X0pG
	MOkr5c2B+t2qor3X0HR/sFXZjgYNRMPgAvg3ByDopVYx8HUEvoW6PVVcbYXYghG0
	tQpmVkC53hJ09r+5XlgaIAqGsEyIGfMf3RsK1xJTnqif+noz5um828Flt83Vas4R
	5V1Sdq2Fb9tVUcvR0BULboPTNftI0pWWvW5KTOt8L0TYWvs58f8Wt5kI3AvJcroE
	3Bp+XvODijGQnz/qRsxVDIxiaEUYdGr9zvwbtqvh34OsXpIWhQ6hyZZj2AhmbbTZ
	rlPoiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfes01fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-865c7dee192so225112085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436132; x=1761040932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/bIQQMaDnARFreue2R/gE7kO5t8Efqe56u/lRw1p20=;
        b=lttggPyt3sU6pAK6QblwgYfP3LcwExtIYxsQeXZA+P1zq8IfUWXH2LVnkCFIecQtfW
         9Iv4CUdBx0KFyNa4mVOeNpMmg06QygfQakIpUW4A9u8BzHN0f+TNW4cQuGl/09nOA7zn
         CoYb10rJp9dZW9aS7nOkMYAYeikI5hXfIej/NOGymAEd+5qnd1R8Pp+eIovK1bp654Rj
         7uZjhLH6B+8jwiSKixo5tAAsh2RA7yOStSbr3eVsRPuHO0S0VblQttaz+zkMGfDdB4/Y
         O8XE+AuuFFNMqeI1YckLkXTWuBwJ+NnTNRRPZ7B+jqHa45bDZPTU90JvRoqsFcKF8AIC
         ismQ==
X-Gm-Message-State: AOJu0Yz0r4sQsixNwaA75Wvit+eqx8+PfmVvyvPep9kLGbNimbAM+BX+
	t4RSu0Z1uN+UM0RwQ6V/KBxdpY977/4CQPJmGbDW8MAlZSb2I494xwaqM9ljxF4xOsLwJsF5ndC
	RKF7YwrWUCszk5+OHsnp4lvhfs4z1uNBUxuyMaSyC40mBB0mVWhdOKb8FrX7T1iORrbGEeuHJsn
	Xh
X-Gm-Gg: ASbGncv5pLxoJkfMOdsfJj9oqM5KT+BTYPpAMYfqqH9lXvPGlXbgdk3D0Yw8MkrTvQ+
	LEsjrA05T23rNI+QQYS1AIe5ReRw4jIcD/zzVRB2DTvNtGnh1+mrdHPUIdR6OsiPn/gUVamAMJQ
	F0aJGPSHwfwkhGcHsPKXyOhbEgeYgWfUfewTfN8m6Vu+vp17e0W5WljA3WrwPpSg2iFhjp8ia5J
	wkOIthJ6ZSf7ucYhMHxHX03sriHwG3zWY1A5al/ugUvcJp6GiozLMp38EHYdTTfXRaX/+/z5Cco
	9wbM9Fh1+0LctFUPhH0lbnxSZ/4Qri8kxT6OSx0ixFq8d2PoTlxgz4OfZAs6TipbVFueLpT1K0J
	6TRsBPExSf/95ZBhkC77TuQ==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr2338068985a.8.1760436132026;
        Tue, 14 Oct 2025 03:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjD4aGdFChwtQmJ3im0EP2dQobF8/9Gj4hhmLzpJ7xVjkxi3RQCTnH/JsERi0vATs3so/Wnw==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr2338064485a.8.1760436131394;
        Tue, 14 Oct 2025 03:02:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm10858228a12.19.2025.10.14.03.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:02:10 -0700 (PDT)
Message-ID: <226adffb-f619-4611-bd02-2123d618cb9f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: r0q: enable ufs storage
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-6-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014044135.177210-6-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee1fa5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3C1SsP_EkSFyRXLkilwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Up9iDE1rbAkA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lSOYK1Ytpx_B46n4V3cNJ8dN5KeBMC4r
X-Proofpoint-ORIG-GUID: lSOYK1Ytpx_B46n4V3cNJ8dN5KeBMC4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4LB2n7Gf0isY
 q247+E8i6+kLgrkDVpwYjQ+si9ZTxskln9T94dW6EgTYNi4lHh5TG0Xneso8+r6/d14+jhfyt2k
 5Zmiqap+vUiRQsVyUEbRUL/KJcGlrfaoNgM+HGLkK/JJREXNhSx1IvW/R23ktau9DjybWijI1Ap
 mGkn42MkdhObBXSpAkInxq4kq6PEFnal4b73p+CO35uvWBoU/RFVOCXGFNoXgSw+fibXUUtVEM1
 8WNzg8/Hm1n8ljDsv3QXrXOE2ekd5r0Od0PFk3DS5f/9qQ4PD/aFBL4cPJThkPiWq2W9gV7n8AL
 rTd4tzUvPjh4AEFiWC8hvUokfkinKJPdytCqUc9kyB7Wako3PFFBioa83+6TCLe0yk5Tmj82Sm/
 UgmACdMHPoM0HCc8HUTq2MX1aSPPJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/14/25 6:41 AM, Eric Gonçalves wrote:
> Enable UFS internal storage of the Samsung Galaxy S22.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

