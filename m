Return-Path: <linux-arm-msm+bounces-53655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB4A82868
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E725518907AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E01133EA;
	Wed,  9 Apr 2025 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT78wl4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3710266590
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209669; cv=none; b=HVSbIMI7grzJNj9dTlCMUc6ue5aAID86YwZXBwJ2wGMcnOsQnQnM+7LXwe36I1eSM+gntIwbU4v2nxj1oqNt2D1VElpsTcm/7abq5Yc9oaPoHF5fZsO7lSk60bUJeIXmN4maO2K358xrDUKlxH8zBSNmjjOs8aecWhtau/TKxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209669; c=relaxed/simple;
	bh=+jAaxo1TCO741+kpdjVMq0f8msIm1aVBprj7vRnZB9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4TDyp1Cvm2iDg6vxxa99UYMtu8nfYLMjTmQ62DY4VhscboTEfYYLcFi1wTbOQlBMlgyhd3tzbSxI+6+fBvsCZTfiwcBbjEu0GmEk8SRXyvDpBTuNeb01VtVuJbxJskJYcraJZO0qKoiuRhvaW561+oBO75fUq40093/NhHAF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT78wl4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5397n3q3032578
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 14:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG0gqeloi7FE5d7p16XRDqhtX9K2zsgebX8qfY7Te+M=; b=jT78wl4XukyH/die
	0Bj8lEldfMDGVTa0F15PvGw+qHq7UM1o5hBL7fEkTv11aZsQQ2DLxkbUe6+/lYJF
	yA8MnajdBub8F/6K2aBBkwAiQIyHxcdxbPVyjZ0sDnWcD19cboQV+htqOy+LkniG
	fv0y5RjvxHdjot7WZtMdAjqIdy0oosrn+QrYeCwNWIDHjM7TlAUOmYt/x+gnhr+E
	HQu+GdrZu/vK0T5qZNSV39+VBK3IVqdUwONzswXj4k1o7Fn2tNlLsWe8A6Dqqazc
	fpITKQ9NJeufUQT5+dO5jTIW6GW9pYuXsAfiG+28+mhLK1MwQwem0i6YCxAO2u1t
	xyn/Dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbebrfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 14:41:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225ab228a37so61662665ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209666; x=1744814466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LG0gqeloi7FE5d7p16XRDqhtX9K2zsgebX8qfY7Te+M=;
        b=brmFGLhsAWpKNalPK97qrs/oMDB9+3KAPSHpShomG6qgVjRD2FL4IhoBHPrxYdb+iJ
         9IHaA5II7SIXNrW13pdwShBG0eQM12ITJI5oymuaaM47EIdnE3O03VUOAmEp/hCx2WZg
         QeNLqX1Dv8W7j3g3miUqheHZARfv5AJr9c8Kw+H++KclaZNeSLl0Ml1CwXHHHY1fy3t3
         o7p/Y0pYvpB3OurkPyQudipJ7OxlXs49VYA3B4OxcoPNEjGyDgl6gbUI8tQ8XfLUE0z8
         wUG4M3Z/RRmSdP88F/vcQKLlhWysCCaWg2l67zfQurVE2QRyH28UymqeAk0sjpHe/Aqg
         Bkmw==
X-Forwarded-Encrypted: i=1; AJvYcCVRwut4yped5iEfLpbopzYt2Gz0AZXz18q4DMwuyNxLNT9q0FcBZBWvwiPzCaTyRFMvZZ0094BdlDK3PqEc@vger.kernel.org
X-Gm-Message-State: AOJu0YzddyE8uYWvW2zRDuaYdaFdxW41Wao8rDFE+8ax7DdomEaXTbXB
	yEv/UIKUcigLVyiynCW46HWm5ClHqmybaGX7q0wIkXUak5m31DAtsUbUouikKDrA9fgMS1BJKXe
	k+Bw26d63P42osLFrAX3IpF8sYe/vt+tyL+l+wWpywuQPQFrJOplVcPBBBaso4jJh
X-Gm-Gg: ASbGnct/axIypx3BT1fIpo2lamVHo/keqmQngXw6rKJLM3vLeX98BuPznrj+orrwQFt
	YNBkXg4Ofj5EHcIM7GlzFSO569TUa+sfwL0WiTqctmuiIX4PAXVa8Nx65ibOroLE7SS74q7zbtV
	kBY6VD0PdvLvDDS5s7SzeuPyPdOPHwOD/upsNRead7EzfV9mPCNUDh3Zw/bQ0YhdSZO/2LEce4Z
	TKW+Cv89r3ywECh/b6U4gxpsV3exklnfa1VH1Enm1vIW8kVqT0amJEd5IOywqSoA6BW9jt8BywS
	fv4t/+OZngejXzQSDvHykFUZHewkCC01lnNOm4b024sRuW4P7Iytu0zm/5DitA==
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id d9443c01a7336-22ac29a7d9bmr55332325ad.21.1744209665717;
        Wed, 09 Apr 2025 07:41:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPfuY6hqgOg5etkGo/HTOxudMRDkIQgYiO8YJN+34a0GSOQamTjc5qFyXZO44KKkIKLc2Acg==
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id d9443c01a7336-22ac29a7d9bmr55331925ad.21.1744209665320;
        Wed, 09 Apr 2025 07:41:05 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6511dsm12744275ad.7.2025.04.09.07.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:41:04 -0700 (PDT)
Message-ID: <27642cab-9d0a-4989-9f3d-68f329676674@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 08:41:03 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
To: Sumit Kumar <quic_sumk@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_krichai@quicinc.com,
        quic_akhvin@quicinc.com, quic_skananth@quicinc.com,
        quic_vbadigan@quicinc.com, stable@vger.kernel.org,
        Youssef Samir <quic_yabdulra@quicinc.com>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: prUsRC_ZUfW0kCRF3gVRc3pWK4o7qu3V
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f68702 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Mw1Om9em43-oCLZg1R0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: prUsRC_ZUfW0kCRF3gVRc3pWK4o7qu3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090092

On 4/9/2025 4:47 AM, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

