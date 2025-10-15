Return-Path: <linux-arm-msm+bounces-77440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BABDF83B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15693E3F63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8963E2741C0;
	Wed, 15 Oct 2025 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLHUAy0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9D171C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544090; cv=none; b=uuqCnnQ7NOsuajv7oJr/hMKg2nXabYQNPLc2nAa3ynhLBvMzd0cxR8mwBOik2rYtdND8Ttw1pHy5dblUzrMK6vSPIWICSQI4vIom2pVZBS7H9UtongdBpOC8ru0DlwUQxJdnXouFhFNae5VmVT6LBOUnOqumLF3uqySzE7YA5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544090; c=relaxed/simple;
	bh=zFpNl/qKiGIbEbUtBp0GcdD37TgKE+KXPOj+Mmu+Ybc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJNLVecVaBrb3cOgi1bLyv5rHyYt9CDV3+vk4ijgJqgfjuUD7V9KK2OS4TYshst6+m9vIspDNCk91Ad8wcCEA9htdXG4+vaEapUTX9g0XIlkDU39qzYCY9iSrNGOPnwnk5Mp9jnXOLtQtT9rCKWByGBMG0S0T09K7x8UYQc1uL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLHUAy0G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAw2XH017832
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URFMyo+gK+X8VHsVcQTZUs/+BVSRA2Xa8NmiWKLmu2g=; b=CLHUAy0GwdVuJLTP
	LdAjlini2/t8LFCztKj+mcV0d7PCN9+ESDx08iLoTEIf6fofqwAniBTfLlWuXFhq
	ywgXzLlN0CrGLXFkM8DooI0OcXKgBxI1JcpypyLIIvrnXyXkIE5adBIXMXXLQIAW
	sw3iFiIsBXgyB3kxoTnVk7FO6Kbo/ZgghRt1psplGQG4+ZYwhmN9MvVNsF3L4fEd
	qzjv/Ewn02qcsw1Gczl16aLS3wIa08H7gZ8TZJzU474/a47t6mjBbQbEseC81ueS
	/i2Kbc/MuQrPJZh7+5lNqrtbOHUUNLNmZ7d7zAkiZXpnj0uLniDgBNiFezvLNDZn
	L8K+cA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt9xmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:01:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6474cf4573so7316945a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760544086; x=1761148886;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URFMyo+gK+X8VHsVcQTZUs/+BVSRA2Xa8NmiWKLmu2g=;
        b=EKJv3bjW7vNdhB6VWPc1Sqdz4GtKyekaKN9opUvWWl5USXUq9hTeaGZmhPs8uUZKwY
         VfLlTvFR0Y7vhU5KpRCir5MiZNqcjSU/GoP8INUwL3Oj7TFRHx7pQlQhTFWzZQlvl9XA
         euq/URWkc4sqxCi3cKAn+RplbuJBMKYRrgDH8THJzrtKNFmSsC14tXx4hlsiCmLv3y8s
         j/hKZaCTtY2Q8t5bygb6l0ftYNbnxdy0p/PkK8Mj4yoNLmlmXw6ENLZxiazd+7qZCDhm
         blVfCoYhbIARiEgEWxba1B+j3EZehJ/laoaMxOBl8kvuKST8jEDIOxNAo2MelpAXvE+x
         9EZw==
X-Forwarded-Encrypted: i=1; AJvYcCUfZG9h+m5qME9IP7J83qMXVAMmR2HSQSSAV/Wg7eK6iPWlzis0XDT2gLnkziw5e7subezI++3j/YJc8p5q@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7AlZZSB5U5sGd2+7CvOmurhfEd89tduHCVVD5ganXBsU9NGM
	tUMzxBR/eylk+RlkyvZMhkE3VHsBFqr0lSA3IsN97VCqsK/T78Wvo0Ho6PeJV7NHqQ5xNIV9ccf
	rMm6Pztrq9vMCFNYSPkA6AzhW8y3TI6IC/VOx8aGF6RtbuZmm5OuSF2FBnwRWoLJISOxE
X-Gm-Gg: ASbGncvXezz1+XsVst9QSopNI9v6WZ7h2luTRygqwmwh7lRspiKtRozlnZuo6oX6GIr
	1Kc2sTJQncPy5/N88wUe73j5NISAe5IniCiwFsy7kRfLBACcIHFC19NfK6VkBuekIImDIZSPlhv
	KX4IqQIObm/OWhM1a95YHc3m/ne1664OMfzW32uPDPzmhA0tSgiDSNKHYVHCMYkgpKToQ3Vf2hR
	BAbz/TCJMIOWRL1lwM2loISDHf5hF2155m+MyNimUtaJAs4iTo5IVICT+LG5em4m/yVzuWAvsh6
	pk6t41B+DWR438xeNQaMIAoqyzza2nNKvSImhKmNyCbTT+khkT9zYwObG1L8Qi8PFBdXLaWjtDV
	X5SdII3C+G3UVr5/plssXVp0Rr+Y=
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id d9443c01a7336-290272b553fmr368698415ad.31.1760544085331;
        Wed, 15 Oct 2025 09:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqg9V3bgqm5bkdUZbBqA2G/W6EemvIf7hEz9spja1qyJKq7AUxiDDC4CEG+PIrKINJNcW16A==
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id d9443c01a7336-290272b553fmr368697605ad.31.1760544084435;
        Wed, 15 Oct 2025 09:01:24 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a756sm499945ad.14.2025.10.15.09.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 09:01:24 -0700 (PDT)
Message-ID: <32669cb2-35bd-4755-8f37-cd315593b383@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:01:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SPooxI8o9Ux-1Z-dzg6eSjAwveU90Ksj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/7ClBqBKqVwz
 ThVqty+Sbgzlbkr7AZRKAoThfChrf71lcBHXdsdJHUZqNLV+q54JceHBIxKoesEMiL6b7bH3zHj
 r+RA/rMIQMMBJDt567AFIEW2Q0y4XGRnix9i3LzObvpzKZmMkzDhKHsMi6QBvamFbM0ot6n4Qzt
 ANg4cKhibhSKfModeqWs7T3RTnjmectqdjBOCChjdxhkHHDCVWwmWI2wBF1VMMnOKvccaH2EEUA
 PagD6flClGTY3Et4QJtHT/FxgRMoIxu4R5msMTnCvpEA0D0xeBrGI+TgFFlULkI9yl3gfxNz1ZA
 koDcWJ4vjjrha1Sh44syCmfE/mQSQRd9baZgFVl2SpB3G+YlMR9JRIfC6FNPx8vq1zLLg0RM6sd
 mVqFRVksbQxV0AFkbElx7N0GowENgw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68efc557 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qO_EqxUCtCfgeaWaPGsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SPooxI8o9Ux-1Z-dzg6eSjAwveU90Ksj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/15/2025 8:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

