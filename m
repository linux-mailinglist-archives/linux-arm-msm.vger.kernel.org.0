Return-Path: <linux-arm-msm+bounces-96165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HXbNR2PrmnVGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:13:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85202235F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 708BA3010D91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BA3377EB4;
	Mon,  9 Mar 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHru3esd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/+mXK6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AC377541
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047534; cv=none; b=M+PPANw4s0DVqXxno9UfZDkyRfskNDLbX6USUwjo+sBBpFFlwf9rr8HTyQc2Sh7c7qJgdUKR6hpA2w7IGsrJRyZGoTqlqJwL4gJzXQjB6scW2Q8/gqoUk6PundUDOVvmBaU8ZPtaiDIbliTazRMH3NbQ3N09L+BWoW3Hv1ENUhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047534; c=relaxed/simple;
	bh=Q2J+r2dSfTS2w9RcAxTqCjJw6if9TEPXLD0Hi1LfNcA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpU3BadAXDGyFYB39kl0qWSpxjBi2uvgHkJG0LgH7RXNcss6q1+aTHAUT+3MwCkKAKAgkJUxfJ//EXfOMbM+qJFGHZnzPKBuPmnvZpzho9xmT2Ita8HcHCyRokEU8p/9QcK09qKPwXYcFmH/IAmYcxSKTuGS6UEL/a3M+SU7QD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHru3esd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/+mXK6b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295jTcT1576968
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbMtvtdOfLDdatvp+5lzCch6
	oMIueR07h2NcUioWpFw=; b=jHru3esdNzuncTNwyW211a+aJdCkYiYxILsoZN+3
	1GwgTcHiMn/ymHOV08WINAfoWlfYw32mmtmF+Seo9nDBKL/8faTBqtOibVjY8T1b
	dgaY0uA7GYpKzy2BlixGrj6mN62goEwdjRuKoxo3BmtDppXIOIRCT3W6eZFhNujG
	NUVHihFT8lC0N4D4b9D4sUu9vqiYV7661k24lzZtWboU4mtxwP07+llelKSKDhOL
	XCCcln8fcMYU0Dbq9i5aXPPkIr1kAbbwT4ojrN+2XxrTTpUirMmL8EjgT/DODPGl
	DyxQTsHS6r2QOpA4ooTD4DOGq2QorD2Gt3YNLkNIxsnfsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qew26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:12:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80bea54dso715452385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047531; x=1773652331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=G/+mXK6b4p/ttPLc96rKIpLQx0rVatRsBeSzjF6/+gelzgZLV8+rTlRRrKkr1lDudb
         x0XHory0GhLkH1EV4a5PpiAhY/TRwdi7lNPcuiJaJ+eroKu8I+pq8tKeZgoO9rnO8mAj
         3GPZSRLFlKEjh4bUiOLnU4Ym4fqojvyKGzTYir5jZPGDnijSdwEZ2I//IX31gXkKEP1s
         foFFG9rGEYwaClVPqGjcfc2PF6ChTLabjzpl33wxEpXkGgIb9BiIr8BItfX961bdKraS
         oWN7XpKgf9b1/RiiDTdP5u2dcwofel7MwuTc+xl6KxLC9uT0LhYultFFB/xZ4sey9DTv
         tyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047531; x=1773652331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=I/8ErVQuIjpzTJ6msUbELyCIjDmWkiyvDFjuDGpgmNRcpyiTQ9gHUyXs9/FqXBI8As
         cY9YR6OyGptyf9OoW8j7JcgS36DPGeeE7j5kh0ydKiNadCnam2OJ5D60nEO5tOeN68F3
         XhzcB9sXb8ITUGHgKInZzVzE1MBpfGEQXbZ4UrsbPCC41OIuB/8R3TZyy7rM57s4zTK7
         mhcJ+wjbUHZn87+oXoyvMcRyDYMANMjqflnhcD3OyB/Ctfhqb2ssGXddQYeAQXp/YEMk
         +nS2q8BoCCMQcSJlRKnfa3iipM+Yst/cBQHvQp9obh2LclDvA+NeuAQIxiELVtGIKP2r
         WfZw==
