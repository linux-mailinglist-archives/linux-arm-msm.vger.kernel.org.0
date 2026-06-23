Return-Path: <linux-arm-msm+bounces-114239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DyqTKsurOmoWDQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:52:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 048BA6B875C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SLSN4one;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="D/VROfq6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9583009CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13EB306764;
	Tue, 23 Jun 2026 15:52:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34729ACC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:52:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229955; cv=none; b=Qo30+CGF79h+tSSMeY9rdACmw9sZGzrhQxQRJftKQI1VrL9nGIXd7wNKev1j8WmN7hFZz9IzbQvzRL9W3iU+g8+uYyz09dPk82jy1LYvNI7GNY/KHdmneN23Hxgnsik5y3f08iMrJq8kBB1TfCMIcESS5tbEykduYldY6xcQWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229955; c=relaxed/simple;
	bh=UiX8iIXfwTkI1R2HiX1zn5Surnk57floHA1qcRRtyr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzJoOYrX4tooM9EVpNmsca+4eOpGCJ1ycTwH2yVul6nBGcnA2OZOHYwtnYkqurNQvGbs60rcIv2W6J3RPJcYC9CZoPvzWLtQ+je6KbCd9LngzN+NhsMfCMmV5QlQcv3mhEEdRJ9RcqWVxsjwfrcHvwfNE+0jWYHAoP3KWN7yFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLSN4one; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/VROfq6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZgcp4052508
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gFSaw/u+/0FxiD2pcJvn1Wi1
	v6T8JxW8g+4qgMYIPUM=; b=SLSN4onevKNYpSys4K/MnuvYqfKou6QPAOPDUPv/
	P/Y237ze8WJzWcuYjItXYLJ3KiLHdTeHk+4AFB5lWIYi19qq760n8cuMCM55llp/
	8MnW0NjZSCRKiEPmkpahubVJQ3MQ8ZLYUsSBg0rKtpQimXZOjWDLQxiQl8EDg20B
	919iVIo9caBBqYebD0ixmJGSkcff9On/5bPMTRsTAStGbiPRJ6IEgeAoAz6jaNPL
	PY5jYdNgVFffL601t55JgzuiRBxTXR2fMiAuUrZ1oCgBX3P/5w40ZfO56hTn2afs
	mV+EjS7mJt4GQThVY6xugrBIq/yXPg0FTr8gdq77Gv2o6Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ysbh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:52:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8895156101so4054521a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229953; x=1782834753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFSaw/u+/0FxiD2pcJvn1Wi1v6T8JxW8g+4qgMYIPUM=;
        b=D/VROfq6sT9aIombwwUnaH8atlbj4dNVk1Y8NGTca/mANeW/bPtRwtTCQmfCJKb3PE
         w3m2mj8VGnQDe+cJqFCtM3c+6yN/tkeh1GYJYmLvgdMQ+CNMAoY+oVquqMYZLBG/tCxu
         7syFxB4jTMTKP+4p7ywEgYt1ROe1qCCCXeneLmRxG8Gf0hlEPMzm8N0T2MwTfcvly6t7
         rfbF4SRPPWsFOUNRffkmTLZhsWQR4nyjBXKHBzzK7oUwjpcZAYQPu17fTlShA8a45jmn
         K57x729g7Jm3x7dwvnfO5mDJtI+T7nQTzdXpjnDvhhwnPQPNNTw0HKAp95nmq2JYSAZH
         XMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229953; x=1782834753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFSaw/u+/0FxiD2pcJvn1Wi1v6T8JxW8g+4qgMYIPUM=;
        b=WT4p8si0eaSEdhJ7we6EigcMYx1ci55QScSC92KASYPw2hQbC1nTrDp1ukKiVrQTtY
         ycjk2Ow53oQcXmyF+NrkdaC3/HcQnhmIXX7mks09QFArNFxfKQV+XOZQmSncxkEZ68dB
         sp5BwG+laD/VNJh5rf0EruuRxWehbQwWugsOG1qp7Kz5yHXCGady87AzNNiYnULTeuSn
         qRCtOWMKlGcoZkIpqXtifm3UVUeFhczMbW8y+Sb6BBonD+BMgmlIkbO1dMQdPI7pYMp3
         MJzP66qsNsfQn71jnHvgTxw4e02J1aY1rotcZ33DE9Hpf8rfBGc1jov5P86iTTP21lnm
         LMPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+Ikwsug/NthVjQ+zOodzlcqaYHGwjeGmre2nWJcVLWIsv3nYAzIp8kuWh8YeuaGTj7ummeJro7YuZomUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/I2YVsNN5O/m5bNcqsLtORa5iFqWrkbdZ+pI0KAIs0ZlvS/9
	HJ8xBsY3qP0McKjVx3VHyCARjOFVfG42sAuOX6XZHFwb8Av2Nv+gMh0d7MfBPfyCNTGrux3SB7V
	MiWK2MLpCEqSgAQz/65EkkNyf/nJKCfI1XVNi5hBd9UDGR/IhNmydE9yJqrxQmyAkqoFmuRu0VQ
	3T
