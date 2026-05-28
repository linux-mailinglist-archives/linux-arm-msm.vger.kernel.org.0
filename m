Return-Path: <linux-arm-msm+bounces-110140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIueGnlhGGpEjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:38:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3645F485C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0989322EA84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799C82FF675;
	Thu, 28 May 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS8eTRpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYUHQDDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AB23394E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981581; cv=none; b=iw5EdaYTXgjy2ekQaJFnR2mI/Osw8GUiqFdJkJ+pbuR37+Qkz+whVCtubIdx0ppXwJYxCYczRaxTK/VNTWj+k7Y7wHWsqpQvvw+k3/abGveJz2XO7Ah0YyFvRu7GP3AoIVTTvK1KYcJLNygD3QE+UkagnO9oGoPIof7KRUBXW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981581; c=relaxed/simple;
	bh=/fT34lM2TYG9fFXPUTc+RaBOCWiAvfwNOPj6LB6qHss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KF/AMTDHjlW76bbPnvLXOi+Ku+dqc68ZFjcF9aqQpEn4Ab7wyzAVYxU1TRZ2kcMgkwY5YV7MiJWvf6wZVyz4pZ37hokkZcHWXyvikwSDSeu30dftIZkYt1++66yidBQ98pTT0fDuebM/Zyq0KUieLfm8iLA4ddHmPWY1WnYZ/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS8eTRpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYUHQDDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbqK1697234
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vCxScaH7vVBydHnsplFqoTaQ
	mq8QgCG9GksIv/PZHWA=; b=TS8eTRpxleVe9AmxfNH6/Jns/ap2yeNhPGqCI5Yq
	McTrDt4+5oDezgWbnMEv9Z+lUCdahnAyOSa33yCyfinAvYSmGY8bhQ9lRke8BrVI
	4c/I11P5amjBeIVjfwIDRni3Lq9aUlS6KW3jpKvAju/eEt378ITUNWYl3q2ShFHr
	A49xSoZHe7gfKCT2800UB/sJJliCUZCDNgmbuTJZPUeF+RIpO4PXAYbzgP1AjBG5
	yRXdI9qV3bHSSrHM89htJZEJLKE/B6uVD4cwLZrZJcEHmQ30cqPu89aw0wKGCZL5
	lQuay9BPSoa+vKEhR+wa2H1pLsNWLNexweL41C4n228bPw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yakavg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:19:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f73835016so9458064e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779981579; x=1780586379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCxScaH7vVBydHnsplFqoTaQmq8QgCG9GksIv/PZHWA=;
        b=RYUHQDDg/HlfqNjArTv8nDKZX0RRvqFlwQWukIUNSaZ3dMiwI5sCiZEWmr0JtsCsYn
         HwhqkqcaMWn7TYiSBPYr5QfpDCjFPxkLMAvVuSTSYZvW0sxXpHeJdOnFRHjQnlVSyuZ2
         cUfxioMjHBAdwxIyDz8yEppQGqDgeW/N9UuTpJznq/d0iJGp+ZabaFOOGeToyQemoMEt
         4bSxGfJrQXYrCSMcX3SuFkgV7bLIWMtHJef4UJo/xdmtnHZSxHVwdZCIeGGv0S4c8rJn
         zoCNdwaF8x0ZW+RAiBcXVx/FgpOX4jgraifvlxVOuuvcn2Dp20pnwPpp2ZShPbreBt/+
         UgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981579; x=1780586379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCxScaH7vVBydHnsplFqoTaQmq8QgCG9GksIv/PZHWA=;
        b=BrUB3hNIevQ3jWXVNOr0Vrs8rTjTt0gE0c9do/ZE9wGrR+BJOO7Qzt6ddYuJGzjZHd
         rGhdJofx2uTTMYm8UN8iXAd3mqCACVNtdm5kyfUD8rMJxuc5mI6hPP0UAofYfNqHuB+A
         vH1+jRSqWjxDbD5MjBbJ2nq9QOXQCXXU1oek7j+k7mtoHPnQYY1BwqF1l91EWUZR8fe+
         t0wAvzyymlcQrgnZTdiUXLSelJRm9bTu6MwwheY0atB5t4lcYqfx83WbaF1whYTqEeoq
         diGs2Tx+8wayzj4NeF+iwBeX88nFH84BnEp5VtlrCR2vJTCeDbsFNZtBd0EiTvkaETqy
         VCCg==
