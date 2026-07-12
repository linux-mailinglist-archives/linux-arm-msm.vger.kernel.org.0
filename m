Return-Path: <linux-arm-msm+bounces-118558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FGr2ECaBU2rVbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:57:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F2F744902
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:57:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z5NjY4Eb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TskwOJli;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D31F30097DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCF83A6B78;
	Sun, 12 Jul 2026 11:57:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB253A4F26
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:57:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857421; cv=none; b=fv3jb18ldNG+MZrLjfHFyz5ZBMqYGkgaJKc9OXPewEn1D73rao8MkZY1O6I2afTqU9m9k6i8WSxDmWEtQtiPR3XszxwFD8Cc34MCWoEnR3OGJAFmfEtX6PcJjHRdLB9+wo+KC33DJg84L7IifzlWOzRWVsWm7vfdWf3haiDIA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857421; c=relaxed/simple;
	bh=U8xlc4LqmG92BXJIi/W6fHc/zYAF0nG/swZlZ6Z3INc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a4CU3SxZT6FXiUXTvjy7IOStaH1RTylfXO8it9XJ0t7kPWCnMLuxCUec1G1Ohm4tbLzia+wNw+kNnT5PBNKrzm9Sv0UQnWUJggljfkNZ51PigKw9nOTkA/jQAFeUCsCc5tIUU/i1HeT+XEkSy6zVHE9Of3pqQRKwRXUodQcdhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5NjY4Eb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TskwOJli; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAd72n2245962
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=huU8utG17jHPI85uM7nl2i
	PO7/oF6BiBvt9ImUQQN6g=; b=Z5NjY4Ebe5/VWORioRXxnFGpeTLGawJSC7lUTu
	wokVVC1SfwEHzKRMA31QOhdR6m0rDAD0eK/0ta7/w0thC3hevxFuIXvZvKmXVqhd
	0lVU6YdLh6Z+cCiXoaiwgXdyQtOpgXIdDXCCpSp6jpkoyk035xWzw/v0f+4xu5Xy
	V2Sr44CQB03hNiAgaCVhGU1xoRYZw0PGdb7B3My+Hxb3UoP7/kkzEx7LIJ2/e5TN
	ZTynpyolQLbtkX/TqWPfEu5DWAv5UEewuEbgccEsC/xZfb4FxE+qZkPKNFklabay
	av6TvstVnE1UVm+mMqh6qKspTwPxv0BbDZ2dNwuS5SkqiFRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjnq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:56:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so52922061cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783857418; x=1784462218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=huU8utG17jHPI85uM7nl2iPO7/oF6BiBvt9ImUQQN6g=;
        b=TskwOJliTTRjw/uwBZu/MSdBfrRdKfpeyuZSxiRleljNSZ4Htb2y9OgfG4YwODRu+V
         2deYF9ihRz06s8h9cX8uSMNc1Fr/zi3w6+X9Rip67YhvaBdpuf9T3D1oDPdZBDqH2wnf
         tXujnIR89nTESUv0sidBmOQKU3hCAtz2z0Xk7ZP3g6ahldcAFCd/dSQ4vEY9KggWSNfp
         ym1ejPx3CFABuQr93zV7tKM9vzk0eOq4Rx+ZpseNTLoRGbUX+gy5rN7kRidf5M6fxdOP
         dXPKVLw0hGlcOj8atbyg5q4rxWKrxwNRyWJ85L9xsIJEJDDVPtvQ9RFvujxbUBZ198FH
         PbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857418; x=1784462218;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=huU8utG17jHPI85uM7nl2iPO7/oF6BiBvt9ImUQQN6g=;
        b=A4LK6uqRt6iI/44JUYtt+Y/S5NxNfa7knWfrkeFQj2T0ff8CLSaza5S7BaRPvL/IrB
         vOb3206+KjeMcEDRgHaEu5Wyp2iIhc8yQaiH4w9f89bWkhm102MsgUOy21kFZP7vEjxO
         AE+DHQSwd/D2428zLv3ztmox3fjiSOmtlYZeLEHhdlmROCHKzaUeBnoK5cXu8e3h9zwo
         +cAdAl7flFDNyO+rwg8gyJPwW3hDqV4cKU5HRlzxH/WKzsj6zRSo/hgTWiEPNypjofPV
         kGhI+awFBZpmbsa0iPBtLNfSsMWGTOWFBKE9Uw4TdDkG4Z5A3cNMV/BxUIehuDDhuMfs
         eAhw==
