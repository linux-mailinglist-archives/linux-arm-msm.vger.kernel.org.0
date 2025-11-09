Return-Path: <linux-arm-msm+bounces-80890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2CC446AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 21:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821323B0345
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 20:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8319823B60A;
	Sun,  9 Nov 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evFm7SeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw4AxVoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3471FCCF8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762719325; cv=none; b=jurWicJ6Unm0guzhZSgvrWby5Ti9fQJEE9zy3V3SCYsDG77MuKIRW9aIRmCYM15FOQ2oVYj4sxqG7mtnExeB99A0ePSTBRFOolSkqX28sx37IvPiJDPvSQ2o5T0PNfApC5HAXviUQVsQtKVaPAUdfOaAD/vO3X7HqkoJISJMrVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762719325; c=relaxed/simple;
	bh=VOhLYQV7vxgT9jsJn0omVQqhVWq7VqPmdXzqZoeD0mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxBj2+zJK1IROnaVsuX8SFQnt/xqqarp0ySSFKWxM9TL/+66o1WmRvPLMTimZGckOkcPv1xXCxfC0Os+oUiL7ysJxbVu3w8uJspNslECYq+aYIgwnR0eBxoCiZ2G3/cpoS5Uw1agXppblu8HVHlSHBB3dkSqjeck/KYYxtqhFrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evFm7SeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw4AxVoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9JhSBC1476907
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 20:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yWxI7c/xCcXaq0wTIFDh18pB
	mx0rP7+GbV3s02BhTRY=; b=evFm7SeNCzTz0S6GUcj6Vdz9U8xy7rwtuz64E/Cn
	1Ll1LE7MrJQ2qn2HFdi4oUckxKguhbbUAHI3GDE1SpO1hctIhUMCqGNgtBCzKHkz
	hc/Qr5oNMUeHQvy1Px1QAvIiONEwRP28AtC4SdzW7Q6C3a74pw5SpOTuVVnNUuB5
	4ERQg8+9onwGJSOeXYRex6IUjgT8e6+T+A+nCP0LKw8Tt7TbSRmIKYO6fDuLZKu9
	TpeMBnOJdDWW9cUCVUZGKEaAuXpCH+N4Ir2IiDUFTsMBACAQi7D6CzwQ78c9q852
	GzEHw6EhdqFqXwlKNYPA5lFeuWLwtNidGI+pz3xs7I+gNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuejkvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 20:15:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e89f4a502cso70275481cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762719316; x=1763324116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWxI7c/xCcXaq0wTIFDh18pBmx0rP7+GbV3s02BhTRY=;
        b=bw4AxVoZBS+Q/hwImh6H/0/cxinVzKo7xjwEEpHbyR5pmiXndCgGzd2tgYm9YLOR6y
         GssQBdupGQX8D6OBHSwoYycpQjy949BMAYtkgCxHXF94Iy8u3B1Coq4txwf4RrTr46w4
         7CL0w0GYXz6ibNXZQ3rh8ATvtQhGXgu6c/5QDB+4TVdVlYa92ZKg93cMa8eD9VpB1iVT
         0G6FaXmVYbizjg4EZ1LDSG0gW45+9nzOHg/Vbw33fNRvOFQEfrE3jos5va5edlOgEXWQ
         JdH6stDku9/soUpg919q1m+KFc4OEaudeYMfa5Jz7peUpVqOzGDXMEgDd1sMbE7CBPKJ
         X/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762719316; x=1763324116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWxI7c/xCcXaq0wTIFDh18pBmx0rP7+GbV3s02BhTRY=;
        b=pa9gAu/3C1o9ypEdzJb/+JWfC/u3T4iRD9oKNuTKGCNwSff85elcaBCBtTIZlfA1uR
         2ewVp5dWao0OQPKDd1hnwBRXSkNQ93UdRHGTHUrRNVzssabz9w4ToMZlL0xc66ZQF2XN
         g2vurUt3JBI+t/WM+qaPGaazyP0QAjumnHiMnOjpNmp4GpQv80JCzpc/qtWuk3ia+tZ/
         7Lt0IhJVF22HkhMVLpZ62HJnI9wHj7RRU1ITunkLEch84nw0aE2CDpetglkGjTI5aJc6
         wBx7XIXifxaFaDfFQGGbCV3ZqQZFcKHyFBht0CTAzetbv1P3Xj0AiKw8ZZKGtJEqbH8m
         hiUw==
