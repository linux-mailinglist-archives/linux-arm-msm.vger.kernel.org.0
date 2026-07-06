Return-Path: <linux-arm-msm+bounces-116694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fms4Eg5yS2o9RgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B470E7F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:14:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RoQsyK5f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AlpBQExF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E6533E5AA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8213FAE1B;
	Mon,  6 Jul 2026 08:48:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E017478859
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:48:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327732; cv=none; b=IFoenE2kqHmxxG4x8eUYaJQzmas+oujM9vkhjzj78vlYpHEv6E2xjz3vDEllA/dOUmqQyuf2yxPZaZaYs5Wbl7R/NN1BMNCF0b20/TPvqNGDbLJal5MkbjhXplF0qajULPa7Yh06hgB9lmA8wPsIVYKG5KIUX9nHbtlYiEPJEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327732; c=relaxed/simple;
	bh=QZbdVd3wDcjbE5HqJ43PJx1XHy6+qgXALVHgYnjvA4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtI15Z+2aWoEcyrxPM3m9TNJ2hlPH4eIqxwj55/GWAkhR1qRKwrSTVIpmWQuMtdMW7muKzM9D5B8+Bbnhj4cTN8xLt5GRhuXUKlqK0BEwrkwEzjqnCFT8rkUMIy3K3ZB58lxGGEMBAAloLfRqP8crBcn76ltmQKtAPwzjROUjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoQsyK5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlpBQExF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dJN0048964
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=; b=RoQsyK5f7fV1iWo4
	SyCXOG5Wkn8sUyU2MNNAjdt+XvirxwPpqH+Vl7KXVFEVxe6G13eUl2I8KVybA5Fs
	bSvo8oIfzknqPfNdnifuLyviUJ6qvjS7+XgDfmJkkkad+KCKBhPrhToiobXU1tIl
	YFdVQfN0zAjEXkvCYS/RJwZyzBnhTM0JKyMah2Xfn8xtenWxWKQbuFKggz6rMm1c
	f7N4t3sUjBejdx8EkRRKelOmwe/39PgIO+IfwWCzvdTvih77/oAKY2UL4gfGdrid
	viv5xUbpgVRpsw0bW5UH4/K4NFST7TWUs7qPFG3KyW7Gj3qOHq9VQRRK1bEMR40S
	50O6Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur15h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:48:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so9242651cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327725; x=1783932525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=AlpBQExF/jYJfE2d99K0APtxw2UNDxe4YjG/hXCX7s3QiMv7LWYkObQYuKacALvCh5
         sl0IMNSq+u0EceY8U1i3q6t1xFED4H8XPv2AAMj2kQcHMD2FOwjwN3NEsWbANvBeV+86
         tSIZty11TsSmX9jAbu3dOCr/Tewtwc1ar6oc+4qEILwK7lxcfFeVjCHgJuo2xfbxxeqV
         gHsYyFrXBuqCuCQPWlFbYRijuYTTaSWGw1XjeYQHfF//qhK5tkKhjT/SLQ5D98O1dQur
         VOXoc+A0OGfl72heRXuQA+taZSvRXttkFwpYkhD0TaX53I04brumYNgkLB93nOk06YGE
         k7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327725; x=1783932525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=jRPo+jUTSmBY8ceSFFceehKkwiQhv3SaJ4XZS74MQ+hwBzOQF5Or7gu0rQJhQmFK9X
         gBUfafCXeyiESEc1ohLvIwChmBYY3pWL1naRHosC3ygiAPnSHTh4kaptAWTuEhL02sZ6
         h3X+uLnmpN5/PRyBTMZpn9cT3Y1l8uLrIbjO5gYp7kAQCVEvZZyzk0n0MGtHx5SeQBy+
         CDpOiuPDl9lT19S2d4e5O9mM9YuoY4AZBItB4E6RKWXjcwGXYiI78lcdyfQr6+fdEHNK
         ynK9R/xO0JOWi4cQagI7pszS+HKt6yPDBzcMZN1YU/6dPmhkogJH6dkZedMlXbsgVFKC
         xy6w==
