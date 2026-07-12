Return-Path: <linux-arm-msm+bounces-118543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fjKLHUVrU2r0agMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1F7445E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X58z8cRp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cWyrGwYb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118543-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118543-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA06E301ABA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D859C399013;
	Sun, 12 Jul 2026 10:22:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A046385D69
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:21:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851721; cv=none; b=sBgwoFet/e4XFkNBPMmql0F/evUenEtDNyeKx5UvVXkA3oxoxkiyn5oMI/dOeIMUtl3aHW+d/WKxwBkvKCdtxqkFZKhD5i5M6s5ragA0UdduNM/V8vtyCKx4C4rDydeh1YzYR84/TmoCwi5FHQXKRFu73FDkVyoEKsWwpySm2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851721; c=relaxed/simple;
	bh=13CfmJwRvUAxg8d5tqY99En8DxiXQHtrU4BVR9zPz1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4ZOwFySjBdU1tlRgD0sTPJcbVQnfvGUkzDtZ6F/6Ojk+ueUEwIV++owIPoLkFim7tr94XHJJKPwLuYqDIzi3bZfuy7qAJ9I7g6m/UbWBhNcnfUsOy06ENBgIxYYcYV03PT1kNmOquWEpSVx6rAlQFXL/q88IytlAzmagUSydm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X58z8cRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWyrGwYb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SIXx1808243
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=euGwPsPogDlniuV4FhHgWZRz
	xcZ+x1hQNJ5g0xOwNmM=; b=X58z8cRps5ywNgg0ZH5F6VnwwvBCFv6bDW4o4X2y
	XjOa6whOhh2nd9VITGFOkzZ3HuhovVw37j4++/69sFS+3b0/ZhhA6hf+2iOH0PL4
	1zVGdqE7c5lNXkXjWB+W8SHX0VtI2xZMvv/oP4uONKgKkY8YG74yoEAovI7xD5JN
	DDIMddwjxtje+CrPvhk9Bf+LB9h5dagp947BdyIHCDnkDGfr5C5hdq2aCwPIZIaH
	/aRpuIEXlnNDtoaV7FKGCuIpnBoPkUeXPWLwlX61UT+4UH0BAknhRBLXPCg7wUYj
	40ios19eaDAiCyZYseDVxuPB4IqQsaByNOheIK3jg+4GGQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9jn0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:21:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd7905b135so443314e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783851717; x=1784456517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=cWyrGwYb3KyWRTjNaISsX+X0tmPAyB+XjHD94uMGHehLA//gA+AVDfAQ07rboBqv0I
         HgbAKoHxFQD9kYUb/XQE8C7Rhl0WU2CgvfIIxxIzN2ORgTDXvzxafVDOqkPTePaYSLRv
         HOcet4L9PHeiljsNTDjbgxER7oQrhDi8VB0mzzbjDJp+R8niydjC9Bzuf3Tp50eRXNWB
         V5gLbyRc4nUNPInRQwUSMoyKb7o8wI1KKDvSrz+Gf0M71o0JDjBhljDcU0tf1Ol2+siZ
         1UeeXI9O6R3yvKcQc9Q9jwrQ0svmmII5NJN3J6iQEGBTE/EiUOhVjGseVBQFIlpFT/GV
         0YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851717; x=1784456517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=H67Mcyv65MI1C3Bk7e4lGWB3S74CXHYKVZIuee7RIqOlrr64BQ1U03dv0CsMEYp9cv
         IDTfM3nItKVL2G0iCCA4bx/TGsD5YSDSiTJnmeXDK6DlvRA5PtgypF8zM6NXaGN8d2xI
         iEPtXMsXm48JhQbcNSjQ88bnX0Mz9ycRu2MmoUr6RgEFbp4vLu/4/ICrW9Ztb0363un8
         S+RVec13L1/2aazg4W8GE6zs0lohby/NnESUaQ5HTvyggYoGvdze9GF6PFfhPServc7b
         BuAHpJnfeeaX9Fi24gVHkPp1cPqQQzyu/F4GJvPpfMgO790GMfoK4av8PrnxWO+gP7Fo
         Cnag==
X-Forwarded-Encrypted: i=1; AHgh+RqLwiqDEo+Ftuw0Zw7Eo4LtJz9GjB8sGfPPzDVGkPxfRACzUaFZwQ4nyoKjWWiqOemOJe2ww7rQVg36uQ7O@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQPDBBUFNw755zmRa48pD3VDp/zseCEEBH8m21Pa60lBziNRZ
	tWoSR/bk6b73fCW5h+CDAN5IgSz8iZOGnTlXYg7o5Kf3TYZv8xJFYZbxQlWdYk51wwGkHBUry6o
	04WUkrPcYuxTYr6AFZqcxogMrfvn5hmolomnFwjOVnS8/Y73IY40AmrPVelBVdQ3Ky9Dm
