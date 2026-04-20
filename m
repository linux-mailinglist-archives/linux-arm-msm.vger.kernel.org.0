Return-Path: <linux-arm-msm+bounces-103859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFYzHmq45mlJ0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:36:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD2434E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C73303817A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441C437D135;
	Mon, 20 Apr 2026 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTUN+HLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGT6AHnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AE3CD8CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728033; cv=none; b=Phe7tKimhcCvnmfCxzQiQ07TS1alkEh2ANnws7KbbEZqt4uojrcgMxSgR4trJbkQ4vG23ZSGawLSUqfma5wPDJPdIDplMYuGM4A/vOw5/+Y7gaO0rhe8L/MqNzngUqxAcOai3LiT7JeTLhTvl8bNTGf8pnCCUAtLZYP+BqNOGsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728033; c=relaxed/simple;
	bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFOeh82+GIew5O59Bf4ppBxd75M7Cr0C0o2H98Ec9BfLMotjSilerj2leKvjQr1JN9hgn/9vssXJSkYISAH4goXi77N58DwKQeVO4abV9b953khWvOOm4FpbhDLdm/mrAYEUCOlMpgAVYlLWTvkPoa9gCvW1n1aeVl/2v43aC2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTUN+HLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGT6AHnN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFUk2K2755799
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=; b=FTUN+HLGt0KoyYp2
	rP/fFnWVIVoXmSIesJiUhpNyWdC5tbUpLdxRY+pd0Tq95/s4RicBWZk7dw5PFbWX
	RtlATGhVWv9ppexR6q20wp3YF2RNTNgYxyEJC5M1jiAYOij5nZTCIFzLDmrQWhTu
	lD1OonyoLeEoblZVbt3AKW7gvDLbKfXhLWdDZibJx9qDItmE/ZHh+OOHrlSLF4eE
	ex+NAFNgvRbxXlsbWuBLq2FdWvuXda6CQJVEeIO1kxuVbpmwc6Bq2KDl6rAox/Oe
	Zl73z1gxPYFvzGeXRfLjNVuADmcKj7z9PyuzcGICHGvmoHKykbJhFPeYME1mKDei
	uKbZkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xjvqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so12767341cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728030; x=1777332830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=SGT6AHnN6T7+Of8VR2kenmQB+VxGBbmPh8jJ1WUMS5p2mRBsm9Ar5WItQG9f19kO6A
         +vasu0IsACVs3BPN1cvkABYaJeth4d6xuCaYYnVPZ/MVPU0unxnOSuwp8MEoS3AHV7wj
         2yVzgCHF2YWxGh6tKhmA58xgJd5c2ScPD8WW2SheuS5RF33nAcgrQr0+C3GMSprG2zCV
         6Mo2CndiwUy8Nc9dvf3fuXRFeuVjLLice2v6zS4qjm8WJ4SC/dPi6Y/wIaZUa7C6JPxa
         93Dbud24Vva1/HqTm5KjFYuO/d8S75zpF0kE2MyahNU1jkDas9uy3vUOfrSPO/oPamAa
         jHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728030; x=1777332830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=FlejpWE46/ZxIiYXOM0A6HCFMyWHuRRhFIZO9/L+9QmBwPXmVcF3Nx1lsIi+LyUL/+
         0FV/JBR0To0iXA/n5GKGLgF7rmwmemz0OoP+tBHIJ4Wg9H3U39rKy5Ssd5FXULi4Zhoq
         1tih0gTZVB9cu1LpPopEUN54DJMGpL8xNDp2/vm+U+0SVfaA8VTWygKJNEov3RxBuICu
         qp8N3N8VoRoMlhOWLa4e7yTpfdPVn5jbz5ycVvHRdU8+/nNBqspQX8R4lVeQcwJxZyV5
         3dFJjlqkQqF03OWltZVPnyU1OXzZ0Rt1jjAUcSzOqaf1DQLrAIn8PU1GojQ9NXP8qpFc
         0e8w==
X-Forwarded-Encrypted: i=1; AFNElJ83w7YIBPxz3wDsS+REwvfsykNdOm1UilyqPowUNhXo994f6GfvsiGJ5MWAWqhthao2z4IHkoBaMLJ9WuPJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2W0nraFVc77zNvW61+e8ra3OFK75AMc3+LBXR/DZ7ZEGc1C2X
	0UIi6a/qeGeKqrlu5UVN47/24wOYhtFdLjqqkBoy/B0NyKGf42wggLnWovKxY1CiaKCiooTQ0Qx
	d2jrMNoFn6rFnBNsc1ETvfm07GoMQH9ppnnc5OS7xrfqjlIlAP0pV52rgGxpVC1MsBZ4w
