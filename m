Return-Path: <linux-arm-msm+bounces-117146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yF0gBUSZTGp+mwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0D717D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mVBfFR5q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gHYtlPX+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8731305347A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95438AC72;
	Tue,  7 Jul 2026 06:12:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E0217F27
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404749; cv=none; b=cbbQR/ESEDK6u1wt8pPTXWa3H/1Y42t42BGlSBpcfsAkm/oYE39xt/709LnuNMSuteIsgwe7LvdMptjnaWQ6coG/ThFnsFmgpOiyRqYPRwVgzSi4ZdYo/L+8abkvebG6FOLZMMZUsv92FrtR1MVS5+KictOHLxLQ9PQjjoa4I88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404749; c=relaxed/simple;
	bh=LosjvZDIaSYjB3Gq/q9l/AWJ3RurWA5UZWsVfICp0jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cazSnDAVgCsHNoGjUv2gdJEVd8xayZSugB2p/2Z6I93FOjOgri48n+vFI8o+tsnGNVU0lte35vNI8rS6qn5ItCfcIrqmcIN4aiTOEk3kOcLQyg+XZIsjIYZsKDZW2sCrB9Rr0j7QhvMU4wC3GO9HxUAyeA3ffTArp+IJgf1XZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVBfFR5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHYtlPX+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748soe2629807
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=; b=mVBfFR5qb3w5S2Dt
	aNw7+nCr5QblE+/xsM6NtcUOVBV4HKgZFDGTSDxuNYQTmUmwo/nfDwubAnIU4zgB
	cgw7SpeKGlnIS0lxqBrXoLwSK3QDcvHQiadWmxN+IzpvYmzR/okBnJKI/9RmONwM
	KINIyv8qqUmwwjD1MvzhXRi0kk/vlIiuit4qwNtoKs53mcXAntjpKyKXHT7U8Pon
	aXD+ToUqCgfM+fpA68WHW6AefDthYAdhIcp8hU+bYU8+RZZX4R58+AGhfvjaHGQK
	OJHIgUVFkYQOM2m/zacAr7k+nCCMTYZMlGuDGPhWXzO7q0tzL0aPaZK2vK0o2Uuj
	iS/ePQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54tb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847ad67cc51so3999791b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404745; x=1784009545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=;
        b=gHYtlPX+Jo2t7OLEz/OdnOMJOxszpjwEE84uYhl1cfQAJXTEOS5kNn3wIfWmOx4Fxm
         Qz0LursbYS39h1ClsVujptl0nm0UQdUwCpMiWQVbMOR7GyupV93i0o45u6CKYJ8fCTSm
         /TeCNTl9Aes+9t66GRZaI2zSQtpezMbjI0UeNU1J3aF8Q2Uv+2acho/cTYuJMf80eh6u
         IV4KFJZZcJ/6DEjyPQOY27+M+j4HYo7pV5DHLra4uZlqJCJDJ5yorhs33O7UjvK4UuiS
         L+CW3N/g4XmKqTeke/QJbl1EhYVL3+l+kJEgLPiReK2x82eo2PcnvfHTQ4DrkGxNoF1J
         FHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404745; x=1784009545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=;
        b=jhaXF4YRmlxOP1CtWy8oIyQlbmVPXLlh1kLUW4APCVsxKhjPTqpWZxniXu5clD6Xdt
         Ihc5WTp56Jns0dVuM5iAcCvQ91arNZetxbShxIDZTQ4M5Mg5Z3i/eMDF/IFHq/QSmVwk
         qirKHGNojfa/zgPAvwgI5V7rVplS0Ap05xCOTfeQTNlxcOm6W7xydon6IFO4HErm6w8W
         MY3mt3bDHTBbuzoEoMW9IzK6oBbNWhiS4gnDEI7r6G85nD8R91SSIDy8s/LO9henxJv6
         AED8pZkMg/E9OfnucJB3NHEOh1BNnF/QLyPnvtsmQPtkyDiEFoX5Gx6+RiugSOCcF1yr
         c5yw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4OjC7t7tgK9g91eqdcs3iREHwtdK4cxfFrG97S26I7/ldRpA3oR4jKWOYHp9Bi1+UfSt8ZCDpBKhAp9hi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9rXrBCvOEfms/I2MwvLgKguTOU5oDTtJ/YJk+anTq+zQYnLv
	Cjf+TvbU2UYGQa6gUaEF7+DHEmo1G0l9+piOsv9GM8Jz1UY2xYEiEmfzP3VWUf1n4OkRqOXQGRy
	DZUSx+vFBmlQ8copwKADQClF4DM/Fi2ck8YASYmMRlmL8fpKVFOP5O8qGUh3+WvXoUoYw
