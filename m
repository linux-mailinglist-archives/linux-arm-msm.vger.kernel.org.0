Return-Path: <linux-arm-msm+bounces-114043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HrfGyNWOWokqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:34:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D96B0C5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:34:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nq5BQIe5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UzbXWT+8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64585306CFC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5AA3921DC;
	Mon, 22 Jun 2026 15:30:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E331F151C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142232; cv=none; b=WkJTTdTI3cwn8rra0APzhX5q/gjNY2+2RpQoffSqZojr3ia0YwbvVTa63V10hmtfQHkPevu0qBGMsfFHLSsyBLseekPc5XwlVcskY0Qe+8eUj41KAP61UZdvV3n0MmWoAvuJQicx4qYmMVW6qoNlf6zN1TmlxBHyT+rrIfuMXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142232; c=relaxed/simple;
	bh=08X7YJvg9i/BpzdLdTFU7Kq7fC0sAhUviX9de8/X4xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rz/u2CfTWXEvSlJx9e+9KTzXEcuxj/s1Y5kbGQvz1NTYY2SXjBLD6COg9n0zrj6ajxd36X8FwSyVMh7nq74EA66mUw9hK2SO1suupR0UR56Ra50UlBCkT6LQHTf2WHpSxkj7NEAjQXypYaUV5ztBhT5r9UMvgPQtw3TK7Bl/ubo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nq5BQIe5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzbXWT+8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG7bg1338388
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRDXGhrS4KlOfatb4u0Gk4jO
	jeixzy2pPP9MyC3S/2o=; b=Nq5BQIe5Pw4du82ugRlqLzSFJKJLSnBDk0hsySsU
	NLBYHxUDii894Z3awYb4QOwKOmFZhEy1qBhcxsxc66EdT7bApIncZf6GJk91Asxr
	OGcc2SMqEj0RloxOReaBRWkJLGYVV2W1LkTBNZUvhye8sFMQrTMRFTqYv2c0T3X5
	CYMdM+d/TDewsDM0As0usxTibO8TH4VJkIsLOFW3H+ZD0pieBW540DB+m78lhrgp
	vC11n0Zj5vtnduw2mUrR+uS3YcY0ZObmDYs5T/wh4V+jbwwmGhMqMhobhuwukmir
	12tuc7f8Khb7zB4sGcHnSXfO9NDkCyNf2ZMivop50IKplQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h9377-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:29 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48dc1839dd8so1740983b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782142229; x=1782747029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRDXGhrS4KlOfatb4u0Gk4jOjeixzy2pPP9MyC3S/2o=;
        b=UzbXWT+85q1NVC+cVhvf//tc7ulNwK59cTXoNoodxJ76ngAz/QFesQxB5jEzeDoxaL
         F73WxNhkXv2EfmoR4HwHOdK9dHgRAUTgiNnmWQidxnOBWBPF64Z4ISaEArP+2usOgG+T
         pT4tb3WvWFIDrbOMQMsPfTwaaqWJJB6Cf+suADS/68aRrmV4TGfebqgiiUSyLGJ1ThP3
         XPWKzrg8wklLlZD8LcMVikLt4px2VTzOpOEQmdAN6LBx4pG6N1s4UkW01tVdLID68WjN
         cZnp8+F602QD0xlOFm5+KGFb95plXd0HrczPvs1xSwH6M4dp8YglfzeKalKfahRMTXPa
         XLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142229; x=1782747029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRDXGhrS4KlOfatb4u0Gk4jOjeixzy2pPP9MyC3S/2o=;
        b=q6eG/d5OrV2ToG8BwStYuNa+jjOi/n495Y8IR5CAXXvO4DQwB6ioUGu/RhEQVWrfVx
         hbVDpzgNvS4Qwh2fPRKAGmDub30IPciJJuxcmaibqu6IkUFZbS6okeIDtpeM4vl/IfS+
         D+kHVkeynTmxL1K5LyB/2R1wadbpvojv7/cMQZJGUQLDw6FL58KeFk4T+PD3/cX1xOag
         hny/l2fuwyrDgT/1D43L2/4W4GgZRWNDEaXzho7Y1z4Jh3quk4/FV/NZT0i+Zc+8vwx1
         idaQmqCsvd2stxLgAa5CMhiCrTxNwyVfThl9lFUgCde7ayAO698brzSxgDMFVLZfQj4g
         pVTQ==
X-Forwarded-Encrypted: i=1; AFNElJ82CjiaEz+LUoemw1E9JMFq7YM0y81q+gOe59wcvpsBKOuQ8o4wX1JKLrbD5yksDn8RGMlVoAZLdJwhv0TS@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfN7tWrFxu+u10AiFOrZGCbPtTSLoBTcMRhgQR9WMpViEUgD/
	5t3+RHtQWd6ekNnbdTod/+8260eBOAJZYBUViBDZkzylKpaNtZa7bZ6bojZhNYJE/aPdbVvPoaD
	d6wjjaN2DR/bJHfpU0bcf3RG9S2NETXrqeUFJU+wXw3+Op+3Tl+dgBZUrMeWt9Q2kBhQM
