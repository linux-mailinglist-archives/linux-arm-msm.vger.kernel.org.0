Return-Path: <linux-arm-msm+bounces-96771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULGXETF+sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:25:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADA257C90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A71ED3107627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD89F3E92BE;
	Tue, 10 Mar 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSKAc1KE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sp8dv9CE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E03E9F75
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174094; cv=none; b=TTWWH5vxjM7rPPPLzbKL6w4HyiH2CBE9e9KSW0Uhf8QfIhXrbVDEB61uSVwSl1h0ooxxJZ597YDEInblh8ZZCfa+m9mMrJB/+SyC58u1WVc59cg/98qqjK758//hI/tVofZ0e7q0hwOpnZw4LfeyzJQno+XoGl9+4dg91fBT1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174094; c=relaxed/simple;
	bh=qLXORSt6Biqkafumy/w8uQlCnPelA2T/8GEvFsCbfAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mr1gRUEB6HWaUJB81Zbgv1HNsXQOQu4UkdUwGmrAwEdDJK+ta3OVCgzzhHYxk/AwT0/aM4UszkVMMvx1Vb+dxJ9IUz0hs9uCMiiLNfVTOxjdvLZihGVhOxcgvQli2Z34AYnRQ9YGq7jxMRE9DYmm25G1iVRc0OR/dMG/sZ2PvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSKAc1KE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sp8dv9CE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIhZ6G303910
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rin5Xzgf9RNm/Gx3a/2HtbrcZkKjggIhMf3Yv3Ghmqo=; b=cSKAc1KERyQjjkOA
	qTajW6Q83Ix/u5Eo0LKOiiBoEeptb7pCB/5odF2wr54RzKSDwm2ZvAH1qbcE7bvL
	888ZY5YbJRAd5+ZbXvznNccWLQNvJDYINVNXrJlChhha/S6KjOCs25AuVQMZS/I+
	IW3ufpqfqgC+m3IVCa7My1xhEC7ecNIzapfE8ftgLSu0ZaKFg4Fmxnnw2k+EzT+9
	i+5yGn0jb2+hNMwFqqHO3SkKe4Htt4NSzxCd6uI6/y9xDdr55bRTv8B1pq++DHtf
	mcckOKiGXNl/58X10nzQET/pv5I2+NglpHcBJlr85o0qksKbZMF1kfx9UYGm9UHC
	dST3QQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf2bcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82984468f85so3332341b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174091; x=1773778891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rin5Xzgf9RNm/Gx3a/2HtbrcZkKjggIhMf3Yv3Ghmqo=;
        b=Sp8dv9CEk0meJyJpb4DZfCCxM7MPDNqKl6FUa3ebeK3gdw/a/Zz7ipZ74MjMQlhAzQ
         Dx9ItA2P2NylO28don96hLtalSixi5h10xEKdeshswchgxMEe8SBuhKXCNPsBjrkRi3U
         u42oN7vr1/6fzqCvZXYdcfVXDKLdmNfVT/hvdSRzhZpbKo+Ecv5Z7av8fRp8R3v4J/0S
         MpH9GJd0d+n15blG6QgQ/o6uKtFrdXCQgRfdyEsB5laVzl4DXvoZGbRhSTNO7STjQI8x
         VZAVaDE3I15o5Q/zE9qR5YttK1436i1Z8UaiB3xPuI7wpDqqjGrzMpAYcqh74j2V/XBu
         DBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174091; x=1773778891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rin5Xzgf9RNm/Gx3a/2HtbrcZkKjggIhMf3Yv3Ghmqo=;
        b=mWhrKaNDIi/FINWAsLTyT1psob+quAzgK1l43VWaTz6isqAo8zXkSjxDlXizzoAWwz
         XrgzPGsYCDA2fIWk3WIrpg4MwtMpMDs2KndMMjWlOg8MzN6bXBe0afO7+qJ1/bY2MBzd
         YA83iS2RxXl3quTicFn0fJaHq0XUOmFghHtMwO4xN4xQoqoVd4+Zcv+tX2iSo/ZiRC2Z
         5FEJm/wM67mL3KDchnNUmOJbZInHfkMY+3K9ghQ9mr8B0LXsDVF0+39bEwIBZKX7EiLZ
         vtIVSklG82Npr0iLRUae/bNwbkQGHL6PCsh4+1Fdg9LSakUpCCT1jtW+oBcjqwmt/i8T
         qrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNiGOPjIZZhR9Te3mY8HUwiXJ98zODSmJlwzOoiK7j5srnRmFdPBJGI8KXKVyxzldHxY25/GtKzsuwQwgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Q5Z+iBStmdpm0TElfwzQBksWdDZRMt25cKLwGJSjY6Prw+uB
	Olx2BzA1UgZi9udj9wPxE0b34j1eXMImBvDU6UrYvLu2/PpBAChs4G63JflpixczIen/60dbht4
	nVGSm7zICYugoR8bX9Qkq2UvgqChCLQxLxc6RfCjxrnCaark6YVVF3C5rLVwPXzaD3JbiT9AscY
	pg
