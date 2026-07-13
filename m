Return-Path: <linux-arm-msm+bounces-118626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OgvtKil2VGoVmQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:22:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E97473D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/IOHKSZ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fVCIXAad;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118626-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118626-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51D703018415
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964453546C7;
	Mon, 13 Jul 2026 05:22:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9D33F58E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920165; cv=none; b=dNrRtxQPgPgomJWQ6ZCQ82YIBWbb1FCc0x7IYdTgc38RfYzxJxWlK4biFxozw28ZLNI09P0lTI6gw96YBUOvYK9ulwJw6Ylu8PXBsE5OeZ7jdVHcChIcpctpoDvYpDgq2LJP3lL6Jk5SKhFlPE6U9IU4H0Kf35U65pzqJ7tv21g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920165; c=relaxed/simple;
	bh=jSocg4W7Fm6BCEJ1cPt3D5MBJ9ChOmGGYTvNncubJq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fe/HqHAgW2mLUwEzNXqpdo9bsuGZeO4PFVW1DgV7M3Z/uLVwM/4ov5CJBC60Rb8B/kTzotaIo6lIwtztixRNNg/BpZcn3fetudM5NwyPra1yqZk27qEoJawaHMjugVX7WPaOLP0Nj/JlU+lQWZ3RB1fHKkrq+M5lpIt+rIKAf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/IOHKSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVCIXAad; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39tc7184857
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qPjS1A0Zh8DHuBLLvW8n3u0p7R2socgS97N
	yLVt7XYc=; b=Y/IOHKSZzU1yQStBFlWhxIyYE16pX9Ky/HFUf7OYhG2u5JSF5kk
	pCHdS2+3eGaEkZqUGxt/jpoFEfZmoFWUDfWLeZ/7x0VclJCoq0F90UdLuABvxR4W
	NpslEtI4nw1jrgRtYGidPObFu45IPD9HaxA1EibjERjqivUkXMck6v6VWOA0YLSf
	CaPBfDcuHWYTUQTNstkcMCMD/CYQ7Zk+143LNv+1wKDq64nbpBkSUj8h1HFaSAp/
	YmaELZVTupq4lxCFGtHVjsl7/qy0v2dqq9zYvaiIhk9mgApPf4NZC1hSd/UCys2K
	IhrS/CkBSh5OFMK/eyx7p3URiSZ44Ng1WLg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamvfjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2481450a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920162; x=1784524962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPjS1A0Zh8DHuBLLvW8n3u0p7R2socgS97NyLVt7XYc=;
        b=fVCIXAad2wVfm5112wyOxYi9+7ZApnFzEvWBlG9cD7aUUnMaLgq2c70BBzm36uK1nJ
         cYhiUJoBS3BVH4Cr3cvbmWyfn/AIkp5WDuQR9B1+dAjAKvdkhrgx70Qza/NY53ttUbH+
         ee6fTUXKjV67NhxPHHFo8YKq07LAzvhENW0+dSzHwftx7dmwNfxQIuZ2She296arQTIB
         YtYRzC1Kk5GKaXlQC1JSHp95ytOq804tiP2i/Vdf6DsomiCq/roe/Rpikqk4L+0ZcMkW
         c+kHL8p7e3hXBDOPECX+H2A7jcaI6yxbnl6DL539kioYukBLZU/3rcRTa3/YyzDAHo9w
         kxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920162; x=1784524962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPjS1A0Zh8DHuBLLvW8n3u0p7R2socgS97NyLVt7XYc=;
        b=LFxNjT9OZSCnNGJfnJe7QWUvaET1YGigcAbcs+I0/Kqyi9ZpJLbkEbIjSfKq2wX5+a
         pbgwo+ulM26ghqe0gy0EaQtabgrO/NmvIMJo1YCUb8pHlileF++9ooDe7/G6Mf+Tcld5
         uOcRQV2Rvpc9p63wExJB0RNxc7eS/beCJA099gAjok3sb+Fh3U3LdOXqqVS8lh5Y10BG
         uLtI1+cjSl2Uf6XalzrHX5wsY/JhNw070R1jxvfMIa39c2Mq/KnR92r7OpuCV5rbQbTb
         8EQfXm57ypjNn0tzZRpACX+CkC53SxEa0htoAmB5XEDI+LKq5RLYTW7YbNnX8VBy5jsY
         N8uw==
