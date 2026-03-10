Return-Path: <linux-arm-msm+bounces-96761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJvCFEh9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099422579F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E04C30795E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B593E92B8;
	Tue, 10 Mar 2026 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THJUFaLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vds4Ccwh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE63E8C44
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173957; cv=none; b=OSdH1ueLiFvjTLbv0n2T4BzzVSinQs3TNcTx6+oZZ9iLaexgZgaCPsae2EY7jL1iz3+m7gTKwUivJDQ8ez+/yEkwtxvnoDOhv/gqeXl2yocyiL9TU2YiO3l4WYJ5i6jfkjf7Hw7ydnsFkLz7Lvl/DfMkjZ8uLKWTCvg7yXEBANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173957; c=relaxed/simple;
	bh=9my3dG+55i17Pi4MGTOfpizzeVPgJR5rr1ek2EjiVPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IApqP/XMHb3BD1Kh/S9kkwe0LNMtFIidjBcnOvmiEOf5BtO5ZddCHoVEAUIt64v3KZWsrxQAyG5G9QluVdu+H9n1oMilWW2JQGgvi0eneo5sHUVyaoZxW2vsTexZJ62eA4LociB4BdIUJKyU0fKyg+0+I1eActIJgMLDwFkRKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THJUFaLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vds4Ccwh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHbLdE248337
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYJhzYl6FEej6COPJvSo+RvctMPhBtSRzrUgpZSWkkU=; b=THJUFaLan7yW85No
	KtNajqmt9jkj0m0v4tsUnn0TXOioxqA9pC6GgXVe+uq4xTQ4fE4pc2+M0lcIiw+r
	OsQ+OteLPXnmDj/HehvSLHxPeAAWfBvAwIG5wFrOiN3Bo1OOopzCgo1sZjHIwD5R
	1/BawwZmYr4JUc2KQ+8HXxwMl5tpsq96+enPtYBh1fvGDMvElVpbCTGli/jZAuls
	fCuIndntMxDHEkGZKbePaMGMU2RKnhE9yUzpS8eIRY5gfqCPxVWTBG09/LtUEzOO
	eTpkkh5x3LhuJp9IiLLMVEYja9+ug/zM1MLnE9F/2G1+QRoGpO1Nd+qelmxHme9y
	ZlWwVQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv10jw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a535ad50so1841504b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173955; x=1773778755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYJhzYl6FEej6COPJvSo+RvctMPhBtSRzrUgpZSWkkU=;
        b=Vds4CcwhotOP88zjp3RCsiEdBT7sYTYtgdntwfUS3o+ZlecD5epRTE6/yv8oNVXM8J
         O2AB1XuQ7UNBIVAlEK8GoomxszjUQWEfQSoqX222TlGbJXXsh64c4DRTzwRTU8VCtpSq
         Ph4Sn9KPIC3Mn4AaJs2rLGySBsdvtTW5rOySdhi+w9IzmFgk5MeBv0+wbsaiT3pqGDSK
         FMCXsfK9+hl4XdsO+nbvvZj10ujpweh/7xFsPNmFocYoVIyAB7nhEqEkFc2bUP5aX4yB
         nQbbjK5cVf62sOZHFFsim8QGlpke50WmRuO1/2EZ9T99MSw9oguKI2CI8WL6PN/6KL2w
         RlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173955; x=1773778755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kYJhzYl6FEej6COPJvSo+RvctMPhBtSRzrUgpZSWkkU=;
        b=lANlSri7o1W4T1c28teadrTTEFxLFm+I0SjN8cGzEqj0K/bPFj31/GxrYzy/gRkfeJ
         mCe7Iy77cxPlMGz7g/yOcinRIgNg/4RTnQn8Zc221+gyvsCmdKALSEJFg504Sg7ANrgA
         tLrM0nMctOsLHdp0tOqkzQNuHrA2a9HOlnKkStGAnBf/5EUkusqa9jPYg2tFnAD4ouKg
         IemuQC2Ly0Vg7oyNaeL70q/snXTS/odsOQWFnIrp+qqgXbVFQJpljXG8aCCRX4d6fEl7
         VOlnLoInsFnp9aKZaDody65g+21hCnzJx7gnYTzIh5j3zQx9xbIqTyhAC459QmqH33CS
         yiVA==
