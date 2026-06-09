Return-Path: <linux-arm-msm+bounces-112047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2P4HCgXLJ2pI2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:12:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A965D9E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:12:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hfjrIVWN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jb1oiHmK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEEDF304E0CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375273E9F7D;
	Tue,  9 Jun 2026 08:05:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E823E63B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992336; cv=none; b=YSOzqhHcBJCsm38WROgt52l8U9Z0oibSVwl4aohZI7vWQl2d326vYx17oXIFZqIaoW6Ahjt9/9FpKuJ/+Au67cIaRINGcBrZF0cfCh3T/SZmH1lA6Lii2iFgQkqWRpJbDXNEWPF2duOZyW+G7bU8lzcpWTk0aHaFmLwHd6iTCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992336; c=relaxed/simple;
	bh=iXWrNYwtewU2xC6tlZgN5pj/x2AA/eSoRrx9wnDLO64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEU6kOobOrHxKr4srChGdRhbQjjXJ4LJEaEKKbL8YmXD4Vek4gjeUWb+a5cTGgmDAJ9WYhiu7If39lIeJl7L4fRvfosx1ch5rzNUqa0rTVbFtX3HBlwuX5kuEdE5ZtD4jbYzMR7RJHOiG2f++XOoIrUbUGi5hHNumFP62x6wVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfjrIVWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb1oiHmK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rQVb1517718
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=; b=hfjrIVWNvvFu/dyF
	YgGS0wXIsycLqAA77Z9hRFVllzKDuZ0FPJkDhUWIgHuMOD1Yfk/fMzSaTz9Lt2Ao
	tuEw1OmRP/zHhNwWYga3pRxB66x/9PaTuL1by88qCscJBNUCgKpvTf1qcMAwiTDh
	kjw44qn5TzeTUmCvPNG7bokg6EnG0VNAcgQOHNJpv1jxn2m51RQWJp6VLgKmUsc4
	YM0QR+dsNSR5s8pXPN8rqul5fCYi02r5QwK9fFu2r7fSqwU1/WZ3nAfyrjTGwbHi
	sKEf4zssoC1GZ35UlCxeR6wa+Ngo3TfWKrv3HGU2Dnxw9GNTgTX7CD9cT8vPcuqg
	f2gZ/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr83e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:05:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a4ca0a4aso166858785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992332; x=1781597132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=;
        b=Jb1oiHmKDksSTsaqT8BQahUimSGX1+4b3fVZ6eHAw3znm68O+jUFYp79eeBs4ML4IC
         gbwDPzjOaeZ33uEv03yghOv/4a9aH57djWf7PCOoTQo6sbZZREPFoHYOkjndKa8fkuow
         BCu2G8c5S+tN7zt8RhqnI3Lxvx+CcXypOBsdWHm03sOjahHauKgQ+OfOAxXaj2xFJvJG
         Zc8twIAMk0SWSVS9O4wHrfHYZE8OjjmDt3Nz9fgY3QyO4N6LbPvNTc9EdxB4CcDmOlMm
         8p7jNO0nx4zi1J4CuuAaM9TTkhZOfD5bBdfTQP2U1DYoLQPaaYPlOLKu8Qmr3StpNlOn
         hEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992332; x=1781597132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiAcg4GZAcbzhQVB9wJOqt7JXLgCAxLB5dfBhEJmHiY=;
        b=dZLT4sME2TKmaA95n+Rc7jdKrPLWsiampRb/t178GL/7Hp4z9dxLRD+wucXUjd3NRC
         EiiM8FwW1ZAPZoc+IMLogwWQYaYVqsniWHvEAOPoAaxtoVAAT8c/O0OOqzo76hoNkZ3z
         fvVBuzJoFu5AhYrjwuV8rluMKJ8LIMlqlB8UU5dWDE6QOtdhx4/OfC5O0Rtj01Fbhz1X
         4x+41rO9E7DwL8/3qT19as2ic2FD4tJ6vZjWWoPfZ1W92Ip8W4UelS7t/0xcYOu0IspG
         oM/FhiFUwVrTU2jGseEUgpulY5jzWzIuu2NPwcDGa5U9qjwKbHpwrnuWjS/hAPvHm48q
         pldA==
X-Gm-Message-State: AOJu0YznqLMLRx77Rr/ifk2UhD+l+u2fgfMQS0vpXSS57bb/FlkZ3WCr
	7RJOwy04scu8H8bat/4+aJDgADHiEc9lozdeXoEtMOLF/bAw3BEoCeEmhZscCIbeoQuE0Up6li0
	lx17TCDJjRs6Raa1ztUfAuqf86K1qlXwNQBeZL5KZ4o97S5q8+0a/gsw3kic7xcTZfWZw
X-Gm-Gg: Acq92OGdQ+1ZXG3iVcpgni6pB+lcV3uDXF3/kC86p/07BjZ8fbjG0x4QlzjszG/EFkh
	900+o3ND2Gal/iESSCTrAx3KIH5uecUC1ZpAMVxfFrgAOlAv4oaACaYHbVUum+YjBA+LiJRgX+T
	RhiSakysUrhFGHXqNF1mz5Liuo5f5QqL5t6u4X6GbUj8j24hVC9CA90XwP/sqK/zis3VwOh+64m
	zunGGosWE8uT+s97mT0LWcCbLRfm/ap7RLQ6kgY//mb58/s1AhXdkiZnYIFOv3HGMtjNzI5rOkO
	qKUtk2yuW8tvS5W4dJ4PKaZy8/BUmefmlgVqRu8xWD41m9aN+xmGtNexWU5J8LQwWapX3fwEJN5
	HPtRoj0rKybaRxVTWULYHixsW4F8DDt1sJAo0GG0VCM2AhSHyB2NkIN8A
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1730748085a.8.1780992332063;
        Tue, 09 Jun 2026 01:05:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1730743785a.8.1780992331605;
        Tue, 09 Jun 2026 01:05:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf3e39647c4sm606892766b.63.2026.06.09.01.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:05:29 -0700 (PDT)
Message-ID: <791b0c02-e1ec-45a6-8b24-07a628b2671f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/adreno: Add support for A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
 <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _TyVhbU8mqsKMtRkONBWUc14dn8QV3vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX70ywj7VXpCXL
 jqawUFRwQYR3rpfe0SLbL5+uqQoPTAk2nfBGjZeESvBfCifk5W0DeVnnDixAY/OVtgoxdaIZfBi
 t3iTLFu6oDZybw32Frs5qkS7GuLp+ImnUDBz3ndl89awlJxEFXQnM2dumAEsBuODWlsZaXiKFUb
 EeJqmk3lPEQnBROIcJUxaYHBqbDiPv3rV54SpAKUs49q7yWjJrFWfkdZMuIBgsnULj7NH4Hn8PX
 HupOV6lyGNcIXIyDDgWBT2rTmKcGr8mmw5e2taLpU841ccox09w0cE3IY3g0AJQNOV5dqBF/ecf
 KnDj93SMRkn6dD6L6EbyiWUOibCQEMUhGkJJH96cnqO5upHU/qgEcxWpMwRk19lfakZldLjWpLi
 poEtvxLBAO7GuEsnxKdxYo4Rv7gnF3DQxbfSQQMYUdddJaZXnIjuZxwhco/PaE1hlRIhLdeiIjE
 8ZOtfoqjHGjGNQYEB6Q==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27c94d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dsl4z-DLeecaUYzO57AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _TyVhbU8mqsKMtRkONBWUc14dn8QV3vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112047-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 766A965D9E8

On 6/9/26 1:36 AM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Just add the new chipid to enable support for A704 GPU in Shikra.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

