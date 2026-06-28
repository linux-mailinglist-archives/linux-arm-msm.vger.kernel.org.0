Return-Path: <linux-arm-msm+bounces-114798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id duwiJzVnQWpOpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED26D4A51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OZgboEVu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AVLYAdG+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45AE6301D96E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9930D3E5;
	Sun, 28 Jun 2026 18:25:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E321304BDF
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671110; cv=none; b=DHr2B32VhKAV/sMvG+cBMNnBOlcbvaSmUwRXAqKid4pN1XQztVEKSdgFFsxwTnV6cse8IwDWWlM43fpCk+UG2vjpTTTpwgSKgQlDDnUBnYxoqDs2H3fN7pNi+MhcvZ1GNF3noKcBqLGcotjMpSuuFEmwRTiDWoNrEg8mpO5OOrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671110; c=relaxed/simple;
	bh=KiQ1l1ncgJCQ6Ugven9VjtURkvNuqAo8RkZ5Qz1K/48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT4/x8/H0GpDZa4cMpT4q5IBEzRvY77PbRA/3ugxqGntIVaV9WxotW8XIXC5EY8BQ/0lH2XjsUR9XVDEtM8OMic3C4fv4lQfmeKURxdDXPqs8/+1PYTanhOSn7hUfND26kB27aWxA8GIg7UjMLFOs/1qM1xDD/vMa/JXvGXqw2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZgboEVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVLYAdG+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj2rU420317
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=; b=OZgboEVuxMcDN85i
	Y5Ji1oWho8PfMGeIZdEbxjJ5YhcbiRGlx1BYYIadY0gw1ON+y14UyGDxP9tbV0PK
	HQi5qL1YHZkIr7FkYaTYWSeNBj3qEUFlot/67+zbO8oIxIVTMh9LdMwOu9rEElbq
	ikEo/IyDHF8/heK0jFMc6LViM6UUyaTbh8LxyQ/4NTmczhRH5Ry/8SRzS9TH+uVS
	NML3evCLmknzYfoGaM3xtTyHWe9PRWKTydf7LxMGmXTnO6pBar/pudLP74K3sO06
	d1eiWBjT06OBmioiovGWr0jppBEvimC0TBPwiNqkR1O9ObmskJ2f2ljbZFoInebQ
	FD0Keg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734bewm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:25:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso4247470eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671106; x=1783275906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=AVLYAdG+l+hnfyDfPguuNxI4VDW2rxQPFzPFCl7TQdYZvJ+2XYDyCCTCpFEoWh0Iua
         8tkIf7qGl4ntzBz7vULepY+xWE4Q6shfAvc/MmnUvewzxXZ79JnOx4bRsBDk0oeF8nGM
         8+G832F84X8kVU/XBnaoTWSPWL0ay282X7491SsATSfK0ntqvhv4fAUYccq2YxhSb2Cm
         0Vgb12y+6rI+EFETEf1TYcgq9aHb/ZM+9Zcu/K6c5kkmsi81bgqfgoM4fhFVBiI0Dzm2
         Yeql++ys5zSyqFOBax27P9mm61K94yr7AlrEfAbsG2tU4Yo7di08e6CaZv8Wmn0aj0w+
         Zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671106; x=1783275906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=jzoUueaFtXtvcrip3UT4X+ZKtn8xI0e1vl74XrABPtYh+DWnQBQSvFzrJ7vxVoMbK0
         k6jeBu8t+gjuC4DFzE0YjO+kG18hfWvzqAHwLHbVLzDH1iHiRATOwosPFm7zPHkcmqjz
         3lDtDKUg8cSnS65ULmvT8frBrmE+C5cJmvOSeSi9an6L3lp++Dyq2tgDGPMzulgAP/TU
         KKkaAPuaISIr2u1vDH5mmPqp7IZcIzhPFqkelXJ6lqzm1S/+LiBqG6LDAUKnoMb5oasq
         h28ALUcI24scZAFZM0eLSU2vc2OCJp1edf9wUxpsIzHmRB+0cFMvA7R16y7V7TvO/zji
         lMAw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw3LC0nMcGk7hf8OAHsgWHcDQnVqXEtv2LnZu7FjOCFBuX91HCQampvbcr3zMhvn1wsBy6PHqG+UOYZPMF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/a6ixIKWKuYGdfe3A1EvOkIQ8FUcaD9+rEVnsxTy2apjYoAD
	IBtIPtlG+O7CuIZEKz6it9vqVcTt2aVUU3jTHbL8kkCjjZBn6LSWHJT2LFFaiLSXdxMXOsiMePe
	wlmzuG5TAOfz/o4LrMeItFjYW4qHi+C8XMK30eN5cekbVCvM1MN9PQjikwP5nKC4Ikkpo
