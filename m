Return-Path: <linux-arm-msm+bounces-105826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL0QBII5+Wm46wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:27:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2C4C5588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D7673052B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 00:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C922523507C;
	Tue,  5 May 2026 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csm5N2rF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+QVO6HU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FF275B15
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 00:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940739; cv=none; b=UDb9Hbm2D67ENEGexN6XHc51RpWViUgE53YmsdHtxuAoyGv5kcJ4q14xpv4NjAYk2RlNZXhmQuZgmIrmhbHoqn62R59ITdNCyzcawqWfUPBXBI7ggMYLJvYvCW5rf2hjXgapYp2MRx3W6R7OsPt528N3XxvlkRVv0ElT/q5K6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940739; c=relaxed/simple;
	bh=4Vucpdbps+yQVez32oDVtzt/iw6YyMI2r6E/Wi913Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEg8GaCf2Kbb48EGAu2i6P4CHPdabXACMIgoGflVZvUubYMC9LSWwMVn3imNc/g9n+ypKJdgCelMutDyg3+ji6194MLeS1Br5PBTTBY3B/6DtG5ijHbNNytWnmd+d9pDT1/JxWbsLZyuyeROvEpcRDxzzUrLwHZZ2INko5VVhok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csm5N2rF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+QVO6HU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LAFAn1960770
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 00:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=; b=Csm5N2rF2fRYIJOK
	b4r0Jj8d7YHdLch1vLDOsvt3jArD3z1S7R0u5KKFNK9Ny+pA56wNZL3wBuuTte4i
	WWDtzdH+xFsFmeXQI2IEO0vq0UmlmRN7tcnCq2f0xQ0HwqZfWJepRztKZLXK5ZP+
	1f6WnTShDociysdhStNfbv2vDV2LgQAiQAdCt1PVsjW4M79C/KWjfL8I+a8J8Qn3
	uApVDlEtQ85XvIaeC9e3+RIVUzjy4S8qsdceUgbrQpgrSilaj6HUUBmv+xqAPwRQ
	OY7GGI0CKpC0ICYnqRIWTHn4jUt08IE8ALGTVF9kKF2LcYRofgeYRSI/qkIuCL9v
	h+Ikkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dt164-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:25:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso113547551cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940737; x=1778545537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
        b=c+QVO6HUSZVI+apWBSNp+TdOP/0gy6UHi9nhBCjzK5am2aeoA2uCKd9dmtSP1h8W4B
         PHYFssauz9F8pH5G1kety3kbkecF82gbu0BWakc4AZhnj/Om3BuqgSJp9HENyBivqA3x
         PU0wQawnJXKXFdYMgb0vzCqKn1tJRxjahMi2WswFzTUpsLojmoMQrksNT3g610aitKVs
         zKpjp4uJQ4JMqvOMoUlvKbWtNDOCXCCJisOBtuxvHyT5/hOKnw0cKGrRnndhXyJTjb6A
         rIGJ9Nt5nXu0FEq3WCAJ2TDtZ+998DRJufX55MqXvX8KdqYDn2QGUMJfbmVnJFtnvvqG
         vZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940737; x=1778545537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
        b=h74hZUP+B7v73jnlbvESaGuDxY/biVPu4FXxxi3E6HoOx9/YvaVNZy+73fVsB0Njc1
         XM474J3njDz9ZiR8AlrcwP3MsautRwQvPfSO0rVTo8ObYUyNObzfJgd62McKdxv/NsuX
         t4je5ouN4KAD2RckQqDS2m9XLptCUU07swjG3Hmrjyw1pnSK7nhJ0iD9aeHrbBKYrR9P
         S9uQSV0K9wJEu5vkW6rjrF5CPic5VXRKKDcc9s7x/QdG9eY5SzOlDEI7d+cZFVvqxROG
         vjfFCNQJ3dj085hw+X1wSDLBTprIl79UXtS8VLHIPyMjXk+HmVzQkmI6O6KomBq8J0md
         2+cg==
X-Forwarded-Encrypted: i=1; AFNElJ/57qGdm8GKdT6F5DeOyKilQAD4SgeMrUj4tvOVtgbJxSpvV7CEJ8bDYy5o6jWd3getr3npvBJ8rWP3muP8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sc+anu4itQaY2okm2qZMAuJU4Mtxs0BDqLm/iP+rEO44163n
	8BQG9Lf8/HDZxP2GWj+93hltRz51EIB9kETMHVerCGtqZpPrUlV3sl54Xs1f8fORNwE4XuktI7F
	h7I7xOhFidTOAxUTS5J4ElOzzg9l4V6Cirz4SMwjj3bj41QQl58kOQBnRwleFZkn3eW3f
