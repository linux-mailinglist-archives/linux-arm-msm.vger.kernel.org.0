Return-Path: <linux-arm-msm+bounces-114226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tPZcKz6eOmo6BwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3496B80F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SepkRtGD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZL+byM1J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114226-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114226-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED1A730FA71C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3413D565F;
	Tue, 23 Jun 2026 14:52:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002B3D5241
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226359; cv=none; b=PHtMSJ0uLsgbDjcBuVS7uGe2BfIsmR7afRw3hlYlzzujhgjkARBFjknSQO13MYYmEHSjXNXATLCv42PdApi8ktCY7/QtDDaHRks3Tn3Fz122zDqY7t3cMW3aYnZXxXO6yU8tMTmAoS/2Ba5aNgVCwuxoomfvobYkzKmrKeIgn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226359; c=relaxed/simple;
	bh=gs/hzEwhAJ+r7pTjkeMeBtJvWM1dkzXQiQwCXPXmifw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PK9z1zHhOrAuHlasiFQMhhAh9Zux6aNdJM2yyu82nVdf6LxoC3w346kEj2xIjls4scbCTtni+6vAd/iaCsiQ0f4NqqFckljhoeNEpK+zyfup3LZitpcP8T8GAhheVUbczsAFE7idziF8drQhMua1Sa5mrPQoTs2AZRM1gB64Xy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SepkRtGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL+byM1J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZGjX031379
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KGi2wSuhgMr
	bNgIYWEFeuPYzY4mJULYGKSBHEKbMvdI=; b=SepkRtGDsmdMlBIxRFG+aBuiFna
	olP8tlOWHqeedM4SJohjMVZ8onn509o9SK0GVISm1xwkiS5+RkZOmB3LG5v4ie/1
	D5U0DPdUTFMpkm28EsfuU/rpl2moeHfJ7DDyLu97M35hPD0CNRkZjyHitupEXGDN
	pVUF2x1m4bsVYeHKJ8d76AOI8h1AxMGAwR0H6EURR7tWNbydMaaDP/wCmQPLd2yb
	FM22AG2H8aEOUvQ1yPTd/oc+ezMm2tXHufDMbcLwwbTBIhhy2m9sBO3t2HWmmLqk
	uzoMtuiByL5a5ljU1m0K3f12iHROOWRe865J8zo1CoHZDr+S/VmVhqehq8w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69chk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966efc9ab60so5821703241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226357; x=1782831157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGi2wSuhgMrbNgIYWEFeuPYzY4mJULYGKSBHEKbMvdI=;
        b=ZL+byM1JECDRM2AgtDD87pFTsJ6Z7EJVIlD8OF0gbHGD5Uoo2RprE4xvaeQ0tqp1J+
         vdFj6boW4UqWaauSZrA/xcaoTMOxrMuthGNyLYJhASGy4lT+v1/sZ9aEFVMfS04ABrbo
         asLLnmhNj5bgFesRyNsbyfO+hA6fp1gcnTsePoMlN9iFA0oSdDNIbFRyR5IvLNfAqG5t
         f6xeu4rSZtSQ4AzvML4k0kTwutuSv6tL1hhrGFW4zpwKYWLh+9JYfVIuWjrs5GhnimkX
         06IRZTOSl9HttSR4RF5rZfBS+yAQY+iDrPdIfzsKaHRf5bkQcly6wo8CTzrp0EXd+R2g
         lidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226357; x=1782831157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KGi2wSuhgMrbNgIYWEFeuPYzY4mJULYGKSBHEKbMvdI=;
        b=iZtnXDj1jUZKpkjTj/ghmQg5l7NzNxnIs7S9BKTlWSoXVGyQLiajGV6BMwwK1T/KNP
         tgwnFPJsENkt0+s9n/opmVZ1xZUzYPVgz6Ie1q6vWvILQulIv+kn9JT/4WdWdU1+Bika
         JtxK1auruavY85pne52lGArUMZDAY24ilZEjJ0pp4Wr+A068aiwp9nDpqu/A0euGQzdJ
         3gmxfW+e2hp7kE6VVPTAwRnB2Fj4xPVEul/2bvlwA6b0Nkkbg2tRDpYRrzJAIrGofv/q
         VTqnrlEy/+3U/DAo0usdiTQHMLObwFonvEEdA8sQUrCiR6Guc4IT/4d3VHm23i+oL2n7
         a8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ955kzbQ/0aH7qwO7UNABMTmYKxJPXGXoN4P2v0gsUsnr3lm7KULhrgBYzJ/uEaGhuTBzs/LqyNtTfzx6p+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/C9djdzBGHiLTm1doqhIhuvYVQjjZN34J5IQu7/0CcaVk1Yeq
	u8mrYlkMwdd+Ufyd6p6QYW2KLZxCux3lz3c9C4KBTPtEAGRPDoA5coxzh3drJsqMGqab5p/rRIc
	gPqsqdvKWbCm5dggJpG7FGnrZFA84huBcrdFuHcNxqENV3LCCmsxy+hfKHDJdIbgPX4FM
