Return-Path: <linux-arm-msm+bounces-110957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GXsTDhEaIGpMvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:12:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC36375BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:12:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JznB89ln;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PPJkHYjy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110957-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110957-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A747F31A6A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773DD478E5B;
	Wed,  3 Jun 2026 12:01:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B7B478E50
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:01:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488104; cv=none; b=gIPuMMK9WDRzV/HSZAjUrFsFhBtcpQLyV4KVGqDK41+qU6ID+sxqa7x8GZqhAZtR3B3NPyCwYEXN8t4iItE6DaanBl5TqiHQjS972bCBXEgpB8DI4pwR6MU//5PH543FMURQWr7AAbGGdRde25cTSWUOXrA1QtrTQxeO5E+T+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488104; c=relaxed/simple;
	bh=0D2Lcsm728ZtcKAOh5KSWzZ8x40xCyxxBYPn6DtacEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLq5KNmv9phLW3r8EBmI/npLV4ZkjktS9VG+SdIysd45XBu7yF5dR631s4EZav/Ldxttkp9Ayle562ZRsSvYsJxrT7eONSaosC1CuA4xIAYwtxhn4GMBfVs23V1vMMt2FCfeHFIk0XUQd2xTPVbRFj2PwB8Ut2c2GnfYNczqWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JznB89ln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPJkHYjy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537FDPx1957518
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZF/YoDviXWXeTNepn/0tosC4
	tnxo/ct3hFoteh4vDXw=; b=JznB89lndnBm2S36waIEPlCzQeQqnzDfHuS1ZPdm
	RTQOKYbsr1hCjpht/yBnD6HKrjDxpgR2VeI6gSI62arDILOi9gFXUT2Ox/isCIze
	UNxRVibLTQMTNnSgO1XOhwv/zaYOFeXmOUS7aZY1795lQTr2FmX8KO/RD2zVGHs9
	KuIfKKIc4iU5p1lmwnHofUy8T6xl07Ii32rCgScVDt/7bCbg2zTRMF4s5X2UPTTB
	Hynueqknd3ICqDH0rjS7he6txuzGOnztU8QA0M6NQKolKPkxg4mmlmZljKcxUTr6
	Jx/6vMGDeA9pDWoOiqAjRfRSr2McAtdQGdtA2igH6zXdEA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc154w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:01:42 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b73b3920so4826476a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488101; x=1781092901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF/YoDviXWXeTNepn/0tosC4tnxo/ct3hFoteh4vDXw=;
        b=PPJkHYjyFcIxn6slopb0im9fcU52zKYo/AwwLxIIhi5FAWyZIMlKJruSI4f2U8gxb2
         0uQfOdqbjQmH2caqQK6QigF2MVzLYzuGUglI/A/E0nGxkwqhdeeup6c7qF7YfNNFgzmo
         UlgZHCuElChC53UWBslOypFHVQI0ls0BTvRwyvQpBBNKPzZKLleC0Y2xaaDfLiJNplDk
         q/KQvhBazsVwBorEwHfZRqBmJ7DrnWNoT9Rg7DSwBevrqSLmSqAd2v7KVn/w7cmhAwJP
         Wkn2WURWo6cEkRitsGXxa4FAtbG0209o5+m7YYVfzj9DVQuS8H/ReQ8ZieUmbI5YBYVu
         +9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488101; x=1781092901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF/YoDviXWXeTNepn/0tosC4tnxo/ct3hFoteh4vDXw=;
        b=oCjzNlF9bXLws18GAdxbUqKQJeLaZTVyLeurr7nVGqQc6GpCJ8BGTx1OeaxLieXV58
         elBZ/Jp2H4+yKjohijEgAKFGiGsloUkrcgJ1HJbXBBPtoaAWURMWuL7itGPUvh3ulEyJ
         w1Yg5LmpHJk5WNrCeGd0VwtDM9i+pLAAviyUoxy8U5VNQvVSFvl3Yp3dEoGFiDOwqZay
         6gw3wl1ETUvRhWWSQqSvCzp6+Z/GKfUqiDjoEBplzlOq0Uge5ShD59XbtSFS0V0Lzb+z
         ltQ8HpPq2XcQRR0QersEbHhX5K+kxXheakQNpg/mUpu+JQIG1inWXKF9bQ0mch+llaWE
         VN8g==
