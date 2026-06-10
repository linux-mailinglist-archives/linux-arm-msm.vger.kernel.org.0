Return-Path: <linux-arm-msm+bounces-112361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /FK3DB4pKWoURwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:06:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3C667A1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:06:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TxrWFFvF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KTMzi+tG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112361-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112361-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10256309E3DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A453B27CF;
	Wed, 10 Jun 2026 08:52:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F63B42ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081559; cv=none; b=C7oPJwjeck2z1fsJDe4C2ccxOcnw+y5UhSOhDrc2DbLtfZlN7XiGsTBtKs+pjhj58vjM8eIru3n8YoCOfYmwhaOh1BwIGUZoIdsYkHjoRQO285VEBYBRjI+snyNFOpTQ7G2a0TPTN4HQg3ux5aDTtKHQVYF3iQfBDiyKiS6yuYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081559; c=relaxed/simple;
	bh=2KPY/tb0j+B5uSdY7N7v5/p0YXBtB2vvdjKahaGisRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiqQJ7V0LJtUtEmkXm5CiOOuujvBH/o8mJZYSR53+BTkN2cDrX+155sn0YlxVdJ6Jzx72UX0ya1NDY6j6EVMu23Dxnl9+0CvyolU61rY2NxnDngect+2x4KiOBQG3Rw+M4NvY5uv+YZDSSzhvseQLJM2Yjo8OJ1KIWEjPh8NX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxrWFFvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTMzi+tG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnvw530865
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=; b=TxrWFFvFkcs/YfxV
	/0pe4JLFXoZxkei0Ua3E1sW25CT+OKE+bbqD3kT8X50EYCSXCx7/ChseUa+BB93T
	NTk2XWguoKVhQpPLrRFepx2/w64a+WXVHZDppjzpFADT+1J5kuYpeLQMSi/mJAlf
	LrUDrX+vmdoPRL6y2S0ukEDOYRplJWXoNF+w4SNdQTD0Z5k43tjdr8+JwxWMq6ss
	kufLPHRWN3IfsAjW+LadA2zveZs/2QGcCCZOOpRJipY4on6Lht+8a7KlFLLP0wFt
	bXZ0R+1IJxL99Up0ygwb3Zq7pNN1Wz71d9LwZtfp/fZUpPO4t13sVmTZ8h+2M4OR
	N+pZyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1ms1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so66548435ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081557; x=1781686357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=;
        b=KTMzi+tGnWoqNGDyXTpqwy6TTC/4WlTnNxXKibPjIGaM2C4c6GnigbMjTQVtjNNnT8
         WEkzE41cMjLAUCkudQ1QAO/4lVul5Y8Ih0G/vUjGIOljK7EkWtk/xwmANsA1+ObWv1TN
         ErqkmG/arTGSTvbF7PIFIx0VlF3+xZqPwxJdM1FyZ/FtVkd3PtCGe8b0UioFPBx0xHU4
         VCh8HRZ721cpzpLcyxGSbb0G0rsNqkgnNt0m4TGFpQ+/Oz0tdHjPRqB+z2xQKZbDZ54z
         L3Y1R8+toxN80dLAi8ttSNRUNIK+Nvip7dK/7m6qyFbir0NNsKKkdEuF6uUe6X5GNabC
         Kmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081557; x=1781686357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=;
        b=Hm3z7HHbiG5I0yNS37UR+NJHY8uP7qJK86vc+aDI+OewsXK3HihPCuJkYhuogtwAkw
         4ppKu+lBWnI+gIbfZnLDMHZxO/wZXnFi8XVGHixFF7YnDA1gjgkCSwWFa3XTodY58BxH
         yDQznl4mfvJp3r23dI1kW+gB2KhQwNW/oWL+Ym9lZH2yKfysh07SPkc6EWa773kk/3dh
         8ePMsNja1YTFzy0UfkZH8JgX1H2JMFq5J/fa9A5tNM6utcqSRdXi++FCdR2LrByANTDX
         PBY1+btgipJPLZ19E269XqPgsyL2lR6CiyNbSMDmHIAbzADFFaMz4xa+3HlGmM8/3TbO
         03Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8b0rnBAqNPcBeVdb9f/l9Ut1/hWy+KtRGG+E/OFpqXgAaBovdTV0iUgr/BOJ1Kjghzrj6Kc8odZQGy+Y9T@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uRJKmBg65If3iwjH3GOfp8mg4wyHV2O2uu0dzFzWXu8ojAQ2
	RhoorLZOalNFks+WHTf7vnxVnkvz9ZZKVxWCT455eHl65uuU+AXR5Qx3OSdsZbMEy8FaDYSt+Ai
	0IXMg3lYaz/I7zOYrEHaG+xY6bqtJDeQG+ouhNcfd9VJEtNe5HHInClzZv2JoGDv1B/8H
