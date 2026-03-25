Return-Path: <linux-arm-msm+bounces-99772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIPABytRw2mIqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:06:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32C31F07F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54F68303747E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F225427FD43;
	Wed, 25 Mar 2026 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leoRcw44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXK9GCy3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFF1DED40
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407976; cv=none; b=ImMl7qGgtOQHHf1iwNMcZqdsW67LKchnc3dwMfm4DbrXLl1VqQ1fHehQpqxi2G16M/9iGGg4W7mzAMRzKoaKTcoeae9tEm2SUAlM4GsHQKjYTNC/CkO70YMtvBDBgniTlOjiiOqGUZeI5IxqQeOpwgC4mYPwZfXRwxVoY+NkVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407976; c=relaxed/simple;
	bh=Vkjszgod7ecBFFlgxz1Z2BKiK8yC1tYFiEe/JnuFfQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y5NtyS9HkzTw6YR3Jqd2U6HZTGihlBDclIMrexa4xG6WUqqp+Kn1Jx4hVK6Ji7hmXf7jQPI0XPUSu7UEbEay0sbKyyV+VqKamLZp69qEJDFlJmuKroZYwJ8IQ5rdr1N3h6WXNXzsYj/+qRRTD1GKQrigvpqHlUWZ3gR373C8zyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leoRcw44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXK9GCy3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtQw2807988
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nRVe0VN6NMg6YbJQc1OFKi
	dXXu9EH61dteZPLjntYfg=; b=leoRcw44WNBmHx4IeY3pL//yqkOi5AmWTWMPIj
	/HYn9GxyPUxHAVPilme+UGpghbTLZv8srJkdoBN0qfIhgkw+WXxw4Wb0c7rcPCLD
	XqyldjriacAI4S7WPadi1bYz2/0JYL9pEy2KK4wgOkfDBYVCXVv/0q3WfaXDaQqV
	FbwaEkTyKW+4UmlXyPYAW6StKo9hyQGlBoO4asBpTCHAkNwZ/ckJGAvqChaXB9cp
	sr1r+ha7GFkCVYxSr2h4MIvWESAVsRtd0kKXwV65RIe1yS6MggwuXAdCnPx0ZTOi
	Pl+XWHDu3qzI3H4alI2JZ2maWQytHSGVJvl4D7Z4RpER8AhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ek2d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:06:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso114570911cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774407974; x=1775012774; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRVe0VN6NMg6YbJQc1OFKidXXu9EH61dteZPLjntYfg=;
        b=UXK9GCy3u/XrOyRaMXeJuKY8VwmYbXVx/MHsexhCqPAieSU4+G44DEh35yEemKhcnk
         qmOptkQA/pfzSgqfcJoU87exTvXbXaZhebld3vIEKKeZI8u18W6+ti0CqUlGF3N3kYaK
         gtamqcXYmCCBxwcT8OwHiTHSXd7Re3ujcRlmQNu+8AmFjCxeBkVibY9hJIRZz6OFA9p9
         +ZoK3+klofBJPpwOnx4nmyI+fnUhGeUpxpiJYOt2VQt+Nt0piWJzxpeFjXGwgdLnPZNO
         h4HAR8cnbe1UXWplYvpKxPVqVankHTgUnq1ICaii9dLwWGXi4lk4XWMuwgmWCkKnuFoY
         w2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407974; x=1775012774;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRVe0VN6NMg6YbJQc1OFKidXXu9EH61dteZPLjntYfg=;
        b=lfV20Jabxu2jEhJjOb38h1zvDg4gGr+nGNXRTjrGYtLcmEZEdhaJ6jBWzxa031SXMA
         Mr/LPg5EIPS2eaIuWZpwUU3w5rWy76q1gVqfc0+/1fAunZMuuUPSu/7B/TPOEtPLyCNc
         cOuKeZv27/1XRVDQ77YcQvaPriAt2QBdR+kTwchKiUvcp2W9lmfwHf5jK2q2ZmiEYnsX
         1pNHkLwMKlaEzZ/DeMBb1V3LcL+ZzGdEE4w5LnbZ0KDGxl+pKUiThm46N8RcWEV0AgVB
         gUpvCs3OTA9RODDfwWehacE+cX6CNvbO1JUWUa2ALUq8eJ+Q3Pon/FKZkV5Xh35+tgQ+
         xm+w==