X-Forwarded-Encrypted: i=1; AHgh+RpAawD2fLYNWwTUV+vYix2I67hTxNjjCYOCoDfzjziZhO9q5kMAf6BJZY34i15WcW6dP8nR1fUtjiGB42Wl@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCtx8jtjSZzny+LHn7G1n7FUlHx5USTAz0MFl7hlPk8McIKsB
	kz2cAp0qQnSeN9kK+TANEIxenqRVI1m1Al7N7kc75j0dEGG6O0yRrBFFDAPC7mx6m/wITeggycP
	38PiFdIPY3RPiCbylwGttGflpl5L2Az4s00KmOZlgjAFWmaiKqClMtuEXq7HgaMivoevO
X-Gm-Gg: AfdE7clGs5K5cbQ2Kbu74XKmAhPB0bjqXSp+KZXZXEGVXdJo+868J4N7c/bUR/uv261
	4Y5rwYEFEm5I8FC2mAtrv3VWxlNUhFVaH0OCcTvvyzyABt92Ig3BmHgkiMcBHGnw8sevziXob5D
	QP1ZUjKsAhcoZNM6DdsARWI7HDogVyQzeuEUuW4LjzvVbPjsbxwf4l4ZVnRFRxiz/7w08hQ1tXh
	TchXv6Xw39kOhBoxmefWGC1GWEIH/+0VBs/YWR439R67gINr1F1eSaAWf0H2yAb1M0PV/5sLt43
	1c4J8oBlkBknGdKGG+8U1FFrN0+bxvltYeq+08B5EJLMwBqt/FdAr4GSokEAa1GDWAQMTOPsfQ+
	6dEsV2WeUsYmzTvPMA70FzrnHQPcqS6Q4HLM=
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210641cf.10.1783327724787;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210471cf.10.1783327724419;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm691730366b.42.2026.07.06.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:48:43 -0700 (PDT)
Message-ID: <3208407d-05ea-4b1f-bb65-91afbcbc858e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LJNWG-Lj0s90MdlDRj3C0iSmkxGlC7Eq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX/RyZGypTbqWH
 NoRj7CXtOdrnRM/AP7et3+UBJ5ewm3EQPC6+gqMoulmRPDezWNfxZOl91P8VXbfIUqcwxoCAv+Y
 V5qOt7No+wGTQXFkyOzIm/GZ8Nmlw+o=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6bed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KnFAnPMC3uCYYmJdzeAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX3hpHA0X7itX0
 PcL36Yr4/k+dmWzmjFcp8HxYt/+xd0QMsO6UpeOTxz1E0RT1M1gp7J1iNBc2LaMM1+gxhMhGrJj
 Mrg9a9MZpAM/vV6cLMp/8GdHeoUUte5/MkTo3D/iRpHPfq04DZuOHVLHr80/UBN9XVZK3IStJTv
 PhhDZOGvOcjcQ02BkAoavtEMVgdrvbJWRguCOo8b8+/X3K51r7zNgfnKs6zQij2hVtRXrqX9Q0Q
 hG9S9rwKt3wOuX/763itneimOp9zzj083osIDs+qvvma7JDfXZsC9D1h5m8zbAWx2IKc2I939/H
 EWoVgGmvwXcVmPQ1DXdSOS3CsJz404QcYGzAciCHTO+f881mDWmhc/TShJFzZu5v7weGo9OwQ6L
 yLxoCpFLsOS0KIQWjM8MUVYt1mN/6jxvilpbEe91H6EuwKAJpg0f+h5eYCGibRSOkc+kaQlewCq
 FH6Zfn3mk7O7HjUPJSQ==
X-Proofpoint-ORIG-GUID: LJNWG-Lj0s90MdlDRj3C0iSmkxGlC7Eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 927B470E7F6

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
> (clock gating enabled for that TP0 stage). As per the latest
> recommendation, clear this nibble to disable clock gating for this
> particular stage.
> 
> Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

