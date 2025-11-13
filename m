Return-Path: <linux-arm-msm+bounces-81528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC5DC55F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 07:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 131DB4E57F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 06:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF463218DD;
	Thu, 13 Nov 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcrg7R39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itXOZaY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C73320CCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016082; cv=none; b=TVnFrUkNSeo4aWxqUKBLNsxBe/TABKpnVgq76lA6ay0Yj5yULkhO1sxZXO8XGn9gA4ddJAeK0+MFvm5qguItoqM+c6wj47srPFWOtauMh9uDYwoIdv8HSmtNLtQoG6UqMsECDYOfmYTHncPdDubupZ2lpat/Xzi+p7LhPA2AM5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016082; c=relaxed/simple;
	bh=OdLtVtiwW1xAkEP1Tuk8yBW78hA3TuPbGrqvdFREa1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9jOnzUboO7uVygOaBxGVB9TRyuzFYA/jpmmZdbzBjvgNcxD/BT9r00MQ5Z85s52PBb9w1E/ML2K836ccfL915rpjfhejLCPhQKAZj8lbVsJ93DB9YDDJ+qhUsvxI0VZSu17knq/Wsb2Oet3eP7LoM+l+K6d+k4lEh8ee0SBTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcrg7R39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itXOZaY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11Gr53113350
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
	VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=lcrg7R39k/JhY3JsjXhOBdEOMng
	+MhLO3kZspSmlGJ332Tux8Tuo4mnP5zNXdVmVl2aIL41paRaqIggpnHiDJeTVjAM
	CtxtkBCtKIIcwmUo31z9ty8IcVNQHnm5Ia6vJCmGhNJJ8DpjKhq2R+ygnaNNpEqY
	GdcWCtzmd5UdbCsX6ThTtAb5HaSZbtKAQ0eLJN2NnrNHoT0JhadMx1QhjowGO4Ku
	tfe7OXAlQxPOuGHMYKoes23cCD27vtp+AEuEYxBV2ANysgIsyV8GciF1KU8mXcfw
	PLMdBU+3WM6sE77jlTCqPL8axxuCvPn/3mtOiYaHJ13Eps00381ODLISePg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4as0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b95d06db747so1295494a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763016080; x=1763620880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=itXOZaY7x1TGX6/xA4E5opkKNxKxU/9ZPG41M+024pX32EnpyQQEWmvG5+5vVfRkLk
         TI6tJ/p07XMtEZzsoK6OMGjHdqzoSKH3cPB3DjiuxhjVMQP006DzFS3DpqwE2j/vBPjH
         l71XRKT/QfhP43sRj/l1lVXyIRgFeigXkNG0pI36WAuH9aOFDn90xTlauhivjuKlHB0W
         EEiusmlsW8j7fce3K5DyYocq5LmscsKqNZweMgxF3vL3i75yo/APtlbidumFTM0DlWn1
         z9lnW6wUEgdaQCDQ8Q1a1NIr/z3NU5ggRk/JpAXiKPxoN2B+w8MhBJGcg/ge8RN8coez
         5rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016080; x=1763620880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=wazA4OMfMjezFX4y+aVl3Tn40nuawCmw3RtiyU39rsFcGuXr53UqYIp+IMxep41E+m
         4Za7P7m1dtOfApwY3jPooR/NClMsuu1VuaJhDysDhKZ5tpqWolD/XP1YAT3nOQaBsp+l
         wo6bC3nRW6esPM6A6P49sixQGO06TCiMFyeqhWBouC8hd8PJAPrv32myo6Ven4NpKGQq
         2AcN6OU3JIDgEiS2LLfszDcTcOiQXoFXLovTwDFVYt6k9fw5DQhp7Zj4Dtqo6cUk8Wz1
         EUElukhFA3GzeGOuloqLuAC+0hVZByfsl7aC2A3aee/sr7q6dvgAVsPuEwi9hTbYGIKf
         vR3A==
