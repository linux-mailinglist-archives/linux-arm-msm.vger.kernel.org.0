Return-Path: <linux-arm-msm+bounces-116699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dO4oLMd0S2oCRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:26:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58270E96C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:26:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e3RYKBiw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FLlKWHzO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5577F352F0B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFF341F7C8;
	Mon,  6 Jul 2026 08:53:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58E4C955C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:53:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328022; cv=none; b=uJYPsk3VXzvX+ziyTeycYy7u6pVMQrbifYioiGCc8XCdxpLpgQDnFpaIw2OeklM7ceklogV0Nq5yLRWwSw2QLvc91BBU4cFrClgoLHBKDFKvuPNAOdng7MXZTcg8PwSD/pMHLxv4xShDdQOnCAa+xMHzSSbziZ8iEsAM0YY8GGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328022; c=relaxed/simple;
	bh=kv9UvjF4OBgXx5N1hdvWktzSDOGEwPg+1mlUNMbBiJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qLQE/AOF+GyU9U0s7a/BEAWOPdqGzyaKAko9VFK/ZSxr2pW1NNQDKMupTuWJLb9Ke2Eq+h/KClHXhXnTpvrEkUa6stae3hfp2QZkRm1eO/0l87kkLmDJ5yVlS9Wu6ulvmh1OJyPxFfWhkTZCt2ginhsmuNM44dXqb6F9/eLRKow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3RYKBiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLlKWHzO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641lbI3616220
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xQyaC8kg27l0TtZIDeouQj
	A00fl5IzZHks8WCZaGeYw=; b=e3RYKBiwj+xC81Ik/Ry7deKZXGPkps9t3ajky5
	mUHlTjWh4meh4OtAmnRBud6iL9Bg9N9I16/PlHzDUNxA1MPuoQaG0ioboHbY8M2x
	UUk+ZoUkPLZuiU03Tl2OnDw5RhoTPDVKTOigAcVpVhH83a1T3vNWNiEHAarh2Yfe
	0PXGPsGDU/8e9KoEawpih236cWzezXKALka8+w9t/1+UJzs5NDLJ6+45Gq3Hv9lu
	iT+iDd2QQ/N20gSrl8pLKDS6nl0lJsgXuZTTVQlXtMnaNk35ad5G7V5bVPP3De+h
	hVoPa7cCZ6X5SfhuV9U9+9LFLzydqowvxuMbc031Dfovpqpw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dcah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:53:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso3752185b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328005; x=1783932805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQyaC8kg27l0TtZIDeouQjA00fl5IzZHks8WCZaGeYw=;
        b=FLlKWHzOmvTUi1J0FniMBguV0DT1YnmrVC+7G+LScxyV6McqJG1QDeBM2Xk6G7TOBX
         DakDzMRE32z5DiXlaYgAvQFt0HA/G5gu4pQ6sRrH5GtspkSWqAkzx9nO3IyIC66QarvX
         gRgMkBo0SDslXhlzQ6Q3siZDxscULvqvA0PokgWv8ALuJ9a4AnVugN+6gnnVzhLZaJ/1
         LcDjfDvo1S99j5D5LMoMuwX0Zsr0c3gxrtg7Z+BzkiHFJGlrOiPs3KRuybDCc0ObOcqy
         k6xtMAbTH5HcF0d/I+lRBmmGqHM+yvumu/Ro1rKoPXnmXD23GwDVQjuNPH6byfbI0Fsf
         M8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328005; x=1783932805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQyaC8kg27l0TtZIDeouQjA00fl5IzZHks8WCZaGeYw=;
        b=cGIzuBTMHIPqfbyLXksW4rb10E9RoKopwvDUHj8CcTvmfbEMYHTMjNK0CAkW+ydc6v
         Vm+nEHi4fvzN1VULLESmu347BVewgC4rneEKe79czu3F7R6ACovPFMsN98HYMOM+Lj3g
         xDsnoRB390axi1N2e6CIAaRCarAps9Bef+ILzE5WGBn68GMwz2eYj8GyyJyF7G8kfwvm
         vnvA7CZjnoicZvqjB6q2hYr+wCx5dqqmLx41G+lyAkxNKqulZlUY0DvyaoI6+Zb4rNpz
         x9ZyR7AyCH8I1ZA42HcocAJo7Wk0X+lCjCamNVIK0ivXLpXen1ZoUG0UlOZanyr/Lp5d
         ca5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJ13dF1dzCnaNoni3woruZxJkzHJJltKv5+wgpawZoA8dKXSr2ImLqojFDjpGuh14VEHAFYIzmLo5mLnPM@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfSQH7bN3C0bl76CyYawMFsHtZ0xRzrmlixpbcBo+SSqGxwYH
	PB5Axt1yVMSy7noPaVp6jtKQojFfrqcobxCOtkk9Hep7Whqr6YL77OzV80oiDg+sHHl5s2eMR//
	UPTmsX019qDDWXfm8ppY8QQVSSkIdCi3TAIizArcK+OMKemAf+zuIVRYZGi7KyrL/0NzS
