Return-Path: <linux-arm-msm+bounces-118541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XTuaO2NgU2o/aQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:37:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909B744462
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:37:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZgQxYWWd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AxiFCRFd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C725D301F498
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 09:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21833375F82;
	Sun, 12 Jul 2026 09:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A639BFFE
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 09:37:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849035; cv=none; b=KC79sePtdn1XbyL+ePpAU0qF2BwPnaDQx+PLYf2Om5n9M7C5ok/kIPZWO002KOCyqH2AqudAju7Oyyo+Dhhj7wGqUKFqKeMQYBfUK6nfSoHOlWvjjBFY+mucsfVIDFd/vCJ4mpmq6RS6xbTGZ4GKujX1/yLmOufFfxlH0qxN6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849035; c=relaxed/simple;
	bh=OHlDn38mM1Sm+EK49ijhYmp584xK4zebKS7X772wsyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQyhob3tf96jKoOla3s8GEzqhZRCYk0IhoCxAYCqfmnCO6gt95QOqTwpyQPmTuj/O1RKW20rTGow0Kc5n9l2aL4x+EMLOzyh7fC3wgv/+4/Yl1yDw0989DHZSbhvF3GesPO3PDjz/hkv0wTJC4XkcquyeOtaHhS8XesyrQ1O6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgQxYWWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxiFCRFd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SGAB1857860
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 09:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oE/19i9toA96SneFhi3ZDhc+
	txpytRBTsnN+E2BtECQ=; b=ZgQxYWWdXQej79t/PWYU5EcGWePsmavZwZYbK1vb
	zpiH8MZz65yTkuCOr/gcFX2nNBvcaWWCGspiS5RxKhwOEyDCd7iwii+qZc83g1Go
	t09F/qrsvh3iHfcRdjO2F/A3pqNTa1LTDAjQeL7OrUgyXUjtZb8EAwNfXx5i4/AI
	QfuRvP+aawc9AnkUrIl8E35mNOnOsWM8QtSUrfxIYJsEB/UdJHMq5ZMuR58vN2r7
	YW7RtfhgBWrvr/qgGp/Z6eNZbO1NDdqLQ1RaHEsC6bBWr+ooHPzqY54rFxgYaQ2k
	Dc2bbJbaKfpYOnm5FIbhTf24RW3EI4O49QnZmKY03sdnPQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjg1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 09:37:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfd82e193cso605453e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783849032; x=1784453832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oE/19i9toA96SneFhi3ZDhc+txpytRBTsnN+E2BtECQ=;
        b=AxiFCRFd0A9v6lRj7sKG1asZaqTfO5ME70TYKdMnoUCUIqbhWSOAr/W8hS0iS9ZjOr
         y+/b42GoVV39zSJZFH5IKHwY3iMUwIzZf9JfjIfKw71Nuy7Q4NM+JWIzheuFCaMb84tq
         XlxhOu6bKwAwBoYYY8jgOYkuaZ0TsAJwFHlk52HxL4x/oLU7W5wbNJMe/AS3hUvpNhvi
         Z6UgzKGp2VvzbYKVfBezlGa5ix2uhYKv2ZdDhj3a4x3lvgQds0Kzdg1HssS7JCt+a6+a
         P9cLpvqivODakkdPhApaDzMcir1MCptjcV5P/j0tRL6WgCc8uTbscWJzKK7YHUfXQFta
         KrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849032; x=1784453832;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oE/19i9toA96SneFhi3ZDhc+txpytRBTsnN+E2BtECQ=;
        b=Y98iWlWOemybhSwtBz1bpoL6A5U1+b+msrThUw95/apNr05+qKK5K7HZTW/O6yoFlL
         Fy2kULsRnaYlsmgvGjxs0PwKgjSiNQyaLYAso1JAc8p3SmiIW29WG6Dxm5weMjuauwK/
         iKcXdXW78ak1fIEM/HK98Gv4thPsuwlWl2eRz5VA3MSsf75Epdyl1tAbuAOepR8mbIp6
         +ObcSgE4qUmP7Tm3/0Uz2nixSnu3z/RpVdCGYwTby0PDhXEKx0PdKKH7Q9ArzJodY9YR
         5RjKUMZA1X8xN5eehM7sJEE6gGMwrC0OCrC4Aa5u0Wux6YD2z+lhPvM/QDJTeTZ2/pCw
         ufDA==
X-Forwarded-Encrypted: i=1; AHgh+RocM4kjCmB8Zg/0VAlRM4naUlm86klyZi7dzuJlAU3gD1STdKSveoxGVJW7l2xK5UkXVr1Wj/5AXl6aWswg@vger.kernel.org
X-Gm-Message-State: AOJu0YwskbkqCK5woyiwGwbxdKVAyTde4py/UdoB+E6gXF2K91BBI3XE
	UlpC0aXOiGbGciJ/ZuPrIDN9oOVjMO57MvotA+mi0FrzECwCEgKBN+SWWAf8Qkzmn9o8K0fujFw
	6ZuZxdEpJxq0DaCEe4OZPYdOr6h/o4D7WHXycICiogxU/0OWw84EgxL1YIPrT5Ws5sSFd
