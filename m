Return-Path: <linux-arm-msm+bounces-111651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vFGRIgE4JmpaTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:33:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC457652724
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WPcHjet6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BwYCkgmd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80006300D44D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A983346E55;
	Mon,  8 Jun 2026 03:33:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41A3128BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889588; cv=none; b=DCm7+KlZmFM11wh6VTQkiB+xR8p4oRpeCp33TQb7GSYhtFXPlcpsQ59R7iQdrlpfVjvM2OEM6Q18IdpHBFKNg5FCfbAg/LrGELQUoHTwRvWTYlPyzM+v4Z9+ysYI1pMyMT934Ohx710mGfqqJjF+NS2Y4jgDP3NF7wSJ5FSHtdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889588; c=relaxed/simple;
	bh=FpJMI6QyTm1RuGToGXiqWef1RKdiI399N3tazddUU1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiP1qbRofej4JEo6nzYDsIhP6BdvR77N65CwtC0Z/oh171/Jwq88xcET+msjcFbS13eI8mUaVz1gVbmvUm8HnR2dqkXjry5Pvd8dFz/xzhsOI74uvfMcFt5YBjSjbBOvarBZebYor5qBd9OSUjWVa0oJcFnbriRVBepklRPrp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPcHjet6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwYCkgmd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EKuY1535338
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pb6v+qD1GF9Tb6lcJQfNUMen
	u9ggsVGxX9E2kC4lICU=; b=WPcHjet6io8fBLfdI9QND6dn2OQUzWziYnM2IPTI
	fpRXkD4gS8vPMyCt4yE3QWUqNQj5RBFFQ1ZW6KHx3ce88AEpiqTtneiLpG+rjapg
	Jfrx9m3STJZbOERH90aVUnf6LtvD9rBBQLRGaAcYp4uDYtrCLn0HcxBJdleDfDDl
	VZXhoqMQfYUUwuHmBjJbqxxT3O1s5toJHTGoueZwJTWF2viVnVSfrnIXftHO1mKi
	SqO8MW1yAVq4mrIv8Ak41SjYkrxQ4VyfgqEUQAHfIIKaKZBS07adoBubHkJXy1d6
	aRceOrBH96Mq5PAPzexrt0kq/5AhW7sTVbOqfJxJjG0LtA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrdwam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:33:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9639158a44dso1409280241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889585; x=1781494385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pb6v+qD1GF9Tb6lcJQfNUMenu9ggsVGxX9E2kC4lICU=;
        b=BwYCkgmdobr+GVOqvtX79zs0+cRNvbIuExh5bIZtdt/trlYO0PeWWf2C+ilXhkuL3M
         /vrB0P/7E8Qr/I5xDOh/3cQ2mN8i9+DG7nmv3MUwuvR4uSm2jpUOtNx3DWl+uQnMwUpL
         yMATbkQ8YEFjIFCZ1p6r2xW1BvQ9iAFZzgg7zKybbFA2dXW1aaX53VM+AAXGW7m3XPoY
         /NzhGVwhNbs1RcipdoehkO5Rs8xFYW/hosuEEUJ9xRw8tUQV+WF9dqSB4TdwOLbctllf
         lVUw18YXIvvzyKTjzXsyvF/yTSdtElzSPfdxssSrtEOPYuVRSERPDCMqdnSnby43MasA
         GVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889585; x=1781494385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb6v+qD1GF9Tb6lcJQfNUMenu9ggsVGxX9E2kC4lICU=;
        b=R1MXMoZOOPZwErmDxiKwoNLaXHtIB/BRPLXTTKtAsi1DjVDZRqvnS4cdcALPy8XoQe
         h4RxPgacHjyaddjiDeKZFGgIMtmmt1s12BQsRmxb+nVb075o+YTxWK5umlgCRMQfBtfd
         3hq/+zoNWlu5lN36iG2Y7+mnkmimK4CxujqEiUxUk8/UG9T/a5ksxgR1QJ2nRnqVpzhe
         xu/6k9PuKtsAITvKCOiSSHPYzfanM1f20GGF68ZUU+Ivm31SYZeYy0S56erIt+pkNpvy
         iFBCK/6pfmloHilIw52F8WbFZc4T0LBxccSEm36HL5ArShKcxzezJYiYDfvFGPS+ETsW
         RoAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zq0kbIIRSsHd/rJMc1DSn5s1/r8gUki4OmGizlFGqEZonmCik+ql6W3eMpkULFX7Wpo5HIW8i9olaRyUw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Y8NIpzYSS7pUQ2D9X3AlaIRkw+sYY6fVmGZfRMjyFjbDeyGX
	n7kvPejlx3eRie+WKjl/EW6GNZnk5V9e6in0w5VoCYXOvtybB46wHypbCbwi3nlv82O5jYub5uI
	JT06P/KRKEfvu+2mpJzehvMaHFtpzBUu6exgoWxJvnrzi+Qq59QHTiAIbay4GXB5DpjPA
