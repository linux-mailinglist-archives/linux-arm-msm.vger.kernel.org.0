Return-Path: <linux-arm-msm+bounces-78397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24ABFD987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DB113A894A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB0A2836A6;
	Wed, 22 Oct 2025 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuVCW9pZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609CC1D798E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153797; cv=none; b=VCYV140Um3gQgx38hhGngTBPx7wq8o5Kzw6ypz5VNcxSdAdF331b21WvtRSndsXP5+mRQyHhBOv5OG+vDEIszHbODijUqHKUk2VaT/mXh27KgGz2ZySWOsXN+FMyx5m4dqM2xWMMjRPDiewtU7nUGEFBT1a7rg+eXWc0Wj86JZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153797; c=relaxed/simple;
	bh=5rAleG/eDRNrCDTXgHnklaC7fMPPfliU0uKVYoTzlPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5zMrwsy5VPSKsfADZvk04L0eGZpZPivk7PVXog3cypdzmXinMAyoROeNOqecLmrGuZ2GzU2w9tBecGRImcIZrtd8Rf/HMi9Czj+8FESrMcu+qRpbyxEbDN9hoFpez8WN3rXHISnSey1q9Z862/tM+bcT2qTXLEC9PxzI/gRk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuVCW9pZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAni8M024215
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4HbQ9Kq0nKjjLfSvRhNm703ai3Fj0UHEOwHANMEM5Q=; b=AuVCW9pZzcRdkPFc
	ELCrmipX5ru1vyoAHhrz9qC0d0SRDmgUTL1/Qa790ieV8Js0tcJD1vnST22H9cOL
	oEIvKHUBEbrKd+vUnNEXY2xko7EGqp72RWyNLoReDSiTRBtvnj+nA8FyaAMfo9fq
	lHNgLO+U/nJiYp5e8M6I5hdEFu34lZy7AK5OaC3XPTmK/VE7e1Nj8Y3GBakzKkul
	hoCkOEnLHtZiljf2OL0AVPaMFwGcs1H/xAyBA0lcIaFJDGv0JlOa5yDXNEgqBuJW
	Oo0hh8IVSCVajI3bAH1/1n6ilxn2u0bgclujUdAyVxMgbRXVPoi7jv/IGHlgcjdt
	YM1beA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w85ja9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:23:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26985173d8eso178389165ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153794; x=1761758594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4HbQ9Kq0nKjjLfSvRhNm703ai3Fj0UHEOwHANMEM5Q=;
        b=g7c62bBUNUlOA1dYmD5nw7mV5C5+J9+25N72qdJ+U7hSvNfDj6sDYB+JX19yTyUBEi
         pizG7l88D0gnRL5iBhYiJrMHeCEPwYfEyIPKgNfd2gK8niGT8bltRG7y14WxgsPN8oLe
         4AvOnfzgtQLoHT8Qm8RPTuxegsqsn4dCyWGVjy+hSyCZtt/hkFECYH3GoVnKmcNbLdm0
         CjytTEYT4uSHnlO46PDXPnnNruzLRLBmq7Sfc3c7HzVOs9a9gRj4wcVPkovh0Ggd6OfJ
         EUk3v92J1z8cysvtQiGN2cslFZbc/ZyUT1Y7ZmPHLbFnPwd5RWTPwxbA9VzuKDUdbSzM
         xFww==
X-Forwarded-Encrypted: i=1; AJvYcCUUh4HtbMUv47hbeVaXXeIjVMHzcsRO0oyJOJfxmTWdDu5iaDuT/gSZtKhgp0mINCSmDXogC9hxJXqcdjAv@vger.kernel.org
X-Gm-Message-State: AOJu0YwruyQ4r9eHlhn4+tz4oY5p7JkBxFqtIwtx3/bIrGBykmutC2xF
	GMNMlLkOoxgXWtfI89Lj7NwAJAeoDFByrwSzIy4K53tM7GlsNBRPBjFVr/BcIjzLtHrBmBJcV45
	mYyBASkKSxW7cYvXbVf6+wv7BsqDQ0KqDl/yj0665OpPh8FOpuUw+ajrvMn1l+hv3Cg8M
X-Gm-Gg: ASbGncsUEYOkDZRHfe35SVv4RbMrLxMcTYg4MBqaZSXdj16xFKJY/d/yHniQHcD95z3
	slfcDg7MbSTU5fRjwX0sfAvGbTY8OFx2D4OGa8y8jXT6++ZcNGUZA5z5aDstQNQUxCcjpvC6Mvb
	TIKCxt8FyaF+C8Rxih63J1RwnCRyLpujIVG503H9cMhKfLsQgIbIeRhpE1vmFU6qXGF989Br54I
	lgMh6KH21z/H8mc8UK75Y6TmHNFT78g3TPZDYAkSpO73eXgU+Ig1woWItnM1P5fofAN+jsnhEEn
	aansgM5PTKN/XOAhSdckQ1qq0VyLZ5s+a3oVA1syEjDS397KgdN2uuxqLQA3lAFbACvuGY/3VdP
	PbZjKn8yzX9Xh8h5DGrtPlNP0Td0woniZ7MxE+P8WcdevKowruN8a2HDKX5Ss2A==
X-Received: by 2002:a17:902:e849:b0:269:63ea:6d4e with SMTP id d9443c01a7336-290ca121e0amr252436665ad.37.1761153793763;
        Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKt4p7Xd8bh5MzUXllIZuL70U1L/6951/46Q3Ga/8lJ9Ptko1Mzwjty0oBFlVYmlP4mRpE5A==
X-Received: by 2002:a17:902:e849:b0:269:63ea:6d4e with SMTP id d9443c01a7336-290ca121e0amr252436335ad.37.1761153793347;
        Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e28ec1b20sm2558979a91.1.2025.10.22.10.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:23:13 -0700 (PDT)
Message-ID: <dbfab86c-64c2-4f20-a15b-adc3757bfc71@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:23:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXzPL2z/FrerTv
 5lgnvz7abX6/7DI6GM+EH3SBZ3zggTOlwIutBGnBH2a9AEF4AgOri0yuT5n4Eo4X3mOk9WL8uR8
 hQf6O0+FCN/a5ltdud4uZuc0thyCpYianlUSKt+csWHg1Gj58IC6DlsnNDhrOdJeaneedzvkbW0
 cdHON/WzgQE8Rt+BH4i/v8+lM2UfAHWMONwie1uv+JFe28HnwLDMVpcGYFpbEYKB5R3haJ1Lhjr
 Kx14BbLJxe8QscIWJEr1QFqGe9UJp7c0aXC1wGrjq2L/k/YKF67AaDQPFAUoIw9dqnJyK1yM8sR
 NHCPTlAdschhH3II75lUrx7ePhfq5L4aL3iABS06CANciYdvPbCEkCelOLJYu6pTKFXO1zmlqlE
 BhXd4YdHqHX0E4+03O9XEVHX7zZ6vA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f91303 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oLIqjds3v_JxwBDZvuZlyyh7QdWKxp5a
X-Proofpoint-ORIG-GUID: oLIqjds3v_JxwBDZvuZlyyh7QdWKxp5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/22/2025 7:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

