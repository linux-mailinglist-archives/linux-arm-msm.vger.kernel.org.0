Return-Path: <linux-arm-msm+bounces-111693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSjYEm1kJmo1VwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:42:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B542D653345
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:42:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KO6nohuM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FsLKqSkQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 750353011C41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1873815DC;
	Mon,  8 Jun 2026 06:42:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6F352022
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:42:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900940; cv=none; b=iRsbu/TN2bXIDSlBmTuVLpWjJjEXTTw0jdXAKXKvg83xwF6RvcdZyx1yWU4cyE4QEMADWT2DdiLRLE9wfwYigcaKtcOtPAUcBVu4umvnVRz6vkP8mZyUWBoXD6jFY47LXeHsnhhZuGGLHf43H3KVq1NFcgwQ6nG2Yt5MpI9BmhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900940; c=relaxed/simple;
	bh=A5Zs1ogizxAhpuZ/trmQcJX9Rh254M96AyDn0jMdDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jldS1F72FiLr55w4SCZIXe8Abur1hENsiyUtmcuxH7phQunhVroE8fYfJvYNv8+4W1GpwF1myfSpcLHnYxEAoaYASPHwnTC9qRChG64y+Apmbv7vOQf4DP7x+SCYAin/0rtLpPtVvYKE4ut1cbJn/7B0SQ+1xfZUvPXZPZ/QemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6nohuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsLKqSkQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qp1P2771073
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iquniSPNZtWC2hiZCbPcPL4D
	J9n6N2TQEoWmqpuRfiw=; b=KO6nohuMn64MoIRDHrljsFj9mIpg2InS/pI/yYaD
	4V5x4v4vGnBcq5YliGAOR0dqG8L/d7hyxxlb+oOZ3v0SuISDesFCv8PyfyseSB+R
	zpJcIDeZNsyBo5eQkS9pH2PfYeUeO4xMgqHBJ1f8j4SgAB+MBT9nAGlc8buwQMHs
	s+rC/1tOK24iwnRKEdO9lxHziNKHjUBFxG2fQZS+5qSwAQ3+DzvLfBlGQNrp4O8c
	n3PSllOEskWsRkV6WNjGhN3lh9Ql8mp9YESMLpqvYxQe7FOmiZ3ZWgvjHREu4j3N
	wF5ZEiHC0bhs8Yph7LSHb44hCx11TAV9uLkaqEFOdngdfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6e80k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:42:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfe512e871so1836602137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900937; x=1781505737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iquniSPNZtWC2hiZCbPcPL4DJ9n6N2TQEoWmqpuRfiw=;
        b=FsLKqSkQtCsoFvdtPZ89NQ95gjjgsFN4pYGqoWlASBFKY+TTKDPZFVH+8j8CrwcA6u
         W1BuwiBxq/NKtuRuEHROsmmfnEzdidVLJQlAP7WKI1CDw+Xlh/Gtd4Uby/XVyhuRVwZX
         3SkrUSp8WWyk9K12+ZjMFmt/q/btv68h0+bN6N+y2M9yHl3c/1VmJCgcNZpSgGuPpSns
         tyPH0temuLM62LrPLtZfh3EQTdNUN0leiGvnFfheUZRgHulgxPqzCGPRANBx6OyN7ltp
         /zRUYZ99+U4LKqDDJ4aYYxuwJke5MkE8qzfFTaFS98SW9b+xlo0Sdf7zZ+yRivNMZ4/V
         e9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900937; x=1781505737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iquniSPNZtWC2hiZCbPcPL4DJ9n6N2TQEoWmqpuRfiw=;
        b=JZTD5Jj4aR6xGAue8Qq9kutVhkli8M9re2wbjNIG/DQpZF0ruRbvjtJvyriMkvWm+G
         fdypTZhvpTpcdC4FZI6rHIPjQ74EQTBNUzAaempbR04UpfJVY/uM14Qy2OCo3OvZKeb/
         4AvUYyRBqrRT0nErm+k6z3VnBwK9I41M8/M0wI3bJV/FGE3SHDOt8+39Mtb7IYf9AUSG
         +XtMSFPEcx/t3eLR1gtSEXrocyMLXUyQY0EKIgvWoDmdCpGzbDDGkCzfs5DlKufkUnwx
         ZhResU5krkLgpbjlt5/Nl/5QmEDUdGU6xfym+UaMr0JdCaFlieRQrMg1QBzsqsglK+iO
         jaqA==
X-Forwarded-Encrypted: i=1; AFNElJ+d8YrWCsT2lrhQxTli3VME5w+08n9U2vQx8UtCu2TuuAcE4pviCvIwgmOD5sap3o+T6XBEr7DTYceCSVVs@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYxfKHODefi++Vh16/gIZoTun0XVb05xmTGD/qVd5anIvAUcC
	8ckgaOJYYWrQX1qHKisxt81Dk3TFlckvWaQj0heXx3CkvuM2oIbCxBGG6vm8mmqTCsLYB6JJ96z
	elFgQIKfzOTClWpphH0BKCH331JH2AK6BYUQc/SKtXMB+wXXW+roWSwviLXdt5IIHadMw