X-Gm-Message-State: AOJu0YzChxdv5rc93wptPbyPDmmFas3+ko95H36eafyAzCVR5tEd3VjM
	/RorjWeOLqDGtvGZ8Zqg15lF9xERRfa3izsMo3Un5iz0qO6AQnKRykeSmKusxiZhaWybgnX4p4T
	MFB8fFUL6Kk/6ZZcm00OrrLGz+Wmzq0e71OAD1s0aPoqlstTepwbYX4p+dt5EmbOJrPCo
X-Gm-Gg: AfdE7ck8MnIT0OYzfPrlt5W8Gy7KAY98NMlJyZEYawnENAWD40A9LpN7DtsQPs4sQtx
	OEMizTUlSL74l0DIoUDlsYxSgz2qaYI5R8dphzpGFAMpoDcUuFvU91Wvjqsbyg7gF0BX+SxjEOP
	OLm51zt8iRBTISaHNGzhev2t4obd5u+Hu2LjSa1LdWQiEMmz5zZEwhajzmSWd1DlcM7k2vtz0tt
	ane/zgr6i4YVdiWxH/OlIurFE/9WuHkJPT3xxsxalL3GByFpL1rh/o5D00Jq2hiugW3jcJtV/pW
	ePkElPQTEUCsBZUMTxX5zZ3Yc7mRSHHhybf6trDaNI0OE4D51pXqeal5UQ1y0KNqIsIPrK4Hwsm
	/5LP96lqsRK/lt8qoFjQje0x78ZrpoW2Oma6MrAfacdABdDxGpdIHJxWTY47JtVAFZa+/VAAdou
	UkgDhmEDUtihgBOvo/fk4V3uwY
X-Received: by 2002:ac8:5911:0:b0:51b:fde4:cd57 with SMTP id d75a77b69052e-51cbf149f77mr57388361cf.31.1783857418500;
        Sun, 12 Jul 2026 04:56:58 -0700 (PDT)
X-Received: by 2002:ac8:5911:0:b0:51b:fde4:cd57 with SMTP id d75a77b69052e-51cbf149f77mr57388121cf.31.1783857417994;
        Sun, 12 Jul 2026 04:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf999sm1978903e87.70.2026.07.12.04.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:56:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 14:56:55 +0300
Subject: [PATCH] Revert "drm/msm: dsi: fix PLL init in bonded mode"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-msm-revert-dsi-pll-fix-v1-1-40122689ea25@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAaBU2oC/yWMQQ5EQBBFryK1Vknr0GKuIhaaQglGupBJxN2ns
 Hw//70ThAKTwCc6IdDBwt9FIYkjaIZ66Qm5VQZrrDN5YnGWGfVIYcNWGNdpwo5/6DNvisLlaeY
 cqLwG0vkJl9XLsvuRmu2uwXX9AY0oENh6AAAA
