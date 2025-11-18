Return-Path: <linux-arm-msm+bounces-82174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6828C6719D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id BAC0228E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 03:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C4E1F3BA4;
	Tue, 18 Nov 2025 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1cFsVMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1zYRFaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8B23D297
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435813; cv=none; b=Yujp4NqFLCDnDRWL38ZTTN7IlrTWxp+IdRbvSpHzW0FNQT36XDRIaOcQ/mT2u5NzDoqsgklPiQsgqcsjAKlxen/CYX7JdMLfib9SFZmMJlInghn0YZ5+QjwanSOOI1dGk2ihWZTIwPqjstq2n6kw1lduoH2zML2tENobwOr0GxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435813; c=relaxed/simple;
	bh=95rxKNrfRy2FIDUEU84LHTb4UEhqDrPVpZAK372Y5Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6nJ4bo9slmYF2m4RnpbSCixgbAUzqwzCijZu7ACI6x7M4yJR0p39V/68V5/dsxV+4aC6lCYptoxdcCrmndgrvc19WcVE5UwQ53TkT7W7q336TChz0h/W5G70EUysoyEyKYLPh1xWWThvZeU2FWZdCiAaQg82eMHP+csdppdbqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1cFsVMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1zYRFaf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHJNx594107441
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeZsXJrPEmelif57Bpf/IS5X
	M/T5zNoFpDC3W5jyv8w=; b=J1cFsVMFNrp6jujbh4QTJt8wXwqPn7hkHnZue2g2
	9wmNthiBwkFDq94YaPfkcK6jI/dWd4nxXswBy1v3GsyTbj6VehtlkCFgkMAgsP9Z
	0oSTw3G6drvHEmsP1q9AJSoLv42hou+rEE8lSyBhdHFlXU4NfFVRu4lma6+9W8lE
	jPJjOl9p/8fVAoAG2YY1TRBLHO3c3OBoxK27ussfR8LvoKDhQb5xj9fID39DJjEH
	dRaS2tTN81ltULNAOZnU5NvePq/s5Misys5nCuyZeTDBtshltpMm0rumU4JUhBBK
	RqdQecDr9HFWoiKcGonmBzf/T7Yc0B84rYSb/OoAc9g61A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpahky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:16:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so50712451cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 19:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763435809; x=1764040609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeZsXJrPEmelif57Bpf/IS5XM/T5zNoFpDC3W5jyv8w=;
        b=E1zYRFafjcC44hwSkE5wyTHIKX2zljbf57QAC859YFDAT2zq9AspMGJUK3rXqtu55H
         sjGYKjQvt1Mpbq/8d6/ZNA9nrnwLs4/2v76vhpCZ5IXiqcurjouAu/MMiG3grSSe8AZQ
         bS2qeTGbT8iI4MPQwUgq2OYafrpIAOGIhbZgQxVGQjjKrKSdKEz8QKSMPNbEiVzgndTc
         9R2/KnvAPXPYFe8w2i7RDCdvcHBsTE62KlYHrqqWLk3fFlUPs0N2yjhHT7bigREHJwue
         hZpNDP2f6dNanLm88aGG2zpg1VcJ/CQuxB/Kj8bWDnyWCFTqKJp5h8ZeYQdldU/DC7Fh
         IJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763435809; x=1764040609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeZsXJrPEmelif57Bpf/IS5XM/T5zNoFpDC3W5jyv8w=;
        b=KllaH+xB3MPwLtNXx40F/A0mTCRBRR+zVCNaraUW0gX4JXSu3lOFP+rr42i3+t9dtL
         3S681wFHaIy8OGWumfFVcl2cl6YMgowHOGy45xR1UUVDUd9rR6+eUGjuzroWVHw96W23
         6vts7hxpWmvEzVlL+bLHnxKFqjKqb1xjANYk2zlqM/UOkG58YgERnHAe3pLAkCPbxAJn
         WV2b9h7jsS8DQSSMZtAip1J0AaD/H3NLbfvKpd75XAm18uh4iefgPzXJMqr3kPSrvXWJ
         EBTteMA+cgvTG9mxwJIjl3dzviDUPR/WURbYuX0SaDdLchgP/svFqbTcI4FOmUEbmI6q
         kg8A==
