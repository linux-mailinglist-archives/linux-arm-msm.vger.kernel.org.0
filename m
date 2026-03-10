Return-Path: <linux-arm-msm+bounces-96774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKV2HnB+sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:26:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C006257D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3464A30F5CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93703E9F75;
	Tue, 10 Mar 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPw1h3cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4bUEyyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A862C158D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174141; cv=none; b=QZAQpsoarR0pilW8zj+x05WzID55XS0K4QE6D8qy4sMdABsXBzl15McJXXTHqh9FzuFzGB6dCNA8a0uGWX4sQUdoD5n+pQyhs4ilxZ9Xxzx3r1U6H5GNV/BzT6HZcZhG5LC9lCxjQ3/8XdBjvoKH81N7pxur+mdtDPAkY12dwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174141; c=relaxed/simple;
	bh=kxkhHL6Inn5vy91sWNPBwxtVUU5b0erQRsexgGrH3n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOYitFrkQ/40DaI/XGaOA0mLQBBMcrRwFAo/4ryFCTRTNu7UTS+KxZMNcNgCMFVjsRggl35xMjOiVwob/UtENrHPB4tZmGxQb4D8YKSJ48m3RXxZp2gMeuMVZaAVYfXpSZWmXChbuYjkTGbLMIqOEg9erh8EREEEua6jhIq0Cec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPw1h3cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4bUEyyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AKJrTc1863458
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=; b=aPw1h3ccTPQ6vDva
	8RL6Id8V2H9C8hHgbuFfmEhGDmnb66zSn4duAggHPmCRidkKkeyWI2C71J46RzVh
	xEmYcvijqUFc063opGpKoJds5en9I434aZD37fdwqygNZi38H+sNnj3tiJHvNmaK
	Q/7YZyhp3lwCWmwcUg4mJaVZaWy2BWI6YokznMU+P2LlC6zp2oryV/X9AGryskIB
	D+T2+reeGB3+BB9a4illrxG7VfFFABat1d0C5HOBn7StO11xfUh3IXQinWhjw0he
	4xgTqLGpeGIzh0BoJ8aYSWIPxxkIMDz0RovcfKd90Af+N+l4plGNy856xnj/hPv+
	CzKZIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw81g59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:22:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829c331b4c6so985018b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174139; x=1773778939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=;
        b=R4bUEyybXcQFYMIw+51tFc0KlLUWWAK3JetzJLWfxL8vPoZ1yoY0CGwUzsRghD7UZa
         nYHRz0csuMcTi9U3pql+jNy5uisd/YzCBcNBBXavZ0/GlbcopshyMyHDqXNrFTJeERWm
         uWp0rPAEahuYqQnlwDWFVYNaA2aX6cODUhGLZt5KH0IC6ZqI8ng56OIz5kl+1BBO9zx/
         rhuJZBREZr5z82jItzjNEp37t4AEwYgsyOPCftBGTlPJh/CHDMviBaK7dGmCGEYvHfEr
         PVKgFJByVzWkL7rzZXrTTlQE3S58Z/y5ePvM16qEkbeIsMUR4AY1kncML4L7K8EfiQmT
         nsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174139; x=1773778939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=;
        b=xSI+fwl3ugiNOHbceOsSbCYjCRQtqv1RKsj8ZUX73rOJQArtpmaCpfv25vwhUKx4O6
         Am05qq/wCuP+oMOj0kgPDIImvCrDCz5Bj8U92c+6RK5sWjniV2KURNSuKMqL0AciOc5+
         caN8jQDzeqnDBxLfdjsU0BtiyYrYPzt1HYehtkm/cWJyBzCX2zp5UCI+h96LkthzOjgr
         LRVsEkyOm5ASJgTAsWXjMIx7CrCkZZWksa8QoK2Cir2Sgs2kziud+YLUz+F28uyuE1sh
         29Pnf0qHRnyNATJgGY96gGNo5GtZcsG07Tj9J9FdQb2Y2TMRLq4B7iy5dvM12eHSa3a9
         vKUA==
X-Forwarded-Encrypted: i=1; AJvYcCV1XaEed9QJoUIG7Hu+K+0NAbUjimpDHMwhQ3ItwFGz/HaeKvkNlRLIvChwpJKDo1+1qj6qzlYtl13Q3ARO@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUbDi0ar5up8Ez7+m4n5ub3gXVkTXzhRzf2mkDC0AD8riPcsV
	Yj7Yg2CVOHZf8vrL4A1sbqf5U8+kBDCwYXAi5vC8yN/UK2p26+BhZbyVJOYCU4EQ6aIAFtSoAK3
	TmAOxw9+IspkwEidsxoF+H5y+do0Bljqt3IspjsS3/+xjQiNIlX3tCKuUa+GkYTQWu/Kc
