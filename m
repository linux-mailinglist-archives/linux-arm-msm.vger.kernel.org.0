Return-Path: <linux-arm-msm+bounces-111620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkFzGtvjJWrrNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:34:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CC6651AF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:34:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fIJkw1xO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VD7Z0o3F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4DCF300D918
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8DA318BA6;
	Sun,  7 Jun 2026 21:33:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC032F742
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868030; cv=none; b=iPlRlVGKvNzAMyixRQ/r4yobRY8N5wOlCjEfkIGl/UMCc/YqRi2vw3F0KPYam1cvmQe6GtrSQ/m1MBueIs6dMGhqqKy0puiCnSdEY0gAByEIAbIzah75IOLnWkQIcpQ4bviR5pzr2giZ5K8zy5m7LnQXBDbcvIcsVTNIyo7IIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868030; c=relaxed/simple;
	bh=4vrsh5dalUSU5jM2xw+kdXJJx/bz0ZJINqL71/u36/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz4GYIEvXOcSrtGu53yEa2wybihyQxH88gnBFMh5YtraynOz6U1L1Ul8Kk11FoILgjEVCaBfn2BnEs4zt4JfotlXur0KZ3N76Mid7shXCeNJI1SgN4/gCqWwbNRC3CKWhVHONxQC7jkqNvrAjbhagWJNGcWJ/5J7OD07moN13FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIJkw1xO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VD7Z0o3F; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657IIKKl1219810
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pS/NkRuygu2mvwF4imRm5jHt
	TNJokEHTz/MVvAlZs+Y=; b=fIJkw1xOI3FLNQLAAw2am9JcT/xlA58zQ7AKSlMJ
	dQw5SfXxc8Hw4yiYdy3/ZtjKbAOahpzJ3eqix+7c5aOsC7IDVnKgggyQV1nsiV1j
	wGA2P8xQsrMxPIPrm4pwZlQpz3g2lgGwSZ8aYr1vTl6EzKDDELf9Fx/A3qPxD/Ra
	l75v9tnpkoTF/3idLu7JEMbxH4H2W57P9f51cfby4167GOqe9U9OmklLHFxx/KTn
	zgHWWMfgwBHeVlHgQgQ4QjU8qrjYsvMZpjPv9RnaBhS6IAa2mtO8VqxBBDdWbczR
	f2ZXdRec64lxNyeRqkb3DGUPhKOwUyhREEXvhDkhah0pFA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf509w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so4972353e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868027; x=1781472827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pS/NkRuygu2mvwF4imRm5jHtTNJokEHTz/MVvAlZs+Y=;
        b=VD7Z0o3FQIl1aNA5h7StS5jNN+Rt+55Xqi2oJX9LXn1pxaoKCzh7KiXaparC3eq2ul
         yOnMF2eEfMLTPurYQpngf70WYSE/xpnm9RhBvK0RM70r+TSiAdVMQ/DB1qPO0mjNHowC
         7X4QfK1MzJ3phow7Nr3IFr5PbsI9hOLjciKfQfXSm7ZOwPIMmAQGodmHUKrqpBdS7Spr
         S41VTcU1ijVIiqdACE7Xi229B5Z9BIUMGzAoZQYzBDpbfdkCVQit3Y1oY3/S385Lf8mq
         ppdOc8FPULfXWfVZ3pO9unbMIlbKocdcS+xlnnon4R7xfKzJNtXNSki8Rl98VUElb7T4
         akvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868027; x=1781472827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS/NkRuygu2mvwF4imRm5jHtTNJokEHTz/MVvAlZs+Y=;
        b=aHZlTYk2fQ6DVyOET88FgUAvl8hrcxyqLud9+rNL4C4qVczGHCHTn1PqE9w6/6ALzk
         FbdM4ogXJ1EAi4NryB1nUCRlGvFiw+ki+Ka8motr3XAY/7J6iSrtnLYPdYB/7hMlMbgE
         5aaOzJT20EZDttJxFEhoDds9OX3H4fwA/5fL9pO7nWA6gkAfURELk/QcneLcmA9sPwBm
         Gd06cQ6oyDVw2vCXleZlQRZ+0W4jZJhqQ2wxKFn6D0wTfbvlgiHDs93reXKJtVA6B9Pc
         11jnk0cNokQlMlTCxv76OXKfDqAwpHQB/EJuH5lYWqY3hBOX6GdAOqYSBKqgM4Ck/+Yj
         LsPA==