X-Gm-Message-State: AOJu0YxPQJyiN3hKaFw3T1nsugojiFirbHOrVuXIoCKdgX8T/6CrhzXj
	pG/4vrwfMKTZ4S51ZaLfbsOvcspVLE8beBfwy5dtiOvK8vWRo30TrkL/QztT1X1Ho3hHPZ/boKg
	PGv1/YmXqovUxugvlEBX4TN6Oc8/5IqeVCA6d9STiOdArEXu/nCDclrFu5UqtfpsTEB9D
X-Gm-Gg: ATEYQzwn7YKDFLsrkWr12PR4urc0dvWB3K2jZCeLwD0mmtwSwRpjqkHuLWfzUXg7zoS
	o/soSOl8PMVCq9TwUXgu/Z4zKwm9+QOLk8GOeGU4gKY4G+hfJ+SLd6OUB5CpCUl5MvqoKtbmts9
	ts4UaaVhbXKmAV+85MKSiJikOQc//6DVjvMxPlBn7U+UeR7lMDm7U3HyuVuSVpq/i67HAwkezfF
	9AE32xWnbgwj/9GOYDpv1+XUxvoeiDKzbTIPEr/j2+vmlPO3pe/qAlESgEEjtURqtY+FERuG+3Z
	qqDuw0rECsTz9cDYRbOZnO8y+GxxU24f9/yMgUgRvAkd8STuQ3OZXYfbMnMmiPL6f+iqT3AKuj5
	Z33h3LWNdlq0hR+b6Ttj1hzf45HWNH3nF1+8yEn/nG2nQci2feJYvbg==
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304567985a.63.1773047530882;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304566385a.63.1773047530429;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
Received: from trex (110.red-81-38-138.dynamicip.rima-tde.net. [81.38.138.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm23179497f8f.34.2026.03.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:12:09 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 9 Mar 2026 10:12:06 +0100
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aa6O5tir4kVIe0eZ@trex>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-12-sumit.garg@kernel.org>
X-Proofpoint-ORIG-GUID: ltiLX3qcS8VWsvZL-hYRkyIXlMjCodYe
X-Proofpoint-GUID: ltiLX3qcS8VWsvZL-hYRkyIXlMjCodYe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NCBTYWx0ZWRfX9WZYkQcXoBke
 JU0mftmKKr+UsUGAC1KCjXzS2pfRL5nzL5lt9ORwY1tqL5SjU3uButSgbcSq2Qfz4WMGeJd9bB/
 9itm0AihQ5HmVAPktLIC7Gm/IS1MdQLmeARzBcg+88j4z+WmN00fA5qsnkT6bDk1IegcM+xOfoX
 NIJsrCRgFX2M7n+8t4g8TtRPQXtXtdyz3GMzrdToxZQzR8KkmRJ1aL53kwdIjtvKA6QrV02PXP0
 v550eDAlKwbH4kFzBTv2TZxelNVDn0TXz4qXQOMyxcaF2zaIqIOImhtdgh5QSgocu7sXBby5WcK
 Z80eZ/sjki2AUQLUOvQOrcqeErcQkKOZndrc21ZurpkgqQ/u8h0P22BiDDo5/WDGNU8uXyLMcp0
 B5AO+gPaYJfuH49lwBlhGAC9hLHjE9Ky8bhORbHrgEQFguVD3coItu4sDNmWdmHipB5W0R6jf7j
 YgYTOF/xikIBtrI9mpA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae8eec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=P2IcWdTxk7sEx2G8DnB30w==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zah51VvIpe4vvf6E17kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090084
X-Rspamd-Queue-Id: 85202235F6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96165-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorge.ramirez@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 06/03/26 16:20:24, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
>  drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  			return ret;
>  		}
>  	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  }
>

are the calls to set_remote_state required?
0 is not the IRIS/VENUS remote processor.

If it is legacy, maybe they can be phased out?


>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;

