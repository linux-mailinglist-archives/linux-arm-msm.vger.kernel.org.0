Return-Path: <linux-arm-msm+bounces-113088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxeiHi2XL2rPCwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:09:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E537C683A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pPk1l+WS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L1xbMGw4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C4D9300C902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619563AF65A;
	Mon, 15 Jun 2026 06:09:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB3382283
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:09:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503760; cv=none; b=M13JU3oVF2sTiSWX3gRNxYfWabuzxeGS21MA5FbEnwSsVSEv7Qc+RkoeipnUBsKt2zAR84snD1rsejX93eXjb7Z/054D/UZmrl9KZmiyak4sv0Y+v1TX6z0VdS9d6DwKBsqG59VhjkildKM/PmhVdRoUYeJqTWgvi2Sqxs9NYDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503760; c=relaxed/simple;
	bh=PKgXeShLxwaVF7Anm07f409jvOs7I7Dr6y/VL6J/1Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iICvkP5wuAg+rshGFp9zaXpYK/frDZ9TZo10e2xPTpuuQb9fnMltDjGQntLT8F1oM9zJRVgiguARMU63Fa3g7I/Vr6WbEyqAJ/swmUKpAW/E+EWC2EvuOZ6VtKW6IUY3K9T7tPn/cIjcgpaM9KHeCPf5R2q3F6A0umqxnRIElAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPk1l+WS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1xbMGw4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1i4FH2727901
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dbrKRlXF9XHpr7RYXjth0KtQKdDkWR8x8tS
	Y4BCig+o=; b=pPk1l+WSLZ+ykDB+yhIWI6qvYtp1eYTclvYXJS7ZQV6bim4LQAH
	7gaWpMOcagPltj6XRGey+dezLl4hObcOAODz2+Dol7qGKzif+m9SAs9Y/dKzCigU
	96qcun0jKsXnPM5fYnlYaXffErRiUVaHJQd7KcDz1K6eJhRPErqIveB+G9cxXhs0
	cnXCqoFCvpEADWsxp30N4DKuMwu5eKzI3KCIfN05aDgbG1yF+Q7zC7s+ndROJ/8L
	WqX8alAJFwV8EQV9m9P0pOL738fy/eFOxYRsujTbhSVP89FbZi1XVWvrSAndgZKy
	bbLOvLJ/+siCNNGvP1qFC5ujeRM71Bd5ypQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15upq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:09:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b934a336eso2409586a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503757; x=1782108557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbrKRlXF9XHpr7RYXjth0KtQKdDkWR8x8tSY4BCig+o=;
        b=L1xbMGw4nqSuNxjx1Aal/IZSgkhGWA53kvI39qj+P58s3Olq1e3qJdQgkkPmsDAc+c
         ZtWmzi6GhLvgRmUDDMx6qi1CPEgcuuYMDnzPBHaqJcInYNz7tuW9t0p2Uf1187Fu748D
         pZd9lsIYc2yP+4saum6b3EHlVaHy8AfrINdfQkpoSiAxFamnO3GgDogGKCFRu335xiPx
         QF3BlEeh/BLXfauSS280flcjcA+IM8JE3golntCMnR9XJMO5cjnobbZ6PK8hfPPg9gub
         oKO2Ivot0UpUj5WB7jlSTcXGfVS8ET45IXtv0h22f2hMkNyrYz4/0jFQCtZdZw4skzpN
         29kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503757; x=1782108557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbrKRlXF9XHpr7RYXjth0KtQKdDkWR8x8tSY4BCig+o=;
        b=k/RYD5rOJy8sv6OgIsjoYzZEvP118HdHPGhYuBtUrWvnCgZtYt0TGjAM5vrcE6Ibq1
         QEa+QBKpuD9u0CDVUSsS0FqzO0AcZcGrMcOsXdYWTR0U/otmA0D325F7oBmh+HLSW+7D
         bDGRW6M/KmsM+Rat//Km1z5eRNnjUXgunjYBkxIUyic/D58R57ZxTtQRTxNfH8tVM1Z5
         jje7iF7VEYW6VD2ANgbQXmZnIa2kTbCaOBuxke7+E1V1XltR0kUEK+LYkL5Gr/WZSMUY
         TSMyvnsSnHyMAXpRUN82YWxov79UNFpoYa2UlsFIlLoetY7O0G+7So/XjucbUK5hSY39
         d2mw==
