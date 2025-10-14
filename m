Return-Path: <linux-arm-msm+bounces-77225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A0DBDA207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D015D356270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0662701C4;
	Tue, 14 Oct 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/3XFQz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3D2FE584
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453223; cv=none; b=SHF9hTm8ZV1MMuf7Oz3oa2TIm7Zj0VndKq5UE5eNHDgGFeoGVGBWkSzQOpN+HpQGyvRK2eIu+1DLn3UI9Q+Uv2F0SI+ogcszND/a/1N0tqJTwiF1iuS2IOye4L72+toggBIi/0UHhao1QBOUQ90ma8E9dBJ0DGBl9+TlgGvMm+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453223; c=relaxed/simple;
	bh=h2l2ynGcZ7tEQCEyDYSIAN5qFkBsFS8C/bx5/maLWMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQomzIHs595TQmsHeF/OPB7joF3eWgexpmM/uLqUA1/wL7IpJnAH7A4ZLRKWei3zjAkzfeDY0+iaZiH6yL0G9p0ritJzyBAyR3bGhdBnfrgaaw5YhyN8QgxMJLRi5H+gfbb5Kab+3ICPKqaJcbTITApvYus8c4JIMpIPnWowAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/3XFQz/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Jcd031029
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfGSxZD0pUjuDtNfiJBnpn0TrxSH7SFM9cz+J2T26ek=; b=B/3XFQz/HGAbCyI2
	fgVQNPP5pXU2no0ZaWGg9jBvzdD9XCDOwBye1xBY30Bvvh0QYfrtJAln3vGgdzQ0
	mQoWaQ238LVyqmAlf04KRiROzGe6wkYo4rKMkZmUV417Qo5O0rpGn42Cq7QqwjIJ
	MccH7tzRCyIrC5IItvE4gcT/kxZcTovLWsvak6cs3eVc1qGyXLViNC63K8Ymx3wF
	p7nQ1wcamp3XeufpddEC5YaVpaxFVcHxLTArA9gEuZCHXaaWqv9Q4bdYrSN0WPkJ
	VwtgdTu1Qs/dlzm2CvkEVclJCL3hNBA2QHzUfsMErz2t+IILWsBdLa+/d7TQGc4Y
	fc6yww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0ruxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 14:46:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781253de15aso16851709b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453218; x=1761058018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfGSxZD0pUjuDtNfiJBnpn0TrxSH7SFM9cz+J2T26ek=;
        b=LR57hjfT3lf3ifOZdESLO80ky74IhPmvhYMorG+g/CXoLDqy5LA3bN5nihGr7mrkwI
         glGWiLSCXuxnImsBQVemAmjggOJUVRX1Bftm6UfopGfGJhBm+tRfUKHiWSEhYay79UXS
         3XymUILt2bPuLQeUOXyvQW3c9GvdoGBnngzZm79yY6z8VwL2WzPvkcBBfkNvjYHIgfaf
         AmB6vt4Ag0txTR2TLg4ryNimDsM/BCLwwNCd+siX83SAr+yymHN0EKaIg3hViL0qNlsv
         +8np0x0jZG42z6MOKjrnEHepiDhJCncn8TvXDn5UQq+IwaJIcKCiOIL1lYvzqL1zZxdm
         LvHg==
X-Forwarded-Encrypted: i=1; AJvYcCUUPBzD/2A78knHyZuOxOtrKH8FCAGJtkmovXPHAQ+orWGQZYcvGinIwI3VquwI3OgX3FXU+j4r3V/ifvpj@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJaJF5Jt5Mx6y0ImL7q/LbvLJLbixM5p37RSWebdMd10zG2UB
	M66ihK6dmMlSNU1twd8k4GAFfaO+ATUxQv4bQLd9WCyHrw0Ls9+5QUVBKuBQHX6dLbgU+W5C/xR
	8c2jBLeivupyb7lBSnAo/X+FxrQOW3NHMYbyQpiqCFFZG4HHIzB3HqHhE4kWsl6Rqx4MK
X-Gm-Gg: ASbGncsKribqnPHvCLAMd7rXU1EUoIdGIQBT7SV1UiFuRIIKaEL69tSQV1CuRtuPX4g
	ODUay7lIr0sr8NvQzH2wrr3CS8kkWs54m2BppVAeK3IPiBXlcOwNMl5PAPnlBgoUISDV/zkLUe9
	t3lWNSs/XX7n9GqIodxI1zCnzupQLqak8UvkS1d7Xhte6HvSyTIZ6KcXgGm+jQrG3Ea7hRu6SJF
	yVgHK6gK1InKkV5EIx53p49Ah5CETvlteoeBm0KEcgITUaawYo6pVUM4emW+UmSxN397WkkZsvk
	+5C6/WAfMLEvrAJMZEMqWbzA4muyFyUWmBte1FAmyu98s9PRvbdr/CYs9WlWFASWr1CIF6BFh52
	1ioxmGwK+r36+HA==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2271:50df with SMTP id d2e1a72fcca58-7938714698emr30759971b3a.19.1760453218168;
        Tue, 14 Oct 2025 07:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsV8Su4zb2oR2757D38whcD7yIUZ8bS04uFGMgdKpQqGzSIEG3DnTdJHPHE+uFWtFl45RmCA==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2271:50df with SMTP id d2e1a72fcca58-7938714698emr30759947b3a.19.1760453217719;
        Tue, 14 Oct 2025 07:46:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d6aca6asm15382005b3a.70.2025.10.14.07.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:46:57 -0700 (PDT)
Message-ID: <1b50727e-cb67-4098-b951-280e9fbba8f4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:46:56 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9eZDYKibdbIg
 B71n82jSFGYtmCTPUZf7JCsPkCPbdrZvMzZu730BpUKwek7NAexze+r9T9Jvsknt0W/ts5Uc9Ef
 LVr+E3NKVeSyq5yMEsMdYp2Uhvt+CJHJ+iyYkPAWPcv3zSOLfZrtgLpg7dbD3ORF/HRHV2j2CVC
 r3+D7Y3hon8zwJGYS+S1MEdmCHD1vbwlzWbPewvJiyLgmwREDTjk0KY4LHqcWQZRZorWtCFbXuj
 fyJhaubEAlSr2JQ8USyQAFx0Kf6fnsxUR53Wf+jCG+Rt0Cqhk4Sg6AIuwUsxb5wPCWW6i/47Qvr
 4yzK6pyHIJEm5kGGkwf2CE3Ki2HonaEn9RnT22UxHAOcSxvtOgUF8RsbGaJdZPtpJtf3DB9+ODd
 FsFMtrHm3OuZz4gCizDBw4C+RUzvQA==
X-Proofpoint-GUID: plnmYmQfFq5ACy5vsBSiUsWR128af6b5
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee6263 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FULVd30_qMWwzReR5z0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: plnmYmQfFq5ACy5vsBSiUsWR128af6b5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/7/2025 6:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-fixes.

-Jeff

