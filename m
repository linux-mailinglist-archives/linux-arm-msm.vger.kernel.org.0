Return-Path: <linux-arm-msm+bounces-112210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2bqsMRcsKGoK/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:07:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29031661863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:07:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZhkhebgR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BhN52cZA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112210-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112210-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F96E30F88FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8546135E931;
	Tue,  9 Jun 2026 14:54:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9435E937
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016864; cv=none; b=LniuLi+TnEk63uwoLs4m4orv4KsOZ9v8TzRPAwLV+McnhfL9JgxRhuaopEnNXkRRfZQBzCmHPJKXHQ/ByKGuHnz7AWkflcU3O79mvv02TWLIHOp5KNjBiMZwmhmtgMX6Cep9clg4LlHh8QgAQAK5zXSIaE56SUDCCp/cMT9TBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016864; c=relaxed/simple;
	bh=IFxoY1lnpcuapTUxgGM77p4M9Fy3Hl9fYDv715UCM8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asaBQO2xHkkfAcFqJHs/LcrCliaZJ72IsUnLYjuuphUPESQjbxkmOlJx4ZG+Hqb0sL6ZN7GjxOXp/sL5vEr+wgJ6cawxL+G9YOr4b6vLUJsUH5fSfzCEuPV0coTDh+rp8/bffjbiL81u5LCp69DqNx63MniQBlnkkXGtwa7ao+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhkhebgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhN52cZA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clags2247950
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=; b=ZhkhebgR2zoqYeo/
	2xws2T09pgVBRSGN6bcoL8wMfMzP0WwjZfjzzjkSaAh/Go0QcwZJYrSn8tpBs1co
	NU70HdWw67A6X7XdoE/5DPUzbs2lEO/5k3Wy3tdvdZIY8RBSHxDd3uFAkBd1eCzV
	tL4E03OFGYuYgR4RBWv9aAGN0OPWZ6tQKKyXcUudwySqx2LuKyR0suWkw6RKRFlc
	xgzkwNBz3+JS3okCWhxNVkXB1PexbSCnycKu0WvHKkPcKpi1hyxt1IxA84dsYxJa
	4CzQ3HAqXsewSED+7RjoaqM3czPIC6TvUNn0ej5wXdT7ZriCSOQtQFSK3fYuG6lA
	KymTlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetbsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:54:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so5439361cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016859; x=1781621659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=BhN52cZAYcrs0ozJE7s4ln0E/cffkP5TAbHDZ86+G1UNNeBfy0IrT4fhmKU7+kraE3
         6Pk9tn0P693AYBvi6J4FfsObAeZzya28sbauD+Td/IYKCU3pC3ODv3xmEZfTtkNYASeV
         VmVap2t6QL8pbxQZsh0y9pp5GjCx9g2XWDGespDdBWaMSoEtXSO7VE9WeUGWGMK5OKRH
         JOx+8YX8kQv4q+OXetER+/e/LFTcJiLz8RwoxcJ6RIByn4yBvo4uAYyzbrqvzikVf2/v
         ZrJ+Npv27I3n8fedRhAUVB9qKEUK44YD6OafqneDjjkxElhHwm6FbLJydC2OLxvYMfL3
         5q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016859; x=1781621659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=Jnzy7eM+SPashny8jKmMpSJiCv30kn0Rkz7xmWDGr9svsQf6S7F5FSYKa5guhUtZU/
         EkyUF3UwulJBjRns04uMKRHUxyjOByND3Js4T4XZ3hzSszcM8RxFfgAwuU9kqRcalwhT
         US3RWCFqO41FP5xZvHwTdSidu0LYriYkFvh/Zk9Y/qRaEhZ5r4cQrIWEZvSv40BLDijv
         /BxIoudhCJydGW81SNDhg/klCfH03HjVkOIn1HTyV0rVGGFmVuX6wj93CBQMstrFK1in
         VPmdscYIx9N8R84YGd4Ebmu9jXtifDjxhaqxVTzsM25L8qrmSpBod6Z8XqgZE/+hnF6U
         g0NA==
X-Gm-Message-State: AOJu0YxT7plQTwkdfy33lAVP4trwwrUsxgmWOP2UBdwTWP2N7dtNsQb7
	jHEgBP/1+jYy8yozjps99EMlMXKh8iq58MG6lVEsjlAHWqwlOSNSYbUsl1CV1Be+P3V75Cop5JC
	nqQAjINZMa4ZMKAGGvQRx5xkIms2hMZw8ijtmRRS4IvFgJXW4yBEHA6wYJKOMvr9UVY/v
X-Gm-Gg: Acq92OHQ9DAuT9K7oBtnMmoTIrTrHXrWCuHKKB9biMw/NPDP/87ZluOjaY6V8Jl5xSR
	FlEIG+DKj7INRxNQOGfJI8kQSy0oIfZyUXOqUKo58cUaVM85n9WQjBmOd7TBd9/olMDCpPNVerb
	Iq/SNfEbU777dY069KzmntukFZNRdNgezgwe54j4jSXjuU3YkLu/gZTwIlLMaqzik+4ddiZESrO
	jWcib5HGpKnXawurZXUUHva9fIE6+lsKLXgyF+GwtRwz0LQ4ycpD3d3gVvQWnJqUGgSLSzForQu
	FEaxlRUzpYZw0hZf9oT9UpVjj7rodWoZFKAKKdHOEFp9PnCQ8UEzYfQo5OWVyE9BSJTX232NE+I
	FbkwuAbwkV8QdXWurWWjcVbKpryDElfV1HDgmWDg3DJOjOay7CLAujktK
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25292161cf.7.1781016859327;
        Tue, 09 Jun 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25291561cf.7.1781016858752;
        Tue, 09 Jun 2026 07:54:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm1053926366b.52.2026.06.09.07.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:54:17 -0700 (PDT)
Message-ID: <604e0428-61b5-42a2-b6ce-a2b071378cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: glymur: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
 <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a28291c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GwzMoqaa5OBlIbEppCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfXzWRD7uMO2qQY
 /dhghDkPzON2mgJYMrD2umYJ7mqDcbH4EGC36MBG+7gC0Bhzggu8oJf3Z4HjJ8JW0aSj03uIzBt
 NVmanu6Ffet7HizO8p/2nxuMpxDnQ5syBEsQ1lwsHboHvv0lLv5qJmDU5O7UkxU1xc2Nb395Vyd
 wuYw55SsijkRtV20N9N8I5N38djiNO9PI4kAeDcgTsUU8vKsyK9EtvStO8zfFb20ONmO1T6ERKK
 EqpjTeQGtU0/tVaMpCJRCvDJvnHo36WAjFfNwod6lvrdN1FO3rKgoKo9SvsqV+UPdf8U29B+U7Y
 TTWVznW9j8wMzIPQxeTsN6is1EvQhQCTv1zwTDff4bbKlV3rTReJ665FIEfDtsEjjyABAhrE9/C
 Of+PQt8Xum4kZ/aoGeUZ6cQEa40/TZCNBX1y+oqRvnpay1IANMCcYN7PLCIhPV39wk4MjqBoPBo
 I3vJqmHM7QAc8/DJnUA==
X-Proofpoint-ORIG-GUID: ObEl4JDoOJkrm76ZUVFUqxEFMREejzf7
X-Proofpoint-GUID: ObEl4JDoOJkrm76ZUVFUqxEFMREejzf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112210-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29031661863

On 5/22/26 12:12 PM, Akhil P Oommen wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> The GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling
> the GPU speed when it reaches 95°C.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

