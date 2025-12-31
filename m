Return-Path: <linux-arm-msm+bounces-87072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05ECEB876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FA7C3004EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA65B1ADC97;
	Wed, 31 Dec 2025 08:31:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8791624DF;
	Wed, 31 Dec 2025 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169866; cv=none; b=Yinqm8tVSF9V/eDEmtjDL9r+B/KOuEsWxxI7v3EPYqFbnzhMyvi7vgNBf/Ggfyrc7zn82id8GouY6g0C3TiGS4T5XGnWkMcmlFm58KhuAcn+t6yU9HBu2PaFmVQk18BPpGQI0en2+39C52Ehu8LJ3AyiXW4El/Bv+YAMCrrKHCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169866; c=relaxed/simple;
	bh=47SNa6j3A+3sbzDIb/a+4i0TYt0uMEj24MXcNS+8EjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ckz+Une6ARPq4tCiOmuTcbf4+4cxmS1JCX/nknw/dafweE46wTd4bZMXHQYO2tQmPS0vVyTAnSQa96qgNGj8WQkjyMV+eS9Mz6q8YnXTxzP5O98ihrCEP6TDS6StOW8YY+GbNuIiOOx18NRxZu2s2h+6XviizYr+4U/ZFxa+pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1767169836t8268e047
X-QQ-Originating-IP: fMplGKqgXfykVLGKncaHisjFc0ZxUPSnlLhM2eZrTvU=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Dec 2025 16:30:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13277669007580881109
Message-ID: <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
Date: Wed, 31 Dec 2025 16:30:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NvWYEgjCCjcVLSxgtlTlvY4dI9qqO/bB+rureEgWsG2ndZ57xis1oDR+
	lvhMZMFDz63rdna3QJoi2OXN38aTolKdBm9gG4Un2dacRDNpwg0179DuK0mDIOuR9gSfWaw
	F8wEggcCmEw5ML7TNJYSpKq88f/JNeGEjOsibW+8Sjs+4c+P0O4ioXyCLXfdUh2Rbtmkp41
	z7q7dlWFEqUHohbE2tNwJ+7gURcoM3/DBeTPNBPI73x3dKOapHmop/gzkjtoYbQZY+XSJdj
	ZNdEt6t2w9NDKf54p5dkaBkegIV9TE0HGnfydKTeMwmn73IEqhgGa9dGf/nagDf8l4A+4E8
	7YaqGBDZXddFri8Sgmrb7w1akFAX1yS4KvBaCPX72VdjI+u2fRCN99+5TQiyeHICK/lUsG2
	XIgJHjed8Ji7O4Fh++CukRPh9x5ZTfNeDMMVxcyzSHjtm+/oXyXnppIfPNMf2jLlIIwVV0q
	MP/lhMqk7XBWAWfcVUh58aEYzpS84PDh68op6wg5vjQuTV/hJ4TJoYQwfaDUl1QBEEK2NQl
	sXw118y03LLmPXLZb4cyjMmWaDjxnivT3OldCIXF89QURylOV78tTsbNWJmXS8Ls8z9sssz
	GFSSQlPB3ZPbnbCSXE3/bYd5sXZdioHKz0ynvX8MZa/wReSVGkQnpR6JqQzTaWNhl4qjQg8
	gPioBNDZVHjtxdmL9A0R7YCeoflMa4cLWbJySiSvLnq9ZNOvp9J8FhfkNXIEx6+uvdt1Q06
	z8VT/ao/YIHPpNSyYg2HoRYemhfnwCrkwIQI7YTDva1/9OYMIELk4Vh2/ly6Cy7zoODnvnI
	MPD2bRsxkHol8YnZMSrFNTbGLcgSVc5772oaPLJnh9WjglNdzX1PJ476FcxbkS8/Snop4pt
	t2WXZyf43vTrgiED6v+PJFsHBRhhoBSB2fgnu59QTfrogWMOmcXLVAYfRhJq73OEj5SwY1b
	D8aqxS0C08WjYvSnp2P2CZoSgwM+KNrkxemPKdZDeeGfSV8JRAIZDeWnBMEgLjjd0ykz8kV
	K2ffFlVwByLrQ2RXZUuszO2izYydsiva6enOyX3A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On 5/15/2025 7:52 AM, Jessica Zhang wrote:
> Validate requested mode and topology based on the PINGPONG or DSC encoder
> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> off of PINGPONG or DSC encoder max width
> 
> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> for PINGPONG_0, there is some additional logic that needs to be added to
> the resource manager to specifically try and reserve PINGPONG_0 for
> modes that are greater than 5k.
> 
> Since this is out of the scope of this series, add a helper that will
> get the overall minimum PINGPONG max linewidth for a given chipset.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>   1 file changed, 39 insertions(+), 7 deletions(-)
> 
Thanks for the patches! With patch 2&3 applied on top of v6.18, I'm able 
to get DSI panel and DP monitor working simultaneously on qcs6490.

Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