X-Forwarded-Encrypted: i=1; AJvYcCW8GOGoMp9+xXN7vNfRp+CLOIIweWIUi9FgjpaAMWqTyjlCeemZUduHm0kmlGA+JRh2dFEMeHxxj/3H6Yoe@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPal0pdr7RrhSi5XCRxY1G3bqs0rpOqjnKG/ZJ6AQF2gdxX9l
	+PYVylr6uya4ULcoYu2DCmnxE3JM5CYgk0QtNwnI6JWnwCRp8ikLhj8mzFvOSxuhZ30eLJZro4Z
	dUl7avJPE3w6K9t6niYhJEVd5kSgmQWoWRQWkAhLTdFE0XUBFHOq/opRh2Yf7njb0JxLERfkd3a
	eU
X-Gm-Gg: ASbGncu5g9fh8pUkB1K+rj7UMNN+vI8K9Sw9H4AjDdDD/b5QmauMqOc4QUbMtM0m+9b
	nqsyu2r9K/Lwwev2aUUtEEULtkV89MqM5tCX4/LEHh+vjedmyixXD0zc/PXZyGSaKqEAfzMIUpu
	XIpdxv5Td+ja+ym+27S3RR/DoJPObI9ckp3wzyEO5mWVV55IAHBgKKbkFBHYoSf89giNIFSQOe8
	mTGIe1S1JPUK8eP7zwuK8Df6pOQzTGNpJAX3uMeNJxIDccx38h7HDisOB432MK+ttt4ZWyTRY8B
	1AVnah9N3kvU4AVe/IWT88mGiKvniDf7n0q1N7VeQ6Bl9z0aUZ92F8uB/+wPRWGRXmn998HXOYD
	Tu4OLYTERYnOSTkRFKGsV3xrWL2gcHw9VD6AySuZHWyhmJW37Lm6k7KLhJoPWXiT1WDwsH93ZV7
	SlmgzcWmQ96YI+
X-Received: by 2002:a05:622a:1988:b0:4ee:1472:9998 with SMTP id d75a77b69052e-4ee14729d75mr143695011cf.12.1763435809231;
        Mon, 17 Nov 2025 19:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW7yJv8DQX2tKIZZCvLbzX8N/F+ETOvLGJRsZU4+bqsT6pquo+kibkZVIHKXnlQ+ZIL833XQ==
X-Received: by 2002:a05:622a:1988:b0:4ee:1472:9998 with SMTP id d75a77b69052e-4ee14729d75mr143694761cf.12.1763435808652;
        Mon, 17 Nov 2025 19:16:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400458sm3651849e87.63.2025.11.17.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 19:16:46 -0800 (PST)
Date: Tue, 18 Nov 2025 05:16:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <bogyn24u6367tzkop52ffylkzylwjlyzwu6f6pcydpo2lrcr2r@pvzkjmfmplre>
References: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
X-Proofpoint-GUID: 95dwfxoUZt13GUoaFer6ksnuXbzI3BWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAyMyBTYWx0ZWRfXyn3ud/esJS3S
 +rj9VXfI9d/622fKcPGnvRzBJtbcx3dCFooPKSsa6CQJl7GynvmNl4UeVs/HWt9wltI2dBwKtrf
 5BRe5eL5SdpSTYcnjXtIWyq1SkrOLbSsYAT34rjoUpZzfVraO/Ln1jKzawiswIzzJFXRooJM8T4
 DwK0ZA7LHVWjSIUGL70Hhr4cTxI0arVG4/82Kmu/zFuyTPYu0/VzGfgeTx/5skGQOy4HyEefof5
 K+sS7s6s8i5wHU7pUl2wFyYHA99HKYC5off3XHsBPCASafBro2uMsYe/8aNKV3fBRMinvzB8/GO
 CRSl7c9zAdcYs98g3l4HypYNQDufKz5K0iLpssp+7D0po+ZfFuNB5Dhzknc1IaZ0T/o0ajQLl90
 CdN8V1Jra2//OQJGV4IjIeO8typGwQ==
X-Proofpoint-ORIG-GUID: 95dwfxoUZt13GUoaFer6ksnuXbzI3BWp
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691be522 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=JKYLkXM4sJaxhMPzHrgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180023

On Mon, Nov 17, 2025 at 01:03:16PM -0700, Jeff Hugo wrote:
> The following changes since commit 43a0c8df58aebec0a9456fd5ff4ef955c627d0c2:
> 
>   Merge branch 'mt76-20251117' into 'main' (2025-11-17 17:42:57 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_6
> 
> for you to fetch changes up to c710fdbe961e6e04239b989d688aaf56cb6d90e2:
> 
>   qcom: Update aic100 firmware files (2025-11-17 12:51:53 -0700)

Merged and pushed out, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/786

> 
> ----------------------------------------------------------------
> Jeff Hugo (1):
>       qcom: Update aic100 firmware files
> 
>  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

