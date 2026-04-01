Return-Path: <linux-arm-msm+bounces-101224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDQgIl2TzGmbUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:39:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E837474C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF0A03002D65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B060037F006;
	Wed,  1 Apr 2026 03:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIajPlXa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N10vhIMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E103624C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014739; cv=none; b=VsPT/BXgHn7EJ+Tes8hbitsWyhTNsIIIBHaR0xOgsi8l+i3SYYF5Zo+cm4HpoPCR5PNb2jP9b06zV+AxQ718eBG9Ro6oUr6GmTNXXQGJnZwCNpE7IxaY/osKExb28GMkx84g1tYV5ebmeczmCiazgzHvwgExajZ9MI3+yfdVSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014739; c=relaxed/simple;
	bh=S7FOJT4ts1TJI/oFCfRdpPixtPPnf4IHzaUtEo2nS7M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sc+KDQLUxBQtXw/Q3yFq6FXc6QikTjla6TGRm9U/zbOhz1CDkJVdvYOnVb3Vh6h0YtEEks+O2XdQnUzBDvtCXTa2Y1L3vE701xmu837vzEkDnMuxfZYh7D06vCGHweh6tYpXj5nonCJHSfXYIdjCOOGzAJO5Y5W5vHjSxPnDoMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIajPlXa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N10vhIMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IxgZ1005237
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2kLHLuUfXgHXpsnoBEtKL3
	EbLPGLR7YyXYBSSpUL4Y8=; b=KIajPlXaOqbrPumBeZFSb1bDHNe3AUdj7ar/hK
	2HuAw/O3irC7TMfxmt5HIm/KvsRIju7HS+4BM/LHD9wQ5kVVjoPePn3puuDzIyzm
	eeE5xegfWf9I1Pz3NQH4ldu8Zs4WHgLqEdu5SIL30EfeEez0AHZw2RBfE2dJSj0w
	Z75daWoL33yRBW5tvOs9ATtxLNOIzX6Ob6lwX/pZ2KzzEpyq39hDrC9PfBg0DfmD
	P9Umtn+cBfMCLnmzIh8VmibWUEGjmnZkdx2puW+OI83lYw342D9lZ42ECoIJYsCd
	/KA5PZiD52Lieba80Ligh75cmDUxCrcna9VMK6fi/Aj9JLqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjg8jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:38:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so166372031cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775014736; x=1775619536; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kLHLuUfXgHXpsnoBEtKL3EbLPGLR7YyXYBSSpUL4Y8=;
        b=N10vhIMu7trRLwsbqsZAkTY5v0SReKlOK5AWyw76QHZ+cmZwprbcRmVMlCWRPk3x14
         gwKq3vwGDmT7u5gT7k7xZ59DTQ+FbFhKhCGlJ5vmPiEXcaKXlJlEfnCDXHGCXYfiCLG6
         zvuCEOgBTd8g5DpFaW23Bum1Gpep7/1AdeEke3bGHWcS/DDlDitOPVW14NqqrYc8sv+T
         ZUZJlnP0ojuguE5V52cQqXkVXLexLujidTRER0DQXlVyW10dcss7FMX6DEYzAEunETqb
         RYInmQjzTKXpNkuwQDj7FuqzJVo+k1FDeUEAczlPe0DKPPuue7qNlP2BzilA2eKzy7c+
         1mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775014736; x=1775619536;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kLHLuUfXgHXpsnoBEtKL3EbLPGLR7YyXYBSSpUL4Y8=;
        b=BOnLMV5F7XTZGGEL22iiKorNGZ+F4IEE0DRGH8ooSMG+x8d7qxIoSIj0eJHqgzSwec
         P+lhU8epDqiB1fs/ehI4oY3fjpyX6PR0FpSRkMYbivp3IT8H6u0GLA90tKPQiUavTOVt
         obi929UomulGZ16kIthbSGmop1/Ka5HdHB3xZp6+rU0aerWVctld837+JJm71/n2VfHg
         PKyfzjjSzR5yUy7t8N12W+enn5E3AD+KtDsALpnn4bexa7OEwes5dojHWWRJeCbKqrXX
         R5J/6AeVXLKyNiJBQaKE5dwfztsa1ds7GhB+PPRQrUUxkCh/kkWS2PfzqQt7irXoHrFA
         mTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlN/1exPyq/QaYBYFZFkvpjRzw2wlI7GYHEy5a2CuQO3xjwCeZIcnVpQbDqXX+nFavXNGcDh3YJoZgVYTO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWP2COW1NgnfgPO208ZV0Jdpzoy0E30P/sT4nbic3qDu/NGx0A
	v5IyaoMJ4WVAQ1bWq2NgF5NDhRsJY6RTabaCJfFMzwfTbXeStVTLamcuLJgfWkm8X4SKTzqrKco
	SMI3yCqygmABSM27xXmJUgk/Jrddo51W2tvyvowga7qH5KCX/L+Pc5gHVydhyXq2BvXUD
