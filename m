Return-Path: <linux-arm-msm+bounces-112965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j72YBbdVLGpTPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 20:53:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23D67BDF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 20:53:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QyzaGnik;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KKhiUUHt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DCF1302770A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 18:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B0C3812E1;
	Fri, 12 Jun 2026 18:53:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F08F36CE10
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 18:53:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781290420; cv=none; b=U8Cd1Xqg+SUocDLveWfF4WYJmnGz85OjnyAxjmbLhO5HjYIJ+QkLjBe2SuHWAoDQ2hxjpRpSFRJ6JWeqFtCfkpMmB4dJw9BcS2y5uoCnqLbtc/0qNDx8fDKLup0fzw/xCCSk9UTVbB3z8/rp7t1BygqKlYHdtQVEInAF73VK9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781290420; c=relaxed/simple;
	bh=furqK1o6jfSd0OFBbqBOE8PH1XZp1rGcc0CGC1Eovog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaZUYuoHmQBO2LucmtmkCi7f3NxfOiDn7DT38fL5ZID/scnIrLDBEehU4FudoMLrAUBW9LCUVGjDv/lshmZ0RYza0BzHF9ETqv+SWtBnJukhPhk4iCiw0SFD7FaUQJrnPBHOd2l53JGt5ymGFcutFpZFHQYUbbJDFIy7XbnS3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyzaGnik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKhiUUHt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGWSrC4156797
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 18:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3/Hm6Xq7WCrgTyuR+mYm99o
	byQyGcdOpmpb0F6ke1c=; b=QyzaGnikY7lvP+gYNtF5B5gsq2WmUJGU6b/iEyc8
	SM60hoYQ877RExS0N7DGLbXtTL5/6KRJJw7ZeGH5x87tjPexRkoTotluUY0BnFoF
	HkMji3P7vnUoJFsacAa7h3IxAfTGy3w+v0t6lhiq0m2CPW7jNKXBP9dy8oZQAYes
	/x7yvsuAm61BlmQgJFdUBuRG9rWEKgjMq6Ve3gPdCoUfGxiYeVrB/2byyKH95qPH
	2lgtErJZxVrg9WL1eI0Tx9nasXDLeiH+aWXhjUscB+gmB6mXz9YnPbeuLzbPtaHi
	OJTYOJiWMIh/LNLvFxLza8JV0OnU+OYW/dSj20tJKJptdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcmcj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 18:53:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156ceb551eso196622885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781290417; x=1781895217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=KKhiUUHtM8dA6ZzFuAYqhg2LeIDehTRz3Q0FInDEQV2jhvJZc7VMxCMWhtVPghsTLW
         r8vzIARQDH14HA6jxtYqygxUGh4IxYvQbsLbr0laQDG+jeIIqCK1pR/9H/mcqHlRzLRs
         C/ytS/ro1pQk3jO+nUNry40Vq2v5LphHmcT7czp+CF8evkZZecdyq04nEJPlGZ021fpE
         gafdWc7uz9o3sxXg53CbLfvj4olS23PiNk5Hz9pt3iQy/r1lBtMge6S16Hto0w/MvUN0
         74IFUZiL6LB2id1QbQAFPRMJEviQ+lhO5RC5DRepm6FGzUB+AKiaKa4Ve0ZCRS35tMig
         at7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290417; x=1781895217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=QZSEyc+qf7EhkcXcc2kgUv4Px9Jts8Ou5SeLJAQrtZX06Frql7SYIow/3e2MK8aX0/
         p9HdcY3t6Q+vT3hKzPfbcQZz4SadEcS7AeTqngX2pj2pae5nPNjbCYoW8e69g4RvC/OM
         qBx1YtHYmmqQ7OoFJJJoIqBTgapb5EUXG8cgX/0BPukccVVgXPPLywvXXT1xDXtAfZXc
         cZ29lilyHHxRT5+rqMTOWpIQqpV0XImKYc3Wqb4Y9DhXzSvN7X9N5BQPSD+5HJltp6Eh
         Ga936gytGsNcaRL9W0bkHO1pxjb+H1W2pIaoMTUqhiSeZLKOTx1w42LxcwhRqGChpZ9G
         SdSA==
X-Forwarded-Encrypted: i=1; AFNElJ/z2G09z3aUKy1d8lcJm78EhoVvFRzz9dBZbMCUXJodn+RX5m472qpEAXD6wQGchjBNpkWj970vg3HJ5J8x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QV25I2IgRP5977h3Qc+Idda0nFKwAg7gURrUExK5p5u7Z0bP
	7WBZPXSiz2PgzCPcnlK9Ha6Q+TadAZ3/xNellNfmZVe3XjXBoCuOxjxekSDPtjmWzS6kv08k5oY
	MnKDEeNj/T5kkJjQnpxuI140kr0m9t3tLM7ZmKGuWviDxL2WyAG5pWB/ypWHKma/0g48F
