Return-Path: <linux-arm-msm+bounces-111995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mXhjKKuBJ2pnyQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:59:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4865BEF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:59:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mKBQS0ya;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kgmdOXUe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CB2F301F7C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 02:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DCA361DDC;
	Tue,  9 Jun 2026 02:59:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36F35F8AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 02:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973991; cv=none; b=OofCNP4Ns8GjBld1nbni2Cbe6FVuAXxKeLCfl9Jw/G6+U+AC5tueSsJbxt2jZZYPrI7hG4vLomVdkIt0eqlQDQOcV7jVZC5MzHHqALQOgP62ZGuUgiDBIpM83Tu2oq/js1Z5wmO4bdlsJvvqzf/d1Ct/CRTFr5N9457vEc5rg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973991; c=relaxed/simple;
	bh=pxG9S1C8F/EdOXg/my2/Ig9rtt5BF7XRTqYBXZre2zs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k6nC91SOvOdK/xa73SkfOOY58/aRQxoAj1c/ebi9pc16j9lrMZ1co4xVDcDuL/2hvnBHyWiDXsaDSdj5NIzjYPs0WT6wxztT56GpRx/Fyt37v/AXqWg1c2J5HyacoQRf68RFQU5KQD1LEVkt6Jz1ZNU862gFOGqsuCQRfgkq1G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKBQS0ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgmdOXUe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s9iH996002
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 02:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ATfqrK83DCS8vP1sxQooyW+tmeEThP3HfRL
	fmcmX9k0=; b=mKBQS0yahjpgtjrb6F2pR9TEurOZkiuuNcMTHNmGkVK/Qa3/bDz
	dJrA3XWIVX98ui6q9mXxk11BYEepXOH1S8FtZi4aoDDX8gkUa+cbmWdMiJdymDr4
	S7799A+6B/8D12n0J9swyWBsf2HPj/yyEiy4Pla0HecngwerxlhHTZvXNKInvrVd
	GJINw6n/k+IlmNedOtWo0iuzgmRaCaeydaKZKDy3ABhUwnv5QbE+PxfaKhd/4YUm
	FJflm8oJeWF7apbl5d2enjiTgWimRNX9tBTs3Pqh1M+0jTxUH6jsXU1zMBooGLHl
	ob/g92+uxR0JLx+1rYXEVPkmhWWOTG7Auvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rudxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:59:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d979441eeso4303939a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 19:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780973987; x=1781578787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATfqrK83DCS8vP1sxQooyW+tmeEThP3HfRLfmcmX9k0=;
        b=kgmdOXUersLzBzCawakDXW/dCm0vfyZaYbXrWk1wQrWtNHPynaDp89Easf5U9PiJ66
         k0fid7c2wYEsjHiPgMLDK2mirNEJKQR/3wX1qntaOqdS51Re6TkljNxTA5TPGg4tcZdK
         lnqGiG0wH0JLh3aA35VuYTeEfpmBR3/xYZzqwR9boYTQFVHBaj4WqHwS4JyB/1ajS9Gg
         L6fstw8jZ0a45Qujio7vKypNM8Urw2mYKPR/sNVQhuvCM0qEazilktQD2N4id7i8EINO
         6paJDwb3JF21jtYUbWT09Z9Mqqnw8IiohL4qGi0R3FgWh0w6gtHXqyQjY1GTB4U6XOwD
         Uh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780973987; x=1781578787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATfqrK83DCS8vP1sxQooyW+tmeEThP3HfRLfmcmX9k0=;
        b=SolY33j4voDeaNWpm9YGhFqmkFcDUWTrV6cC6ilSjGHBkvA/4kaMH4iIJxz4ARV4lJ
         S+aRlKgx9xrWOAntlPjMb6pe+G94IiFc9J7PJK/eorUa4GytNRNqecGJ3lFhlJUGrVHQ
         vYsBjgBoONEPBdbHkgLbt0X4azzOCe2prlwh80z7EId7AZhPtjbI6fJBtPiWzyf1Ycvd
         W/HOJ1PpdszZV7jh+XD3pJLGdUCRCUGB/JWaeYRxbOdQS3j4L2Ok7HNi07wNUcKl7ABK
         dVYUf4y2MHcd8PGRiytLKlmv8AqCpWdPMmzP4t7TO6120NYangtlD6UpHaIq36NkGBUF
         OFMA==
X-Forwarded-Encrypted: i=1; AFNElJ8sFid1Q4WzlvavGP51td5psANcGXxgz5jHb5KaQPUsOr0+jTI4NmeeRFsiCKuKW3/4MtpCv53RxKO6Brl8@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsJVR6n8jGtmEenslHytRYW/Asrbbjs9TsB9eAUklf3oesHeQ
	ihfw3xYH/aOpRJiE2b2rQbxEGfldIw8f5HXocARFN6KtWJdWZY+2kQUl9d1c3iFXYgqXckWHNCX
	4pVvercA7Bjsha9h2PVdqy+vdgJ7yF2iYVCbwZzjXnmczQSxTfTeGlvMpvYcIySnD/Kie
