Return-Path: <linux-arm-msm+bounces-111736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LRE5FDB7JmqtXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:20:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20E4653F21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:19:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l9DsxP1+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AaFufeO8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90B6A30557CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B353909A6;
	Mon,  8 Jun 2026 08:11:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72838F636
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:11:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906305; cv=none; b=C8ZPrlOM3Vtx3BI7/i9sjyLjZ4EDRXksNZt/KRpqoCAND70vOLa/38s1/7qjZjBxqmEkzfBhFlkMnEx+ZgmjFzZpp+BHMLPltXTUBpUYKr+K1EwB6bQPdb7wIy4I0j8DYEkZ96HSd17TcMP1Mmg5EDRVjytD6SV4FJ6tmW96+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906305; c=relaxed/simple;
	bh=7QGjeYp+lVN3mkoIQkK7bjs46BHL5k9kHYo5n235j/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2ys479UlxDvxsWGd7ufzknWPGOWnB59HSce0WTR1G/WacGDfCOthmpbTJJ79TJTnn6I3MK8iwDR6FJJeSV+q6j0uFXDa2xlRglVcfN9RzfltdnSaGwHffMp6DbSdZ8d5x7p0+1r02pom1R/2YHsz0gEjX00MJPzqnsMxLgpuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9DsxP1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaFufeO8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PTua2808212
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HZQmCjytazYLSvvHY/io1wridXfLJz+czVsgR52vQ=; b=l9DsxP1+dDB/MnJ3
	X8rsY8/xOhjKoGh2ZydtIl/B5hi+BaJEjBSeQnh8ekFa6u+BQPYm1zupZsbob5lu
	scewVj3UX0wLBDimrY0DG1eL1xoN9mrIzIjALsrcLR7BYL4fkIG7Z9WN7a++zHJl
	ihGq0pFIjyrr2ldZuJPKVATY+q7slQzBQ+NEAyWxH5cLxhGeeHuGFcZrw0HVf8bT
	e48rg/Ctg8dM3f1NwJKMURSs3lPEawXQm8KbnZIV9ET+aR+pb0F9VQXyJjQpeXHw
	RQR/j71BBcA4Yve0OPI4YuqD/eW9wXWNnDI3xa7o4WWKzPn1Nj2c/HoAXY3m/Ed8
	Zto5vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6rnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:11:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so11386551cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906302; x=1781511102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+HZQmCjytazYLSvvHY/io1wridXfLJz+czVsgR52vQ=;
        b=AaFufeO86pLpReJdNRsv4XIHWyiA8jKjx8UaE5aHBnYuKDVJQQ+CN+jrNmFZRv91I+
         Uyxl+BddllDfN99xf3PIB1Dw/rcPtzpXJovlGh9KdbZ7ENZzXckY55M1tTAEhm4w4/oo
         d6RIEq2uw94bCm5RQ+Ihclm5/mK/8vge93wH9V5F1uTg/q3M/bpN0GzJaKzdFyw8FmX1
         +1gZHOsDvsxR+dsx42vBg8J+CrNfAbmTqVx666wKXW/70vwnH5ZWMqnQqUwbKx7fgMyi
         o0qKySqBHfEgJSOcCOuh2R5h0EJ3sPqeHAoBQLsyNbexizfEYDCvkYYrezdi6sst7fVg
         zxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906302; x=1781511102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+HZQmCjytazYLSvvHY/io1wridXfLJz+czVsgR52vQ=;
        b=JUEEqzWluB433DN9qiJQpZlNMQqXKGDNqTL8T7Q2JTRVyB5yfzkTxaOPQDvZHv7ZBp
         Aa5ENrtEZpIsIlxRKrqpKzXsA8Z22dswghnhfvADtPVmNN+7KsdR135dyorkN41Xmd37
         Wy7KE6eeFit48R3p3zQM4rqcYfgL/VG2YIIZXrqeordcQpiiKopTItb93+0KNCAnT0BT
         Miu0AilmJ+0cTRqAwYuqiUJCrklmRk0rmkoPPxZ9rKi2Z9cHPIZ4B7vKGdoKbn+yGJkl
         sFS0lhyVtUzDggogju55Hd+nSQq/w5FsVtTNVpsRPmbMx7GWgaPGLgsKuM8SnF3EqXgT
         355w==
