Return-Path: <linux-arm-msm+bounces-76109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73343BBF39C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B7F0189C1CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363DB2DE1F0;
	Mon,  6 Oct 2025 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLLUaDEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813325A2C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759783228; cv=none; b=EFyZCTY5zbAmDhufmBxw5A24HaioFaUj1p3e2a7K3vPc8LF51GrvXCzgkEOOA/HIBVrpt867xRkfx4UieVl5OGamZQHz+j42vYRKutohzV5XtThVIeYAFLg5vdO3z+ABEuftHKiEWSf/8dPQOI72CFKk4YHTSHcNHESIrNdSVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759783228; c=relaxed/simple;
	bh=bEuaeW0AI3Kf1tc4gTsMq1465/a28GFhLe0G5PTG8DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoXj1ZcXMEJzrPIlaKaqYRV51PtJ0S+xisYPvuG5pu7zOuDzDuOoHaUblLgBI8nW9olSsBxJFZiWBJQKEtVWGZUtdrs2NqHnBMRSQ37jXX/S0bYpjUfM5cEFFMA1rAWQASLuqsLrWw8uy60/hEhxM1R+jwL0wD0leNZo9HoPLak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLLUaDEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FBnxP025066
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 20:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXNjTVX3iML/A/etm192jSri1pqvVbrOkDWSRs1g34w=; b=iLLUaDEXNrWKQ9PF
	n8vVBzJCySSTFAJI+q8ok31UoilP14t1Vz7UGesIUVUYcjdWNkCgliZCqVRYpR6W
	SVu8T0cF+xVuOB/Ix3gDFeYWwXwh8Z1LH+tR3jux1S2VUPUwnyAqsfVcV2aRcWoA
	NeUWxpiVkoW/30NcAzXFCjeyE3B2XzqeVLzDyBEJ9qGAszzmvcc40dnsgpnD+JLB
	7w4azO2LhkzB1xkPYFSvLuiUmp2hbMjx76Led7zhIItYb1/PZQVY9U3nQYVWgGqp
	E6pubtw/D4f9VNvORXH4TYd6Vd5ihhsVk2sEBh3NiIEyxg212xnahmr7uIgSvzB/
	jbdVkg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6a8tv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 20:40:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33826e101ecso6614159a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759783224; x=1760388024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXNjTVX3iML/A/etm192jSri1pqvVbrOkDWSRs1g34w=;
        b=qnkfbWl7gDWTrISRuwWK56n44VFgii7b0ktmSoYxn/RjNdOC5w9A8IhgwqiylcWrpz
         lHTCh+HM7nfSNA2K7XAq2BfLcV0pTuoqSPCuWMt6JuYYWu336iEs66Kr9KhcwiI+Wqz1
         efqDDIf/wxw1yMwAW59+6F3agwoq/8EeKPTV1To8hJDHFinMJpmNegRGi97/ckKNqeN5
         KRuUmz29HHQJA2k834P5IQiXC4VVAU7xLsVjwgdaWXpTNoQ/GWTUPMD06AlbGlQSHF1U
         6M94Ij7EUxzu0Y4POkJUVhNhLjEsYsohuqHDI6o+9CHyJmCBuRYca+zFGjQ8XxcBWowv
         ijwA==
X-Forwarded-Encrypted: i=1; AJvYcCVIU3nL0EJ/dQ+F6Eln+XvaeZbnq84lBN52X+WSZNzT58FfY8Im0C/bT531vWbtO4cUDIqHwrNgsjdajfxS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywos31s3QAAC13PY2Tya/NANNXP+0BHhiimZ/ogYhJuo6kdwUfX
	EzasF6cTXgQRSODomk0JJkUklU62dhvNbbbX8Sg2M5r2h5fDsEtqTUKYjoFmacDAGATLfmQpJwG
	YM7y9onfTsQ8TgD7M7i4RRddaafAtU9N1IZjqsBFWe962SWhE1/gvospNzKseIwYiqM17
X-Gm-Gg: ASbGnctGlHrHGL2nv38JjjUFjsNbgeCzWZbVxuRuDcxtvaV0Dl1cF2qXxL+7WmbXsr7
	gcpw/T2EZJ+dXQYnj8JuQwvK14CePVvKQ6RxinqF7wJPTpagEqcfjwITEhmj0yXY1LQa8kPrEtn
	mnV/h/ycXnM2pn0fYs/gOu1fqpiDpgFeN8Ju+/ty2f2TqjBNALDNw0m/ZY0vYZt/QWiXO280ROM
	HGKE65MZ0nCX1j8e8aXyiq3lC1YUYWGwQ8Y+NnGJEjMoGpt8ruEbMzFWSbQfVAogVsnT8InNxxd
	Goy48CrVZ5jaMggdiUw9hbAZOd/603xP6SGv/inorx1W34ydwC3BxAi0VyEXgvzOepeOQLZMExd
	4wtxl8HedqIeqog0Qovc=
X-Received: by 2002:a17:90b:1b0b:b0:32e:dcc6:cd3f with SMTP id 98e67ed59e1d1-339edac58bemr1131991a91.14.1759783223715;
        Mon, 06 Oct 2025 13:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHj3I/2pz11+BwXv4abtxSlZbMuekd5HZZX3dCh5I99qOPxLV3ZwEMUhPb47ehFB/qsHCnlw==
X-Received: by 2002:a17:90b:1b0b:b0:32e:dcc6:cd3f with SMTP id 98e67ed59e1d1-339edac58bemr1131963a91.14.1759783223238;
        Mon, 06 Oct 2025 13:40:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a19fe4sm11968468a91.8.2025.10.06.13.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:40:22 -0700 (PDT)
Message-ID: <3ba3216d-4dcd-459a-a3ec-2ef0567e75b9@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:40:21 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace snprintf() with sysfs_emit() in sysfs
 show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, ogabbay@kernel.org
Cc: quic_carlv@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e42938 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=NpbQ6Uf7XBcvSWM2wFwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: oShYxVoWPycspZr1DITY-u8PoVgaKO_z
X-Proofpoint-GUID: oShYxVoWPycspZr1DITY-u8PoVgaKO_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX6AwzjMiYcjhA
 lGUsYo5cQCFLVsjVgpSrzNJBG4yNRIaLlO6IJcJZMjY/AS2XMghQqj5jfsFxfp5nS2zSbxShLXi
 WuPb4dz3V9Tl8YyJlO9wF+MHGH4RyCqf/UIN8ELScn6QjstnFToNMuNY6HM1XJYsCi/YzXYwBCD
 gky7FfIuxvZnOOcNv8L5mj9P6q/52TbvaYv4Dnl3PkSJqwyqX3w8w9PL8BrGSqzoCCP0kI+rluQ
 8k8emlFwNGousPJJ8+ZlBIIiaH3qrIZ9KkUa1FrDAUF/G1CQ2gHzmJo/nCF5/f6NTm87m9vvKHa
 gSOtE5BBGGChotvOR+9erCdqo9/TBgH3B7eYlWuoCsVezXqBCHEnoogU/78i+6nQ0X/3ruMHs/e
 u6gz31K1UGVwwQdFkvZGf47bP4saKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

On 8/22/2025 5:28 AM, Chelsy Ratnawat wrote:
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Applied to drm-misc-next.  I fixed two typos in the commit text when 
applying.

-Jeff

