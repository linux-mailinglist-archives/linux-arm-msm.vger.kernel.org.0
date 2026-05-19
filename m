Return-Path: <linux-arm-msm+bounces-108351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIB7BlkEDGojTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:34:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25E57827A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C38C302E8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88536243376;
	Tue, 19 May 2026 06:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am5CuE50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VU296Sme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C037CD5C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171940; cv=none; b=KunfeGkaF5HRvoLZwD4AmM5lU71xYG3qlAwT/mI9m3H5WuHGgNGqO3lRUFIhNqSkywZlQBi85Gkt2PRtg2DzBswVBvW1CE7PeF7EZsve8gKLrjQtTrj5DuiNXfVRSoMSMzb+YwO1d5kFDXZpaoQBAZV+I4blVN+NsNwdKNo9+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171940; c=relaxed/simple;
	bh=RNQeslLAHlfxVGn4YH/FpuO9O5VMljgwj7vmSaqE4wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6Bf1PfzDnZ/vWqdpcrOCE1kwTwpD5QVDtuCQJAg8bISUPalYiWJWSZhn5JNTCFSU3qpZ732jj9IYzisdaY+KKi0o3qTaegKTLWSwaeyHEQJ4p3RC643wSjogPmv0VTYczm2KmrQvK0ipb0KceLTmZ6FeMC2AgdUg6D5I/lr1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am5CuE50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VU296Sme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IM5vrE2892643
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LW3SV5TX2I28SkWzxB7Q6UbE9TthcyK/njTvAfatWVs=; b=am5CuE50d1omwcLw
	FdhxXsilVpCxgnkyF/LOeXtKi6so7YzWs7VZFwpuM5LYOck4NcGoQcIvIVI3mvPW
	gbfusC8Pyo3BA6fHBkIZwNQFCGqsIC9DHzfP44Iuk5g8EswAi36xXxJy7q4/GDN0
	s8G04G/cT2t/3h35Cx39dNT8Qyeq8tw0zz+IyssZAVdEkVVbzUzYevMgv7bGq3dM
	7zkm1ZEkv/idOgHWhdMR1Vgjv9sZ546MVtci2fgml8ytr1jJ5yHacx/RGOUu5lBB
	e0EsOrb9KoERvabKhwgoj7tLi/4xDHvaSYlnsTRz2Zdsss67zmUC4g+haIbZQcax
	LQ+4iA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1cryv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:25:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so3495063a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779171938; x=1779776738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LW3SV5TX2I28SkWzxB7Q6UbE9TthcyK/njTvAfatWVs=;
        b=VU296SmeTHIcbfixXq5SFmj7nkDHfbY/y1vngcTfWIo9IVkT7ssIUlCGBkO08M1ohZ
         1C6tfQMsHV10eh1LLgJHL1caFSGX1iLW5dP9wILbO5tYO7YzdR6ZmlCKSgWbQ3n74drV
         ugkJj1tQXYfKwMEA2o/cgY+ei5OlP4MGpO+3YZTuBps6VNfalztDhlt1XsqOzd/XLu8H
         QTPkOD0Cjg/9GQZIEhHaP20chMJMVb0Zp0LeVz51Iva57DC4ZVCBjx5hlE+WXzMgw0ND
         w5OFOqIX4F1BSHOr6xyXsA6G/aWangbIBlt5DoJMbhSj61uIYOwsWO7URXNpx2JpSde8
         8XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171938; x=1779776738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW3SV5TX2I28SkWzxB7Q6UbE9TthcyK/njTvAfatWVs=;
        b=qcz1rKfQmVT6L+BRYxJyyureoVBZX/pJgryPC8sTkai2/BtvPub6ncLoRCUf8YLXAG
         l0dE8eXsZrbLLRWsMm/pWqf8i61dATs9k75a6AjaJnW0Ajpv9DnEHP3B9yM88fumj9B7
         VtsCiU6F6efttymXqzGxxnyjHZM8cuYyAfB/VPle/dzu/ohET6FrwhqTrSjn9r1ydf3e
         aeld6rfqmwQ9im45ZJzRcZ0tWLL2jvPf8HzqZqXzkIeNnxtN+yPpa/PUn5iW37b9rSJa
         Q8CeBlKlTTuhLea2twijYAZqCbIRmsniflJiKcvseYaXtVCTnCvYp1GbnclyTfSn2WA5
         gJbQ==
X-Gm-Message-State: AOJu0Yyk3qLiC5cbeixHGozEN7xp5G9OJax3LsuCM2CXxyn5ZhBVmNHQ
	wQ2ZaSspkS3XspHWidvO2w7aPRHRButGRmvAtisvo2VHRpKiweNXFtOPNO+9AvPlSosLU6JNu5s
	GyEAJuI7i6UqhUZ6XLdAcwgW+f0lJ7Tl20MJm1R2h9sqyd3E3AjAPXizI29Jf0gBEo4Ow
X-Gm-Gg: Acq92OEtrfJO1l7Clmi0O+3AHzLfASZtiWz1bMqUX3bF0+MPXO+jtGpQGVwV1ireYev
	Fs1eD5nSZe30dfQw6gcl9siyEmWZBDFoR9TeywyM/blqRpf3YwlzPKlH0bfs01vIZ2o7DdpQhiC
	I/O9GBtFTPb3N1J9xILOrfuW0zwyABqrN14jmpL3rrnWym/oqIpKrerLt38cdnUrwQxOUqUvgFh
	g7QJPHRCdk6BRpb1NAHQr+2ex1TqWQ1pfe99Uu0HlEYhU2cYO1gZOWA8t7/FIng/67AnTR4QNcN
	z61lh/heGmhMqPR3IPdM2ZdB+o2rtBcsxEwqSZFE9Vb5zFEK1u/7XSkcE61O5RBrya4hXnw3ukW
	5aGD24snUp9T6feQ1eKoBpTxrXA9Pk9q+jk/7nEISVr47OtxOajJl5a58WbkmNQNzawm2EMJ0Yk
	nT7Qxo81BI4j5tIYmB
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr16698599a91.8.1779171937655;
        Mon, 18 May 2026 23:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr16698573a91.8.1779171937096;
        Mon, 18 May 2026 23:25:37 -0700 (PDT)