X-Gm-Gg: AfdE7cnF8zxyA7ZHjcrIMsSdKs9CZ4mWrCt0jXal2gpWgHL2ZrXKM0i02R2hoUzBNVC
	L4ebJYUVKwSmryuzd+u102TfTkTEAbYSMnOrVoY7+FLupqgdIFSB75YZr9DRIk5U9WQ9GT8z7gh
	jIeTs9FlZW8Q8XKkWDxpO2ZsWA/vlmEdMQhT63k9j7soOYPOIg310xPSxqM9JoleKesYU4+ZUqk
	CYDcnNIBMf02h3VUHZYLW+QdnnIRGOKDXNOL+MK8Bz0BFuBFqPMivQFDhLaFkFnvbmKnNGTYjFH
	NaWubHaMfV6o6HRiximD2v9fRyjZfSDBLBUzBTA2pa1SPVRMQpPZ6wHxglV1NvcXeU7M8UeGpmk
	PoOAwgPPhCmqwNXcr+a9DTo9rrvsO/jOSc24=
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605929eec.41.1782671105995;
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605909eec.41.1782671105369;
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:58 +0530
Subject: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=3396;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=esFO/JAL5nI43vIKxxFbdEl/5ME/PRB6OGuZfuTuB+I=;
 b=cVh4g1YdCpiwy7z9vQ1tG/9H+36qvoH8yaJMvnRIf/86r21odJv0LC0eJ6esfGD/OIpgsy8dl
 bSGuHuQPLv5CJuKWNam17yWd+3YB9Sd4PLC20Ocorpubqx9Ndcb9TJy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: m0KQBcTuDeFd1REYo47Hbv4oFzsaXpY3
X-Proofpoint-ORIG-GUID: m0KQBcTuDeFd1REYo47Hbv4oFzsaXpY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX8d2PMSJvLXie
 3eGMHIV++fQKP9/s6Ld12KjqkgmPbQXlKA/lG/Toq2s7zcRtUWONx/FqI0vkeEySwguNhiKavSG
 mnNqqCbF9MJ3GpiPZdXCort+RWF2G2o=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a416703 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX/00O84FkqA+K
 rghm5LQxdyFi65HeozI6hmdtqeQFvIJPuyPAfctX8meh17KBc5Fk3OxKMfq19QGdkRsUN6UnCfi
 YW+lGB5lEFDUN7D4MDR5VymbebdQP8nBSm81GWFXjAt0TdMjmWnHiDJ1PwUMYicDtl8aFo34uor
 UU68JKxTmR2E+ML+GCYFTav50GBX/tV7Ykzh95MWNWdBSNMroqJR5lI/rN6pNkRnOvrjJXSV9O1
 rQ/lWhU4OguNKfOlG9tROousRDJOxve8xFWS54gSeKRBr/Z+9daqer/z2HFndPTYt4H+KMtH8Bj
 pAkvu0PReL9RzpKpk8a6fGr069Vz2u8RTZR5jmOBpIzHT5hNH8UWN2FfVit4AgH3q4QxC8TxiR/
 H2z2zzm/Ulkoo9FAGUt+Bw+aaNtImgnnYM39DwB21I6TzUVsYI0nqrZZQuOgcvVMdCN/OwgtWXF
 dXAJTUTT/6k9nUWxBzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 4BED26D4A51

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 398cb1a4dc86..89cc5dc767e2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -642,6 +642,104 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.51.0


