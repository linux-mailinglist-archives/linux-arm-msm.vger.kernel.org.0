Return-Path: <linux-arm-msm+bounces-109493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNwgHgnUEmqr4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE425C1E74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C80743002B57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A842BE7BE;
	Sun, 24 May 2026 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVjcrzGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPBN+H7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BF27F4F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618819; cv=none; b=IKtC5mj8vaFA9K4ZaO5v/v2zzBu/VYhA3Q3icxv5p1tiHRCtBhvRdisdBu8Wu7xs5YPpqOI1waZgbbgaJ//dFF5L77piCrqxqCv/XeSYhtYlbkclmMcoXxTPeRYgNqzSYWyGUZfsUJheIj/x0fAPyoPFieDOGomcnWJh+LLYv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618819; c=relaxed/simple;
	bh=U0XZxC99ewkLvWYK3iy5g6JrTkG0b11dXRZJIWCZ/wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MBqTRUNGJ3gWqxwmtyUk0tewYEdv7mlV788KEY0xirrp7tKBLnorDJBwSPIUKAlJPCejLjh7un4G6xmBe/PUgM+kzO007LQmfy+2DQT/dMfvvAysCH1ES22RCr3Mk0HDPnqwBHePvgT+tN2Mtp8l8jvzUd/CO3YuhB95Yp/IU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVjcrzGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPBN+H7n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O3jFWt2588545
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+bH+vfyygj4FdgLK39FAGR
	xrgQV4A+boeLgZb6piWGY=; b=YVjcrzGF8MqeEN0e4h87Gm4rKQmAiWB5ONJjW1
	JQkIMdIrDaBTWxiCocH8DWC6+mJ6YZ+Ebh1BX8VnhzwlTab5yFXoXFzSh3pl1cyd
	nJV9wIU0pGPwPTL3Mz9IQOc8UmAMLxZhxX/Af8RWiXwWJWlHZaI8qjYcFbHLA92F
	XsukE97ozxs2wsQEpDVviUkUYBCokibdll8Q5ZdDo1bnMFea8xdBiBFR8GeE3GRz
	QTdxFj7QuGQsd/i2ijhbHBCTjUOLKbn6gQCPcND92VpSRqJqEgXihU3WwQ8Fz3Cn
	ZcxTCHHF9RNfksjeLYh++kP7313G/S+iQNF9X/mkxe+fkNyg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9jt5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57525c1ed46so6796292e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618816; x=1780223616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bH+vfyygj4FdgLK39FAGRxrgQV4A+boeLgZb6piWGY=;
        b=aPBN+H7nA1KSKvAjNjPpDGbQmC5TCKzjGTyvlZUBUB395FWD00c9vWpCrjsdgYjmCN
         iFo4NVHpsguyHpgg4+lFLtx4onsAzX4kWS9E0Q/Y4FILSnC323vvVfgkI8I0qifqPQqo
         f78wyqx9r18+1bc0J/PFH86TP8FMsbmiCiqkLarpOS+IwGWyS+oQqZXOdjcThZ2q1Ws4
         aMzvS5vNFY8Va3USazQtsovUKY7OUSeRx0EeE0SrD5ba0/njwuyw4yAWXegZnRkW9l4y
         lC4NU4PhaRlI4yPzb9My/flXuYJJyr99a1pWbtPo75XymLSF2Bk4pIUSq268jPvStfHF
         uOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618816; x=1780223616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bH+vfyygj4FdgLK39FAGRxrgQV4A+boeLgZb6piWGY=;
        b=dXXAiAnZXQRjDSkNKPN1A1GD1PVW7yuKF50TcS3qxht0356bN/QS2CBH3S0btHpcxP
         HG9ITmxTlMCcweNUoWhG+rJfW/jfqK1dZouAFRFM3/4p2d+o8BZDOKZqB0D0havKk1SZ
         tLSN5dK9Bgz5Ey39xp96TM73tCnCcOt/xY+z35B68TfDKaZyiO/RJxBmvysXo3hTvhZP
         WSVmvjvSUs+sJtuIOt7GdUYBEdnb2WLTMLqQJr2/pdwlxcZnM/b/AhPzFTWFcXAKzHV2
         t8KLlwiNUJSFFVRalq3ni9xUH4IBm6L7I2PSnDetTg4g6Ix2nSVRnhDqyXuSw4Wg53pa
         LNpw==
