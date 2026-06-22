Return-Path: <linux-arm-msm+bounces-114045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vJR/Nc1WOWpUqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0726B0CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h1TNIA+I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KsHjDd2f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114045-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114045-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8CF30BE1E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51943932D1;
	Mon, 22 Jun 2026 15:31:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9622326D4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142308; cv=none; b=C4B5ZX2qJRKWhBUl56ZLWWuAOqr2FEKh1131v1j/p6t7g0NHpCJRJ7barFbv27vy7G7dRFV4EQc6sss78QtjlrMChq6tLrExavBJzl+itML0/fn9BfED/NtRTCCaS//4TXjemz7sxV0/bePhhH45ootns5XaM1dCnaQ4x2ls940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142308; c=relaxed/simple;
	bh=DsG56KuCF+8rZPfW6d2OwKPV9DW1K6FxzmsaZ/p9eug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBXh7TWM4Z61HzkSf7hVledfT9rsEvyPHQamtoqqY6d5tb4xeksq1HVGo2l6CtX2HRCRicYq65PeRCDSWOwDdHK06EoshR/jo/mGGERzLmRLUR8d++25aMaq+yvVCx+Zj5lmgZS/WPpk8B8M/c8SpCHjtCGkoR/pZWQhkC5khCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1TNIA+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsHjDd2f; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFVlQX1010009
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7QuK+5aZsqwRVEgpLCto2tCT
	l0del0IEC1+QguMy7NQ=; b=h1TNIA+IigVJaUvOYJor2rBhbSkSyXqQKCu7W7sy
	6XYWBMKqR6nTPvDf7L7hTTKh4LukxoTjxcOVAtZUTg/kE+wq1r6Z7bu/muqdr62F
	mSWSZI+OU8avux7+OMG+uuCvHIUUDGBndFW0JVRm/g1iKr8FEVNwJ0yFl3Xbe8dZ
	mzuIpLYv5dljLCuig2x/WzRzO+SNErVIf5RcWtVUb5yp1Q5WOe7c4NuUML8vV4sS
	4TXbLw1qlycM7C8JjmCrL3fU055jzoHGR750Zs8YkBOxzCLf2ANZaz4wimpQLDde
	j16RnGuPtSiEGEzRSqZ1NtCGO/5IQL5G1gfql9aWwSh50w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0s2tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:31:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7403e80b0so37564245ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782142305; x=1782747105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QuK+5aZsqwRVEgpLCto2tCTl0del0IEC1+QguMy7NQ=;
        b=KsHjDd2f/BQQg6KEbt6O5X8xtHlD7hw5wNc+lFZd/FkGiT+shd2ZXnxIpETUMmuT0j
         TqBar6on5zQM0lh7NPK7Ms4AR4lL8p0ouD0QbvC2Pbp5IXDwztuzOFlh4PnihSq+h9Jq
         gwBqZFQWRefOGNO6UjTe0skNwozzTKygKQXfop3zI5/u7EvTE6nJy//LxOGdXHVok3/A
         kndlxdsVRxk8/BtL19y72iIDj4iMZ5GRLwvrfALW+pdRf/V6EQ3ZVWNuVFaNKhUaDoLP
         G/MSIy46+1H0m1DeSs6ksS8HncIYLPXcyaLbRj3hJw3XbCt/nJrvFjkxltS2IQE4+cj4
         GTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142305; x=1782747105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QuK+5aZsqwRVEgpLCto2tCTl0del0IEC1+QguMy7NQ=;
        b=ZGlyqgi8A6VLZJDKOmJTRvt34bDywyUsjEQeayLueWNdpBnXxUggoivsFnoo4zn9OO
         IViMz4+lug2N5GGESjLEkSMklw71pywdWIXGDU6pewuQLtqW6tiuzl/ELMT7LfJ5uona
         ewYi+OG2D5x4gFzGgkJ1n82TV2taGMaCeP4LKV+AGbhZlugqr97Islm0wAFf8qoU3Mt4
         nScrv+s2Vjhkp5w5fK8Uck4C7GVfl2kxKJduu2iXibumbwYDrYxiX0HORqrMAkbuTyWb
         iFMXEZL0Ibv6QZrY26EPLjNdX2eRaPFHWkm3HsScORf9Cng4aNXn8ROy84RpFLfFqKg4
         gpzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5tfphITydcVlEbNRny7QNGU1IkYMLlb46upLglo/WJLhnsn1asOVDw+8m5WHc6GghjeR5AXl6+otvoeC0@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfA8TUPSafYRhhTgSQNWQaWSWAiz148zVNZszfz4zwrxlpUhV
	0r9lPKp4tVi0DQej9qqmV7m8Y0p7BvxZEiO+Kubc5dniTkkiXZxR8D9XaNbGp4/hx6SZPWXCtcJ
	VLydN6/Oym6hURX6fWg3R89VIIKYYxnVzk2OmLfodnV4Et5/+R1l/Pg123b3TTXBlxjuv
