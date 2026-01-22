Return-Path: <linux-arm-msm+bounces-90182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLi3H44McmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:39:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F345B661F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 640688E0368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D303EF0A8;
	Thu, 22 Jan 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoHzaE0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht94e34o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE93EF0C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080953; cv=none; b=GGYeoUoFaLIp2a8csUhCGS/ZOsbhZY04fLyurLlxWuiD92T2l2l6EpVwKVeRLLr060lKvQK8B71DptX3HU7Uy5Z5l3QyOVl95t1m556G/W+nrtQZnh8CoQu0vO5i1cgU0M+wXodtuJShQMf3gZ+/BwKZe28BjMGx24z5kPZ/3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080953; c=relaxed/simple;
	bh=AonAwppZY+pmOaM85y2+m/hUHR4TTPWbi5lYkG1NrGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yebsin9MCQ2lxu0GIYsOHfm01MITBk1mrTLM54rd3djGmf7ogapovhRkGjf5+r/Aqbhjq0LEMTC01uvD8iKB+MrdFOQujhlLNHEYd56QqN+uSOErjPSz9yQE7p9udA70gRwkFR8TTm07xqrsQEk8ulCaKvovAjKcgDluF54u+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoHzaE0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht94e34o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M81uNO2279967
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=; b=hoHzaE0dFfoPb48/
	Kx8F17/AibFC6vyMzCPCV//vIzXKnSzAH6neHGGyUMqXfh1HS6KKYs2+21az1GAz
	7zrgmnbHt8cOuy2mgjBprMN0hWABpzSWZxXfKzfFPXHcC6AWlFkCrYM3RAHP0u6p
	4yBR27l6LdJizJ9MM16vCZB+mkZ5tmAd/tIQ4Q29fjdPzf4xaFAt9qc8VJx3TQjX
	Jcju3hR9Z88Ky75aEZuP69EXCFI6AWYV07J+EFu1ix1rKdvKZU2o/PFi1OIhr0YL
	XIcz4kkYvF8Yh4k7XiRxJLRbgWmXlTFGSZ1B9ahd6TmixRaADCkjtrHgqT6+D5Q3
	jtthGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fat3d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:22:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a08cbeb87eso9891695ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769080951; x=1769685751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=;
        b=Ht94e34oZMlRnqyC4UPvYFFNdVXmPBonr0s6UP3hWmqmszPOn/hRMsRNgYt0/OuDaS
         dhItF5ZvH1NjpP6zogHZjHdYZKPuXCSolOh5x4S0PEChsXTKZsnUyMofIskk3Qs0I7mY
         YIg/JzFGuYo6efKN2VTJv71LAW6uN2jWOFtlbPLeELccE+Iu4MUZfeu/VehpL3OB6u4B
         TTe8lD0st998CCs0uyPBmtccx+7cB5SprDobyDs3hjNuuE9+CXn3dPymCBm5IlFpHRdr
         bEi3rFFv7hIEHnTLl5xUyDR70TjEI6FI4rfBHHrV64rh5cu+Tbgg+abtFwkvME7iFh0o
         UlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080951; x=1769685751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=;
        b=DuLNqrjLQGwS8GMedoRKMWBfNZ8dbwwUzCB0yylZtP7IEpctleFF0nAVCDazMImQsQ
         VGIDklWZzAz7rfF6BBILbzHqndn2uUWUOKVO7Uaj5WDHzjteCUkQOh/JK0FPvwySKwYX
         0upog2PKfrtu0WlTbhq8rISmT9tV5NshKxzCjTuL7vhAG+2wcHEE2EC8n9nR6E4exMa0
         YqoBg3cQKrwzpOh+DmS4Ct1PMnthXCdJiGt5RUQHXnTKSRy08Pey0jRZknsHoJtIqiTZ
         H5dKGbOIUOul6dI8KvJw90U/E7PTE7wMLrLVFu1LerezGtqI0zTk16P94sXZh+/v9w0Z
         aBWg==
X-Forwarded-Encrypted: i=1; AJvYcCWc1btybQa0AYGhJ/acEf6NiBXfV/YlWmTLQWr9D2rhZPB8ICRka1uh6c8yUA7pQZPx6Yjahiiqd01p4Zoo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4TqwQqruHLz2g2Vz+6QiHYsPdzbH/3HfYl+dat++VeqIprsX
	rXXHPXRwRDBl+VfzTgGFMD5UFAknhsh1bm0RP1WqFR7pmVaAdIz929++CP5iKIzVW0r8qR2sIh5
	TZhykB57gd7NTniW4utdDvkyM3fCPi7jYM4V7iIaeknTszgocrUNyrZDzBukwN0fg/QuZ
