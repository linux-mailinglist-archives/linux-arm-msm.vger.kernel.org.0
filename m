Return-Path: <linux-arm-msm+bounces-86793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD8CE60AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB19130038E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419EF2D062F;
	Mon, 29 Dec 2025 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leLAM9Li";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZqtPVtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2C3A1E8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990333; cv=none; b=FUboNRwg861i6o77UXHqOzlx90NgE9qlKwDq+LFj8qyEHei5HXzho70C960DDHHexVHmlx0VZdBricw0yKN+GCTNMcKnkMysaZ5iwtZ6dGf4TtXCzMJRXaPcB6/EtMoivjpoQRviJUzdsy7xSFPEJlTCCpcz+uqrw73iQdZqVvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990333; c=relaxed/simple;
	bh=vDDiDmxRbvYhAZNxBBOVZ1KAry0fb8x4OIAmMpKWfPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtfYh3OwJNZyoC2IWus11s+aV1utmTl6o1GFQ7/hEG5SpMtIUqzsF/uklFDgAtpolHYBuWzHVtT5ZTE+AtSv9secMDeMQusSmw1nEv4PRJnjDxy5ESZY0zNehMHKWzef/8MpOkqKmNSkF0Ake9v2ofIPZEhopUebx2lmjnWp99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leLAM9Li; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZqtPVtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLjhrF4069042
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=; b=leLAM9LicLgUC0CH
	PMILVlpqHvvBPPyzaGfeDpyj3JUyKxyTwMC+jfa8fwNWu3t20+Hn6sJOWiCF6sl4
	vSlElHyAkQZa+o1wApsn92shqSPQmVX19oI3zxB/Zk/wOIyIwTh3WB3FdbT+UteX
	4rvEQh4jhslvk+GnBr2n1gwhzew7b+F/noWuINFghbdws+STWq7+dyAV/6OrkJ3o
	NPGRouvp8Xxl5fL4upGio1zzT/ClIgXrQWKNFF2LTCXmIkdry90eKa59vnyCRrGl
	BiGqEommGpCITbXErzmqFqxs/LTPC3btn2i/5gGdwUeNd8oRHKCO5eZALrXXemy6
	EGnoYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5khny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:38:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so17458177b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766990329; x=1767595129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=;
        b=WZqtPVtDUUCBTZSFV3hCFJ7PzXs8V1iekSTSF6nvTXlOV3PNRFjKN6HTnD8pYvvcpt
         cBJ0fpTZ9C8lK/lHmAhQUFQrfvBaKYyMNB+3kfjlSA4jnp7IS8xyBZGbOTNmwykznNd4
         1UaJA89qrjn5YYlnz+tWpeHh7Y6Kh6Kvd3/cqOJHoF5DU7roDeWh6/9KEzvrm/f5gisS
         shaaMTXDjKVNgfWrm5uydFCgINZ4OMjD8rw/BBIc2nzRdRh4IbUIfs/vm8p4JyORb2m9
         CPpD7GwImHxaPB1l1mNw3KCwRq/cvIaYwbo1isqzmv9jzUp2P5ucajowp2SBysXr65Mm
         4ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990329; x=1767595129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=;
        b=WG6EKW92YZX3y5XICi+szTnNdq5lpDZDSbs+2cWJxkb6x4Z5ingh/YkrB4CWFRy3Kh
         O1BbVsoMpLvdrCtGWmrhZdjFO7WdqCrGWGMoOJD7kbDXFh4RVkK0BUU0/LmGhGXshX8S
         npnebvkBEN2n3XQ68fHW3Of3h6gSCkE22UcHiqf2OHAKsbE0WSWy2T4x2Yg9SoUQSTdT
         UZbOxakKkN3lX3Vf3xtrc40VkdbhQ2+2mX16XEXgdZLjXfuVArCi7YmDXpNfOfrObElU
         6cA4aCV5iu+r3FtSAbxXLiQdzXHO1mYbUvzMDzlCxa+oEf7M4KHJGrK5FtkiQxtP8Qob
         AzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbzI70wkw5uDvZwJG+caI/GmdRkjZlEMVLkXRYcGAPZL+EqaTpdq7gVGQYtNoo+PLAeDQ8mnQ40CTeHRn@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbQSlqvLWhHeG9xy3DspoAZB+F39RKGHxe2slHwRuOk/CDWGu
	apHv4Ee0cZg/s0J5PX/pWsjBzPlaAA2+fZieek5g7WJDIpIbZVA8RmNNLrywG2DAbWRpXjTKHba
	AN+kXrCLGlw/ZM6RjhKyixr4WvTEDBKLfUDpgZ3mlZnmSCZUQBp6llb4M0DCg2LV7W7pH