X-Gm-Gg: AfdE7cl8Vc7tic1M1WQ6iKa9oQagOInOizDUZvfBpGUOHiT+vuEIBhCk8bssQOigsU6
	GLLZ3kYlYbxYr99yNbs5aF2U5EYrbz1MJp/G0GWuo4YVVPKaORuVMFcbt5wv1v2H+qb65yu7S1B
	kBGMZgOpINCIIsh4tLJUEmiiSUlQM4l340u3f8A/yzsRCXzTmnUs2go7XDvOlSKX+kklOBxAhyk
	Am3f9mB3QaNBan4i8dNXlXVvaiFMJ+P4MvbKFZ6zU1A0I6T1JersN+btD1v1iKnOJYK6Xn9Np6T
	GOB8g9yjRDkSh8WENOiydHRmxZ51mugyqk9WQvI229KEVUAnx81QWI6dhJbrV8zjzztJ3z+4CNH
	Fq298qCzjv+6kNqJ90Azmn5G3fLPn3vAQu4r/HlbypwR/2l9036Kgauf3JvtTteF/Bk7gCHml2S
	6zQ3d3yRSiU7V5o2xKtZBpVJ1+
X-Received: by 2002:a17:903:182:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2c718f02edcmr152997155ad.23.1782142305348;
        Mon, 22 Jun 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2c718f02edcmr152996555ad.23.1782142304799;
        Mon, 22 Jun 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9f3b4sm20591231fa.8.2026.06.22.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:31:43 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:31:41 +0300
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
Subject: Re: [PATCH 04/13] Bluetooth: btusb: QCA: Do not populate devcoredump
 fields on ATH3012 or QCA_ROME
Message-ID: <l2ri4yxwtxv3r2upconhgsblespvushzeaqcvwvqulracmvfr4@qsmzp36emi7x>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-4-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-bt_bugfix-v1-4-11f936d84e72@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1NCBTYWx0ZWRfX7yC3vqHY1/Qh
 CRkkH1H0frUpF9AU6iJ52trgQgSQ9/rhKtoe1qWIi5AxIZ2ovJ5LCI4PDCI/N8BKVGtdP94sd+9
 7FpPQM/V1C38Pf2XMxmioZbGgN8E9L0=
X-Proofpoint-GUID: RkiO3hdgj9B0voXRYAHB7abJfjNOkDkJ
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a395563 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wyfC6KHAHlGcR0WZ_jkA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1NCBTYWx0ZWRfX8qYqNWJ7EBOD
 dLDzeJqy8roCanHhboRdEwWmKXWlYEtcHvVleK6KZiUxmsbDsm3pNttoneEAc6Zg+cVeAKFbd5k
 nk6pDcjf3SPf5D2a1AU5gpd8e8aBe7TrOoY9qrYmon3vZpzRH6TOekwhpym0uOZWJxN4gSp1qCF
 jR2nGS88k5AG0h522gc4zARZtDHEmlIIluqnT7QFy5NWM6L77L28WNAN67jVVjl9PgLW1oYke82
 tApq9PCsloe1aYqkKYDptvB1eCKQkn5YsA6knOftoBdoZUD7ygBhwXOt7Kz+7CWJPnlxr2VTC92
 0/bI8uYqT5HvYozUc2IfdTbhBUMmTyR5iejsC3pxqlnfXQ+ISBgPAJl+OAbVTtwrEDEbnid3Inj
 8tQZpPrif9vbLDcxKglDM0g0UbGiIpaRgr3uZ9KNlbx6iumIpY8Jpb92mCmP7bMvziy1nfStOO4
 6J2WgCcTd2HxYXxKnJQ==
X-Proofpoint-ORIG-GUID: RkiO3hdgj9B0voXRYAHB7abJfjNOkDkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220154
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
	TAGGED_FROM(0.00)[bounces-114045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qsmzp36emi7x:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 3B0726B0CCC

On Mon, Jun 22, 2026 at 07:52:17AM -0700, Zijun Hu wrote:
> Devcoredump is disabled on ATH3012 or QCA_ROME, but btusb_setup_qca()
> used by both unconditionally populates those two devcoredump fields.
> 
> Fix by populating devcoredump fields only for BTUSB_QCA_WCN6855 devices,
> which are the only ones that enable devcoredump.

Why? Wouldn't it be better to enable devcoredump for all platforms?

> 
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btusb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6a90f012b226..184a87d1234c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3708,8 +3708,10 @@ static int btusb_setup_qca(struct hci_dev *hdev)
>  	if (err < 0)
>  		return err;
>  
> -	btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
> -	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
> +	if (btdata->match_id->driver_info & BTUSB_QCA_WCN6855) {
> +		btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
> +		btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
> +	}
>  
>  	if (!(status & QCA_SYSCFG_UPDATED)) {
>  		err = btusb_setup_qca_load_nvm(hdev, &ver, info);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

