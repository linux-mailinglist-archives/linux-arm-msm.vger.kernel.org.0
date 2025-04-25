Return-Path: <linux-arm-msm+bounces-55793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E36A9D66C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 318D4172786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D67296D34;
	Fri, 25 Apr 2025 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcPLe8IL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED122068A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745625215; cv=none; b=V4Cayx+j/AYA2NLJ7gfAsHUNpAxkdoJRgE0zz8q8idmLrlqkAiqH7J7tywTLUJ8cwvGL1eDDcylQeoX0lB8VH63zcIU3jZ1VxKfcNOBWu4qGim8rlktsgjrN04CKe5V7sMYscHkbkiNLQvHLLbK4lnaT8kykOBd/vuWJrl/KlLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745625215; c=relaxed/simple;
	bh=eBXewnsOKI4K4+//+oxVyZ1X3o73mEYw593zS5ahIgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5ETNKyljUO07zgfLE1C03+d6BrWL9fbIGWhV7M0/FIHgZRgFsCgeWzR8+utB7DzKbUK+l3ALpvgnfmIKjY8UGEq3iFDeTDl1bCB1EksrAg1icPfkZplfei7ILMxpZ74T2FnSZcSzDXd8xCY+8dpJvCHp4uZ4kwAdS5UE52L3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcPLe8IL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqpD003980
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5JA/JRfkegEoA/bNjXfpbssKcj7RMaw9LRjevAHWTRE=; b=AcPLe8ILiwex50wo
	5igqbBQ9kZkehFOIXo4NTwUfw/Zif28WCmV+dZo6ONofXeOGlyvv33595j+Y96+g
	eNBcXMT07+AKuOl9e+EbewVSCmrHA2hogxiYvvNoylfvAdKr5p3NQ4i/psN/b5Km
	4ZBgTxDHd3sK5EC+xDsom+rw6VQ+exJzich8BczmQhIcAeBVWN7k7+H41lfEPctp
	UjHvuSs1ozj9i1V1QxCh15Bn+YujtyPYduiPFF4uUZmQw5ZAz2wHPPKqo/itx8Ro
	SgKlB2zumOS5VN6Lsb0dtHieh8BRE3Z+b5AbT2JLKJneVG4d6U1ihLkJkbbjwDP8
	fUARow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2am9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:53:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225429696a9so40710235ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745625212; x=1746230012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JA/JRfkegEoA/bNjXfpbssKcj7RMaw9LRjevAHWTRE=;
        b=LH4XRclchT4ilCg1QXwnaaUJNoWza6oPcEIN+bi7tD57f/O6+NsMQAGnkWC2+V6d1Z
         qGq41yTgZVG/nv2Upm7M9mm3d1bRk/mPslFcIe+4ubrKZ+Idx/RaX5IOMSdC+Hu+7fEl
         /NarlQ3DgIHbWMu0FM47Q35kfhoO65Zl9LPiHGUk+CzPDeIOtH8+/gw/d57Nfw0nL0yx
         rqRwHCIRms5+H0UPZhPhEy5M2zJazmA15Qzj5ypFavtm4h4lkLqq9zBdAQrTn57AyooB
         +tCWVhnekMx+yadH2JY1L8ZFuQcV1iYnQ1YMk0tA6WI0ww0yp0n/aN9a7cM9Qq7L+nFZ
         zpTQ==
X-Gm-Message-State: AOJu0Yzz6RpdE4yRGHO8AruJZ+FU/P+CSkV6YawBeikIegDPY4uyfgin
	EoUOl3g5SJlKJ9UPGuOTo4Dq0tPIH3UYAX951CxCzt3x0F8VjjPsivw9zPxhb8W42J9bE9R7zzz
	PXcH6mwD5zA1W3pGI5WKip3DO3Y1w+APwKfmOfDwibO6zEQjwsoQ3EEICJYhTna3z
X-Gm-Gg: ASbGncufoaHEFwEfhq5KUX7LAIS/DtORjPMHfjINQ+YFdVbJZfbxLWvD3U2UYIYMont
	Ud8EHdQtXrxsNUdxzWBvA6OOTU02+EFS3MZGJphFq46x6Ne8AWc5Z8R6xmZP5WphyN+QOdxml4t
	gNm+7cJes1Pqw44VeShEnOvOs/nIwO6IJrq1Jkpv+Q004Jyj6FluH2p/tl2Im8vNDE6yOLe3ZTk
	BVOmbP8cVjR05kA8JT0e3TIeEU4C8SrPxpPOboGFj3zt+YSFxbhAATzWEt0bwJxP4n7C8nC2fwk
	Vq+gczxwbylP8+Bv91zKxbsCqrCGJX5Mv0R7S//d4qCT1li5R8gntpm+eiqdXwySNDW0efusGEB
	ye4lKOV3O6SlzAwG2wuoliN4=
X-Received: by 2002:a17:903:244f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22dc6a879bamr17996265ad.49.1745625212632;
        Fri, 25 Apr 2025 16:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjTQbuYB0h08FyywNE89k6t5ET6EqyeNvF40HkoB/PVt5Ya/IJipEZ3S+h3c3WQsL0LGxgYQ==
X-Received: by 2002:a17:903:244f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22dc6a879bamr17996045ad.49.1745625212236;
        Fri, 25 Apr 2025 16:53:32 -0700 (PDT)
Received: from [192.168.1.61] (syn-047-231-130-155.res.spectrum.com. [47.231.130.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fa2sm38986015ad.19.2025.04.25.16.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 16:53:31 -0700 (PDT)
Message-ID: <08643d25-1ee8-4793-b44c-989fd9a27dcf@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:53:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
References: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
 <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680c207d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=s459L2JzXmrPe6crxkjgRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WkNl45-9boxfKL6T0bwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 02nYEbeYX3HiM56ZR4nt5VyzlhIFQcMo
X-Proofpoint-ORIG-GUID: 02nYEbeYX3HiM56ZR4nt5VyzlhIFQcMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MyBTYWx0ZWRfX4FO+z/xL9GvG 8VUMi5XMZtOEjzKXsEWtRtPktk+bgvJ2ZyyxWfdvW+KsrJ16e/WsF0LeUxWcCkppGBJ9fP7TXuU PO+aVMDhOYf0IruuiKBGccs2o3uKRQ2TPryvgzBxFoHwnXLG+JxqumBBTh6cXqLg2Q/cYeOJfFE
 zUR69ZtIgD+wTSSJntFrUG0T/BI7CCGbwGXNfvMtVuu26UM4TxHPkllOFvkUvSKDpkMwF+0li5P HDF89OU+3J7u5OS8vkcqIAbPUX8VQViYBp0c8yceu9bpae685/WNFuv4/zlvmZpb//jlu4pVQL9 G0mAGGOx76M5lCLmRUwKQ+Tt3ae5xoslbCWTIi5EyS2XPtgO0H8cJhH6lXXLuS65o94m979iajw
 SoMEJh/2DS4IJnN3zaVEiZXgi89/4O+3OABIPKMvO7JrJwQHPnR4CTEGW0LcNrvEmpWxlHot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250173

On 4/25/2025 12:17 PM, Konrad Dybcio wrote:
> On 4/25/25 7:32 PM, Unnathi Chalicheemala wrote:
>> Add description for return values and other arguments of a few
>> functions to fix kernel-doc warnings.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> ---
> 
> I only noticed now that the commit title is funky (unexpected "docs:"
> prefix)
> 

I thought I saw a commit that had the docs prefix in the title but I think I'm mistaken..
I'll fix this in the next version, thanks.

> Konrad