X-Forwarded-Encrypted: i=1; AJvYcCUpIt7DRqN/O0UTdRHp2yv+SIWu/Jdx2seV9q5sZCff38EkJRdW6orBBFVomEKSk6OQU4xfLdyfntud7PNZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Uflb+75LMHa/i2P1Vj/NNXF/iRQ6U8ZSDM5N4VtdGoU2FR36
	2rfdRgRktRAJhFkXtumWghRXVTc5+bfimL3anywEf9VlZwQOx2nnzzDy6YavjD04cbxKHvGzjcD
	Haf3+Xly0b0vJ4T4mDhKL8lR/WVDuCO1XzNdbMY4UKg0BGizbLvOk1DkXMVJBDTzj8/gA
X-Gm-Gg: ASbGncvlM6/iUkRhQ8FjZCmsL08RiprtcJk1svpcC5IAJZ3kbtPOJJKmkupIbNXrh6w
	DhFyJ/kiHX5AFGsoa+vkJDDRm74Epdzy1s9lqiUuswG5L/Dz2Jq2JZPrDZW0ZsGY3iWig66cSv8
	FE68sK8PR9SzN0K8LSp+9tWijaEE2EbE6OFh1oPTl9oVYE8bgQclmBW0Zv39y9lIaH6GiFT++Im
	1JvLaftXbb49pGZ3Jo0SzQl4PAo6sTbNMXJ2X9Dw7PEsJIJmINLbP2B8MQiL+rNIxKP9stnBIbL
	7oYyslgDR+LCQtzJoZaBnLqwjEdk78RG1gyNK7FE6oplypV3ShcEcoQCGVjhz3TTmDh8BJcnj5E
	PmcRaDkj2ezPwBktWhQMLEO+CcOJ1ObLiLxW7sP1owIvEMSG2adEhmf+zPyt3CsfOiVEMx6sUB7
	FqP2B5oDVxHg0x
X-Received: by 2002:a05:622a:216:b0:4eb:a622:d95b with SMTP id d75a77b69052e-4eda4fa45d4mr92917121cf.51.1762719316378;
        Sun, 09 Nov 2025 12:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4ANbjuNtvdPFjoWMfYFMHj75q9eDCNJ5y/zkuJHUzlm9IN6fj+wQpDYG6CnEJQod1EkwzxA==
X-Received: by 2002:a05:622a:216:b0:4eb:a622:d95b with SMTP id d75a77b69052e-4eda4fa45d4mr92916631cf.51.1762719315862;
        Sun, 09 Nov 2025 12:15:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f058488sm28640561fa.1.2025.11.09.12.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 12:15:14 -0800 (PST)
Date: Sun, 9 Nov 2025 22:15:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
Subject: Re: [PATCH v3 1/1] Bluetooth: btusb: add new custom firmwares
Message-ID: <hy62tzg5wyvrsmoebu5miair3a3s5ycvp2xisrjpwda3obnphn@uvkde6ddl35e>
References: <20251109092437.252022-1-quic_shuaz@quicinc.com>
 <20251109092437.252022-2-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109092437.252022-2-quic_shuaz@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDE4MCBTYWx0ZWRfXyVjKtW/F1fga
 6TAl80YO2D1QQzJzJ4w75CPuCMdfg/qThCKqq7RI/v9K+r3kdc5rrHS6TWmgkb55Qkpok5q1QKC
 CIE+0nUdHc8Pk0I1oA/1YTwshJQ55I2CHwBmU+NuMj1uGXOCJb6sS2AAacpxusk8VsBgRRBFGL+
 1uxnJR9T+l68RJHs5H+l9ucHqSLf2IWk8z3Nx6xs084FUAiE1HDoTc0cErzN+8O9217jQ1d+S1l
 jjPkxR6gFf93RFtGtb7xuVhZcejA08o4gbNMdJ8CALA3oQ5HcPyqBguJMEcrYXotfBT/9NOquSI
 tS46xFUBxtf8SgluvBY3vHCOP2ioGUOvMhWTNqAJjsQuC5VbiV4bqP1nI7C9RQos7HyGzviwOCO
 NIirBHTQNuLAEY4wyguh4LWtbwNeEg==
X-Proofpoint-GUID: yk9nKq8A4yF50SVpyBG0pFyoTJ_nETeP
X-Proofpoint-ORIG-GUID: yk9nKq8A4yF50SVpyBG0pFyoTJ_nETeP
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=6910f655 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CD0cDsPEZmLvIrSJVGoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_08,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090180

On Sun, Nov 09, 2025 at 05:24:37PM +0800, Shuai Zhang wrote:
> The new platform uses the QCA2066 chip along with a new board ID, which
> requires a dedicated firmware file to ensure proper initialization.
> Without this entry, the driver cannot locate and load the correct
> firmware, resulting in Bluetooth bring-up failure.
> 
> This patch adds a new entry to the firmware table for QCA2066 so that
> the driver can correctly identify the board ID and load the appropriate
> firmware from 'qca/QCA2066/' in the linux-firmware repository.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/btusb.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