X-Gm-Gg: AfdE7claUaLv6jaZC/lTgSYPWN9IzATh+fQdpGujrSr+JCt61HowM8aEdJvrTSyA6/z
	P9EAJqoIbmkK5K+uHpe3eLsI1kWuq11gD420YM8xk6tRWRZwMk4M/5WGmXMwXBdf3m5H0GEYk9T
	aAKb+lnm+r3tmRhlONsahDj3Im2XurAYRxjByBLILQJvEcDwjAphwyAjNuXtSxCYNigZCHnRkCp
	tyNhWX/JypzNGveQnndXbQDpHNMbicKszaPRsXAsxGPy9YSGlOgQ+Nm0fROhD+hz7n6aoi/zl3x
	/pRiZa/YaJgoC4MVdicjv5taAicSFCkqKSu1qnNO8n8lfQifBVWHEuT6jqW3UeO71/fpdqks2UV
	DkkRtpCJZ8loAfNUDKYAm28SwaOBtOUFReYue3Q==
X-Received: by 2002:a05:6a20:c90a:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3bd18fb0760mr4106542637.3.1782229952592;
        Tue, 23 Jun 2026 08:52:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3bd18fb0760mr4106492637.3.1782229952040;
        Tue, 23 Jun 2026 08:52:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bbffc2329sm10757380a12.0.2026.06.23.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:52:31 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:22:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from
 msm_gpio_update_dual_edge_pos()
Message-ID: <20260623155226.n2knq2lwtiwc5boj@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3aabc1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uwjjOWXvf9S-uVtQyYsA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 1Q84Mj_pYJPjTs_TINfDCBuEu7A8p1jS
X-Proofpoint-ORIG-GUID: 1Q84Mj_pYJPjTs_TINfDCBuEu7A8p1jS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX46WZmJuCgIFc
 NJ/R2fh8bUCHO3ydG0ksT904VUadM3cLgOqVyuYUalL5oJYPVqyUhlNdP+t66bclZ59ncUIHWlH
 Dy35LoLTxttFaPt+sSPF4ApyZuw5ES3kKa+XzNM2BaJxMJSTwaAQqs0XPb0vY5tucsErIg2tet7
 yDeapxxFBvdyunAMcj4BIlTxWX/I9CvZ4meQBW0VN1XvkwF1R9hGY8omg9sY668TSSU/CR+7lGr
 6SBXH31PxiTGOj522EEfjodMXQRR5bnKyefgAE/N5HBnKCrG6vEeCCfYoNJ30DRVWfYJYXDvRGO
 Vy4awpfhNYv0nFlEHssC3RMP/TfXNkEXGNIiKINTHvRMXsEg4x9B/o0DEIir4odQXWSHQZXdZjF
 fIvKAm6DuZbZMg37/wx6Be3SRaKGLuKkwLS6FNFQDclz8vFCLbstqs5G6NwtBiPBGq1yGedpdoq
 25CqFQ5ZnhEKzftIhuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX6qlwP3spGelI
 WnoQJBSkVJIYUbstRYm6/WHESbLljvMPP+mkRmM6vdJtcXJC/fq3Z5FOP3dlTng/avGnV3URlqb
 lw88w5ob2S683vl1HwNzYaSfoceHa3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114239-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 048BA6B875C

On Tue, Jun 23, 2026 at 02:27:32PM +0200, Hans de Goede wrote:
> The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
> unused, drop it.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 419342ab45e1..f780bab51d9c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -810,8 +810,7 @@ static const struct gpio_chip msm_gpio_template = {
>   * Algorithm comes from Google's msmgpio driver.
>   */
>  static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
> -					  const struct msm_pingroup *g,
> -					  struct irq_data *d)
> +					  const struct msm_pingroup *g)
>  {
>  	int loop_limit = 100;
>  	unsigned val, val2, intstat;
> @@ -1015,7 +1014,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  	msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> -		msm_gpio_update_dual_edge_pos(pctrl, g, d);
> +		msm_gpio_update_dual_edge_pos(pctrl, g);
>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
> @@ -1190,7 +1189,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> -		msm_gpio_update_dual_edge_pos(pctrl, g, d);
> +		msm_gpio_update_dual_edge_pos(pctrl, g);
>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  
> -- 
> 2.54.0
> 

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