X-Gm-Gg: Acq92OE9q4MlDRFsdOKj3kbxAJYcxIzMjn9kgp+KqXXr2OMowRGmZOtamtHebKFsW9M
	zoJbh0zYwmqEoRJVoO70JC4hAtH/H4zLvYtht2iwtc27u62/GamDasFo5Wug/0SW5kiaw8INJ4D
	/PavuikoBCRzkUbBSJi2PMkpxb76yonpwcBk5F+AANDzZpJYu9tj9AqDMKdb60ypSdQI2mpJf3W
	wCOyDMthWY5XbI/RGxs9GEd7NlPpK8B+880DNOuAUhKNn0MwKzvD3om7zQqj48ismp60hOfbDPr
	MK/yiymGOQqj0KRtKgCfvZIgsLtmx9CAQCyTN6RQ5QiG7mldkz/KDhKTw6ecTZ3J3BEWJV+COf+
	c/SHrPmTgS/zDEPuvhv5PDDXe+RIV0oAmxmB7RXKCkdE+UNKcreDBEWxEW74imihc0oVOq2E3WK
	CT5/WXuQiPLdoUgKF2e0kH0zW/mifHCAUalt7Gv6XhurjG0w==
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr6181931137.26.1780889585477;
        Sun, 07 Jun 2026 20:33:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr6181923137.26.1780889585071;
        Sun, 07 Jun 2026 20:33:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm3487135e87.10.2026.06.07.20.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:33:01 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: qcom: Modify MSM_PULL_MASK to accurately
 represent PULL bits
Message-ID: <hi2zrhoqzq75yqgplxgibk26c5hqnzd6i74bjxm5r6h22zldh6@3vwnwbsz6ilg>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX/4wlBBPZe3Rv
 CZRNfRCWkp5qxWr7esMDFtC2N+wQ8jFSgux3Rku0rhCRcXBnwpe0VbTbZKDIJUl3n8Arp8C3wq6
 aVSSYOifDf1tDYlPIO5yeGgTe022i66rlELbs/JCJY92s3Yba0LrN3y+C78HEcNIWyadJyB3+5G
 QGizPtQwfLvb7gfaZYueB+jA64wpdXrVyLJSCNmvyDc328J1ZEw3rdPg78IUFYdr6yGDUEsmhgZ
 +XbMcXSXqlcTFb8wnvn9wTw6W26XA6A3Kdc7fcrnzpvG/M3fUrdxaeopG2wfv8u2Biy1NibgcxB
 Bm6k6w3NHgoKLoI1Xosln0RpKeBG+x2g97DBFEVsDPtAgaJiMsfsQTABLlgpQWUP0Gj+JoY6/nQ
 68LXtvE8/S6DQscVjTNo+pMpE5/KCDH8Zcp6soHhdsD5odXBu6z+qiBJfSOcqciMpFkZ0wFlGYY
 v0lm4fDibaPTLNTdHIQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2637f2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qVY8_epACHd-z0WO0hwA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 1n9dGqVQIlb_qPZcNa0cRkfNsuAuetbq
X-Proofpoint-GUID: 1n9dGqVQIlb_qPZcNa0cRkfNsuAuetbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,3vwnwbsz6ilg:mid];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: DC457652724

On Fri, May 29, 2026 at 06:25:44PM +0530, Sneh Mankad wrote:
> MSM_PULL_MASK currently spans bits [2:0], but the GPIO_PULL field in the
> GPIO_CFG register only occupies bits [1:0]. Bit 2 belongs to
> FUNC_SEL.
> 
> MSM_PULL_MASK is used to isolate the GPIO_PULL bits before writing the
> pull configuration (PULL_DOWN: 0x1, PULL_UP: 0x3) to the GPIO_CFG
> register. Narrow it to bits [1:0] to prevent unintended modification of
> the FUNC_SEL field.
> 
> This causes no functional change since the driver currently does not
> modify the FUNC_SEL bit, but align the mask with hardware configuration
> nonetheless.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