X-Gm-Gg: Acq92OHeom8SkeYWgcWMtQ5XYsR7Fa5q6eAumKKlRnzIspi9eAjvnErz6Fx4ujb1sF7
	UUQccVR7gXx3UOyTgykQSfAng+cD4lR2Awh7crPFxrc0LcfnJb3i2MzjFnZ0I42aMMcoN1HD+at
	JLjuSbTeYzhW1OdJORf1Q63ZqiXQ6ix8nLEunJDlOhwQC/9sQGGYie0uXuLlUEXq3PO2md2pxFp
	9cblbdKZdPoax4cpDMcMLOX53zJcejnXhYNK8xPUIF6jROxJTCJtK99znwZkf2bva9n0jGUmDv0
	/R9jHcu8nsIEgFfZyo6hoZU58BjWpWrbBVsXqtVVpip1ezJ7ea62mO088VFRkkvrVMAoVYWhxOF
	+T2EqW4eX0w2TytWFQp291LMbvzSJB1Vh/fsaBvESnfQkg7bDGH4MrFGhlxigpRptnzWLR/KL5Z
	zcCXDqo8d3DbhRwbl6gxmlYtmD0lCe1qghZbaw6wtnPgon0pNcTt3kKx/td9k=
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr297477725ad.4.1781081556863;
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr297477305ad.4.1781081556405;
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:33 +0530
Subject: [PATCH RFC v7 6/9] PM / devfreq: Add a governor for tracking
 remote device frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-6-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=4893;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=xZowMXSIo/yjYoix7dfxNcBQFvLyEboivbRIq1BkEFU=;
 b=XGGVsmcuQqsb7xxvF7kkpvKNz7arqGm5Q77SCmhmuZWxjWFRBwfyljemBijVv02n419Asznfo
 ce5/XapDYe0BqR8iEbYjxr25/B4xeON8mbI0zhXc5GM+c20jwuEccS4
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX68dF/mX7SYW7
 BQBIo1PG3+wwbJGn1C5mDnF9ON8OL3zAwkY1FtyV3aU+sYR5+Jion/1kOrsY8lkzkZEg8F/Nvdp
 o99RIlqibkq5XQkQ12TmiSV0WofISd4pT1yhkTM1aFN4u6aeAWKm7sQ9Hy/TgdX01LG4G3mD7kK
 gMpZrNYja5QUbOtb+Gvb41M0dxLp9kFGoiCqeZfkFKefStxulJKhpj8r76ioJFeOEPN+J/Xeqfh
 I7JOf8Jc9rYTHKByk7NIHKxUrF8FkxRIbDZL+ylsMPAVS/XU3G/JEVGxvCgqcx/DvjDTUFOU5gh
 PzHaROrBnqdEaB5q/aTcPXkB/Az1CADU9XaZuDaMIzJOZrqhMmr4SGfmqKsqu9fk2oOIkqDhVai
 YJCkRg7ifCxqhjA2ObLSbu3k8ohJQMPKpmsEK2VGRH251l4bG7D3adLzdEdUdEn+UUCOiUjeJUd
 CDo9PlrCYkmYxWDqE6w==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2925d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DkxomDJNIKAFLi0tgcIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YHN_fOnzTb04Uo1L7BbeLc9TSrxQvU5s
X-Proofpoint-GUID: YHN_fOnzTb04Uo1L7BbeLc9TSrxQvU5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112361-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29D3C667A1A

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On SoCs where the governor and the mechanism to control the frequency
for devices like caches is hosted on the System Control Processor
(SCP), there exists a need to track the frequency changes in a
reliable way and provide ways to tweak parameters on the remote
governor.

