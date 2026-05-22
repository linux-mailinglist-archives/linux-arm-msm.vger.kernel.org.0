Return-Path: <linux-arm-msm+bounces-109282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAUrHqVDEGrpVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762565B3460
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD00030013A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6503E6385;
	Fri, 22 May 2026 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTOwpQUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcph7WC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338613D5C0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450046; cv=none; b=gyFgjMniD1mD4IiXX9NOSwU9Oj5EIEJbZ7WUF1xkZfq7Q/GrxSYADQs0UltO5aCf6ht8zSV6PehkOAfSnA134qukKAmpt2M9n6diMEOnmbaQvtLLP5wFs+yta5oMw/GZR7G4ZYLfUgHcbV0nSkD3I3ejERL3ezl1eEiWen1M9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450046; c=relaxed/simple;
	bh=Q+PX6X71JwQZhEfwNl495EuFgMt3XjlAbKMGlCt6uHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u96Qt0SN3UXRvskJOPrGa0Kh6c/6mpZYdNHX0rJDFXtepMWIce4LKKa46riS6GplWij9eK5lWm0Yba1bYLkY7hixnLbSZxjZLhpRl0L7rOlJqXDco0k2SFUvj6SrrD3463fJ+g/p5NYF77lpq/Pjj+vlrIqN1K53ytT3RtKTnCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTOwpQUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcph7WC9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA49Xl3947403
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJrMUhAsFW3Hba+YJzivVZsaFeu6ubFMMTZwlHTTbPI=; b=RTOwpQUFvLJtWgln
	wYnrgQrGbrCE9RWF88iqdN1OHIKdP8KZIZN7zyTIgTPDOIygBdReHSPpUX+CV0zs
	Tel7Z9VEGAlAxx0Ay/eRwmkFd6VAppMHPJNBb2GAdgjNn/fQYjUXd6QoQdE89KgF
	MY60xrXoC7Q8mDG4w7Po2w2WpXPrVeSaOsDYIQHKlpC44FnGBZ4AfALNNlT0rP9f
	OEsrE1ncQ87aG/UO+aD0AXRP5/6/mtuYHPwB57eQYpgl77bJDvoN+9j2KaDGsI2F
	5wlOkH24BnuFCv8DxJiTcnl0Zn0rAixxusv7MzIihYA5l7goriAP6eDltHICF+6H
	p61s7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nga0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:40:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1349cc6so2663301cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779450043; x=1780054843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJrMUhAsFW3Hba+YJzivVZsaFeu6ubFMMTZwlHTTbPI=;
        b=bcph7WC9448qeVxkayK/icygxLVY9a89DKIBNMUVq3zyp+frFfIa7gJN4FQApu8x8T
         uN5KDAi2n9brXfmmKp70Gnlk+N087RUF57o8lwDosAIbgMKBHgb37H2VdmgRenD4tZy1
         RNagWDwkCpiyGD4WHttppwAhWN68pZPLfwVE0W1nGCsYGlLcURYPGacZH7y9iDH7dhMP
         xt+qDvcZ8AYfp0AnS4w+0MOSGWqO0mS/n7Ss49iHB8f6OW1oXia7+xsNFXrNxt24eapv
         vll5uCm1gSJ9TqTH3p7vkp5oxRGRf0aSDwJ+KU45Q/IROy1V1lzvrrCnRLWc4S6ayJoq
         h+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779450043; x=1780054843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJrMUhAsFW3Hba+YJzivVZsaFeu6ubFMMTZwlHTTbPI=;
        b=M7LDxJTE34NdGYA9NHzLHApXM+XDq/5fcYgFvV0g3RDmRyvA0wuKmZltkee8l2pZau
         9kz9h+Tpl8Ao01YjS7DQON0VfxSnGhoGhc5L5CW9gbwLgnPiE+YbU1DVIpd55GLWxrrN
         lFEiDoX2LekZ1l9PcBbgEYE64VdDQ5rLLqNOHP6VKSV87vFbdcxPt5r9fR3TcPd53VnS
         6/XakQJqZta+ykqL/dvMVkaycgXZeoHsJNWuARY+3x/G2sCWKmhcKi+imEwxe6FY7L5s
         u/LPvX7njjhtUS7ASjJuwO41kuGusvFv8YogctktbLgCPMFIhwg4e572ZRHN2advaZVc
         cA+w==