X-Gm-Message-State: AOJu0YzALRLNdV+qOojB+fqvyd7S3ZGMxfT7CQPP+9++9fwp4Vb5rsQ7
	Brq9u16NWrYjvOMYrne6RUYZB+4sDZuwXZGnt4dLR9KacBZSosgKM7UZkXav0DDkvulNxAKbYX7
	5eyrpamVQJyOUISze6E3AKwXp1z/On95ABYpC1OMn5lvlmxXGXBPdJVlG4s6IVgBHNTkz
X-Gm-Gg: Acq92OEnezoo6V58VxUKCwOqelTMjosJ9Ty6Xa2hqY7NPxSlQkZ5ywhBk7l4J9EUTqY
	TNDeKW33qfhgJ22NHIDIF4wqS0sZlfBOk64odGVJCbg6jCLw6T44CdQevi7x+v14J0twrYc4W8D
	Dcc7KKvywWaXcdLriGFJhk7XDnPHVLxCLhc5tx2S7CgfVGXHR7eKRRqgHisTMGYUMLQTZvyXCs+
	8ZevLEifxt7OM4rkjtI3mYwJG/Ra0h/rqmlOhgZHxkkEQgpDu4d4YVI9VuwGd/nON9zMLq9J3mU
	IrKYIQI9OTsQTlwk6EHV7qeHzoEZbqHYaDLTdhLP+ovahvh2YGPKrqP82TdE2wT8srQy1D2Sjel
	m0GzZj+fMVtd1smY0E0XWPuarBsrjBTNctcInSiTFOpsqJKuB0159FW8P
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr136988581cf.7.1780906302358;
        Mon, 08 Jun 2026 01:11:42 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr136988431cf.7.1780906301968;
        Mon, 08 Jun 2026 01:11:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f62sm840014066b.57.2026.06.08.01.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:11:41 -0700 (PDT)
Message-ID: <cfefaca1-01b5-4c4f-8bec-d59f88b18dbc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/msm: Recover HW before retire hung submit
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-2-2caa04f7287c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-2-2caa04f7287c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ii1N24jE3Mopsr6V-RIN3VQFpPS1J_Yl
X-Proofpoint-GUID: ii1N24jE3Mopsr6V-RIN3VQFpPS1J_Yl
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a26793e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1CK4PI73WE-LNi9EeHwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfX4b6B/zWa0TxF
 QYH+TMe/O938rVtc9QKwU2WIlJ6/QAcUlbe4fEeFivFrb4SaaGhSw0J16A5fUbhkzgDxc+gliBp
 HlG9SKS1DUcdPz1PwneM0kw1woFq276dYlNGs5IuZPeEOS7F/h2k3yEvuBbMfg/3tKlg4PODaRj
 B3JEo8U1ykpXVvFVVsC3GvGgvjoqFlFyGfPmOpUT2FhrI4Eo8qlAp4M6DBadqpaHnM6yvJTp5dT
 sEC/e2YtomBMPVi9Gp3m41c8gbIFSmBeLyaM+L5nbxxbNrerKnKlKq/n3rPRo+ieqfIoz2F/7qC
 miBdwq6eS15raKWciyUE1Bx8fSV3gUabPmZxuDh07FpJrTTYc7N2fBc+bcsKF6KCJmdpwh/LuwG
 nIvzO63WuvbO/Es4R+LHF972/WGONATJsM8Q17ijQne7gvsqSg1/nB8AzRwHiBSwRwK3GiCYlee
 Rc1De4mA9WL0tDdIhmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111736-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A20E4653F21

On 6/4/26 10:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> During recovery, it is not safe to retire the hung submit before we
> recover the GPU. Retiring the submit triggers BO free and that can
> result in GPU pagefaults since the GPU may be actively accessing those
> BOs.
> 
> To fix this, retire the submits after gpu recovery is complete in
> recover_worker().
> 
> Fixes: 1a370be9ac51 ("drm/msm: restart queued submits after hang")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