X-Gm-Gg: AY/fxX6zEAk9WhGkqcHM05ZYYIJ/plfGo45kW5w77kb3EFGw38WsUMytqEeHDrrZcsP
	RkjoRHxtKtUf6BHXKqP3lxVCAjjPx+YleuByMqHbX4FJzgIYMEm2Bl7hWJnIrSoXky4hu5o66GV
	khnLrQLOUesOTCrIOgDNubpX/Rl2Ovk34wchoQyLnVK/vcv/cO0AD46Yd9huhC8fTjytUxbPo+Q
	0RUuW7LK7Cu7wuLdmGrs/lcpvF9X1FN4FF7cR908AprwWSy7ROSPzILlyrsLDi3yRfOlPk6PefT
	vAHdvRwJqB7C28qjTJ63jpDA+mnvOGngtF/mK4NuxSj8qLZRd6FfjEYZ8MjTD32MO07da8nt8BR
	jcu+O0Pwv4IYDxlyNDju5kClJG0YN/ca2wmsukXuHtQ==
X-Received: by 2002:a05:6a20:7488:b0:366:1a31:a70a with SMTP id adf61e73a8af0-376a88c7406mr27107046637.10.1766990328901;
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmEGj2+F3jqj3Q0oymWU6NFJL6UfDpWn5d/J7vK7cEpQOy11Da5rVt+NR5bsJ+wQzGnjq5sA==
X-Received: by 2002:a05:6a20:7488:b0:366:1a31:a70a with SMTP id adf61e73a8af0-376a88c7406mr27107028637.10.1766990328385;
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm28289420b3a.64.2025.12.28.22.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
Message-ID: <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Htz204H2HvSZa8YzuWHE45wDBZpgUxWj
X-Proofpoint-ORIG-GUID: Htz204H2HvSZa8YzuWHE45wDBZpgUxWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1OCBTYWx0ZWRfX4LLBNW5YJo9X
 esX0f3dXKU+DVzgc5Dh8CSb/V3OyRdkI1yR9WU9mUmM/jCaOhXhuAGH6gG/ytP4HkWcnehhsXjk
 zJhCn6DTQrQ245SV1fwStSiiETmciUcxAtvtNhNOXsXFf97xa65lIxTsaiJmhFH3OCqbButAD02
 N7JRlopph8aGZNOghzSygBLl+wmBJqy3qUrMWkBuuDfuNt/w301aXj0byig1Y76D47XgJbtFlLK
 6+pCESZzOffJfqVK/jy8F0cHJSjv3MX0O+oOFGaDv+c4gm08sl9cwoLZG1W8UnWl2ocMGiiMKbl
 bm9pkwKbs5Uv4s6uO6EDG4AK5p4vl4rAnoQQ79oFGupoCvtrjxrUN0K7LqrW719jGEF0ZNTcftD
 0CKEFH7umHkxVmvWeR5OWRX+bLC7Q9dtstAPnfSZfFBwrw/OvtRpP3+0kWZ1tpD6KymPFtgrbLb
 foa7gFVVzaTpRg5sSdA==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=695221fa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dbtYoQ3qVXiIkkONYLQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290058



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>  video encoding features.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on 
> gen1:QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.

Pls test it with SM8250 as well since you are updating the corresponding
platform file.

> 
> Commands used for V4l2-ctl validation:
> 
> Intra Refresh:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h264 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h264 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h265 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h265 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> B frames:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h264 \
> --set-ctrl video_b_frames=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h265 \
> --set-ctrl video_b_frames=1
> 
> LTR:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h264 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h265 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> Hierarchical Coding:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer1_3M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_1_bitrate=3000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer0_6M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_0_bitrate=6000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding.h265 \
> --set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5
> 
> The result of v4l2-compliance on QCS8300:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 6.18.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 52 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, CREATE_BUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> The result of v4l2-compliance on QCS6490:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 6.18.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 33 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, CREATE_BUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Dependencies:
> https://lore.kernel.org/all/20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com/
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add comment for ir_period calculation.(bod,Dikshita)
> - Correct the maximum value of IR_PERIOD.(Dikshita)
> - Add a patch to optimize the calculation of hdr size.(bod)
> - Correct the num_recon calculation.(Dikshita)
> - Add a patch to simplify the calculation of COMV size.(Dikshita)
> - Catch the result code of session_set_property.(bod)
> - Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
> - Add support for layer bitrate setting.(Dikshita)
> - Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com
> 
> ---
> Wangao Wang (6):
>       media: qcom: iris: Add intra refresh support for gen1 encoder
>       media: qcom: iris: Add Long-Term Reference support for encoder
>       media: qcom: iris: Add B frames support for encoder
>       media: qcom: iris: Add hierarchical coding support for encoder
>       media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
>       media: qcom: iris: Simplify COMV size calculation
> 
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 476 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  31 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 161 ++++++-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 226 +++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
>  10 files changed, 1102 insertions(+), 42 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
> prerequisite-message-id: 20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com
> prerequisite-patch-id: 2b77a7b9bfb436751da0bf69488dbff567a38479
> prerequisite-patch-id: 190f29ef211b046f0d031e3a4b52f2c3bccd0cd9
> prerequisite-patch-id: 92ff1a1958eeacd53d70e155bb8214f9987ddf85
> prerequisite-patch-id: 0dae6aaa8db7df0729436cf9268d29ea363f0eed
> prerequisite-patch-id: 6382693f5a5a7438660f2e592b30163551d92791
> prerequisite-patch-id: 9aa16211c36540a61d219eb25f09b7625b9bdbde
> 
> Best regards,

