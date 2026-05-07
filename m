Return-Path: <linux-arm-msm+bounces-106371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE0+JQmQ/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1824E9031
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 424BD30C2507
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629C63F9F4D;
	Thu,  7 May 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEywWpGS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YI0h0a4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5133F9F46
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159038; cv=none; b=A/UBQbODYxJAEuQVMWfidEQ834QzvdzvFxwRpTA974RdcyMAzuEs9YNsJvcaDeG4DcAuHvv5jr6eoNb1+30qvMQ+rZh1GWjWybpfm4nhKYYckIn57o8upsIgzBR87gABjY+A7urG1Zpr1kQ26XIdRMTHVYvxXZM1wkznclJ8pw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159038; c=relaxed/simple;
	bh=q9RI/4rORLjuoIkao8D5cG6JGxpUvALVyWJahsPA044=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgTPjh+4SFYSocqN2HEbX0ejhHWQcKx0YDEOWbNUYkNMiB73FcNs816F7mgIFzEUWBdcqe3FddfiI9qyvNsW21T06dHzn0Re6i6NS4NV2jT73EeMR9iXlLFTu+117549BfTLn9M1Osz9dg80JAtO/1kiBc2iqpXV1FZauEuEwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEywWpGS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI0h0a4l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A70Sm026476
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MiMZZ1052yDPRoDHI1EQCs5Lnko8TFUQgp+tMPDYfxQ=; b=oEywWpGSzWRePXJK
	gmG1MvdkLWgvs6152dzalF5sQftTpJxaqH1daASeYlBM0l5gYL6pLSiH5qWUfe4H
	ulAtdmChIW1WcQrRFRMDv+jKAyamkWAj8q+pcpvy1GfdhD5pTLTEQXFepJTimqKq
	oXpidnNp2Eu3jRbNtlnwIA+nv2PLFjUNt8deB9mcIFo0LhbmV0kVAyw99zuQqDLO
	5ONobA05VEM5di7vVEqScyCEnIiVY1IFHo/n0gvqTWvRA9VgQTzOG/u+Zq1d8mId
	Ois3lr3MHOo8acLrGGpqJjE1Lfx8IlExdZns03/+lgjp7Pz7AxupBT1G5elMEZiM
	mrwKdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t1yud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba115ab6bbso8416765ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159035; x=1778763835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiMZZ1052yDPRoDHI1EQCs5Lnko8TFUQgp+tMPDYfxQ=;
        b=YI0h0a4lwy2D1Pnc0i0p+AjGLy0ck7pYwlNEU/7emlVUPF1nM61pIV/WhEjTP9RSzZ
         5kmr3OThH4CifStHPOVzCt0VzfbmwJMrJ/ohKS6AYUWrXfHaWPnEd802hXfqVXbAiNm5
         ruirb58AUy5UZNzSHi9N3KTWCuzU/ED7vp62hPpWM8lc5qUJ/jU9QWLEl26HuiMUT3GK
         3lcS9+3avBQC5kFU2FGtm+fUfXMgxjaT8Pznh/nnfAmdop5gW43dibaFt2kGoCBAhcpt
         K8yj+PFEQ5gX+F7R0pnrMUipBcNEDfAAvRWGbGBBW74P/WayyyqaexSEpULhp1hLCbKa
         R0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159035; x=1778763835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MiMZZ1052yDPRoDHI1EQCs5Lnko8TFUQgp+tMPDYfxQ=;
        b=ICY4QQx1yr0MTL4ZSd51TRQfAahmsklqGVCLubNwWsmgzthIXTLpAcsulu3+SB3Cal
         3tOJtBBcAqcNMvJjrOBXsC5yQvilL5jWsk4cLsJ00V+v+8FR6Oj3zcYnYZVoxI3x8KYN
         6F+PQlt7VVXWmqUK4TWvmtMmvumPOfVN+WKSPo2MGRmIA8gBnvUGU7ZRFSvgxNM3JuE0
         cdnz0fFvuZJrqWYGNOruiLgmkIcE0AkWZ+SXSOZa0cpGKL4mMSuXwOCxxNsxENDg7WmC
         CYQWOVE8AFfs+HvcEqdL7BCBIWMNf0uNVw2YLWtpYqbEGw42z9xkROnwHknicLbPnzPt
         3Jhg==
X-Gm-Message-State: AOJu0YxlfjT/VJwsyVcT/gT6oI7kQ0B37gU38IPa+ubv0FqZkfDY8doA
	vCQEaZYYvWTMnGfk+ht2N+sJUingrH5v0Cy0VjvAD7o6HenDU/BqVbnbH1S8vOHOyMnPQPIeUZ9
	7hkZaOwGZDom0bdJM4LBfboCIu/R3JM22ZbRNodUjGRdCAxPbWPHSbH40D97LEVY+AaRi
