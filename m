Return-Path: <linux-arm-msm+bounces-113342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XZnqHhgWMWqvbQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07F68D7DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:23:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oyrXOda9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iZp/xUXy";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75C5E300729A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B6B416CE3;
	Tue, 16 Jun 2026 09:23:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98130BB9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:23:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601805; cv=none; b=HVQxe/Oh8hpxf6/upfOzSXnEoFLk/l1xiupbE+d/6sRfPi/BJZJJW7mICsd7vnX3bYd3V+wUtv/CIKzcwW12p+RWQO/GFH10UPnvacaV5r610+5sW66QWd7ULMJ/DFPpXf+2o0+QV39zczze6dyoPP4TdsSTRi9ljqTRAu5rTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601805; c=relaxed/simple;
	bh=szIFmq9trnDGRMkH31Lg6OUAgi48Us5qv94sPXVoC2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXGnrfEzBh7729GCT4X1RP2wNBi98PqZmZswuhrwD5r6JlCiUWXytDI7WmPMBaMp376jCJVGhMfwHp9SQLBvUbMC+hno0axGnQNdLOQO8RtVj6IPkcLuqpXjir2volgMdOasfMkv9nXUhRX6w1rJyWPQN4D0kRpgsAbMpkAjk3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyrXOda9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZp/xUXy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G8s3OH1239608
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Qq8vPHgKwH4q0SQ20diO3tSTvhdrp1Q/CuwfNHfduU=; b=oyrXOda9Vh6h4jKO
	qi2P0JZUYE1q88Me/6Zict/gF1BGdDMvwpZCszzVzE56B5j+/E+l03s9OH/jWhbv
	6rH98zRH05jD7YDd1q32s0tnQ5XkDLGKOe07F/zzVaXLq77n02Ur8KVhVGRbWJ4C
	ji8SFwTDYZ0vfTttDc9By5TyzAuU4EgO4zdQkJ7HPrTYwNMAyrAHpryX6zm419mp
	UdWEQMgcC7iyOaFhvzN7OkX6qfA46KYaevm+Vfmrbzu1521ys/1qk38qs5kCrvn0
	fC+rGdADW7S5Qe2ko3sGecSaKej0QqFrEVMFyNyuTv2tDaxQZmX//H0gC/zGV1DM
	o3eBXg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:23:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842688fa7b8so4856125b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601802; x=1782206602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Qq8vPHgKwH4q0SQ20diO3tSTvhdrp1Q/CuwfNHfduU=;
        b=iZp/xUXyjkaVJ1OE0IF+CMQ5aO00ObNTYQvFbQzEh0V440BpuvgLBualS4Qq98pqRv
         z8RxQ4J/1EqM4sS7QsWJfXcMjicumCO1RB/HUxZEZ7XqfZKbfz9HKZNh7xRd3vgnWv4k
         S47PmcprTmvi7hPWB/UyawzFFOMCvrtsd3BsWiUBwJlv9xpBCZXrDQqI2kL3Uc6m3jMw
         lbAdPJV2BvNMQo7B+oNT6XDde8GgmxxYjeCeb4fGZKhrtGbj0SOwyGrAicoTSkWXhi+e
         do3WcxI0FJKKzCgpQGJ82iVPO1NOnniPMfGc3REfZzIycdgCl2Z2Ss0iyCzgB355albS
         ib5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601802; x=1782206602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Qq8vPHgKwH4q0SQ20diO3tSTvhdrp1Q/CuwfNHfduU=;
        b=SWHpa2qmEAxZ/ykVyxgjn8IENfXjvGG3cTY84OEU7aFJlLf+TXSU///R6vFuE9CbLv
         a3LLK9F5msEYzevRShvjwfElefnyvtvy0MGO9/b1mtwbsiVA9YTN7QXRtmANZ+O830N3
         VBsbytHsJFE8HEJx/DOaG7w0uI/gzTpvoQw99WjYz+ICkMVXvmXdYaY7RD0lr6wjTPYR
         Cw0bw04HqDDBoVSzpQuYGLjqB44KRvB4L/N52SKVSv+TXIs7gaXE/O4QCrFu4qD9wWux
         1ZWkUsutpoWOsHGVCtZP13/eD9o886mT8s+oXs/akTwcNxrqWnDqkzYSpGjkVi0bGYGY
         9Ejg==
