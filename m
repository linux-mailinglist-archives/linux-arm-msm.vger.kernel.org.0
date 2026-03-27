Return-Path: <linux-arm-msm+bounces-100496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKfjOjQTx2lUSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:31:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4534C4A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3A113004F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380FF376BF2;
	Fri, 27 Mar 2026 23:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNmb5xvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dig+jQ1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDFD2C11D7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654128; cv=none; b=eKMz5F3krFiHyrT0po2NrN19Z7JMYgSc22Az43CPghenBjo6lacwg5YiO9A9gRrjvn4X/9JdEMgzj6s0dvFaEElvHRsoomOQXKMrBzw0Ka7c2dIQEwq4PtrwVm9X4QFrqYM7lagrGMtYZ7uJyXohSQEtSZzbYBLPV61Jm1MrrrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654128; c=relaxed/simple;
	bh=3MLAIq+HiE/22OmCF0hxluJv1C7cQ32vE816B4yopFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMw1SdkY8J0qcXYVTk6oJ9pPgwJ+vOMeN9LgmCMwIagMvXwk8xlcX8PXREPScMg0pZ5M4fFuzVwfy/go5K03ePXJ2Ku62lL6I6ic8hmuMV+x47ffbNZzfe0LQCyBkfF6NS/ire6hL2dr1tiIMk2aHQWUpqOP4kQ4oGD5qMU4U+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNmb5xvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dig+jQ1U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3pQr102153
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TX+Lzt/onrG+YcysqeRqF3
	L7a3SVYiID09xWZ8DQeX4=; b=MNmb5xvUAcqaFaoX6lPGWNMAq+ZZ6xAoCho3Ip
	HwRVslqrg5GOMa3K0oMxkBu8mMqCfAM/AlvB/FRpPlh6z8rm0HbUTpNHpSrAcrDV
	vvjM6+KvYe77SS2lLdzmCovRMGH7JSRePWYyfzPX0SsyUD7YM5O3K0BOVFGtXKhU
	sLnH7QRSUshdwOwcT+QuycNfIQ+5yljYNDkFMgFbfG014Xmqw5iOM0RE9RLCfZWI
	YKemaCFKBcWRGIywaSGwsxcCpR9JDcs8njngt7sgoXZ9jDbjVCnGX7PjWV7KL2I2
	M+eNU4/hQ/mQb06XQJneVpsgyqTYa6Ht/sSiihQmR7i4bsaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn1387k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so63308711cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654125; x=1775258925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TX+Lzt/onrG+YcysqeRqF3L7a3SVYiID09xWZ8DQeX4=;
        b=Dig+jQ1UZNhakMUK2JPXlhGgRdGqtiTgXgyqdKlCHWIautJWJ+vyD7oVUIk7x20JIz
         x4TgoEIHGcfaXQAdQoLHhldKuSrxBCGIZLxM942xkTmDL6iAwoyeQumqhfYFBfiIHXzP
         AUkXNHStqvicZjEXvXukYvjBqxMH7bewq38W6jqo7ThsQNOxehDO6Yq6P0M1h8yUOfZw
         oYsqAFbW91jOyZJJgO5HzDFKD06GhBTsh6Ext9s+5+SGywAZLCrzZ/FSTqXlf9koyzYc
         NnoRRxt+1ck6BBO3pbKutMUth+xeFcNQ3qImz5jUeLqPvRuLnaNh8GSn119drtZx/cpD
         benA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654125; x=1775258925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX+Lzt/onrG+YcysqeRqF3L7a3SVYiID09xWZ8DQeX4=;
        b=p2q0zbwxjPEvfSFu4bmp3c+zukD+HHXCJfqJGNE3UcojQ8qDhOBvOxPYAHq3od+Tpp
         j/p7sBTqbAqQbkrM4a9a8jRr456m5a8LEnWgF70zOheStTX2YQ8aPszjywwFBqUdk1+v
         JMFIyI9INYMCr2WZSqMQS+tAth2uhtSC8ThzTax5W7JxZ4xpaydXMRqi0KPsIZNoGm8u
         lD01fjj7lNUcs4WnfX0uVcnqNsT/nhuE0vjMt+Z5TqcyIJpevZ+yPXDXBmLzUkYzzhJE
         pc5zlcL+73VLKazEZW42PmWf6dfgba40n7N2pWeyMa0LlesCVtDLCsQdk7C6ICbyKebc
         tcvg==
