Return-Path: <linux-arm-msm+bounces-118168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/wfLAGUUGqa1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D09737C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fJYtcPeD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kKSpKyo5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39543032CC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAD93B3BE5;
	Fri, 10 Jul 2026 06:39:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD63B19B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665594; cv=none; b=a+WXuFnP/BC91X9YFQeAhlD2H9Ls10NMAyNKqAOReinOKV0MRUH06kEymEU4Oq8QBC27dmXB6v45fFjMlGDbPh7/9/siFOHjadcOjAHD1wnkEMlhrvZ82UBcOMruv7g3saQtCj/DSrvrxi/bSbi7gTXOinouOLXfU2i+XFbGj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665594; c=relaxed/simple;
	bh=mKBVAwprFD3QPKX2iaWQSUvxXdf3vfd/iUrSiDA3sSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WN/jGRxLgS9S8zfUGXEAqYr8t+9fkINKK/pJE3bAguCrk+ZmZLhzrbMojLEvW42n11kmrby1a1Yv7sPUyGUQMeSTmfqwv28WdQV7Jb7RlF3vKxGiJGk0O36v54nIDZlnw2RQMGgJZ6GlL/UUqOYtZwg37yYp5ChVbX9XNKA3nFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJYtcPeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKSpKyo5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n1es3661653
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=; b=fJYtcPeDfSPdozuR
	oeVuQlKinHi51K3y03bh7QMzIPWGqq6xLmxs6AvM3caOHOmlWLNn+Zrnzb7JBSE/
	d3OJyrtsBJfIzYfdrOmRCdWrhif8KFx13Sj2p8FUb00UC2Zi7EyfIL/3ubBu9fBK
	KOY0rz8pSe90kGeAakGjbrxx9wXyyH0i7YTZJz0gQnzuFTNIHBfATGQqY2OvX25H
	gacZU8pm9GVZmbyDBNT36DjzgCNZBhj4ahSXSIY59gHYOn7Bce+hfxkfluF7J7Ib
	RWXskA0Ge+j4b/t9Y4Qhx0g4d/7dWgStInuRUvlqK3NUM7q9TMOgB6IxuJvnKg5q
	p64PqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24tycs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso681416b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665590; x=1784270390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=;
        b=kKSpKyo5x0I4K1IMGNtJ02j5MfoLi+vKZms0keNfr+DDBOogmB4tt7LFZx2kEBgUdH
         eDlkclgKuRVMW1s8LWffcBX85Nv4erqZrwEJ9qQq+3gDGH1fCD4jx1s2C+13tVvnePEr
         havjtdRlUBbJTHqAtB3RetVYsyuYE/P5lLY27JCqScIQhpUtCesP7dWsE5lyCrODTu92
         hlTSFmIsV3vvz6BsH1XskjuLVdMxTHaDdHQmOoxc4iVWK3z8hY+Lp70EmP6l6h8Qr6dM
         WTbn2MxdFeLSvUuZzeq4uIWF2yKMm6P/PpeomPcDSHQqRmaWZClzWLn8XNZ4QZwV/PRw
         2XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665590; x=1784270390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=;
        b=r5aQ71cvtExEEmrNwgytbxlH6d4SH9CUQu9AwuEPN5FfFcwMXZ1083VzxRrhdc5R9D
         72FSZyDNMmd3YkT+Ru0wk8bcn0+4Bjjepi4d2MzP4UgN9pSQZ4pkBWVSl37p2LlUYHYs
         P/SXCCludmjhlo3bwrWci8AgdQY/vLn0vbNZPzMRsm3xlW+cVlt4wazJJjkMEdHTU+Gk
         7hHFCYbTQYRghQQtrApiyziq+GoMsprqsvTz7BgHKa89k1FJKK6TDmELz2vfqhUdtz0r
         pp15fCHkT/gKFy3b/kCLC1JkdyuQY+EhtsJk77VoWoQKQU0A9DDDlPho76qdfEWVGDtt
         H+pQ==
X-Gm-Message-State: AOJu0YwLt0e3gSscbkervukGQQ5HyTa8Ofc54bqPppjG7Ajk1g4zvLRU
	FUGvmbmb5AideD5Lx0TvafqswisE8BQttbhUT00wB7piQQPGgkusmA7fN3R1SvNakWd3rR6U507
	1Wm52Mo506cw4MKkK/H4tupXlpZXahZq1DJftoF/evBrIhgUFtJrSyfR5pDLhv9/L08RF
