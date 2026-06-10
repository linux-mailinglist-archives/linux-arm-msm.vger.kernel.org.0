Return-Path: <linux-arm-msm+bounces-112360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nnp8FzIqKWpYRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:11:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D0667AD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HE5y9W2n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SUo4IpNt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112360-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112360-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8B33332A06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63F3BBA04;
	Wed, 10 Jun 2026 08:52:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67153B3C1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081553; cv=none; b=debhGmt6UGG+E6p+oDz6zTXMvzz3ThjiTfGMg+mCvDB0lCZ7DTyLvjuBileR8zQxRe6HKDWbqYdSgTrfbpIpGsBl65A4l3nrAfz+s1GiJbCjRa9yiVofzrmkCKni86CcOphECvujxDCpdo59M2p3okjRgy/M7kHmPkHCiZmYLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081553; c=relaxed/simple;
	bh=Jt8WeTmVt4JUIBhcmu9lO3/qyAspgei2ScQVQmUjjbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsDB4h8gtWq6Rr4uyGMKqAcUwq9DhnWEtHHwDLI9KZCbDuox0AzhuE5FsPSK7hd+UW0AS3HIzt6Rv6NqngwujecKeVJY6aLQHsFHA3haXWp8DF4D81zUcL5jV44lnI2sQYwNdHurvBpcS+3hbRRsOanz/Gma5PHGb1kmI/VKy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HE5y9W2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUo4IpNt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnTN530332
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=; b=HE5y9W2nDO3tuHbH
	jq/cMrHyhdghrYiGW8i9yilPHf/YHs1MjNi3rEqmXjqEn1YzAwazfG8fezKQCEKs
	OFveIOZeGBG21A+I7NfnrlwJvKUehJTFf/dxFJOT769ym4CoFnJl3Wo8L8eIi8uK
	jCtrKwLWnePuP3ivIiuxA9JFlMldURb+aoAWehuSy//kD8sIBtjcWoLZPtCJWEPx
	Ym9G6EnKHGjxZI7jG3LiceDNtrZ4/fL375qCHFIJVIiyxFw44EQPaEPf2MHnoYYe
	BVWo1yIblsLrrkBgE7hslCe0xxNnutwGXEy2Qpu84xfW0MlhqMwlSYS5rnwVC6xS
	dTim1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hk11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f4b76so74818275ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081549; x=1781686349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=SUo4IpNtpX1Ds73EFN7H5kreJsGKrMxc+6ikHxTQyKOeENUyB0f61vwUP7Bt5Xz4Kd
         hs+iK9C5bS9qAVUaimfrGXEc9elH5YRYgs38vNNv2wLOSpFzBHFje8MUWm9M0iFnskmy
         0D6tjaYqWGHhFQkNBj4WnGGFmmiPyrvjrLrfPCln9qkTHjJT3JDkfe9WRDLBFd4NWDXQ
         fmX1o2Z9Vfk1o+uugZnGtZMWR7D1bYwWGOucoCnDXNNSpHKcmbrDdr+fLG8Mb67hCCTp
         RqqyVVA8JDUTxqQGulQEqsFyoE0odj+cMVI3TEkZud+fwtdEDkOhOeWfAJ4Rg9KW+o+A
         93GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081549; x=1781686349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=ZMdwKsvEq8oUnjwKFSyViWaLQxpQesfjczi/9DTT6Od7HTk7Owl86l3YysINSEfOQ0
         DnsmMdXV6IeMsnEexWpaIT54Vvf6vvdQnhS+0Q7MNtNaJe1QSaYKogEv3CqIjWgBoAwc
         rFxQSE1hYvm38x61AZQX3hmG/Fl8CEBqESwQRP12BZikhkdkmW2MzoSN2+Mimj6hncQV
         5BIR10riBmkC7AXKNA/ptwmSJ0nxFGPb0wNmUnP71lBzkhSAscNHpqGdOygGRLmHQ4xY
         uerT99vqr2Y1ef3nKI1R+p5nqznXd7wfjmIo3uUxuW2NnhbWgcx02dURl2KlgQIBqWvs
         zjnQ==
X-Forwarded-Encrypted: i=1; AFNElJ990ICXbm52CdKfYKTAzL6ED35oi2PDPre9oH0XdoRFKDMaH+tzf+A4wYfP9aeThn2qvYEFyFVj6y/5g2wm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgCbDE3EvVwNuzxy4v8LlNmnfPk3/9yQYsXFzxXyS8QmJJhBy
	aBMCboXFOFDRc+hVeao5BK8ER+4n6ZqtC2fETGba8kFKAkEdFbHx+YyUoKnUhT6JXpS3C3CSFeQ
	93fokqhaFtpPdioyVVemgCscvgEhjtCqjdcPsI25M3flJVfx6X7VSU7x6qdv2QDgm5cnr
