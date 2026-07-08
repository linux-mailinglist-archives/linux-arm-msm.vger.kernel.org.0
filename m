Return-Path: <linux-arm-msm+bounces-117527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQdSEJr3TWp3AwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F77227D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dWA6Inxr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D9WCai9+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EE0C3002B25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE88E3F58D8;
	Wed,  8 Jul 2026 07:09:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4B3EBF15
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:08:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494547; cv=none; b=RvXQdlPIsAylnyQBvktmbIAUbAMaynmtkjLQ7fHsJJhB4MsWvddXQd9/NaXoRcO9sCkp+e78ml1QFDvHJt9C6GNx0xudLTrAsxPqx48M2Eud6uPpRh9TTQCelt/bt2llRj26JbGX+w+EJou3vco3ymo0UWJiBUWm1TvJ7Bxf2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494547; c=relaxed/simple;
	bh=RGp5QueaPiZd0P6W8KCH9xrLiM6DbSkJnCCzWwCQ2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+YIkffyAwrZm3HucHk/BCJbADQoAVFUb9eC7GaYjNLkWJWFM4izAMQOkvJJWq+QTBfwi0vI+rrdar2Xx03l3E68WAhmdmJC4euvo+KXkDc8ZNrjw+AH2nDTaYHkSd/vhUh+AqyP2tSuMpRd8xUKZHPuqBv6qAMirqP6x+eNz2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWA6Inxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9WCai9+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685mjIZ1761043
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nJqYhVncBU+
	d62V+AHvnJXoOTo03C+xWxG51CnST7TU=; b=dWA6InxrM1RDSuiXJWA8wNLflNn
	bjANDuPY7kJ2Uiv12Ah48NqX8rczX8ICeD49ThCPjfrxwDYvjDxGKz9TTTt4lcSy
	6CdqHUbjjbBrjrcFaa7ppQC+kldPN6iJVr8ovr6Cpw9lYjW9FNo6UzysXJkoMdQn
	W4wwr6HHJyeLZeFOsIEMQMGKFVmIw/83kT8n75XoFBAnTZyE15fA4huaUutPBeZz
	IxXwuRpA3MMGvJyii3Ju74nPN3LN9N7nfhkIaOFrr3wk31zMpV0WVtG4i+GAduni
	FbUnjHxWmv+nWZzRz0zqBeTgIvQ8ZII1udWS9nED984qtdCzvsPdUDYXx+A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw89q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:08:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so382385a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494521; x=1784099321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJqYhVncBU+d62V+AHvnJXoOTo03C+xWxG51CnST7TU=;
        b=D9WCai9+7I+IOHtnXwNqjGgUHa5eGfOOdXs4JsPyooBFEXOy/2hRJIlTYH6sMZ6ke6
         DuqLtFUQkhKqjb8xh5IWzgeLFckTi9tzxIKAaq9eaaRkRfGkKk9Q2z31xKLhSd9YZaL7
         NE8c8ugHfYjH9yBjUdqqhRuFpNqcYXqyT66MPwymBIghsbgKzBNg8C3mV3vF0jOZXbtV
         6x0ZMubF0BkdzsQW66Mxl7PnjxfAI4lL86purI06ABe7cmovHVVDV21/yULd+ZSDhNXr
         YOeadjQvEflAnxlJB0jq0FfLC2wlleJ2gWPz0QdaqJZlalDSVNEzZ4r6zD+wRgz18MgZ
         GDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494521; x=1784099321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJqYhVncBU+d62V+AHvnJXoOTo03C+xWxG51CnST7TU=;
        b=QyWEDVd5aQ5pupcxVz1lP3GOrB+0HQcmjC2FW+qWAYuGxr+5+N16+Uw9eitMRfBcND
         xkyGxU1R9Oqb3/uijHBsCei1591Lbrvn+S441igs5UwgA7N/rT9s4BOhB/p6Dr8mGd9G
         OPTz1bQcu7A6nrSSXi+Gx5I+OfMLPhVgzMBp9tdSYUfhSsJwI0qrwZj0gSeH7j4xIFuh
         icUmtnhvAtPEMRGwHaQYhLYZkQ2S7lcsKMKtzqNUxR2w3Kf4mvkpxrnYpmJdQVGI2bmc
         /zNgaIPWz99oO9YyxFQTjEZw44ghq/QyAScA7MOJp6x1nzRrb7G3z2RyJXSc9IUpFa00
         YMQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0i/D5obS+bpnUYwqqZYgpY9G1EADRm4y931A5zH6IGqCHWwkm3L2d/UYiO4bzLLbo4jNetMithScNXYI1@vger.kernel.org