X-Gm-Gg: AfdE7cnsUwkLqbKej42GNVJJ7UxkYTA0HHIojd5eQ6Hd7PPbdQF6UdHEEbIvXg1YA1y
	yf7VU8tK2oZ7XPKmHCNVznTPlKYNmnPV4Q53Gbbm9ShnQihzkGvowdL1uDYHPusEmOCo6DX1GUJ
	OVx15UVGPGddH832tZdTynHroNf2AYMsu3haLsluD6np6NfA87YZWYrR7KMbgro9GW6HCd2iIu6
	nLmzuxsUKGvYh7p0ABe3T6L+usrPxuNAyG5g9k9Xf1KhMcLchm/Y95Lcoc6k9vPpySkOK0CFBmm
	oX5gj2KaDz1I3ocl8Pv4jYEgAY/DTrN5+N6OLOjcexyCWMao7pZx6us32Qd3Lg8Ssea0PahKvB9
	4jm3fTwDlwOLRjr5WMxrRZkMTULjwolzZiZM+
X-Received: by 2002:a05:6a00:138c:b0:847:5ec4:9a1d with SMTP id d2e1a72fcca58-84826e92e7dmr3640820b3a.62.1783404745236;
        Mon, 06 Jul 2026 23:12:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:138c:b0:847:5ec4:9a1d with SMTP id d2e1a72fcca58-84826e92e7dmr3640799b3a.62.1783404744615;
        Mon, 06 Jul 2026 23:12:24 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:24 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:32 +0530
Subject: [PATCH 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-6-f659cbd5d04c@oss.qualcomm.com>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=26036;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LosjvZDIaSYjB3Gq/q9l/AWJ3RurWA5UZWsVfICp0jM=;
 b=JYe4Ej5i+uPIMFgmU8k47HaG3+mNBjG5W443uoQaBEDuHxW60RvSgSTi3xqz0or59AuxosaMS
 IsOUhCul+7jB2f2PynGDhvmdpVdkS6zxI4KvTX86xtEmhkOFkMreCTU
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 3ak7gD7CUvrvD69OYbl0ZUOJ4rjQ10Wd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX9PvAr+s32Qqa
 WRgOUvdQdQ/HKKDAOhfnb0fJ5S2faL3UVSQt/qFS7G86NKQDlL30nK6zd4hmXEGPLGI1fPmtcPg
 g0/5DYCj2aEDRLCwwRC4uTI+qxfE5bg=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c98ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=lX1A334Kam2MR8cuwK8A:9
 a=ZP9I4r549iL3ZUHD:21 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX6jNWZSnY+5xt
 z3E1JAwoNFeWrn5hoXVYuzc7lbm9rbjJRXltEq5lykH0DFf/8gemEC3jTlgeCEt1l9eGj+IvCbo
 MvDc+OlJhOSNRu12CC5RTEWGwYgTIBag/ET5n6KsUIbZdRZ4CXF2RF9qPkUwzaxbLxP1rMboi1J
 JW1yWi/kqMWuqpAKLDyQn+hLkpVrGrpAJRurWT81pgChgWXt1CZuE4qSYtCldhkn+uydmglN0x/
 PfmvLnHSNfin65kIVIZwG3IVGbbHIAqEbNQ8Q5yaokLXk64sTrpPN8C4ItLBfa+HESsrLOcM9Wm
 JnRh3v5wMdEEnwxwLNynr8z/IZrOY6gCc/t0/qYMtJ8AYU+WwKX358JmRe55XJ8O8Jpr2nUtZ1O
 iHUWNSbfFehAdnWxS/1pJ4pnlyt3ObHU3rgGCU4I/CN7R+AaTNDPal5u30wf+HlCxNMwKIaYg63
 Yek0X9ktImWLUNTS4zA==
X-Proofpoint-ORIG-GUID: 3ak7gD7CUvrvD69OYbl0ZUOJ4rjQ10Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117146-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78D0D717D7C

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) which is only accessible by the
Qualcomm Trusted Execution Environment (QTEE).

