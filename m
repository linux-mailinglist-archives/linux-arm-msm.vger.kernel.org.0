Return-Path: <linux-arm-msm+bounces-113487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0hBIvjeMWr3rAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C04695C10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:40:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l2QSqrnl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z9UFwjbn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C246318983E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B997481FCC;
	Tue, 16 Jun 2026 23:40:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058148166E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653212; cv=none; b=OTYkmH4/HzvZt34PYwSaE64n0YJv9g/1B/jMD3i5iP4uGRDUdWivK4eKHizcqJ7a9C0xLEnNFmR6geqDLZ50pfgLzadyoPNWzH+ixl0QwXeErBTXRoM/QKTRaLjHj3vZho04IhdpKPUGDDqSO5OrOXTqEmvpFoVM0/f0w/QGORI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653212; c=relaxed/simple;
	bh=yNMUWb5Y+60YVxGF7kl63GNYPl2UKKGa3y15L2vP7rA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EofeFtN2qxftLuqLs1897stjhwhE6S101j+MJtwmv5h0OOPK2uospjb6fiyu3PxzupQHv/PwaB/H3WYJXOhl7FW8XnegKq4IgqrpNjCIYgmp7lQkIjwXIp/pm+1m/fFcCW/IcDimS8mZgtWblWjUTf44L+gErKQIVzknV4D+kXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2QSqrnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9UFwjbn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLVYTI1815181
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gh9zzMuTowQO7XrJBUk8TB
	IviH5cPM1r8wircBtM+aQ=; b=l2QSqrnlIBHHIV0TYvKRPJUUMWIaPQNy/kersp
	PTLnKT5JLleYWn5fprwkTPShX6CN283/NB8ziZnSYrXk/xBiFq03oQl09os+xa1p
	l730koI48caG8QQxwWXCaPXZN3XGJiYjWcFKnqQ5BExxT2nK0cHfjFCjxDWBv1ie
	DPNzO4qF4nddorsZ9qgGCpFipBqnhbADoLjyBsp1jbJa2nbiA69DUIXNh3kFuzWu
	N3M8PiehasqM4wNle5204wdZuqgtp6UoyLQYHQGdqz6XJBZL3py6K3j24eZZ/olv
	NUaPFhDM5h0Z89/mRd/Tnj/J4sJBjsb89KDE1D4/+ZlyRxVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbrckm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 23:40:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304dd29553aso782292eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653208; x=1782258008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gh9zzMuTowQO7XrJBUk8TBIviH5cPM1r8wircBtM+aQ=;
        b=Z9UFwjbn53z5onIOOvEePpUKwyxVcml19kKKJEK+adQr4JvcyjC1T38RL9ts0sfaAR
         HN1w4bS9dT/NG77b4qRfRDpTbRiOewgDUSAyg3spe5YEnhZxEiH0NlKIEupRExxxUrX+
         e/Qum5b+37Z1Zu4LMesTaCYbS/PAnfQGONdfh2WcbNeNkeS9stNpXAn0dmEyYCU+4I3y
         P1neLoYQVEaA6d51uUEZF9EODuh5FkuWlAySlwldpxm7Hr80DeuZZZp3AVF26bHrl8pJ
         P8psB1o1a/EszHtUlbxj6oRon2FCxm+F5dygyNJnxgzlhPN8LgcPJ5DPy91hulpEAeki
         9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653208; x=1782258008;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh9zzMuTowQO7XrJBUk8TBIviH5cPM1r8wircBtM+aQ=;
        b=AF8+MFHN0Du8KzfH17eHiaFwhPC8PhWVHuhKwV/AoFCh5VIUTOMp6YM2aydxgRR7Th
         5V1Utj4psKuIG9mP/0S1r95QZhRC1ThgBw7wbsFMxcC6HJilKS75IAIW5SOGxJhw3JY4
         KYp9/3PDWAjRALuWQLsPvSOhx7EoD6uufPRN96rtRvpXB07VK4npyCxc6Jn5xG3/D5Qs
         KZdENgReg9IsTnSLRSpFQwyvwMe4Gvv6958RYmRHoSvRfikSn5cBY+XGntmB4CKx0cki
         ICh0hjLEnBMRgGduVjDd7l3V/8uSyRuSfnoQcufzj1PC/38tNbyogA8GdAgAC2bKZ3ey
         GKeg==
