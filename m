Return-Path: <linux-arm-msm+bounces-109859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D5PnOUe2FWoqYgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:03:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3B5D83E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74308368AE0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12235400E19;
	Tue, 26 May 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEwh4jRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbhdNKUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FFA402BB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807238; cv=none; b=YfB2CPf56UTWR8X/3OlOHvxTRfKQpBaV7+ajE/V929TALl9Bz/FzhmyNMfn3Ip+HiTMCE9mvqvYfBFg4/3Lch7aCWJa2sJG5s5HNtrCnNMwh21YuIC4vzmJ704tM1j+yAe0cS2KA/l6YKtudKoEc3ackEw69oRnR2sES5BfvIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807238; c=relaxed/simple;
	bh=rkBYJLAtUSX+jsoyzEae2Xb+U3O48Hqd5qakdxSDcIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDPCTZahPRiVWIVVJJtIEYqgeyE1VCvlvTEKWx/jvEsAU5omGxRCStvrfPyqkNeV8Ok6saKZ51kn6oPnC0Ndq11Uex0Lo9dLD8Ho5+tCdqF+l8h2sGbaLF0w6Xatw6bCxWOiZCOYuoEBZVyi14uhTDSOOONJrAT+07Iwj0H9JKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEwh4jRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbhdNKUx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhr6O2528462
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCT
	NBea45cE=; b=lEwh4jROiy7b5bOqBdx5Dj7n+fUnyiimN8+wZZ/kSOh8n29q510
	OyBYZlx/6v/jkOWWpSAApUqShNC6CX7CH1E6qo4S/pWFMU7vT/LWBvlmMjrAXhJr
	s1Qjqj5tBwzIfPOLpkd7H4cybHv7V/STNmLvGpS9iraKxc1n9MuO1xt/AKWCIlUq
	zq3PnwRVC2l/+pZqqpgNCChe96x7XCje8ZZ6Y72rx3cdiCjvGPhBU4nAZQ5CIoO5
	jogMNNjuRczOuMONQ0VlUhO/WzwAeSlfq22ofYiyAR1gjulNKz2TgH3mQcRAHb4c
	ROTX+9OTiLboSLPnHoXFcYPkD0FzUNktYiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnrafp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366122e01fcso10347707a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807233; x=1780412033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCTNBea45cE=;
        b=UbhdNKUx+i/w8PE/2fnhdnWjtle5Pxmaw8t8HE6y+W/xaLSx/QHM8kE+Uj83mOfSLA
         Fy/ECFqgPjdfsmlg93RfREnXt1EYOpGUbav3O0baGYRT1/YH5ZqsPVUV2+fveSo8RXm6
         c3KA3AMg72EjYcfyQIjg5Rr7GQ8wnvy95LraT6spdlMaIE5oVSnaYdMq27mv+czXbkH6
         33xrN3YXYxOx5OEdCfja9CbTHLxxIimpVCZrz5IFmZ3I6PaBiD4Vl9x4nuZqHgknTrPa
         pTpenok9JAlIkAtr8JkjGBs1hV5VecbOPZ90SV3wGrtghh6TtaW/FBpJQ0Ob/z5/45/e
         dNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807233; x=1780412033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCTNBea45cE=;
        b=lVN0+sBAvsMigf+XEKPPhHecrDI1px7fVK8iFXFCwvjIz96789sRwWGTz4OqYR3GH4
         z04+qJUAxRMO7hZ5iirPj2ptPgWYFxLjuC2DX+2xB97FB/j5O1vVMmIN+nZO+m6goOjC
         s1NWO6469xUiTbr9J94wp8onR0XXR6sFPxX28Ck/IaCrhFUifNnQS+Ic5oT8H7o0vVBN
         DgxJIMeCAWymdSLkAkmGEioc4R8YzCiK75lT/EsKnOvdGAuUwRGM50YeK/6R8kYwEC8i
         5nVwGq3fkfqt/OpALs1dA4p9O5Ts1Gmn90R5JSqtzXOEC1MWqUNMfs3oMuszoaxm35h8
         ZKvQ==
X-Gm-Message-State: AOJu0YwYMM08zN+wNTX2sorFM3VbYsCjkkqnO7huM6sQVTFjdYwPcIZs
	WyWRWzWe6SfV+OHbLF7+x7hgpHmJHE9QM7BqFkCGeb7SFy6zQxAij7hGfm8CD06ueFf0NHMYc0n
	JZuI6suwbSCHUTaJPNZCH1yx55x+GE3bvkD+mhsy14aRmriCHYYLOVIJi4cND9gUBr0qL