X-Gm-Gg: ATEYQzyhEkspDz796IKvMJ4qX596mP/zwaQm6fi4RHUnIfLkikhDJx119nI8Mn7js5f
	DMmFrdybXp9UbJM5nVHTTEUjAnAIBlCbV+omVm4/IxcmxZvrUvlSP77swbI/5a+RJAi1jvSW1yc
	tDFjtVaQYkvnxfWIM9g9/F/KN/sVtNgVRjw2JmqPbIXbhIGe8TyotwV5MI+bh0lS0GVCt1t/VQz
	aRSxTT7LheW/dC7J5MwyT9KIPfzFI0xX/bTfCCzrPiQcgoMyaLmtjAO08AKYMw67qhlgpsoui/d
	MGoRHUf3GIwF667epRBwrwypStwAzvZEww5Y5+kittYbqSju5Zexqr5/DmlRds1jYNXoqC4pb8N
	K5IOYqN7zPkW4ZUXGwsPkYC8QBgQOVIpdmu4UuqVsNhWUZvq5
X-Received: by 2002:a05:6a00:bc93:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-829f706c200mr175177b3a.14.1773174091175;
        Tue, 10 Mar 2026 13:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc93:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-829f706c200mr175158b3a.14.1773174090546;
        Tue, 10 Mar 2026 13:21:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:21:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:05 +0530
Subject: [PATCH v2 21/25] remoteproc: qcom: Move minidump data structures
 into its own header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-21-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=5406;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=KXQCMJRLCbRonZvqZxJyWcxsG8bFtO60YADpZ72A4+g=;
 b=7x0MeE/624UBgwaYA8d01C2eHOaPSi5LvmpDqTC0RDeXSdnY95KEknozT67woVS1EZWsgkcpb
 kHF12b/JwLyAxBxitovgKsNVTm6BUP7AGvDHLNONgLVcKcqhMzi7W9d
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 33xGuYua4hA-Ok3XEeZ02pNwg7Uv3xGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX6pl1ECqZ66T4
 HXbGONGHGrq6rLQ3ptfbpej3Rzy5C9J+zLEgNsKvZDwyxuH+ItuvkE/GXYQTgzZ/hM/LmfdZntS
 Zv3AbWVNrR7RTj1vZ+V1ZMT8vcTharXAckzkUduRK38bYDTSnIJPgifRG5zpaDysfhwGXjqOi8u
 7i4yT+pZt/+B/RssNg6yoNoYoco1AJxq/OVihKZSytyTSwS1A+fpIF4YsIVfCK4qWZfMbJb/fn0
 k97rzAgVfg1zgejVYr1fwB8y6ivVegToz9dQwqq5p5sA454bwMrEz6i6aZLZ3gxPib1eT2B9AkM
 WvYHAgOoCi5qGilWveueD6NLEFRRetBqFK7B4Wp52fz7xTNaamkn9A+Ko552tzWiwz/EIFE/YbB
 8SA+idOm/ffFTbv7Upjhc6dmwU9dOz1ZfhEzL0EuRbGacJ5+CDGiWIU8fNr5kZYS/NWsF4OYnhs
 zNaxBEF9F7lhqLqUj+A==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b07d4c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NM4Q4TbMW06K43K3HisA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 33xGuYua4hA-Ok3XEeZ02pNwg7Uv3xGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: EEADA257C90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96771-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Move the minidump data structures into its own header such that it can
be reused by other drivers. No functional change.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c  | 56 +-------------------------------
 include/linux/soc/qcom/minidump.h | 68 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 55 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..864c89f060b1 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/minidump.h>
 #include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
@@ -28,61 +29,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
new file mode 100644
index 000000000000..25247a6216e2
--- /dev/null
+++ b/include/linux/soc/qcom/minidump.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Minidump definitions
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H__
+#define __QCOM_MINIDUMP_H__
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+#endif

-- 
2.50.1