X-Gm-Gg: AfdE7cnE3QHnVMBjzBX0bFXBt2+1yBZXdbnPKpNzcLB2hgPJvh8qoSr1TZqQ8lxR+V2
	TWHvaNvTP+mnqujKAIk4HtHihGBQDTKGMXTx/MwVY5tQiYIoDkbhJZVrnbh29Xv9so51v49srx/
	UrZ8YBAaRZJHZ1b9aR95F75rpeKPIoOhV2NM7/3NuaMBPW9hkKOCDAk7BM44y+cyGopLtL0mDs3
	O7PGP0HLgKNUAWhqMRRgJsPY+DeUgeGpXx0Xs2ur41ElzhSkjlx9AoocTJ3fXUxeIZxZVAJNdBe
	sfqySSmxsRtplnPM9tO+chnsPdbIu6tiW5e6ZVFLCx9oB3ETTcpLJGI71aO2RFkm1iUhwoHem+o
	joV8nNK7+LFrbYWHiXbNmTIEQquMOaON9+uMyM/kSKl7bybJ4f5znI4i7UgYyV7kUjSzskm8s3y
	fDjmiYYjf3stq9Hj4VfbDUiQ522A==
X-Received: by 2002:a05:6102:3710:b0:6f0:3999:b378 with SMTP id ada2fe7eead31-72a1f0bbe0fmr11192247137.13.1782226356882;
        Tue, 23 Jun 2026 07:52:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:6f0:3999:b378 with SMTP id ada2fe7eead31-72a1f0bbe0fmr11192215137.13.1782226356415;
        Tue, 23 Jun 2026 07:52:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 05/12] ACPI: glue: Implement setting secondary-fwnode for DT-ACPI hybrid mode
Date: Tue, 23 Jun 2026 16:52:18 +0200
Message-ID: <20260623145225.143218-6-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1aNqbCoUYA-xAib8s0Ip98jhp2mPw-6w
X-Proofpoint-ORIG-GUID: 1aNqbCoUYA-xAib8s0Ip98jhp2mPw-6w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXz9t6xOAnbaDh
 IbQfhDx/zY2OE3z8fAUqv2DvIqHAqW+Yu2ev2eLukYRFm1vkrUmbjwjiUcZG0Xd8fIc6w4Q8m8F
 gYUtf49AfAJlYQ9rH38dc0edxO2ZTg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX3HFS7sykFsUz
 RzCaxtpq80srPIpFIrcJCs6FgOu0HaZR/mzIXw5f6UNczAGNCRT5AUgAGWW87Gr+M/879IBhZXn
 EMp7exepYkBc3M5J/VFuAzMR4Nx9KItzTmN0FDz9tmw1g8bBqVlGd5XrG8AlAFoD3yrOgyBQe2z
 XX4mohdumICwkAHcISKhP9gX1pmRDaMirEhAWgypNhr4VtrAg9RnMslbW3FfEd/oRexAZ20XcAp
 eo8nXNOAD4AGonTyPVsfueNIlu2CLHw1Q7ScaBzKBpfnKGVblcY5wzj1Qgu5h55ZD3D8VtUBgtP
 1wdGMmfaCs2YDQQJjLcnhS6MMS0CMjX7wI8YKRvj4KC+9ncj8EyshY0wtI07iv83Y5mRg9FTlR5
 OFn0qqzOOfbFMDT1vYgoC4UeiN91LFKGJvTNBcxMt1iuv7J0YL43Z4iSe87eqSexXHgslUw3ObS
 ZEgCa7hRvArvizg8M9Q==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a9db5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=SqAYOdU-xvaNvrLwBAEA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F3496B80F7