X-Gm-Gg: ATEYQzyNomr2aZcpFgfh3IwZTF63EhE5HXjWHQXZ8IDSvI47M/xcrkIe112oBUapUlg
	eTfN4ZT4vthoCgIz4esCxRW7Kbh6GqDhCU6Rtb7c7SuhCQPI6Tu+o2zne4DYplBzZefJVuLS1Zb
	dNyYJyWX9Q7J4fZphtmse2XEj67ZuReEryfJccGzM8RMI9OBO3s95pBgShboXj9RizMYMXvmGnz
	imfQRLYurbr2Qy1ROONJTf30B1a+brD+XD9rBy64/otI5d5PYbQPVYisFT71o2wgHj9aLHQcqbh
	/H6cyyvZgDd9Kp1lLncsM8qqjHHPmgJOqE/HogCdXmJd4eaU+YRqMh8cZvBQCW6XOZJgqrxCTwX
	rkxJruQTkw+OUjemU4x47eyYToeTDtUGPF4P+AdgIwQXRTDJNK/AFFGq+moFwEr5F/dRfLFlAx4
	7Q+3uM3ks+djkXHViwQbrMfeWVwzcCgyvzOgs=
X-Received: by 2002:a05:622a:124f:b0:50b:352d:6b5c with SMTP id d75a77b69052e-50d3bdbc16emr28859321cf.64.1775014736427;
        Tue, 31 Mar 2026 20:38:56 -0700 (PDT)
X-Received: by 2002:a05:622a:124f:b0:50b:352d:6b5c with SMTP id d75a77b69052e-50d3bdbc16emr28859141cf.64.1775014735943;
        Tue, 31 Mar 2026 20:38:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm24404851fa.16.2026.03.31.20.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:38:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/4] drm/msm/hdmi & phy: use generic PHY framework
