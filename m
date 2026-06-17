Return-Path: <linux-arm-msm+bounces-113610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id keNuLgiAMmrH0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D3698D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xqm1LdYI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iACnzUjA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AC0330386C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83CE3803DB;
	Wed, 17 Jun 2026 11:07:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51039EF34
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694443; cv=none; b=Wz+8d+yiEIOX1et7S8JDR4Uy4mMxp/DEbXRGaPBBAaKquBAW7KqZuUffYyQd2g2fCj2OL2GgU2KqUJDz/eLGIy95NEaThALpL5D9GDdG3c7lINjL2yVB+D31jx2Yf1qYRWBoz2VL6YP6gVW7axuD6Kxdwrd3W6a+taefKvpnEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694443; c=relaxed/simple;
	bh=aFCdiu3lE6iqtTzW/LxyPmgEKxVN6MpjkNd0DWaLNzQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LY/lybSrtsALTtAgV9YqeookkR4/+knW3W+UxGsaP8738tsnViYByrFW7r9a23M1pDZ7kpxlx2cRkbOw9j8sjtu3tDp3sBskKU/vhh5wW3EBTGLiI8pIlhnOnKI6kY4bQ723ug2w0gNpy+7qfVDjK5YtQCfjZtKXycueNr+24KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xqm1LdYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iACnzUjA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V7KU2291401
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bg98soEYGpUVZzXvY9pSA3
	tZiVKsw4OWtI68S3Vo+F0=; b=Xqm1LdYIxD1WjlE53utRXeLaJL1a2U/Q5EHI3R
	SgZxfprwu7Pn9ZSfO32AyRUNvCGLA6RqmaMt1VOLnXgzxCgvazpDS9m8jHkLH0Yf
	ja7GYOg10dfbtcAiEGxnugUZYEaxu0jf79vhI3OP6Uf1BgRtusQEK9zMK+Rafddd
	7CmpxoVo5gFtJGsJhERR9ItG3LuVMU7MvFhswLcU5uBzNu2+izNfWIwayUDswk7t
	4JzjBoZmBfjNxtVvUA65GLEcYH6ww0CSH0P1kMRvGyCoj7d2qSzxmD+1S4StkCwP
	276TqmmW+VqFHs6snwhWLoCsQniyEvejmiZeHxfYdNNvsk7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjurx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b74447so4558431a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694440; x=1782299240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg98soEYGpUVZzXvY9pSA3tZiVKsw4OWtI68S3Vo+F0=;
        b=iACnzUjAJBqi+MIXProiSGR91Yat4nZ9EiKqFb3CCdcyXOcDq665GQusPyKJyKPufi
         mp1Tjo+HiVtFu7IEjjR8anm11p0hAKBH9jtAWLA33kZ/z+9gT3Oiaf3CKROcgG8v1PcQ
         MPlu+U5pUqzP+BCcLDXSV+IJUW29WPojfRIASbT3AU8jdbKEu3XSq4wGkoFVyGWJIlmU
         ITnVj0JcLrFdXCBimWp+QNBYX/9eFfSX289/Gt6YfWGeLrhRn0RxI8mHycDbPAGwS9V9
         hKvY5y6RLLEZL5aU/NPK/pbXAXG7TN9shgg0TEJYsMyTs/kGJXMHuwLoMRPMGeZy4htP
         hCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694440; x=1782299240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg98soEYGpUVZzXvY9pSA3tZiVKsw4OWtI68S3Vo+F0=;
        b=kses8ojzais6cxFzyjCkKrjc2ULU3SuBPi8J59n0TEV22lUlFeFfs9C4hxPUStymgU
         dcwbEZszJ1a7Sz+fxhhwA5jNhhs/XQHMVAV0E11EwbQOnVb9/k6o7dv8etNffr5gw2hi
         RX3ENezsO+QSE82U+n8eOhGaHakgt9+BhmPwUIf7vJLTO+Xc9jJnmTrC3IpGkpiV+kZa
         ewPFJBf4gsr5VAWdloQRIL3G/uupQAYTEwATPHEh338EolsNBrorZ88Rac5DT4LvsmrM
         0lO/pAbWkXUz9qxb1bddUTkWQJ3+zamsbU8djrdmKe/wwWtO0XFJ8vWb7IIGUmNL89nZ
         ltdw==
X-Gm-Message-State: AOJu0YxnTU0WA+SF4hFgkzBAT4F6jbqehhkpc7zpZ1kJLcWU16JCD8Wk
	jX8A8mbGo5dbZEMv4qRzblw6CAxBpEe3V676lVrlwrahxhU0NGgCrNMDDmXJj0wRieFC64DsWex
	RKUwCw6+r6ZzG3S+pNasDYgJm8tDZcm0sbtKwy6N1tKmrxpMki4VSIvToTKJmDL/LDCoZ
X-Gm-Gg: AfdE7cnJSdwQu7hkJvRNfUgCNC1n6lEk76JUy3yVaLpcOuvhY6uTzRIYiGfCo5FkM+y
	HqwjN9ytrtrPhhNQ7CvY8DJ8DHq7CHmldw4PDldgeEWaiYwx5siJTbI6CyXuAhNbj+5ny66OTrx
	Im4URORON5KGmeg6dRxPKgw7B+cPcj+J0d3mQYKBd8CoN1hbEX6oJJA0iLu2kN3zO4hqK6cNs9e
	OTl8L+gt5O4NEpkBwa34zS91bHubeACWR/NVIgihtHpytZdhrLAG7rt+rlbcZAM3tdzz5RO9sSE
	orkSoEGkYN/1d7TQ0I1hGo+LGPo7UfFVzeP1LoM9Ru63988gaL5tlBgKYZZ8RnqRyTBX1BeFg4x
	p8r+NhaTDfio7qyb91DCoc+4Xt3q5nJwJtsXQJ1GG9HkiCNNOrScc54sh45ciGLYrYRpzq8+zB5
	0eoRCn4A==
