Return-Path: <linux-arm-msm+bounces-102835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPYTEWnj2mnp6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD83E2156
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B1C83008D15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6277A22576E;
	Sun, 12 Apr 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2Fd+hJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWGV6Mfo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044B1991D4
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952693; cv=none; b=AEOxHCdXEH0twz4jckTOFTlLQYh7kuAWOd6Uc1jlrnhJ6wLLs3tqNehAbJi4GsPOx22s1Op1EbYh0UDlDYowdg3gLe3DeU7nlD3Vqq8n5Yni6l02YoZFLfrdg3sVnXjVZfzJEC1S+TSuI4ZlY6V6J8+i1Cpwkp2UgGROGIkpktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952693; c=relaxed/simple;
	bh=iyiLWJ8L/q+Hxjmbjw6zwZL/RBodbjjSmw+B9MhL+Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6Eha4PPkBgJ1JgtrANkq2QcQ6luhtyx0lOz11Nx0caC1kWNuH+iBUKAUSdWyucc3ZP7i+tyi4SQ2hDrlWNJrz/9r37PpAvuTD1DP7YyOwTvyxBTbTdvC8S2kFyD3FqqnLkD/OifCMF+GqNSTYv1wbQFPNF+Jmi0OMsYuXCtF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2Fd+hJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWGV6Mfo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNrakU2121931
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SXR3clQGGXCPD36LnBK1unVp
	b6SaNrAIwD6Q8PNPH04=; b=d2Fd+hJNGm+KXuUh564lsWAUagM5IWb/0flOMLG5
	4CJdRJhCJ0HkvqqcDA6gjlR6i7I2ogf8IHvknyjAR91XoTg/e2wZJfmwQH/IzXYT
	zxELvSBSJorozF0E/Tl70/NJRWZxunjpBUrxIbOHFpo0kPLsCMRAkYxRo1mUx0Sy
	c4gXdrdxmHfbRQKzGIgRUWP9HynLFbvSnUtvbzbKIpxIBICcuHivk8waGHv5VhIr
	dt3S/sWVjYg3Ox2Z4i91WiJWgRnuOqqQqYA2nW3iAbRzzBPINt1oqlznMFO93FEs
	0rPPVhXJOk4Q3p7u6hzeCYSBnBBZahMSSDR2URW+bY22IQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew01hxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so88689941cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952690; x=1776557490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXR3clQGGXCPD36LnBK1unVpb6SaNrAIwD6Q8PNPH04=;
        b=JWGV6Mfool+U8EvLNlmWWeyimhzbXl3W4rkiPHg9bXxhXEc/82mAm/3EnXrJh0TsgF
         WqaXVffWlwZv8HeHJJBDWptPHult7SJu6w4AJdQpwZr1h+qfivc/5kD6xujRNLTm5KOP
         lBFWErGgIQqHYf2QHhWVEZ99oIxTeZM8fEmxa9z3V/4X9pmWJuFPhUtUOtQlR9lf9j5j
         NPOBTietocBzxwYTDGBgJ593x3xU52wmNUV45KthlQy3ohCKEwcx3D4yvQlYujJlktI7
         F6qyjC4RFAvSIxOB+Ez527k9/p5kRjKOqVHM6SxFZZx6PTL+XVfXZ7focqSZsbMoyndc
         r2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952690; x=1776557490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXR3clQGGXCPD36LnBK1unVpb6SaNrAIwD6Q8PNPH04=;
        b=PCQHNTcaRT8NCDVKEg702lOCF4DToGZLVzpyRv9lOXTOfzKjyACmMGGt0tAjaZdERi
         ITpn0LRJp9zDQXTK14Djcy5ZfOvYhq9wUMYF0Yxfou6DVsGgpirWuJhiNz+TalBqlpWR
         Fk0w6K8DFsuTs7E9URX/5PUP7+iqPyt1gSAodNiLENcf/A2Bqp3R45SAqptPsHCPW3aM
         y8KJeC1jFCOOT+MXMW2pMabIUGFvayayI6agqiZy6f/lzp3DEvvgtA++7w+s0s9r6dnw
         SfD0XOrbDpxKOfjvGjJauNuRtwO6B34+eJLERahhTd/OC7QQWN2uSH05s/wIJn276T/Y
         Q/8A==
