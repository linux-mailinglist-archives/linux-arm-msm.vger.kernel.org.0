Return-Path: <linux-arm-msm+bounces-116521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T/LdK38TSmp6+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:19:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC5709695
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IqjMzpkl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iAZjQ0Gj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C613030221E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DED236DA0F;
	Sun,  5 Jul 2026 08:15:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA4355F5F
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:15:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239338; cv=none; b=UUTp08lEw2m3nqUoE97kktbpac7t1Wksp+9sP8YhUqWFdGDWHomfiF9VXXvkFLSh624rXXqi8EB/TKVhihkCAtGMU7ohnQ17W5JMQg+c0gAbBE9obhFLgiLOoqL+CMZy6FF5YIkK7zQ7QrJlfbDN57b2+gCBXdZ9FegULUGpeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239338; c=relaxed/simple;
	bh=aslSU2Lpvqb8dwyaQ8YMkjZ9kUmX9fUts5FVIZUAkTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3yLluEXjy4XHjDB6cWxEFJagJu39ULy4yDj3GDg2W13524CqaZkEZzM//qdwrzDlpjiwZTkat0j+rmXS4XEqxBzSupghtgF6gO/ZASP+kBUUm2MZwHR+spekpwUzN5I/TDVK17Svut+MdtWarMvfRZYqlzwaYNkr0vUwPv3zvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqjMzpkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAZjQ0Gj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655u8EJ702084
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=; b=IqjMzpklbdTVi2Sl
	eJU+QuXMihuCVjTL8+eQIS+B8Sng6SlLTXsHqA/PgfjaZwyo5X6kv9TGVKxPgD5e
	p5bra/LAAZAiQ8zip11R16R2Gdfjln6QhSJEEcdas5k1lPq0OKHOIW1UlXAiPeb9
	U9RnZC+tk0FMue+ypLLWgDKEAZv77mXZu4S1m6PImdnd5E4oQKGCniCNulUEX65p
	/gfgAZuSnuZIgmKTCBYRBwDvdci9K6wCIb1nUDUB9F91CCXT91DvgfGiZNNqd+uE
	WTUhOgcvs9c4CFEtkn2OKChWA0f9f4eZzzPdzENs5kt+4aoB7P86/UzN7pRWazSo
	35rQ7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgj6fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:15:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc8bde6318so3392965ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239335; x=1783844135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=iAZjQ0GjQDNZOlVVBNYKfJJM0L9qgCf8A5bHvLPu7lTeONgDes/Uxrs3vYKgb9f7MA
         4MhPdCF3XlE4Yj1XlN1YTYYDws096P0wfBWZcDgdN4q3xifQbxE/BsucI/EQk5hpZFKY
         5x8YIqxcPp3wZiAkMDWZy/3ZaBoXPxKBfbUJBF1SCKTSSbr6C9yMqBJAPCI5C6IfcClV
         TDJ9EpZcN6MkBssSntmmGmvyui84F7iQNirY1PX/W2QWHxvKahDU5aaICZsylJUz3jQ/
         KDcYVVZNpxP9rZ5maFaFjRg+9Oz9U/sgFm4z0djYPsnQ0eCy058v1KvvffqRbz+aEOQ3
         xsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239335; x=1783844135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=OvFk5/DryoetVT3DVPJdSneCa/0kboPA/mvOEmIXaJkKgYn9q19MEh7cJBK2CLWpJw
         J6nDzVlUvZ8C05BRLC7iwmXH1GMQ1i/YO0J+jvop+YZMZDKB8J3f0683/dDXnToo8Rrc
         IpFpvWXuY+UKUAG+95NSQJ7soD89azQ658E9KiwAnEc/m0Jaeb3yYUSEySyylW/QbfOL
         TGulD0oGoo8M7XoJaamq1eBZyCz1KXG8NWkdViUAkynlDtG2AG4Z6cyX5ZV4CvvV+gpk
         0dly0aZv7Oj5y92AtG9KGDsB1AdGjiEGMdetUVrDuGil79VMu3D3rx++vqsp2gKLt4Ws
         gtRg==
X-Forwarded-Encrypted: i=1; AHgh+RqdIhSEwMbz/3HC5N88p84cvD/ZmLbfrcBYLCRu8gr+CGq2UguT8bwDP4VC+wfzpgV6E90vJCKYRnHVRz5j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8j0JJUv0lyW9vD5RcEhzEsFZMrBVQAVQ3vObt2xKucD31OUM
	C6v+ujkMz3Umdny3BxVrL/I8NB30BRvx4aEQyK5OIg15ixihjxTjLI1PP0H6t+6NXfiwiNzTaCy
	lG8aH894YANXmQse9MPtEBJB+oXDCqdyW6/sDJwtYni5k8teo9Ye29z17MnftTBk8Fv/p