X-Gm-Gg: AfdE7cllVy+5U2mPD4MQ+ogTgMaEg/sNFAY/M/Uxdg2IFvFfNJfn0m0u40KnK16DSQg
	Bd/k6xVTfR6DucroTPn+D9jCoa5TglMvTQhO7pLoPLvHiEbHJO5Tx6qIskfkCgPckrpiTHlcwmA
	ZmFE6ciUztQL1Knw6MygcXEDju/GWyTMqXKcxVthkOnrqtsu6Nck2FDSh+e6tXOwTpVRVw7jaRQ
	Idy4jcZaqq7XqBS6e1oDxXieMLuPHsRDamJqxnOrWSuM3Iu9/P4laMKWzyiu+z1pZlSwTOeL2BR
	CuAkOK3FAFEIXk1bR0WIw6RBq3K8ISjSBQsn+hDmkxHXzrK1w91w980VmwEM1ukV0GFo3S+3OUh
	tasieIq7RfM3/Jp69lF9t7VsOURYaUJhIKr6eMkpzA2rswRDBKFcMbaoCGzbXue5Xc9SgBtxmAG
	E2clVNGER34vFhbOhDQAASApnB
X-Received: by 2002:a05:6808:c1f7:b0:489:443d:a8ed with SMTP id 5614622812f47-4896ac4a91amr13345153b6e.32.1782142229154;
        Mon, 22 Jun 2026 08:30:29 -0700 (PDT)
X-Received: by 2002:a05:6808:c1f7:b0:489:443d:a8ed with SMTP id 5614622812f47-4896ac4a91amr13345129b6e.32.1782142228684;
        Mon, 22 Jun 2026 08:30:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555981sm3020e87.34.2026.06.22.08.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:30:27 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:30:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/13] Bluetooth: btusb: Initialize @priv_size at
 declaration in btusb_probe()
Message-ID: <xzps6lqo2k2w2onzleg4baycsnzsejiwhhefilk5rt5e547u6y@orl7l3yklhuh>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-1-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-bt_bugfix-v1-1-11f936d84e72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T_-N9jppGuP-SPbNd-GfbYhn8Bn118xq
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a395515 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=31voSE5pb1OKvNjBS4kA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MyBTYWx0ZWRfX+rD5n/+8CP6Y
 w9Ivfymz93mWSz11Ss3mKaRTxfOqpWg5m+NMZs99CjObXv4Ay8JZOqtWVKhFOT55L6EBHpRFZQP
 D3gy2xmDszhdAjr3fJV0BsyDTwiRqkg=
X-Proofpoint-GUID: T_-N9jppGuP-SPbNd-GfbYhn8Bn118xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MyBTYWx0ZWRfX3kSULMYxP87C
 R/yXhN86bxsALx6h2XLfZypmOb78iak+NBrqiJeVd5IAIRfpLtft/3HtavuzxKCNlDE1xWVvWt1
 1NUsM6tw5SUY9tfO15zjQuOqEnRlhceMJ5xj1v6x1Q6bfGCxbqZQ2MRxLaUqI7NiVsW0uoy4eMR
 VrsE84hAzvPajWaWf0L6WSP/qTwLyA0sdUPMMX9FK2eeuy/eQFWhqaSseG2cBgEn8dMvwzkEe1B
 cdolAbhTEZcIbA98kmoYweBijF2iSGZ2J+pPCw8tYOHTT+ViI/rWAx0osuzhc3iqTnblgXCfd5D
 XlYitWbcJBKWApbWFdkyZ87Ylt7u9jYyRyOrgLpYNDYsJkwHKL0iDdbVuo9za+mUPAXIwBE6ytF
 StpO4v8SKBpl5WzuTWDuYY4kuIWvtdEC0sTyBaCCOCchRZ+omKiqrb9dIwBzjhxBjdjvvKWdqg2
 cAGHXr7RSspEzvHUmwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114043-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC6D96B0C5E

On Mon, Jun 22, 2026 at 07:52:14AM -0700, Zijun Hu wrote:
> Initialize @priv_size at declaration to reduce a redundant assignment.

This is obvious from the commit. Please tell us, why?

> 
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btusb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 7f14ce96319b..5209e2418493 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4082,7 +4082,7 @@ static int btusb_probe(struct usb_interface *intf,
>  	struct btusb_data *data;
>  	struct hci_dev *hdev;
>  	unsigned ifnum_base;
> -	int err, priv_size;
> +	int err, priv_size = 0;
>  
>  	BT_DBG("intf %p id %p", intf, id);
>  
> @@ -4152,8 +4152,6 @@ static int btusb_probe(struct usb_interface *intf,
>  	init_usb_anchor(&data->ctrl_anchor);
>  	spin_lock_init(&data->rxlock);
>  
> -	priv_size = 0;
> -
>  	data->recv_event = hci_recv_frame;
>  	data->recv_bulk = btusb_recv_bulk;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

