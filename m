Return-Path: <linux-arm-msm+bounces-119139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rmEREb4LV2pTEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:25:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1775A734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BchjMjTv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YoL6ZzV0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D78330437BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2665399892;
	Wed, 15 Jul 2026 04:25:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396D355803
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784089525; cv=none; b=J78oEs9CbQXYgiBhDk0xGLVBmBa/74zASd7VgE1hyXlao4s3j5MZIdyVgMIWmK5zRv4XdRJLE3XQSrgsPGRdzRmh9fX+aVKVG+th53LvcFmEyYb5s0uuZZA3jQAjYI5pCKiAskSYGvTSyw7z74MX4pCR5RLipMqUlUEuB+YpFiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784089525; c=relaxed/simple;
	bh=DK2lOKmkmWR2CQud66y0FWcRMt7euIuPOROOhOmh7Vc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QPeZ+KBveFMwaGSWTyN2gnUjBj3EbgOUKyyzQKRDEOIAUpcEsLiFgVK6m6BflH2AU+8u/B2YimzTtKhWEW6M42y9AOO+UgN8yBZYWRce/hnrAACHy1p2oXuKBVJgQChiW/dx0qfcexZp7SN9gYekbhEwcoUF88p93HzApC5zv5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BchjMjTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoL6ZzV0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3mC552530075
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tRaNZNMXJf/14vw29Ycozr
	FMxfr+Nd1FrDA0PxR+bh8=; b=BchjMjTvWkueAjvljgfJsa6oQ5dqmsp6702ak9
	iR5SvcxwgiV1GapHnPMxFte/vIR6Q8Tf7fGV4VLLdEDxgQ1zanZe3VZViSlxFnAe
	zTn/xn1uU3TDEnMKtjun4WH1zjJmV3jWErJAxrnYwvP9jiSVEkVCMV4c1v8JiZ5y
	bo0d71ji/6p6XiKBjuKGZaSx8A1rhtOTTUCPXlarJJzl1k2+7DrEuuFv8olJ13Na
	inpKjmmlIKe/QDFw6OqwHzNVSR6UpIV/5YIazLpPN5b9yerKnyfUKYdbBwQWQ+dL
	L0U+FdQwO5y6f3EhGZyKByQVy29nEGWuqnkjQncoUmekzxIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr2xp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so343881a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 21:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784089522; x=1784694322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tRaNZNMXJf/14vw29YcozrFMxfr+Nd1FrDA0PxR+bh8=;
        b=YoL6ZzV0hnLlcWTaLlYRiAVn/FrIaAZNp62xxTUsbaoTKaYmAp5gfn2vet8ZIu73Q0
         CFdllw3HsKaeqsLwn9u0v2s+tibIwSwklah1pA3W4Y/0HLdX3ueqH8ejv7X+oeHvMkMA
         InWguDVbS2/2sRaO5lXwZ7xfJXChhahoTdxNjCdBCQIClEBI71q5O3f9EYTbu2LzHVSu
         OcnXbrL/hiKfHuJiB9vfszIoWCvuRN8DHu5issiortLiNx7ia40Oxxg+LaoKhDKpihZy
         EyU84rkdA7snCTvaG+KiOWIqAKycG3WmZuXhILIvGMV4pPI6Z2eT85gikfQHsepp4DvD
         H7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784089522; x=1784694322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tRaNZNMXJf/14vw29YcozrFMxfr+Nd1FrDA0PxR+bh8=;
        b=kJPc7RRwSD/9146LhtHmWkL0W1HuULt9mC5Eum2TlWuZDj0aXnlT86iM1JN1qpvlPG
         98t7OCR+mx3NZmLdv3g5hWseIr5A6oiPAAZwpcFjyy+ZQqR20G0g6N49xxAjYTd/B8sP
         neYBiiPIOHzZx4tUXdqHhnacivpVwLmbd8xCaHfIyf5X+ol4l6Ncg0F1Ed26d7csmK2W
         VWcE6bB1kp08HK2qDAMewIMpmBIC27mPM2QjNWpei0NST+zMcx6X1qVTFH+Nyb9FlbO0
         dR4T707+YS64+AQ3NIqt4aOBL6fzkt34aZqefoVUOvFcalDamG2CX+VOkxQn/GQ4eozR
         C6Ew==
X-Gm-Message-State: AOJu0YyvGZUMAwSxj4fViw0QlNhv1E/kkiU2US/gOXexWjU4gf/Yu2CR
	xRNgXs+SQXTlTpusGJVvpPHfl6NYWvmFDvtGHAOAktg5kh5zfh211xbFJ8aUM6PWcnZzbNyufxN
	Vb6iKn0wCK3EZggTRbS/z/2U5c7b3YkJUeX25W7cFbpFz+RU3irMr34HLeBZhO/TZwYoS
