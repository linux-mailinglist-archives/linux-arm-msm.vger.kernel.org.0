Return-Path: <linux-arm-msm+bounces-96755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC8yBeV8sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:19:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B82578FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 015AC3085B8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BC53E8699;
	Tue, 10 Mar 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0NzaIEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGDq9KYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51543563F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173867; cv=none; b=uoMJOrM9IyWB+yui3nwXxhuMQaErpNXnJW20FxD6wTxw4Oe54oFWS+Vu4VBpRCNYSz29cWX6qcuxLrjooMHTWSNMrJmawKMDi/O9+W7bbcglvaLKXIgsCsYQfVF3VFoEyZ5UXSK0zba8BNisMo9euebrXDCnSPZn0DGg+j7EGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173867; c=relaxed/simple;
	bh=8VXIeBDwmsaziXHiuo61/TESvB9yXc1SvwNc8S4i4Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjAHHqfrn+fHJ3rZldH/TszSTjEwQ3ESmZ91Zal/6hApu1adsP6DSGGe1AftWWYX2xlvY4ggKD3il9SCjs2w+Z6amHiVc6saF6HUgC7+HWAsnNx6YPuX+6tyVPjS0WK6YMNVn9xBaWwTiAJBm0tVcDaquyEOGYperjcOIRA2Kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0NzaIEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGDq9KYt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHbOAf248601
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=; b=o0NzaIEixTPEJiWg
	f6i2mY2sd1H7AlygHakRZ7oGEADz2/Jp9nZlqbyUBcshQS3v7WrjyAMmWKidrH9c
	dhQWPWDnPUsmSPbFbHtaz1+77QKuX8/tN/pY/1LJgzKjtQ8nhp9N0cD+c4pH0LwY
	Dt7JR4xY/m0ao3cLPl+t6ztu82HEy4GhMm3xg5gtHeqpEROzR8nDGPdwBheou/6l
	41A6ZSo9LfwWC1cXz7EYqgUnDjflhENTKrxRwuE403DVexMEQodj4xrE781T3uHw
	wxp9R0QNnViNnZMof3ge7i4AWRc1IncqnRCa5/M9QpCEL9ThZPTlSvz10WvSoncl
	hjf0gg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv10jq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:17:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a72475a1so13363323b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173864; x=1773778664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=;
        b=eGDq9KYtRl802CR87NB7WguJFUmebFRaq5zDmfscitdrowleKpE0bxHwH/uM1I6I4n
         O3caCJNHrqrvjjz2lBqQYzvbc0LD35sz1Bgzntqc2ZvlVjFtLe5DILhKjU/YBq1mr+Ux
         VzKM8/kIqhkC2Rr6CeU8E+S8ypf4bExUCTWV23KGKdwiupGQhMfhJbqdxZduGPtMbY+Q
         tk/OjjSDctcsdseu+mc2V7O2WifEVrDp8w4YxBFtAX/TVulOtyZaA3lYZfyUQjxGIg+q
         cSDkSMEQjEq6x+vur6C9uCwkz7Q3oBGbvm4uF4ZXGOliytXs9O8/+t7vxAB0FPD1m3A4
         jUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173864; x=1773778664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=;
        b=xQKDalMpUpxT/0AdvMLalMMLnzBv+lE1ZzqH+CbDEdALZI4G8/T3+D2F8RxOzeielG
         oJ+agX/VNmdnbXdblSM9g0hLcT4Ps0A5kuH3ZgqtVv+OZfcJdF8cdqZvCWsdzL9BLdqd
         +8jBb/Zn/vEj7n5MIBSciuBRg5X46fC4nGgzoJnJwkIxfGa2WisM3kA56bc3kFdyzogP
         7Qwt1PsHNarasHy+ZSJnPZ5QNq37FkAbHCcbnMZSxFx9gDmNYY0NjFtA+sKfwAxhkMv7
         J5FzBWeCyKtUXB5P/rB0Yfts5cQO1UISSlsXWL2ZgZ0l4n5qtg+JqRBf83o8xK9mdJD2
         bdPg==