X-Gm-Gg: Acq92OGP4sSyD0vPwoV4KuQVtPluPq739xTiL0mzscQxff8Iw+ut+jIneG7t4NLsFO/
	DORrDCyw1sJcbRSnDsDmO8xDm9ChUVNfY/5PQkHJLDN5QZog7fuE8TziyCd4h428ILzu58BzLp3
	U232R1tk8PqGkAAiyZxCRLYuVSvwgjAVVD+AR6wq63OMuG8CqBgJVpJs9as50zKK6MuNqOGhiuJ
	5OWdWNSYa6O3CChQNCmtuMz75Zb3TTh3ssUXF96mC/XnkbcU+wm5pNvokAWvdP8g5XvddBEUE5l
	EFKmNNfBemBNIpQGnYRcFGlR+1FNDdGX+/+VVlOnojKykRFrqkKz8NShpzZSKbjbzYPDYHpRtiE
	pbfwB5isiamKEqwLCjGQcF3Gb9fmqVN0t
X-Received: by 2002:a05:6a21:618e:b0:3b2:864a:ed74 with SMTP id adf61e73a8af0-3b3293bb68amr20294622637.43.1779807232874;
        Tue, 26 May 2026 07:53:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:618e:b0:3b2:864a:ed74 with SMTP id adf61e73a8af0-3b3293bb68amr20294576637.43.1779807232379;
        Tue, 26 May 2026 07:53:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm10757809a12.27.2026.05.26.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v10 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Tue, 26 May 2026 07:50:34 -0700
Message-ID: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GoxC0GVYkfD9ihWrHbimEa6s-meWheWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfX3sU2rrs+hzeR
 syNKV1gihxFLySdMLpFIKDB3L44KxJh0rbBxPauYAD9Kdt+0Q2LYNm/bxAVTpYKf5acndjWEKk0
 K/SB5SNEl7MX9ZqAmeE8nazdn5N/JZKjbmiW1L1fbtXVrRMsRusTxx6g87IZY+UryRyWnPr0hOQ
 h4u3otEyT4Nkdj9JPIK3V7H9WbfrswHqdfofUH/Gk1qPVum7cCoAslnBn4u3f7pqc+Mt5pOyq08
 gHCFYof/gzE3O2ou3EetWVPu5hOkFuup6Oo7tkq7o61TZG6NE4zsslqoR7waFIuWZNHsczhwOqm
 1lZiIBixBOdx5vpVRrEOnWNBP2I6cQGlWUMsUbrlZWn0r4ZiOrSXyTM6Bv+LV/RpIu/gYAHeZ1C
 l5Tg5Mw9isbQ/6bPHpPdBAMGurcGXLJ5+sy0aFRweHKuGWdo3RPGh68yr3E9ua4sXiFUIxKlFvs
 l3Na/AKErtDN+OMhuog==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b402 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Y_GqGrSV0k1v4m2USCEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: GoxC0GVYkfD9ihWrHbimEa6s-meWheWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-109859-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39E3B5D83E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new PERFCNTR_CONFIG ioctl, serving two functions:

1. Global counter collection (restricted to perfmon_capable()) using the
   MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
   contexts.  Only a single global counter stream is allowed at a time.
2. Reserve counters for local counter collection.  Local counter
   collection is local to a cmdstream (GEM_SUBMIT), and as such is
   allowed in all processes without additional privileges.

The kernel enforces that counters assigned for global counter collection
do not conflict with counters reserved for local counter collection, and
visa versa.  Since local counter collection is scoped to a single cmd-
stream, multiple UMD processes can overlap in their reserved counters.
But cannot conflict with global counter usage.

In the case of local counter collection, the UMD is still responsible
for programming the corresponding SELect registers, and sampling the
counter values, from it's cmdstream.  But by performing the reservation
step, the UMD protects itself from the kernel trying to use the same
SEL/counter regs for global counter collection.

For global counter collection, the kernel programs SEL regs, and sets up
a timer for counter sampling.  Userspace reads out the sampled values
from the returned perfcntr stream fd.  Releasing the global perfcntr
stream is simply a matter of close()ing the fd.

The final two patches wire up the needed support for global counter
stream collection while IFPC is active, and drops disabling of IFPC.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158

igt test at:
https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs

wiki page about the design:
https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI

Changes in v10:
- Fix some "mesa style" 3sp indenting that snuck in [Claude]
- Fix msm_perfcntrs_stream_read() to return -EAGAIN if no data available [Claude]
- Fix duplicate counter group detection when nr_countables=0 in the earlier
  group [Claude]
- Link to v9: https://lore.kernel.org/all/20260522173349.55491-1-robin.clark@oss.qualcomm.com