X-Gm-Gg: ATEYQzwJVJn48LtwMwzXhVIKofH8pQYpSILpVj/SCuqRE5guqt44h7rcOXrZtKKT2ix
	iUJ9WSkgiHZ6e9ChnpJhJgC77GlPoL1NqsSuYNLQaeb2y2mmVJJUICJ+ZdRO2eiXE/yrEWGWCCz
	CusvpRiqaty1SO2+cRkVf50ccWsuAUQflj5uaSp2IfB/R0pq4Wi4J28zbSWfe2iMdcvjyumbI13
	ZKUqkhqsgODikUc4/gut2rchUq6m5uWqFWmgWGDEojog1cRcxOhUqSqa3Tlq8MKx3/f8U6JV+ua
	x7rdvh4y5pjSMXe07ee6L04PPStIe+fHg+dxjju+cS4kCTMa94XRo6CWCLjuYf/v4MLUpJzhIXh
	3kYHaHwQ+E6NMDUQ3iroZavn3aupbLS+iL/gidE1zTDS9mki3
X-Received: by 2002:a05:6a00:1d90:b0:829:8041:83f with SMTP id d2e1a72fcca58-829f707301dmr155583b3a.7.1773174139082;
        Tue, 10 Mar 2026 13:22:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d90:b0:829:8041:83f with SMTP id d2e1a72fcca58-829f707301dmr155530b3a.7.1773174138369;
        Tue, 10 Mar 2026 13:22:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:22:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:08 +0530
Subject: [PATCH v2 24/25] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-24-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=2474;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=kxkhHL6Inn5vy91sWNPBwxtVUU5b0erQRsexgGrH3n8=;
 b=6MT7VZEYiJ26WHI1HB+RUTYRS5S4mWBasU/tY0AGrn+K0ZHF6GT766OHo8RuR4PhqhgpOtU11
 ixnzFMgK0faBvouTgqwCNSVVa7/2YaR2C2ym1CGyS7TIOWKzb2K+whi
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: FCUDsx7WJeyfufyV6av2pOzAMSmjYhaf
X-Proofpoint-GUID: FCUDsx7WJeyfufyV6av2pOzAMSmjYhaf
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b07d7b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=2rb2LGFNx5Mo7s1WZPsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3OCBTYWx0ZWRfX3bBUJuJVSlQw
 oXKKP3mmOJqV/1ACNXcV/QAKu/nJNyTPkS1xrrB4ACyG6II+BKzBrdlvcAqfQ3Op1m18zaLn8RD
 4JgrK1LUH1iDvNJ6in0fczYBSAis80IB2qcHaZ/zzs/GTXKMKGacQ/ZOENSeZRCXShPaTMweCe3
 It+PlHkqZtTvYAWWiZ/UveMukPt0qP7Bg2f7M7ejBCIWZ9IDRVl3drt1DJn8iFoU7s/RP244oh6
 NICK/f+qcA7VSg3vEdhV569/RV4oCaALQwCUh483cz3mgjVdG1MqPlrBN/d2IhZ1L05fJWnwrhS
 HbbKzowe66PaQLUL96DnQIHcd+FKAx3UEjhKComVtWdqbP49aOJs5C4q40J/O+WHyUKVg1iPcp2
 nqIFeVQnYPxsH22W3WXYW45YuElq/9DJe9ayhrqwLkTuQc/FFmJxSaIxjaavNkQxro8RRgAxjKd
 B8AHjMWUljmOWXFTq4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100178
X-Rspamd-Queue-Id: 0C006257D0F
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
	TAGGED_FROM(0.00)[bounces-96774-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,kvack.org:email,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,fa00000:email,linaro.org:email];
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

Add documentation for Google Kinfo Pixel reserved memory area.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/reserved-memory/google,kinfo.yaml     | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
new file mode 100644
index 000000000000..2f964151f0c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description: |
+  This binding represents reserved-memory used to store data for firmware/bootloader
+  on the Pixel platform. The stored data is debugging information of the running
+  kernel.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: google,debug-kinfo
+
+  reg:
+    description: page-aligned region of memory containing debugging data of running kernel
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        debug-kinfo@fa00000 {
+            compatible = "google,debug-kinfo";
+            reg = <0xfa00000 0x1000>;
+            no-map;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ebf478dbd15c..2504b7df0e7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16592,6 +16592,12 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org

-- 
2.50.1