X-Forwarded-Encrypted: i=1; AJvYcCV/1PZ8kX1DcaHc31SfGVyphRVNOpw2XSr4VzrqA+auXnOKIG9iZ3NYpUPnw2Fo/ZQmF8di8y5eZKB7y6kl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkocF56roDKFx6GXYuqZl0kx+BZMPbapKRY/MCiNgOS/wBc2g
	CSrcfu7vkfo6M0YyJHfWCpZ5yfRpJ02XJsM9xrAguMH1N4pLzJCgAxrsdDaAw+PjbwHvRPxbU87
	iTjbd3r6XDJH3lGusOcRHvAglKPoUEb4XprILJDmo5oYrk1NyzCWssFi1AjjG/hXXhoWx
X-Gm-Gg: ATEYQzzjaN/sLptxrvb1FcRvsHjJC9SXdoPuSnigklfU3OIA7CfaqmpP9Mw4GLcH3FD
	l5NLywBSQo0l1161uXuK5jFRX3NUbQdbE8E7jaA0VVt53QiKVZObMFivF/UMQA25Ruv4d9V5gQY
	zjH/yFcONhnyOmdv/zRzcz5YkOQCyjliq51KxP4bLx3PwGw23/0VCMicHi3ngUqOnnClx7eeZkz
	DbachfuLUq1Oc8zmVri6h1FqueGJEz+je6XCDY8MEXHJSimZwDRaXfj80WCUuWstTvGprNr5prI
	7w5ItyX4cBeGr/dHSaxexvOU2Yi6BOYcuHXeLFWoa248xpt/LfHmhZMA//hWjObiA91N4yvjEsO
	lU0rr3UCDTscVp4BVJPaVdUShynKUXKToFTPAWYPVbld87b8e5v3Qcmce/gLGslczOYG4x3EFn8
	LHI9VNUD/L8NqDAJ8cqgNh0XMvoWrgwKqfLvM=
X-Received: by 2002:ac8:5d0b:0:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50ba38f12ebmr60178661cf.37.1774654124634;
        Fri, 27 Mar 2026 16:28:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0b:0:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50ba38f12ebmr60178431cf.37.1774654124132;
        Fri, 27 Mar 2026 16:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v10 00/11] media: qcom: iris: rework platform data handling