X-Gm-Message-State: AOJu0YwEYZCAuQKBGvqQMumNmzD0tuXbGXPlExgMj/fdCS+OTZIKtVD+
	m7OrJGwcx+E8oqWX00nAVh/UQzH1CMmKe04PZbQlE+Lw/hh7nY+mZsf0Vujk0+FPBtyy58dNydj
	+POCiadcGuaoYw/stWfLb95v1VhkOifDMnJJ7ZGwYQIveNztLcQJesA1xRYXnCXCZPD2N
X-Gm-Gg: Acq92OE2TPxYQivDq1kWbm+KTcV45KsYCJv/XbKYYn+xYzbQXG4hMbHaU5XsT+plrdL
	X4WmtK5ht6xwbln78eVkRZEJbD/QKrjbxdHrMtMEpQYidXYk6r89N9BEYRMyLqgfKKz2XTXCxBJ
	4uk+qbtlguz+4CkPiJ4K1o48AIDTzO5eJ+DSDYzYLfhM/Q7UVMNRk3iPI0A2xojICMurnbhPS2x
	y8bGy6PPEcQNRmm+pv0s2aljaioBK98zMzvdgFVLD9khlM8MAc2TCgRXdcBlz5uyCendd3rIaZX
	Hw1TkIax1qXWH2Rj7IYYVyHoskYTsmnGgNQh/j2RpIvvulfDj+LcIkg9GOAOilDdxw/OmZB6JLe
	ri2XKs64bTHWXaO86WzDaRyZiUaWH6vqVjAM+gLln7TGAlhyYUeSHwD8CabM69trAkvpEYnAzYu
	MA/pYGZQjQkWj5SK78urullAFh71TXvSpuZNE=
X-Received: by 2002:a05:6102:5ccb:b0:650:9173:b131 with SMTP id ada2fe7eead31-67c7e121b74mr5023992137.5.1779618815965;
        Sun, 24 May 2026 03:33:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:650:9173:b131 with SMTP id ada2fe7eead31-67c7e121b74mr5023979137.5.1779618815487;
        Sun, 24 May 2026 03:33:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/10] drm/msm/dp: Drop the HPD state machine