In DT-ACPI hybrid mode devices are instantiated from device tree and
a device's primary firmware-node will normally be an of fwnode.

Add support to the ACPI glue code to check the new "acpi-path" DT property
and when this is set lookup the handle for the specified path and set
the secondary-fwnode of the device to point to the handle's ACPI fwnode.

Also create a firmware_node and physical_node links/entries as normal.

When e.g. an "acpi-path" property is specified for e.g. an i2c-adapter
then the normal ACPI i2c-client enumeration will happen for any ACPI
fwnodes with an I2CSerialBus resource pointing to the i2c-adapter, these
ACPI instantiated i2c_clients will have an ACPI fwnode as primary fwnode.
The normal acpi_device_notify[_remove]() paths will be used for these.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/acpi/glue.c | 70 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
index b1776809279d..fef450d5cb7d 100644
--- a/drivers/acpi/glue.c
+++ b/drivers/acpi/glue.c
@@ -225,6 +225,15 @@ static void acpi_physnode_link_name(char *buf, unsigned int node_id)
 		strcpy(buf, PHYSICAL_NODE_STRING);
 }
 
+/* Like ACPI_COMPANION_SET() but set secondary fwnode if primary is an of_node */
+static void acpi_companion_set_any(struct device *dev, struct acpi_device *adev)
+{
+	if (is_of_node(dev->fwnode))
+		set_secondary_fwnode(dev, adev ? acpi_fwnode_handle(adev) : NULL);
+	else
+		set_primary_fwnode(dev, adev ? acpi_fwnode_handle(adev) : NULL);
+}
+
 int acpi_bind_one(struct device *dev, struct acpi_device *acpi_dev)
 {
 	struct acpi_device_physical_node *physical_node, *pn;
@@ -233,12 +242,12 @@ int acpi_bind_one(struct device *dev, struct acpi_device *acpi_dev)
 	unsigned int node_id;
 	int retval = -EINVAL;
 
-	if (has_acpi_companion(dev)) {
+	if (is_acpi_device_node_any(dev->fwnode)) {
 		if (acpi_dev) {
 			dev_warn(dev, "ACPI companion already set\n");
 			return -EINVAL;
 		} else {
-			acpi_dev = ACPI_COMPANION(dev);
+			acpi_dev = to_acpi_device_node_any(dev->fwnode);
 		}
 	}
 	if (!acpi_dev)
@@ -267,7 +276,7 @@ int acpi_bind_one(struct device *dev, struct acpi_device *acpi_dev)
 
 			dev_warn(dev, "Already associated with ACPI node\n");
 			kfree(physical_node);
-			if (ACPI_COMPANION(dev) != acpi_dev)
+			if (to_acpi_device_node_any(dev->fwnode) != acpi_dev)
 				goto err;
 
 			put_device(dev);
@@ -285,8 +294,8 @@ int acpi_bind_one(struct device *dev, struct acpi_device *acpi_dev)
 	list_add(&physical_node->node, physnode_list);
 	acpi_dev->physical_node_count++;
 
-	if (!has_acpi_companion(dev))
-		ACPI_COMPANION_SET(dev, acpi_dev);
+	if (!is_acpi_device_node_any(dev->fwnode))
+		acpi_companion_set_any(dev, acpi_dev);
 
 	acpi_physnode_link_name(physical_node_name, node_id);
 	retval = sysfs_create_link(&acpi_dev->dev.kobj, &dev->kobj,
@@ -303,13 +312,14 @@ int acpi_bind_one(struct device *dev, struct acpi_device *acpi_dev)
 
 	mutex_unlock(&acpi_dev->physical_node_lock);
 
-	if (acpi_dev->wakeup.flags.valid)
+	/* Don't set wakeup flag for devices where ACPI fwnode is secondary */
+	if (acpi_dev->wakeup.flags.valid && has_acpi_companion(dev))
 		device_set_wakeup_capable(dev, true);
 
 	return 0;
 
  err:
-	ACPI_COMPANION_SET(dev, NULL);
+	acpi_companion_set_any(dev, NULL);
 	put_device(dev);
 	acpi_dev_put(acpi_dev);
 	return retval;
@@ -318,7 +328,7 @@ EXPORT_SYMBOL_GPL(acpi_bind_one);
 
 int acpi_unbind_one(struct device *dev)
 {
-	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+	struct acpi_device *acpi_dev = to_acpi_device_node_any(dev->fwnode);
 	struct acpi_device_physical_node *entry;
 
 	if (!acpi_dev)
@@ -336,7 +346,7 @@ int acpi_unbind_one(struct device *dev)
 			acpi_physnode_link_name(physnode_name, entry->node_id);
 			sysfs_remove_link(&acpi_dev->dev.kobj, physnode_name);
 			sysfs_remove_link(&dev->kobj, "firmware_node");
-			ACPI_COMPANION_SET(dev, NULL);
+			acpi_companion_set_any(dev, NULL);
 			/* Drop references taken by acpi_bind_one(). */
 			put_device(dev);
 			acpi_dev_put(acpi_dev);
@@ -354,6 +364,40 @@ void acpi_device_notify(struct device *dev)
 	struct acpi_device *adev;
 	int ret;
 
+	if (acpi_dt_hybrid && is_of_node(dev->fwnode)) {
+		const char *acpi_path;
+		acpi_status status;
+		acpi_handle handle;
+
+		ret = of_property_read_string(dev->of_node, "acpi-path", &acpi_path);
+		if (ret)
+			return;
+
+		status = acpi_get_handle(NULL, acpi_path, &handle);
+		if (ACPI_FAILURE(status))
+			goto err_hybrid;
+
+		adev = acpi_fetch_acpi_dev(handle);
+		if (!adev)
+			goto err_hybrid;
+
+		/*
+		 * set_secondary_fwnode() + pass NULL to make this work for
+		 * child devices which share the fwnode with their parent.
+		 */
+		set_secondary_fwnode(dev, acpi_fwnode_handle(adev));
+		ret = acpi_bind_one(dev, NULL);
+		if (ret)
+			goto err_hybrid;
+
+		/* TODO change to dev_dbg() when DT-ACPI hybrid support is stable */
+		dev_info(dev, "Set secondary fwnode to acpi-path '%s'\n", acpi_path);
+		return;
+err_hybrid:
+		dev_warn(dev, "Failed to set ACPI fwnode for acpi-path '%s'\n", acpi_path);
+		return;
+	}
+
 	ret = acpi_bind_one(dev, NULL);
 	if (ret) {
 		struct acpi_bus_type *type = acpi_get_bus_type(dev);
@@ -400,8 +444,14 @@ void acpi_device_notify(struct device *dev)
 
 void acpi_device_notify_remove(struct device *dev)
 {
-	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct acpi_device *adev;
 
+	if (acpi_dt_hybrid && is_of_node(dev->fwnode)) {
+		acpi_unbind_one(dev);
+		return;
+	}
+
+	adev = ACPI_COMPANION(dev);
 	if (!adev)
 		return;
 
-- 
2.54.0