X-Forwarded-Encrypted: i=1; AHgh+RoHyIZa6e9TF4W3cpmfaLY2G+K4YrIt31dVbhOMXzTyRYz/cD8/TZxL/L3K2RIQ4+HQsNfTGgpAaVwm6H/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjn0OtYyh39+CsHMoOAzxhNNGBfeN13QPTsKESYyu7i+4obdy9
	myfPpMz0P9t0rLXnkcrG52yhE2Jmyw3tQFxlew8KEggWRXRcvwrehHN5t2qqzvviRElo5tFDLHM
	rTCDEjth0zieJfScRhoEOWHcZ/e83ffB3XfT9iqOkzKXfeqp6wD9Hu6rcxTrtVqoZlNZT
X-Gm-Gg: AfdE7cl7MHPlcLbPo9GoyAijb8tNMU7+R24XMe4vGwz8xLsYbbFFHegXJRpxvo4WuzZ
	a15jkSUO2THoGPv8LxZnKPW6luVnSCb37MRFrJaMAAOe6AckUqAdJm0sXuMk4a8ZgmUU4wIxyX8
	y2Qs5AlYomsELRFkIf7RM0laC8RqcKur8/ns5igmwxj9jj3gjauoxBW6zisArDB4SKuYhrM8O76
	tjYd8cRX4okFTudsfGrOLk1rWO69CaLmeLyekiB14FI63J0nlOu6e8d0R6TGTxg1aJr0VorhRgj
	3xUkwsp7DJyPm0VquzyN8dys1u0moiWWVJqqE0lJXTqKjc3nKYF3WY6PhJuP166vwzPR2yYqxfw
	cNAxWiySaCDTK2qaTegHY9N3k3lVw/TqalAt/5eu7upE=
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr7630845637.74.1783920162203;
        Sun, 12 Jul 2026 22:22:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr7630823637.74.1783920161762;
        Sun, 12 Jul 2026 22:22:41 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm6245605a12.17.2026.07.12.22.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:22:41 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v13 0/4] misc: fastrpc: Add polling mode support
Date: Mon, 13 Jul 2026 10:52:32 +0530
Message-Id: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfXxKXYwHAxAHqp
 CAJnrxRVM4JZUKVJldc0nqHPA6ajsvm21PAnHThmY5R14WJxqkQIvcaN06RzkpaxA/kMnM/D6LF
 +vLS4Hi+sLvLqJTobVodxZk4WJZ8y5w=
X-Proofpoint-GUID: fF_vzhz7ay2WdZkyh-uWg1wLqB-FpyV7
X-Proofpoint-ORIG-GUID: fF_vzhz7ay2WdZkyh-uWg1wLqB-FpyV7
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a547623 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JBkMMMYkqyTW2kI42m8A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfX8laIkl15TG3V
 xbU2L/1fSJH2Zcwfk0ggyC5FUAJIThYyPmHQQLPeNMNXceGP/TWn5VmIzAAIuhZn8j2ycw8EHQV
 GhCf9ySvA/f0VnuezJ55lw81dPmyovkqf8pJWKOzI1NhBERx+PLFOvUbgp3iHvMug5tarx4Femq
 pqMw4TZeN0ExA++IHg5tTo2JMhE81AwR1Cd8Zw+yyJGR7ETJY7t8EErSK4SvQIzF0CUFVoOTHGQ
 9PDsBRk9a7tOozasXZOxJgr3Sr1ZqVWW6JGZgpQQ3+YjDKyIj4xIOi2nCEKJu6Ih542ZmifyrQB
 N+Zz9CYtWlx3ioPZzjbLAQyKrON4fGTM2LRtZSOSU3WTTXvZi39ob34ovCdetqbRBkntOqxQkND
 z/f8zVnscU8NhinQPQmO5pOuSswlMBhKm5oLkap3oCdLy9GSwZbHRdlWc9JEq+KfkIlKeToSP3I
 q4ABtu6iZD5H5mIwvLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118626-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 453E97473D0

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v12]: https://lore.kernel.org/all/20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com/

Changes in v13:
  - Fixed race between recycled ctxid and late glink response.

Changes in v12:
  - Fixed poll_mode_supported check.

Changes in v11:
  - Moved back to read_poll*.
  - Improved error handling.

Changes in v10:
  - Add milos and sar2130p to fastrpc_poll_supported_machines. 
  - Updated comment for supported platform list.

Changes in v9:
  - Added platform support check.
  - Moved to readl as per Luben's suggestion.
  - Cleaned up fastrpc_wait_for_completion().

Changes in v8:
  - Added more comments.

Changes in v7:
  - Fixed warnings.
  - Fixed commit text.
  - Addressed clean-up comments.

Changes in v6:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 214 ++++++++++++++++++++++++++++++++----
 include/uapi/misc/fastrpc.h |  29 +++++
 2 files changed, 223 insertions(+), 20 deletions(-)

-- 
2.34.1


