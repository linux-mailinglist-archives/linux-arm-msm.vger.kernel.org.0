Return-Path: <linux-arm-msm+bounces-109048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLVHAjL6DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:27:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA2E5A4C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 109353092E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027993CF665;
	Thu, 21 May 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJwkaT8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJZO0aNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE03CF698
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365818; cv=none; b=ctdhHn2snowzQqOaw24AMgaVU8a8PqHM+zENZm89vnFdfaFUrWMTYDNbjywCPR9+1EVV9n8bGRZwNZ6U9Rv72NUuLGxf2tY8qfA973MMipn7lo1vdywwCwRy60lF/V0ZnRycXDMmnr0KhSFaU8ko7X8ZwNIWd4YMQ+PLgzEhqbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365818; c=relaxed/simple;
	bh=FM2YtHpM4OM2HUWr2MmK4EhxL38NMpDBKrZYgHLhkWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER0LSV10SP5d4zWNwKIRjU9Ms+EF5/yJJ0i7u/3lSVDXc4w6Ur2LkuicvYPeFlHmmsuoS51rAzXmLpJMhH8tgE/rCq51ueHvVlUDX9zfOblOUaLT6pvF59V9GgaotoGFwu9d0Tuf+LXP02esTl1ZShfNZl1HsEYWj/N6ncmi8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJwkaT8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJZO0aNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jw23343451
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=; b=hJwkaT8z4Kp0K+T7
	7hLyG+UrEHeqqdgwWsVJyTjWQGVAnw8DlwXarISdMaRmOa5ETcy4b4d9vrF8Ygyn
	JkKl4NFzAio55YFw7EfMBSWZMkzpKKGuvvIweHVdhkVyII/+40B5dBgjggAt04nk
	2PR2cjsQ7SjYrpsKFVRfZjEfXlnDi+xMrFmxjGRdnTyNp1nzXOJaEkFch8ZfRNDU
	XhshLXaFt0vCHoCJNQf2NZVle3MicXE9Asl0W4SsnEKYyCQg+EiiD4DOGAF+O1G5
	3LbTkXZ65UwaG4hCVqGr44IP1okgtqYKtjPaOYIu3VxeEhhR/uE9H0s/p/d5bnT3
	BuMItA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs7va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc763c7256so140700195ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365816; x=1779970616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=;
        b=cJZO0aNWQws0IljZTs6tIklyAQ9TK/YPkS/e0/3ev+MSlg/SiwSx9EiQKDggDDvw/7
         bVQHvSXynHaFSxOwZ/mrEt0A7CcTm08vY67Yw/8Zv8OaZjreK9cdM4+3SIj0Srm0lOYU
         5S2OZayk7mbdPP7ou3DsruzRRxvcg+NgD5Opv27y9Lykm2V6Ktu42dWbqQnSOo2eN7vN
         PdXkZ9PFuRUlzfEf2hwbfFZ0mLdfyzR8+K5i3uPOrWN0B8LH7XIwqhjtB3hbTH7wBMC3
         XRm1FBKaYUv29q/J9udnGu1IOPz2e0VJKuABXP0bNHCbf9OjHh6ubjT+pW6ENYe0/AlB
         1GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365816; x=1779970616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTeTl1+Qq4xtD/LrLJVHev9cviwyL7IZCbUMY7wQWU0=;
        b=etiEMdNrPDa+ykJaUXXIlDG6RrDVA1sejIkJMI0j+NFw8+j+yzjx5vVqPpXxKljV9u
         rlapfENeqhVwUg0F8/lWq+LEnEHTuVrSCe9MZikdJdbNDJO/jtJC2Tz5GVxwrnxmEdKQ
         GKlVxzPvEcggWdQumMYdaCUawxtUQq7JF/Z4Qvnz0z/rJTZwxo8EzmC9rT/BFwIyROPN
         1WQH/chvcwe7GOCRGEeNWzhs9zOYEy1YDWWRrgSphOU3JnwF8CxwqMDHAvOTXZkFJzhK
         2s9/4U/2mdcw1LXNIG6Z0xdR/4cuRkfd6euXQxbDMWzFEXGR8oAQVcZ15R7IgpKhdrdK
         a5oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l50PmkTFXccLeRSIDEayRFGEPQci3Q+inPxq5SolerLGYhCg8BRh6eQvAwmuYS3mOMKGRPfJDxalX6P3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyBlqEkhwf0LPkYv2+bnb/bYer7rxeAlJ7s+w48qA9oB1hb5I71
	oZ0b8uqQE+3tASelEWAYkABMKs2IXVvKZV4tJ/DVihB7w1YRXWWtDaTdNHWsGu3HxK+dmftvwRO
	vHlf6wetJLDcoyeBuzzdx4HAzGIBhP79DHWd4swnJ8rPibLxOSb3mymXB+lEX+xf0UGsP