X-Gm-Gg: AfdE7cnAKY+qYiciq1Fm70YgripyUhfVKbhNKlAtYBtMreOLrWPgLFB7Y9a2XlhhCc+
	Ag1gkFk1Npy8wf6qHWKNs61GYmyKwhp2LTLZfyxTjeYbwZ3BE4k0zQNb+xpj/dABYndT8eB5W0O
	fuNjflQ+5Tdg4MRk0dem+LqT/Ozk3QCk859Idq9i6aiKI3O6o+nbffCmXCLy45auslEToE3peik
	nIeuudaIzy/GIKYU5yjUflswxPaMzovY4hcQ2KGXah/MP2hCC8/aeBn3QxMMp+UFKW15GNQQRII
	jDG54qv8AwaK2pV69cgPsYnFRVjKOnBPsa1F4K+gWhOVMGHAKjEgJiR3oGaTyENwA1wCfNeTktO
	brk8YLWnZGf+PyJ8c0ANtQ/MC0UNq7Z4J2IKhNN8Jj+ZYhn4kmzR4jeawGiN02I6mJuyfMG7c2A
	ZFW++CsemMH4D1MLHq4Rjbx9Th
X-Received: by 2002:a05:6122:169e:b0:5bd:a247:49e2 with SMTP id 71dfb90a1353d-5bfbf04ffa4mr3254310e0c.1.1783849031890;
        Sun, 12 Jul 2026 02:37:11 -0700 (PDT)
X-Received: by 2002:a05:6122:169e:b0:5bd:a247:49e2 with SMTP id 71dfb90a1353d-5bfbf04ffa4mr3254297e0c.1.1783849031479;
        Sun, 12 Jul 2026 02:37:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b83a93sm21643201fa.24.2026.07.12.02.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:37:09 -0700 (PDT)
Date: Sun, 12 Jul 2026 12:37:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: fix parameter name in
 dpu_core_perf_adjusted_mode_clk kernel-doc
Message-ID: <u5ozkmhq3ll4pfhvxl63ezf5dtgz25lvrwmpk6u7ofccnjicw7@skim2jft2cyp>
References: <20260530201342.10538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530201342.10538-1-rosenp@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA5OSBTYWx0ZWRfX4K+ouRReW0p+
 WcpVT/WUVHvO+ELbUzjl7dEImXsL6M7ggVoV7hzjRlsi+6W+3Ky7t0VPL8IDZ2ok0sBbRHo2SHG
 woWYIzcDPkSB7FdgObKTkCTzAvVairZIV95csA8SHMvYnHAym2beNUNBeNo1R0bZJC6hmD/g9Qw
 WRH3OTb3rqQj4KSmV9HXBfRaRq86uhU9F4RM4hO77vtAqpi8R2EwtNwq3jahQ4hdSgfIEQ/TupO
 YfwRj9o4D+hWj7KzxHeKExri/RQSnlMzVPSUIA1pAyw8ilfb91NPVSwvO0F7v1dyYu13FfEIyt/
 RnOopR1KSPPmdNvlD29ZmtNdTYoFxY2JWtha+Z1s2JDfmA0FQElSBwKGAa9ZtxP8E8fRPrIVbsb
 PHrZ7ij7HD3tHjut0hyYnQe7l3kS+Cjn6syqe8udT+bwEEbfQenGb3gyFXZMGukkI5V0ZvcHuCf
 uR18rJ4IVaPvjBra82A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA5OSBTYWx0ZWRfX6dgf8oJhMHjP
 /G7PT3Woyoao76r7MvcMFWIsekXtOR/PhYgSTKn1Rbaq4yoH4NQ50E62Fj9TbyHsYgVCnQi3LLe
 RzXEEEU683X4lQ61YYD9Eyg3DlBz6Vg=
X-Proofpoint-GUID: 7pD4EMp1Li3jI2GHyHfVah-2TakpfW8l
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a536048 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=zdcK4JMYJf_hBWaldjIA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 7pD4EMp1Li3jI2GHyHfVah-2TakpfW8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:dri-devel@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,skim2jft2cyp:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4909B744462

On Sat, May 30, 2026 at 01:13:42PM -0700, Rosen Penev wrote:
> The kernel-doc referred to @crtc_clk_rate but the actual parameter is @mode_clk_rate.
> 
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 13cc658065c5..2ff255d7795e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -34,7 +34,7 @@ enum dpu_perf_mode {
>  /**
>   * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate according to
>   *   the perf clock factor.
> - * @crtc_clk_rate - Unadjusted mode clock rate
> + * @mode_clk_rate: unadjusted mode clock rate
>   * @perf_cfg: performance configuration
>   */
>  u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
> --
> 2.54.0
> 

-- 
With best wishes
Dmitry