X-Forwarded-Encrypted: i=1; AFNElJ9IBDmTYbC3ED2Dz4G6ksOPtbC+WIKN1hm/NazUlCihsV2iXlZ7qJ227FnaVZ63eDIic728vn1KXJO0rZh/@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/qFpi5wvJOZCr93gYjq8pdmxtkkHbs1hq/F7CjNE2lz4RcKa
	fdiP6hcAy+er5QYppWfl1uRFgGWGyv/H8y22TQ4mBdkmRd9oBrBshn5jpEijtzQhILsqJMMuCEM
	3Uion8kAPDxogA8yqeLHwnhczqqB5yd1XZHKcxJNILpjhLbiNf/kiwTSdYbenPE/AimLO
X-Gm-Gg: Acq92OEQslxaIzyoJ5deYA8LKO2ZQ0CMYeLCA2EpWImzjcC0HnRXUTCKoHi6wdILCAX
	TyfeIG3QOSD9qzgavNh0KgErwr+vzL6IquO6fO9byy00bz2hzKfjhjFUqZSFyaembX/Q4g01pV0
	ryI53kxtoRpgOC9Cg46Ds+9Xn9Ie6SFG0qHAvqjRmaViy5AEXMQBsTV0o74wbiYESETQquA5n3L
	tC/CuTrP4WRgU1CmqRp6wnyZ5ek0mNjiuRyr5bGgtx7qXXhPef69TVNhWIig7dbqJorvkq5hP0v
	6cgOfhz2HvqJ990QgCu4BvARuEvY5EssKNC8K+ciBu+Q3ll3/1iNMl+hWXSrkk+PPS2H5l3MuBb
	u6IHWIZGHplUXhn/eWEYtA0zJ+zWPyWJd7Pp4qLDVMgf0z1YtMapl5HvVPTvX3O0bhlPiMTKFRi
	BUhs2QDoyMAY5pmjo3
X-Received: by 2002:a05:6a00:1954:b0:82f:7888:e2fa with SMTP id d2e1a72fcca58-84513eb9e2dmr2530019b3a.17.1781601802052;
        Tue, 16 Jun 2026 02:23:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1954:b0:82f:7888:e2fa with SMTP id d2e1a72fcca58-84513eb9e2dmr2529994b3a.17.1781601801577;
        Tue, 16 Jun 2026 02:23:21 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50f7sm12099158b3a.35.2026.06.16.02.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:23:20 -0700 (PDT)
Message-ID: <8c80a4e3-7c3d-4d0f-93e1-27f7f3fe6bf2@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:23:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/39] drm/msm/dp: Add support for sending VCPF packets
 in DP controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
 <i6x7675n4neufglcjwneds6nehetclystyg3abosbdjkh25ub5@psdjsrfl6wek>
 <d3689914-4afd-4bcb-8aad-380aefbf23d2@oss.qualcomm.com>
 <n6qjiuouisangxtov7dd7au7wb5ubt4vouodhhziuq4fychkva@275qni5tykry>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <n6qjiuouisangxtov7dd7au7wb5ubt4vouodhhziuq4fychkva@275qni5tykry>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a31160a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=h4G6HOsH2xYsS-_yFfgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: E4cZjZewJkDu9OtK1kPtjjjldcJl69SB
X-Proofpoint-ORIG-GUID: E4cZjZewJkDu9OtK1kPtjjjldcJl69SB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX6p45zIJN/mOr
 sq1h5I2Fzlo52CGdL8pXve7UiF+kKLe8SZzs3CfqnvMi5vM9QMbZn9sNrt56bFWXfaPVtGKm1jp
 q6aXRvMqhs2cmZ5yynxcZHAAXg6n/Z2/ym9hR9Cat3x/wZ2/9OJHiZU/E5Ef6EU0iNsIu6jfgQR
 Z0EmzdbtKjxePjpHUoa5vuRBJj5bre0pMp0ZJBNGmIjIBMRu8AyQwVfw2RnslyrxcEc19LYeSr4
 TH48afAmTGPH8OyvL/IB60+7HnMY8o/r1lRtga9mtYw0xPcBFED2zF2H2Vh+Jkz0AneewxWoWLj
 E+Vj/OsZ2q++VYftMVqpGJI5pJrn+4DDJ+GQiE4wmMkFueccFWtZVYFiVprQRO3syuu0bSXh3Id
 C8KnR16CBiK0meTh+tR0x+Zc84EgZclc2UvIkKL/8CyeFBMOg6bggJi9V4/Be0qVDih/v8/1deP
 fybCakQKPQiM2Tdgmpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX1ZhlUEG9H1ts
 d3iAAWUS34D9LMvv8xxgfIbl0lc/DpReVHCliVj9M1G9Fy0Oi/Nb3GghTuSSfyzSKFeB+dHU3RH
 7iuia6fwt78VVgMm4MJqrDbaXN+aJu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113342-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E07F68D7DA