Received: from [10.133.33.99] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm15517090a12.25.2026.05.18.23.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 23:25:36 -0700 (PDT)
Message-ID: <8c763b81-5796-48fe-a8d0-53ccde6afcbc@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:25:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0hCirafpq1Q9j946ur6siYscyGf1YQGQ
X-Proofpoint-ORIG-GUID: 0hCirafpq1Q9j946ur6siYscyGf1YQGQ
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0c0262 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ew1LNfEtQ1-U9-51NiEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MCBTYWx0ZWRfXxUtdq/xie6vu
 RtuQ7wwPYO9qW1EyR2Ubtcs9WEvKxTsDhVo2xU2z+d3Z7nrH0CQMcZ+LvXEZv0oSEV6D5Py1wKk
 Z0fyuolRiczjtPXh055aYyi2nwzZ/5hdu1EMbdIalHfe+NqCQTgJmJ3CiAH1irUbIXgfpK/ug1w
 yKTjdJU6lhe8DlyE5H+5Cjt7J0A0+Ot8RE0Qomvzh4rcwvpNsjdTwsX6xZOIgEb7MWK3T9LXyVX
 5j2K58eQgalOOAG7gRhPV+5xKR5lS8KcchfoHSvSkCzTm9+Uj0977D7wqcviOq3/A9jeIju0Vua
 bcCpyknqKoIbyiRA8qe1ZnFiZHJYifroDOX0YJhyIg/lEr0nCYof0LlhX847ztSxlyT/8IKiDgC
 oPR9C0TlJKgVMZOtm6cFNdxd+QL7eccSWXL0FMYBUmInc5FmiwdhYSqg8SFxY6WM2+RtWw0EX/T
 Z2oXtTjEzEwBqr2YXaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108351-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,patchwork.freedesktop.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B25E57827A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 9:09 AM, Dmitry Baryshkov wrote:
> Currently, all HPD interrupt handling must go through the HPD state
> machine.
> 
> This has caused many issues where the DRM framework assumes that DP is
> in one state while the state machine is stuck in another state.
> 
> As discussed here [1], this series:
> 
> - Removes the state machine
> - Moves link training to atomic_enable()
> - Changes the detect() behavior to return true if a display is physically
>    plugged in (as opposed to if the DP link is ready).
> - Remove event queue and move internal HPD handling to hpd_notify()
> 
> To correctly detect the displays which are plugged on boot on the boards
> which use dp-connector devices, this series depends on [2]. USB-C and
> eDP panels are handled natively.
> 
> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
> 
> ---
> Changes in v5:
> - Fixed the EDID clearing on display unplug
> - Fixed the initial HPD issue via the external series
> - Tested on eDP devices
> - Link to v4: https://lore.kernel.org/r/20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com
> 
> Changes in v4:
> - Fixed PM runtime handling
> - Fixed several cases where the HPD machine would loose its state
> - Fixed the case where detection was ignoring the plugging in display.
> - Link to v3: https://lore.kernel.org/r/20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com
> 
> Changes in v3:
> - Take over the series (thanks, Jessica, for the previous work!)
> - Major rework of the series, squashed the set of patches touching the
>    HPD states and handling, it is easier to do it this way rather than
>    pulling the strings one by one.
> - Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com
> 
> Changes in v2:
> - Dropped event queue (Dmitry)
> - Moved internal HPD handling to use hpd_notify() (Dmitry)
> - Reworked bridge detect() to read DPCP and sink count (Dmitry)
> - Moved setting of link_trained to plug/unplugged handling
> - Dropped msm_dp::connected (Dmitry)
> - Squashed all hpd state related patches (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (3):
>        drm/msm/dp: drop event data
>        drm/msm/dp: turn link_ready into plugged
>        drm/msm/dp: clear EDID on display unplug
> 
> Jessica Zhang (7):
>        drm/msm/dp: fix HPD state status bit shift value
>        drm/msm/dp: Fix the ISR_* enum values
>        drm/msm/dp: Read DPCD and sink count in bridge detect()
>        drm/msm/dp: Move link training to atomic_enable()
>        drm/msm/dp: Drop EV_USER_NOTIFICATION
>        drm/msm/dp: rework HPD handling
>        drm/msm/dp: Add sink_count to debug logs
> 
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
>   drivers/gpu/drm/msm/dp/dp_display.c | 714 ++++++++++++------------------------
>   drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  63 +---
>   drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
>   drivers/gpu/drm/msm/dp/dp_panel.c   |   8 +
>   drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
>   9 files changed, 249 insertions(+), 570 deletions(-)
> ---
> base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
> change-id: 20250523-hpd-refactor-74e25b55620a
> prerequisite-change-id: 20260314-dp-connector-hpd-f069e66bc6af:v1
> prerequisite-patch-id: 90db75e3fb8bc9c81c67547db7bbd4eefd5d6c40
> prerequisite-patch-id: 1c4d030b93a8cc6c98b3447a8685da24eb1f24d5
> 
> Best regards,
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, 
QCS8300 Ride