X-Forwarded-Encrypted: i=1; AJvYcCXmtk+qGE+EDngVAddSt5V7m5quE1g/ukProYCYB3g5r/rWf4OcI5rQJ7Chmg2ZE6d1b085RYVN7lVRg3xC@vger.kernel.org
X-Gm-Message-State: AOJu0YwGAg6eHOEK8DTUevZkiX2iYq35944KIkzcK/UyefztZLtMV3d6
	NdMt6qwffNXsX7pxadH6anAG2gFTteCKTYGEM1VM/7ZyOkOHELurUHt7oVjKPLEaSlkGu+HS9ve
	1DuQrH0OyMGI8g9ftTaSjrangiPfWgYC+terxURv8oB8sjU8YUYuCZuya2xheNdBtOYQF
X-Gm-Gg: ASbGnctAYC2zDLnjTqra0J1gZ1EjwvHaKk5gt2c7i8XmxtHLAbLx6M3O5lKB32JXdb/
	lRVxrfsRdLQCBbrR2ApGl/WmdbECYUzOjveGQkeSuGw4wCY0/7l+ucG4ttUFTFUgNcOn0XMAIA0
	mln+k1k7WWZbceTJTIx7LCbMDYXacz2vasn5jEt2oBqbYWfHSslsKUJ5BByUwKDCv5z2DQXIePI
	qNdxBacceeUfkEGL+7rMc1ZtDSjg7uuDaWZgjdSZtwk+mQvKLawjXaRwPdIWe0Podu2IPTpwIvk
	+SMqMrGYk43n6uZmuuQCoQl6DjOohBYPGqguELkgC7p8XgVvqij4wbIYCdScZ7m8enPEQ8ROICy
	ezdc6M6ibIwbTCrAtbjBJQmvBj2N33IQ=
X-Received: by 2002:a05:6a20:914b:b0:354:1d68:4cd with SMTP id adf61e73a8af0-35a4f6924ebmr3655277637.11.1763016079647;
        Wed, 12 Nov 2025 22:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtQXaEJw3cpwnHLq9LAZYgHeBTeUkFAJXdBKUg5ZDdPcbmmAje3PWxAh4kNGtp5umDsqMu7w==
X-Received: by 2002:a05:6a20:914b:b0:354:1d68:4cd with SMTP id adf61e73a8af0-35a4f6924ebmr3655234637.11.1763016079132;
        Wed, 12 Nov 2025 22:41:19 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:41:18 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 1/3] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu, 13 Nov 2025 12:11:09 +0530
Message-Id: <20251113064111.2426325-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: on6NIdChM3eDHRcg_1E4Y01ygqEufLWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NCBTYWx0ZWRfXwewws3Tmx21a
 Ts6aMo3EwB+rSoARIJLevR8ZBUjxLCgArPQk6vWfgoR0x0jlZ69mauIKa8vLsRIBngHiD6E+Y1g
 ugI1DfDkkrtUQTIojTcOP6zwJXFOSRF2DxPrOaWS8vDzrPYlz1BTm2IhMhdsrrIG8LyJIOclduc
 XQwFkq2tuniCc2ToDbFXwq3z58Blg+kJinVxk+ogdG9X5MY6fahttoY8Ng0BDHND2JH8//4HLy0
 axRH5sq8S5RU3Uf46xwku2DJh6Qt/tCdWMoguRqblppjCJ7eS1P8n/dOtFkUBhJ139DFWLDLsGr
 oksMOJQTOKOABC37Ri+qDg+mozbHeoz31Xx5SGRmDtMsVYKEXWe3pZxM1n+bGhWdF1rbUR/1W4D
 gugAjF1VpHp01kWdS1fWTPsJas/uKg==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=69157d90 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: on6NIdChM3eDHRcg_1E4Y01ygqEufLWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130044

The fdlist is currently part of the meta buffer, computed during
put_args. This leads to code duplication when preparing and reading
critical meta buffer contents used by the FastRPC driver.

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..679cd8997a00 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
 	int pid;
 	int client_id;
 	u32 sc;
+	u64 *fdlist;
 	u32 *crc;
 	u64 ctxid;
 	u64 msg_sz;
@@ -987,6 +988,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1089,18 +1091,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	int i, inbufs;
 	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
-	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
-	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
-	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
-	pages = fastrpc_phy_page_start(list, ctx->nscalars);
-	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1122,9 +1116,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 cleanup_fdlist:
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
-		if (!fdlist[i])
+		if (!ctx->fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.34.1