X-Forwarded-Encrypted: i=1; AFNElJ+lIORlEmgBz3UBpzrKEyUMiQrHbogiv0Ns0hi+nj2RWCPbbUwt6xKiVWElXfHV/Me5Olt+Y87mT6hK+B/x@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6Qrxfx34FljEdHz+sNPBbaApc+yBIrNGr7vdw+XYujkkNNet
	xpvZag/T4AAR4GlX/DXXFNse0s4e3oKUYsAKt4iPtQ5kPuSFGoIaDzkeOEDQxePpoOw4Xril3Q7
	68gwvhMWwIhv7DPm49Te0WmxuilVfJRdLP7QvE6M4aEBGXhYDwJvUxLh1vNTwKmLMKSBG
X-Gm-Gg: Acq92OFoih6nPRIzXINYZSba4NcIdUXzuvpuWC2hDnohoTPYCHVXLXTtdFcUMiaOi/o
	XTbJipJE9SXjFlZmz7uyFGaAVqq6Zs2pQB4zrKdMH7+HBCYtSZUsTBzViuZs/10NiNXek2+0EBn
	wng5aLrEDkPIfpDEjKOWZBT5dpnHIJb3r/BXKc7tiKerpeKsPDWvHGkR9vZ9aGOby9CziJkLHr2
	v0fz12UFqqSjsaKWtDVlQndiwteDON0JVuzOaGHooMWas9x7TuhKquX936vifP+67dsLG6coy++
	5KMC/syLWCBOslW1NjfTeqqwqjuuGzKPQmYkTAFCK4wh+6qGOW1z/0IeQGWbJjOwtBuVrt4P9KR
	sJBz8qERop420y0u6tsulKiMT9cP9U14CCr5I2bBxNftoUr7rR1xCT8HBa0fMKu8CqlMAC0+6Fc
	ObLlj3Jb/oD2SmSwvdmWpVN/VhyeY4QWy01n5IrGkXwBjP1WzCKNc=
X-Received: by 2002:a17:90b:4c4b:b0:36d:dfe4:387c with SMTP id 98e67ed59e1d1-37c2bc7a4fdmr9216741a91.10.1781503757252;
        Sun, 14 Jun 2026 23:09:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4b:b0:36d:dfe4:387c with SMTP id 98e67ed59e1d1-37c2bc7a4fdmr9216714a91.10.1781503756727;
        Sun, 14 Jun 2026 23:09:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2678375fsm11063580a91.17.2026.06.14.23.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:09:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Lakshmi Sowjanya D <lakshmi.d@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v7] dmaengine: qcom: bam_dma: Fix command element mask field for BAM v1.6.0+
Date: Mon, 15 Jun 2026 11:39:08 +0530
Message-Id: <20260615060908.1263171-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: paoJbUbugntTvhaWqMWHmdcw_2EuZqdq
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f970e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8AirrxEcAAAA:8 a=qeNJoaxpl3A19PTdgUYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfXwyz/R3zMewFl
 CyUgaJBZSoMPqVp7K4/07znoH0501OOiaZTdBAyOUQ4PSO3CiwnJjmjh+DdQHfbJ3CpIbFQ/727
 fhNCXv7zD8e7xRzwZvFZIhO3gW0heDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX71Ip0aMkwinf
 CJO3neMsB0xUDynshbn/tEykovTOlMo5uPLGMOVd88qk+/LbbUbej5buHT+7CKzWf266tV9zfrG
 vN/XUlCS2oP8WbbfQQDqhmE6uXJTxWBZu5qc40v1lstS+4jUXVWS/1X7fBHoOrGDsJ0PBasgJGN
 XWO6Tn7xL4tjZG4nqc8QbpI8zv6xWQM2n98ALHXUz5XT5dBPsecCmz7VaT4RbrRlvyvqXGleLur
 AlZSmPlLqQNA54/Fbm3WLS6Tapa4VE+O16nG5xzUvV5zPaDpcTpGhXvgvlJkxO9MYH8y5FaIb/X
 HdAGDiCW08y2lL3rKEpHDNQuqso/REt8/yUNzdiiFIW+dyj8c4nzUnrQ4SelSKsEXO9XJbFlqJv
 ErD5rcFZhpaiBQhL0HNr8V1lio3XbHDg8/E66J427UZsAb9j//WH/1N2O7v9b6ZSH89E1XVApui
 rHX6Zaw6BGwSw9KDrRw==
X-Proofpoint-ORIG-GUID: paoJbUbugntTvhaWqMWHmdcw_2EuZqdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113088-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:absahu@codeaurora.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:md.alam@oss.qualcomm.com,m:lakshmi.d@oss.qualcomm.com,m:Frank.Li@nxp.com,m:dmitry.baryshkov@oss.qualcomm.com,m:stable@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,quicinc.com:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E537C683A8E

From: Md Sadre Alam <md.alam@oss.qualcomm.com>