X-Gm-Message-State: AOJu0YyO/tzfhOOvwNILAk2OHL3knxRznoYzSP8fbcCVxTv0JaTihVFn
	q3DTBKtmUtJUJBY8IQZhbvq0lgdRkNLcrJY65YKT+eV19u1uGB2iIs/RhFyrZVuGX/bf37B57yF
	xpv+dVIqZhsIkfS0R6sHMP/spVkiFwpO7JdQEQ6fuaxA4S4W2tYVW0L9KLkCvXpgwp+Lm
X-Gm-Gg: Acq92OE1czgWUM+e2thTMY7qw+2oIinI5BRnwsNIqG+aTTdT0YzhBtgCHQVaWUUunal
	HoU6Ct1Bo5F5L4wK1fpwPMYpJo+rny3sNWOhspnkls61h5hrir0pM4Y4Fe3X4SKjEe2UwqzSqxT
	tLoOC6LbSiXsbNigENNoEcP97sZwx3jEkUEl55Q4PRQb5nNuVfnAgxz7lI7vznzTDrFpphSLFwB
	QIWt11eXBCslQ2Y11cJsqBZuSHIPLZT5hVoRGmWNCaZtKvo9/TWLuaCMV9jn+y0UZ3Iw51cdM6d
	iEbb+gqocnBL8EnDb2ueE2yA9sB9vwvQWDY3MULYkUobRFg/+jr3qqrlhMiXNGCTAU/RG/cy3P9
	SIGY0CvtKMYGSsZJCFoFG7FdvJeMb+j5EqFUjG1QIwKtRpQ==
X-Received: by 2002:ac8:5acf:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-516d4433f1emr30597131cf.2.1779450040104;
        Fri, 22 May 2026 04:40:40 -0700 (PDT)
X-Received: by 2002:ac8:5acf:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-516d4433f1emr30596801cf.2.1779450039590;
        Fri, 22 May 2026 04:40:39 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ece294sm44994866b.35.2026.05.22.04.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:40:38 -0700 (PDT)
Message-ID: <e8b8834c-3bb2-40fa-9508-53381839d417@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] drm/msm/dp: Add sink_count to debug logs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-8-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-8-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1040bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Vx9tJy4mw0iOory6Zd8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: rUeAcrfeXz_465rCMdSprlgoNkbZZ7f0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNiBTYWx0ZWRfX5KOmKtD3TdOF
 xHq8Q4YbWZYlfqHRk5n1fqyK4bm9yBkvQ7EjwtTIxQnfmosLU3EkzMyKrIPbsiS/hy5vPB7IGnA
 bp5EVPStE0ajRXp9XQwyIYo+3Qpt43/DB9BAIJvS9TrBXLj/Ja2j3CaDR6oTC0OuGvmM1jvsFYi
 mC0t3aCJBsEl0dZ4RKXdTgfsMt+wyUBZH8Wx7Vt6vWw5vVsXsYt1xOho/8jcpaBtK3L76CyliKY
 EZ3Cp2i13nHjYZyXA5KKnEX6LTquoh2orSAJS/mQ7KkT9ElxnJCQblWts1qyzOLlmaQwrVEKjov
 s/ccJP1V6I9Ar2jzVLd3Jh+WmS7nQzn2srEXOi7iWAk/o9Xwbl0y4hOU9tiNAxLVa5eXS61fQRi
 X/LZVZUx1RHovBdJz9YYVpFg5TRyWWrBpMzVQjBLCdo0dLEhGJhZmrl2DibAu2SI7X14qtQLM/J
 kbA+wUHq0D+WzNC9JaA==
X-Proofpoint-ORIG-GUID: rUeAcrfeXz_465rCMdSprlgoNkbZZ7f0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109282-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 762565B3460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Add sink count to the debug logs for [un]plug and HPD IRQ handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> [DB: dropped link_ready handling]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d61a8ddd30a8..b4deeea0ec59 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -388,8 +388,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  	int ret;
>  	struct platform_device *pdev = dp->msm_dp_display.pdev;
>  
> -	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",

dp->link->sink_count is an u8 (perhaps over-eagerly? 'int' seems to
be fine for "amount of things") and the struct gets padded anyway as
of right now

Konrad