X-Gm-Gg: Acq92OEjR9rQM9xgTghebW9/nENq2TAqnqAfbXI/+RUyxAfBlmK6ZnXs4E12HjA5ZGX
	C4UCn1+vhI6mqtNSBKreYLU9WDC+w5xrVhAEesEa35z61T/as9V23jEikyDAmNNwllm9vFUxU1l
	zpxgjkfcrUCoocj8S4q0SGkYmb6eSrzDG81sDFIwzO4E4+BJ/7aq3VqK6nqnCH1UOYB+urmjkIy
	4aY3kwPqddO6z+kURMyTAlFVttXdzFYXikf5wxV12F76sGs6eq4cjKBAjkKe9HytK5AZ0Rsz869
	bxPbQueuuR5pIMDZCYmtdhXysTWrxgGk/56MyZUPmwT816xKnWfFR3VJ2q9h8bnGRFRwcMrZk52
	XBK0yOsM2CBz75jijzVOYWw9lc0O7PSAknKKV3JcjH8m2g69x5BS6NNop81REtlk5uuP0+8ebtb
	5524kkO2NICRPKMw==
X-Received: by 2002:a17:903:298e:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bea33833d8mr29418265ad.28.1779365815577;
        Thu, 21 May 2026 05:16:55 -0700 (PDT)
X-Received: by 2002:a17:903:298e:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bea33833d8mr29417895ad.28.1779365815129;
        Thu, 21 May 2026 05:16:55 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:54 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:30 +0800
Subject: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=5578;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=FM2YtHpM4OM2HUWr2MmK4EhxL38NMpDBKrZYgHLhkWw=;
 b=Ds114TPyMEar/y2iZD9LJeZrXlieJ7ZuzRXSPr95QRLqTkOMZ8bTcznAP6UxlyPYeoEw/Q4j9
 PpmiG0bii0BDjzLh/r6KKKYrUT7RdWxuz6oDifB+u0XaZyDhkyR1SmU
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfXw/Pl8D1avkRB
 uMXh7cbPQMc+yaW+0psGp+h12XPHZiipKdKx9Sz4YieMDrQFkUTRd1jz04+Bpo79ds0ha9gYcF6
 kvuvi7JpxH0IoeGh2VjDezvyitmsnouNXgSPEIDJ44v+nfT1RWYXQ5HrWC6avPkduzLGgIscbIO
 Oltbjz6+PmGN8fvi4La9g2vwByBx3TvGVEGFWNYR4ZsVHSRISJr8F8qk3bzxo+zIecEHVkY15Jj
 I/mpzQwPFhI1ZB38iFpkVTEjWDG/gvPZhYWpARqcZyc1sJfVvlCBPi7Wk1U6iq5CygGXE2Cr+ZW
 2+ClH7bdgx+cazZXFZJ9OQA6t2VLDABjthOhvTaZ3uAafdvi9QFBqbZBpmlGlfrV/8uysEjZncX
 fNrWeVPxu63W4pcbUkJqG3XcLmIdDD0q21o9wJ/R4SWxat3fAvlLI37Xmtff1iMNaoODNfnuJr/
 8WxL4ZysOlnGKBfX0jw==
