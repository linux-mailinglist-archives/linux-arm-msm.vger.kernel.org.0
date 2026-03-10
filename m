Return-Path: <linux-arm-msm+bounces-96404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PlrNkNgr2kDWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:05:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A932242D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54A9E30000AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525024C97;
	Tue, 10 Mar 2026 00:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr9LnGwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEKyPCga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C03C465
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101120; cv=none; b=NfgIY2b+MuOUyoP8TR6XR4HnS+bpLijst8ddaUbEGBDyDcFUZHhThWrSODr/eHgjMmwPXwkXOcQesUnUIGPOO1mDxoARH01x7dx0otDkRECm0+mvoxo2LaG9mfhGIVIiaMfywF9LqePMjBZFXnjaCXhZSiZf48c7lATyRo3Sldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101120; c=relaxed/simple;
	bh=paV0mySP+9zV+Seo8jQCZrnwwyWiH+HvD8a4nb7UkmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqj8L8dqORsSiAMhl/+z1HqoJ2A8bOB4gLoqkJ0JV4k0efkggx/E/rRdx8s9CDc4PVwZ0wdKQ7BnT/co+KKcQ8/goZu23XO1v8lqR7CkXVFFBq+JhOsuKE66/x3v0DpQsIpLJYU+wAYIfA01A/jVhSUEYIE/cDtIRPoSsLasHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr9LnGwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEKyPCga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCExm1212197
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eq3YR8SJMJVvMJ+9JHxKSwsU
	I6gefV1Keb8jWt7Lh3M=; b=Vr9LnGwXIh56NKbRnXZ9oGqugFUK4IhcHRzvq3a5
	Un6ZQ8s8T1noY+p3OJ7nIlI/pFkfv3cYoEM4U7/xltLCa4Z/F2sl289yNUEOLOBa
	Z3BMufsHHwruxHaeqjTrfm6GUyvtFJbg8+zVVlRX1F67+pZN2/f57ytt82EYhETZ
	OewgGpdBKuqvpKxd0OIc6KSPJV+25un2J5yp3XmPiFYJMQ+y92q1SsXDbwt6Jmi2
	8hHVAJIACjd7Y1J5B9g55NXaSqTp8r6jKNbRIKYDA86kvmEp8GZBpLP2wJWX4hO2
	SEac3DT7Y/5jRBWsKq2SbbWyH2StPJI5fzOoVYyq7M6BDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so1426326885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101117; x=1773705917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=IEKyPCgahhLNOYwIRYrp6obtaYlFz9T3SDLUehQJBGltxV095bNZzBrpP/jVL5ZTAS
         jgmt5F9xIt/VIYW57QEpxQvcdLV8iDPxWvgVcR6+oAmzQufz2o6MNlitWqPSrntIwwRH
         M2uKN4sUgSRb500FzpOkCuWpTMAf1WklX82PUux7xfWB99V6MvBXCMdOG4O72O+FI45h
         YcDp89HL7I1prjUa3YcDol83vDUJZWv/WmiaQWYKCyc4SNbhMlQ7xSF383vcZCBIa8E1
         SX6bCEKXgfEug8R/wcIawJAHb95wBG04DGpkJYHN0ICvpe7muCVgn55tZUYbSKy0fXt+
         NvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101117; x=1773705917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=qJbd0bNV2FCudePOm2olTnTDO9SYVnZ1bj3VlD/eXPM+C7VzwMC6u4oFMmGovxh6qP
         Gs5QNbgiBk6A7gR+VuQcP/CkP12pCHnl7zKl25vfgiP+7AGETO1tU0V+BvYSM15u5SXj
         0NQjLEGmMWak4wZEEYTgbbPR5ERQ3djkNQZPdvVMuiF1BKCa/jeTPVOPzJp9DZm2t2U/
         mOg0T/uwpN0YA56gnb5UwSWyMBICDj8IJWbiOUMmMEn6LY07qv/yAM/BveUk+p1/qaJG
         nmgaTVZ9/7R4I8Luna3sNicevPoRTHng/BZxLAUhPYhNDkRIqK8NiD2koTxN0+f5mhzC
         N+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwD/JFzGuFtuwYCybUAeeBn7AgLNQXlPUuD6mAabx2jVZqCY/fyA2JbMyvqZUg6Vuq/2TUq5wyUquOV/ia@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOU4oHiWOLWHlV6msnhC0xYvfxwzLjmQFqOKUVgBZ7WT7Yzrm
	G5HxYVDfPEdswAaQfbcUz05zCBuHiQCvVr5m3P8sFY7Sxo7dXwJkmPs5O8Bcsc3vxAVj/kHsmsV
	CA8+F0BuL//h78yE/vtgPQxyEy/dXTawwkcFjC1x4aexTiD1ss49mD5RE/D6Akki71Ozd