X-Gm-Message-State: AOJu0YyTTLSN53dS/Izvpbf4aIB9bB6YhUgS+ka+TWbcM8zffaAkbTnX
	3DThJDlRo0Fe8KU43rRg7x93s+0OoYRKVoWxPVDPCFwI4NHXQ121XrruGPY3wD9QuIpjwjdFqiV
	a9s9btN5jjafFm9tYk5Lay/pj6mBsy6zoQ/2lzfzHMzclNNO6qotkzl8sM2k5Nt9r8k/u
X-Gm-Gg: AfdE7cky50bG0YeUpOh24I7LHmWidO0C4Q8Of+2qmyzZpBICbLDT2ERU8ZA5mlElVoP
	WftZGre3f/lZ5QBLfO9gUgzvRIWOeGtaR/ZKlhg1KtTdXC1k6MeD23/30C0IgkW0dEl4914I4yW
	hOipRb/esvDSg1s2VhTH/I/3SlepJxDOLnVqzEYb850nkIvU/EkEIJuvnlRy0hUGw77dSzrXkPN
	VcvWL6iHFbfRMDev5HAVdUnrLIfsqSqcE2Qwhfr2xmILXhv7sVC+HtNfP8cxS+4Y8m3SRDRkwFM
	yZV4rLnOiSlPkuJ4ASK6idMdEcaL56Jsg60iRkJlVGJKGZMLwlLoZg1DaGKUH7rpnCz68G6tWzi
	1GrZa3XeMBaB0eZ2w0b/tZanL/fQfPXeZSVQSJw==
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr1445385637.73.1783494520980;
        Wed, 08 Jul 2026 00:08:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr1445323637.73.1783494520337;
        Wed, 08 Jul 2026 00:08:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb754asm1893624a12.13.2026.07.08.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:08:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
        andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org,
        conor+dt@kernel.org, david@kernel.org, dennis@kernel.org,
        devicetree@vger.kernel.org, ehristev@kernel.org, frederic@kernel.org,
        mingo@redhat.com, jstultz@google.com, corbet@lwn.net,
        juri.lelli@redhat.com, kasong@tencent.com, kees@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, peterz@infradead.org, pmladek@suse.com,
        robh@kernel.org, saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
        vincent.guittot@linaro.org, workflows@vger.kernel.org
Cc: atomlin@atomlin.com, ast@kernel.org, aliceryhl@google.com,
        linux.amoon@gmail.com, ardb@kernel.org, baoquan.he@linux.dev,
        baohua@kernel.org, bsegall@google.com, jackmanb@google.com,
        leitao@debian.org, brauner@kernel.org, coxu@redhat.com,
        dietmar.eggemann@arm.com, dianders@chromium.org, ebiggers@kernel.org,
        feng.tang@linux.alibaba.com, yangfeng@kylinos.cn, gary@garyguo.net,
        guohanjun@huawei.com, jack@suse.cz, wangjinchao600@gmail.com,
        joel.granados@kernel.org, hannes@cmpxchg.org,
        john.ogness@linutronix.de, jpoimboe@kernel.org,
        shikemeng@huaweicloud.com, kas@kernel.org, kprateek.nayak@amd.com,
        liam@infradead.org, ljs@kernel.org, elver@google.com, mgorman@suse.de,
        mhocko@suse.com, ojeda@kernel.org, rppt@kernel.org,
        namcao@linutronix.de, nathan@kernel.org, nphamcs@gmail.com,
        n.schier@fritz.com, pasha.tatashin@soleen.com, petr.pavlu@suse.com,
        pnina.feder@mobileye.com, rdunlap@infradead.org,
        rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
        skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
        surenb@google.com, thomas.weissschuh@linutronix.de,
        vschneid@redhat.com, vbabka@kernel.org, youngjun.park@lge.com,
        zhengyejian@huaweicloud.com, ziy@nvidia.com,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Date: Wed,  8 Jul 2026 12:38:09 +0530