X-Gm-Gg: Acq92OGrUPJKDXQ2QIGxZCBOHvPGrHMej82XlvmSNeO+oql6MoCp7l/vxTRhF4Zcp2z
	EVMguxBNVAQxIz6nIzWlBY6dEPBPbERUtJpWtosC069xuy51Ib9mDRGgiPA4S4aUDLYMkf5SDu1
	krHRMpWGb+69GwJYs3uIQ0YnYhjzI630hr+AahvJmOTL57rRmAW2jxC0deXnCN2NXG6CpzUINAW
	pauZ3acXlyRyvLQmFukxtJxfUfN1oYkftNKeJ9nBHziYkoAO+keCCkfLv8Ky02nHO8/UGLFvCSN
	5U6ZsAPae3DdEEa1RdRLKRsnMF/OwPhKbVioBDwMMyyre8jwAcJMsUh0vqXWmOpLSLqaPfBGjkP
	lcnnnv+aLtUDqE6qn0KQ3gW6yuY9g39XRR0eYlT+0nAkmXBFL+Tw2YoFhjMFNN0sYVKgpekeDxn
	aaZn6qjK13DI31hLHOtTFnzwQE969AbfMrcD4=
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559906185a.32.1781290417437;
        Fri, 12 Jun 2026 11:53:37 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559899485a.32.1781290416844;
        Fri, 12 Jun 2026 11:53:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm726479e87.59.2026.06.12.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:53:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 21:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/8] drm/connector: report out-of-band IRQ_HPD events
Message-ID: <hxto2g32oyfy2tlihdgpjy7bwkhxp2cdw7qnf2rvpl7g7jczen@5js56gor3z6t>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
 <20260608-hpd-irq-events-v4-1-30b62b335487@oss.qualcomm.com>
 <20260609-bouncy-tomato-dalmatian-70ccee@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-bouncy-tomato-dalmatian-70ccee@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX0rU+IDbqY+SI
 iU8r4R0KYLlYq/DVVwU2v3yCg4+WY5LuFW5EAQtlJ2NGyh7RvD9Z40z47wiYgYQsXod+MPOIVjv
 EsMjOgvpQEwvzh5QYsU8ORsQ0JkYzMrpUUzULGirbYsjqi4ycHiAVTKhGAR+nCaQRMViKquIkik
 dnQflH6PdA15mJcOL0bIYyHZ0A8QOxBmX/3IqT3LreBghpKk1Hvg4dO8DU3zhPVKeesZRnW4bzK
 61WHTmCxLdDr1L4l5+IH7Vdh4iz1fFe/pvo4kZW0wYNZGfwKfCg084xz3+ho7qpo6mQwqwk30xZ
 TUo23CJ7MhsF/Eu9ubBa8vBy7S/6MkMC2ewa8fbeSFLxGupLFPmR3k6kxpR8FAPUkNSmgXBgFJb
 GaVV+SOzE+F/1ic0x3adkCh5LysELaldYBBMjRpuXTj9tIsFLUtvA/zYrahkvLaZQ84HfZDKKFm
 lf6fsfluRtVG0osaJlg==
X-Proofpoint-GUID: kxmzNlFCZsTHEDbmb9QZHizTFcn6g-k3
X-Proofpoint-ORIG-GUID: kxmzNlFCZsTHEDbmb9QZHizTFcn6g-k3
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2c55b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Qs5g3gW-Ea0FhcstOt0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfXykhuAbnZ7IL+
 lLprujdMxICYBnNWEIRjV8ihK08lSegKIh6AObblqCkaxJKTg6Qozy5kWWGdKlKfizKRyH0WDWr
 ZAoBo20GKdJQOnUcsWuk1F79iNFEJ4g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120176
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,5js56gor3z6t:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F23D67BDF1

On Tue, Jun 09, 2026 at 03:20:01PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 08, 2026 at 12:33:02AM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are reported through the bits in the AltMode VDOs.
> > 
> > Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> > and extend its interface to report IRQ events to the DisplayPort Sink
> > drivers.
> > 
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
> >  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
> >  include/drm/drm_connector.h              | 21 +++++++++++++++++++--
> >  3 files changed, 46 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 3fa4d2082cd7..bb128dd0263a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3502,20 +3502,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >  }
> >  
> >  /**
> > - * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > + * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> > - * On some hardware a hotplug event notification may come from outside the display
> > - * driver / device. An example of this is some USB Type-C setups where the hardware
> > - * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> > - * status bit to the GPU's DP HPD pin.
> > + * In some cases when DisplayPort signals are being routed through the USB
> > + * Type-C port the hotplug event notifications come from outside of the display
> > + * driver / device. In this case hardware muxes the DisplayPort data and
> > + * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
> > + * pin.
> >   *
> >   * This function can be used to report these out-of-band events after obtaining
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
> > +				 enum drm_connector_status status,
> > +				 enum drm_connector_status_extra extra_status)
> 
> Thanks for the renaming, but I think we can also rename
> drm_connector_status_extra to something a bit more descriptive now?
> drm_connector_dp_oob_event? status?

I did not want to introduce a DP-specific interface, keeping the HDMI
eARC HPD in mind. But... Let's get it nice for DP first and handle eARC
if the need arives.

-- 
With best wishes
Dmitry

