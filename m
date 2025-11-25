Return-Path: <linux-arm-msm+bounces-83165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E523C8386C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2FB43AF049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4D427FB34;
	Tue, 25 Nov 2025 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAMItyJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHRVshg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7162C11E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053247; cv=none; b=gJ9KCnebALNgx/rQiojjnYfUwCGRh235ZmfnZJOklXDtX06h7c5UeT22uYfeAQZmb0KUiSkzOJt6dS8CLcWk3gZ+q09W7XCFj0J1dU1Y4XSl9FGnG/LinDBDnOYIZd7w12B5h5iJNWvGZnkCrIspMDP8nfCZk1Bh5CaNTnd0noo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053247; c=relaxed/simple;
	bh=57DyOv9uLcqJ57p7hMYICcOHUx8gTBdK4ry90OTszPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqF8jR+gTddQUfmk03Ao+tZ2BXb02H0X6R2Zf7eBG7/Tk5u+MMkDPH8zJAJikmE19jJ3wHR1X0bs3qYSzim64DcFLmC44tHbFaoeEFs7q6rPYmIs9wt5vMFEOdDTctcPArcpWL0xHaODeSPceVJnGFd48l0tvGSWGj4u5I4eao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAMItyJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHRVshg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geEA1687811
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=; b=KAMItyJGXW/Pi3ry
	dE7sQ6OflnLQJICZGBl3oPgvnIf4G4k7Dtip5meqRdZYTaBDpzZ7BHjq8N0Dq4Xm
	g6XuZhitlw2oFVny620y+8k29FBkVvW/QQiwTGZUejE57i2/WDdLNusHsa3/56Qb
	v0+Xu3aLF6EX4BNvAnyp7hwpt6sSaBBxCwjS5ki7jzEh1MVqjYrX1W0d13hZ4TIA
	3C4UBgRrRGXXbKUe8vAfRdBiBZhdu5AUdNKG411/fnuz4Kj+XIgepmFrvZu53NZ1
	OFVBvVDch68PFaH0LcyAH4tBC/5yVYxuqMV+EFDhcPuZD931U4Zb+rP98DjS7ARF
	ZleM5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv6aht3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:47:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dabf9fd0so67605395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053245; x=1764658045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
        b=QHRVshg6uExMWj0l18JSSv7XHPQ3YEh897ZpiRHHXpOYtxtOnCMJOGO8uQbYL8IA9B
         oO2Qx7Z1F1VO9dnatWvi6GoDnN+e5uEO8c/5B1DnzAG4BjvMRhoaXjRaiQCLFeLOV/Sz
         C7dZU7JHG/sl944PWaJbgXOIDMRB2SUqR6C67LrXWx/LbrK3rPTLMjX6sB6d1+9R1aPJ
         QI+k1n6scgtyMuIDHNi6o5nDCD5r7SUiB2n560PDH6gYFnsh860BmdQza6MKXL1m8it0
         nsE5JqTPBnCuPehU/+j6D4JZL3fVTAuh55QVHQKmB9AP9+y0NsS3h8c3WbEE0RaABhnk
         OG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053245; x=1764658045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
        b=T0QXyiD/F5nO/oXd0DQYa7HF1Af7mT7sIUPnnggBXCQSyM4nJwfxu/wZc5gwugI8St
         vST3NSYQ47twpwxfV4NjCIkpPxY0hOFQwXTjp4dMcdudoZHns5h65YIIxOXEuUcxus72
         DoWmCR2Lf8km8i8sWGdjakLY7Rd/r8RHvd/drpb3OhJJPVsgQNDQyy+Fwo9hkPc/uO9T
         QCho93hq2YRasOZLr1l2DwBk7IVVMLqfnQVqfValzaPoqrrFY/XFp47HgCdfef2P29sU
         e+JuD2Qnazq2TVCsYHSYpnfSX0/4i6gDfqP4ik1So/ws4iZfK5/z+K/mMtg9UhsmIdyb
         KDTA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6tejRU5AXgcgZksJhYpjuD4UGjAdU8J9bsLIVLAqquDocu6AzGdewi1ndmxqm/t0sw6/M0YL+YQXtE/J@vger.kernel.org