X-Gm-Gg: AfdE7clHZP8xRtqAFplAre1BfGCoWPQHBaIkJLcffwJ9JAI65xw56zTQ40ci0dLPdRZ
	Bvp2Owg5qmPlHXfrbir3JAyfTk21KiaJTI7NwB47XvE/zZJe5/nyQ9ProQz/A/xx+Gz5gVM7fQK
	O5Q89/H04cNDX2caqObDNmNAGsW6O7HrfkVBNd0MYTnOFD/mSCFFgBaz5dJALUhysrcyuEdJlG8
	uIcJn/yt90S0AWcUCWAn9+lqUsq6wqi6b7q0PkNkNnuTZrysgvUrpsgkUCWfTC+yPe/MmV05LTx
	yveamCHC9R8UfKKMKfbX18KiEDDLsQtOKsZnRFoijuW/rrz09ZZOeNOiR65Cw0xOFqBpIdG2NMG
	YDL7nXnx+2kHaxFqpTv8bo4t6Aj5XZqmHRxj/4kjmek7UO7KeSSyDEW9bGQuw
X-Received: by 2002:a05:6a20:12d0:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c0bce1c020mr12815334637.13.1783665589786;
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c0bce1c020mr12815293637.13.1783665589296;
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:43 -0700
Subject: [PATCH v6 2/4] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-2-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=3076;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=mKBVAwprFD3QPKX2iaWQSUvxXdf3vfd/iUrSiDA3sSg=;
 b=QlgttbScang0KkpbISH0OCmqWGEsp14j1FgL1CIZ2Dj8XptLoiixFVJ2kV8THm2wy8JPe2u08
 +RqGcqnWHkDCZ/le4f49kFuYcoBESlkrmHlP/cJi8XndSOabHGGMa0x
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: fmpVg-oMKXUBWQbgUJfNGGBhsT7tEZDu
X-Proofpoint-ORIG-GUID: fmpVg-oMKXUBWQbgUJfNGGBhsT7tEZDu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX8BN7FkiRxlFF
 Qid/zi+U0sJTmNzzlDexovZmXUqfW4Etq+57swINFYJhheB0dVmzJcVZwOFmtkrU0FjGnNRt0vl
 JUkLsYSX7WNzC+Op12jEH3D9huoL1nI=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a5093b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sPHwxj-pcbBuakODP1gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX9qsUaQit9+rQ
 ud+62stM7n++aJDExtM7lXmekDNHOkKnPBCbe9t1qcLKH8KfzUrJY3Nhxf/7nfS1L/IXtJwp0vR
 8Tydv3Qtk9ztdd6p0rOxIx+x19NojvxBECTvkP+voq3dVIhvQOMKeSZznma62t3KonPF4SkPF5x
 1ufy3ir3mCB76WuoRI056Z3brCCdGIelX4j7vX0ZvSwKE+IvqW08oQOpFxrDAubpMkyT8ynsah8
 JmeE8iFcsaLfP0NKZxQ8WMXhEErf9eU4jwT8XsVvPXTVAVUVp7jC92UX+RXygnIfZa1cxWWIK+b
 38t8gzr8TfU3C7KzihvzkPe89YSxYkU+QzabSJyCapjz6RoJyDy/SONII2ZUHUu4uMWt/s0DxmO
 mz2JWHijTQ8AuEQ8m/K0BNfZsvfx3H7WEengt7LS4TR1t+G5Jnzt1EiPtrimBZltYw5WQxwv0IU
 opqH8hXsrAzf7vmlmBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118168-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:jingyi.wang@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:abelvesa@kernel.org,m:qiang.yu@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53D09737C65

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs running
non-Gunyah based Hypervisors. We currently rely on the iommu property
being present in the remoteproc nodes to detect this.

However, this doesn't cover for cases where the remoteproc does a late
attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
Management Sub-system) that doesn't have an iommu in front of it. In the
former case, any attempt to create new mappings would fail with EEXIST
as they are already setup by the bootloader when the SoCCP is brought
out of reset, and unmapping them to create fresh mappings leads to faults
since SoCCP could have active transactions on the bus. In the latter case,
absence of iommu will be caught by the has_iommu flag, and SHM bridge
creation will be skipped.

Fix this by introducing a needs_tzmem flag which would cover for the
above edge cases by serving as an alternate trigger to the PAS helpers
to ensure that SHM bridge is established.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..cd7273fbcf98 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -61,6 +61,7 @@ struct qcom_pas_data {
 	bool region_assign_shared;
 	int region_assign_vmid;
 	bool early_boot;
+	bool needs_tzmem;
 };
 
 struct qcom_pas {
@@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
@@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },

-- 
2.43.0