X-Gm-Message-State: AOJu0YzlsVskx1aDey3k9YyfeR0HeIXGgH5oBcpRKY6ozmk50piU+E9J
	tQ74YSK0A62/TyFuWHLGnJ3kpx896PbhyIWI0pZptAcUYT/a3Wex8sscMLEB7WRA97QAKke7Orc
	QzaOTAam0wHCcgn0JjYt+BEVmbIMKbVkWjO+oMrPT6fDTFi3uvwbt8viS380D2rlOAl9q
X-Gm-Gg: ATEYQzzsbD2YHN+RVjAFS3khKgom4wcUUCY780eYNcrI/usW24vqCIIgmVigcwX7WXs
	mGeGluhMXhaNbsLUp82EU+jNXBvRan4dq3JGt6ch/8e1lkINMn6RR55g37JF3I17WpTHMj8AXS7
	buPBvZnSLeAkKnyMwL/ZtQbTrk+YLiBAKdgraWrtz57mdh3wxTOHuSe2tD4RMkGCXnqe1Y2tTtR
	d0FaL+b/YnV8KkGwqYN524OT71YKl9NG5vS5xy4xSAfDwLSuGxrrqeTrLmAYaHpM5zJwHjQ4U1B
	iQT/jnXpeQWyuM7oLOkWYNLrWmbgYZ9nHQR1qskJ069eZnby82ZUvHyLd4wzSkGwabl8Zgsvoa5
	N1y1S7AA/f+8+cZyr3UpRGohtDKMh5YQYBWlb30OCbn/1PTbswVVSEem4GCEmiXO4ufrArjq0S8
	PVCJ0HsN/P0Nfu83IRIi656iJaSBBvjRKw7xg=
X-Received: by 2002:a05:622a:4a86:b0:50b:3a6d:db4b with SMTP id d75a77b69052e-50b80e8a2e1mr28360891cf.55.1774407974070;
        Tue, 24 Mar 2026 20:06:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4a86:b0:50b:3a6d:db4b with SMTP id d75a77b69052e-50b80e8a2e1mr28360681cf.55.1774407973653;
        Tue, 24 Mar 2026 20:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a0a90sm3536435e87.26.2026.03.24.20.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:06:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 05:06:06 +0200
Subject: [PATCH] drm/msm/mdp5: drop workarounds specific to MDP5 1.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mdp5-further-drop-mdp1-0-v1-1-5ccee47fd1aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB5Rw2kC/02OzQ6CMBCEX4Xs2Y0tgvy8iiGmtAvUpBTbQkgI7
 24RDx7m8E1mZ2cDT06ThzrZwNGivbZjBH5JQA5i7Am1igwpS+/sluZo1JRjN7swkEPl7HQ4HBl
 2lWqp6mRBpCCeT446vX6rH83Jfm5fJMPR90s4es/xZzhj0ApPKK0xOtSJ8eYahSOtAf731Mm5h
 qUY7KQl9taqUfdDeJZVkS0cJSch2kwIVsp64dDs+wdrJYbe6gAAAA==
