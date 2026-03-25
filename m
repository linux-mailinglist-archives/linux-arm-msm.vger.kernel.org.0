Return-Path: <linux-arm-msm+bounces-99912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAp8KVkaxGnlwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:24:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE94329C07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 676E7312F523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D7D3DB641;
	Wed, 25 Mar 2026 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEBOlUi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea8swqz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFAA40242A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458916; cv=none; b=V2C7MQ7xXUVQcI/ANsDKD/5g8zqiO/nTUivxuOxemxsNjHHwo0dS4E0olRT17MWN2x0JexuHD+Ue9nWIbT/eEXm7wbY51AbNh7sPScWi9n3ZStBoK0u1Wue20xLZ2cXJnQTenfQDcpZRUkX8OsIkV0XyLFM+86leQPKS3mNyzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458916; c=relaxed/simple;
	bh=uwcLVO/gOjkC3WYajEHlZW3aMp9aoyle84fdStwt6C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giGrxfHqgR8GKUMV2bIJOrBEPjgLXgiAGldd1cNZm/pc0/KfU+dyAfNe25g5HSXKDr6XX8H6sp8HX668A+9SbbwZf3H0X2Hojt6x+udjOeQQ+SIBl8pF7l3tg4jJik33t2CAwaIDw30l8g7l5OXyqJc6Jb5biwzQpNQbowAXEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEBOlUi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea8swqz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHFul433704
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxtnUbf8avEpC6Wnx92MUbMm
	n0aJDZVFQp0HMpGDqRE=; b=oEBOlUi5RxHgUWqiMkM9jB976WTJSlN05eouAEJv
	d5ehr5uFb0BUA3pSwd4BaiAWrtaeZHAMdvq26mW+MBl+W/6kmDoRVU5pQ9x5zVqt
	/8fHL7zLxs0MzogHOIxf39CoT2VkZ2fRMlNF+48YZNMA87E1SoDGVoRgNQOspFMP
	t1WGfLRFX+ReGb/Zxnkskgtrn6jYnJiS+HvYge0E1whPiRODGOgHNtVX+y7dm2k4
	znq/AXWWLoIS+88CeLvWNR88n9SC3rqbG0pk6pZY9wEGCXKo2AbqjrYOuJzqG5pk
	P+2r6LUlDon+kT/7IFKynPNL5uwAWdie2g1q5p2QI2qBBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41414788-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:15:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so4081831cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774458912; x=1775063712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=ea8swqz42Ma8csEWzr0MeZ8tSB2A2aoxhrdSO2m/Zy1a6LTBg9Keukk+RxlehRL8c/
         ie2DtuBnCmDCasj5PXnWUZwZYcdsDBouCCE+cuM93Ncnx04I7jC0KR5Nztwc3BvCeY6m
         Z+/NLJFG8wYUwy38+yvjwN4SEmvRf9NS/JNFu3ZUwwEth9Z6xog49tMjqTEGVTYuEc6F
         lNZoL5WmqfIG+oDpnFqbNM4r3ADduDCWnGhOjR7F9Mb4NBOCIS/EbjCFyaTQVBjVucDs
         kB9lske/BFFlVtXVXe7GR4xDZ7kZT0kXz9QziTnmbF9dqK2c8KFs7wHs5x8aC3XdeoH2
         Kolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458912; x=1775063712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=YVpQpXRFBemgUfmjq3+rptfpDbEiumJGlRoTDmt/WncwKh5+IVKerPZl5co8eUbXAX
         8Yrx71bQqLhHLzHmDhz6Dh8Wia3wg4ESPYHRzAWOcM4B70bZ52qVLK7SNv6JquMVrj4Y
         84aON3Xsxu6tJ3A0xTTOzQ1bDqcawaikkiACjwH3T8K0SxSWnjGS/c+uJxrc9qax9+R/
         HR4npT5/nxDmCdMKDObxPtzE8YJER2OeqKrhmimpX38RvTcpg1L5rqz0U8WQgwGj36Tm
         W1hkOXoh9erMZIWK8bGWwsgt9L8qg9RRZz33nDFd42AVZqSFt1Gcqw+g13HBeRNVh4O3
         c+bw==