X-Gm-Gg: AfdE7cnaF32+Qb1UveUy+hF58BF5eStfv3ylULkBio2MLKyFdlJHGHrhh2sEBhd18tf
	toB9SKhSyh+jK/bczb8YqpUVA8CXDpHrqNZDzOKEhVWNbrOFxBtHkwQUU2+avoUB1gfj1QoiOHQ
	DQ1hsXnMymZ4mx94cYCH+WoRKveORrsT2fDMCVayfzRlnmHim54ZnvAMkMhhzMfJ7zqGNt8PRDf
	TZF6l0xlgGFP3FTSvZnxMnBB2hV7ebsPPnS68Ed7Si2gP2rZHUL9ztg9+qzR6nwKqM+qFihJCgM
	dijY0tew4/VGqOnHy5hneDNa67JAK4bnaNk7sgSEujsA6TmmVeQRT+Fwi4vpF9zWa4oXKosDQLb
	KEkCUfJwm/TXpL8ApH+4V9vem/LB9s0vTFOoCK0cTgdwX7ShOhewX4F9FT0DCI0F3hyaJVgq979
	+4T/zKHI118djgm2jhhRny7Ah1
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242371e0c.7.1783851717371;
        Sun, 12 Jul 2026 03:21:57 -0700 (PDT)
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242356e0c.7.1783851716956;
        Sun, 12 Jul 2026 03:21:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84bb39fesm21064931fa.42.2026.07.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:21:54 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:21:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfX6UROIMupvtXQ
 bbKXZTnzV1+kkNUwzu2sWW/uJLkvsqPkHRfybqmn7gKLiY16IZoxiBC0obeORcAzYs55sPe5FhP
 jq+ADBVGNiLFIxqHTGgjT87ez50mTVI=
X-Proofpoint-GUID: qd4bMOsjZWiKHKmWV5RCdwjnvbPyqdSx
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a536ac6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ROdofPDD1fpM39RL8CQA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfX9Yjn7GUzka83
 O8KorTjmeQBkTbbOh+hJnEJJ/YpO4UlGddpXoSzX5CqKppnQVoTdF7Tsm9A/xuQTawG77QN7Rbd
 e0vUfAR9YMYykhbo6gk0JDBU03v8uAmPzCXfOe+t4fH0aLy3VO53LN1q76n/fXweHsj7jC2m3jS
 o6bjn83buLgLb2MkY1nWdJWWrOUD0/QdJJkuKQpVTEF31g8C2rNIm2s7iSra41PSxpsOw3OU06r
 SfsIZR/0pa8z0ZOGPlRBrFokVXlv1UibuLR/aUx0tT+dnKflfxx1Kd/Ee2BmROc8h7bJEe1ld+/
 3x1wTBEmh3xeR8dWfdtlUhTF2oG1iK6R+NOhvw76PyUtPVaNLydiWrTI60O1wtlthbag2LgmiUW
 WOD3Zn50bL6noCgxwUZsZTHKKrHZeWFJoqlI627/ZdOC8U0H+KIapTnG94oMyu08JMK6zIM9Bl9
 bMBvQpnRZZ5mSPr13YQ==
X-Proofpoint-ORIG-GUID: qd4bMOsjZWiKHKmWV5RCdwjnvbPyqdSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118543-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mu46u3pwlf2u:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1E1F7445E0

On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> The bridge connector framework currently invokes all bridge
> hpd_notify() callbacks and unconditionally emits a connector hotplug
> event afterwards.
> 
> However, not every HPD notification requires a userspace hotplug event.
> 
> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> IRQ notifications through the bridge chain while the actual hotplug
> handling is performed by the DRM DP MST core. Connector creation,
> removal and userspace hotplug events are already managed by the MST
> topology framework.
> 
> Allow hpd_notify() implementations to suppress the bridge connector
> hotplug event by introducing a bool *send_hotplug parameter. Drivers
> can clear this flag when HPD processing should not result in a
> connector hotplug notification.

Why? Worst case the kernel receives another hotplug notification which
gets ignored by the driver.

> 
> A NULL pointer indicates that hotplug suppression is not supported by
> the caller, such as the connector detect polling path.

And nothing in this patch makes any use of it. I'd say, it's
questionable addition. Let me check other patches...

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>  include/drm/drm_bridge.h                       |  3 ++-
>  7 files changed, 21 insertions(+), 12 deletions(-)

-- 
With best wishes
Dmitry