X-Change-ID: 20260712-msm-revert-dsi-pll-fix-b5b099674566
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4247;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=U8xlc4LqmG92BXJIi/W6fHc/zYAF0nG/swZlZ6Z3INc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqU4EIHWZ7Ly5h6oCyRCn5gdJDDBtWR8a3fAUam
 IyuoZg6sreJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCalOBCAAKCRCLPIo+Aiko
 1dnGB/sGMJQv7zEngalJu4Tw/zGO7hTfITIVyq6eO48phQBx8V7J2bPeYP9nJZJfJVNFOjSoJOJ
 PESZ80vZ+2vFTGknAK9QuapE359B9uRc4E/ujMaTlsA2EGkprPCq7SDxArPNQuRqz7DHgamD1KF
 3CD7j8dzIvzhHOmbAa79CHj6lSVbamXKpnoidDDOkaUMRE5BkjXc37U+EYlmj4FuJxqVIS390yU
 CXSVWAOo6E8G6wa4FeX7jxPorV7krv5DNmX4Kvfm4sy/M53EhBNGBacaqaAxM5uvcj2gWlWH2tv
 xDgKO+K/AyLysil6NS/5tmQdDMuCc1TUfXfr1j6imKnH9C3v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyNCBTYWx0ZWRfX2CoMWCPd6LP8
 aKjee5lSgqCd1WjTT5HM5LvPczzzz6U9rAxsYNgoYlea2+Ol5MeGqEWL8mLh7ytO3WqjaDeWwNy
 ilUdbR/Ed4eLfGYoBwlUtQ9Icz0AAV6nPD2wGmz+tTnPjeHSxTLzlzs6sxkpfH6+oT3iapbhy1t
 fi7mDB0KgKii+G9D6z1tjS5uAEdsV6Jv15/W8hyxitr3hNqH1b+QpdeuqzJqjVqYsDAiKOfzWAP
 4RnlRDj3ipLkvormwtokjEW7cZt0WwQX+j/N7lvXjQl8q+XXV2XAPukQU4pahCrlbbdvHWP8MKP
 rLtfhMFM/cci+8s2+IMkrjwjAnnD7Cx0DmGKnaUuE8lkliQPWM6nzSlk3tk9rmeTI7pWsUGptq7
 Sqxf5g98rPb1otzygnUI/6/VjbOVG12w4iPJjc+J0edMIP0A/MdZ/yPW+XeIeRiWJA4crRWjG7l
 1JthFV4v0lfqfA7MobQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyNCBTYWx0ZWRfX28GbrbMvpl55
 glWNNvXYBEfVhDKYlMhpj6vrX4BlSa9TyOb0dvbEw44vDXWblYp8CcmxsBnALRY8pYDvlkSZsE4
 tyiv2RAqjHhkrHdA1H6Nz+8MvG+qidg=
X-Proofpoint-GUID: g-wOvPg-_7KkZ95RTRSOdP64LKqb-E9T
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a53810b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lAgNKBcoAAAA:8 a=xpBAJsVfksFbc_DGZosA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-ORIG-GUID: g-wOvPg-_7KkZ95RTRSOdP64LKqb-E9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mohit.dsor@oss.qualcomm.com,m:regressions@leemhuis.info,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-118558-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92F2F744902

Commit 93c97bc8d85d ("drm/msm: dsi: fix PLL init in bonded mode") fixed
one of the issues with the DSI bonded mode, but broke non-bonded usecase
for DSI as reported by Mohit Dsor. Clock divider is being programmed
incorrectly, resultin in the wrong display mode being selected. Revert
the offending commit, letting Neil to work on a better fix.

Fixes: 93c97bc8d85d ("drm/msm: dsi: fix PLL init in bonded mode")
Reported-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Closes: https://lore.kernel.org/r/ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 21a59d66e8dc..f5d3e806f8fd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -111,6 +111,7 @@ struct msm_dsi_phy {
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
 	void *tuning_cfg;
+	void *pll_data;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 984a66085dfb..5d805a797abd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -426,8 +426,11 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	u32 data;
 
 	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	pll->pll_enable_cnt++;
-	WARN_ON(pll->pll_enable_cnt == INT_MAX);
+	if (pll->pll_enable_cnt++) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		WARN_ON(pll->pll_enable_cnt == INT_MAX);
+		return;
+	}
 
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
@@ -873,6 +876,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_7nm->pll_enable_lock);
 
 	pll_7nm->phy = phy;
+	phy->pll_data = pll_7nm;
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
@@ -961,8 +965,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	u32 const delay_us = 5;
 	u32 const timeout_us = 1000;
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
 	bool less_than_1500_mhz;
+	unsigned long flags;
 	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
 	u32 glbl_pemph_ctrl_0;
 	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
@@ -1084,10 +1090,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	pll->pll_enable_cnt = 1;
 	/* de-assert digital and pll power down */
 	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
 	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* Assert PLL core reset */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
@@ -1200,7 +1209,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
+	unsigned long flags;
 	u32 data;
 
 	DBG("");
@@ -1227,8 +1238,11 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	pll->pll_enable_cnt = 0;
 	/* Turn off all PHY blocks */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* make sure phy is turned off */
 	wmb();

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260712-msm-revert-dsi-pll-fix-b5b099674566

Best regards,
--  
With best wishes
Dmitry