X-Gm-Gg: AfdE7clAzUXi6DbOp36THyV2HWP12gV+6d0N9BzZYvqpOrtzuP6OHRluqTKzi99gIVl
	mdj8GPFnY/xShCc7BXZpzPwxU0XxbpIQpD1y/coaWJ8N7PP2kgeSwQmSNKrwQyLw03LV59UGukd
	G260Wnjpla3N/H3XgR39tOH3blVZ9rYShCVIRnmNgIk1UkhG7bon+rBanu7YlpdSubbQNYHQy2o
	3ipkUBPzR++mhxdxMRrAVRBvGt2FyM5sb5M+ei2/q65nMRNXZ7AbMU7keqZd71tRHX0Wp7oqRXY
	HQcTEQtQim4a84YcsNd0JW9MjpabrAuYjZx5OmcZNU6RaHpQp/w56nsNxfg1p0Cw7G8AXA19u7U
	CXg6yGK9d+gV6WZQf+oWE0lJgjD4SXjY59CjMPHlA5ZKV
X-Received: by 2002:aa7:8882:0:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-847f6ee37f2mr7547853b3a.35.1783328004720;
        Mon, 06 Jul 2026 01:53:24 -0700 (PDT)
X-Received: by 2002:aa7:8882:0:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-847f6ee37f2mr7547815b3a.35.1783328004019;
        Mon, 06 Jul 2026 01:53:24 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:23 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PM: runtime: Fix sticky -EINVAL after resume
 callback failure
Date: Mon, 06 Jul 2026 14:23:08 +0530
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPRsS2oC/5XOTY4CIRAF4KsY1oMpaBucWc09jCEI1WNp/wk00
 Zi+u7RuXMzGTSUveXlf3VnEQBjZz+rOAmaKNPQlVF8r5o62/0NOvmQmQSpQsuYNXU1M5M43w5H
 6bFtjm4TBjJ0JU5+oQ2NHMo2ldgrIlf7WHmztNh5YWR0DlomnuNu/cpwOJ3RpYZbGkWIawu35U
 hZL76VrkB/rWXDgyntXCQ1COPgdYlxfJtu6oevW5bDliSzfmepzRham1tuD3lpwzUb9w8zz/AD
 BtxpibgEAAA==
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=2169;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=kv9UvjF4OBgXx5N1hdvWktzSDOGEwPg+1mlUNMbBiJY=;
 b=mn+rVKDPni6XEuSuNPFes5p7k/c4PzNztMybdKlLJYgI6PIK5HSfOADRi3ogBmqhDFX9uVZQy
 NrjIgpAcN4eBPNCytloZRClJGZK4bIp80HuDvav7fELIF7FKAdvj7Ol
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX2OvGgslzR6gC
 Sde7xQh9nY4fpUBJE2JTvEM8Y1EJCx6Dr6uhX47+jOCe1OLDkDmuC6aMFSAJoyphiz+7FnZxFyo
 DT8BianUdez9mzhxQwCh6BF+HqhPjaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX9Ic5oXy3djks
 33gu2DTgoTR8NluxvWnQruUThBRfj5BkKLYgUA2hs02EZc/scv654yNfdeDF9S5twcpJNP6EzFn
 a/i+hcUy09SoxyavErtDipsPCvDyrVULw6gkuWOfuxccsq5xBl5RIGKKrEeNHTjAkGFenVgaNFY
 vgMfdsDgeF/hg16sIBv80JQt3wUH6Of9G0j+zfElwsAXHatzjohGkxhZbglava0X2JJoKyAm52d
 tIn1nmKk7WK80xeDl+EheTKjYLt9Qb/bXD8kyXgUGeZq9jpmgwfa5JihwXhZsTARlCg4sm2y4+w
 dXeQmw+lf2Oa5JbaaPnGGROltCY3carykirLT5wwR4Tx4KH4ktiJpBNzaVhxjozQyCu34DRjfMP
 zKrxrM++h4ZfAobqfitI/nqYu9qkOllfFeT0Fpk6mswtny6Xv4wR9CE1zXwPC26J8nYxMNzdLmo
 E2CfSPGo72Le5QTilhw==
X-Proofpoint-GUID: -l_Jml419NVGeh0sb3Isd2UM0wLrHQ0Q
X-Proofpoint-ORIG-GUID: -l_Jml419NVGeh0sb3Isd2UM0wLrHQ0Q
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6d05 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=rhjnKYj_BpsB81YBZ8oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116699-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A58270E96C

When a runtime PM resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  All subsequent rpm_resume() calls
then return -EINVAL immediately at the top of the function, permanently
blocking any future resume attempt — including those triggered by
consumers trying to power up their suppliers — until runtime PM is
explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  The first
patch fixes this in the core by only setting power.runtime_error when a
suspend callback fails, leaving resume failures transient by nature.

The second patch fixes a pre-existing issue in the spi-geni-qcom driver
that this scenario exposed: pm_runtime_get_sync() was called in
spi_geni_init() without checking the return value, so a resume failure
would silently proceed to access hardware registers on a device that was
not powered up.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Moved power.runtime_error assignment from rpm_callback() into
  rpm_suspend() at the fail label, per maintainer feedback.

- Link to v2: https://patch.msgid.link/20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com

Changes in v2:
- Reworked the fix per maintainer feedback: instead of calling
  pm_runtime_set_suspended() in rpm_get_suppliers(), fix the root cause
  in rpm_callback() by not setting power.runtime_error on resume
  callback failures.
- Link to v1: https://patch.msgid.link/20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com

---
Praveen Talari (2):
      PM: runtime: Only set runtime_error on suspend callback failures
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()

 drivers/base/power/runtime.c |  6 +++---
 drivers/spi/spi-geni-qcom.c  | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


