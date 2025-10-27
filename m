Return-Path: <linux-arm-msm+bounces-79001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BDBC0FCBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 082884FB110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929212C08D4;
	Mon, 27 Oct 2025 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRPeAO3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A742D640D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587473; cv=none; b=BYiajT5qM5TMgivwMi0BTOI/wpuwTYoXdkaF9Zm9rDqFxXX9Zgykr9o2gKt5Am2Lapuwm2nijZYwZaRdCwEzdoOENjH46/SW4Eqergr3PZBga/2gdanlwRne8BcnMnQOVbeQSDhvtGVIhHOELkSDOZmQgAGuDbDJ6ItAiDizuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587473; c=relaxed/simple;
	bh=ZrSHSXBna/tSJ0DNE4ptKGSEHis/i/pwGD8WXYjPNaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgBDiZNEzjokxT967+QJ5uShKVr3WNsN+GcyLpA92jmypKrWSxM/M9LvJ15cN2aWqmEjaen/rA9m6lK1hBnEaeUL25B1gkLhg5XOlBo9ECQmOVegwys06gbHCCotaXzDDP8p1oU7nVNSG1EeeBMMUso4AaPQZvtGrEaMd5A3Fw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRPeAO3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RE4RLl3018086
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 17:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc3I6eQ5vlnsRGL0FgP7OAU89DvmitRm0td3ZPgIKrk=; b=cRPeAO3DRqArc7aI
	GcI/c+Z1BTjITzbTFIaiR//D6/LTwVrOqcEiPlrO8fpxoCMbkIKoOqvAUbo8UUSg
	8WWbQwRiNw86DIiUGCv9VRyezslpgpDMsIGFvrS+dNg07SNngqxK997xvTwUN3JL
	ca9zoIwrSUrBS7glJiy3GtqTZyN3YJSZFebci6GPzOTalyekUa3lC1lekueDunAA
	3HXZ1uddvy9G5KE+u/UzGiMrOG/fBBiGqc2o+QL2eTUBXAg9+MSE3YwLsbyTcpJT
	K0Bc4uQD6hP8QTDRouYDiJF9h70Ox28yJVXF+D6+dsFMImFI1nH4A+wGuYdCmj5x
	AJ9e5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2a6a8syg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 17:51:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269880a7bd9so50219195ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 10:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587470; x=1762192270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc3I6eQ5vlnsRGL0FgP7OAU89DvmitRm0td3ZPgIKrk=;
        b=cJfKFgiqlht9ojwwfVFLfJA9BtJnGVfDHVoVJTuYwOZdWoLRCIzqg5djOzixEv0sBd
         ZiRL0BHb3lHax+tfCh5XpQ9B5CbeqWGvFyTKhx3bIg42tZKus5A+tBQiSwY80fGFKb15
         YvMsnpklvIX5G4qb6Ad3deyXSN6aMHf1w4iTr0beDnxlFv1O94IfvCGYp0mD/VquqMTW
         bGtKvINujqbWW4AOQnIpxWaxdHObUE5IRkkK6ctDbQjNZdTfjneXWPgMUofMcZK3d5u0
         VDqNPdn8LKD5LYqXkkdWIxZ5wk3nSFltGhD/Ir2wvuYB0yuUk7LUtvUbZJBjh0+i5UbT
         gYdw==
X-Forwarded-Encrypted: i=1; AJvYcCUPphzYHNovtF8MIXSOOwrRUwnz7TibZvwd2gwIEl02vIgzPF+Wm1KX6jhlt8T9nt0WQPltwKmTl2dFUDOm@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5uej37IMCzGIQBfbM2s6E3wSzaBtR/MQ4IYTt/r1sBnug2ox
	WQ188zymXerpekDRLmy5/ICfJgyfMv3UvJdJPfhbpnczsakQydd2MhkFrgG29qQzMlpP0RFlIR3
	yRn8SALcUgJAvrBcK86pmROJV/utgwH1T1TTOXFnoVSXRYUbvN+cTTt4HP/YUb0BrWqVn
X-Gm-Gg: ASbGncvaBXQsfTQ0rwaTNiBTO2I3HqWynY1G6nwzRWH0v59abhp2EQwffptLcwsevg9
	hRP0fG6eDtJcKDvbVpaBUviGOCeaPaj797ZPjxgOSaFJPJ6vxkuKcxtp0Z8TjqMUDp7fcccAiS4
	akdX5hgzGbrerd0NDVrIPoO6AidTGVQL26uG4zs5mHqxtQdLpDJXakUoUBDfzhckXHD9ZfnG8HR
	BfGs2eKMRDp7cuAvsZ69KSeHJERQljMQeZ1pG1YiZdz4gblcut4s51sU1yG7rlCqzZm0LpFCrxs
	HienoxdxDwDGaDa2nrM1jXHOnrSehVaj9i57V+eN3RY+8w9fpFs3yFPfEpzwuKXt5RHTnkZm2Gv
	j2WitbOhgS8I+3Vi7/xrVCeEHXm1P/Xd6ynP2pAKAJtq5M9Rins39
X-Received: by 2002:a17:902:d50c:b0:293:e0f:3e3 with SMTP id d9443c01a7336-294cb52e567mr7378505ad.29.1761587470180;
        Mon, 27 Oct 2025 10:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE86t0avflsAWGB3DYHKso44bMq8V2RnGM7ODfwDlqrvydnglrQAqzfCOvgkNkOR5jRMLTA3A==
X-Received: by 2002:a17:902:d50c:b0:293:e0f:3e3 with SMTP id d9443c01a7336-294cb52e567mr7378085ad.29.1761587469709;
        Mon, 27 Oct 2025 10:51:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34028fc5cc5sm71942a91.0.2025.10.27.10.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 10:51:09 -0700 (PDT)
Message-ID: <bf677e6d-8cb1-4e6d-8f50-39ca20ed6494@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:51:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Zack McKevitt <zmckevit@qti.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NSBTYWx0ZWRfX73o38CXz1fI0
 jXeLvgGBslVRK8R+cakFzY3JhlQp3juvNm8gvtm9oOvtijRMIof4lKkOdLdf0Nmy2stujuc6bV3
 RCaAP+HpBWH0be/hUJSiz1xJfP2LmP7ERU3KhP4yHSXNJ8BwIZzMCH1o7rj7MEcU6IBTUV1jixd
 Qr7fJeuz+CqTGwgV7TZIWowkyv2eagJFgdHgPSkHCpjykiTQK2azgdNU/4TKeuEepH46l4th/Jz
 LASWpmd5ev/I1LTOlHJ1V3SXQsyRSDK4loNSbO336CUvdwDFDseznlHNAryB7XANGIXkXpDtTJL
 aJnBqEFkcnTM17TJst2SSDyF+3zCZ03FRN7eP0tuJdfAaVzlO2p6Z5VHMZwJlpvQgtD1ePtX8m2
 y7TZhMOIH+bU4qytnv8YDPeUc6bHbQ==
X-Proofpoint-ORIG-GUID: aNqXfJXxE8Lo9RoBOcRUwkE8gZp2MkqG
X-Proofpoint-GUID: aNqXfJXxE8Lo9RoBOcRUwkE8gZp2MkqG
X-Authority-Analysis: v=2.4 cv=A6Jh/qWG c=1 sm=1 tr=0 ts=68ffb10e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QoCwUzDOKqydt9tafI0A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270165

On 10/17/2025 11:34 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
> 
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

