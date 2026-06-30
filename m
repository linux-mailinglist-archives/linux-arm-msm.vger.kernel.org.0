Return-Path: <linux-arm-msm+bounces-115430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGREGEe9Q2q8gAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:57:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A987C6E4836
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OVN44Zzd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D4vcmCbr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7206E301CF83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A71411673;
	Tue, 30 Jun 2026 12:55:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D440DFC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824116; cv=none; b=M64lUgC4yysqPR7bryxE31HwUwmg/mnirN6e9m6tX+w7J3kkLOEICyQHxTnUSiJFaMIKI6DVxWE4a5QVpe7jHDGiQTILyS+4cilWOnD9kzWTWruKMeXj/ezC7I9pw21o+Co2khQBSTvshhRwLcnZ/zXrkfFSEXYXiaX0R54VbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824116; c=relaxed/simple;
	bh=KE//3/J/0SSEnt2Z1g1c3lwvkYL06T9JaWQKa/u0Ujo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CqjTrPwb5Z0LwghM5lVInnAky9fxW8MNzemvcqjTWKLzq8iqfNrRz+pdhIleTSOBVYcQMd+fzTaVAL6aDi+QLDdobfgvElz8zyC8NiMagwdLW/XnObN5Nfsf9scvBpZKIJ9oSp9EntNPd3fYae1GAeMmSlBkhOlzWnX5b/rV7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVN44Zzd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4vcmCbr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mwGr1605085
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yJXjIp2YyPR1vNDzisZ+2k
	dZAWdbgTUUFIP/Dg1DaN0=; b=OVN44ZzdhBNpxOKjZPs7RnNo9quqSIn0iQG3U3
	TGtlwEUGGvvYzOwnFmP5bFnCSzHco9bT77GcBLmgSxm+BgzYVvobbPT+qtgOIzmS
	nhpjK0zNLSEXYgTmPpFv/9/QO6qgQHdGndVBSXaSp+F2O2N89qH7a0nHElVVveHX
	ZZ3b0Rqlnl/mG38RUxeEo+Owd0+FpEKjpF4/VTOB9q6fIxWQbod9uvOEnbHIrE6y
	awVR1whfrghY8ks89u3XHw00UZxwhIyE3T3f4z1P/cC0lQ6vzxiB2nJn418PbGD4
	kmdRza97t14WLsGh5ClGHE1ekBhRbxpSYw/RCuImZEs9x4hQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjr2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ed53abff8so2029339eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824114; x=1783428914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yJXjIp2YyPR1vNDzisZ+2kdZAWdbgTUUFIP/Dg1DaN0=;
        b=D4vcmCbrqUUm1+UE7i8LCOBbOQ1kDkQlyaBCoUMBgx2TAPr6m+fjAJXOIrSsc1GJsA
         M4r+0XfsGP+Fc8p49Ev9Tsnxs9skyW+0xcs+jc6DIu75Vk+JUPkKDHLENQd8AYn5PHlT
         k4N4OyYNsfFaNAmoeHWzH1edbrab4NyiWP4LHIcx+0o0YJEI4u1KotJgSDfhLp45vt1l
         0ITuufC7FZ1Fx5nJaAPstN3Q9g4B6/iFzi1wPhTdL7sOx8G7KaMcjYOJ8fq6wiJNP4ax
         YLfYOUnd4+Cq7cTbOtN90t0+XJ0gbgz69IqT6kMciLvY7F23gi5jFtsn+omR2rIyelMi
         AebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824114; x=1783428914;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yJXjIp2YyPR1vNDzisZ+2kdZAWdbgTUUFIP/Dg1DaN0=;
        b=YcHMBstoRppmH5+BL6G3c4bFmGK2PBSNA+TeN4hr3Ni6eQa6zHHr7th3vmMKYRYYZ7
         ULGKUR4dZvv6a/3dIJIaN48y0O3BL2ZkWWZ32DJ4xmw1gGPVOi/wCpaTE+YVv0v1BKOs
         yg+hHTWio5waY696lN2Efz1PRePSgPPDbVYV5Gvyk6+Hstg1uux+DPkIq/CQ1ag3vKFY
         nsTYD612DZFc3UfQbVfnvP0lWQX9SOzcCjnJH/34APP+H7pEnhMmctiHU79m+H3nJEUh
         LsMZUKJK3PgH3JeKEkLZAmogfDgimCgHoztmqySo0WDDw77G/tGwIsu3fvf4PHjh7LQ7
         rAaA==
X-Gm-Message-State: AOJu0YxrIqCmqTWvTTfcyWmRUFcGsL/yt/LHZ9plOPkFd6CzWQyjcRnz
	UT0rMOtPm7JVyjsoibu1ljbS/2veNeL0yO2aE6s1/CRY5WhNd1RxdUyPoMsRs90GGLLvlyt/LW4
	zTdrNsyUuRCCaIpLTzUYiNy1LgqbTFYr7WwPcmaKv1X/LlRl5Q769Q3RT9A2oOIhYh/Xo
