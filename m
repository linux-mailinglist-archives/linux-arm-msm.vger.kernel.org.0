Return-Path: <linux-arm-msm+bounces-85832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20ECCF6A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53532301100F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F9727FD68;
	Fri, 19 Dec 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcfyx/aZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVLWuEJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5F2DA771
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140766; cv=none; b=jjQrB9SfjFcwJhYiV3sJVznxE9mU4ZIAaZjoxKSsZ8dSv5ehvCezLnRcWnHKQR2Nlz2atdaz72AXLK3VNRCc3iKJCPypsVa+0g/aLVV739vDWysCW10tCjorP7Dhv40dWuU/1CQ3PXwciJ+tgqWBy44Bte8R/5gnvuQyBRAywnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140766; c=relaxed/simple;
	bh=/u3nvXle1xbqy/IuGW/9vL0OVSJ020YRlDEhrJxnPis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uA2VP3EW9DqpTGU9/92z5vYcBKmC8UAWj0eCpcC3BuJf844sj5D0jBbj+q1pozkFs5rQ5SeY7OaOCjUY3ZkmnkZekfHzeOvqabKj+LwI34zazgUDmq3cCAF5atio1/IZ8B1MzaOUK6MD51wZQ3O285JpXx0mX8WzVj5JaLzeOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcfyx/aZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVLWuEJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c2ai091077
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5WpkRzSjWUQP8YT/iPdEOd
	s5AwcizwNwKhZAwGdgqG4=; b=dcfyx/aZ0inFWrCsE+V0e48utFdMCeCYtOOeQf
	WZQDSjLYkXDgpGLx6WQMCjHZ3NtHsNZ8PyNNlG7pPnHSBrT3SBfcLvTF3/ETIhgN
	dmYBc2u6STU2XlOAhHhZS09V4+PFg1bYuFhXw85qzJ/KBSSTubZF0t3T3JSQcufd
	hEbKV79LhDrN6/Dm8uuLZ+xKdb68dQtWDnuW3lfFPVbrd1C2OQ67P1pSjdKPqPtn
	Yi9a5trHL4IDPS4XFUqfGXgXauhhMsCYOvdmDTZO/EwtvzTTEcq3o0YzNuHXiXq8
	Kau6A0FJFZwtX25IxbmSHueIhRoWWvbAB46Zk4HeRRjv0JJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eab6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3822c06bso37980216d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766140761; x=1766745561; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
        b=WVLWuEJrs8+UaZzrEPak+/tjRtDhXbGPu1JQVQuXNI82nEbFk8fYa7nGvr7WTXX+hk
         fDYzJper6rSVPheHo5JDJmhIsxzsAyrCKrTbkpX2s7mKvT3ygdyq97i89+7SHDnQQiRw
         2kQeRvpNMME9znsX/VfIuP2+P3m8tnTXH6rULi1OaK/FqbZJV5DCmQxbvTMdm3YeUOJ4
         ZUQHh4SSgUGtuqjohCfqpvvxa2L1N7a2oCccsIGwmvZt/WlAnhcGT8IIjsNLUdrDCOKB
         1JpfTr5ULukEu3cOQEZIyeI1cyk2LyEHplq5vn0euiyKJm7KCN+oEXkipyPUOmKWadnC
         ZQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140761; x=1766745561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WpkRzSjWUQP8YT/iPdEOds5AwcizwNwKhZAwGdgqG4=;
        b=EOTWqqPquNU+d+Nt20XGIdSWbNKw2AgATAt0P7rtLcx7ASk/FHzZEbjt/op59KH1oh
         CjDoyJ+fgx6u9SzHH7FNkCV/CA7HQTbZvZ5ufe5FijpgEFoxRg/kM87oQ5xfLmX05KSe
         YJdKPT90DEVgFthcn0OB7/xB4WbAqes2d4hFW+Zh9KUpnKTRyiuZFJJ2b0Pt5eNX2pbX
         cwlvsh1Y4MEtMQekNdBmjT9TbW8SZ+yzB7FZ71BU96389T6rdOJvHY6+Z3dWlREZExmz
         Hg11DS7PsuJ/sgYSqO45bt/bz2b7tMeakyoZhhFWjadRGJ2a43SduYIMprPQfpqYdq4O
         pigQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAE9AQ6TMd0XGLjEjV4rkNlI9q6SnUmfHYh9yVjtC66XKBZ+gbuPSiuxIDCySpFyp0JsD4HntAGq7ZyVae@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+C2ukrjY7dHWfMO7JL7V5l9YzBokBvDlNXq4hKa5GAhSw1DM
	cniupPj3lyh8JTMBqnSSSEl4xgir9P0VeRr9g8LzKVtoGGu+8+F3PHuZP9WD050AIK5zVcNgYYP
	Z9VwcMKMQh8KqniVBWtxgfTF/zUJFV1+C3fmR1MDQWkDBGCVp1+o2IH7zj/EGXALabuEr
