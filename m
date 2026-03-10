Return-Path: <linux-arm-msm+bounces-96752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCc3MFh8sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:17:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7CB25777C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B8DB300C01F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928AA3E958D;
	Tue, 10 Mar 2026 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+F18wF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i62DQosj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395A3E958F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173821; cv=none; b=TW3szNhbQFApeJI1UV5rPGbFkU8YgVANw6knKvEcuaAXjZuIerApJKJin6iZJqEpkIBsrxjiNTh746UjkazpKrwl+rTFTCEBifDNRh1TiPeEZIEIrTB2dkKd1JKHpIxWDTnnDpP4LCuuoWIx3slslgNaUVIx5aATQxvlumH9F5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173821; c=relaxed/simple;
	bh=ayFeigblzCAoyp9Qp6KiYtozlvf4+37AaS9qLsZ8MIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7zN9ZTANDO4iWlfw1tTUj2QqKO3H0f+wvW7OWYZK7s/Qrg3MM/N3cDn+bF/4LdxjsfIIbcT5LpbDeB+nZMVzNpZ5N2vzHVW8G/rHI1Kiyg+b/JSV+eW6wIAdAopVCSeLfO22CG+aJdi0OGumi7MEkvdLztopilhXFaNAQNl9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+F18wF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i62DQosj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ36kh3893457
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=; b=V+F18wF1TAP0Q2Ck
	lqU9astfKnwyjiOFMImTog9s0PfE+yGloq82sX9318GQImuTdNu1fKgoeC47LJSm
	3J6LDHLg8JyE5H6MefV5UKiJmlf2iLLqTySnJ93UwOwunil3J8r2Wy+wJkXD2RKv
	YSfbcuOWwGgv7Z9c3FLYBNpX5UL3JwKjRi7iRcb339jJaKB2ErSs/Zg1UMnUH0VW
	isatBrk6/GQGcMDr4479H0gbMtIw7/NIYmuqxcGiVKtd29dq6aBvSN/25HxDvRLr
	RC+X1AHmKE0fMXNPMr4b+/2ckH3EWIKdIyuY1/TWT2o904Mf//My74FF6m7YudWw
	b5YZow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyst03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b20cc6faso160006b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173818; x=1773778618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=;
        b=i62DQosjFhuR1/P0yAWJQvj6b63ESZ7wTaTJKw0wkcNJthvzgwUVzC+r0krMqiDxT5
         kNFce6xwpF4ejRDN1OnBtKC62WDMs3vKjNYHgn+HOLhjkKi1RM10W8/o8SxbTLIN9BeJ
         f0ZCUKidyss0Zy5aB0sTTawKhHPCj6qBwrYC0Zji2TbTicp4TpptMOz8m9gxErQF5k01
         FxkEGRpX5+tps6WuMq8+UITWtKDwuExUENLUMgt2U2meVFvza7IE+sPhMwZ5jEClY5Ms
         4MIqvvJ6Rd624rWZdqg8YN7zSOpos2/mq9yoPUtPwnZdlAiqvtfq8DympWNQrsDUrN9m
         3Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173818; x=1773778618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=;
        b=inn+qrTBvMYek2VSAQ55AyhJ4QSbqwUARBOeE6iCIlfI7OuXscwOXqB4+271W+08k3
         ami42bpX2mnuba210NgDMXEArCJ0XHka29e72Q83q2vWKreBJyIAT3QCIXIUQIVNSZ79
         kN0rK+JOn0u9b6NpmNLrzT516FcutYdIyxBNmttTRPMhDcQIuWuWx8GgLYk8d8kekgXQ
         PQRHbtpeBNKO3oa/Ag/zIJZKehm5nSmOTf4GPSYBiK/IfR1OFTPpcf9eVG9jg54mH4ZD
         yoCjEQxLd0S8UZ+RyslNud11GkHF6mtZQjRjE7DDl35KeRsyQ76WfDXWx9jK1UpQ+mgn
         ZJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmi8gadPHZbdOvV7Qb6IxCq+pPwq8yAGu+qaWPodYi/zshRimcyJ/GdZep3Hnk+GbpyCXVUHyspErfofjo@vger.kernel.org