X-Forwarded-Encrypted: i=1; AJvYcCWD3n7SZojVtguA25OzS7WyjUYMfxocgTBz3BL8s2TND4aEssZlLRBeA6qn63nNunL0+rCqdXsBDQSB/NrM@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr0oGy4c3btjzYX1Iqa7cpP1yNHMnChng8U1yPwOqy7cNnhbM
	U4Zrk+zog5C/cobR5cBSBMtW+kkBlkTWpQ7qt97qumJupkc7Nid7O65d63hibTIZzGF8MQo/hml
	EdYAb5H6NizLbXGrJFH2hT3/mQ0CCbJUfYmRHOBhjRoy8au5+tyz4nvUQoTk6FRhfEWp4
X-Gm-Gg: ATEYQzykwoaX0BkfCAXQ4aJdUA6Wqcti8crGZYlMoMZtaN78TlH0uV9AReIpZfhw+VU
	n1Epj7eznOKQZ9aGhvKPHn0BuxqxnQpESYrG/rBSXBkzLSdOp3zKsMj1nv5Qn92+bY1v7PDfQBF
	lsRbEvuVnkj9CvRTq9d7Ft9xRRz97Ixp+5riTyZlA2PtV3/XEMmRGMWZzjN9J57NFKzebOi5Dbi
	QEpfMasqN5TY6F85bmlN4j0PyvM+UUJ2WRaVOCx066wwIzms1hD5i7hlMQUsocfQDBYagRzPhrO
	jTZbvyKPjW7vu45wFDOR7k/uGC8bQb6k3IfYGVTVb4c7Mmyyv3WXKLiGV7mHDBGepuCxfxPN59T
	vAkN1veebcBFHN9zKctwICZr7ElZ9sbNrl5+Ob+cKPNzRG6ruSZ8mOQRc8Z+qKipp4f2l+1EvMF
	tnnBPB6ICCvl6YXGruBT4rJlLHUSKyGkwKLwQ=
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61511631cf.44.1774458912055;
        Wed, 25 Mar 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61510701cf.44.1774458911390;
        Wed, 25 Mar 2026 10:15:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5e90sm25519e87.83.2026.03.25.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:15:10 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:15:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ath10k: Introduce a device-tree quirk to skip
 host cap QMI requests
Message-ID: <d6pv62kc5zyqite7krm65vbtlqnsc3v53rlrtilchyk5c7uad2@iu4yaw2ksr65>
References: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c41821 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=2Fa2QF5d3zqJHI2iiAMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Tbl3CegZornsdIX0yi8pGa4Y5jxvvxux
X-Proofpoint-ORIG-GUID: Tbl3CegZornsdIX0yi8pGa4Y5jxvvxux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfX8BFJkBf7GpUw
 lZXTGFpBmXyTacD02LvjGVTiBvFEJDCvUXswI8Yci5H2D/yNYLuSXPnJCndhCbAZo3dl1WXOmbR
 tbx+ik+dJ/QMvZC5CWuavQLtvzRhsh+qR3KI2epEWxAln14nOdu1h2DWIkHEgRDXNTI6lNN41Y0
 lWsHgvlbnYFDZ4iUB2pQXoW2nTxtv/pRGwdsgwWlMiEvzVX+IWWWr4/v5gzT5D06RrmPEhtA6En
 nE/Dv2zJhbKBeTpVmdyX1LWtyLu5ZohRjBvB+h9DL5GQAfJSZT3AUPvHgDLhCEfr5XWtThA0geV
 dK24Pqa58Xs1My+pFtx0FbZvEPI87i3qJj8MajzKK6FfNEAsLzVY2U4R84jnJRKb+RsKaL3Tbz5
 NF1cyt2cMNnF+kX4b1P82KwZaDcXoNouRwlqH9L+xxIV48K9ht9cBsf10R7XXxjLrgUGHEjyMPd
 9qWKiSBHpjWdUneZOsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CE94329C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:41:13PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> There are firmware versions which do not support host capability QMI
> request. We suspect either the host cap is not implemented or there may
> be firmware specific issues, but apparently there seem to be a generation
> of firmware that has this particular behavior.

It needs to be explicit that this happens _before_ firmware-N.bin and
board-M.bin loading. As such, you can't add a quirk to the firmware.bin
(a standard way to handle firmware issues).

> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Poco F1, then we get a
> QMI_ERR_MALFORMED_MSG_V01 error message before loading the firmware in the
> ath10k_qmi_host_cap_send_sync(). This error message is not fatal to the
> firmware nor to the ath10k driver and we can still bring up the WiFi
> services successfully if we just ignore it.
> 
> Hence introducing this device-tree quirk to skip host capability
> QMI request for the devices with firmware versions which do not support
> this feature.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

You are sending the patch, but it misses your SoB.

> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