X-Forwarded-Encrypted: i=1; AFNElJ9PwjVCwOclVPl8NOaw+/xlwkiofm21Awr3DtaCLDQnZ+WXzSwDSIiI2aMJGTdibuSgG/ae3LyK+dpWZG8e@vger.kernel.org
X-Gm-Message-State: AOJu0YyEE/635+lgGsK770rN/J8UZhL1fjRr0KJJifvHjOns1AgVMjHQ
	t0ZRpp5vTShgBH+py9eZPT4xNxaIJ5xgnKF4AzF2CkR3h9E4F670y3vaLYeuNDiPBThqUx95yZ1
	jzKNAB4YhLHBlpLb7sax6dKQSd9X7Sh18OOLB4uYoLEZOa9XSg+sh2ogJ0V/Qu1yVFiRy
X-Gm-Gg: Acq92OGfKJJf8+Ci2rDNiNkKGirPLcq7LJIbeogKFdMYJpxNKwOMJu3TDViGG+Ed5oN
	v3dsoLR9i0Tgw2F9UzzJeSdx6tw0BFU0IKrbs90ip04Rra+lOisKpAX2t4Rv4Td8mfHpWuQUmd0
	jgI5YX6wulJBtHB/WE61lWNfzZy1C6BpWPMKq+QVTliKegrSOThrM5FnFYY9/Rubhf7zjg5NPrK
	JMCFQeKjttJ4bY4acsIDAwlpQBRLSK7r3bExfx2zIhdug/FlOvTlPaSeNqV7ng9b//7k/HmXL09
	3/0hPywasGYzwLs5PouWqlPae1aqqxkKZWdDohNMhL/rt/CtU1fNNjODtHIk8wFuza9lW3r4BpJ
	BNZBwjxdKTq41NyqxPzMNTD2yAb56WqFutL7B+o5b8iSxFCCgcBLVGC3dLLTROPQJc1Ll/xwAjS
	1pTnC4YcZsGz7iRU9doiDTioprosaJ9XkXxkT+280eWURNxg==
X-Received: by 2002:a05:6122:208c:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-58664039eabmr14844417e0c.13.1779981579086;
        Thu, 28 May 2026 08:19:39 -0700 (PDT)
X-Received: by 2002:a05:6122:208c:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-58664039eabmr14844370e0c.13.1779981578688;
        Thu, 28 May 2026 08:19:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa509fcf46sm528548e87.58.2026.05.28.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:19:37 -0700 (PDT)
Date: Thu, 28 May 2026 18:19:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/15] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <xuxabbaabm64mm5vpfbcdg4m2qhqecbnrubpruw5mlp6bwtgeu@nqyynv6uzlau>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-1-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-dp_mstclean-v5-1-a9221c1f1f3b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: F_68BCBLv6KaWtTXGSrFAoX-I9NSQ4iE
X-Proofpoint-GUID: F_68BCBLv6KaWtTXGSrFAoX-I9NSQ4iE
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a185d0c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8NV6GxjMThyPRtXr1SQA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1NCBTYWx0ZWRfX/v8Rxx09qu0Y
 k1xoPfK+FTO7I4MyZZtwkuCMaU5J58c4Pa6L+OiS3ZSAMtkUtRlzZC07zJMILm/kXydtsGFmTBK
 WpSvlH6SBlQcwBRVlakDsclBy8zD3ff31nvDmfIxQUx850/8NOiWfwxJOD6iEUQ7hF5yiTBU68k
 1GOU+4MeZMCoqCZ2FzPBxulYphigJGUV1A1ik2U8MmXvU3rM70QWYNtpsEvlLQS/VGAFlmYj2as
 BfIPPNYR1Ef//kTEpRlu44jY3gG+7vADT2mafv2tlvk2yx9XfxB2k+PY/cnmM0Ll1dO5BpTWqNt
 AODO2qbtoriBDa31Ci7aXMgW6IEnpnuTCFZbD7ePKdBb9VgLflyFVrLT4kT9yUdSauKWrbJNTWQ
 PBpUjVj1rLPSvQqs/LV8Kp24OoQOl53Tv9QI1WuipLySrNLGzcj1iFveDRS4313AuvNGEKjePvb
 uCBOZam3OIOZxmTJ0AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110140-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC3645F485C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:40:22PM +0800, Yongxing Mou wrote:
> The cached drm_edid seems unnecessary here. Use the drm_edid pointer
> directly in the plug stage instead of caching it. Remove the cached
> drm_edid and the corresponding oneliner to simplify the code.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
>  3 files changed, 27 insertions(+), 71 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

