Return-Path: <linux-arm-msm+bounces-96757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAbuDUx9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A969A257A06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 203BA3040754
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698AA3E9580;
	Tue, 10 Mar 2026 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThgTmnWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE5L8rqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4153E92B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173896; cv=none; b=r3HMFWrNSRCRjTp+YLCE5usHqoIaxRan+x1QqIpl6SB6hR4dknf+sZRRI5jHBaTOIazFswpT6rXL7ekSqTfwd9jF83Jj7SahC1pIfKGQXTbXKE4MTE8f7kku1zy/59mJANKfLfWQEekPj+Uhu6aNkUejMGm+Ao0+Pe1fe4ne7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173896; c=relaxed/simple;
	bh=0ritzErIaOpABamjKjWNtLluyjwBIb/S6nslk4thba0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fydsw65Vs1kQOPWvt7ETPw3KTUQjt1/ZmA53Se6Sc4pTtG5AVymEMNtQmG/F756xKMunS+X4/Vup/imEjIRQqaV3QcesadHJLEZ8lenFYMGOPLLUfUjfOba0ZXLtWbl+HZebRX6UmxsjuoEhIrACJ1mfW829HRNcbebbr0rLgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThgTmnWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE5L8rqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGAh5j1265877
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=; b=ThgTmnWOfvbZeQo1
	JmhSGY/XWUnWavEygPXUvRtSQuzM7eO68HBklkhFXiEJF/pLtdJLv9M+QvmNdpDB
	53Uf1epX1mwcmxWxQ1hUuD9kbeKWXsJMxUE5Owva3qpevqhT2s4DprTxmfaEsHRV
	AS8AUtpw1FcKodPRvcM23BVifHTzbJE2vlQdv2BO45BEGoN5lT9go52vFwF0Al1i
	jzr9rv/rVfs1Qli/kRemy5JL6zrh1CczgpDCntp48GdKc27UkzLmNceX7dJ1QTfu
	SmrbICVkKh5nF70f1D18IYFvLjwJBpM30gywzH6qahOL4lGsZ5J6XKCACmAucW8W
	cvRrgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfh028-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4af66f40so104813975ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173894; x=1773778694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=;
        b=YE5L8rqtFEU6EzNvPcMhB0JYHDcnG58RTV0joEEWkpgrIRtsTK/vMV18v9uCD/7acU
         ulQdL8Q8cD7zPW/AvGu2DaxcU19mqCI/he6BSXmz6bcmzXmfh0qQxTqIQSV2TPtBryLH
         Am5MAF15OQW3GL1qvmsAAYgE0k1HXs1ymXwCJEtUojTVHGJXmu60cg32Sp/jT/5bXMcv
         5Sbn7f8x+/F+AQ2+8YBZBUknf5znxQaIj2r77ksq1OpDAxRsaUKLsWMki3fmnlPSeMGi
         +QxEjOhxjKhil1iCApzR+yfgElWvaRfN7Y42G08pguYY5P5i78q8rNLn+OAh+dlnQwgU
         m75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173894; x=1773778694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=;
        b=vgRI64PSr36XMsZFAbSNk/53AzIbozzQtsoKs44CVOwkYkFNvyiM2S8wfbPM+/aTUp
         BE8EZbur3ivnR6L/AgC85ceR6l+eu1SZ9QGqkdgzfBO5+N0wwPQJZV6j+VPlr1O3k70p
         hOIrQD5/cWyoJW4MefPoO+cRjb8HVv5faylFy+gEp5wDXnPgz8DHE4hC/QPk2+gpg1Y4
         n1V+DN7M75e14IJ8AEXCjVDkteznWSEn1/syUhZB/mgpXeQaC49HP8P6zbqlxIfZ60eP
         0MEbzeholgVNh6Vqss5+G2psM6qDj9p+VbkTvg00QOaNde6Ru0oJkhMjuN8jYhLwMzCc
         PExg==