X-Forwarded-Encrypted: i=1; AFNElJ/t5a49ftxQpTDphQQH1eGasRixJqkJmeiYa/ZNtImjxfhF+Aaw2uNGPh1QLVrpU4OZmroTIoBPx3+ySn5P@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWq4vq9ZB0LOCRTliiNlSRSrRhjFlaMOWxdGkqUGv0mpnp256
	FEK2YCW426yNWxt6HkEQUhTHpxpnGTeOJeCtsz3xullSW7Y/8j55vpmcnnGQcOTE+oVAJ44iqWS
	xTNDqCy7wpKsmXWI+1QXMZC9oO8HsElyK1b7ufPhWgYnsB/J9nLvD1Xwc9gPjbwpYGMeR
X-Gm-Gg: Acq92OHVnRIuL6LXELvxNeBOvhkIYgd2aJ99ZtAp0EaaxSwSIwBS0BCxEt/v8QQZX6F
	qI/H/Gb2VyFbeNlg8Dow169rbcbkEPuTkC449BBovFIdvUsMua8lrg1tvRSxyNbbLVAsdLoVniD
	TWW1mb8GB4GuXpJhh1yFHarWifs/mFob8fKXRz0JyZ1x7LSBNnTf0J+v2goSw2UqG63XQ17KzPT
	u0EjhdMXv4r9xnE85c4BxSgOct3KeO/oPbAeUPFB0W3EZPo3e9K/EAJT3klpjDlp6j3SLBBDvvJ
	RYtypdcAb6v77W0+0WYnTOeT6unmZoPtx7blSjFlhaT8ni2C6M0+B91zZIm89D6Fc7YrGbdpF4l
	pONhKlU/6LyIhLcIqGimVQV5f3xyf6zcjxHBS75uUY51OgrBhNId2r8RDoK/Kmn2mDIDZUpabXL
	MYeJO0jE8970wtyzfrsoNY7uHdEl7vUDuccSrVkT3VgqCuzA==
X-Received: by 2002:a05:6830:600d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e6e8fae469mr1781244a34.0.1780488101194;
        Wed, 03 Jun 2026 05:01:41 -0700 (PDT)
X-Received: by 2002:a05:6830:600d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e6e8fae469mr1781208a34.0.1780488100792;
        Wed, 03 Jun 2026 05:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcbcsm615672e87.20.2026.06.03.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:01:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:01:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
Message-ID: <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-GUID: yPCB_tAh5U2d3CwRR3YnHno19NUNPR_t
X-Proofpoint-ORIG-GUID: yPCB_tAh5U2d3CwRR3YnHno19NUNPR_t
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a2017a6 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pDmPIOVPWH5ddIUMsd0A:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNSBTYWx0ZWRfX1zenhxijc98U
 t83/cqaqKzccw35KIXFrR5LgsWp/mQ0qXKIcbUPj6xJVw5/o3n1SnBdQaJdV8JzRw3mbvH9cOrk
 FPUhmGSLAElf3h2TssFKHtu7FR9L9ZWlf+JkzViWZOehdKE1bM1wtTsjZrTCMh8/QU2QFXnUp/6
 AscmOFQLBpR739IZzZSju4MPe5C6T+PiZ8qOI8ytyw5ozU4xhhfsiaU6wIUrdOOW6+4QNuQAvI1
 1Ebop/6OUtQHO0fN1a7kyi3tBX+b+ozmlKT0KsgpwQLdz51QAPjZNsc4rvXC0Yz9jB8LEu05ANM
 BnaaVjnzqpYOV/LmZQXrBEoepREKj2+3qVdKKertzM8VhpG1PdQOthambMBj0pt27hBC9zN8bU8
 ycMq8Tq9yqNYX4Lv3vIynK4LxJhq/LhmI4St2Kz/qHvOXySisu6wIsswXe6ufqQfr+VHh93BCym
 VA3AyFLktbSGzwxcieA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110957-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95EC36375BF

On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
> glink_smem_rx_advance() wraps the tail index with a single subtraction,
> which only corrects for one full wrap. The advance count is derived from
> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
> if such a count reaches or exceeds pipe->native.length, the tail remains

Would not such a packet already cause issues as it will overflow the
FIFO?

> outside [0, length) after the subtraction and the next FIFO access uses
> an out-of-bounds offset.
> 
> Use modulo so the tail is always normalised back into [0, length),
> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
> checks added to the FIFO helpers.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 42ad315d7910..4f143921b719 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>  
>  	tail += count;
>  	if (tail >= pipe->native.length)
> -		tail -= pipe->native.length;
> +		tail %= pipe->native.length;
>  
>  	*pipe->tail = cpu_to_le32(tail);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

