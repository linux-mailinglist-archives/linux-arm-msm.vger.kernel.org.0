Return-Path: <linux-arm-msm+bounces-102139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBGsHcLk1GlMygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D52903AD752
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C91A30523EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548BA22F01;
	Tue,  7 Apr 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwN1oKef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fICySxaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0834750B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559715; cv=none; b=aoY/86zmX2PpY+Xqnx3QUAgl+LsHHt5fm09Y96CFdovz1OizNxhs1ybruJGrtk5NXn/uDGe70g2caGavFYPRS4HQlTMJNXrx0FUBOQZrpEbB1nOlxM7sc8GbiLQVgij+/UrA9LiO2cllJz1h+p0EzmUS+DRAiUG0qDzK/Gp3vJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559715; c=relaxed/simple;
	bh=PRfMWoutDU3qCviTSwUd8osHVIFj53AMYp7AwheFkjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLFk8sxuBt6YrJ6kzYw3GvXzRVvQJwGhCV4eYLJKHXxJnpLAf/q7fifC+66fTX1iUpexC/r4ybsykCOU6r4SfaMKhd3CEGLVH6IbbMu40P0ozv6lGRmEKdyPFfUqqTaVzD5DPVhEOB6I7Lk9kOD6A2lSxeSQgK/Y/O9KAlnQU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwN1oKef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fICySxaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Yp6P2327993
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=; b=OwN1oKefUvSbIOYy
	SUTDm2WbXTfHmxhx9/W9uTDnYFp5zgxbvd52fUs7n7rFxZ6nYeOMQfpd/osoky/7
	jup2fepjYeVXkEX+OpeHQcRDEp66x32IWeGAAAxnu0CziubaHUVw4Bguo3yZRp0T
	W7IlQtgfrWQc+gCtJbNV1b3sKOiIpxjbdRwpojzN4rAeopR6sKnZO+oQ7EUcvH4b
	cBrcxw/Q7SekvIti1ggoHVpBtwQXKNfHIXuLgS9dqIFtf66HVKklJYSUD9qBux4a
	X1GA9KN5f6u+Gj5q0m8E7MWvrDZ495Nrzib5E704Ae4MXMh7xHgxWfY+VKXeJtZt
	Vb+nJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tct5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:01:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so17204116d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559712; x=1776164512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=;
        b=fICySxaI1K+RWSiqfq0xGUV/h8DmmA1OB5W3gZcSjdvxYn4ruI8CSrYBUhvXkCdAKr
         gVAPMINruodZCtqdIWZsljQLj+iTWnDV6wdUJuTSuy4yMhYe1E97hejU1Nogjoqx3kU3
         CsUhNmCrlrbCFTSyaw6CcCmKE327Cs3wLcV4yAtLO2wlCp11Bbe5UpjU5YLaPI5Rrv+E
         cQP78yaew1eZUSkqzU+P2sOcWmxgLvb8c/YuViKmqId/XVKq8BHhEC3NB9pJA3s+5mRh
         U6quP9gmUPCX9+qUY5qxAkmBwb1I78UpnDt7IwDV0t+2xm8ZSS2dQfPMhDWejky/Sz1r
         N/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559712; x=1776164512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPg48ZrFVKpUfD5wFgvADPnLL02fzhqooYDzb16tNdY=;
        b=FYx5QKlzBvU5IsDsqqei4hW80G99YBd7uC/rzafPhJtpDaCsLtqzT9uRTNkBOL5IOv
         5TgeApamXcFrKDD88lk08bl9+2WHxL7FVCH070PCzASCmxKVS3RyRMo92Rk6lUhdeUHp
         rq643JoCh399SJPe+5ezvWpq+ubMiPbXnTn+8nkXRitmAO04RHrq2NzDAFo7JJHbeC0w
         OHjbyPjsF7x+WjIIzeuDLMCKjUoqj7owBFOnH96W4VKCwDIHSo7s7BKAjIuwZpiI8rHX
         AF4SASylX4aKjMdGwJon8mWqitc3aAMz1r7tX/7dEZJG8YgznQagzUv9ewEargENwmro
         bKjw==
