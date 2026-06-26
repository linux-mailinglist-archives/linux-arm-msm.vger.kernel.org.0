Return-Path: <linux-arm-msm+bounces-114711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRDJN4CxPmpsKQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 19:06:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E76CF566
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 19:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PfGGy3dD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BD53020855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700FB37E31E;
	Fri, 26 Jun 2026 17:06:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1A3FF1A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 17:06:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493564; cv=none; b=JhEtzJSytkAU8G5v7O8/6bIbBgH9zo+TYbF0/Kmz2ASEE+FpTfgKVwV/b1IsM58E1mPUn+11iGXJ6Y0wBZLJd54x2HK2n1Fe4k82xBMHGRzum8l6ohW1d/BqH3DPiuGYQKmkwgjKl86+asVPbTT4k3ir4GZhXM2PiSBg/RxkiB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493564; c=relaxed/simple;
	bh=GQKFAfjK37kURb8eXgj/bP3eu1MfUrZ2X80i3UfUWBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2y1jZT6v8sta7bvJeMfIjhkk+jNtV9jgPNLgXIKqs88ApRCVEPJuSRe79hQTusrGBcpU4nvHTKVAoR8g38kygzgOL0VuevjfqMIQrWr7DCp2n+477jv/sPw0CeHOCI2EZykM3qa6uSIa47C596tsQI3MwXSwPtvxdM3vZD6hRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfGGy3dD; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so13851495e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493559; x=1783098359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=PfGGy3dDJntvUAhwdN74MoQyZ7Kb76WVRvfiYiz1r1uk3V/wjmc0ccylG8JVhL0+aO
         9WSY+r+SENhfxJL8CUeOB1pmR59D9qbmsIm0QL0geqEQ3IJNFp5Fq7qrY/5fyGWdsqG0
         nIyYMLaVYge3kigQjmdxvMGDVbUqMNI+4R/I6uQ1sMOrczr5lwCRWg+mi2S0BVuQYDKL
         dDgqcqfyH8rsZo98a4Dkff0WHyw9Af1jwt2qhjUEWTtw3ws3bdrW5rBD3IoBPhrQQzZE
         8/ce3DSxR7gM6HlnWvwnjDorWuEU3FMzRK5nbfmPEGSUPopV0SrDeRoc0yqUq7qQ+8gO
         PhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493559; x=1783098359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=Ip/fkhZH4Qjqbkq6oeefaZr6hFbXRGQzR7GjofDe/9tYyRdb3Gith18qAsISWpkEkU
         q58qNwiswwrjR+HgC81SdV1hPU8vZb/mKb4AAv/yL1IdlNl6sLp//zCSJXcJNh8fCIsG
         A8yUibkaKvDaefjPUILa7cfcxqeXHyyOtOvfMltIgeBnxeLGJb21gkoupLyv7brecbMd
         MA+evYKfWq0nuKW5lLEW04G2YrfsX0e7RxJxGmo+sqeYf6hdF0FxInOE9F7aQoWhaNMJ
         mK8xPRA348k6DY8gqgeH86Hy3Eaj/8Egm4mcrti1hATIybR/w7nCm79+XtUl5vdolnbi
         9QTg==
X-Gm-Message-State: AOJu0Yz1dsiuHnGjBBBmzx/Lw9JduQwkrqI6xk4k5IrQ6neHmfxcsDnW
	ybuaCz9mPBvGwZUGYZVs5olBipVlqujrYhc9Qil8bMDD5l5G5hnXNuAA
X-Gm-Gg: AfdE7cklM4FN7udI4yKOo8Mrf48s66c2XPoqTGCe6Tvzh7IWa0eBGrwnqn9NYqtDLIc
	7Cjp+tYS6NAV9uG4WWHvw3J81r9RZ9EbbmD/Q30oTpaskragCbPjClydyR5akmW78l+2tPIdQF6
	ysE0/SPmQMd2+hARv2q3eK2hsFMO1A0v5kUBMYRfqnZKVoua/Uw3J5WHX+qUiCeS08b0wLqZdtb
	aUKhozf6ybPXb1vItnx0dwGCRAoU6fJVMvgxBq0BJuiGO8KnxdgjAT6+SAM4uWBMln5qOzoEoHh
	hUcVg3NPwwN9/23xm+ymYPdFKQswVfdzOmBUWagSXVizK0ATnVQjUHZFhcX1MVWWnzRDFPzS0eL
	VLiMJllFoFK5PPY62xVDSuw0xjoYnNHRrRWKDlB1BI9tYLjFoSqyW8gkFGMpd3hKMw7rUfyw04m
	jqUID8KmpJKXa+QzsWleyUeZ5wG+tRjWSTipFODawAmfdKbPTXkuXtPGItRV5+8Gcyv/8VzB9NK
	eGzhb9h
X-Received: by 2002:a05:600d:864a:20b0:492:5bf9:d149 with SMTP id 5b1f17b1804b1-4925bf9d18amr186215685e9.5.1782493559068;
        Fri, 26 Jun 2026 10:05:59 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm1694876f8f.7.2026.06.26.10.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 10:05:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ac8c92cb-21f2-4274-8fe6-f771fe48eec7@gmail.com>
Date: Fri, 26 Jun 2026 18:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, bod@kernel.org,
 mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 515E76CF566

Hi Sumit,

On 6/26/26 14:34, Sumit Garg wrote:

>  config QCOM_SCM
> +	tristate "Qualcomm PAS SCM interface driver"
> +	select QCOM_PAS
>  	select QCOM_TZMEM
> -	tristate
I think QCOM_SCM is missing a 'select IRQ_DOMAIN'. Right now I get a
build error without it:

drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
  drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
of function ‘irq_create_fwspec_mapping’; did you mean
‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
   2512 |         return irq_create_fwspec_mapping(&fwspec);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~
        |                irq_create_of_mapping

- Julian Braha

