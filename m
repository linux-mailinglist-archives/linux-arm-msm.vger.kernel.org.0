Return-Path: <linux-arm-msm+bounces-114796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mBo1BApnQWowpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C86D4A1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ilWAAZOf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cjfckiXG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC0CF300DD53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1B330D3F7;
	Sun, 28 Jun 2026 18:24:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873B2E03EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671091; cv=none; b=ARfs0v4s0oMtNFKXdyvkDDRx97Jh9ArPhkf39Hc/5s8bnir4nJusn8nr1vd3bhGREnyq3tgAhm7+zOeqYP7PZ2BEzTCbmEX3UAFT4rpPqcZhaV3a5exZ+eyG1mIToRLSGw9Zpa80533SEAWOnZ58P+9xi0OmBvpNT0qnIuOq8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671091; c=relaxed/simple;
	bh=PzLpTH0pbzRF9OZWwPiqESEYa/drXlg0Ml5pqQ2y7Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXdWY5+5CiUW7b6JDNrenCYRxJL4tmdtqH0VcvrR67iO0yAJey5DbiuWIXEO1hBNjKqIGQiM3dBO9kiz0G571mEJHmSPNyYzbx0hOp/o7m6Gzw22rhKCCW6E20Tt8iYluBPgHESODUOC1R+ORpYTorDGgAeffMVdHayhlxNLwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilWAAZOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjfckiXG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjaJ5457171
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=; b=ilWAAZOfBhBzCFZb
	hQXPU2IHDPhZvPfe1PqWl8u9gK6zCsOvHAI8y+u9c9gtTG4jOQoJ4tpfm3sO6mEo
	xc30qaUKFlAz5+xqmZslKmMQCUEBN3yfMULQvChnGob2uZ8BBZ0EOkfLxgOjKiyZ
	UihblrL4LyigsylWQIX2SYXhLPcdo6Um4+Cu8JXfsZDJUb1CZEfQ+K+w63jU8tQv
	4FP2SNE87g6m7cFdAoQie1TWhOo4jgQN/++eGW+5+AADTpB7Ob2QEonVOFR8XTk5
	RmECGeVhcL+I7bioixGx3FOG3KFhWPR5ZPdbLBa5xwPcBVSmcGn9Mk0g35SJIhwr
	Jsg1bg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u73fmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bccca5620so3792653eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671089; x=1783275889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=cjfckiXG91LmJ338k/0EsZGpwcO11ABr2bpdHRaGnaCA7LiN73BcpQW/NMZAKnHX1K
         qnjLJGz3sS3FZ4rkh2CLj+KSQ2vl/E20BvoMtVCM5JYoM69m3WlnRxKm1iGVZETMsxpe
         8jHCf7jjqbQydhscsUwChvOUyDGD4RpWwfiAPnlyXsk18Uq5IbCZM4h3oCHV/fINWpTH
         wMpSnEkQTreZGXrVIWmhjwq7pe8/lyNDV2PnNutj9NjB4IcTk4kk4sqIKmWSgmyIwRRo
         Ac6Mdqae3iD/0M8HSCbYC4UKMUYONPALWoJMBLt2tLXP1Bi2ldMG0HoIVehLVhHPkIRh
         qUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671089; x=1783275889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=qtxRV1rU87SHdt5gQTLfMpOutFOQxRyB2eyxezK3fvdIcyERv8EBd/IfP4PqSsLSep
         sCqJfsxbZZZnX1XrhgvX+zBuX13Iouw64n0hfhJ1q3b3P+BkstQXcznYn/RGOoPwBZHz
         X37Pa7TkfAWZF6XwCQCq0nWL+jCXX/1MH+tiURITTqO1vjGqDpjXEZ1ZQcJQXxAUxf1B
         fhg7la3WKi+oQRDXVE3nPXC+9E+o7I4KkJ5vi4V0BUzylx+W7fIjJ1P7oQSkemqEW4jP
         Qjt1U+IJZ6d4Xfgypmmyi/Bt499MvpDYcn68LNBXqkdn9F3fiNjx3pBPgwWnOzRN/5Hc
         4oaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGyRolVrYP16PWXT7YbEv/QEa7aeOsL4kX1cTrAScG6fWYHNNJsk5ocDi3WVTc2dBis6/L4CIK7QFVVKmc@vger.kernel.org