X-Gm-Gg: AZuq6aJxeITx2IFXQ2YFd5zbsU5ECDmADy/ZJL+UAiA74WbJnsgeXgyLdryks938KhA
	6eEZYxMhnLWuUcdNZCwzZzfNs5PFeFCSOng6zTko2eJfbhAlRyok7+xND9ZXQModmkbD099UA6P
	HNpfVBiQbC9kZlBa5BPOcWg0atCt7OwGfOZ9i6UTcfL7WHD0PzyLU6WNAAyilbYwfZeGvK8DrHs
	xkSQR+FVnEW+ofLmAv51paONQfbwq7MlpLgzSEBo8OhWvnzyF5exldSw6a0+dn3ZhqfEceZLDO/
	V0psOhSrUln7bgr5lqLTcZ+yHU5/Jv6UBzmLwx1AymyiuUnCalFMM+aVagh7h86KzeZdRlpZJfU
	vwhv/ojvrBbpc2iJRXnr6U/kiQGKdRAgQ+TjE
X-Received: by 2002:a17:903:2bce:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a71885a283mr200620925ad.11.1769080950629;
        Thu, 22 Jan 2026 03:22:30 -0800 (PST)
X-Received: by 2002:a17:903:2bce:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a71885a283mr200620585ad.11.1769080950109;
        Thu, 22 Jan 2026 03:22:30 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193df75bsm164936365ad.54.2026.01.22.03.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:22:29 -0800 (PST)
Message-ID: <5a8fc32f-0a4d-4b76-8093-faf9207a4938@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 16:52:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
 <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69720877 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=90QGV6kl6MXzLp6kim4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4MiBTYWx0ZWRfX6yQi19hsNduC
 U8os/M/DJGCb6sfzdjzmsmhKlCXw/jCTa4rzBftBxv69zOULdjLkoaV52U/9TKzIkEQqBxXswdR
 o+CNTrMnf/1kW1E6ci3poMknW8doyfgGInjWXftBA4r2LZzr4R4gAVmL7nK3vgOO+HoiE4d52kQ
 xMGf9wra+LmzNRD250caPLf5OsdCHChoZZquRBBqEUZ6Pn4FXbuklpYfS6wlx2sOdosfPo0Y9xz
 ZYuZ+fdacGLvAsZfX4ILwQe+XCa/5ndBL+ixfL2d0t9d3x3Hek5WD2Exg72Cqgfk30vErI3cgWy
 qrXteat5JYNhexK0plTIiWymjQDYH6tzkiQlAiimbc57jch/MpIpC+cdKD6xVNGnAcVxyW4347w
 yWNpfmZfZhXDujTdblDUQVSrcV8Xo2s9pvgLNEQvyutr5SQpWYXsIcCiLBYfy3ttlYLyhciATKs
 x80jwWA8/0Q80imP48w==
X-Proofpoint-ORIG-GUID: veeGtmbLfuFfFuEy1KRcBpWn-5NDCT7I
X-Proofpoint-GUID: veeGtmbLfuFfFuEy1KRcBpWn-5NDCT7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90182-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F345B661F2
X-Rspamd-Action: no action



On 1/21/2026 3:56 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 08:41:05PM +0530, bibek.patro@oss.qualcomm.com wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> The ACTLR configuration for the sa8775p MDSS client was inadvertently
>> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
>> Add actlr settings for mdss on Qualcomm platforms"). Without this
>> entry, the sa8775p MDSS block does not receive the intended default
>> ACTLR configuration.
>>
>> Restore the missing compatible entry so that the platform receives the
>> expected behavior.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Missing Fixes tag. Otherwise LGTM

It looks like [1] hasn’t landed on any release branch yet - it’s still
only present in Will’s tree, which is also where the referenced “fixed
‘commit f91879fdf70b’” SHA was taken from.
Given that, do we need a Fixes: tag in this case? and should it use the
same SHA from Will’s tree.

[1]:
https://lore.kernel.org/all/176764799410.1451727.17568755330994660848.b4-ty@kernel.org/

Thanks & regards,
Bibek

> 