BAM version 1.6.0 and later changed the behavior of the mask field in
command elements for read operations.

In older BAM versions, or prior implementation assumptions, the mask
field was effectively ignored for read commands. However, starting from
BAM v1.6.0, the mask field for read commands is repurposed to carry the
upper 4 bits of the destination address, enabling support for 36-bit
addressing. For write commands, the mask field continues to function as
a traditional write mask.

The current driver sets mask = 0xffffffff for all command elements.
While this works for write operations, it breaks read operations on
BAM v1.6.0+ hardware. In such cases, the hardware interprets the upper
address bits as 0xf, resulting in an invalid destination address
(0xf_xxxxxxxx instead of 0x0_xxxxxxxx).

This leads to failures such as NAND enumeration issues observed on
platforms like IPQ5424.

Fix this by assigning the mask field based on command type:
  - For read commands: set mask = 0 (upper address bits = 0)
  - For write commands: retain mask = 0xffffffff

Also update the bam_cmd_element structure documentation to reflect the
dual purpose of the mask field across BAM versions.

This ensures correct behavior on BAM v1.6.0+ while maintaining backward
compatibility with older hardware.

Fixes: dfebb055f73a2 ("dmaengine: qcom: bam_dma: wrapper functions for command descriptor")
Tested-by: Lakshmi Sowjanya D <lakshmi.d@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Change in [v7] -
	- Remove blank line after 'Fixes' tag
	- Add 'Cc: stable@vger.kernel.org'
	- Add R-b Dmitry Baryshkov
	- No code changes

Change in [v6] - https://lore.kernel.org/linux-arm-msm/20260611045757.2841252-1-varadarajan.narayanan@oss.qualcomm.com/
	- Commit message updated, no code changes
	- Pick R-b Frank Li (given in v4)
	- Change 'Lakshmi Sowjanya D' e-mail id to oss.qualcomm.com instead of quicinc.com

Change in [v5] - https://lore.kernel.org/linux-arm-msm/20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com/#t
	- Split the driver change into a separate patch
	- Update commit log with 'Fixes' tag

Change in [v4] - https://lore.kernel.org/linux-arm-msm/20260206100202.413834-2-quic_mdalam@quicinc.com/

* No change

Change in [v3]

* Added Tested-by tag

Change in [v2]

* No change

Change in [v1]

* Updated bam_prep_ce_le32() to set the mask field conditionally based on
  command type

* Enhanced kernel-doc comments to clarify mask behavior for BAM v1.6.0+
---
 include/linux/dma/qcom_bam_dma.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b..d9d07a9ab313 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -13,9 +13,12 @@
  * supported by BAM DMA Engine.
  *
  * @cmd_and_addr - upper 8 bits command and lower 24 bits register address.
- * @data - for write command: content to be written into peripheral register.
- *	   for read command: dest addr to write peripheral register value.
- * @mask - register mask.
+ * @data - For write command: content to be written into peripheral register.
+ *	   For read command: lower 32 bits of destination address.
+ * @mask - For write command: register write mask.
+ *	   For read command on BAM v1.6.0+: upper 4 bits of destination address.
+ *	   For read command on BAM < v1.6.0: ignored by hardware.
+ *	   Setting to 0 ensures 32-bit addressing compatibility.
  * @reserved - for future usage.
  *
  */
@@ -42,6 +45,10 @@ enum bam_command_type {
  * @addr: target address
  * @cmd: BAM command
  * @data: actual data for write and dest addr for read in le32
+ *
+ * For BAM v1.6.0+, the mask field behavior depends on command type:
+ * - Write commands: mask = write mask (typically 0xffffffff)
+ * - Read commands: mask = upper 4 bits of destination address (0 for 32-bit)
  */
 static inline void
 bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
@@ -50,7 +57,11 @@ bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
 	bam_ce->cmd_and_addr =
 		cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
 	bam_ce->data = data;
-	bam_ce->mask = cpu_to_le32(0xffffffff);
+	if (cmd == BAM_READ_COMMAND)
+		bam_ce->mask = cpu_to_le32(0x0); /* 32-bit addressing */
+	else
+		bam_ce->mask = cpu_to_le32(0xffffffff); /* Write mask */
+	bam_ce->reserved = 0;
 }
 
 /*
@@ -60,7 +71,7 @@ bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
  * @bam_ce: BAM command element
  * @addr: target address
  * @cmd: BAM command
- * @data: actual data for write and dest addr for read
+ * @data: actual data for write and destination address for read
  */
 static inline void
 bam_prep_ce(struct bam_cmd_element *bam_ce, u32 addr,
-- 
2.34.1