X-Gm-Gg: AY/fxX4O5WXVSNz7x3AmUAX956cDmQb/LZ3qGucsOq/kdOkQJjVvgiBm22Mmm1B8avb
	Nhvqsa5ux6dokOgBcTIzG/6Usc8RmwlPvn49TzuxJBop+XF9Fbu7OwuUIkKaX0r/wNsg0nrRwdz
	OQzCdkroTj1GINewkTghuMfLneAR9/tcTOgz8Ucd+b3kHfmXFEa79e6n7eItYV572yL1JkkMpIi
	Hyt6fAkHItXpbWa60xvjO5pVUDcLg8MT7lnwFb84FXfbE4ALrt1o2qQc+LzMt/Q0NodmdL7yosv
	zjYNyfUOqYTmnR2NVg4BrNklxN21FNYVfXlxqLCkMkhSaciKt9+P6MCBxWOAhIVZWrrr6+qA4Nd
	LUqGhXPWl3OdYfBY=
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id d75a77b69052e-4f4abd97f74mr34794751cf.45.1766140761296;
        Fri, 19 Dec 2025 02:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG54uLQpoAtFj+oMXbNkbve+ZM6hf/DHjVt1IKUPcHqipmFzkeIxiVd9pxY+UmnT0HbF+zwrg==
X-Received: by 2002:a05:622a:a07:b0:4f1:ca4f:d480 with SMTP id d75a77b69052e-4f4abd97f74mr34794491cf.45.1766140760794;
        Fri, 19 Dec 2025 02:39:20 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:39:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe
 support
Date: Fri, 19 Dec 2025 12:39:00 +0200
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQrRWkC/yXNQQrCMBCF4auUWTtgQmuIVxEXTTPqKEnjTCNC6
 d2NuvwW738rKAmTwrFbQejFynNuMLsOptuYr4Qcm8Hu7WCs8RglYdKEsVRsA5IFn3WMWLgQBpk
 flNEF2/vh4LxxBK1UhC78/r2czn9rDXealm8atu0DxsdeW4cAAAA=
X-Change-ID: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/u3nvXle1xbqy/IuGW/9vL0OVSJ020YRlDEhrJxnPis=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStOgv3n6bkgMr1ZmWnTrO6Ri2kbxqxejW06l
 ip8nZ7X4KeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrTgAKCRAbX0TJAJUV
 Vi5nEACtwbm0IopDWK5GIQKXH19r7MV9q7QjXyGuhaaElQy7myNtVLl4DD+JP9VY8KfRMQdDNxB
 N36gh5lsCDG+bNVKtJdJ2gANTEgJ3IhZxsuaNyQhj8iPLUONlxyS0ZEVm2kMzgL7Qew0mkxnFEF
 IdFKw74UFHJ6nRi5MvOiNkbeNZ2z2X/M5Oay5MuJ9n8bzTzaCqqcBiM374bvYVPTcjVv6QJVDB+
 yYnScHthLUmJio2uzCnTYfW490HE3UPeqGONcxHmZDZYXb/wgizy1idAJ4ktGtCVqMIcmDCQYL6
 X+BCZZWG5IhC3i775MdMYAMZL0WbrkVHSDGIlgcTcDzZ94sX2EOKV69ggBByj9qDx1Gf8aQVM+w
 c9yPPKS1MsYJomrebxP6V0ic6lJ0eaPaKzT03eAb7CZzmC4b04C0sZ//aP4h9u1520lGcdXnhxV
 sC031PQIRZhk7gjjKjVzQ3NXMkfv1VrYHPvvEAtT59LxUN3fCTZiXCGKWDdrCEd6zUvOzoDFgG+
 L/bsXrqduqxUVb8snRyL5NQOk0Vt8rIyZJnRRT/u0hdxyYaQ+Tpal0n5eYRhs3mMpHLGiLEnT98
 1FjAqGgwkiCnsRLqjvN6l2kI9B2HfiF6+UDnO1e3k6rmJkw2uhwHynUuCRrr2n6qeRmql3UHlgv
 BWr1/b1M5xj+zFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfXzMGlyQ6YrS/h
 egN+b//FBUnvmXn7/on/FxkXx6vqcH+CLyW/CToshJVHIy72nNB8SdDkB/ttzn35bkw1siyH3Mg
 9EixDWckliuwrtBjh8nmVXaIHmnWNR20hzlMktK+EyGYkdOCFCaOOY9jtaCsyuRrMoCRYMIrGef
 trGRgCuxeqbFaniqULAJGK/eQQOmufVjA4h+ezaeLJLpFUvoYtnXxVFMbUf/IYK6Tb27jKWaLC2
 kMVimuMPzCPxrQ4L/8Apr1TBl5qQyw/zpno61SouUC3RtpVvOOq36VK7AraLE38/aj5yG5okwmh
 c0xNHhO+ZQcBbkBwQGDIjyZrwItM0HSnhR1YbQpUsyopGg8dxowEZynJh7sQ6q3xnlKPqOCVfwU
 sHNVlAlIp8GyfiUrXVUK/XwXdpCSrIyhFSB3ArbDkH7Y8v/4hXmibD7n3kWbeIPPrgmNmIfoIJc
 29jUBW7Zx/kOwP1FNQA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69452b5a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C3Rb7UmAfwJbGrY5-NcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: LLuOdRERGRsrbYpnfA4lxnhKoCn8bZzn
X-Proofpoint-GUID: LLuOdRERGRsrbYpnfA4lxnhKoCn8bZzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190087

There are quite a few reports off-list that, at least on Hamoa based
devices, there are some IOMMU faults and some abnormal artifacts on eDP.
These have been traced to the quad pipe support introduced in 6.19-rc1.

Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.

Off-list discussion concluded into reverting these two commits to avoid
the described issues.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  38 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 137 +++++++----------------
 7 files changed, 73 insertions(+), 145 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-drm-msm-dpu-revert-quad-pipe-broken-7b249567917e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