X-Forwarded-Encrypted: i=1; AJvYcCXg4O8EVefShS/S2KbsfbA+0akwg0yXSF9Vld25Asagurx1BbGby1FxyWoA0MxSJ3GoHdlbRGzE262092wO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81R+QSKoe8OsluobX5i4d4l57oJ8lavt14spaD5FV4SiSjLar
	2O+oim98QF6b+JTldULl2HJo191j3CWcKSzSr2BATGm49/lmyfGQ09mXsAE7lQRNTlZRGUn1U6s
	JxuIw/IaM+G1zPdCF0esUpJ2pk696EpOjuuKhnXkh5HwCndeR9+MNOHFvsECIGmNT6kqz
X-Gm-Gg: ATEYQzwe4JpVsN8NbtRK1MzVXCj1+kHXm7AlWim+f6G1z8VzobxW03qWQKyfLiXLZ+N
	bP0VbDF6aHhgRaUtiAfIJnWG1n7D6xeJCSimgh56IIiCLo3DZa/7MWoWNsDCqVcgxJRJbfoEV6l
	LM7ZpZXzIyA/lwzZig2/tyVg3ppzEHj0f7HLUk53g4ZJJj0kUm4hmRUm/QNtD8j2YYZo8ky4SZR
	S6oqhRlQC5jJhG0HN/aeyLJEPO3W9a2ZnpL4Su5WAuo4l0enCubnGwl5FVf8M5SQqU05f8aYIpZ
	msXrEQQER/SP22nM0WsnWPy7HPu55nryFugw0+Nh4eqYZShAXG/JCk9hl4T21SOkmrYYivPFN00
	T3aywZaZ0ZQzfZ68tDANHCpACrWqT6KJ1MHN6VDZn9D/NBT/m
X-Received: by 2002:a05:6a00:3397:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829f721d2bfmr128129b3a.52.1773173954446;
        Tue, 10 Mar 2026 13:19:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829f721d2bfmr128102b3a.52.1773173953827;
        Tue, 10 Mar 2026 13:19:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:19:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:56 +0530
Subject: [PATCH v2 12/25] kernel/configs: Register dynamic information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-12-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1125;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ltcakv7Yz2En9FQrum1FNPMsP+X0e/gYDhIrKVCzFFQ=;
 b=BClB+LbWS820CJZtnnqAtm5gJtokT2sFMM8TPzt3+PSi0gs6NBgaizBv44fpO+LMuPBGRc+yS
 y7xG++f/5G9CN5rwIv87GOQsBogg0vfWjxMNrycZKJ7h1enoDkDDWR2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX5xmPmAV2hLJO
 43fv5sHONw3iOaYgsg5+sHbYP8vuDRGZIuKrsrYysPz76VX3Ma+ZLp082m9d6gqNC+VN2vfIhYq
 1V78PP800OL4FavLSCLyMbzGPFjsoE77DgHcSxWFzHfN4DAkCdqmirTxUXdN85pBzOQl9NtLiY2
 A3LaAvlqCxkZfpKZOW+rsvX0qrmN91xZt/krAN275d3YPsR/OFNURudfchEwvLS8WvuDTTMb2wr
 YI5YalG4oMfV/ZQQ9k6c7JKf/Hop/snKXkzTOW9KttJRAH71H7mKlG4rvlmb8XBb4S4SH813zwi
 /gbbWq1dzaBgTeS7v4IbuaGY+erVb7y9rgv7FKfYrCXwtWvwPx3HEuHd3HQinejfTOsD4+n7hYY
 s3rEOVpE0fe6zTefCDbkWP8VNyur08SEV5Dpn1uqneqszUHLLtFSXi4+T/3gaTfvXNm/Oz7kXFN
 gLuDGfIG1tMDDtEbubA==
X-Proofpoint-GUID: BrVvoMzTxM8RH9WnDCW--FwYvjqm2dDI
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b07cc3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LjyN-fOCrMyGU0ESAFYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BrVvoMzTxM8RH9WnDCW--FwYvjqm2dDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: 099422579F6
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
	TAGGED_FROM(0.00)[bounces-96761-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to
capture those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..1e7b86a8b3fc 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+				       (void *)&kernel_config_data - 8,
+				       &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 

-- 
2.50.1


