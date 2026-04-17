Return-Path: <linux-arm-msm+bounces-103571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLBwFr+64mmA9gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7B41EF63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF8DC300E162
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE412342CA9;
	Fri, 17 Apr 2026 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NK+gFQzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjrB6f+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C237DE8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466578; cv=none; b=d9h/th5UwyAkEfMZ4EvJBVTZ+4ltowAawr6V4WzJbHN8nW2FXMIZbIyXg5zoz6XEurYV5HEi6srBHMtUcqn+q/q/KAyHOIPGv5uxOYQwBAG+nuU1U5q1mpkLFpaXKLH0+Y1Ep971KN0rO6rvxMUkSK7lXyEnwDWHD/d1xc9tyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466578; c=relaxed/simple;
	bh=ByzpP56LqtfgzYw5AsMA3YZqlFTYw4GDhDbdVFOD0Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpk0el0AJpj1XDe+js9grufNMx9dS+H5JQOZWWb/UFORq/YVh9zJO7aGcdkajhGPvMaSJGEznFxLB26+fxxRQtyDA83rbBA1Rd58CYMrTrTZoMm10P/QmH1tsYHD4B1mstCD+Q3wIHO4sPcg9GNNa1ASD5F2h31Bqmhnop03zzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NK+gFQzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjrB6f+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4DCV1890144
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o/Q6iRKsDndBhidxqNFPolnI
	eu8TT/SXPgF5O0dFk3w=; b=NK+gFQztvwj57gfJdtwbh8vttaILlpCeCfB20Q2j
	UkH6dErMp3OoK/LD2Qm5KvQtKw96LdiprumHB9JYMMjq3X6nCVXmgD9jbJFJvle7
	8OugyW/7hhUQ23Q82r83NDXOxxKKIOtb4IHjPeiWCG19Rw1nhOHXuDwqWqk3oZYd
	CnW/8zKKEpFHmJLGxbIGv3Qifj6bzQkaDp4YHDmqhCCvivWlMx2T8fF4i2xjBC2x
	b+TIRLI4ejq+7bcPFaaAkPWbKkVcB0/kaE8if8f2TDXTkWA/5DGR49+yVgIpVg0L
	qA5GBIBKEo0qSw7K0tJxTCLo75oGCCfAtcrfxqaVVRcLCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdtbda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:56:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca6420fe3so22776106d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776466575; x=1777071375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/Q6iRKsDndBhidxqNFPolnIeu8TT/SXPgF5O0dFk3w=;
        b=gjrB6f+tEdFChszum7btRWZyxC+VgUlv3uIYpMKVPQZgMgjyC2CjyaCzy0kj6HBDMR
         pr8fMoYkMaiJXHf1e56txlZlZELwNXwqow7ZSflX5xNLcJ+n85laDeipF0qinFhIq2kB
         SYEFDR9CHSE/onUcWpRiSXyYFeUCzC8KFxFZijw5QN944kD72R9MuC6My2AlibuPHW7y
         6cMBrARdd+72etUIFCjw3jgbCSDRwBlz6Otmme0h0sR+XqtuzjK8H0DmVXTzm3UPd0oY
         bLK7ezpXPohh+6l5HDH+e2dfE1cpXgCKRlOa8pzMNxX92uzLjSaC2GNYG9WpQ3/gK79d
         ZDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466575; x=1777071375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/Q6iRKsDndBhidxqNFPolnIeu8TT/SXPgF5O0dFk3w=;
        b=CzO+++Ey8XrFmyq4LOyWrxQhqP16WLEx2GJoHCpJcQLNRvQQx58/CaXtE4YNvYBp8l
         17+Hbl0sslqc5/iiiUepGlaN7Pj3Nokv8lLlJg0n7i04gEp4s9TjUoczY80H+T8EpbKt
         6WmDMMSWEpUw2hgnNpvWigqmMZRDA1/HbTNeACevhITh+4FSqLM0fiSKCVXNAH1gmt/s
         KfgdyCOwEVsm14R7u38S356FvacPB/1OeWli1gTFD6uUMLs1ZDTyiqb3fNriYODhcT33
         lD73qqM0/0ab38iw2nEIDjiaFjc/GIWucZE3r40lrlPI/BRqiBeeXEc0JGoUGa+PERoV
         87Nw==
X-Forwarded-Encrypted: i=1; AFNElJ833galean14CpY5R7gJMoT8VWQRxg4nq0O7CgOUw/AADj32b8e1gVEfeoSz05TUt+j0TAamIlZK4CJoH7l@vger.kernel.org
X-Gm-Message-State: AOJu0YyMim9T4rOw0Nfo4Qv1cdju8YoKVD1LdKVYoPAFGqB80+1kS6pR
	pLSciuctiUJF5yGQkbntAap5MX+ebtqN5n1zDTstlKxYmFJA9JPUcGygWufPdoF/czfIv3nygDt
	XqNyvkAFzLn9QL5gjxgjOlOciEU7qk1FJo7PoAjC0JMywErqeJdDQ22GMvuxw9QlsIxWj
X-Gm-Gg: AeBDiet1e7FOkJAAYT3bn+cKRRxSjv5lZdZTmflxWAMFe71UM/yO1GLk29bMH8yCW1B
	mXp7mcc1xbE7H8acGOQTpcPUSFuUjHo/mQiJbzfRAf/yTLoloHD8nKuurYLeoIalVogUY/Cv3/b
	tj/L60dFA8EzYqFccupavrse3t8ehNuClqGVnJ36tFr0QFC4FgHxSKT3Us4ZYoVBN0pCsd1pjuA
	ZnG8MP1esWOJF8nM437i6FblJs1lpD6+42gHZFnA7s4W8sNKZXNDoBZEU852+W6zPdRaRIHP1H2
	zyNBPErdls+TchDCV4RZ2unopGZieuGF24bqJ9IIEqtySB/Yxrutkc5GuqA1ZHO8V+/f03j/L+R
	p5JBNun+Su7dJB1ZCq0Tampfy5PZDPYiSBhDPni5SxRcSRr/OcKEPqi/xN9ECd9K8dRubtU6OhH
	ZcfE2BzYG7mTYmahP+LkbnKFGQ+gBoXDhW/zL4yfEJ5EkiUg==
X-Received: by 2002:a05:6214:cc8:b0:89c:e946:2f69 with SMTP id 6a1803df08f44-8b02814b465mr83550226d6.46.1776466574707;
        Fri, 17 Apr 2026 15:56:14 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:89c:e946:2f69 with SMTP id 6a1803df08f44-8b02814b465mr83549826d6.46.1776466574243;
        Fri, 17 Apr 2026 15:56:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8b57sm801397e87.37.2026.04.17.15.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:56:12 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:56:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: wcnss_ctrl: fix firmware leak on req
 allocation failure
Message-ID: <bn7vppl2ndcz4b6alpr33eniy7ft7fztnwnm4ez4eenbi7wu6q@km3xn3syfqfq>
References: <20260417-wcnss_ctrl-v1-1-5811ffbd8f49@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-wcnss_ctrl-v1-1-5811ffbd8f49@gmail.com>
X-Proofpoint-GUID: XGaLdfxTajQoeIkdtMoo-f1hdlaxHR2d
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e2ba8f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=OOP3nNIhSfSe25YGIHEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfX5i9Zp47xsc09
 T7HfdubiR+C3oDZh6/2MCAOhgJON9nnKjKjSmPsdT2k4DzWXzWOmY3gZr5yQKAOEOAq0fh6jtjT
 mpA85QpwXXD3PZHB0+PbHf3CzNJyOUAhMpG1V/2E9J90BoHkpXYQeBPis0CmG2IcSWPCB9KhDZ8
 oeHmgJk3APvZBAYcbKKZFD4VmbTAqLz5lsYUqhnVQUs/S98rzZlCgFUafCmg1URFvUd6LATkNp/
 NBhIGxdnbEPP2xkhmwyAwyvX39eX059BrBdME6cbvogLeqqKVZW473oA7TMspz24GsG/R0h6uQ4
 Eapvpmwtt2CFnH2ufWgDfTTUpRh6WeRSDsbtQpgQIZ0AxftoUnuMKBjB9CJUJBO8dMBvAaI0AjM
 O3DwvXSlLhRJHA/QxU7y+4xA4y3vUH/eQgqLjwfP/xnDBgRdlCmlUT7sFd9wku8136pqwuv0bFz
 owO5j8fWJgLFx1R6lIQ==
X-Proofpoint-ORIG-GUID: XGaLdfxTajQoeIkdtMoo-f1hdlaxHR2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170230
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103571-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4F7B41EF63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 09:17:52PM +0800, Felix Gu wrote:
> In wcnss_download_nv(), if kzalloc_flex() fails, the current code
> returns -ENOMEM directly and leaves the firmware reference unreleased.
> 
> Fixes: 908061f0ad30 ("soc: qcom: wcnss: simplify allocation of req")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/soc/qcom/wcnss_ctrl.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