X-Gm-Message-State: AOJu0YyODM5GXLny3MrdTc0Hde4PdtvpCI0z7FLXDA7ppzbIuV8txO/n
	xBQeTpxun4r/Gc2TK1ffSih08TAJaSBvETeEYI3w5U3A1cpqp9/dBDRGbRiu2GISPDVlvTqvz0R
	LSV1nYLWQA66o6/w0agfB9PsIswnaTry1K/0kM59RTlETAoSxGHgUa8u2I87o+WJ3ZPh0
X-Gm-Gg: ATEYQzwTpFZ/s1eFaTfQOu0wnxWJtVcbzav/WkStF4MjvG4TouhXNxacukR8NrfU3KO
	MUieQNH4xBH/CZRX2R3CA/J9gK1C9Gn5durigLDVcnXMMCgn8MXCiaX6flja538sz25BYhLp8xC
	kgX0WDoPshu8vmSbF/QCQhmpSx+hSfX6lo/Ld4tW7+lB1trvjLpr1ZTzeoFuFvateIyh5lq8WSP
	jfNTMFSI+l/DNif5O34y4786uoOMe37NDRwjGDXK3cfDDsuAZNRHz72UUNIovxRsbG+Sz4URltC
	hy6/geiQmYEz3qD+QVXpZikz8XPAYGufZZP8sZljdHCJhN98/SX/2bQyCBans7nw3B7yvsYm/DH
	PA7GEez0P/WCvKVtpyfawsNKwduAQldhoukx/oifslXz4MqXy
X-Received: by 2002:a05:6a00:2d14:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-829e4077415mr4216182b3a.25.1773173817687;
        Tue, 10 Mar 2026 13:16:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d14:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-829e4077415mr4216101b3a.25.1773173817046;
        Tue, 10 Mar 2026 13:16:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:16:56 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:47 +0530
Subject: [PATCH v2 03/25] mm/percpu: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=895;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=+tGlmFyqBcoz7Ktr3AUpoQMVM4JnoUBVi4FO5/qneMM=;
 b=NvchOxzzO5I0OEPe3SoUqnDWDl/QAp23qS+G7CfJ1IKH1kWlIdZBO3QW8taGx6ZIGgP28DMU5
 qvn4YwBoiI/BuGfOm2ndKfDymQC5gVBdcKxJtVxj6fAwtL9RVgACP1C
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b07c3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H2ztsr5sKx9LglhVgPEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1rtPbOLCMh6ceGjR4WXKTb3WcY5S9CZY
X-Proofpoint-ORIG-GUID: 1rtPbOLCMh6ceGjR4WXKTb3WcY5S9CZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NiBTYWx0ZWRfX2Lq+bLKKhaTE
 YlbP1XDWraVT1KSQojzGCr8Of3z+3CKHIodgIISNtyIEOjHLg0XXkk0rp43TpM5rfgq47nwMZrG
 TYbogFspP/FT6P++4oF4UN0ONNNPx8GAWuzgfjpqYad+nD9s8tlUlhx5jv0sLwI3oQZ8ms/7b/A
 RRcOXxBLmw9+J5BpLkHOYQ01xyF4ZLy+/vryD1AC1V0pmjIRQNU9atL0e7kikvMXDXG1GKjVk6w
 6V1FRM+MYd95ObYfvbhA30b1cl9ZPMRJFNwwdQgyiegvhzgA5pKttX85wU/9ZRa2gQa5OrlVEii
 DzEwlq4cR9FeBW1VC+SoCcsiJdAERRVh51NfOvArUxmpXwlrU5jjc74y55hNWFQJ3BT38a7jted
 qu7JZmUMyEaU4GaTPs/wXtGDiHTASPgZh/BhjoH1z97hiiuasmD3b4HU0r0avEVl9tXIwd8trxk
 w+2nFnRqah83jeU3JBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100176
X-Rspamd-Queue-Id: AE7CB25777C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96752-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information in meminspect:
 - __per_cpu_offset

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index b0676b8054ed..d4209bdfbef5 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3359,6 +3360,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *

-- 
2.50.1