X-Forwarded-Encrypted: i=1; AJvYcCWmf6FcwJVl7fk6JIbUELTyMXRCyb/W1+r4MDShwZf52N+3rJyxklzJsEyIegxrh+b0YKKXTDzDBBzoa9MD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf844KwEngX13xFk9ewkWyxo8/s4h/sXPJyi6CeLxGsLytqySO
	/8ckgNc3Em0rqqSebOog3KrznJTo1EVm9RXZxEesyukxy7EuF3c+KSH84TuOmsoyYsnWy5DDpG4
	MyJQutHJbeZtyb9VPFJs1GxXDZTY2/p5VzDvVcU1MC137/sKoyMJJuf20zTHgac318HEu
X-Gm-Gg: AeBDies+pz0K533jUQmFdZL79FM6dSJ8CYW+FHkvc0iNgnDSc/fEYbUsUKDK1mLBkBQ
	wMcewAW2QMU71r4wrr5rYEBC4A2WnL9D2OUDDhWv7jLaHbsryAU4dmSUXUYpQyA6Hh8hSSzJsnx
	bSWfHg6NPjpNfnkloWA3Bxl9pKUBZy72cDE4SGk74KSQeOfqPXySy0AnSJ8+//WM71gpVrO8Hmp
	lTypCApKNsghtdJI6mPhBHoKH1qOjagURMyM+kXfbiS+1RUl/ihPFlMQ97yZmwIa3fjK79dSm9o
	R1Yxs3olcDx4LIyKdD2pF+UuCrkxLpPX5P5NSGKzZ3zm7GjAOmIkJt1xoK7U8hwa4pH5DPmQc4E
	BMmmCUdcHHrwXt8wGNvV/8tvtKNb6PUa0f4HDrw1D93pGQDHTMexKP2hAxwRw8XNdC9ErikqAMs
	9td/U=
X-Received: by 2002:a05:6214:226d:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a6ff3c492fmr183299656d6.0.1775559708214;
        Tue, 07 Apr 2026 04:01:48 -0700 (PDT)
X-Received: by 2002:a05:6214:226d:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a6ff3c492fmr183298836d6.0.1775559707102;
        Tue, 07 Apr 2026 04:01:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm532205366b.10.2026.04.07.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:01:46 -0700 (PDT)
Message-ID: <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMyBTYWx0ZWRfX8z+cDTtOYiAc
 xJQmCZQIpdn1QIEG5I/YAHLW3glj59UQrPJbZWvbY+l8cyK9hGzNUcko0KidSiv1DPxf5v8RRRP
 McfJheOQQo73IV9z4pf1iAzdC9yMRZq8d0yoWA2ATSWw7TnTz5qOXKtiJH/8tzoDeVsJ30Plllt
 V1zxIo8MJqvbbait9LiNHwrOB3DHbNO9KktVBY56bQx79a8x2WAmgABpc7IJFcjx2uN7csCRxLI
 s8BA2As4B8Spl+43d5ivDtuWF3wknLFjv7XPCutUA6yYPzbh7soIdeUtmyxJ5JJfdyOHHvJ0AEF
 dNInVRavA0HVTX0DkPvZkkYD7XYU3VzYp4YbM/QLfScvd9kRboz9+Q57f4P3cmecVFzpsGMTDSE
 PUT2wOnKEv3g7R88+onTcH6izPRoItli5CdiXZJuKz8ycXKp9hd7HNxcjcxa+8jsVnGlU0qiWBo
 3aTg6LmoHxwbDoxNYlw==
X-Proofpoint-ORIG-GUID: zQmMuqPvrIJIlNQZVhanEkgw03m9jM-X
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4e421 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eR-y9ft8gFT6PtJfczAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zQmMuqPvrIJIlNQZVhanEkgw03m9jM-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D52903AD752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
> which is under the GX power domain. Due to the way the support for this
> block is implemented in its driver, pm_runtime votes result in a vote on
> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
> architecture which require GMU to be the sole voter of these collapsible
> rails on behalf of GPU, except during the GPU/GMU recovery.
> 
> To align with this architectural requirement and to realize the power
> benefits of the IFPC feature, remove the GXPD votes during gmu resume
> and suspend. And during the recovery sequence, enable/disable the GXPD
> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Can we simply make this change unconditional on the gen, so as not to
maintain 2 separate code paths that try to achieve mostly the same thing?

Konrad

