Return-Path: <linux-arm-msm+bounces-78033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A77BF1FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CCB74E1C1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C084CB5B;
	Mon, 20 Oct 2025 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgyJHnuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D921EEBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972722; cv=none; b=LckQo+DiC8xvkOBNsUXhcVWFCKwM7FzIUyjG8s6eG8jPz3zdSvsPZ4HR0QxJblukg1iOgyL28PNRvBnWHObHSgfFU7W1Un2bWlJptf/BTJJF94fzaPtbRhkfRqE2/r6g7uo/+AHrIKmd1h1gl0MXwk5eRQA79bwfbHn+V9W4pxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972722; c=relaxed/simple;
	bh=m1cFZ91nDVMmKO3FVeUXR2IX3yq2thJTgdocfbXujqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVywN41IsQVa6kHxW+DSusEvyM7kIlFR6JizFOxv7XR0IiYeGMcNB3T7iefeCP3ocATT6kjlfV6zKoKpZMKeeZ6MDA0USHuU2oFN39hsPeZ2bigtJNa0dxEepVmeOS/9VJrh8aUE2xXEMqeGsGtGKIHz12dEbgqgQMcNXkKTPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgyJHnuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBtGgZ030282
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5z5MewFkGwmNnAnqC06HYK+3gqP2SAPPRZsxqJ+mes4=; b=cgyJHnuo3bigLGpd
	L6VeLeENo+1K4lFNWLwirr+vFm7scmZ6r6oWmW7NjF52H77FbNynQk4BmSYvWNq5
	tddNP5Cvf92+wTkwexjxu1Fto5PTXP6oWVVEE/dz63rrnV4n16WQRx6mrebnn5jq
	Z9Qk6oqNG1MDFpAeDXgFFLG4t2Hi1ZoInnpVtk4SnvKW3k+ZWe+7Fkv4kpnTY7vH
	TnSxPKh7LT+fIJbK5a2DDNsL7hUHRYSHN94md6+IV5vEURM36EODXaut0tB9kQ1r
	W9a4XDUOWZtrZRVB/7ZCFBD+H9WFAv5MTigyt3Kl+mEfx0pDYEp04DAg4IfWHR9T
	przwvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdw53m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:05:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so3387860b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972719; x=1761577519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5z5MewFkGwmNnAnqC06HYK+3gqP2SAPPRZsxqJ+mes4=;
        b=MbpPXl0CNZSNExauvcFdafPDJLsGzoRTsGb9dm8rfb3z13ApfDaNn8h6MWsmTWVxeK
         74VRnswAKd/NgOzWdYYs/qMN3aILhLzsXAXO0URWMUN5WO3caVUbWkV4sNlVSP13HS1r
         tL9dnTVmqZ9rxv5Rhl9HnqCOBYpoAn7DgBaFStiX/mmIiRja5XvSKhB2E0n7hWPgrNFu
         6XWe5id+bI214q5dWC01aQp0PBr5WXF16xFcbfOFdiKCSdLGBrPMLKaUQAuEVIPLbwZY
         atAIUxdxrR+CUtVTgk93seKcqwGHRvG31G11nz3zEGeuVQJXbkd3UN8Ygs+W/7sDUHnc
         Tlgg==
X-Forwarded-Encrypted: i=1; AJvYcCXl+EagJsUzo/YxpN8nlaTf7VrYdZGxtyzon0JTyoPtBDIBvEl1pNgsGgBXof59+u70DqwDjbPYHSwduMaP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pLvdMxux6qWDN8EOTo2E4BCZ67cWkjAgoil6TIigrD/kDg7t
	rYvTwC7qTboBtVThalUWhNaMRNzOhq9TFt1TEO9c3G4I3SxUxWxqfpenc8iOOIlUxbTi1mJAQ/a
	3lURqgHJ+vFna7YoKlp+tgHX5FurnIBRNmOF/SCWkcmolC9+SdI0SnWV0tLUnVjGrQ18h
X-Gm-Gg: ASbGncvr6LCf/fFEIndnfyDbwwBNgb0bSLQtDx4VsaPJgCeKFtX0I5uT+F7fFi280SS
	huEr3rbrRLl10DpRhca9/uY/x2iJ0o/0iSYozKBo5WMEbO25SNp337dv1W0i1/8k6HhwPIRHJr0
	0Pr71FfFj/d9qDSgQksBkN7mMacygmjxvbTqRRAO2higbFFfp14S8oE/gKwHAAwL50le8rdzlJA
	yAF7w9i6d5+YDOvx86BRELbf7iJ3dlM+t/19tBhuSeHnup/3z+ep7Z3Htnn3ZchBct6ae3tuLtC
	59YiYZeut3hYhPo3UfZ9NMKwsC+lKDKFJw2b+RMq1imvQB7cD0BIdcRafZyvMCiSZygKIukDJRY
	kw09175wx+xT7poKpCNOB6vx0JAtam1Hvz1JmB78V93DgWwHuuw9R
X-Received: by 2002:a05:6a00:1741:b0:781:264b:dd96 with SMTP id d2e1a72fcca58-7a220acb6aemr15829077b3a.19.1760972718927;
        Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIOAMUT56QUDDEA01lsQBBeCyp1tjentLRkzWhpirh/HDomSuboqk7/aOjZXu4oF6E6GaDZw==
X-Received: by 2002:a05:6a00:1741:b0:781:264b:dd96 with SMTP id d2e1a72fcca58-7a220acb6aemr15829043b3a.19.1760972718491;
        Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1581dsm8457437b3a.12.2025.10.20.08.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
Message-ID: <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:05:16 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX9rJq43Q5B8vV
 1/2j8sfFPOStTme8xxXeS0vz82rttn47BW/3AI8iLlOR+j5TlhZPJVz80VDfIbdJuunY841nQwx
 D74Ry6KO3mXT3uWeD1dqFgwKKyMT/ioA9wS/I43uQ9rppiqVqRAgAI45nk98huw/pRQsiH6gWs3
 yQCh+dVyzyiomRsOrIU1sxySoQdCmBc2xf15OPkumdD1JAvEd45nKLUCLv8VHTELNRtS0SpPOWU
 Cbm+BI4LouPSI9qNJ1wymgSzfvgWssfMcwPwnyOt0YJ6T6QLm0arPYaQNupB75SCmoExHTVAUyC
 xqTyWROwFA1lewVxc6niPxGfWUsescpC8I0t8SsHeOkTXtqv7UfsRRSa4Zqb6PHTOdeiMB0WEBD
 dtVgZNEgtUJFlf+kznSK6KoWEADyXw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f64fb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u8OtsHZsk4mhN78VeKMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8Xdcuv05xpCVgeFO9qhj_arGK2CVi517
X-Proofpoint-ORIG-GUID: 8Xdcuv05xpCVgeFO9qhj_arGK2CVi517
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/15/2025 9:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Youssef,

It looks like this conflicts with "accel/qaic: Replace kcalloc + 
copy_from_user with memdup_array_user".  It looks like we don't need to 
bring back the overflow check, which would make this change no longer 
needed.

Can you have a look and see if you agree?

-Jeff