X-Gm-Gg: AfdE7cmyefbV5Yn0cdDL5R9Eanxjdoj5RI0dc3lKUGuhR22hno3qWXwD3DH7Hsvym2N
	aHc2Qd59bkhCVyQbPC4uoXOCgmi9K5Ux5GWgxV8nOISX4GEk6+WcQmtJ8E9BqC4YQnsfVuAdKHA
	f1ux4/fqxzxadG4dMSmbcd9hr15cqSxbDyZxo0mKERaox6D1vwJhj/whdr6LHmUlbl9+Ukz8Lln
	hjvt1vaSqfbNioRi35+z2a40mQv2D3JGs+bdfpJI1WwZ3bq6UcGGRfq3/OK84zfxnhDVUlZ1n+U
	OxXLw2vPZBGUlgkFO3mXCsuQz15GzXqZLW5iLosolC7wxiq8XT3bHNFSE6azqFG5kjqsVL2RrzB
	0xhbPQfqioLOdxLfDZFRUflfTNJXSxZXRQV7RYOeuBegUXMA=
X-Received: by 2002:a05:7300:7c21:b0:304:5db8:da95 with SMTP id 5a478bee46e88-30ee146e225mr2711659eec.23.1782824114016;
        Tue, 30 Jun 2026 05:55:14 -0700 (PDT)
X-Received: by 2002:a05:7300:7c21:b0:304:5db8:da95 with SMTP id 5a478bee46e88-30ee146e225mr2711625eec.23.1782824113503;
        Tue, 30 Jun 2026 05:55:13 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm15936443eec.0.2026.06.30.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:55:13 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Google-Original-From: Faiyaz Mohammed <faiyazm.mohammed@oss.qualcomm.com>
Subject: [PATCH 0/2] EDAC/qcom, soc: qcom: llcc: Add Shikra LLCC config and
 skip pre-configured ECC IRQ setup
Date: Tue, 30 Jun 2026 18:25:08 +0530
Message-Id: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKy8Q2oC/yXMSQ5AQBBA0atIrXVSbVq4ilj0UCgSpAuRiLtrL
 N/i/wuEApNAnVwQ6GDhZY7QaQJuMHNPin00ZJhVWOWoZOApGEXeOGU1lgV6tGQ0xGIN1PH53Zr
 2t+x2JLe9C7jvB2EYECFvAAAA
X-Change-ID: 20260630-shikra-edac-b10540d0bea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: XBJMqYC8J_3cPc6uX3wLm_nYJ6Lp0Obl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXw+lmwBxRiDbA
 A7jOIW3hLkUh9yDh69Jt2IiT5a7iRPKcgrLuZNWAlv4oagnVWYKcGXKMsYsc3jlqK1L96WhN1gX
 uzTDE01irm1w+qzdXtBcHlf4UoMsgmfjERmgxhY1/YJ+XaYzb/9hyj9aZKnq+b+rSauDjlBzrct
 5tRsOcNCh+xBepwG/L9W7Ze0RQatljzeoq3+XxwZQ5d+mKlLJpWWdFwcMDhwuE/RuyTW4yM+Htv
 /sDD7upqPWx8R6Q8tj0ZhZ1Qgr+GQXM9yGYY5LhRqtreVnZi0TSYyWVkC8BXr/XK/zyFNdq+/LG
 YHXc5J1YzpGUS5zMmbF/Rb37pIQQumyznMQBLfGLQd57jWY7PswqZFfFPjtcajnyfqVPbi7OcJH
 I6l8KJ8WbM23esREqd04wNm/zQpz4Y6yb1ij1YKZvEsIGEDmMWo/owI4utV53GFabY0HIp20yWW
 yIMvEAwOo6AJeafSqAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXwz799CtzbZIS
 e4jeYf4XRQ8vGqCiWGD7NI/2d90bs22LJIqxlQtemuuzTxDH1WQaL79do9VM4tM+OYP/ArSIBOv
 UNCvWVtJhEv5i/H8s8SqDkxcxNINGuo=
X-Proofpoint-GUID: XBJMqYC8J_3cPc6uX3wLm_nYJ6Lp0Obl
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43bcb2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bpsdI0syZPZwNDrDi00A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115430-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:faiyaz.mohammed@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A987C6E4836

Add LLCC configuration data for the Shikra SoC, and skip ECC interrupt
setup in qcom_llcc_edac_probe() for Shikra since the DDR System Firmware
(DSF) pre-configures ECC interrupt routing before the kernel driver probes.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
Faiyaz Mohammed (1):
      EDAC/qcom: Skip ECC interrupt setup on Shikra, pre-configured by DSF

Komal Bajaj (1):
      soc: qcom: llcc: Add configuration data for Shikra SoC

 drivers/soc/qcom/llcc-qcom.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260630-shikra-edac-b10540d0bea1

Best regards,
--  
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>


