Return-Path: <linux-arm-msm+bounces-117003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NSz3IcUDTGoYewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C054D7150AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:36:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ftn284dl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JYyGGcA2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32F3A3101DF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D72434E45;
	Mon,  6 Jul 2026 18:17:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E13C1F45
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:17:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361847; cv=none; b=flpdhg6Ab8AgGza1HrSaB03EW9GnHTHzPIVyzAhL/29b+CQiPVOiDStECJlzbw8FN4oFvYBgBZk1GJ4a348UTz9rVC+cEWJWtym9tq6XbD8emlI1ZLd56dlNfiYWaD7yB4RM8lB6GutYMSM3aA+0NLjeFwd+myYKrD0EljdPT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361847; c=relaxed/simple;
	bh=cVVFKF84chTUgoIEBn2P+0G91DFZG/kKqQ2Z/LI0/so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtwtJa8xw78C11oGqVYol7EySA5h/byyOYksazEhK3MQe+0Se1RQMkPfvfTBce4ctAdc3dH5DpE0LufCaCJxkKwl4WlpHu/hPmzJQeAPweVWCnU520doYqKrlO08qwYn26tyHw3tCLLVlG8Dqml5ztw7UzK4haEM9rYa9IAxfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ftn284dl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYyGGcA2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDHY972379
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rY4OvCYsCffCRFkDZOeMjDyn
	E2j9ZF20naZfPki+y0E=; b=Ftn284dlx7W1qaekMaRVUt1wptaRREnc/qGBMP3P
	+7+hQkTDkJcApFiRQi3ibgrHLBP3jVT4LpMMOcAwRAI5Fhio41EeBMLFhIdOWaet
	tIGaRMKTPR7nXWmaiiiyB87dOD+aehGsrjFqX5uCHOJHqKSph8SmZrgLLdmtUsbv
	eS85DO60cfUBqFqo1twSmHBy9QCwOfi3d+rWdEOOQDz/0el+iXGnn+ptGtFuWt0E
	ESiVspgQ0JJBVDIzTnkN9G4kob+XjQKAqd0PXFtzFFCNwmZl+4BU/fWj+XzOpdrb
	K1Hi8zgPr45zxFpW8sAcODg0KIt4pLb93Nn5B8Ih+jMIZg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r28gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:17:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be0de8bf7cso280847e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361843; x=1783966643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rY4OvCYsCffCRFkDZOeMjDynE2j9ZF20naZfPki+y0E=;
        b=JYyGGcA2hS29SZxHdc8It66nub/1fb0ULwnt5WqXKyjoKCdTPlfh0xawRV/O2Anf00
         uhH/fbk7V5RevDOroLPfolySFzMIElfW65RTrqt6fHCfGLrmSYB/jW45tPiQ3BH5ntip
         JPVMIq/0gaS3uzp4FbOMXDwrSdZduQ+3C0aFeIvusz8sybZ3onLKEgSHKMBDmSMBq64B
         E9b7lfRPq0TbYW0GW3izPGSuCDCbMnUaMcMk19TnRa/ryNwpnORuCmZA5vbolHxeCFrN
         XnQfka02Gr6MZOG7fVZsCelb4+mKQNUVUXuoqeJjFyxc16iXtvdeQ7vvoL8+oO0g4c5E
         elNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361843; x=1783966643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY4OvCYsCffCRFkDZOeMjDynE2j9ZF20naZfPki+y0E=;
        b=L25YXrw0ow9wbSPfVg9J9jMYfRl9QTzOSSmOBk1zrBQLBAdBV5Jv9vF5zkvdrGSmkx
         6S4NEqgzc08QToaH+T40v57H+YCR86VQ95vA82XLUffHWY9wX+h8qDf3rtjFElHx83LG
         K/F7wxRi5396q0CUDYfqB1lxbcs7zuYFEdip6iasNUeaRorBje2Fq31gfoiMHgMG7bLN
         liep/nuhUHJUl13kTStfhkiTiAykxJEvFU53dXBgJG0aYZxEfh06NAeTn3FDWUFKamOG
         Sg+cpnVWDp4d1LLyQU30smRw9uBu+ZhCLU93r3HUZY8KcX55qNTlwj7uPlh8CVVzLP/N
         UXHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1QIuimkEtRho3zuWpkA7JvFjiluTDbKK/kPBl9UvX+QoDXNUU9O296lX2fgMuq/p1nj8JxKAs0ACspAxi@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRugwDb7NZkxCqHGkQZ4chXQlfPRDUTNgdFM3gUCJszTzSn4T
	igvfUcxMIH7uMslSRG0niWzbocMA032S/I5lGVehjJ6x0NGqsLiPdCTLrBcaLBcaqZisTeDwmP3
	lBDPRpJS3IyWmZhFTPtQUyqo7myF3xqRDilzMgDgpD/S3sEHnyWZIB97ZvUkHYfSDY0+/