X-Gm-Gg: AfdE7cmiZl24Ka/hC2CcKWGyUv7Rl3NMktOnoGCs2vmYzkBECvC9g/cscCDduPnJ/g5
	5akBBqO9qui9D4/lKEgrhEBk3yBUewD5WIol/lroMMyYE1yIXre9dd0LbBgsZMUR9sc0Or4eM6e
	sv0NFbDnjQSj89BLZ7KCnkOmxynF8VPkxrNHZAf12VGYOd1xZihDBdbozwpS4FC75oZiqaxVlj7
	Vk6nXQmJ0HgJgnFXuPvoLRsgS5PaGfNpSZR+D95SHWcpEZ+BPr2APYCIAKly4//PxAe0ssRaykz
	zo0sIBvnDJZFfSRT9VgyhhpHpc7EDpkGC1s6GbzoQ2wgih2tPBWT4MgzrtUtAPuB0xhfaxwt0Kp
	BxokbwXCAMoKcb11RMLSJQuL6Zkv3z88fsXmSntpkpxuI
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr20723217a91.12.1784089521975;
        Tue, 14 Jul 2026 21:25:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr20723197a91.12.1784089521431;
        Tue, 14 Jul 2026 21:25:21 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm62395491eec.24.2026.07.14.21.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 21:25:21 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] serial: qcom_geni: Quiesce UART transfers during panic
 and shutdown
Date: Wed, 15 Jul 2026 09:55:13 +0530
Message-Id: <20260715-add_shutdown_and_panic_notifier_serial-v1-0-23e3787c7109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkLV2oC/yXNQQrCMBBA0auUWVtII0bwKiJhnEzsiExKklah9
 O6muvyb91conIULXLoVMi9SJGmL4dABjagP7iW0BmusM+fh1GMIvoxzDemtHjX4CVXIa6oShbP
 fPXz11jlHZJGOJkLDpsxRPr/R9fbvMt+fTHXXYdu+w3zMwIoAAAA=
X-Change-ID: 20260715-add_shutdown_and_panic_notifier_serial-2666cc2ac30f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784089517; l=1500;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=DK2lOKmkmWR2CQud66y0FWcRMt7euIuPOROOhOmh7Vc=;
 b=xcx2mXat0Tb9oV1CpimXOPHklo9Nm9FAkAT2vVQ7y7on4zf2sOsM3b9zmyshJeSfl8byGKM0j
 VHdibhX2obaCKMs1pavKe8Gy4eKr8vwvAWdL2owbvAU16IRymsL7bfJ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfX1dq307OjUCdL
 T5dIkQBFVXhAut1X9D75/YSx3EPiJsB7ZXdYfrQ8rMnnB0SoQIEfqM8hDkh1biLv1nkeVC5LSqu
 2XL2HwTh4PL+wwGg8xIVgEHfQEKhMQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNiBTYWx0ZWRfX5Aah1KXg7sEd
 KcelcAPEXtsafTyGDcjlV5Wzyq7K+NMWLZyMJp7b64nAldGGOaNLHVibiqweiLFg9p3lBx58u8Z
 rO4ZrFabsattTQYuc5BxS5u0GrBehXAmZ8S1YInEhJGxvICNy5OAya8PEZ7MYyf4wCQxOKuLu2F
 yiWan/o7JVezRLViYZThl8CXB3LSozbYwHNL4nJs1gvdxXR5MonD+OLfQEqBUp/XpMzpms+1krt
 n3oXwy0tOwk61gmK8jSzQ7vD1Rqlnq97UpCn7XCrTAoCNSkMS9zGAZ82eb9dy+5ST9aItuAnq0K
 Z0hLj8XvRg/vDWPvBdlfV4qbzvSRKUxHEdftzy7tGBhsGKkMYoDTPoGNOOMzMsfebIzIEM36Mjj
 c+oqHw6BPFNad2NMJLEWLo5oJWCOwMJZU55wEAFCgiS80NvJyhQVd6jdZW7JeaUwKEf9kX4lDei
 GeLZcy+zHi8Y+WW97nQ==
X-Proofpoint-ORIG-GUID: mRqnvyoqS-6M9izt01X8k_jS_d8WgqOu
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a570bb3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gli0oG45nIT5P0-av28A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mRqnvyoqS-6M9izt01X8k_jS_d8WgqOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C1775A734

Active UART DMA transfers can persist beyond VM shutdown or panic
scenarios, allowing the DMA engine to continue accessing IOVAs that have
already been invalidated during memory teardown. On VM-based platforms,
this can result in SMMU context faults and leave the GENI Serial Engine
in an undefined state. In panic scenarios, pending transfers may also
interfere with reliable panic console output.

This series addresses these issues by ensuring ongoing UART TX/RX
activity is stopped during both shutdown and panic flows.

Patch 1 adds a shutdown callback to quiesce the hardware during reboot
or VM shutdown, bringing the UART hardware to an idle state before reset
and preventing SMMU faults caused by DMA accesses after VM teardown.

Patch 2 adds a panic notifier to stop TX/RX activity during kernel
panic, preventing further DMA transactions and ensuring panic console
handling is not impacted by stuck transfers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (2):
      serial: qcom_geni: Add shutdown callback to quiesce hardware on reboot
      serial: qcom_geni: Add panic notifier to stop UART on panic

 drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-add_shutdown_and_panic_notifier_serial-2666cc2ac30f

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