Date: Sun, 24 May 2026 13:33:28 +0300
Message-Id: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjTEmoC/3XRyW7DIBAG4FexOJeU3cup71HlgPFQI9VLjGOli
 vzuHdtqk1r1BWlg+ICfO4kwBIikSO5kgCnE0LVYmJeEuNq2H0BDhTURTGimhaR1X9EBvHVjN9B
 UgdCl1kYwS3BLjyvhtnLvZ6zrELHta9UnvsxuUMr5X2jilFEpXWldJqSX6q2L8XS52k/XNc0JB
 7J4k3gYGct2hkAj9Qo4pIpbKw8M+WMYxrneGRINloHwsnSVAHZgqIch2d5Qy1tyl1fcg5eCHxj
 6yeBqZ+jlHi5TmJVMK/NfHvMW+ACXK37buKVOShuBLk1hLJIWbuNrY+MIA3n+0SL5PbbqsbttY
 T12uYNnJgdjSmesLzDw8zx/A+mgO74mAgAA
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=U0XZxC99ewkLvWYK3iy5g6JrTkG0b11dXRZJIWCZ/wE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8vhw2I3sO+xF+dw2zCgQgGJ/1vHFEF0eJk
 8UF7lNdmj6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1SrxCACfeVlMwFqCZvXlYi2jhZEUrteL+A0ZpJ1iFGNmWw6FPWL/LeMq73invVVmi8Ab7cuK997
 zDK70Oa5NlQHknNHBIx5BbtC38k9uaVUBJjYdgeH1+Y5evOswv2pT0gWpjr6rGvnaYtaXNXB9sL
 esm8z5L6K0kalR53jvAql9PgwO637JnvkxMJKZl8+0SOa3I6EKuPrcw+DfxyWOALwkZz2bWGroc
 2Ecn3AtmqNn6QMvLLLaOnOwlR+iWka88x3j2JkKRT8ZE7aUjtmKTytNX0kE6yV+RDZw3zF0IGNl
 4slLO0sGQxsy94ewYuBJCg94bLF7ONuCF1x6L1dWgurvnHap
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8HWIxjAWW6hQB8251GHV0UyOVg3MzCoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX/FH0RkItpKw6
 CZQd3wAXZtCGoaghZbNVaIZNnDZdR7Kzsun0T/F6H7LdgNzHbvY7yBCHxfYxOxWj8T3QUD/AKsZ
 ElX7MmvKj8AyWkwDhDvue5BipRqNSkBGs9DccKDlZmnavFtB/zRVmDHdlpx4Dk3RoPjm2kOX7A4
 IWRbR3/h4Geke1kTjNyteqwjKmNbGPdJcymM0CEEApfuAfoKW++1/II0Jay4k7wi9yl0Xs645pG
 vY5xv/V8WAL9+V/PbxyV7SQggEZrHp5qctLxEwyWH6WP9j3LJ4dhWHOClev8fg7cuLhP87Lpbp0
 0LwCuFLGvgc8WGldvlswQd5ky6DkM9Z9XhhOxPh9h+VtxH1P22WXqitNN0Px+YQik1MIed+k5qX
 LfG5WVuC+rOh5MurAkMCombf4qTowwLm9SUlvE0LK1pv+ln/9xKDydFOROiODyjUbqJRzO8Vont
 Afz7LGWxJp5WSN6KxoA==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a12d401 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=AKXKEK5VpfSTwivlQfkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Vxmtnl_E_bksehYqCbjh:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8HWIxjAWW6hQB8251GHV0UyOVg3MzCoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109493-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEE425C1E74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

To correctly detect the displays which are plugged on boot on the boards
which use dp-connector devices, this series depends on [2]. USB-C and
eDP panels are handled natively.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
[2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/

---
Changes in v6:
- Corrected mismatch between Jessica's From and SoB emails
- Corrected documentation and fixed style comments for
  msm_dp_bridge_detect() (Bjorn, Konrad)
- Changed msm_dp_bridge_atomic_enable() to bail out earlier in case of
  link training failure (Konrad)
- Corrected commit message for the link training commit to stop
  mentioning event-related changes (Konrad)
- Added kerneldoc to msm_dp_display_host_phy_init(), describing return
  value (Konrad)
- Switched to guard() instead of raw mutex_lock() (Konrad)
- Link to v5: https://lore.kernel.org/r/20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com

Changes in v5:
- Fixed the EDID clearing on display unplug
- Fixed the initial HPD issue via the external series
- Tested on eDP devices
- Link to v4: https://lore.kernel.org/r/20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com

Changes in v4:
- Fixed PM runtime handling
- Fixed several cases where the HPD machine would loose its state
- Fixed the case where detection was ignoring the plugging in display.
- Link to v3: https://lore.kernel.org/r/20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com

Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Baryshkov (3):
      drm/msm/dp: drop event data
      drm/msm/dp: turn link_ready into plugged
      drm/msm/dp: clear EDID on display unplug

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  16 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 722 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  63 +---
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |   8 +
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 9 files changed, 255 insertions(+), 566 deletions(-)
---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20250523-hpd-refactor-74e25b55620a
prerequisite-change-id: 20260314-dp-connector-hpd-f069e66bc6af:v2
prerequisite-patch-id: 90db75e3fb8bc9c81c67547db7bbd4eefd5d6c40
prerequisite-patch-id: 1c4d030b93a8cc6c98b3447a8685da24eb1f24d5

Best regards,
--  
With best wishes
Dmitry