X-Gm-Gg: Acq92OENxYdH8xGwuDojOjBFijlaxDlq/m1ZEyX4XfPvOJLeNpClHwU7zrEVjo+EXSg
	J/1SyynFkWGEW6fpYoeVHd8/S+jZa9ev3Yo4XPfxdZHmmzSCWTnUVmcsJfdlhXAF4HAIYt6beXw
	Aba6LWuibBxujw+Ts7oI/OVlO9fdFmRZEL0RQtnpSmFjK4Po6f9HMAjBXjM0ER2796D5kNbuJIc
	S/wEqjz8FyuVvOhMS4Wlv0qhbIez460BxYdSJIvrjbFndnbR/bmJSni/kumxTqDoZIoSqOoXP8M
	M2cwFS5dhL6dwUj0P/eigz+4AQ44O3wZ5K4brFrlfcQmSn44/TqcKfkDTE1iCS1W0yBYkOHeBuf
	cdzq9llUzexKLjFBHki9/q3BMi3AQuklAGBD+taZiDcY144TdBb4+YwbJuvK2iE0DQuCvYjHFCc
	O4Ow86ivZXAhkfF1+3BpZACFqd3TGS
X-Received: by 2002:a17:90b:4a08:b0:36b:71e6:3df1 with SMTP id 98e67ed59e1d1-370ee447dd2mr20935866a91.3.1780973986615;
        Mon, 08 Jun 2026 19:59:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4a08:b0:36b:71e6:3df1 with SMTP id 98e67ed59e1d1-370ee447dd2mr20935841a91.3.1780973986188;
        Mon, 08 Jun 2026 19:59:46 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm8713835a91.0.2026.06.08.19.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:59:45 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com
Subject: [PATCH v8 0/4] misc: fastrpc: Add missing bug fixes
Date: Tue,  9 Jun 2026 10:59:34 +0800
Message-Id: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oauRcokwLOMa15L6kZMDNCtE87zRPvQH
X-Proofpoint-ORIG-GUID: oauRcokwLOMa15L6kZMDNCtE87zRPvQH
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a2781a3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QQhtNXlrgi-O-yTIfioA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAyNSBTYWx0ZWRfXyQPVG0/YSMiC
 xCOfCnFTTWXR9qpDSOmTpnbQNQOwo3I9BI/oyBy0rn+g8ukf8RszVdITbm0AbEIujXC+5DVEUZa
 Hu/y1T2UwPU58cr9Spjghp6CRJRo7J2c0srfLTOhg9A/rIjQ3Ae0gwe+0mcepi/g9F+vkpWkebt
 2b1GyB9OAFZdf/w4xoH2C/ScSZblti/zjSK528MIYBjL1iuk5RolHohBa2keO8GhVfX+/PpqyXW
 oVjCnRD+ebL3sYfuPzgRdIkgjCYPZJ9N2pihNNRSxw1psPyLJAqOc3q0SxednApbFnxu+nYUQSK
 iy0W+VUaVsLvL760FeBRkSXbvZZB4cAzKzISr4by5RT8FFthC7Y9GmojFZ/jr4IkV9TdBAy8SNW
 OO0frEO3Sv9uQ3JkUU+Z31DZrXibr5DqI8LnxpEp0nEuvr+gZ19/qFbKIyQv3pcLiPWJcW954XE
 YXHmlkb+RXfc4L2iFAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34F4865BEF6

Add missing bug fixes in memory areas. This patch series fixes multiple memory
handling issues in the FastRPC driver, primarily around the Audio PD remote heap.

The Audio PD uses a reserved memory-region that is shared between HLOS
and the DSP. Allocating and freeing this memory from userspace is unsafe,
as the kernel cannot reliably determine when the DSP has finished using
the buffers.

To address this, the entire reserved memory-region for the Audio PD is
now fully assigned to the DSP during remoteproc boot-up, and its lifetime
is tied to the rpmsg channel.

Patch [v7]: https://lore.kernel.org/all/20260602071750.526-1-jianping.li@oss.qualcomm.com/

Change in v8:
  - Squashed "Fail Audio PD init when reserved memory is missing" into
    "Allocate entire reserved memory for Audio PD in probe" as the
    validation check depends on the probe allocation
  - Fixed error path in probe: use goto err_free_data instead of bare
    return when kzalloc_obj fails
  - Added kfree(data->remote_heap) in err_free_data path
  - Made kfree(cctx->remote_heap) unconditional in rpmsg_remove,
    not tied to vmcount or qcom_scm_assign_mem result
  - Used local cctx variable consistently instead of fl->cctx

Change in v7:
  - Removed duplicate remote heap validation check; keep it only at
    the beginning of fastrpc_init_create_static_process()

Change in v6:
  - Separate the handling of err_copy
  - Place the check for remote_heap at the beginning of the function

Change in v5:
  - Split reserved-memory handling into separate patches

Change in v4:
  - Fail Audio PD static process creation when no reserved memory-region
    is present, instead of silently proceeding

Change in v3:
  - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
  - Modified the commit message to describe the bug background in detail
  - Switch buf->list_lock back to fl->lock
  - Add locking to the operation of audio_init_mem

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Allow fastrpc_buf_free() to accept NULL

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 137 ++++++++++++++++++++++-------------------
 1 file changed, 75 insertions(+), 62 deletions(-)

-- 
2.43.0


