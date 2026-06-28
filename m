Return-Path: <linux-arm-msm+bounces-114795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1DwtKQ1nQWo0pgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E71C86D4A21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AtoMHTsG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NiYcdkdI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114795-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114795-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 571F5300D475
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2383309EE7;
	Sun, 28 Jun 2026 18:24:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E823033E8
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671082; cv=none; b=FMdESJjxf5/iiSLGydhIs599zE/BWJCHxA2uAgap6LNM7WcPqd+5noHYEr2RwZkKBhEHBlC7hhyNVnCfc5gvvnj6oIK3TgNlESbo6cN32cm3+dJmtuwtve/wRXdxpmfkKNtI3d5TnGycrOoYkOAZqpG4sORZCBZdYbeVAI6hlCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671082; c=relaxed/simple;
	bh=PqBOkMlKBD9SPkXLSG+SxQ4C+QJ2OeUPUwMzbiApxz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDHLIMmKtiROrBdT+rw1Iwq7EmAAB444aNHPfG+nJ0JnbalVG1dyhb8qLSHdbCd0PMtz8ugIh1+g6HID7xYZ369RLZhq0Vdy0Xqj/8e9kIZ1bwpsjg5YVKMTybt1Hu2WKMDOn4cr2aBXv7Ccf4sMXP+GLjENeAoG7w2EtW7Xpvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtoMHTsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiYcdkdI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj2jo407711
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=; b=AtoMHTsGd4iaZpmE
	HlcRrS8Fm3n6rjsVRFw1cpmHhlqUA1Ryga0NblfhcIGWPstxJd1/46MZKhpl+DKf
	x8p2WKigW0tgWbf5u2U1sbqeNcbYaqCqZma+EA9rRsOHRy6G/MbNMElGD9Ipye5O
	r6B80xwMQvXeg3hwGp89NpxuA3WkNOmfM01LwaajwRWbFa6beqI+dpgdl8c8a1FO
	Z3Bns/RP4x/h9m7+CR0l1pg5OfobXfrP8yNfycl6o8IjriDXIy+lpj8/1lEFaD1R
	XofeE38AyJF6/Hcmw7TyOUO59c19YaE1psOISv8vsZGxdXjcOkDQTmFtm0arbWt1
	pldu0A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf39cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30e773699d6so1226207eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671080; x=1783275880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=;
        b=NiYcdkdIVINR+j0o2z+EfXEJfppOcFfwHjWaiOMKMePHOCrJl9UTg1pUZ8mYJYbSXL
         ZoPdAhdNDX8EG+PXaU7qYM7WtCsohUJBmoZbvTr7YtbrFJKZzGXuaYCXfiB1VzcaD2Q1
         VPUMbsrM6U3ReKeBa1Y3aIzBEB1I9HLul8b963p5+cbIOlJPQ5oZbknK10Gogooeplb2
         GKEMfTl3fLifQukmw8IGfVA2cU3jOsCAemQq9rpoL+Yr85HWHs+GCMKKVku08Bj7xpY1
         yFsIV8hWYHu0teCJtVmsYZskqVMWhXmjRJKylEDX66MgSHhLfKLbILx8yGcG8R6anIl0
         /r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671080; x=1783275880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=;
        b=JwykZpcW8HD3iDj6pujCPNxny/1Vrl7Yqubz2jxriCsggGoxXDO1G+OMM7u+jfAiTv
         BO9NY/v0krVspUHb5fIAJKHhxEt7C1CKEbjfyC1BoXPDtxtSU3OYGB6lm0gQt5+pFZDu
         Z57CxkZLHnSIZfsaKensls9mW3AE9ztCpOMEnQHwcpENaMrkxuxStbjFd/uMpgzzEIcU
         FJMDkJvsUT4mHqLvxat29BZRm6WuWbFvB33iut3RjA/2YiRVjaa0Usc9/Yweeo19eKL6
         yikNjouXW7Vgsb+XhnprzHRam7H1O0TKNpzgshVQJ5LOX/O6Tcyll3T7bwy91q16P1E1
         pn3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpb3RDl0svTRw4aSaZGLKGWkk9vRGi2Zav4HqcyJ9mZ4/tHAWYClQ60eEOUB8t0QkmTqnBe7mVw6+KoYDuP@vger.kernel.org