For Qualcomm platforms without emulated RPMB support, specifically
platforms where RPMB is not located within SPI-NOR storage and instead
located on UFS/EMMC storage, non-volatile EFI variables can only be set via
a callback request from the UEFI Trusted Application (TA) to the RPMB
service running in user-space (within the QTEE supplicant).

Unlike the QCOMTEE driver, the QSEECOM driver (used by the current
uefisecapp client driver) does not support callback requests. And on
certain Qualcomm platforms such as the RB3Gen2, attempts to access the
QSEECOM interface fail due to lack of support within QTEE.
On all such platforms, a TEE based uefisecapp client driver must be used to
access cached/volatile EFI variables within the uefisecapp TA and ensure
persistence of writes to non-volatile EFI variables through the RPMB
service hosted in the QTEE supplicant.

Add support for a TEE based uefisecapp client driver which installs efivar
operations after obtaining an object reference to the uefisecapp service.
This enables the kernel/user-space to access/modify both volatile EFI vars
stored by the Secure Application (in-memory) and non-volatile ones stored
within RPMB.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                                 |   7 +
 drivers/firmware/qcom/Kconfig               |  24 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
 5 files changed, 677 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..e8316007370f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22018,6 +22018,13 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
 
+QUALCOMM TEE UEFISECAPP DRIVER
+M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
+F:	drivers/firmware/qcom/qcom_tee_uefisecapp.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
 M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index b477d54b495a..20ce8b58e490 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -74,4 +74,28 @@ config QCOM_QSEECOM_UEFISECAPP
 	  Select Y here to provide access to EFI variables on the aforementioned
 	  platforms.
 