X-Gm-Message-State: AOJu0YyfcIy6RKHaHqL2pfAR3fdsjX+tz/qDJOrJZ0bYRuC3SNmjL2w8
	ILMF1NxDFa08Kp/ShU/8/YO2fnWCGyA1Iivxrho9wba9LNJxCRKkqCf9JBHdeGe7g78ioTbKmCO
	iC7EC1ptLw7MMf31oFep+lNMrs+Qc3zp9kShlxYh+TTJqAOgL0xrBJV59XkYKkfkMMdZU
X-Gm-Gg: ASbGncuSDVo2yJiCGq9cwiYObuQilY6H6v32GEOaqEdUKgg660E1UazrPSex7GcNSzl
	7IRrfGSrfi4XwU25Q4v3LlVeQ/CrKW8LZq8sFsrMK+DfYUQpWGLq1/lp2uAoNw8CTdMzyNbPtQ2
	k+9a94GVMq4jwUbaK+2THBkbhmiQAzafBGDBEuY0GCs91bSJOTW0BmUdnF9+M73GDIZjQF6QLoN
	dHCeFfxsC7A02/05EObBjLEQqZluYRGWDdYRs3uoO3sA/j2HdfdnnLclZylrdw1JS23Jss+dBFw
	YaJPYDav6Noks3AkhHKSaHxOU/pIQwoxgC12QEIOPQKXbJdj3L0K9XT80QREI+pH/FeUutSQes+
	uS/ZzM93o2/SBdQZmXEz1t4xkNEV/rSt7TQ1Lx7tjuX6NGcSWAo8GvHsO7AQTn4nuPZCAYg==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id d9443c01a7336-29b6c3e3c48mr173257525ad.16.1764053244806;
        Mon, 24 Nov 2025 22:47:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmIP2SmCaWX4l2Q1mTmrRkAYkOO9IckP1bEh+Ip5Dio5d5HQJ6eWo4kL/upXP1t6txnvwWIw==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id d9443c01a7336-29b6c3e3c48mr173257205ad.16.1764053244243;
        Mon, 24 Nov 2025 22:47:24 -0800 (PST)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ac81bsm156886485ad.93.2025.11.24.22.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:47:23 -0800 (PST)
Message-ID: <7b243866-a877-40c3-86cd-ddfb582969eb@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:47:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
 <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX136zS90U85lR
 uVYjEPBgMtcdofVJtxpX2FRB1ofiYbzUxFkzusDjy5th/yNPks7BckgJlKI2MLHDVd1iCXOORHD
 soRsXpCp8AAqHCCvFPlVLrpaLLqFNbeVKjnYqvtwqn8qnUd3+d8VkS/2LbwwQLh8s8tSRMMjtDM
 cVQKDxR/QNrtAdASDGi/n6Km5rDiTrdLdOwtg4NA1aQMgFrZhTdWylTvn+m2QZL3HHGQCD+WvLG
 +vg2kV5wpx3G80xdtKfszmPgI0dVmim/hsSJOkKqKZfY5tpn9oLj2mH6rZqWoq4ohvLSAWAexGI
 78reTq08ivFDnopyNPQ75Q44Ie3d+F6JX7liJ8hG0aGwGFguyNGRpEAKPJqwmp4/jx1JyGN6sMh
 7rkW8U7AOho8TL16A0zuSMte7FaHCg==
X-Proofpoint-GUID: Hjg_AGkwxFy0NDro9_273Qu3sUt0CHIB
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=692550fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Sm_-M3Yy7wF-AUM9z_0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hjg_AGkwxFy0NDro9_273Qu3sUt0CHIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054



On 8/27/2025 9:18 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
> 
> Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
> - 4.0, SDM845
> - 5.0, SM8150
> - 5.2, SM7150
> - 5.3, SM6150
> - 6.0, SM8250
> - 7.0, SM8350
> - 8.1, SM8450
> - 9.0, SM8550
> - 9.1, SAR2130P
> - 10.0, SM8650
> 
> Please update them them as a separate patch.
> 
Sure.. thanks for that. i check the HPD, INTF_3 should always being DP0 
MST(if DPU hardware exist INTF_3). will post another patch to fix them.> 
For this patch:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 