On 6/16/2026 8:44 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 04:35:06PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 3:24 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:57PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
>>>> when stream symbols are absent, typically before a stream is disabled.
>>>> This patch adds support for triggering the VCPF sequence in the MSM DP
>>>> controller.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++++++++++++++---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  5 ++++
>>>>    4 files changed, 58 insertions(+), 6 deletions(-)
>>>>
>>>> @@ -516,14 +542,28 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
>>>>    	return true;
>>>>    }
>>>> -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>>> +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>>>>    {
>>>>    	struct msm_dp_ctrl_private *ctrl;
>>>> +	u32 state = 0x0;
>>>>    	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>>> +	if (!ctrl->mst_active)
>>>> +		state |= DP_STATE_CTRL_PUSH_IDLE;
>>>> +	else if (msm_dp_panel->stream_id == DP_STREAM_0)
>>>> +		state |= DP_DP0_PUSH_VCPF;
>>>> +	else if (msm_dp_panel->stream_id == DP_STREAM_1)
>>>> +		state |= DP_DP1_PUSH_VCPF;
>>>> +	else
>>>> +		state |= DP_MSTLINK_PUSH_VCPF;
>>>> +
>>>>    	reinit_completion(&ctrl->idle_comp);
>>>
>>> And there can't be two streams wanting to push idle at the same time?
>>>
>> In MST, msm_dp_ctrl_push_idle() is only reached from
>> msm_dp_display_disable_helper(), which is called from
>> msm_dp_mst_stream_disable() / msm_dp_mst_stream_post_disable() in
>> dp_mst_drm.c. Both of those
>>     callers hold mst->mst_lock for the duration of the disable sequence,
>> which serializes push_idle (and the wait on idle_comp) across streams. So
>> sharing a single idle_comp on the ctrl is safe.
> 
> Comment, protected by mst_lock in msm_dp_foo().
> 
Got it.
>>>> -	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
>>>> +
>>>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
>>>> +			  msm_dp_panel->stream_id > 1 ?
>>>> +			  REG_DP_MSTLINK_STATE_CTRL : REG_DP_STATE_CTRL,
>>>> +			  state);
>>>>    	if (!wait_for_completion_timeout(&ctrl->idle_comp,
>>>>    			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
> 
>>>> @@ -2183,7 +2223,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>>>    	int ret = 0;
>>>>    	int training_step = DP_TRAINING_NONE;
>>>> -	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
>>>> +	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);
>>>
>>> Which panel are we passing and why? It feels to me that we have two
>>> different cases, one for the MST stream and another one for the SST
>>> link. Can we handle them separately? (note: I might be wrong here,
>>> please correct me if I'm wrong).
>>>
>> For SST, we push to bit 8 of MDSS_0_DPTX_0_STATE_CTRL.
>> For MST, stream0 and stream1 use bit 12 and bit 14 respectively.
>> For MST stream2 and stream3 use REG_DP_MSTLINK_STATE_CTRL.
>> Do we need to handle MST and SST separately here?
> 
> Where is the MST panel coming from? You are pushing ctrl->panel, which
> is the SST one, if I'm not mistaken.
> 
This function is only used in the SST path, which is why ctrl->panel is 
passed in.
The only reason for the change here is the interface update of 
msm_dp_ctrl_push_idle().
If needed, we could keep msm_dp_ctrl_push_idle() for SST and introduce a 
new msm_dp_ctrl_push_vcpf() for MST. Since the SST behavior hasn’t 
changed, no modification is needed here.
>>>>    	ctrl->link->phy_params.p_level = 0;
>>>>    	ctrl->link->phy_params.v_level = 0;
> 