X-Forwarded-Encrypted: i=1; AFNElJ9TgAhoo0rqFDvhPb8rQ0Lb1tZzaBua1/Y3lFC7uxl0uj3AwfXpxmJDhwKmDCWZhYfCM6RBTF0YUB45sPc0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgY7E9jj8qFRxD/XGweuMmp8IgJ9nguXABJXnaDS9eMewdkOkc
	Lod+Qb/YO9mj7gRfyE8Gpc/8L0y+WVbbXVgf4E2NuPHFr4GwWRrokwLqyi/KluLOjmHgLa8qGNG
	RI1bmjOwsr6vKXF0jKH2Ajkc/lLebGWn5oTz6NMM0+OkNiTe75E3qSGZpr0pygqHhf9w9
X-Gm-Gg: AfdE7cnZNjwC0xo8dVfe8ChKU9vXMQTBep7Tq/6SXgIpRvRU/M9IPJ/DBEHGTstgUhT
	Ahc8nG85wfqPIUUHqsYO8rAU0REx6kWl4rEUvCfuSK3X/ytJbwzmLGLuSxIPuRc+HPsZj0VTpdk
	jdbPQtMCivLIEid064t6zNW7y+xoJ3KcNqvXb0Y+RZTNLiRM5W8CCBdVjHtCgc6yDrM5JaHzt/a
	jriXZlMFYd2Y6HCL6Xk49tNyeRbnu0dzDNCNrlWDGLT8hpJOnjlgG/8M511cfNAjL1WirJupBbx
	GhFSsWpzv9e2auSkB2qLXWeIK8qtny9PaVdWu5n0LQ9/vtmyUqGy7Jc/Fcz4cyKsumzZjD6ukJH
	2Vx6NGtROAibu/1Ez3cAyl2ovz7s/S0YA+2nlQ/KdarTwYSxQyhR6e/NdbasjI7cfsMBiR+i1on
	wPHYXF3g==
X-Received: by 2002:a05:693c:3118:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-30bca0ed2d0mr381151eec.7.1781653207562;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:3118:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-30bca0ed2d0mr381143eec.7.1781653207015;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH 0/3] Implement Region of Interest(ROI) support
Date: Tue, 16 Jun 2026 16:40:02 -0700
Message-Id: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPeMWoC/x3MQQqAIBRF0a3EHyeUlkVbiRCzV30IDYUIor0nD
 c/g3ocSIiPRUDwUcXHi4DPqsiC3W79B8JJNspK60rUW8M7EwAbezgdEs6i+dU3XKwvK0Rmx8v0
 Px+l9Pz8dmyRgAAAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4136;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=yNMUWb5Y+60YVxGF7kl63GNYPl2UKKGa3y15L2vP7rA=;
 b=D+ravmlfXpAgpOVhgJHA2Ko1YabJwKfFtOKcP7KtGU9xmyChul2lKuXuQzFzfkNdGhi2v2uS/
 QZf4rCSHsKpCaWx+8BFsO4u5dB+fwFQG6yTKX+uIiyfWOcxYUU1DzIZ
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: 1PFcE7ZlFr01inK6EIzn7lG8WTM77YkR
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a31ded8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Um9VFfwTIzMb-0Dl9GAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX3LiR51O3MVio
 7wzEAhNSmYkhbiUDHsDRH7P9sLDGD3ntuPJ9rVBqcQOtp0NlPHUKw95EqJr2GgZoFeXZWdWnD2J
 n7+SmTcOHlM5qAAKWhOy9M8A+Jp2zpc=
X-Proofpoint-ORIG-GUID: 1PFcE7ZlFr01inK6EIzn7lG8WTM77YkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX/jgdSHfNEM/1
 mYpQ9jXZOQWFB7DAWkMcvSqLP7UatUFF1VZ7XkXRidrDfz2VKpOYnthPC6eNA2EsF2iCNIGHTS4
 xD5hEYc2k69CtUVi/dMe6dSBB+b9FO2sNDPXcovjRTkmOyqR7UNH0oMIjtFip0FPfP9SsQ20gEF
 Ur4TMnwQWz/1zST+zPD1jYyWnc4jdzSmmJfdlfIHaGIoAX2wL6vTjG2HBDqAxrpiwYOtqfEPJ1T
 ZgTLbKLM51wsza63y/uVvjDpj9P05g5NM1hMU2bEZIiMC65IexHKVONuNEMQB4NyUz8DP/GwI6J
 oWI2Km8yaJe1XoCoSeWkCvfO+4dL5OlQqAmQRrgPOScbCnlC/v4rvwn3gcE3XsYIvug7xztc8MT
 O1lu68T7BzuHUBVjKU+PGca8FtYApQuADQxaLAolMKa83wYAZYSBb01jSJYcjhU9W67kBQZnAS6
 k8ebzMR5wEYpZ0JF4rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113487-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23C04695C10

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for iris video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  14 +++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  16 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  21 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   1 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   3 +
 22 files changed, 409 insertions(+), 6 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


