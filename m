Return-Path: <linux-arm-msm+bounces-104343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hn5Ihkh6mntuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:39:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E704531EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87D1F30792D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4D2874E1;
	Thu, 23 Apr 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctgTCfjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghca5sgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7A2652A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951055; cv=none; b=caSL4hHq71o5LdeVpmyVxNzGXh777790FvSAPZAzSDlvmkGd7g1pizDUNvbcny4EbrOuciiaQUrPHxj3trWPsq+3TWicEabgV8cO0+vVVd0MqTPSkUJr66wITruDMi+R3fIfQxUKIGWzSIG6v2jfLEYZtUCLaactTapm/lRYX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951055; c=relaxed/simple;
	bh=5XMD1PTwD/LTxgA60yhE1YYtYnYGkszZwhjmWff2fnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xsb8HyK26akFiL4bJEDpKzqJqJ5b9calKDkk7Ls8EBYDKIfmIpxPAOLM4l2RWeM3Suu9eaqWY0YcRDBWpuxBeYwqRM+NzAkMP9M+//iVXvwy26xyco7yBrjna09OaOrH1wgFPNYkunieGiISn3yYmLo9cRoynbSmW5pEf7O6uB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctgTCfjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghca5sgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBwxb3010155
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTy4Bkwh+gr6ISqDQC1YSZGoQJgQwg2cLAvk32oAfkI=; b=ctgTCfjtpa4PTPv5
	PyyNE+e/s7ZoDKoP3ycz663AdQE6rQZarcbdD1F6YUw3fWdh7FypSF0LBksp93iK
	DzelQTaMlKXfLas8nCX79AA8eqQ3AN3rVNciLyQZqqBYks0Ae4uDtTyTe7BUx7BU
	BILu61X3m5ukuSfw6Mue+Wdvv5B/mZJ1byo9MoQywOwd2IMMIRMERaWYdqRT5me2
	QSDr8fVr4oyBBLVnRGYfE6x5Oh46gF11X/zk76SNFhKewaC939f6AuqqcbxZJ/Jv
	NsaDThfbGynSWY/8ZQvPQCi1jsQ23m9ejVb6PjGHSyBjf0PzUy6K+W8lGll5HdB0
	P+iSgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk178aa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso85179365ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951052; x=1777555852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTy4Bkwh+gr6ISqDQC1YSZGoQJgQwg2cLAvk32oAfkI=;
        b=ghca5sgQtPdt99E1zVUyF9rJMZXGm42yro3vAF1F4sKrNsJ+sMHALEKJ9yr2HKTx6U
         FbaFOxqNJk9z7cKFj2w6dekCiUpFIND+timWsNxCoVbH5xV/+ImTef115hcoVN3OTVNp
         ZTMHxwuJVmiXA8RE2Wv7dVEskUXZFvoHTgGKq4WCWjV/W+RuPz6aTsrFr12g0jLxqveo
         cPeIieE2addlFzNl/WZi26NWn7TUeJ03eqOQzdcmWl2atRY0IpLBUxOY8t7dmXzjAJSr
         U8JIYx80kFKEOE9wgD8YCDLKaTQE+zbNMiy3h8me8DQkRw6fUOoTQalH4zRPerUrP7ag
         9Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951052; x=1777555852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bTy4Bkwh+gr6ISqDQC1YSZGoQJgQwg2cLAvk32oAfkI=;
        b=FOaK12fmSi6I1wSJlAVPYtYYan1lcG9thfZ8yU5TPqtsnXvZ5yCWROyk8yfIqsDVdP
         Cyy5ZDwHh9YlyCH4Jau2r+ZQtFhvs5kS4suNszSv0BLtur+ojSsojwHpJjbb+juUKp8t
         xRXBQ7cbUzOeQyJjA6EzVMBILpDzTrqsEjJkvRpE8flQmk4dAUo+rI3Ub053vETmlmPO
         GLQa/zmi4M0/ZsjRot4TP3tZuph9R/H1Kzz9EyfsPsKE1LGhTpo8s6IfXGPxRivON6Qm
         YVG6Le1APWeJMllnoqifbzY3KBr+zIspiT2Drvk6yMWDwQzO7hyQXxuz/jJAY9Hub5M5
         z+zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9feZUgCNbXoTFXRdEoBg6kUwv/4AUw4TuJ4e9rHaRQilMllm3Dm8h8akG5Om9TxXlINlU6uho6u2h1o/rw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9T4IcBRrkSVFaVBpqjYeddmtK1dBPwGWk6t/BRUbXBD5EYFmK
	iOcM3Ztfv3fn16VVbPqeD2mN6ASBUslkjup2bEjxWis/v6Fh+Eo+PRpPvWvEkuSbz9j49ywohg2
	4n7SlrEVW21cWK/ss5/ONyPRa0mt049X6qLt60BtwcXW2QebeiLXW5Q0rVTXaZy7xln6K