X-Gm-Gg: AeBDietv8TyWvbsxZusU4zBKiLEIDdpwYqx7zqljUMCIxXvWAZ4/iFlrFXZxyCrKZjb
	ud85m1CG1JDCUSpkINalzWOHPg/Pugg8MSZTmEMiN/IQN0etAYErld542mnAMxGwhfWYb3Qa/wa
	nbbALP+ynExw+1Z3hw6k0w4QUqfJ+XIvPAlec7gQX0jLv37Ixjp7JzgoabUvke0hKgieaYA/BF/
	PJQ0Bc7LfPEohYF+Wh711IbSsr+RUK7Nht0vfuDSPmKV17PUtOhl/sY9DfCSLTZ/TWmLmHeZGeE
	MP/hIVwg2RV3WPhCYK6I293hRS7lH8rGu7oqsBmQ3dRptw2R2eYPgTCdbo3ruEfAUK7cXKQ15rO
	K9T1zQ+7KBomPgF+gcp/k6ssdkuG3WWi/4MAX4JeA5djxIDMto/qcwlzJvSbyTaqM19tA7LBcYL
	D3qRMdttaW9NNhaFiaOc6cWi2GVcMF08o8vXUwothCXXaLkQ==
X-Received: by 2002:a05:622a:4d49:b0:50e:a1ab:114c with SMTP id d75a77b69052e-5104bef1a95mr179779351cf.32.1777940736562;
        Mon, 04 May 2026 17:25:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4d49:b0:50e:a1ab:114c with SMTP id d75a77b69052e-5104bef1a95mr179778871cf.32.1777940736112;
        Mon, 04 May 2026 17:25:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:02 +0300
Subject: [PATCH v5 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-5-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Vucpdbps+yQVez32oDVtzt/iw6YyMI2r6E/Wi913Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjcsYWHgFL7YdrLbWVw7Uldjtnf9eJreeqel
 uySv3eVNaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk43AAKCRCLPIo+Aiko
 1eTACACX9CkVnJY51k1n4kpTPLzSZQIBw8n72ppEnAr7Nx03zRbl3kWkZ2SLmNSxZmBWptrTJkk
 2V34Y+p2v9crcEfzAHIMNeS8VirAvNf7W8vbsCnwcpwVM/tgWGvJ+2h5OUEU+aQf051uVIH3RwU
 Qo0u5M/OmEdDCf6HlPLdzCiX5rVxYfDY2itb9vjZyedZxwEPVVgSi9vdLWIYfQqCDrd6IMT4rwx
 +RoeL8xzHgeqYVMa4DoG+g09ieOLTEZS1A5GIPMSdTmPCbTOWLbecZb6QcJEtEM9EABMaVfMeRL
 2xM6UMzh2Flot0Vun+McCHFK3C3Ydm1IoDmqYPZWr6V08vSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX2cHnoqE51D72
 eU4Bv516vOVj4ca7+C95lUmyfR+PN43r9CoK2YfMb3CABKzBSsngepsjxjRedT6UH8KcKNUAtTe
 yyV7e0oa/k6yeq1h9DD0Jfpo/E44cRqQsX6lJ+PI16AjLk0WU1xyNNY7F+QtwBMjDjPBAugJZS2
 7lKt6Ve1je8+ikaLeXjDAEB6y+5KMOsZ1WKVlhyTz7WuYnkREEoYCMB3ZMQs5NOaoUNPUFl79NM
 6ckzSdV6HmRmuLAP7wntwRBORJmJn/E1tukNYcJXT//vehGpSqYbqlqbvSaen2aHUuZYQFGN4B1
 2gaAEBPcX7ICW48Wz0pCkTX2BaGtF4d2BK+qF83PYJ5OZhJSBaayXxLG2OJPZ7Q05DS7yCRUcPl
 Pt65gPypfSiqZkFwO1rnDcbzwme1Q+IKhRdVd68cXvitpd8zPGLwcEg3Z0hq4bUQPh7ULgGwLXF
 YBelq9kqt87nRUhoVKg==
X-Proofpoint-GUID: KOH-0LszdoCgzxs3KITbLjCwYI2YACUv
X-Proofpoint-ORIG-GUID: KOH-0LszdoCgzxs3KITbLjCwYI2YACUv
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f93901 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rEXDA0v2x0ZtafRnR6sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
X-Rspamd-Queue-Id: 75B2C4C5588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105826-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index e5e6e6a156aa..ecfd4fc1f210 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -201,16 +200,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3