Changes in v9:
- Fix msm_perfcntr_init() error path [Claude]
- Fix off-by-one WARN in msm_perfcntr_group_idx [Claude]
- Fix error path leak of allocated_counters [Claude]
- Fix copy_from_user()/copy_to_user() stack corruption/leak [Claude]
- Fix fifo_size overflow [Claude]
- Use kzalloc_objs() where possible
- Disallow duplicate groups in PERFCNTR_CONFIG ioctl
- Add WARN_ON_ONCE() for pwrup_reglist overflow [Claude]
- Link to v8: https://lore.kernel.org/all/20260520162454.18391-1-robin.clark@oss.qualcomm.com/

Changes in v8:
- json fixes [Akhil]
- Use dma_wmb() [Akhil]
- Use kzalloc_obj() where possible
- Link to v7: https://lore.kernel.org/all/20260518190735.16236-1-robin.clark@oss.qualcomm.com

Changes in v7:
- Use smp_load_acquire() for fifo_count_to_end() [Akhil]
- Defer installing stream_fd until end [Akhil]
- Link to v6: https://lore.kernel.org/all/20260514134052.361771-1-robin.clark@oss.qualcomm.com/

Changes in v6:
- Reword comment [Anna]
- Link to v5: https://lore.kernel.org/all/20260511130017.96867-1-robin.clark@oss.qualcomm.com/

Changes in v5:
- Drop unnecessary runpm in ioctl path
- Link to v4: https://lore.kernel.org/all/20260506171127.133572-1-robin.clark@oss.qualcomm.com

Changes in v4:
- Fix null ptr deref on older gens without perfcntr support [Claude]
- Add upper limit to userspace controlled FIFO size [Claude]
- Fix nr_regs calculation [Claude]
- Link to v3: https://lore.kernel.org/all/20260504190751.61052-1-robin.clark@oss.qualcomm.com/

Changes in v3:
- Fix loop counter issue spotted by Claude review
- Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
  available counters in case of -E2BIG
- Proper barriers for modifying pwrup_Link
- Link to v2: https://lore.kernel.org/all/20260424151140.104093-1-robin.clark@oss.qualcomm.com

Changes in v2:
- Rework makefile magic based on Dmitry's suggestion, and add a2xx/a5xx
  perfcntr tables (although only a6xx+ is supported at this point)
- Fix compile error for compilers that are picky about a struct that
  only contains a flex array
- Drop a6xx_idle() under gpu->lock in a6xx_perfcntr_configure(), replace
  with perfcntr_fence that sel_worker can check
- Add a7xx+ pwrup_reglist support for restoring SELect regs on exit from
  IFPC.  (a6xx doesn't support IFPC, and the pwrup_reglist works a bit
  differently)
- Stop disabling IFPC when global counter stream is active.
- Link to v1: https://lore.kernel.org/all/20260420222621.417276-1-robin.clark@oss.qualcomm.com/

Rob Clark (16):
  drm/msm: Remove obsolete perf infrastructure
  drm/msm: Allow CAP_PERFMON for setting SYSPROF
  drm/msm/adreno: Sync registers from mesa
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Add perfcntr json
  drm/msm: Add a6xx+ perfcntr tables
  drm/msm: Add sysprof accessors
  drm/msm/a6xx: Add yield & flush helper
  drm/msm: Add per-context perfcntr state
  drm/msm: Add basic perfcntr infrastructure
  drm/msm/a6xx+: Add support to configure perfcntrs
  drm/msm/a8xx: Add perfcntr flush sequence
  drm/msm: Add PERFCNTR_CONFIG ioctl
  drm/msm/a6xx: Increase pwrup_reglist size
  drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
  drm/msm/a6xx: Allow IFPC with perfcntr stream

 drivers/gpu/drm/msm/Makefile                  |   27 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  219 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   33 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  104 +-
 drivers/gpu/drm/msm/msm_perf.c                |  235 --
 drivers/gpu/drm/msm/msm_perfcntr.c            |  670 ++++++
 drivers/gpu/drm/msm/msm_perfcntr.h            |  155 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h          |    2 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |    3 +-
 .../msm/registers/adreno/a2xx_perfcntrs.json  |  109 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
 .../msm/registers/adreno/a5xx_perfcntrs.json  |  128 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 ++++++-----
 .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
 .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
 .../msm/registers/adreno/a6xx_perfcntrs.json  |  112 +
 .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
 .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
 .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
 .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
 .../msm/registers/adreno/adreno_common.xml    |   42 +
 .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
 drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
 include/uapi/drm/msm_drm.h                    |   48 +
 39 files changed, 6047 insertions(+), 2212 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

-- 
2.54.0


