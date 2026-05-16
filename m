Return-Path: <linux-arm-msm+bounces-108010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBEeFdePCGptvQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:40:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A755C754
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5996F3004427
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29911340DB8;
	Sat, 16 May 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC5M2aNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cROFwx51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096F33B6D3
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946000; cv=none; b=L7oCY80PaQdJir3Ys0GKDe2OvY7XNF5AkFEw4Ub+M/1C7A3GfZUZJ0YpRoLTkCRbVuOGP9cTtjec7Y5awOO6jailRuXqOhTmjYGm4+VY5PTsj0hVmoxIY3SXsy5acHouSEfvOm3ZusqO/NksIjDZce8onY0y0oa5D056oJiu7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946000; c=relaxed/simple;
	bh=gsuc/6rRXcH93VmihWQS8s22CFUo0ceUo3PHNdoRaZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIs7tkWVOm30X9FaKkjJBpni6iAmzQgf5nUP+2e9V3an4W/jtqAKr90DFtQdmAwjjRoo9s6c6fqGsdc1bHfkxFZ/9nx5LICbYGfgCvfbA7LXg/5N2sY/oM3b17cDu3aSTY+3sI7aVZZeyo0aF+BCslQYvoQiDkTLtuGVf0/YwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC5M2aNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cROFwx51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GF2S7L1254603
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmhNdNRYPDgmzCrmp6j/LUal
	rEUVxqlvgGWshjsZhC8=; b=SC5M2aNTA9ZssWFVthk3HKO7DRtEJpGnnZQGsLsg
	R5RlJd4i+NqOtu7S585ZrA05BkGxXOGeJmgEJX97BFWbl6xoSzQr7iQj5lEyuiKZ
	qe/+Ag9gQm3g86FM7oRQMJ6Rj8dk0XjPoNoeyexvu/cCKDJClxCZnT8Pfb647oIa
	QFdD+LpB4bBSHrZ7qb7V1jA12XJSVvFPvWH6xHCzM1qGIR5Yl1DBgKOOiguhiBvg
	aj2BQadhXoeuB2JjjqFkDFojlT4FcK3Qa/0inAgGcTISQHsinzWFea2bASMYzQIX
	7j7hZO2Qba50tPg1R6oi8ntISwWm4KN+XEo3Z1fkC9UwEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcg1w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:39:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d890580e1so22678481cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945997; x=1779550797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmhNdNRYPDgmzCrmp6j/LUalrEUVxqlvgGWshjsZhC8=;
        b=cROFwx51bdCBg0TN3cAa8fkDh3OpI/SNgVzJFn7fYXKnfT+oO1oGSMrtx+XhUEYXGI
         mwY6zpyjFhgXgQLRFQqO15O7xP3T/1+VWduxk9wHIgV91cqt1/Ql2m4xm+6SCz+L8wWd
         24xlhsKcOundkHBAob8zVhl5pk5rX8cSfHa/xf7a+Wh4TILRpCvgPYwwHanix5DEs6VJ
         gMxmP6b74BSKO26+xP09+Ez5A0YpgWTB1RNfNDRFqDf9zsV4BxlvjpN71yD/cJGTuAO2
         +po+mOru474vS18j3DK5h/vM3YYJB+Crz5LAtVm3KFQqVeeRUGm5OIga0b0FGZX/AnMK
         C0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945997; x=1779550797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmhNdNRYPDgmzCrmp6j/LUalrEUVxqlvgGWshjsZhC8=;
        b=Vfj6S7OfJymKzJzG+aaZlpnspaAGcu+V9aH5iRZMSVZafTbJHJ1b9t1doBsPQ4tGCA
         X37DvGb6ck3/by7inphXZdp9bzB37TscmnLo46G2OErbcH6zwUafNnilIM69H7qXN9UO
         mmEIb9l5nm6niqEITgLyvF5Dr8RUVVMwtd4FZ5DcyT+F5NSLBdQC9Ub9T848bsr1JFNK
         9mMrNO821NHTVEXh06VsAW3c1HFntNol8t/jD3ZPv0OMbtGES8XxF52oFtdMc7tFqImQ
         nBznuqRqI3ZCXAiH1ThpC+f0rAEBfhvYnkJriF/wCvfavcdIvBWsKWTvRg8mb5J3isKX
         pyhw==