X-Gm-Gg: Acq92OGM2Vqkf62Diu1+MBAhMZWaTL5BBEBjL1c8rD0McmcEzgky6ARV3MtZyJyC2YQ
	tR3MuAG0g75aaPeUHFNmSjqSq2rxl2P3DfqgQUNfF17PzO7gTuf5j+6tEzi24U8QUEal+aQAI+n
	9QT9IB46hn7OUMrP8QSASm9UiifDIJ276IUrE9VawjXB0IsKYGiVvlbxi6dSYDBaq6K/rpvCQL/
	ZwYllj0FUvf+XoJKGRrGZ5rR+sdP/SjR46F1aCajimRrVVMmW2hhoL0wzsL2MrNT1Ek1xhjr5Cy
	+iW8A8NZk8dSshpbgfXZ1ykOd85H3bfYPX6/mzBa3rTqfEQUOOasqQyoDZVF3v+EMF3Vn2aRFpH
	1I/S4kpdYClefRXkSk5Y+qVIX0vaEoJX6frkiKNR2IkYtBvoebt/aJNhHmqxaNeFANKM1YVLZ9G
	ca2vwSNDj2QWW1QOgkRspA3Sn4XDxAiv7DjkedjIP67CsvwQ==
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr5713307137.4.1780900937232;
        Sun, 07 Jun 2026 23:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr5713293137.4.1780900936750;
        Sun, 07 Jun 2026 23:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm3663965e87.84.2026.06.07.23.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:42:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:42:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: gdsc: propagate gdsc_check_status()
 errors from gdsc_poll_status
Message-ID: <tdjlnmk75xxv5wy7o26737q3hsebgsqcnpgcb5xh6etetnjj6t@5l5tx7uuhvkc>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-2-github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a266449 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=xGn8PRncGggd5_oAslMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OSBTYWx0ZWRfX5NNLtONY6G07
 lC2UYzR8CqVW+xphqgtdiAsPnVQTFCpW3mdL907aIJdb7vtE0CeWW4JlAPm/35n3ign08Eu9Si8
 PJdiYOK0MJVJ9bLtj4W+k8rXPVW34zKa/Xgxo1dEJz0xBKL5AzEx51pVS8ozMwVdAt/sN22LADt
 jKko/cKc5sOstxi3ENyx7k2IqJvpCDaXpjTrfxLgLIzxQzGD4lxcIKyWxVRbHZpSKYdGMW2x7Tt
 tlXBg1ZHl25zap7snfQjZ35p7Y3//2hfdEjjYlI7tcqITYAmDedAKdbKAWxg5xDHE1h6noIi1Px
 bEQl7uAjfxvauosH+V1JPHdlnouGYMDekwVDw20mm934Sb19NfTd8EoHL++eORyoBunkqqOy5Nx
 Urbwqrp3N8HoYFSYIpsfE8jG6jlKQHudEDrSllLughYkwlz+oIziBVe5iN2L4cfO0ZDDVe3ruXW
 fZ1Y3eVB/lMcFa0pd9Q==
X-Proofpoint-GUID: nzees5_9OTX-CJZ7Lhk7y-iEqWbxpLMl
X-Proofpoint-ORIG-GUID: nzees5_9OTX-CJZ7Lhk7y-iEqWbxpLMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:email,5l5tx7uuhvkc:mid];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B542D653345

On Tue, Jun 02, 2026 at 04:09:32PM +0200, Herman van Hazendonk wrote:
> gdsc_check_status() returns negative errno when the underlying
> regmap_read() fails -- e.g. when a parent regmap dies during system
> suspend, a CSR is removed by an HW debug tool, or the bus controller
> goes into protection.

Well... For MMIO bus this is mostly theoretical...

> gdsc_poll_status() treats the result as a plain
> boolean ("is the GDSC in the requested state?"), so any negative error
> return is truncated to "true" and the poll exits with success even
> though the rail's real state is unknown:
> 
> 	do {
> 		if (gdsc_check_status(sc, status))
> 			return 0;
> 	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
> 
> 	if (gdsc_check_status(sc, status))
> 		return 0;
> 
> 	return -ETIMEDOUT;
> 
> This silently misleads gdsc_toggle_logic() (which writes/un-writes
> SW_COLLAPSE on the strength of the poll succeeding) and the gdsc_init()
> sync path (which assumes the readback represents real silicon state).
> 
> Latch the return value, propagate negative errno immediately, and only
> treat a strictly-positive value as "reached the target state". Make the
> same change in the post-timeout final check so a regmap that comes back
> after the deadline does not silently degrade to -ETIMEDOUT.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Fixes: 77b1067a19b4 ("clk: qcom: gdsc: Add support for gdscs with gds hw controller")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
>  drivers/clk/qcom/gdsc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 95aa07120245..b9b47f584f6d 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -103,14 +103,21 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>  static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  {
>  	ktime_t start;
> +	int ret;
>  
>  	start = ktime_get();
>  	do {
> -		if (gdsc_check_status(sc, status))
> +		ret = gdsc_check_status(sc, status);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
>  			return 0;
>  	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
>  
> -	if (gdsc_check_status(sc, status))
> +	ret = gdsc_check_status(sc, status);
> +	if (ret < 0)
> +		return ret;
> +	if (ret)
>  		return 0;
>  
>  	return -ETIMEDOUT;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