Date: Sat, 28 Mar 2026 01:28:35 +0200
Message-Id: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQSx2kC/4XQ3WrjMBAF4FcJuq5aSTP689W+x9ILSZY2gjhOL
 cdtKXn3yk6hhrXJjWAE5xvmfJEShxwLaQ5fZIhTLrk/14GzpwMJR3f+F2lu6wcRTCgmhKZ5yIV
 eTm5M/dDR1o2OBhkMiwZb7jSpwcsQU/5Y1L+v93mIb9eKj/dP4l2JNPRdl8fmcI4f40vnyhgHs
 l7bHJalHPh96RTP10KrTEtnhGQ0WTBR2KjR6maS/4cl59z+5BYinfKFlvc8hiNtpXWQfFAO/Wa
 6rubsnrv690CZSgqD98BdbCYk82nHXMZ++Fz6m/hy209TZqupiVNGgwgSJNhk0fzpS3l+u7rTX
 MZzfRZ1Eo8lUSUXEgPlIBgMOxL8SsD5pgRVSnWPNAFbjO2OhGsJNiWsEkcrdJvQMrUnyceSnCX
 D0KBLWK0dST2W1CxpBd4b0KkVO5JeS2pT0nNPQdvEGCTJ9xo3a8luSqZKUjorlYo+qb3r7EoSb
 FOyVQIL1iqdUMut62632zdvED555wMAAA==
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8300;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3MLAIq+HiE/22OmCF0hxluJv1C7cQ32vE816B4yopFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKn63+Rpb/O/P8Hy88ScuuzXPNOsqoKvcZnp
 z5NsyR7+gCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSpwAKCRCLPIo+Aiko
 1Xj1B/9UUNkePq17BT33fXCh3g0zdHp8MN5SUdZl6u+ItFazuUZGXOX32mHknOsApiYy04srh0+
 GNfwX6ekbacIq0e0cve3fYjrQwJMnIFvleK5iXgvtQ6EVk/2Kd4AJVDwF6U9DKR5dgLoKc05AEH
 0Hfz4kavR3XAqKtH0ASug4veTN4Fm4CdWrY7XKozqC0UlxMRktZV19/9igMm/rlYBoG22qSgWUy
 p6qgxdCCPh0sn0oj9BDDIycnHJarj+yGKwbWWDmuOhZ0bT/JRh7gFct947NPHJsSHwViece7cbi
 7j08PWgdBckmppWcD97FcIgWszqq5YGZxofP6n67P7U2FIZj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfXwZQrfKWONBQi
 7+5zE5WfBE2Zxc10EKNv1nd8uPI36SYeL09Vtr4fZ1rDJYabpOw25uZFVGArZ9dscummgwMoqLq
 1YWFz7Tm+9pMV3z+83j+i4BtDBVwockcgj9oQhUAX+vJEsqW1Q9KbBtxmw0cJSKbv01DeTI6c1v
 dnOYCXFoxGeBMwPH1QY/l2DYXb4uw8o64G8hNkFCzn17VkXEjCIXIabNZM0XyXyiqOWQ4MUFQ00
 wQKBqbliAA4ymrz3gjCHivjPkCAm5qZGGcR1B8jVMBAAokODbE9xndtHfwn5Sb3FgUklXtbCkNv
 gUqWXC9FRO6Vdc9iHIbSMM3DNJFwA1z5UeTRmcMIHENlIBqnRCSkyO5tyT1Foq+KHuOQxBbaaoU
 J+3WYZ9VAG2bZc+0HvPo5wQMWtAS8Eiz0gkWJwTp/eJNzt9zQNw/BY2EgbSn3FAR2IfzkXZPZ4p
 8eHI7ZTMJnZU2wfuJYw==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c712ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HAAJ_PAJ5jvC-A5sbgwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: P6CU21AAv1OIQXbn3YjlyuyjsifCXLut
X-Proofpoint-GUID: P6CU21AAv1OIQXbn3YjlyuyjsifCXLut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100496-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53F4534C4A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v10:
- Rebase on linux-next and fix dependencies version to the latest
  revision
- No source-level changes
- Link to v9: https://lore.kernel.org/r/20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com

Changes in v9:
- Collected missing R-Bs from the previous iterations (sorry, Vikash)
- Link to v8: https://lore.kernel.org/r/20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com

Changes in v8:
- Moved core_arch to iris_firmware_data (Dikshita)
- Made HW_RESPONSE_TIMEOUT_VALUE static (Vikash)
- Changed firmware name for SM8250
- Extracted firmware description interface (Dikshita)
- Link to v7: https://lore.kernel.org/r/20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com

Changes in v7:
- Fixed build error
- Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com

Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: drop hw_response_timeout_val from platform data
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data
      media: qcom: iris: use new firmware name for SM8250
      media: qcom: iris: extract firmware description data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   3 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   9 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  13 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 413 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  95 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 132 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 219 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  11 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 31 files changed, 703 insertions(+), 828 deletions(-)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v5
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5

Best regards,
--  
With best wishes
Dmitry