X-Gm-Gg: Acq92OHd6xqBcVEH31OD+Yrkh+ntnvV0wJywyOc6VcY/eMdfGpL7I1LrnTWPuhmgTrH
	quUbq1kweuVEqSdx8LkcHr3h5JIfRwZcZeHAySAMAc7kD9k/sopICriXsbSZHPA1uvmPxkLW0G8
	fyWqdfwIrmMuNkuLP/mr02zWVbrD6U50oKTuOlK+Cq80A+FWwQMQ0X8/eWNmQBZs4VidvVRJah+
	KpaCSqO+A+VVuXjUzdF36lFsHQtk+ESUm54rhBC7kwr0ZCcO342OP3DJhnfrQwoC+B9jLxs9j0N
	uE/334PKaDEfooVT5iA4Te+zwsI8bVT0EWTfG7ed8bNFZcixK1IlMqnNQD86PgWTobu6+ZgMHQ3
	WX1wiZI6d77txLbwrHUw2di4Vb+j4nSk93XZ90KBhgVn/EF9kn85k4nBv213u3IKILWapkLnlE5
	D+1KyCjy6hN0CmhuxETI8E/aah7031ewbghnDm4sbC4UdFfvPwa0MTiXf53Do=
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263574095ad.4.1781081549593;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263573845ad.4.1781081549156;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:28 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:32 +0530
Subject: [PATCH RFC v7 5/9] PM / devfreq: Add new track_remote flag for
 governors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-5-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=3562;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=i8JmP8t0IIDx2YuhJ586pU9J0+L8gn09QqoMvPwEzvk=;
 b=SjTlP3ljJexiSuNiz3k1DP81x2Nsjn02FN9iDLP4o7nw/yM9wDBLOmgzsNAF1zQPVffbuYZwV
 fiaFkBpgVjuBwr4NTgxGOi3wvNISInadO5xNeaHkiIXZp5iXDIa9ywS
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2925ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_Sn8c3TY04LLovrI2V0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX0dWmxYfI78l7
 08kYPUJXS354RwsB5dWEdu/yPi5llm7cy3/KFhH/pBYNHl8+B2e+X4cQWbV4WS1qsl3z2SF42s/
 6nRAuQzZBF97/W6Jv5mnFGv9gS9xErr94W/VF0VnDILKFsTwwAuh5H+dFFBg6AShyR5kOOIQ659
 2yMHNGttnGnY8sKSu6azlvRh52tcTXgH2jUjNhuVAQPjw+yU4nLQz0U2P/X1iws3HfI8GLgv647
 IVcOTXUIHYwE9pTT3ODrP5a9df2j5nGr4IG65zDaqmEX1JjuaERoR5FTSOCVEPzJjxnSZI1osdB
 ybmr2U/BAkVpw5lOcHZ2I9JvdRtbca9VLWU7mwE2lTLa7amMNbMK8tI8pyWAd3J6ng9u+u04X+R
 Hjn+TDJb45HqA3IDAiWlLe+EuEexvA2lsY0iBvSHx4rlhi1S2EasSg2SNwtoT50nfyGR83swzFN
 Nc6lZRpQMlmVV+HB4vA==
X-Proofpoint-ORIG-GUID: azBJdRIWvEyojCHfzYm-81w9gaO8Uoj5
X-Proofpoint-GUID: azBJdRIWvEyojCHfzYm-81w9gaO8Uoj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112360-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,freqs.new:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: A72D0667AD7

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such
cases, the device's frequency is already updated by an external entity and
devfreq only needs to keep its transition statistics and notifier
subscribers in sync.

Add a new DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag. When set,
devfreq_set_target() skips the profile->target() update sequence but still
emits the DEVFREQ_PRECHANGE/DEVFREQ_POSTCHANGE notification pair and the
devfreq_frequency trace event, so transition-notifier subscribers (passive
governor, devfreq cooling, etc.) and tracing observe the remote frequency
change exactly as they would on the normal path, and the transition
statistics are refreshed.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 21 +++++++++++++++++++++
 include/linux/devfreq-governor.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2f27a239e34a..71c6ced9e4e1 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/*
+	 * When a remote agent (e.g. firmware) owns the frequency, skip the
+	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
+	 * pair and the trace event so that transition-notifier subscribers
+	 * (passive governor, devfreq cooling, etc.) and tracing observe the
+	 * frequency change exactly as they would on the normal path.
+	 */
+	if (devfreq->governor &&
+	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
+		freqs.old = devfreq->previous_freq;
+		freqs.new = new_freq;
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
+
+		if (trace_devfreq_frequency_enabled() && new_freq != freqs.old)
+			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
+
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
+		goto update_status;
+	}
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..e4f7b6cb07bc 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -33,9 +33,14 @@
  *   : This governor is never changeable to other governors.
  * - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
  *   : The devfreq won't schedule the work for this governor.
+ * - DEVFREQ_GOV_FLAG_TRACK_REMOTE
+ *   : The governor only tracks frequency changes performed by a remote
+ *     agent (e.g. firmware); devfreq skips the local profile->target()
+ *     call and just keeps its statistics and notifiers in sync.
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes

-- 
2.34.1