Date: Wed, 01 Apr 2026 06:38:45 +0300
Message-Id: <20260401-fd-hdmi-phy-v8-0-51b0e98edf6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWTzGkC/3XQy2rDMBAF0F8JWldGb8lZ5T9KF3o5Eo2tVHJFT
 fC/Vw4E4tJsBu7AHC5zA8Xn6As4Hm4g+xpLTFML6u0AbNDT2cPoWgYEEYYw6uHgYHBjhNewQMa
 MorgfjLUStItr9kP8uWvvHy0POY1wDtnrh0FRTxTGWFDUYYIlwz3EsHlzXjqj81LCZ6qnS5x0T
 l3K540NscwpL/eOlW34RnHECdrVqQy2hTVaC060k/yUSum+vvXFpnHs2gBbq8ofhEAUsz3BG8E
 VJkT7XjhqXhDimdg/pYpGWD9YpDTnTKIXhHwiyJ8WshGGYee8cooa9Q+xrusvdkUgj70BAAA=
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5065;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=S7FOJT4ts1TJI/oFCfRdpPixtPPnf4IHzaUtEo2nS7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzJNLqjDU53LfSbxFzBYYoWsug4MURgItWCpMd
 B4klOZbf0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacyTSwAKCRCLPIo+Aiko
 1R5dCACzqqBGYmeUXNgyEYFHuAylviYldq0HtOXm/NeMZB4urlL5dJwY+4G/3FUC/j6yvI+M8Rv
 NdOoVotFKBamjaW41b9W536ZhWh7EP9VYPTo5hIbPL7UTWpSOhZIXZl7DMV+Fo5/r1WxieAfqxM
 lYi1N8U28SHxBPDLkkq+m4f+0PsiWHYRGHgC/BWaxlq3REgQ7GqKGlwwDgen0fq+9nnFVUIP/tQ
 gWo/gQrvpeLFBGd6U90tStkBTZQ8Xux+utWrKL3VWExMCZ5ANJ8jVJSI90KatraN1TYLr1Y+4Dm
 5QNUq3qUrc1BbvPs2XFUwSfwuEeU6Qlax3OkvMlMK9lMWYm8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -6KXnT_6-vxywWxJDHm2g68i2qyfDwaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNiBTYWx0ZWRfX6Bgyqvsfg4tN
 ZXSubFvqi8cCcGsKUZiUC/UU5DwsXx4tdAPWDgjTTzYpTfdimHfNa7OzVOL28OvdTVCMj09JJnF
 lnGc6aJnMbwGkBwVbp9r3TKo1EhwXKjwmqqo/7WcS48lkra5VfviQ1+QuOSVK1gc5eCt89Ar3rI
 7oW5sQRpIivTLlXekqPI2BurunqB3pUcLrcUtmOyc5vniFjIVAV7cTTOfIZcyltge5GDQbnC6EE
 K4Y8j9EEpWKS2K5VSI2Lz6N/p6rXWtt0ammvSXqD4leGR8Egio96GT1um3o3lxdYa8Haw248KRb
 olB6QgGKq9zzIWHasZlYeiHganoe5H8Q9ylRTZAP7XxbvmjBXWonNLj1gaW6rJeplD/vNDLFHbl
 jzIiRQJAIMg9+focZ6e6whNJaQNyeZo6ntPKrwKyMQ2Uoc8Sjl5zHkw2OAzVk7WYfCtz9dcgUZl
 9eyN/6979zz69hkV8ag==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cc9351 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=aG6DWvB8Nz23F0sxf60A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: -6KXnT_6-vxywWxJDHm2g68i2qyfDwaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 238E837474C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: Merge the first patch (either through drm/msm or through
the PHY tree), merge the rest of the patches in the next cycle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v8:
- Rebased on linux-next, fixing conflicts
- Added missing ids for APQ8084 and MSM8998 (Sashiko)
- Switched to pm_runtime_put() (Sashiko)
- Fixed several missed *1000 after pixclk -> tmds_char_rate conversion
  (Sashiko)
- Fixed several math overflows (Sashiko)
- Link to v7: https://patch.msgid.link/20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com

Changes in v7:
- Fixed the build issue between msm8974 patches.
- Dropped even more writel / readl wrappers (now from QMP PHYs)
- Link to v6: https://lore.kernel.org/r/20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com

Changes in v6:
- Changed MSM8974 HDMI PHY driver to use FIELD_PREP / FIELD_GET (Konrad)
- Fixed rate recalculation for MSM8974 HDMI PHY (Konrad)
- Dropped register read/write wrappers
- Link to v5: https://lore.kernel.org/r/20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com

Changes in v5:
- Kept only a single place which handles extp clk (after PHY power on,
  before PHY power off) (Neil)
- Inlined pm_runtime calls in the HDMI TX driver, replaced
  pm_runtime_resume_and_get() with pm_runtime_get_sync(), since
  atomic_pre_enable() can not fail.
- Renamed registers defines to drop the REG_ prefix.
- Link to v4: https://lore.kernel.org/r/20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com

Changes in v3-v4:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes in v2:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (4):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  59 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  80 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 226 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 761 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 765 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 460 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  24 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 353 +++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 478 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 213 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  59 ++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 187 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 440 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 489 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  49 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  74 +++
 25 files changed, 2611 insertions(+), 3189 deletions(-)
---
base-commit: d894dddf2a144f0e1d1cd7a8225c744dc906cdd5
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
--  
With best wishes
Dmitry


