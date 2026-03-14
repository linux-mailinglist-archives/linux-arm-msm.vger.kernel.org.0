Return-Path: <linux-arm-msm+bounces-97671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKRAEebstGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:06:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83FC28BA69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7812C303F479
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6E034E763;
	Sat, 14 Mar 2026 05:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtx/wY2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIpwHi47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F50175A70
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773464798; cv=none; b=dRcZGcuqhGpGj6ZeX9aqRt5K15CoA6MxTwuJaYKdGdkqEmbeBaltzxQS0FZ0140L2trKSDqsrltu84B9I9nDNb4S7RyhWS5Csxv1tpafjt9aW39vkujAvERmnhjeu6F/xsolaP51BQilthfY8USGsICqCjp7RKCnlkVjfjNr6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773464798; c=relaxed/simple;
	bh=dpVL6xHiAyTcRZvdVTUxyACDfNacks8+MDrD7qZtgII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nN28Sw7rpH3jy7yG2/nOy+Xxn7O7e4eopWQz4TkBhsuPRAW1AqxTPc7rfy2io2h71tneC8sVpqStRnPKu/1Udl11nC97jecoGQ01n2M38Q6n+4VSK88duyng2luxngvAM1BGStBa4NbGZpR/9ItSTs4LpxVFVRCo69jBI+C4B/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtx/wY2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIpwHi47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3kLWT3331452
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uRmdk1ifzAXT+4aK/1/vkT
	qfkWelFGrIyVShhIr/5Zk=; b=mtx/wY2YYEb+n1VBg+RmNyAfervdRuoBNqnAnD
	48+EdTZZYYFC9t5NP44WzumeAjiK5jqA22GNInBE0v/vKKeBRRT463mQ27de38eX
	Iai8WXBlcUu6rfyykzfj809lhR4KgkU2rpniNAYKBvGp4rlPrEiBbB3zVTGPKGty
	yZ6sYUVhKEA+VsnbeurFLCu2/a6cv4ukksYDPS1TaCjHq1rA1U35mjrhx2/tx5NL
	jlCqs42BPUFhpvl6fCd7L8DaxKazmrdLw9I4CVMOqQiKfhPIk9xqBnogeLIpeuY/
	Z4/QKfXWYyTVzzVedZfNVxYUKhtcWRtYSzf+2jEZ2vUph2wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw02783jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:06:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso208431201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773464794; x=1774069594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRmdk1ifzAXT+4aK/1/vkTqfkWelFGrIyVShhIr/5Zk=;
        b=AIpwHi47/Wk0lBakfsKXY4nYDZdDOvYEUZsFP19oECc80dTgR4yoXPKTDVAAc0PguA
         9DBrIDnJgyRa9uadthr6Udp33FngXRiEodfPlXILoKQ73ogU6x8ZhhVGx4CMlGwYXccD
         IV/ksi0CkQKWmhrKlGYrU7kgrL5BtdbH7iLZcIRWyOuoA3t+vp8sane/6S6xIGIBCMFr
         IvqQMEZqNhacdBarwiiko0IbBgYIt1Tsg+FOFGP0YudII/ZtM0BJdFR96cadNmrRqoX3
         M7QQGOrTVvRZW7vfkx6iw7NwKNfMn4JUns39P6iqPNtciUx7sPoLRiVtOACML7JlKnMT
         A1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773464794; x=1774069594;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRmdk1ifzAXT+4aK/1/vkTqfkWelFGrIyVShhIr/5Zk=;
        b=U7qneIHSSpmIUX37kFHE76WljFaEtO8b+eUzj1R0hLNDK5zpvc1aZBMmI0MGx2oNmg
         YcDlz6UDPvU+dWhpCkgsZwvDrN4RRDCjPkJlvUaDjB6DtJf2NU5Y8E0r+3QlKrod8SB1
         vokQSMpJ70Bm84/lhCCxbLKHIO4mMpNXLe4kkGfF4Ml7lseaHg0sdt2/x02qHNPnQR7A
         vbpq/Z8/3TMMVN7Nl15zuRPGTfsbUKAB8zJPgDk7fazrUpi2BBRCp0ZJ9ZPGHW35LCfR
         TWODQiagb8saidBntUv+NCJlmxo10e8SJzJBaB58y+NtwqiUXnM9OA7RXehqSCkUnR+p
         g4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUnQo6IhbI02XE5E7tFEc29ru0MoVIid4ZbwLWFU4MK1ZIUtVeGj5tJ9KAtKZeR2fWllKvhczcyuUpEdk60@vger.kernel.org
X-Gm-Message-State: AOJu0YxusIV0qgutZW6NBzBBHIY54sAV86VCHLNPS5yPf2e8spqo4a+0
	abqoS0dZVNdhsHvEbsON7iVzZpxFqK0MOm++n+zycBgpSYCLA3hbXBrid9u9cNsT2ke8xQl85yb
	tYKbbfJTCTrBkzswWWfUPUb2X2kuwKSMtG+QpfEegFxaoRaMudKogGbEMMliYHGfIKK45