X-Forwarded-Encrypted: i=1; AFNElJ/pSTyVpxnZ8Isl3XX90o0Ti9Q64xjdlYy0GvMb/jtXSDZ7+YXVwrovHyawtY+uGnNB+RkDlNExwQmazGnw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpp7pXa68BqjHw3MzUiVWpcYVQ82fRdxrFh9zPyjO7HeKgzVRk
	jXbs3EjJYLxgrXg1/f4MxFTIlMlg5NJJM87QOcd2ymp9jJgQOd6N6EhSOQDawU8+bR5ryusEeyJ
	BGMlIVHThxPE4t5kiB3aEXouZZxRrC0mYohiY7KxFsncRfVoHkSPLMASy+5j1dt7z8Sfx
X-Gm-Gg: Acq92OGgNTT8RfPJFLWazFSbOy8BQ8E4xTPhHeBfVhiGtz/bqFVJMlwlh5cPCLIYzNe
	L+ipJ0mPPk90tzKZNhgJjkoHvEbkdxE1qt1cR0VYXOJugX6pA83JoDLqWy7pzJKY+nAXlx4JD1M
	XXBMFaMvp68Bb5zS3t66NsvOkf6PoFKOkPT6orZFiHeSfu5t2UlS0HGXFwRa8nA45lFE5R3aX8i
	lsqBTLrO35I49d17f1Ykn+uB9QepCDYLhtsERC/naI8p03C8hv2oMeYWq/uxEKO2hZ1fm5M+wrh
	8j6Af+jDM+H7HNv2ONPYx5FiG7kF7uXeSaVMpxLtj4sJaFqhqRcZmTPO73NkTIpvRBsJRWjhaPM
	i+exS7B7IaxxmMtDkFtkDWuWGUFCTRT17tL+IptzLFINFH0ZMFNxO125m3UEW655CERWb8fJ0bf
	cACkZRWGbL1ZUCAT7AG/2wdVFYmMD+/D4cNkZGc63xENA4mA==
X-Received: by 2002:a05:6122:2a09:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5ac478d8479mr6298835e0c.0.1780868027218;
        Sun, 07 Jun 2026 14:33:47 -0700 (PDT)
X-Received: by 2002:a05:6122:2a09:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5ac478d8479mr6298824e0c.0.1780868026853;
        Sun, 07 Jun 2026 14:33:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9995b5sm3273368e87.76.2026.06.07.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:45 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:33:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: add callback parameter names
Message-ID: <zrkhwyz3ph533e45bpegu7oi7yufp2t5yw57dnjuax5big254y@cxjxakitwkgf>
References: <20260604001859.33353-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604001859.33353-1-dennylin0707@gmail.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25e3bb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=LwDYr5J6HBqJMoenJtsA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: GzN7AXCsfhONObXBBmL5jl9l_NNeGmO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX6DiyKZ0A0PpV
 QztKZQ3APohz/dkho+P5RgXNoMwhQO3OS4El862kxO2Vvd8Ptf1YSAsa6VewTQUoroA/6VHqV2v
 ueVek8wt9pWfU/JC74jic3Mm+nELi5tXX/G2dKSpxcNrN0Z0sYhdbCKvtojLMa/dS79MplfW2zw
 UJBcutCE4O7loyqIx8/ZkmgCoT3B3eO8LGojXke26NUW4xhgS2uPFz+yycARgyfDjSF2FtEL7EZ
 gk7+xw05jTFwd43ZqrmeY9t6R+thUsCQpKPcKjqBNCugzmNiBEI6JPtsPbbSjx3WedLeJAjRZG5
 DXoXHOp6dz0Hmi66vmONwPtbaTCSkbInuemTMY7O5mSeZfWAY+8w18k7j+D909Szl4l19NSAOlJ
 aN4YiOTsLNQ74uZJTxYVEvJoGe8+R8zfZbphdizIjNAt6l1KxD7r2IDAuEaaCYPlR4rzIxypY1g
 xQwyX3ffkljhhJhBszw==
X-Proofpoint-GUID: GzN7AXCsfhONObXBBmL5jl9l_NNeGmO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,cxjxakitwkgf:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8CC6651AF7

On Thu, Jun 04, 2026 at 12:18:59AM +0000, Hungyu Lin wrote:
> Naming the callback parameters improves readability and resolves
> checkpatch warnings about unnamed function pointer arguments.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