X-Gm-Message-State: AOJu0YwwoHOC9mNi6LmEtbVWBxAZj7DRWL2D6K8A1blveJ/UCp1Z8uQA
	zaVuscLr4pH3ZuiEpd6F4/e+e5qCXZl2aiB1Ypxz0b8u1M7ZlGwefR4U01mASEwtNGmCixRI+7v
	rXuq1+nn5wwc4E79K7OqfiNcX708s9++OKcZiRCHm8VZdNGDU0u9tYJM8PHRj0fSefv1K
X-Gm-Gg: AfdE7ckDA59HS1yf2sv96Ety9dG/vZQNuuv7QPw4ilpwXKfy+x2dVy5lDx7TeIa3r40
	bgg2ZuKJjMkFBaB0iuVuZbODhKICzfgYBQaZ40VETS/fvkQ+Y/I4UsPQrNnf9HKcF8vGrA7/wpO
	FPGPidTaL2C4WyBBTCZtcrdXNnd9wdGD8X52Aobn+5hOzfwhBEYr11KcNv2Vi9eohMkLZbs6QNg
	6H9WM5jtd805eJ4SDwKcPK+bS5+VlKIzU1C38dFq4qMiKQWWTtaqMQcoHSCCGc97vXiPsS2TlkM
	h1JZxdXMnSMxIfA3vob7brU8aekNxNPubx9/IocL4SeGqN+rWFAnocyM5xT/yJsX1UFMyKbzV1p
	22KXlPJIWZqThra0FnexGdulee9YNjKDHbXg=
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr771753eec.22.1782671080091;
        Sun, 28 Jun 2026 11:24:40 -0700 (PDT)
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr771720eec.22.1782671079570;
        Sun, 28 Jun 2026 11:24:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:55 +0530
Subject: [PATCH v3 2/8] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-2-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ondYi/J4omUToWNmj2nWqhqOf0wePhpZeJylLHwGXfY=;
 b=OaXvuIBH77BLABfsoVUiK2SLQPCijRGfyZFTJz+EP3d0PLXtC5KchOfPnFq6mXlqMb9xG8H0l
 xRhibSzgX5bBOSyhyra8+uMdkhad7ffYZ+5n3w/9rcsw4uJq3KId5uZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX8mBEd6ru5XZF
 e0XHTlGIeAaKMRu0KthY+uZVoQs6EWHTAw9gtGwqzZqq1glBmOgnPYygfM3RyadunPm+aphNZ7j
 ulyMjrlyu8YBOYzflqhLV/5X6CJOtZM=
X-Proofpoint-GUID: R-ZJGCJ2x9E153O-WKa3rZ5GhPcntjZx
X-Proofpoint-ORIG-GUID: R-ZJGCJ2x9E153O-WKa3rZ5GhPcntjZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX8RvnDXj+DAcq
 7U1iQg3z/pjy1b7E+bb2/+tnTUNWqqjBPfCS4s7WkgpCniFEM7M1rV0Um2axIzFgWI+jrTw69eB
 UVS5RIK6aVRpPFPDs6PhRNr2iz6VXH3JhlnCe0XLwlND/dXofZHIH4b9/vVTgy3u2IXxYP8cqiB
 37S8tBsdSgntOtVJ05/Roxu48/JfiZbTk6/rnCWLB/eSoSDNunxUJ0W98CfPbZZrgBqaKKcWsHW
 Mlmx1CuGtX/Ws4TGdxoLQkF02XF7t5w8KNfQvWZRsLVHOJYhwSl5l6YEHpVZYxpdCIBBnljiCar
 D43TEMCqump8oYJjBKGcPRtYmrQEN9eTADDCdQxNXec6TC0tPKBAAKpteVc+vxIrQuSMAwwj+7i
 eYcIWFCbfkraom9SV19UL0rhwZpQsgmUym1Mb5ozYawJS3Mac/AcSK6KvLfAuBJtDlhJMXUhiCs
 r/D+8dzm8VhG//kNNrg==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a4166e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114795-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: E71C86D4A21

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.51.0