X-Forwarded-Encrypted: i=1; AJvYcCUlBw6YNCDM8nsTyX93fiLDa3TRxNe/G8yLtvjcYB/8KR9RwJmKXv9SKTq191AsZFQs7LJXr0D52G2kL4qk@vger.kernel.org
X-Gm-Message-State: AOJu0YxicUzHLIZDi2sNKIQXa1CPHB9f6y29f/z5KB5y+dczisBDpI5S
	bjdQg37L3zEb5jTaU6jNeygxzs4QdqsJ23S5nTv3xi6E9sfAiFk//QK9Eq7I5MCNrPalog7ANgO
	GSd7aFEbJ0o8ueJ4iPXzXjBzZdYU/eErTwLsjARyCjPCojVb9Stxrgb52b3iKr52nWifF
X-Gm-Gg: ATEYQzzlhkDR/gLRJFie5bjHD5gCNGlgEeSwbZnxPHM3Rb/svs5e5CTu2Wr3hb2usQr
	o765L2RQbgGJ70w0O5WQQvfdB+5y+X8sirKYxAawpl3srBCvj1GX89g2leiG8Vv22SNDIBZwUWa
	42b/sCRE0acYvON8FD0/KfSkFh17/xBrqzrwhyRspMSnp02RIUNYSJhppmZM0WTChkuKDP5pkvO
	6J10j9sx4rxOWeQtJwQb4tokzxa9vi588z/wMqQCgDzVNVO8OvOSHN9qc/nBirYFagKLCxaZ4iv
	ZRWUPv1adwBX1ibBhgbgE7bgrhNgpBMa7Gxp3f3k1TBLJmP8l1Ry6D2dm/K1pf5Uf4CZRksdW/3
	Kzi1qaK9WUHS7y1yQFhVShkVbd0a7NBMqzPfjwSNzQV02suoA
X-Received: by 2002:a05:6a00:92a7:b0:829:6f37:158a with SMTP id d2e1a72fcca58-829f6ee7dc6mr163698b3a.18.1773173863667;
        Tue, 10 Mar 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:829:6f37:158a with SMTP id d2e1a72fcca58-829f6ee7dc6mr163660b3a.18.1773173862976;
        Tue, 10 Mar 2026 13:17:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:17:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:50 +0530
Subject: [PATCH v2 06/25] timers: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-6-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=952;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=RRdQeUZhXK8oMvnjfZr+NslKrJ0dwYGiMqLubz+98F4=;
 b=672vJ0CFnnKoQ49ty46SFM2zWdDu9NewajIDyLG+c9snNCv85PGMNaorgu5yAClaDe90mDCT7
 1A/cz9yzCb4Bg0lYVsxjwR3A6k52kB0mgUgypaY38fPEcU3A75TbROH
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX106s/VtM4H56
 JYQeu6WyfhCTRGTA7+2Zxt38FSRHEVJE1hwtkMF5d3vCE281J0zK1teZk3H29BlPfobDVu4R4H0
 9qqtDMehdcXIsUSJtCn0VGirH3ShgssLvWormlpCLiThhHRS/59tYJbG4ov34xNB6VCX0MgQzgY
 13X/TXVS3NUlZQ4Oln2CHCVTiwtbMctHYZ2JqeyaHVUmcfelRoXyZQht3Qy8CglQFBQT4KZRZFM
 +kpz3SVtknu2gL2dpSaSOhY35cAA7TiNpv0BGPyTrTLzKlKaQmTU2ahR0pETzPChKX1bJV32jRP
 B16NLkWAiJ5ydWvSkfqLPsfpwBHCDGjHnk07C02aT2t3+FBjKAZU85hf/ddktBc93SHle6p1mL5
 YbvbHXQVVuHlwsnnOM5KrlwuIITLgliUn3p5M/g3pqiacy/9wtYUy0jQtpmwCp6khc8BmIO5OjN
 FQyt31UZTBsO3NqY8OA==
X-Proofpoint-GUID: Azhn1TfBztf03NadyhBU_Ij7eeyzXVNM
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b07c68 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZmkKkIAQcJSthQVk9EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Azhn1TfBztf03NadyhBU_Ij7eeyzXVNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: 7D5B82578FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96755-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 7e1e3bde6b8b..ba86a5a7ebbf 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of

-- 
2.50.1