X-Gm-Gg: AfdE7cl56siDXPsadThAyiCe8eBrvCSfc5W4LzFovNjH86p51NJJvxsyRwC+06wE2Aj
	kHRzH7+ckz2z3gM9VJrIHWgzDe744M6ZmxlBYVqmmNcyIthW1MWubJnAST/tgZWhqF1puv9G3RD
	h4Dhd/a2iglszPlpvuB6JmvIk8VfZ9yud1rSMvughttdMDomAaKyQwgSEHaR7NrUoaXtalLJ+8b
	ZkFG6byNDekAAPl53dMvC9z+HwePP08ShpcPMDOmMieFO9o9URLogJbgzFVsYQVcrJGSfAhqt1g
	NsSNr1tYzwujcgHo8fzVSnGerUbf6DsvqJ3ppE71/M5W2MeExKESw1WK6RCTmXee9gVENGakAy1
	DAxuSBCUMfa0grghiMRmMpWTenLUMT70VUzEZmdCL0fBsuxUhDQMfUJc9K2yBHskdSOHR9OKW4/
	n8AQW4fr05L9kyHidMb/NbGFMg
X-Received: by 2002:a05:6122:1696:b0:5bd:fe7f:9075 with SMTP id 71dfb90a1353d-5be90760024mr917801e0c.5.1783361843127;
        Mon, 06 Jul 2026 11:17:23 -0700 (PDT)
X-Received: by 2002:a05:6122:1696:b0:5bd:fe7f:9075 with SMTP id 71dfb90a1353d-5be90760024mr917793e0c.5.1783361842622;
        Mon, 06 Jul 2026 11:17:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfde7sm3017146e87.56.2026.07.06.11.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:17:21 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:17:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavan Smith <kavansmith82@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: don't re-lock the PHY PLL on every DSI
 command
Message-ID: <xaoluuysxp4oac2j672ewoqa6etmpbz7wr5hoibitnw3jltw3o@lomxntdjjefc>
References: <20260706180753.408753-1-kavansmith82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706180753.408753-1-kavansmith82@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfXzEgaZrM+457A
 PtS5ukpV1D9KOtcQ8WcHPRkhbZ3u0xy//7psEVqPXUoZGaqZzf/c7DJQAtuS76Lf1OhQ5Aa48uf
 mIXIBa2/LO+LEnaOGPeicPQTP+/Ja6kyrC2YoxgBYClZst9hswXJohQSyR0uxGzGz2eh+2vSCB4
 ta+4MAuXdCDsnl9xdPOVCyjgASt4Z+IRFZ+Mg4wkFNfO974pYOrhLaHDEbp/v8vDqXw2aawKYDz
 hI5d/7qQiUn0vz/FkJwqi+RmsPyI1eeYpvJtl441aWFyblp4fUrZVECxsXiBQqIbi3NAc47kJ44
 /E3gOAoognkVAtFusv30BI9W2Wi/DDUaajsqnexf++faPIWyRz42+ipaaVB5W0hQQF1yGuT+0nU
 75/0nKbIj8/q/dowXXQVv3PAaHTrY69TwCKJo+hBO/ICw3FjKVv28Agv9oxTTsZa1TNbYzAmB4/
 InNcwXPsYhPeNWxRtvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfX422ItOKy5tU/
 062xNVTiFFP0VE1+DqxOrObRIUwD3uC4ES4vpm5B2/BUS72Z7yDPjAobXn4PxWvX7ppzj9KhqQv
 nP7CJnajC3JBsbw9H7kVg4wvYk+7vXo=
X-Proofpoint-GUID: 4L1_yGFyxwGanwKFFbs1qYL_BXrYq4aq
X-Proofpoint-ORIG-GUID: 4L1_yGFyxwGanwKFFbs1qYL_BXrYq4aq
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bf133 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=YWbiCP-hGGFPDlVigyYA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117003-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kavansmith82@gmail.com,m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C054D7150AB

On Mon, Jul 06, 2026 at 11:07:53AM -0700, Kavan Smith wrote:
> msm_dsi_host_xfer_prepare() runs for every DSI command, including runtime
> DCS writes such as backlight (MIPI DCS 0x51), and unconditionally calls
> link_clk_set_rate() before enabling the link clocks. On MSM8916 (DSI 6G
> v1.3.1) the requested byte-clock rate never exactly equals the DSI PHY
> PLL's achievable rate (e.g. 56250000 Hz requested vs 56246337 Hz from the
> PLL), so the clk framework treats every call as a rate change and re-locks
> the PLL.
> 
> During video-mode operation the byte, pixel and byte-intf clocks are
> already running and feeding continuous scanout. Re-locking the PLL glitches
> that live clock. On a video-mode panel with no internal timing generator
> (e.g. samsung,s6d7aa0 / lsl080al03 on the Samsung Galaxy Tab A 8.0, which
> regenerates its H/V timing directly from the DSI clock lane) the glitch
> makes the panel lose pixel lock, producing ~1 second of displaced/wrapped
> scanout on every DCS command. No FIFO underrun or dsi_err_worker error
> fires; it is a silent clock-domain glitch. Stock (downstream MDSS) firmware
> sends the same 0x51 with CMD_CLK_CTRL, which only refcount-enables the
> clocks and never re-runs clk_set_rate, and does not glitch.
> 
> The link rate is already programmed at power-on by msm_dsi_host_power_on(),
> so skip the redundant re-set once the link is up; init-time transfers
> (before power_on) still set the rate.

THe problem is that by definition the transfer callbacks can be sent at
any time, see the comment at mipi_dsi_host_ops. I think the proper fix
would be to call clk_round_rate() beforehand, making the CCF skip all
further rate sets.


> 
> Link: https://lists.freedesktop.org/archives/dri-devel/2018-April/172218.html

This should be Reported-by / Closes. Also probably add Fixes and cc:stable.

> Signed-off-by: Kavan Smith <kavansmith82@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