X-Gm-Gg: ATEYQzwQMXX223pkVagYUf0V7Wg+7lxwIJLn+CH9FVRsRGOqEKBJD91XzNdEhwTKPmn
	PtoO4m2qn6Y5KCEZ65pPHQ8jyoIh0LhFxCXluEcK0YwnlEynLsW7Z5YkOxdUXR42a+xFWOl1qTQ
	FB6YAH032gi8qmuCLOYiVTwbHTSNzHXIRC5WavXJSCMbD7aubuZmzzE4GEzZsREwO7jyiNczOY8
	HFbDGLbdTfUh5djd/lVUXvREks8Xmii/LialADKSd5EvAUS0UQf+KdrFL6iVQ+Qb3fqLZ+0VIdX
	BYT7f8MTXFf5hCU6/XfqIf8PsdVQTiGhD+6omnmhevjKdDTuBkRVOBU8qfZdW1ZOsAmpMN6tQvh
	Gi+MQ3bEkocxJ/u6Nuwq88oPCLSFR0Swk8Dl+dsPu0JjWNVSTxCCX8G4Il4/EA+4EWWbsBg/EbG
	3ZuZfYNlsUMZrXHO2sbQk4W099Q88iLSM+BSE=
X-Received: by 2002:ac8:5a87:0:b0:509:1b01:8929 with SMTP id d75a77b69052e-50957cf5250mr79097561cf.3.1773464794313;
        Fri, 13 Mar 2026 22:06:34 -0700 (PDT)
X-Received: by 2002:ac8:5a87:0:b0:509:1b01:8929 with SMTP id d75a77b69052e-50957cf5250mr79097241cf.3.1773464793816;
        Fri, 13 Mar 2026 22:06:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636206bsm1982771e87.67.2026.03.13.22.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:06:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/4] drm/msm/hdmi & phy: use generic PHY framework
Date: Sat, 14 Mar 2026 07:06:18 +0200
Message-Id: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrstGkC/1XOQQ6CMBAF0KuYrp2mU1oQV97DuCil2EahOkUiM
 dzdQuLCzSR/kv/yPyw5Ci6x4+7DyE0hhTjkoPc7Zr0Zrg5CmzOTQiqBooauBd/2AR5+BqWaQ4F
 111hbsdx4kOvCe9POl5w7ij2Mnpz5GYWo5QERy0JwlFgprAEheyPNvDE0J3+L0+keBkORR7qur
 A9pjDRvGye14iulhZbib86kID9sY0yppWkrfYop8efL3G3se54PuyzL8gU6+GMi9AAAAA==
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dpVL6xHiAyTcRZvdVTUxyACDfNacks8+MDrD7qZtgII=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptOzVFzbufK/Pv/ssbcuMRW6VJ3TLt05H6aH7U
 W/uoIwvBW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabTs1QAKCRCLPIo+Aiko
 1Zd0B/0WSzvf4ZiWaezOqFchqErUFw8lThh2cUGjBEL1kB7F1c1TwENIyYeltHt9bglOH5j+Zos
 kpr6aLYMOpgP0eYEmhl8WAriX+woGYntlzeVYxmD66mlIvnCMqdmRMaCftjg5KH/KdzPJXUDRsx
 cyy7ixuVv20jpLMabU4iprDhO80cZKMC9Le8U3lbGLtrzjl6xU0tClreKVuzgaukADmvkw4VRyI
 7sX5IKeRs3vxtfgTeefva/zDDsFPBtwYj5q9Y+LWHXybWjvpU+GQNafnJhPWdCoKlsfrDmSes7n
 T6aNwNuhSwhIvzh6XqV3IxsJiAvzVXKSajYmUCheiXRrWF0y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Vkvg1_vFlIJ5cNgB1a4z8X5_awzXAsVE
X-Proofpoint-ORIG-GUID: Vkvg1_vFlIJ5cNgB1a4z8X5_awzXAsVE
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b4ecda cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sCsn4_Ng67BVsxP_3UQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzNyBTYWx0ZWRfX9wxi4friwPjt
 aWhv0EjDGtZAZj+UUj0cs3SFeWvOVd1j+g3slxY7zmnSUQBbdBzZNrBYeEspwsKyoHCCysepmt2
 C5bjYy47L4ZuG9v+S0WvDpgOH4cktL9Jh4gW7iaFb55et+3coeF3QXyuSp9sZBhycDD4M92HL/C
 UwdnnAshD4RuCECPPzLanOmm7fjQEHtpSPaXzxAN+3urrx89W7FD5An5nv2acjfVSccG1PIRmY/
 zQOKpJC7mubetTvGoUtiUWODTWOYCPxGeqPxTOoodfK7F1UbLKjTjgy81PgQd42n13Illi+k2ii
 yvh/4qiA8Ikpk/7TIHR5y4knGZZq3xCR7L8OXhhueHTXviUJXVELilDYRJiU6rpQWSxMp62YpR3
 sGkaNyOjfPAQucdg5bIgxpX5LIgPsLkmmCe2kMfTJkMATI9T4IAyV9EC5DpSdgbe6+4ykisLRJf
 hOD5IqmZwdDE2O29NWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97671-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A83FC28BA69
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

Merge strategy: cross-tree merge via the immutable tag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  80 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
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
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 332 ++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 444 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 443 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 496 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  65 ++
 25 files changed, 2603 insertions(+), 3188 deletions(-)
---
base-commit: 6d67f372c3bb68e62b609d0929808c9567df7209
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
-- 
With best wishes
Dmitry