Message-ID: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NyBTYWx0ZWRfXxc7ZG3lmwmVW
 RYMaV1PHEantXUh4oG6Oc1BKSPobJj0nhZmSR3IhY0u8ux2J9XohKNHPr0yPrTEoEPvOR8XfNvO
 +fijHXYPyfbDAr+9NiDjfGV0+YUAqGMy7lgEvUF3wLcskkKngS5oeAyYeI8Q3UB/oTrAYr60kaS
 WB9VWFQOSSEv6wlt/fpvBmJeRR3oe3Kyvh6xfcQIWUgkYwlDbgkcdZa3jAXgIY4w5DMw0OqAW6O
 IQ9PpOnYsIzICBY88AnUe7Mqjfdn1IqxGlqHe0P2m6pnoZC0G+ukyq0+s5fsON3JC1AALcxmkzP
 HczLAo0d46AjaKeu2R0QZ8MHp238GHA9xNEd+KGZaKup5E4nYBdoRd7wBgSbtbjR4fd2uiApajR
 BywugiaIslgzpCFWukIAQGFn3q4WT6yJ2gI4TVHYA1H+4xvJvqJdDYk2l2WIu6rx38VaI84EXVl
 3XkCKXCyA2n+5OYTpEA==
X-Proofpoint-GUID: Wn67XYNZtIO46Beoh7WoXyqACA66V9Pd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NyBTYWx0ZWRfXxGBZ/rwGqQma
 CxBVQAA/cbV5ImLS79uzgWkvsob4FuAVz8qzJ8IUzxiUNYc0GIYkPiKdDAsmycziuahFKM7+biW
 /vo2Tv0ULFebYnx6mSFotKzn4ONcojY=
X-Proofpoint-ORIG-GUID: Wn67XYNZtIO46Beoh7WoXyqACA66V9Pd
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4df779 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Tty9oNO6AAAA:8 a=1XWaLZrsAAAA:8
 a=rSYwI8UV6N779v-tbp0A:9 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
 a=Bts-Es6F1CBXvF7u4C_G:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[atomlin.com,kernel.org,google.com,gmail.com,linux.dev,debian.org,redhat.com,arm.com,chromium.org,linux.alibaba.com,kylinos.cn,garyguo.net,huawei.com,suse.cz,cmpxchg.org,linutronix.de,huaweicloud.com,amd.com,infradead.org,suse.de,suse.com,fritz.com,soleen.com,mobileye.com,linuxfoundation.org,goodmis.org,lge.com,nvidia.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-117527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:anna-maria@linutronix.de,m:arnd@arndb.de,m:andersson@kernel.org,m:chrisl@kernel.org,m:cl@gentwo.org,m:conor+dt@kernel.org,m:david@kernel.org,m:dennis@kernel.org,m:devicetree@vger.kernel.org,m:ehristev@kernel.org,m:frederic@kernel.org,m:mingo@redhat.com,m:jstultz@google.com,m:corbet@lwn.net,m:juri.lelli@redhat.com,m:kasong@tencent.com,m:kees@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arch@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:mukesh.ojha@oss.qualcomm.com,m:peterz@infradead.org,m:pmladek@suse.com,m:robh@kernel.org,m:saravanak@kernel.org,m:tj@kernel.org,m:tglx@kernel.org,m:vincent.guittot@linaro.org,m:workflows@vger.kernel.org,m:atomlin@atomlin.com,m:ast@kernel.org,m:aliceryhl@google.com,m:linux.amoon@gmail.com,m:ardb@kernel.org,m:baoquan.he@linux.dev,m:baoh
 ua@kernel.org,m:bsegall@google.com,m:jackmanb@google.com,m:leitao@debian.org,m:brauner@kernel.org,m:coxu@redhat.com,m:dietmar.eggemann@arm.com,m:dianders@chromium.org,m:ebiggers@kernel.org,m:feng.tang@linux.alibaba.com,m:yangfeng@kylinos.cn,m:gary@garyguo.net,m:guohanjun@huawei.com,m:jack@suse.cz,m:wangjinchao600@gmail.com,m:joel.granados@kernel.org,m:hannes@cmpxchg.org,m:john.ogness@linutronix.de,m:jpoimboe@kernel.org,m:shikemeng@huaweicloud.com,m:kas@kernel.org,m:kprateek.nayak@amd.com,m:liam@infradead.org,m:ljs@kernel.org,m:elver@google.com,m:mgorman@suse.de,m:mhocko@suse.com,m:ojeda@kernel.org,m:rppt@kernel.org,m:namcao@linutronix.de,m:nathan@kernel.org,m:nphamcs@gmail.com,m:n.schier@fritz.com,m:pasha.tatashin@soleen.com,m:petr.pavlu@suse.com,m:pnina.feder@mobileye.com,m:rdunlap@infradead.org,m:rioo.tsukatsukii@gmail.com,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:rostedt@goodmis.org,m:surenb@google.com,m:thomas.weissschuh@linutronix.de,m:vschneid
 @redhat.com,m:vbabka@kernel.org,m:youngjun.park@lge.com,m:zhengyejian@huaweicloud.com,m:ziy@nvidia.com,m:eugen.hristev@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 111F77227D1

From: Eugen Hristev <eugen.hristev@linaro.org>

With this driver, the registered regions are copied to a shared memory
zone at register time. The shared memory zone is supplied via OF. This
driver will select only regions that are of interest, and keep only
addresses. The format of the list is Kinfo compatible, with devices like
Google Pixel phone. The firmware is only interested in some symbols'
addresses.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS                |   1 +
 drivers/of/platform.c      |   1 +
 kernel/meminspect/Kconfig  |  11 ++
 kernel/meminspect/Makefile |   1 +
 kernel/meminspect/kinfo.c  | 257 +++++++++++++++++++++++++++++++++++++
 5 files changed, 271 insertions(+)
 create mode 100644 kernel/meminspect/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d816d783024..d805ff9fedac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16906,6 +16906,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
 M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
+F:	kernel/meminspect/kinfo.c
 
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 53bca8c6f781..f80bd25fc481 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -494,6 +494,7 @@ static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,smem" },
 	{ .compatible = "ramoops" },
 	{ .compatible = "nvmem-rmem" },
+	{ .compatible = "google,debug-kinfo" },
 	{ .compatible = "google,open-dice" },
 	{}
 };
diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
index 18ff511ad4cf..7f6436c3344b 100644
--- a/kernel/meminspect/Kconfig
+++ b/kernel/meminspect/Kconfig
@@ -16,3 +16,14 @@ config MEMINSPECT
 
 	  Note that modules using this feature must be rebuilt if this
 	  option changes.
+
+config MEMINSPECT_KINFO
+	tristate "Shared memory KInfo compatible driver"
+	depends on MEMINSPECT
+	help
+	  Say y here to enable the Shared memory KInfo compatible driver.
+	  With this driver, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This driver will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
index 09fd55e6d9cf..283604d892e5 100644
--- a/kernel/meminspect/Makefile
+++ b/kernel/meminspect/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MEMINSPECT) += meminspect.o
+obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
new file mode 100644
index 000000000000..7451c13bc316
--- /dev/null
+++ b/kernel/meminspect/kinfo.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
+ */
+#include <linux/container_of.h>
+#include <linux/kallsyms.h>
+#include <linux/meminspect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/utsname.h>
+
+#define BUILD_INFO_LEN		256
+#define DEBUG_KINFO_MAGIC	0xcceeddff
+
+/*
+ * Header structure must be byte-packed, since the table is provided to
+ * bootloader.
+ */
+struct kernel_info {
+	/* For kallsyms */
+	u8 enabled_all;
+	u8 enabled_base_relative;
+	u8 enabled_absolute_percpu;
+	u8 enabled_cfi_clang;
+	u32 num_syms;
+	u16 name_len;
+	u16 bit_per_long;
+	u16 module_name_len;
+	u16 symbol_len;
+	u64 _relative_pa;
+	u64 _text_pa;
+	u64 _stext_pa;
+	u64 _etext_pa;
+	u64 _sinittext_pa;
+	u64 _einittext_pa;
+	u64 _end_pa;
+	u64 _offsets_pa;
+	u64 _names_pa;
+	u64 _token_table_pa;
+	u64 _token_index_pa;
+	u64 _markers_pa;
+	u64 _seqs_of_names_pa;
+
+	/* For frame pointer */
+	u32 thread_size;
+
+	/* For virt_to_phys */
+	u64 swapper_pg_dir_pa;
+
+	/* For linux banner */
+	u8 last_uts_release[__NEW_UTS_LEN];
+
+	/* For module kallsyms */
+	u32 enabled_modules_tree_lookup;
+	u32 mod_mem_offset;
+	u32 mod_kallsyms_offset;
+} __packed;
+
+struct kernel_all_info {
+	u32 magic_number;
+	u32 combined_checksum;
+	struct kernel_info info;
+} __packed;
+
+struct debug_kinfo {
+	struct device *dev;
+	void *all_info_addr;
+	size_t all_info_size;
+	struct notifier_block nb;
+};
+
+static void update_kernel_all_info(struct kernel_all_info *all_info)
+{
+	struct kernel_info *info;
+	u32 *checksum_info;
+	int index;
+
+	all_info->magic_number = DEBUG_KINFO_MAGIC;
+	all_info->combined_checksum = 0;
+
+	info = &all_info->info;
+	checksum_info = (u32 *)info;
+	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
+		all_info->combined_checksum ^= checksum_info[index];
+}
+
+static void __maybe_unused register_kinfo_region(void *priv,
+						 const struct inspect_entry *e)
+{
+	struct debug_kinfo *kinfo = priv;
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+	struct uts_namespace *uts;
+	u64 paddr;
+
+	if (e->pa)
+		paddr = e->pa;
+	else
+		paddr = __pa(e->va);
+
+	switch (e->id) {
+	case MEMINSPECT_ID__sinittext:
+		info->_sinittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__einittext:
+		info->_einittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__end:
+		info->_end_pa = paddr;
+		break;
+	case MEMINSPECT_ID__text:
+		info->_text_pa = paddr;
+		break;
+	case MEMINSPECT_ID__stext:
+		info->_stext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__etext:
+		info->_etext_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_num_syms:
+		info->num_syms = *(__u32 *)e->va;
+		break;
+	case MEMINSPECT_ID_kallsyms_offsets:
+		info->_offsets_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_names:
+		info->_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_table:
+		info->_token_table_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_index:
+		info->_token_index_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_markers:
+		info->_markers_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_seqs_of_names:
+		info->_seqs_of_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_swapper_pg_dir:
+		info->swapper_pg_dir_pa = paddr;
+		break;
+	case MEMINSPECT_ID_init_uts_ns:
+		if (!e->va)
+			return;
+		uts = e->va;
+		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
+		break;
+	default:
+		break;
+	};
+
+	update_kernel_all_info(all_info);
+}
+
+static int kinfo_notifier_cb(struct notifier_block *nb,
+			     unsigned long code, void *entry)
+{
+	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
+
+	if (code == MEMINSPECT_NOTIFIER_ADD)
+		register_kinfo_region(kinfo, entry);
+
+	return NOTIFY_DONE;
+}
+
+static int debug_kinfo_probe(struct platform_device *pdev)
+{
+	struct kernel_all_info *all_info;
+	struct device *dev = &pdev->dev;
+	struct reserved_mem *rmem;
+	struct debug_kinfo *kinfo;
+	struct kernel_info *info;
+
+	rmem = of_reserved_mem_lookup(dev->of_node);
+	if (!rmem)
+		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
+			      dev->of_node->name);
+
+	/* Need to wait for reserved memory to be mapped */
+	if (!rmem->priv)
+		return -EPROBE_DEFER;
+
+	if (!rmem->base || !rmem->size)
+		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
+
+	if (rmem->size < sizeof(struct kernel_all_info))
+		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
+
+	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
+	if (!kinfo)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, kinfo);
+
+	kinfo->dev = dev;
+	kinfo->all_info_addr = rmem->priv;
+	kinfo->all_info_size = rmem->size;
+
+	all_info = kinfo->all_info_addr;
+
+	memset(all_info, 0, sizeof(struct kernel_all_info));
+	info = &all_info->info;
+	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
+	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
+	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
+	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
+	info->name_len = KSYM_NAME_LEN;
+	info->bit_per_long = BITS_PER_LONG;
+	info->module_name_len = MODULE_NAME_LEN;
+	info->symbol_len = KSYM_SYMBOL_LEN;
+	info->thread_size = THREAD_SIZE;
+	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
+	info->mod_mem_offset = offsetof(struct module, mem);
+	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
+
+	kinfo->nb.notifier_call = kinfo_notifier_cb;
+
+	meminspect_notifier_register(&kinfo->nb);
+	meminspect_lock_traverse(kinfo, register_kinfo_region);
+
+	return 0;
+}
+
+static void debug_kinfo_remove(struct platform_device *pdev)
+{
+	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
+
+	meminspect_notifier_unregister(&kinfo->nb);
+}
+
+static const struct of_device_id debug_kinfo_of_match[] = {
+	{ .compatible	= "google,debug-kinfo" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
+
+static struct platform_driver debug_kinfo_driver = {
+	.probe = debug_kinfo_probe,
+	.remove = debug_kinfo_remove,
+	.driver = {
+		.name = "debug-kinfo",
+		.of_match_table = debug_kinfo_of_match,
+	},
+};
+module_platform_driver(debug_kinfo_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
+MODULE_DESCRIPTION("meminspect Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