X-Forwarded-Encrypted: i=1; AJvYcCUeT1mGv+qArKZWg8K6SM2pFiWZkY5ZwnrkCQQdAEfC7QWeBk3FtxnkBTd+M8wkkeYcD7RCfwbCSySCM3q8@vger.kernel.org
X-Gm-Message-State: AOJu0YwIWv+7IC1aRluWhl3PJpeeLYIP0dJ55Ay5Ud308bmpUxEnk6ob
	gWh0kuCQwsDqCyVuVpvLZpGMtWxWyMkV0rtr5T09eUWTFJbI6bTRVJwaiY7Qb8PBsMEynUr/0J0
	r62lDrpqBn5/k0567cb+LSE8/AP3qWTeAh5AQy7P4cxpV18cTpdj1bFpk5XrGFg+8bhqD
X-Gm-Gg: ATEYQzyszEEIS1BdxH9aCHlbOhEi3sQSLoiDjpniOz9hzFQv2Sh+rOXZSfmMi9HrA9L
	BI5dkBJa3bzdkWJ8z6BNd2AZAfkRyULopMB9GHbO1iae82rkLu08OHokVyRrGBiQRiwdQmtx2kW
	CfXivBroCVu1jRS/CBpum0YrNtppI87w5/oZQugZI+pwvp5ETUxTyYh1r73O8Pe6INM4UxBiIBY
	ypWqpsVb9c+8dxAyvfb4XmpJp09aLKC6b3xYxPhwVm75ItCLyR0OE0dxUxLr6zAk1Jn4u2DtqTF
	NBaVCSZsuWK8xoZiGjJEtQk7r8zJ6C+C6f38KYenmpNK6lQUWsXaWwjuG2jHuZueSxoUMVRSR/l
	Lnr9IiDK4IAdSE3ue6rfrSfSRTcvGcvWJdN1SYLewrKNcouWI
X-Received: by 2002:a05:6a00:420c:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-829f7078837mr151543b3a.49.1773173893786;
        Tue, 10 Mar 2026 13:18:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-829f7078837mr151503b3a.49.1773173893211;
        Tue, 10 Mar 2026 13:18:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:52 +0530
Subject: [PATCH v2 08/25] mm/page_alloc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-8-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=951;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=WjWOTE5wCASvyqTEqQTC8D45Mnb3Je5ENWQae6LBsc8=;
 b=sCMEZiGoy1i3RaFgw2bPkErqvS8tQsW6y9j1/DY+TYT3BAmsnGCCvrBuUVNv5kpwQ0AKxsqsc
 0GXsjJqIPzVAxAfgDVGIQ0i5cxpLM7I3P0NkJ56C69IwXRBjC/8natt
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 1TfTlkpW_UZ036tNw_4gYqoH6OcWuTaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXykVNaJHYY390
 6W7NPkGQqiSpzw2poHTiO2N16zPuarO/VjCXrnydqLl6OWXd2g8mQlZGHHeNKioLn6etdX1Ui+9
 pOwK5CVzyWrJ6u9iYIjFtE4zBCKRY0DP2ICLYSQjECUCQmane219WrCjqyZRJFDGIwSr7Q9mAdT
 Yak+gqfAgItxkLmuzqzrT6vVdwoHIrbDJCz/x3q51njrDvBb27c4MoRFNs08qlTJquxVhkJsjNr
 Sqn2lB8nqX5Tz8hPC15w8H3pLcFNmbJDANwxF6bkacyDmw++CeA2bg3qGjhWZ1vXnptzMPf18tY
 kPaD3tcIO6JbQBYtfeAoPCDPror9EBXNsaYUO+hJ+KYFkg2h/bi1umiPU+r40XY7Mx6qCFi16rN
 wdAEwqew6N9WgQEuG+txbKhm3cq9ESKM1GaCezDQ5m50tGGXVvOJ8dnUdsYSJJkzEEdv1wuV+Xf
 epxc/hBq8ypKY5iVxxQ==
X-Proofpoint-ORIG-GUID: 1TfTlkpW_UZ036tNw_4gYqoH6OcWuTaE
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b07c86 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TiJDLkziv7N9Y1Svq3wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: A969A257A06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96757-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - node_states

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 75ee81445640..c28a84d11d49 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -54,6 +54,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <linux/mmzone_lock.h>
 #include <asm/div64.h>
 #include "internal.h"
@@ -199,6 +200,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 

-- 
2.50.1