X-Forwarded-Encrypted: i=1; AJvYcCVM8NWM2CpDOVNvpPIMiSYtHVMDRxgB9zESPQzj7yZfR4hKYeJuejt+lr3rRiQ7ewBiYqQ7QzVNjgsIZo2t@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDJu75Fv+sazKs80JO/+96jyLLtUIuxw8XhqwrTOKbmdhStN5
	QGHPsflMT1Qjv5KqN/0Zzh9/Fgq/6JnPQ49H4T0rC5g3MLmWOg4cnpU5uIT0sBjefBGULHg4xKo
	mgBE9eP3FOllT6u722O6JSSgWjhqHrg8A143BNfsbG1Ru+KHe9XTDTFM3px4M44HOpiJO
X-Gm-Gg: AeBDiesKc2DYgi4iuUmJRiT5Gs1BHKjN1mA7T3pUuXU0NMxf6lEv71zKtkizj+qtQAV
	66A6m97WxsCL7BRKD7x2lltByA8eMbg960qS1uBhy4yRjvgx8Hc305CKv01VXtlUhKnkaFBsH/6
	hHRm42bsgS0sBY+17qFoPQwPulA8sHsvWWyEzYV71jBG4tN4I/Wb9/0mIQVOzsiBn4vWfTUBkZ7
	ZhXAupA3y35Z7xpBpxQWL7p8QJS/UOJBIphM2ZnQaW26njnk5pi3BuT9eNKuNXZ7i/uzkEwca0J
	8YTE5qquYXn/3izBiYjCXZz4AvBVmZZA3VJ/OWr3YtBjXkAK7rmL70md8KFHaJHdftVgXruNnNF
	wHJJuhHoEdLyy6G2aUiZ4R1J1epkW3TFDI5ZdSqtPvZHN4B3cq3VxQvJeGFdpwSsmTycogN+jO5
	OqRCarxChj6XRLDKf7PA7l5d194dH7eO3x6j0=
X-Received: by 2002:a05:622a:2c1:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50dc19b1083mr167075171cf.5.1775952690556;
        Sat, 11 Apr 2026 17:11:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50dc19b1083mr167074891cf.5.1775952690163;
        Sat, 11 Apr 2026 17:11:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541ddfsm16791641fa.27.2026.04.11.17.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:11:29 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 28/39] drm/msm/dp: Mark the SST bridge disconnected
 when mst is active
Message-ID: <ge2bgx7rn4vcyptf4cd7hnodnycrg7gdjceqq5zdncmdmmnjlu@2cuu3lcotxeb>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-28-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-28-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMSBTYWx0ZWRfX4k6PhXLqmXj7
 8LVZKojwoTU+61xCnNWMxoJuoGudY/GChC5rPzyz0Y5kDWH7lmFw8STZwfsaLzZTN+GqK3So6ws
 Gpk9YZYQToIYUijYFyNeldHXBYO6+GEUlpuCzjEWv+yY4EOPjQctE7eb94V9ziU25OPavdabnM2
 M2Psyc8uHMfUg+J9GqrXZVSwY9RgfYWcJecGOqvA/pFXk1DEN/Q6ciFpZbtpwVE68XJkO22vKLh
 vlEeQPEkMRsaCsRZ2BbCkk2Z83aKsF2KTYd6yG41Nn/gURjFUfNUqN6P7Gib+YmU0mLeau7LZt0
 FPe9YOhIkaFKaQabc2mMCHHuUefGtzJQNSnYPl7TiADARYcQJWVAGuTsNy+xw4Ogs40+791YHJs
 GvSP+r2oEKB7K3eLlh9HFQailcrnvmOcCYqIQdK7pXPTcdOlnQJeHopAjSW6RJPXkmNPpMmEKkE
 uh6de0loO91ZFNkBzzA==
X-Proofpoint-GUID: Krw1-r_cTUSxunflyX_hi51ugc0HCnzN
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dae333 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Cr4VjbKX6U7v81t0Q-gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Krw1-r_cTUSxunflyX_hi51ugc0HCnzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110221
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102835-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35CD83E2156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:03PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. This patch skips
> detection for the SST bridge when MST is active.

"This patch"

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry

