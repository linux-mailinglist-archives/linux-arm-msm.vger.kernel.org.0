Return-Path: <linux-arm-msm+bounces-104976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLUXHWWd8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:43:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A892484174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5F893000FE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102D3245008;
	Tue, 28 Apr 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2KOqIdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP5Hbanc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600B364E93
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376241; cv=none; b=FsJ109SmLowrCdYYCnD47juKUaD09iypgFcj2fBLJcDeT4vqGZk8A9WlJ/1kaRshwZlwMz5UwAfw2cYDNUcDZG2QAktWf7DfdKsRLD7fv8J8nE1lN+K5ES2msblCmpotMKmlIhDjfsqrWBybtXTnQmbmUvxfTu6rOz1ONtGLB+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376241; c=relaxed/simple;
	bh=kbRNN/tv2J3rKiiyN4xLMpeHmY7TIZd6B0cqKTVUBww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+I+Qvjq03/uytki44Gc7Sv0KWb0fYZYGH78NJPK0/I8aHh4D2SBvyQWE0fMofrpvpfZPzDhmxLWPQy5AKMmogn8JGQGZy+RpAPV1fzadKUdpgfWhShGnOIOnsbudn92T//LPAdjBnKVaKm5Q8BhM/RgBpJbpX1U+zhG5jiEC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2KOqIdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP5Hbanc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7F2s1440983
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSO+rDsc9UB5kYuyvWnZGSTS
	2+qL+UxF4AmO719r5kc=; b=b2KOqIdr3iY7w74gRjWUMA+Z18SyXm6a0/7+Au+P
	jkiWyyCnlpI9ERTJaUv8PrDwoTxCc4usdVuma7QT3zTupckKhvQRmc9clsL1q2AZ
	S5LDZYd4guuBPi/wrgkmBAXVT2HZO9KzgyLpAzl9+NbEBZKQSfyoD/uacF5tzVkh
	BdRYHPHN4iS5mrMgb5w+bhvj546A5dzetGysJyCpEUEjR1sqBDGni/7YRd/7Y9gL
	t555LA4vGS+pvmU66HhEVJTTj8EjH0qrPu0g+G5pP4X+jz8wE0kfb7PrzfhnarD4
	gcwd6NSAAb+8Jbq3earRlvabE6bG2Ul1rg1OXTMF8TdmVA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac446fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f694e2ab8so9389042e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376239; x=1777981039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSO+rDsc9UB5kYuyvWnZGSTS2+qL+UxF4AmO719r5kc=;
        b=DP5Hbancr7QKEttsxIKen209hUY4rW08llSx+XKs3a+/Ar+r50qxsZNDkqNvPCdzZB
         9dYjaKkMOJNJ/CI8TofJi6gD2SH5GeQP+Lxn57i6Fs08jjXxHUumccD4doRmyib5SEUS
         X2PM4pPtK8eDqfTPL854eGtDwBe5Jg6UqHSczJh5Pb8hTfOLbJWLghayuLKf+FZN8No4
         X/O5cXohT+4LxfKj+qLknlfswWnXRYxc7wkvNE5O/waI1ZBeg33AZTpKJdbuAOnd5dbN
         4Py9DE5w1efIS1RenqJkttuZY0tDilkvqWMmyL6wk21c4CMgh7moQT2Claqyi2dkAitG
         IWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376239; x=1777981039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSO+rDsc9UB5kYuyvWnZGSTS2+qL+UxF4AmO719r5kc=;
        b=RkMknpeBsXVrpf4oEZvP/wXeh+w49swBKq4Wbr+GWxLTB+h5XlBsP4EBEwtkROP+CR
         11tKCB/Q7VEewd07UkDc4Fh3e4W+19FyRQPGSIeQEsJEhZmGGtsCasVz2s1Ji2UTPptv
         rzg9qTALmPTakpCegp4xMpJgk/rV6Pj5vwztBbse+nfRy0/Qg1pv3NTh+oMrBdoT5Baq
         TaO1HsrCP+Q1OQGkV7uQqumZLXVOhL8ASUdrCEkNm5OgpwtsZPnWJVqMYaTmhL+gmhmL
         UrJ3H19TrDDd7LymlQ59m2uwPJvj8Wmee9kL0/PK6sy1kVKOLVibrENhCvo0esKcJGqz
         iVDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+e924qD86+8+tT7aMlNQv2/7B75FxjGkcg/jK+RcO/gBJy2rCeYt3MAXxCBEFjDz21pNRu5/4jZtrHv+G9@vger.kernel.org
X-Gm-Message-State: AOJu0YzqeUTN28cAUUiQAYJquw+JobSyesl0akMbPU82NNZnVlaUYvVs
	jd2tKCPmx7iQuwpXB7DqTnGkAY65Sc+4KyiwPNRO5x5NPfn1YOPoCplalrWynmFSReKh/jc5UKL
	AoHKZSMGLCS/R760pVgbGYpMXiTKY1I4wN0O6Ec4UhcM9J4XJCObNcYhau2ng1qxVjOABlmclUt
	j4
X-Gm-Gg: AeBDiesviSqXfDK9MuNbaOLYidmk1bRnc2ogz2nPG593I64MJWHz8lnb3/AGTaO4BvY
	Fwmm02qbmTpOfO/NmVXakhS27UIqCO+IT5uXJEjXtmIC12Zc/5NZZS0ygaYFde5csijHdrAJ96j
	D3ln4mWVYy7YLxruZ1fzuS5rFTRoBdOI5y0M36WV7FGEdYDB/kuNOxyjiQ6OEW7ZbyFrIz1/T3N
	5/EA0PaJfrIcbs7wkr18CcK66GJMQbbPd5LJjLy6nCuOQWwQzCKVp5vBEbUcMYUB/y/lzCkWon5
	7acgVoC0M9SVmdLJu0q0DHftCKD4vyvv//DLoXtkmzgfXjnhogkIeIjpJIths7RMXL2Uf+ZemC0
	613bYJkI+c6KK3sDq4StNDWvD0hFUfZYhKTe3BmTMjt8FJH2D8E/OONBpWT+OJx0peuklWMaCbO
	SE8hoUd12MQYH9o1tsYXtsF/tT6OW9r5qsHxGPKgRxqtst7g==
X-Received: by 2002:a05:6122:2805:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-573a553f767mr1005906e0c.2.1777376238888;
        Tue, 28 Apr 2026 04:37:18 -0700 (PDT)
X-Received: by 2002:a05:6122:2805:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-573a553f767mr1005900e0c.2.1777376238377;
        Tue, 28 Apr 2026 04:37:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e3237sm6280951fa.3.2026.04.28.04.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:37:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:37:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop
 disp_cc_mdss_mdp_clk_src from getting parked
Message-ID: <u2ypsha4t5hrzjnzihut5zdef2oijkakl6nzeqr7nlzted3kpq@efc2geb27z5g>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <ae-YlXZAuWqgPd-c@baldur>
 <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
X-Proofpoint-GUID: 9JS5eazLwvTH3h67qwA07GTjNdy5TGtT
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f09bf0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wuprHcOFQ_25lWwXxKAA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 9JS5eazLwvTH3h67qwA07GTjNdy5TGtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNiBTYWx0ZWRfXys2MuiuYm6zF
 27/qa98hLCIXtA6JPYCtzxQghGptoggbnQ4+hXYLUIbfh1D7cn/G3osk7HsQsbvbmiyVUcYW1DH
 FyGbx4qWLMeSKo+GEl1zlQRpwVXp+TAXC+ATfobp+oLJimeDHS6Phr/FU+hxXsb8fVHzC++FsG4
 l+H5wrPa4OpljKiZDWZLRNKYKind7+F1Gl8c22ZyivBggazXPx+86VvSyiJpv2PCsnyWTsK8B/i
 WRuzy0I1fR4hvObeGdTF+c+uDbqJQIX084Ng31786KB/xnimdmUYJp5YDpVenNldUIA5zlD+Ccn
 hzmk4J64X/L5NKKZqs91MULR9dcNINHVfJXlDfp74TqVEOezaQ0Ew5HG2hUsmJJHxLRbBDcFHk8
 b4dC9yp8k580sV74I6cZqzPq92Kth1ZVFkw93Kmh0y/0eU4kKSd10pzVrBN6CgGQc9I0PvCTd++
 UpzG2VtbaM1UrnstZnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280106
X-Rspamd-Queue-Id: 0A892484174
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104976-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 10:39:24AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 27-Apr-26 19:12, Bjorn Andersson wrote:
> > On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
> >> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> >> to stop functioning. The EFI GOP framebuffer should keep working until
> >> the msm display driver loads, to help with boot debugging and to ensure
> >> display output when the msm module is not in the initramfs.
> >>
> >> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> >> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> >>
> > 
> > Wonderful, thank you!
> > 
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > 
> > Could we attribute this to one of the commits that changed the parking
> > behavior and get a Fixes: here, so that we could pick it for -rc?
> 
> Ok, looking at the clk-rcg2.c git log I think that should be:
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> Please let me know if you want a v2 with that tag added instead
> of having the tag separately in thread here.

Usually patchwork and b4 will pick the Fixes tags from the replies


-- 
With best wishes
Dmitry

