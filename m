Return-Path: <linux-arm-msm+bounces-76474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB939BC64A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707A3405D6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1919928504F;
	Wed,  8 Oct 2025 18:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Udj/OQ61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECEF283C9E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948034; cv=none; b=pE5i7yizofYHeTGWb+rt5dwsZejQWzgMyATy9y41bxY6i+WyQUAyxCqRyZxIWBX/kr4XLTvjU/mRWd3WQKiiz8c9VDdYjIF0vo2lk3IhGPuhiPbhXSwxYU48REbGC7dtywrVUqe7V65DwUz5Ui7Dntk3+hjniYo6wI4OjoyVfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948034; c=relaxed/simple;
	bh=GNcekzD6TinGcpxvU8VPBdgNkat7HX1eI0KX3x/e2mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSDNJDlIc6QNotN9OOrZe6wEVN0W0K5w+7PWDY9ULAUxqj3CgOYaw290Rccbe49qwvLo7QXhhdDcdoU0GadesmwyAstW8QGnB6G4XZXd8ZVRv50bZPbgRQ1dZ8Jiz/f6tBZYGuYsjZ9deOAmsfGB9twThizP3zavmQOXC3Dr4Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Udj/OQ61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5djH009110
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEtc+TcHZs/BG0j7p/wx3/HzsUUUzf3QcGZUF6Nv8Es=; b=Udj/OQ61PPTHXxwo
	Elh7iBhAynBeMn5CdxlSBCxAWB6D+70uMGhKmvfwFUiu/b+pJ6gMAJmWwTs/iOGx
	CTV9sLcAVWdWylkV1SDRHw2I64WjSEDLuxFb9Q81SCZd2P772JnKrHTim3UXxLed
	2KRTn5IxspmXWUFzeQDrvQnLOlwKhIcIQQmUgeWY8VNsTdeK73GK74W/DBQZCaIY
	thifF2dl82SCB4y69Bxddi5usQEgKInhsCprfVrs1pRSOLYQeevg4J4SzwPyYxMa
	9W+Eo49+lF90dJxqzfBjRA3Bd227EWAO9DIqSeqVoqWvathrbLzuDDUF53bcXkDb
	MnLiwA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4n87ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:27:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f82484faso91632b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948030; x=1760552830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEtc+TcHZs/BG0j7p/wx3/HzsUUUzf3QcGZUF6Nv8Es=;
        b=HqTmV+TgeZfLqTbrq9+R5Z5LiQEgyf/PpN5uPBbmPpjQF+F3kVSCRL9wQFQIgS1ubO
         7uNkJ1KmG1BXeW0ecJ51uVKlgd3h1TThvoWjJm2+Seqgm6nWngu6xfpjE0JuXAgp0S4l
         hBuVhbwl2QNUAJbY2bwEvcHHGhXHYYyFhFo3RowQyIthhTHXGZLqDv8yCvBp4zz0p+wg
         DNOyykhQX6S2KVFAfr6g5ke01Kcb7Lp5RIQLgUvTBupnDYflTMtxIwkaHZm5klhqVDcv
         cL3aD4Z1onYthh9u14lB+flsaboOo5jt1TPvdXQhCImrU0i4GG62HWsl85UQ5r3bJoC6
         Iy0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjmtEyBZvRNhgoaE4AXBz6H3rjDlhv7NV57goZr2PfL47OiffNl375std5wIQtsu18TC3qo/S9Dd3AAjqi@vger.kernel.org
X-Gm-Message-State: AOJu0YzXOhwoTiFXdMdr6sYUAt9NFE7bGnd5I1mAXQBiD4iJTySWsbYn
	XMIlSm97LsFtWBTEm/8tDRTLpihAcADPkhuQ+KzKE/lDhPuoLZx69B1zaKtA5tMFtZZIkzNSR71
	o8orM3UUVTE7ZfcmMwYA+R/Ccl4fdVh5AUEqW+8wzPa7umE7c9W4fC0HGJmne0q8XwrJm
X-Gm-Gg: ASbGncujTbTjhggE+W6XivkSYj1fkqFOQtFtjj1/RGWj/U8d2/+3/x5SqQd8ju8OkXW
	Wh4aMk5+vBSnI2qmLL/CUIGJnOjKtX0VSvLct6EdmsiONfdbhc6o6gtDdwTVRY5PyZp0lXCssf4
	hJAMIiiN9s7SEYmwX/4E52L7iR/Nppq1NAYDWKvxettP6+uJ/QWLfVIrsmCeWHu2zDyoL3Gjya2
	34ZXBlPQsg4G5FrUq862puZ/qgXvhEOZZd4OJUGaVYdu+1amE33sdpHww4zbC4seALkH0a7oCrQ
	CaASqwrktpocu9o1eBE2tftu5rrnuFXCK/KrUDeY44IMQulI2nzaKEqpnTBguIkPbTZemqfQl61
	h19lLay86IYujrDwqEtE=
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr5515165b3a.31.1759948029965;
        Wed, 08 Oct 2025 11:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhOH5X+XDvbdolR+ekTGtwlfRBuaIvvlRos/xZajYdUrqKQ1KyBOo9pHTj/agC47o1a7+/LA==
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr5515130b3a.31.1759948029344;
        Wed, 08 Oct 2025 11:27:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b3c72bsm417567b3a.3.2025.10.08.11.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:27:08 -0700 (PDT)
Message-ID: <82236398-af27-4fa2-9630-f3e354e929c9@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:27:06 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e6acff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yfLkOZV7BJjjT_VdguZs3QRp7WY4cLTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6iCTcIVshaOn
 U0gmyaSt77MKtUkml1KJhrCIx0jZEfhjv0lQ7DV2/SAzTH6B9+4mBGZNpyX3CTc3AuMq9kh1g5W
 qwyKucHxtZ6+GELruFEV6H549r1LKYYf8XXp+ZDRsIh3IaAlx77tJtvSQFYyD7padGQS7ml7nHi
 4GjZAdRqWZiGfPew9KoLUPiECmhAtehI5aSuuX8T9Atpjxkf+TS/ah4y6Gs3GYbz5PuK6qAYuZA
 ULu8GtvuYyI59jYdYt0s2wMIt57gsLflx1KRLiWVr3Q8sGHksrxXqLDIvle5BwhTcUnIdr0Gzo3
 B5XoGLoyuaGXi7smJIhD7PyebxDfp1DyBmqh0jT5vKa86xVxqWS9v5HVV53P5rVWcq8y97dQcMn
 zEYPwps3nPBVtRwnQQUnalOikgDYVQ==
X-Proofpoint-GUID: yfLkOZV7BJjjT_VdguZs3QRp7WY4cLTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/7/2025 4:12 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> struct qaic_perf_stats is defined to have a DBC specified in the header,
> followed by struct qaic_perf_stats_entry instances, each pointing to a BO
> that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
> not check if the entries belong to the DBC specified in the header.
> Therefore, add checks to ensure that each entry in the request is sliced
> and belongs to hdr.dbc_id.
> 
> Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