X-Received: by 2002:a17:90b:2e0b:b0:369:971:4888 with SMTP id 98e67ed59e1d1-37c9366b933mr3395036a91.15.1781694440257;
        Wed, 17 Jun 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:369:971:4888 with SMTP id 98e67ed59e1d1-37c9366b933mr3395013a91.15.1781694439776;
        Wed, 17 Jun 2026 04:07:19 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm5577639a91.12.2026.06.17.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:19 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/2] rpmsg: glink: smem: robustness and debuggability
 fixes
Date: Wed, 17 Jun 2026 19:07:12 +0800
Message-Id: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOB/MmoC/22Nyw6CMBREf4V0bUkfpkZX/odhgeUWrrEUeqHRE
 P7dgnHnZpKTzMxZGEFEIHYpFhYhIWHoM6hDwWxX9y1wbDIzJZQRRkgeB08tRz/EkMBDPxE3R10
 bkFo7Y1geDhEcvvbTW/Vlmu8PsNP2tDU6pCnE925Ncuv9BPqfIEkueGOdVQoac3anayAqx7l+2
 uB9mYNV67p+AEy/8JfNAAAA
X-Change-ID: 20260601-rpmsg-improvements-643a6e133f66
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781694436; l=1910;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=aFCdiu3lE6iqtTzW/LxyPmgEKxVN6MpjkNd0DWaLNzQ=;
 b=mSx7kXRauC9GCN+NXuDAlCe0wsy8OHvjSkdn3zXVhplASnSJiMHoq+9oFdnph7/8mNvrNsqku
 huW1inFogmvAsb7XFSp1LeGA0fj3aeuvOKNg7avayiMnez33x6OmUjY
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX3JE8ppjp156b
 z11jBZH7G+ikDJlGqH+9UJ5z4ahL8FvQiNCebDkuZRNjDrMRvVNTa5GwDtJlkN4Qqx6ukfNaOyI
 Kpm9eaJ43l2FFVhwFZrwUFvKEifSgaa2nlMJ5U1QeIoUF7A33U3PCY5BVJQXRsze3RponJXrXEf
 TMmZ24WXpDQdYfaXZDiQu0JXaz/XD2PJ5/UtAPV+5Iw7K5u3zcjHnUM14E5GpOnggGwlIFnPAVZ
 QgzbcZkISIwYzMG70tAPdM9gNK+Vf1tZK/HOPEW1fdEIqmmBP1+xeukVMuM1tGteNyXaWSLWgiG
 Roo3Snjvx2qK08s7K+7C+4nfFBcM317O4eXO88xzOpW1oVPYhhMUjyROuBZevRNE1FmA8+DiQhn
 /DcrWbRUfBZGX6L2/kqPsW63c7sLgh0+NYU2rsd7In2zTJdMYr46Ja82rlQNOV4Gd+2BfEzhiLn
 NqSZSqLd9Kc8EXKA3sQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a327fe9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4AVfmZjCmJ7tvFRkCBYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uPoTRwM1jBVmxml373mGkQhwGzp4nB-c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX8QXLb65g+mIh
 yumEBsWf46Fj9nlklLSJyDKO5sfI3uOD44LpU7fqXcn2oob8XpJAVfkMmWMzzNVseK/fTrSVaQj
 fxJZKk1+2E7i3jNS7OetjP3cL58G1VA=
X-Proofpoint-ORIG-GUID: uPoTRwM1jBVmxml373mGkQhwGzp4nB-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113610-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E5D3698D0D

This series makes two small improvements to the SMEM GLINK transport:

1. Add WARN_ON_ONCE checks in the FIFO read/write helpers to catch
   and report broken index invariants early, rather than proceeding
   with an out-of-bounds offset into the FIFO.

2. Pass dev_name(&smem->dev) as the IRQ name instead of the static
   string "glink-smem".  On platforms with multiple remoteprocs each
   SMEM GLINK instance registers its own IRQ, and the unique device
   name makes each entry in /proc/interrupts identifiable without
   adding a new struct field.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
Changes in v2:
- Drop the modulo patch ("rpmsg: glink: smem: Use modulo for FIFO
  tail wrap-around in rx_advance"); per review, it papers over an
  unreachable scenario without restoring a valid protocol state.
  Proper RX-side validation of chunk_size against rx_pipe->length
  will be sent as a separate patch.
- "rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants":
  - Drop the trailing comma after "skipped" in the commit message
    body (per review).
  - Add Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem
    based transport") and Cc: stable@vger.kernel.org (per review).
- Carry Dmitry's Reviewed-by on "rpmsg: glink: smem: Use device
  name as IRQ name" (no code changes since v1).
- Link to v1: https://patch.msgid.link/20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com

---
Chunkai Deng (2):
      rpmsg: glink: smem: Use device name as IRQ name
      rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants

 drivers/rpmsg/qcom_glink_smem.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-rpmsg-improvements-643a6e133f66

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