+config QCOM_TEE_UEFISECAPP
+	tristate "Qualcomm TEE UEFI Secure App client driver"
+	depends on QCOMTEE
+	depends on EFI
+	depends on !QCOM_QSEECOM_UEFISECAPP
+	help
+	  On Qualcomm SoC based platforms without emulated RPMB support,
+	  specifically platforms where RPMB is not present within SPI-NOR storage
+	  and instead located on UFS/EMMC storage, non-volatile EFI variables can
+	  only be set via a callback request from the UEFI Secure Application to
+	  the RPMB service running in user-space (within the QTEE supplicant:
+	  github.com/qualcomm/minkipc). Unlike the QCOMTEE driver, the QSEECOM
+	  driver used by the QSEECOM based uefisecapp does not support callback
+	  requests. And so on these platforms, the TEE based uefisecapp client
+	  driver must be used to ensure persistence of non-volatile EFI variables
+	  via writes through the RPMB service hosted in the QTEE supplicant.
+
+	  This module provides a TEE client driver for uefisecapp, installing efivar
+	  operations to allow the kernel and user-space access to EFI variables.
+
+	  Select m here to provide access to EFI variables on the aforementioned
+	  platforms if your Linux distribution has QTEE supplicant installed and
+	  running.
+
 endmenu
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 0be40a1abc13..d780490b2865 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
+obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
new file mode 100644
index 000000000000..9a5a6f145a9f
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/efi.h>
+#include <linux/tee.h>
+#include <linux/tee_drv.h>
+#include <linux/ucs2_string.h>
+#include "qcom_tee_uefisecapp.h"
+
+static struct qcomtee_uefisec_app uefisec_app;
+
+static int qcuefi_get_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+			       struct tee_param_ubuf in_attributes,
+			       struct tee_param_ubuf *data,
+			       u32 *out_attributes, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 5;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	struct {
+		u32 out_data_size;
+		u32 attributes;
+		u32 errno;
+	} out_cong = { 0 };
+
+	in_cong.guid = *guid;
+	in_cong.in_data_size = data->size;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_GET_VAR, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, in_attributes);
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+	SET_TEE_PARAM_UBUF(param[4], UBUF_OUTPUT, *data);
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_VAR invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	data->size = out_cong.out_data_size;
+	*out_attributes = out_cong.attributes;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
+					      u32 *attr, unsigned long *data_size,
+					      void *data)
+{
+	int ret;
+	u32 in_attr, out_attributes, out_errno;
+	struct tee_param_ubuf in_data, in_var, in_attributes;
+
+	if (!name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	/* 'attr' can be NULL, however an input attribute is always expected
+	 * by UefiSecApp TA
+	 */
+	in_attr = 0;
+	if (attr)
+		in_attr = *attr;
+
+	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
+	in_var = (struct tee_param_ubuf){ .addr = name,
+					  (ucs2_strlen(name) + 1) * sizeof(*name) };
+	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
+
+	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
+	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
+				  &out_attributes, &out_errno);
+
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
+		/* If 'attr' is NULL 'out_attributes' is not updated. */
+		if (attr)
+			*attr = out_attributes;
+
+		*data_size = in_data.size;
+	}
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_set_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+			       u32 attributes, struct tee_param_ubuf data,
+			       u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 4;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 attributes;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	in_cong.guid = *guid;
+	in_cong.attributes = attributes;
+	in_cong.in_data_size = data.size;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_SET_VAR, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, data);
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(*out_errno));
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_SET_VAR invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_set_variable(efi_char16_t *name, efi_guid_t *guid,
+					      u32 attr, unsigned long data_size,
+					      void *data)
+{
+	int ret;
+	u32 out_errno;
+	struct tee_param_ubuf in_data, in_var;
+
+	if (!name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	in_data = (struct tee_param_ubuf){ .addr = data, data_size };
+	in_var = (struct tee_param_ubuf){ .addr = name,
+					  (ucs2_strlen(name) + 1) * sizeof(*name) };
+
+	ret = qcuefi_set_variable(in_var, guid, attr, in_data, &out_errno);
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_get_next_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+				    struct tee_param_ubuf *out_variable,
+				    efi_guid_t *out_vendor_guid, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 4;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	struct {
+		efi_guid_t guid;
+		u32 out_data_size;
+		u32 errno;
+	} out_cong = { 0 };
+
+	/* Pass size of available buffer */
+	in_cong.in_data_size = out_variable->size;
+	in_cong.guid = *guid;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, *out_variable);
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	/* UefiSecApp TA does not touch 'out_variable.size'. Update it here.
+	 * On SUCCESS (!out_errno), 'out_data_size' is length of name in 'out_variable.addr'.
+	 * On failure (out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT), 'out_data_size' is
+	 * actual name length.
+	 * Otherwise, it's undefined.
+	 */
+	out_variable->size = out_cong.out_data_size;
+	*out_vendor_guid = out_cong.guid;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_get_next_variable(unsigned long *name_size,
+						   efi_char16_t *name,
+						   efi_guid_t *guid)
+{
+	int ret;
+	u32 out_errno;
+	efi_guid_t out_guid;
+	struct tee_param_ubuf in_var, out_var;
+
+	if (!name_size || !name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	if (*name_size == 0)
+		return EFI_INVALID_PARAMETER;
+
+	/* For 'in_var', 'name_size' is not necessarily size of 'name';
+	 * could be size of buffer where 'name' has been stored. TA expects a
+	 * NULL-terminated string in 'name' and ignores the size.
+	 * For 'out_var', 'name_size' is size of buffer pointed by 'name'.
+	 */
+	in_var = (struct tee_param_ubuf){ .addr = name, *name_size };
+	out_var = (struct tee_param_ubuf){ .addr = name, *name_size };
+
+	ret = qcuefi_get_next_variable(in_var, guid, &out_var, &out_guid,
+				       &out_errno);
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno)
+		*guid = out_guid;
+
+	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT)
+		*name_size = out_var.size;
+
+	/* On SUCCESS, 'name' stores the next variable name. */
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_query_variable_info(u32 attributes,
+				      u64 *maximum_variable_storage_size,
+				      u64 *remaining_variable_storage_size,
+				      u64 *maximum_variable_size, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+
+	struct {
+		u64 max_var_storage_size;
+		u64 remaining_var_storage_size;
+		u64 maximum_var_size;
+		u32 errno;
+	} out_cong = { 0 };
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*maximum_variable_storage_size = out_cong.max_var_storage_size;
+	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
+	*maximum_variable_size = out_cong.maximum_var_size;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
+						     u64 *remaining_space,
+						     u64 *max_variable_size)
+{
+	int ret;
+	u32 out_errno;
+	u64 maximum_variable_storage_size;
+	u64 remaining_variable_storage_size;
+	u64 maximum_variable_size;
+
+	if (!storage_space || !remaining_space || !max_variable_size)
+		return EFI_INVALID_PARAMETER;
+
+	ret = qcuefi_query_variable_info(attr,
+					 &maximum_variable_storage_size,
+					 &remaining_variable_storage_size,
+					 &maximum_variable_size,
+					 &out_errno);
+
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno) {
+		*storage_space = maximum_variable_storage_size;
+		*remaining_space = remaining_variable_storage_size;
+		*max_variable_size = maximum_variable_size;
+	}
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+/**
+ * qcomtee_release_object() - Release an object returned by QTEE.
+ *
+ * Each object returned by QTEE repesents a secure service exposed to the
+ * client. Whenever an secure service is opened, QTEE may allocate resources
+ * on the client's behalf. Therefore, once the client is done accessing the
+ * secure service, the object representing it should be explicitly released
+ * so that QTEE can release the associated resources as well.
+ *
+ * @ctx: TEE context.
+ * @object: The object to release.
+ */
+static void qcomtee_release_object(struct tee_context *ctx,
+				   struct tee_param_objref object)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
+	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
+}
+
+/**
+ * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
+ * begin communication with the service.
+ * @ctx: TEE context.
+ * @client_env_obj: The client environment object returned earlier by QTEE.
+ * @uefisec_svc_obj: The UEFI Secure App service object.
+ *
+ * Returns 0 on success.
+ * Returns < 0 if client environment object invocation failed.
+ * Returns > 0 if client environment invocation was success but UEFI Secure App
+ * service object could not be returned for some other reason (represented by the
+ * returned value)
+ */
+static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
+				       struct tee_param_objref client_env_obj,
+				       struct tee_param_objref *uefisec_svc_obj)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = client_env_obj.id;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_OP_CLIENT_ENV_OPEN, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
+	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*uefisec_svc_obj = param[1].u.objref;
+	return ret;
+}
+
+/**
+ * qcomtee_get_client_env_obj() - Get a client environment object to begin
+ * object exchange with QTEE.
+ * @ctx: TEE context.
+ * @client_env_obj: The client environment object returned by QTEE.
+ *
+ * Returns 0 on success.
+ * Returns < 0 if root object invocation failed.
+ * Returns > 0 if root object invocation was success but client environment
+ * object could not be returned for some other reason (represented by the
+ * returned value)
+ */
+static int qcomtee_get_client_env_obj(struct tee_context *ctx,
+				      struct tee_param_objref *client_env_obj)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
+		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS, nparams);
+	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
+	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*client_env_obj = param[1].u.objref;
+	return ret;
+}
+
+static const struct efivar_operations qcom_efivar_ops = {
+	.get_variable = qcomtee_uefi_get_variable,
+	.set_variable = qcomtee_uefi_set_variable,
+	.get_next_variable = qcomtee_uefi_get_next_variable,
+	.query_variable_info = qcomtee_uefi_query_variable_info,
+};
+
+static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
+			     const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_QTEE);
+}
+
+static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
+{
+	int ret, err;
+	struct tee_param_objref client_env_obj;
+	struct tee_param_objref uefisec_svc_obj;
+
+	uefisec_app.dev = &tee_dev->dev;
+	/* Open context with QCOMTEE driver */
+	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
+						  NULL);
+	if (IS_ERR(uefisec_app.ctx))
+		return -ENODEV;
+
+	/* Obtain a reference to client_env object to begin object exchange
+	 * with QTEE
+	 */
+	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
+	if (ret) {
+		err = -EINVAL;
+		goto err_get_client_env;
+	}
+
+	/* Obtain a reference to the uefisec_svc object which provides access to
+	 * the EFI var storage.
+	 */
+	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
+					  &uefisec_svc_obj);
+	if (ret) {
+		err = -EINVAL;
+		goto err_get_uefisec_svc;
+	}
+	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
+
+	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
+	if (ret) {
+		err = ret;
+		goto err_efi_vars_reg;
+	}
+
+	/* We don't need to keep a reference to this object anymore, we only
+	 * needed it to obtain the uefisec_svc object.
+	 */
+	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
+	return 0;
+
+err_efi_vars_reg:
+	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
+err_get_uefisec_svc:
+	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
+err_get_client_env:
+	tee_client_close_context(uefisec_app.ctx);
+
+	return err;
+}
+
+static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
+{
+	efivars_unregister(&uefisec_app.efivars);
+	qcomtee_release_object(uefisec_app.ctx, uefisec_app.uefisec_svc_obj);
+	tee_client_close_context(uefisec_app.ctx);
+}
+
+static const struct tee_client_device_id qcomtee_uefisecapp_id_table[] = {
+	{UEFISECAPP_UUID},
+	{}
+};
+MODULE_DEVICE_TABLE(tee, qcomtee_uefisecapp_id_table);
+
+static struct tee_client_driver qcomtee_uefisecapp_driver = {
+	.id_table	= qcomtee_uefisecapp_id_table,
+	.probe		= qcomtee_uefisecapp_probe,
+	.remove		= qcomtee_uefisecapp_remove,
+	.driver		= {
+		.name		= "qcom-tee-uefisecapp",
+	},
+};
+
+module_tee_client_driver(qcomtee_uefisecapp_driver);
+
+MODULE_AUTHOR("Qualcomm");
+MODULE_DESCRIPTION("TEE client driver for Qualcomm TEE UEFI Secure App");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.h b/drivers/firmware/qcom/qcom_tee_uefisecapp.h
new file mode 100644
index 000000000000..a014c18cfed0
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_TEE_UEFISECAPP_H
+#define QCOM_TEE_UEFISECAPP_H
+
+#define QCOMTEE_OP_CLIENT_ENV_OPEN 0
+#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS 5
+
+/* Each service exposed by QTEE is identified by a 32-bit UID */
+#define QCOMTEE_UEFI_SEC_UID                 413
+
+/* Operations supported by the UEFI Sec App service */
+#define QCOMTEE_UEFI_SEC_OP_GET_VAR 0
+#define QCOMTEE_UEFI_SEC_OP_SET_VAR 1
+#define QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO 2
+#define QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME 3
+
+/* Error codes returned by the UEFI Sec App service */
+#define QCOMTEE_UEFI_SEC_SUCCESS 0
+#define QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER 10
+#define QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED 11
+#define QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED 12
+#define QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION 13
+#define QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR 14
+#define QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES 15
+#define QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED 16
+#define QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT 17
+#define QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND 18
+#define QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED 19
+
+/* Operations for objects are 32-bit. QCOMTEE transport uses the upper 16 bits. */
+#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
+#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
+
+/**
+ * struct qcomtee_uefisec_app - An instance of UEFI Secure Application.
+ * @dev: TEE client device on the TEE bus which represents uefisecapp.
+ * @ctx: The context opened with the TEE subsystem by the uefisecapp client.
+ * @uefisec_svc_obj: A TEE object representing the uefisecapp service.
+ * @efivars: EFI variables registered with the EFI subsystem.
+ */
+struct qcomtee_uefisec_app {
+	struct device *dev;
+	struct tee_context *ctx;
+	struct tee_param_objref uefisec_svc_obj;
+	struct efivars efivars;
+};
+
+#define UEFISECAPP_UUID \
+	UUID_INIT(0x01f95dcd, 0x2d7e, 0x58be, \
+		  0xa1, 0x43, 0x81, 0x32, 0xa1, 0x72, 0xdb, 0x7d)
+
+/* Short-hands for these long attribute names */
+#define UBUF_INPUT     TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT
+#define UBUF_OUTPUT    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT
+#define OBJREF_INPUT   TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT
+#define OBJREF_OUTPUT  TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT
+
+/* Init instance of 'struct tee_param_objref'. */
+#define SET_TEE_PARAM_OBJREF(param, attri, obj_id, obj_flag) do { \
+		(param).attr = (attri); \
+		(param).u.objref.id = (obj_id); \
+		(param).u.objref.flags = (obj_flag); \
+	} while (0)
+
+/* Init instance of 'struct tee_param_ubuf'. */
+#define SET_TEE_PARAM_UBUF(param, attri, ubuff) do { \
+		(param).attr = (attri); \
+		(param).u.ubuf = (ubuff);  \
+	} while (0)
+
+#define TEE_PARAM_UBUF(x) ((struct tee_param_ubuf){ .addr = &(x), sizeof(x) })
+
+#define SET_INVOKE_ARG(arg, object_id, opp, nparam) do { \
+		(arg).id = (object_id); \
+		(arg).op = (opp); \
+		(arg).num_params = (nparam); \
+	} while (0)
+
+static inline efi_status_t uefisecapp_err_to_efi_status(u32 err)
+{
+	switch (err) {
+	case QCOMTEE_UEFI_SEC_SUCCESS:
+		return EFI_SUCCESS;
+
+	case QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER:
+		return EFI_INVALID_PARAMETER;
+
+	case QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED:
+		return EFI_UNSUPPORTED;
+
+	case QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED:
+		return EFI_WRITE_PROTECTED;
+
+	case QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION:
+		return EFI_SECURITY_VIOLATION;
+
+	case QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR:
+		return EFI_DEVICE_ERROR;
+
+	case QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES:
+		return EFI_OUT_OF_RESOURCES;
+
+	case QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT:
+		return EFI_BUFFER_TOO_SMALL;
+
+	case QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND:
+		return EFI_NOT_FOUND;
+
+	/* No matching on EFI_* list. */
+	case QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED: /* EFI_ALREADY_STARTED.  */
+	case QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED: /* EFI_VOLUME_CORRUPTED. */
+	default:
+		return EFI_DEVICE_ERROR;
+	}
+}
+#endif /* QCOM_TEE_UEFISECAPP_H */

-- 
2.34.1