X-Gm-Gg: AeBDiesaiUjKVS2qyt3+sn52IKcNCp13g+0KIWXTBJDnF5TRPFnS2tqwbKBtUOKxDTW
	VIbS0kwasJxZe3owh+5oFikUW7PkR9HLF09WwcgHO0cI4gaLdp7QJCTP8A8JxKJakrpir+kG0c5
	axGwFLtlMGGe6JV2Jv3Mo5B9+wuwL5efNcLif0bZTizodAYrqiWGUxEMK/HBc5ytcFvNke6Z1Ea
	usNVPAtmrS260KCOkta/8D+ARV//uwjkFSWznDljvHQdqAOUdycDOzsheXGyxtdoJ7/Y25UO4iy
	fEMrlVR3XF9G2UxBe1DJ2BtNz38lytJo6SWXE8j95VnnjsfEmHGRr3/PN0yYcvWSfViHrf2jGdd
	db3aW6chpUTEVe40G4Ge7gBN/9yy2OpirTmHhl+Ej2ndQDnfkeqlttgj9r21tmknl9Q==
X-Received: by 2002:a17:903:1103:b0:2b0:6b98:59ec with SMTP id d9443c01a7336-2b5f9f7abacmr276507305ad.34.1776951051741;
        Thu, 23 Apr 2026 06:30:51 -0700 (PDT)
X-Received: by 2002:a17:903:1103:b0:2b0:6b98:59ec with SMTP id d9443c01a7336-2b5f9f7abacmr276506155ad.34.1776951050947;
        Thu, 23 Apr 2026 06:30:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:35 +0530
Subject: [PATCH v2 06/13] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-6-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=6587;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+wQbHvxygQq1aTrGxrx3UsURZ3ABehuwxnmcohM5NBw=;
 b=IHAV46nQNLUubTgKIDVGhPfQgFqulUO86Kl3iSQPjE5X2LvjBkucJI7tXaO5ADNUMyAYQSmUy
 GeU+J5TShgmD+pOBgO8R/SKND0QoCtlowbWHzfA7yq598FkxFpcLcGV
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: CGP7w9-7ygk1N55Cu131tolcbCtANs2n
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea1f0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gbwaY6mYjfx-u0ET_fsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfXyMj+eQut81qB
 j4NiAj3kGLCs1ixHcH5WF3CRs8tTIeGNN8+fMseKRgJ+4ialdT9jpANVVut3Nm1aywpKOqRL4Ld
 5YnFBAEEh4ea9u1iAxyKs1y97dCgnyzbGjjxZ2FNhUXJe3SLWEB0ycuu44G/EaZZ5Z6j9Oo1BSb
 +e/nIbEEl9BI3TbBC330NH5LxP+C/Zwv5aKd5Qyipry4qdlT1/pLJ+aiDPPsMVCc+qDKPFltHx8
 rxaBMRlamm6vLP8OFwp0gdJGtO4CDKcyZA+2MJv6B2Fx6eQ9f+cpn2lzn9kzZcKolI3Efd4UooQ
 EwsU/pwTRp3O5vbTQznTbWI9m/ywcN9r6YxCiB1Lkxritgq8PcezIUQ0qmzbNgCfsjxxc1asXiu
 iuUm7QSbwrveWAdc6YRQqngdmGEWnVfkQ6KLV0dBK053/INFPwvoGQyx8dz87qK9krBqRCJKMFc
 TcPRl7NWtSi0pnFd70Q==
X-Proofpoint-ORIG-GUID: CGP7w9-7ygk1N55Cu131tolcbCtANs2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
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
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104343-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29E704531EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is required
to enable memory protection for both remoteproc metadata and its memory
regions.

When the hypervisor is absent, the operating system must perform these
configurations instead.

Support for handling IOMMU and SHM setup in the absence of a hypervisor
is now in place. Extend the Iris driver to enable this functionality on
platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

Additionally, the Iris driver must map the firmware and its required
resources to the firmware SID, which is now specified via iommu-map in
the device tree.

Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..b396c8cf595e 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -34,6 +34,8 @@ enum domain_type {
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @fw_dev: reference to the context bank device used for firmware load
+ * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -77,6 +79,8 @@ enum domain_type {
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*fw_dev;
+	struct qcom_scm_pas_context		*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..0085dd7ec052 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -13,12 +14,15 @@
 #include "iris_firmware.h"
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -29,14 +33,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, pas_id, mem_phys, res_size);
+	if (IS_ERR(pas_ctx))
+		return PTR_ERR(pas_ctx);
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
 
+	core->pas_ctx = pas_ctx;
+
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -62,6 +88,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->pas_ctx->use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -79,10 +117,10 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -93,17 +131,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