X-Gm-Gg: AeBDiesI5fogc6BOA11b4WnZ2gKUf7Xiz/6fjjnLEzEO6cAtfe4vTkau1+TKotBOFLG
	+jaCa60ex8eyD05Jny44BFUftM7nmULxd8aDp/lfunp1Wvog2AOSS3u25/lqVI7DIlHSEla8h/j
	F7gc9rUcbPiDQcKzN4XGnMj+b70cyJ5g7tBBMUDrKC8kjGjwfha/dHuC63040tdKQt162tlThFL
	pmryLDNjUHt3L7Jb/0iPv658sq/MGiwKxHDpEwSd/TVJkQhoC7Drd0RvA7sf84pW16IY5Lgq84q
	3teBWfiLxrnQhj8TIydSgaqzW7gVK5UmvFqUI9rjkipSJ49hYsGDJci+TcnQyWkIZAkK1hPsj8I
	MbyLGO+6CTYqLdzLm4bhPgOUKR/zPsUHk4QvApxoVIXe7hgddG9it8Bi9xvjZ4xoDnV6Pmfs8zZ
	YlpdkGb/p91yaTtpeYcMFlSxdp163WkHAlR9jaPvjJUA4wjQ==
X-Received: by 2002:a17:903:4b03:b0:2b7:ac66:27ff with SMTP id d9443c01a7336-2ba79c1032fmr77298945ad.25.1778159034939;
        Thu, 07 May 2026 06:03:54 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2b7:ac66:27ff with SMTP id d9443c01a7336-2ba79c1032fmr77298475ad.25.1778159034308;
        Thu, 07 May 2026 06:03:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:12 +0300
Subject: [PATCH v4 16/29] drm/msm/adreno: write reserved UBWC-related bits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-16-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9RI/4rORLjuoIkao8D5cG6JGxpUvALVyWJahsPA044=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2GchYN7k+lOs1ISxjgfJ+YmoTHo6uU2sMGV
 ijFP89R/TCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhgAKCRCLPIo+Aiko
 1We7B/4nSv9/kJ3DeWZeYVRCTBVttJUCHRTg8V1FDz/S49P6d3ChSpvqwAtC6qEbbwBMkPev70i
 hajv0BIcGPINEkBkx5Szj8sd9OuxWfWFZxhAoGTkAG7VHBGMjLVOt3ySYJt/t+beCHOUxmurbQx
 HPoEnTHbPhbDKzNX4T9tAPB3L/GJfAGyO7lvLPpxRkaDVzp0U9gybFNy6qNOn2e8p9sGVtVxK0I
 6Z36Je1P7olk7igueQ1NWSgmlKYr8KFv/kTWzEjgHsqIdD8kziId5L7ePl1MJhTnIwQu/FWhIcb
 ePUi+V4fHBQFJq25foDv7SgGqmdLWsMvIA62sFVE+boCOL4v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc8dbc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jQZLqUlzLjo5U5EXcnwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 882c5N8910er8-xKRCHxynUj1qQ_tQEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX5EMBl5QFqqQ2
 c5mH83Q/u/DOK6cq0+HYAcsjddxsX6TFnKNRhOPOSNjLBfF9sbMV048uv9Q1L75sWTbXIcl07xz
 scWoWrfWJp0XJhw7SN6deehe+Pz6z9Eo+Z17Dc06gkTNbOsKMNpnf3F37NQbIwWaIotHOMtSKpO
 KLeP74CkxXiy1/Bu8vOsNkcgGid9pHpCKp+zUmGTGirbjWwMgwS90stYC6RCQQ3lJ0JOZaAQLb1
 9FK45sybwFCRdVFgvfgGT21Gd8/YUm0LLs7pjjVGhtBrCzZrLHzJkwH/oM/NJic12HZemJ3Ae9x
 SFMaeWLBp015XVROXlMp12Ef4o+jjFtrZNP4Zm5fnNSMSelkL6V/jn1r766zkTBSLogmfylHVQf
 14kmAQYIXhwm8Auv7ErP9TBzmS50cstD2SZAsFa3rN4ac6vCMFYRgpHmgeSt2ZJ2OzLVbE9dykR
 +6BquoReIrHvKqsKJig==
X-Proofpoint-GUID: 882c5N8910er8-xKRCHxynUj1qQ_tQEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 0A1824E9031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106371-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On the latest A8xx Adreno chips several of the bits in the UBWC-related
registers are now hardwired to 1. Currently the driver doesn't write
them because there is no side-effect. In the preparation for the
refactoring in the next patch, write '1' to those bits anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 53def136e0fc..7a6223ddd8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -288,6 +288,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
+		amsbc = true;
+		rgb565_predicator = true;
 		break;
 	case UBWC_5_0:
 		amsbc = true;

-- 
2.47.3