Add a new "remote" devfreq governor that uses the track_remote
flag to expose the remote device's frequency to userspace via
trans_stat. The governor deliberately does not advertise the
DEVFREQ_GOV_ATTR_TARGET_FREQ attribute since the kernel cannot
set the frequency on a remote-managed device; reads of the
target_freq sysfs node therefore return -EINVAL.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig           |  8 +++++
 drivers/devfreq/Makefile          |  1 +
 drivers/devfreq/governor_remote.c | 73 +++++++++++++++++++++++++++++++++++++++
 include/linux/devfreq.h           |  1 +
 4 files changed, 83 insertions(+)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..2caa87554914 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -56,6 +56,14 @@ config DEVFREQ_GOV_POWERSAVE
 	  the DEVFREQ framework returns the lowest frequency available
 	  at any time.
 
+config DEVFREQ_GOV_REMOTE
+	tristate "Remote"
+	help
+	  A simple governor to track the frequency of devices whose
+	  dvfs control lies outside the kernel. This governor acts
+	  as an observer and provides for ways to track frequency and
+	  set/get information related to the remote dvfs device.
+
 config DEVFREQ_GOV_USERSPACE
 	tristate "Userspace"
 	help
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..cde57c8cda76 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PM_DEVFREQ_EVENT)	+= devfreq-event.o
 obj-$(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)	+= governor_simpleondemand.o
 obj-$(CONFIG_DEVFREQ_GOV_PERFORMANCE)	+= governor_performance.o
 obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
+obj-$(CONFIG_DEVFREQ_GOV_REMOTE)	+= governor_remote.o
 obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor_remote.c
new file mode 100644
index 000000000000..df3819757e56
--- /dev/null
+++ b/drivers/devfreq/governor_remote.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
+
+static int devfreq_remote_track_func(struct devfreq *devfreq, unsigned long *freq)
+{
+	if (!devfreq->profile->get_cur_freq)
+		return -ENXIO;
+
+	return devfreq->profile->get_cur_freq(devfreq->dev.parent, freq);
+}
+
+static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigned int event, void *data)
+{
+	switch (event) {
+	case DEVFREQ_GOV_START:
+		devfreq_monitor_start(devfreq);
+		break;
+
+	case DEVFREQ_GOV_STOP:
+		devfreq_monitor_stop(devfreq);
+		break;
+
+	case DEVFREQ_GOV_UPDATE_INTERVAL:
+		devfreq_update_interval(devfreq, (unsigned int *)data);
+		break;
+
+	case DEVFREQ_GOV_SUSPEND:
+		devfreq_monitor_suspend(devfreq);
+		break;
+
+	case DEVFREQ_GOV_RESUME:
+		devfreq_monitor_resume(devfreq);
+		break;
+	}
+
+	return 0;
+}
+
+static struct devfreq_governor devfreq_remote_track = {
+	.name = DEVFREQ_GOV_REMOTE,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TIMER,
+	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
+		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,
+	.get_target_freq = devfreq_remote_track_func,
+	.event_handler = devfreq_remote_track_handler,
+};
+
+static int __init devfreq_remote_track_init(void)
+{
+	return devfreq_add_governor(&devfreq_remote_track);
+}
+subsys_initcall(devfreq_remote_track_init);
+
+static void __exit devfreq_remote_track_exit(void)
+{
+	int ret;
+
+	ret = devfreq_remove_governor(&devfreq_remote_track);
+	if (ret)
+		pr_err("%s: failed to remove governor %d\n", __func__, ret);
+}
+module_exit(devfreq_remote_track_exit);
+
+MODULE_DESCRIPTION("DEVFREQ Remote Tracking governor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index dc1075dc3446..4d50cf230950 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -21,6 +21,7 @@
 #define DEVFREQ_GOV_POWERSAVE		"powersave"
 #define DEVFREQ_GOV_USERSPACE		"userspace"
 #define DEVFREQ_GOV_PASSIVE		"passive"
+#define DEVFREQ_GOV_REMOTE		"remote"
 
 /* DEVFREQ notifier interface */
 #define DEVFREQ_TRANSITION_NOTIFIER	(0)

-- 
2.34.1