X-Gm-Gg: ATEYQzww4bJyumhSWDoH6F9HoLYyhoXhmsUYKTPgAOn5yK5gwXXwu6dhzZVx43ptm3j
	zyGBb//KkzzfjI62Lmqyy1HT1LoV39CldjrIduDdepIqvDsxnYx5Tmxk1XTChqt+dnw7ygqQWTo
	6HS10OmoZM2l8HJCLPUSABPt+Cj+fYcUQI5rulfdTmbaQtUkL39aa5fQfOyHppakTuvKq6eR1rR
	C1YfYGpjC+VoQimAfW8NhQUS4+RMrUoEkS8vCN9EwOGVr3A4yZHPawNOhLxJ9a4DLMjOINmzpUq
	SxFEsTWvdJmY68YBUhTTZJod4uPIpa+udHXUq0s18YIAepPjSnL0shMIn2RkcWT0Vkj9NQUn1Eg
	I2RmmdkJA+ruDufH/dkzsj7bqFls+Lt9KF0jqgS0i3Gq56+XyuBVKpFvYOPbyuXvxpJcUJuQ/aE
	ND+lI8ZCiQA2EmXS++qhBp82rtLV5/qzmGVMM=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601783785a.39.1773101117003;
        Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601779485a.39.1773101116549;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf6fsm2324914e87.11.2026.03.09.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6mm6z62o6xlso7mxyelx5zho5iowh5zfa4tlbfsexrb6vohzjl@citw4jcjsgsn>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af603d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=n3fwWfvLsPu2TWPVUDwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ka_q8oN__dij08005zLRWyKERbWxeK0Q
X-Proofpoint-GUID: ka_q8oN__dij08005zLRWyKERbWxeK0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4v8KiH5iWMdT
 hbrjDk1hgRAcCI40dX6/h8/VlC8SxfDMm9CBSLd1UJCq7UqhjdQnEpWTCaAjrE6B1UgZV5ec4N5
 zSkhsUeyUYD48mCi6pft3IXmJCt35g4XMpjrdU1A9e4PmFFGfyOXFDKmB/YqsP8FvgxlaW7zbv5
 BVGJKMp+pa0LxAEmPEMEFC3indTy1rSv3YR7NcVlUEVWXwp7hOG+m56EA8E7ErLuAf/UMPtd0YT
 8u1D9Srfd2kPLAN4Z4po+qQ/ta/r2Iv9KjmpGwLejCHT05GbSc7bvv8N8A25KhcI72BIGnyxp5j
 LQlpg/DwFwix+a2D3USMz9NVO9qhuGGkpFmJ6ApWpbpDwQ5n9wl6BtEGC+l7zd5/JCibV8y78mK
 +Ej6IDvBKuH95oz+OHQDhMG/A0UuVvx+vlxAHOZmzY/fBd2sWDIqprtzUhtYQCcL2qUJMykHWcC
 PF3dhzFwLQSROGtYzIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 5A932242D26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96404-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:32AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
>  6 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