X-Gm-Gg: AeBDies2GIUszyZ+ycoB9AA/lQOU2qt74Mq+5u25u5v5ie+4dOQaRsSTZjsMYHIdmkg
	NDz8xy5KotwKiCqoM2dqWfj5aTKCx2TkTpy5xbobvl6NKSkbr6UL5ILa9JaCZwAuNfznQDcXawo
	BnBnEwPAmVx/D0cXwd95140//PqyGgxhVF9SiOFWZr387PvE1LkSbcTNY0y0hVp4ROqhzgAbusV
	d+PMu3QovRE/nX89VpoWvBtIVTC8RfJ3ErIvym0c5TSM+RR0mLflQ8VQtH5cWm5wV0scvllKxe9
	On4JzfQZNMGpqjyDbKpeFoHboY3uPCkD+L1UkrulDxoOPbAjRB0n+LWomUtTQzGEBfrfkv1klTi
	w4uf5JSSMtU9gh8YkHlIsPX2BFOwfQ1NQgR0cEdeXhO0OmEZhqexR+6AjKETSK6QecJFmLQI8di
	tI86K/4tDdFVxqirZBUFNPWT/VvGiQ+Xj/i5H/KEyvjeuyFQ==
X-Received: by 2002:a05:622a:394:b0:50d:863d:b50e with SMTP id d75a77b69052e-50e367ff503mr244884371cf.3.1776728029525;
        Mon, 20 Apr 2026 16:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:394:b0:50d:863d:b50e with SMTP id d75a77b69052e-50e367ff503mr244883731cf.3.1776728028992;
        Mon, 20 Apr 2026 16:33:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:33 +0300
Subject: [PATCH v3 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-3-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7164;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNFfiDI/oAjaEPT7KXRvUNtjKmblgNuU/VC
 RcrXoPSZnOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1bxkCACWKX5M78zNcjPdthzzqBCQACFaYi9I7XaBJHz9vGOGMYjyghgnA1q5XxDVV7BXuJZmhd3
 20S6aNDERGrfmYWNpL1MQWraUEPDkseJMpCb/ROzY3pzMXazV6pQvmw2gvakyuOIOB6LJo0HHuB
 JR0ZlOUoZO3/go41L/QfJI07EsfkO+oiYcYpFZO/BpV6xWwVHf8lUa2XMaIS6FdCeHyWyfy4cwf
 SePs79NGlazQjPzjfAWnw1bnnxKk1uVNUkylo+38TgEtBoOS5HVV0WzmNIqI1QM7XKdyQwS4exH
 wxxbeD16R5xCcddl866D9KYU+bg9SAyBXCUs+2WQqm2iPmfs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX6pT9Lgl19tEX
 zsbpfQqjfhgncsNPLY/lMa/0o6IipoI5xWzWfJsLihJfeCyABTkU9c5OM4NlXx/ica93Pz6jAP/
 3oNlDSfOm1K8r/87dXqFCOGRkyFGJMG+G85uvXeOtvcn8LJ9vzjE8z3KOVrAnd5XVn0h9C8+b1N
 jauySp0z6qcLRI4D3+a1NP9wOJGcsWwnMpsI9Vu4Qym1HUi5mYeY0kqY3sDBW8wljHd1yIcyNTy
 DvxSAgTSEiFyEQhWoOIYFeM8nx9tlApf1giZznK2hrpkPj0hmOL6fB01jS0wWfRuDUFoPoS1IoQ
 yMdpC9qQrFgqDAhSe24t7u1lZ5dvhc5yp22rhU9B0RdppkUV099TqDRGn+8QSgjZanENZHbKQ3A
 PbAIW7s0GwQNQtsV0nEfSELkkwT5iIeOEsMN5bI0gqB7G0I3Kb0becQGbJ/VTbtPMBpzkjS35Up
 yWlz6XZ+0006kMjAFOQ==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e6b7de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DVv11bJY7cVfPIAwnKzliFMdfHzh_Z1h
X-Proofpoint-GUID: DVv11bJY7cVfPIAwnKzliFMdfHzh_Z1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103859-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1FD2434E55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 17 ++++++++++-------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c8c3301cd936..09c3f5954ade 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..f9a86886b0df 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e4672fbd7a8..2cf604cf02db 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1556,8 +1556,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