X-Gm-Message-State: AOJu0YzAudxw7Pmsbni8pPZpbXza1iUoIbm78owPbVT1OPaWX4Dasp5y
	Knuiuw1rC9I7iFUGzmHeGjbr6gBsiKR3ipf4qG5hZ7bes2qsToYAnXYSDTT5Qys4eD3lnhABPfd
	vRviZstfsf/L4dBSbSmleZbxD9ju0k81mEh9b9D8Kp0mrnBOxZE05Bu5Wifcj7ghTPvAN
X-Gm-Gg: AfdE7cnDalNTv1bS8519Gs0gRmrXG0ZvOXnL0UO3RrrnLhQe8xlHbwRRYk9uvMxxvxR
	g6E4aSnnwGH+ucOc1bgHVds4zpMeIqcXG0t5czzAeiPlVZAPoF7rw2FZTBZd68q+oqpgmjCzG0D
	apvpAUpSFBAT0wzl+Gf0aOloMwiLH86CNbwqn0psr0PgOTo+mhH6EK7ICKT9vkalPETZbs6rlnJ
	r4JJv6jFQu/MRcXww6JMr9Rm/74BJrbh8cqIh7n4UijMd1OJXdeLNIRLx/sTd6SxXzUEXhg78Jd
	1FwOfE3DWVcp7fQtg3EVhaRBU6xvK1Oz9VBhS7WhX0VHk2YoVVJPemCYTW0PhydXteBcOHXHg/T
	rBpNBpjL5Q8Y4PMMU8F1o05dYfG0WzU10+lM=
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159292eec.29.1782671088540;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159282eec.29.1782671088092;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:56 +0530
Subject: [PATCH v3 3/8] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-3-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ab2FJciDIqw7/jxV1YWmBTVegZUhQ2SXaZRIypzuWaI=;
 b=DtAI8ypsLKBEX36oBYU18khootZJoi9iiNXb/fY1RbtwZTn86qyHcgIO51NjZJDUqackd5Lan
 UFQMxskGcxLBwd0K8GC7ROWRU2OWVZkcEAJqKGI7ITqTZV+Phs2p2eS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX03IMpltoqIFE
 ymKbzPDXl/KNJdCOBT5toUcSPtXvRJ/JIoz5ld6LZjqzyZGdOYV4vDry12DXP3GfpPaDnOlCfwD
 FjJFZWlm+TBbVEf4p/lWV0/3YCHXaFs=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a4166f1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: l3slTiIei5-UkwxDvoCLCCueoZJlqg6U
X-Proofpoint-ORIG-GUID: l3slTiIei5-UkwxDvoCLCCueoZJlqg6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXyTyZgHJ3nhhI
 U+PQiUl3SnRF/iSiG+UcZ6wr09vI34GTWDyYGWbge+UoM9lrLnyzzJrIaTZwSCdbSrsXTb5lTCl
 DP+1lWVxCSqT2hAtqa/VRbTUI+XR5kcD0WZa5/iC37ytrkRmHdMfGKstSCTD2lSP365EqXn4bFe
 GXU7Mq9oQoh8TsoR2Bbo0tl83V13564R3E2a8MgzV2SO8UV5EZsSstmArP1T1ntT4OFK8lLz3R8
 Q0yvYqr/ZGr4Cqk7smbKeYr9pEoHwn2IOvNOriPwSDE2rbjplY8reZU5+Xbv+MdMK7/TpPkrdPP
 9QWaPL2acAQ7zztbmaDFFDITqXVzt8v8nBrus+J1zyRsWWUSOQlyi+IG7+3P9Jv1oAIMvE6vaOM
 rEhBA8D6eFgT1Qn2ZQAfg04suvQ/cc6CK8vkiPnZkv8jNS1AIN5rnKyRLIyY2P9hpXeaYkDAXk7
 GLnqBadmCACXKGFp5tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 773C86D4A1B

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.51.0