X-Proofpoint-ORIG-GUID: -FjZ8tDdP590-3ZLhPqmxHAqR2w6_ezK
X-Proofpoint-GUID: -FjZ8tDdP590-3ZLhPqmxHAqR2w6_ezK
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ef7b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yoa6GI8vE20v00mW0vsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109048-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EA2E5A4C6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm extended CTI implements banked trigger status and integration
registers, where each bank covers 32 triggers. Multiple instances of
these registers are required to expose the full trigger space.

Add coresight_cti_reg_index(), coresight_cti_reg_rw_index(), and
coresight_cti_reg_wo_index() macros that carry the bank index in the
cs_off_attribute.index field, keeping the base offset and index
separate rather than encoding them together.

Add static sysfs entries for the banked CTI registers and control
their visibility based on the underlying hardware configuration.
Visibility is determined by comparing the attribute's index against
the number of banks implied by nr_trig_max (32 triggers per bank).
Registers beyond the hardware capacity are hidden, preserving the
existing ABI on standard ARM CTIs while exposing the full register
set on Qualcomm CTIs.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 7191a478b2da..feecc9d6563f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -207,6 +207,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_rw(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -217,6 +226,16 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_rw_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0644, coresight_cti_reg_show,		\
+		       coresight_cti_reg_store),			\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_wo(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -226,6 +245,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_wo_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
 	coresight_cti_reg(devaff0, CTIDEVAFF0),
@@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
 	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
+	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
+	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),
 	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg_index(trigoutstatus1, CTITRIGOUTSTATUS, 1),
+	coresight_cti_reg_index(trigoutstatus2, CTITRIGOUTSTATUS, 2),
+	coresight_cti_reg_index(trigoutstatus3, CTITRIGOUTSTATUS, 3),
 	coresight_cti_reg(chinstatus, CTICHINSTATUS),
 	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
 	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
 	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg_index(ittrigin1, ITTRIGIN, 1),
+	coresight_cti_reg_index(ittrigin2, ITTRIGIN, 2),
+	coresight_cti_reg_index(ittrigin3, ITTRIGIN, 3),
 	coresight_cti_reg(itchin, ITCHIN),
 	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw_index(ittrigout1, ITTRIGOUT, 1),
+	coresight_cti_reg_rw_index(ittrigout2, ITTRIGOUT, 2),
+	coresight_cti_reg_rw_index(ittrigout3, ITTRIGOUT, 3),
 	coresight_cti_reg_rw(itchout, ITCHOUT),
 	coresight_cti_reg(itchoutack, ITCHOUTACK),
 	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg_index(ittrigoutack1, ITTRIGOUTACK, 1),
+	coresight_cti_reg_index(ittrigoutack2, ITTRIGOUTACK, 2),
+	coresight_cti_reg_index(ittrigoutack3, ITTRIGOUTACK, 3),
 	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo_index(ittriginack1, ITTRIGINACK, 1),
+	coresight_cti_reg_wo_index(ittriginack2, ITTRIGINACK, 2),
+	coresight_cti_reg_wo_index(ittriginack3, ITTRIGINACK, 3),
 	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
@@ -537,10 +583,22 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct device_attribute *dev_attr;
+	struct cs_off_attribute *cti_attr;
+	int max_bank;
 
 	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
 		return 0;
 
+	dev_attr = container_of(attr, struct device_attribute, attr);
+	if (dev_attr->show == coresight_cti_reg_show ||
+	    dev_attr->store == coresight_cti_reg_store) {
+		cti_attr = container_of(dev_attr, struct cs_off_attribute, attr);
+		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
+		if (cti_attr->index >= max_bank)
+			return 0;
+	}
+
 	return attr->mode;
 }
 

-- 
2.43.0