X-Forwarded-Encrypted: i=1; AFNElJ8dI7F54sjh5XUbrFwX/GKeC7fLo507qEsW/HS2nB2YCYPFABC+q9ZJ/QVnc2XVM30N51Vz4escksA+W4wv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+AtS5zY4AlM2CVbQYQ0ytwIQ1WG+fPzTiOsTGqfNvbCCAhjKe
	TnfYAgvzbtq2PTR9r4vSSpU6+Ltqy0hLuTDukV/rfwp7nns2CicKNOM4b/TlGhDl/dFXEbG5iDL
	Sc97bHq4rZgCvr9ZfpgVft+QDbdD7TnljiumeoUY+RGMYbemAMoUeo+vxKwzP45BFZUoZ
X-Gm-Gg: Acq92OGZ8B4dHQmkKihoH0iy6Q4x2VKEtdHUpKm+/4W1ErHSteD19Uhrkw6VXqJ3+Q1
	qQgIPIsw6si7xTaZn0ekW6SttaF8EhId0gTsTY94zfzkrWSVCl04T9CUSeUp6LjxYDnpEBRBhPq
	/Ui01g/AWUasGPDGvspgfyn574DQ7+O+m4H2yRta4g3I2svMACfvAPvIBX+XKTGgVAZ+JNvNzgK
	ilaS4DzbGPAWSCjoXKD20xK2EWTnbl+BpxmyMEWjIfZG+2xzawW/JZ172sJo7iTG7NCq21mawHt
	uRxrqYyC2ZiuH62H/1zyFgIaJ8hvhb9zEHL8BuqOuuxtEoL2Zc3Qo5qJchfOyBajllt3U982gBT
	Mk7ajI04Qe7mM9131qQp5psMB2+2sUitYzcDlZprFXpJGN4ra4vH0lNf2pdtdZt7jkgwvkdFEsj
	rA9th7TTnWta/Cr9V5Ws9ZNFrF+qiobhdIRDo=
X-Received: by 2002:a05:622a:8596:b0:50e:c093:9051 with SMTP id d75a77b69052e-5165a1eb8c3mr101645791cf.30.1778945996872;
        Sat, 16 May 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8596:b0:50e:c093:9051 with SMTP id d75a77b69052e-5165a1eb8c3mr101645461cf.30.1778945996423;
        Sat, 16 May 2026 08:39:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11b487sm2044495e87.23.2026.05.16.08.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:39:55 -0700 (PDT)
Date: Sat, 16 May 2026 18:39:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinseok Kim <always.starving0@gmail.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drivers: qcom: fix typo in comment
Message-ID: <u2vuydd2ubtlaaj2mgt4nz6gy5nhifh3vcpjhmdtyl5kod7gdg@gnynbkt24rer>
References: <20260516152324.1863-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516152324.1863-1-always.starving0@gmail.com>
X-Proofpoint-ORIG-GUID: kv8o7hBh7wZ4yj_JEE6AkDqvIhWHUDI5
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a088fcd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hEL-7WqZ2Qmr7oYnmoIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kv8o7hBh7wZ4yj_JEE6AkDqvIhWHUDI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1NSBTYWx0ZWRfX7KRKDstR9mFx
 g8FQVoSfAE0ABTCpzCuW/g8ViSolNyhrlRPtOKAkZ7CJnr3p5VvDLh435yI4bVg6fQr7TS6feZl
 uAVEdbbcgKziGL6hfQUuYBmv7ouvf6v0DDSXnyaMRfvVNK2KwAEqVWWm20kCzHWymke79jfXl7x
 hnpA7ta7fkt8p1bedlK0HdsUwqYAOrwHT/TuRbA4QFrmpe35hCXvRpY8zMW46AXfDpIj9Tx3MhW
 VuQ2kgE0COeEW8IJJn2H3Y1LxWU/VHihrmXD3wwRpHGKAc8DFPRLsTwMtcL7A+dP1sI+WhjideO
 KSE9a28ePPr77KtxzN7jO5ApT9hGNoZ2Vtv8eXNMWSIsYQ3NQH1nplB0sKcCO8AFSXDR8wseM1V
 GzC4dY30nLl7yisrvmjW/VE++wtrxEI+dU8G7XMhvNPY1uiL3GrqOt5cvZNTRoyq/F+6FzDRuDJ
 IG8/XwO+NYSSl0ir6Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160155
X-Rspamd-Queue-Id: 4F6A755C754
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108010-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,linuxfoundation.org,brighamcampbell.com,xs4all.nl,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 12:23:16AM +0900, Jinseok Kim wrote:
> Fix a typo in the struct tsens_irq_data comment.
> Replace "uppper" with "upper".
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  drivers/thermal/qcom/tsens.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