X-Change-ID: 20260325-mdp5-further-drop-mdp1-0-f9dbe9fc7eed
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vkjszgod7ecBFFlgxz1Z2BKiK8yC1tYFiEe/JnuFfQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpw1EjsfUhiEwAEwmFX3/jxigQC4e5KLTxhtDyA
 JIAHWlbosaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacNRIwAKCRCLPIo+Aiko
 1eS2CACzNJtMpFMjJQ5tW2v2bttHcCI0rFGUV56WJzr204A1TrQMHi4PM5LywjUkX7rSW9ET27p
 Zbnn/85s/LtB82hhRd8pbWpqfkGg71VsjHyEoHiYZ6cbM1eREn9OmMxlP79DzBbbgPW9a0Tfw+j
 2f5x0pVGIbnteGIc154BGoL7LHnm6W59aCVdzcNJL+Id+0XQO02ZTzejAjE/8T3UBaNoVT+AbK6
 kJUQFtb0jYeyK8w/4cYE2vRz/BUOaKn0ernS0hyBv8Jk+8Hq90CjNbYL012zpZ2SKldPgWha49m
 wxLOfrN3WuqlN9kojO4bgjwdRXnBaGBk2GsJpgGdSFJImFR0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xWJYClBMsrtBPpL6MO-o92nLlKr7YbGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMCBTYWx0ZWRfX08gsgPTh/lCn
 QWZHIVgO8woWk+TABG8M9lNyZUks3PR9bb591t0kRe8OOqq4n8PLreTUqh/pF4llJFJXD+BpS5U
 dFGYKXnXCb8egeUSP6OqsXas+XkpLY72RlQJJb8rka88WsOv761G3cOu/CN7UQNpE9idS3PcLRB
 9AcLnerXClmTBdL84FQz8XDh0cJNGyv1m/kh8AQC+B9lT0kfY3IvbB0ciULPzMK33eu3vG0mDGs
 H1SijKOGY3JVGcwI3cjB7SfUy5ILcdM2c5EOY4W3eHYwYyCwYYJZr7LyGveLMWcscRWyGn/Osj/
 lN4F7Zhepq6CgBFCLTbt/chF0GG2YCMLE35cb0A6ROcA/9Np69GxIKSvKqeMPNnGaXivsj+vawz
 jURsFfmzdIlsUq/hOJkfe53lYIcZOP1ROift7KMdu6qKwbB1CMm0oysMpL4MTgEPKkHdJViM5Jw
 9HVi9kka1xTbgi6zWbg==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c35127 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jsC9N8fVNmDsa5cqphsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xWJYClBMsrtBPpL6MO-o92nLlKr7YbGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250020
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F32C31F07F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With support for MSM8974v1 being removed from the driver, there is no
need to keep workarounds specific to that particular MDP5 revision. Drop
them, slightly simplifying the logic.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index 500b7dc895d0..890d2f31510e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -118,8 +118,6 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 		u32 width, bool hdecim)
 {
 	const struct drm_format_info *info = drm_format_info(format->pixel_format);
-	struct mdp5_kms *mdp5_kms = get_kms(smp);
-	int rev = mdp5_cfg_get_hw_rev(mdp5_kms->cfg);
 	int i, hsub, nplanes, nlines;
 	uint32_t blkcfg = 0;
 
@@ -133,7 +131,7 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 	 * U and V components (splits them from Y if necessary) and packs
 	 * them together, writes to SMP using a single client.
 	 */
-	if ((rev > 0) && (format->chroma_sample > CHROMA_FULL)) {
+	if (format->chroma_sample > CHROMA_FULL) {
 		nplanes = 2;
 
 		/* if decimation is enabled, HW decimates less on the
@@ -151,10 +149,6 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 
 		n = DIV_ROUND_UP(fetch_stride * nlines, smp->blk_size);
 
-		/* for hw rev v1.00 */
-		if (rev == 0)
-			n = roundup_pow_of_two(n);
-
 		blkcfg |= (n << (8 * i));
 	}
 

---
base-commit: 6efced27f5df9d7a57e4847fe2898cdd19f72311
change-id: 20260325-mdp5-further-drop-mdp1-0-f9dbe9fc7eed
prerequisite-change-id: 20260302-topic-goodnight_8974v1-c1eaab4aa08c:v1
prerequisite-patch-id: 7b71df892e1f8548f0f2b7345560edb17df5d5a6

Best regards,
--  
With best wishes
Dmitry