X-Gm-Gg: AfdE7ck5T1aZ8j1gFm5PMUCBWm5mf8yiT0SSUV0WY3XPdTv8MLbuSV4MBqh/L5gQXcO
	qgl3n7VeZC6cTbImNGApBiq/AUbfTyrHmjw2qb/HyI4XT8S/srwQOsj84k9FxUo65WeXwUWgpy6
	OR0H2y+In9bfhpC3hno19Q4QsanTxYt04Fft/emoTIGN9iMOYhuK5/229b9xZJk8ctFy3aslUEN
	FC51ETS9/Q3WeNVRStymsifRKD0VyvzRA69SSFe/wYxNAB/9bq6FAkdBhKRIWPwpgDsGiWnE8Hb
	ldrocTP+u6Ms9RhAITWHdHg8TFPOfuRB/QUzakkWHmIA/pGOznqHmNPdN+GzC4353Zv0Hq7QRWd
	gnY5qOGQJ02oDJ6cYV5Uc2MO1n/W8IlbQ5Ik=
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322745ad.13.1783239335225;
        Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322345ad.13.1783239334746;
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:22 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: eliza: Add GPU nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=5380;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hj4XTXJRwVTJobJx71cynzfN1k4QxqJRtGjaWZFWW2E=;
 b=35fe4KBw3FTsKp/hdtdHgczUQWi7qZh48PQEJWcKngdSxoOThZmRYCaTgT42VxCbWOhn0KKp0
 UEUQorWapK4BW8DnOpoaHEFoo0f1BSJ+my4rJ9t3PMLzdO39S3p3+89
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX9UR6Izvcb+9W
 pVPoxKXVD9y1psMqV1zAsx45afNzd9tWQJXbLNqyPb0dGiWrktEIXyUhvXCnZpo3l0x5GYdB6AH
 oPoBESNt6fgtXl20bMzDMN1Xh+MvtqE=
X-Proofpoint-ORIG-GUID: Xx6WPwpZvv_EJtekwt0o34D3RozT7sU2
X-Proofpoint-GUID: Xx6WPwpZvv_EJtekwt0o34D3RozT7sU2
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a12a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p8LQYYvwJZuHz2WWpfMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX1xHAbLkjVX1G
 IOXinDWLnlNc1FjMtmm6TJ6ghWeLcFWzP64+Y+Y2q7cysLur/mRdr04uvZb9u3GiJJdT89PHtdg
 MMIpiTNLMJhgO2iLfcsLkPYbL0IOQGOBB2Tyk3QqBzQ6YtcBJk+I4Yoexlhv25FWxnQ5JrU6hb+
 OB+F80MjHuMYf29xWxnYKwTE5HwTPSzAbVt8GC+Goh+J8qWCEFVLy2GviuexeX3FP+PvTIpCSAf
 akK67kXiBa8ccMNRe+sJZNQB88xja9UK/Bn2f/+UeJqk2vlXgLvxCxodfDcWjVZZuESOsYzfbC0
 NvNclU/j9h8bwyf6ZBVVBstpdRL5M43pkhk1atWDm+ek1Z4LBIt2AezeUsBcuyq4kehziRE1urO
 o14vn0AxTm7hkZiHlLEW8QEfQWzPcIK/ndRxnOFSOYbdvVL0e2XG5lDKYhRnN6X5RMe0NJSFtbx
 gz7WUjjsWaZmPOulzFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116521-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 55AC5709695

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Add the necessary devicetree nodes to describe this GPU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e5b8377e6c3a..c24c5e9695d5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3742,6 +3742,158 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-43020100", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0x0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-259000000 {
+					opp-hz = /bits/ 64 <259000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <781250>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-515000000 {
+					opp-hz = /bits/ 64 <515000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <5285156>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-645000000 {
+					opp-hz = /bits/ 64 <645000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6671875>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-796000000 {
+					opp-hz = /bits/ 64 <796000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-975000000 {
+					opp-hz = /bits/ 64 <975000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+				};
+
+				opp-1075000000 {
+					opp-hz = /bits/ 64 <1075000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-722.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 0x5 0x0>;
+			qcom,qmp = <&aoss_qmp>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0


